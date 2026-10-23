set design_dir "/home/vscode/Desktop/OpenROAD-flow-scripts/flow"
set result_dir "$design_dir/results/sky130hd/automatic_fan_controller/base"
set timing_dir "/home/vscode/Desktop/skywater-pdk-libs-sky130_fd_sc_hd/timing"
set report_file "/workspaces/automatic-fan-controller-asic/STA_Corner_Summary.txt"

set libraries [lsort [glob -nocomplain "$timing_dir/*.lib"]]
set out [open $report_file w]

puts $out "Automatic Fan Controller - Multi-Library STA"
puts $out "Database: $result_dir/6_final.odb"
puts $out "Constraints: $result_dir/6_final.sdc"
puts $out "Note: Each library variant is evaluated separately."
puts $out "Parasitics: No SPEF found; RC estimates must be identified as estimates."
puts $out ""
puts $out "Library | Setup WNS (ns) | Setup TNS (ns) | Hold WNS (ns) | Hold TNS (ns) | Status"

close $out

foreach lib $libraries {
    set corner [file tail $lib]
    puts "Evaluating $corner"

    # Run each library in a fresh OpenROAD process.
    set log_file "/tmp/sta_[file rootname $corner].log"
    set script_file "/tmp/sta_[file rootname $corner].tcl"

    set sf [open $script_file w]
    puts $sf "read_lef $design_dir/platforms/sky130hd/lef/sky130_fd_sc_hd_merged.lef"
    puts $sf "read_liberty $lib"
    puts $sf "read_db $result_dir/6_final.odb"
    puts $sf "read_sdc $result_dir/6_final.sdc"
    puts $sf "source $design_dir/platforms/sky130hd/setRC.tcl"
    puts $sf "estimate_parasitics -placement"
    puts $sf "report_checks -path_delay max"
    puts $sf "report_checks -path_delay min"
    puts $sf "report_worst_slack -max"
    puts $sf "report_worst_slack -min"
    puts $sf "report_tns"
    puts $sf "exit"
    close $sf

    set command "openroad -exit $script_file"
    set rc [catch {exec sh -c "$command > $log_file 2>&1"} err]

    set lf [open $log_file r]
    set log_text [read $lf]
    close $lf

    set out [open $report_file a]
    puts $out "$corner | See $log_file | See $log_file | See $log_file | See $log_file | [expr {$rc == 0 ? "CHECK LOG" : "ERROR"}]"
    close $out

    if {$rc != 0} {
        puts "ERROR: $corner - inspect $log_file"
    }
}

puts "Summary created: $report_file"
exit
