#!/usr/bin/env bash
set -u

FLOW="/home/vscode/Desktop/OpenROAD-flow-scripts/flow"
RESULT="$FLOW/results/sky130hd/automatic_fan_controller/base"
TIMING="/home/vscode/Desktop/skywater-pdk-libs-sky130_fd_sc_hd/timing"
REPORT="$PWD/STA_Corner_Summary.txt"

if [ ! -f "$RESULT/6_final.odb" ] || [ ! -f "$RESULT/6_final.sdc" ]; then
  echo "ERROR: Final ODB or SDC is missing."
  exit 1
fi

if [ ! -d "$TIMING" ]; then
  echo "ERROR: Timing library directory not found: $TIMING"
  exit 1
fi

mapfile -t LIBS < <(find "$TIMING" -maxdepth 1 -name '*.lib' -type f | sort)

if [ "${#LIBS[@]}" -eq 0 ]; then
  echo "ERROR: No Liberty files found."
  exit 1
fi

{
  echo "Automatic Fan Controller - Multi-Library STA"
  echo "Database: $RESULT/6_final.odb"
  echo "Constraints: $RESULT/6_final.sdc"
  echo "Libraries found: ${#LIBS[@]}"
  echo "Parasitics: estimated; no SPEF was identified"
  echo
  echo "Library | Setup WNS | Setup TNS | Hold WNS | Hold TNS | Status"
  echo "All timing values are in ns; see individual logs for details."
  echo
} > "$REPORT"

for LIB in "${LIBS[@]}"; do
  NAME="$(basename "$LIB")"
  SAFE="${NAME%.lib}"
  LOG="/tmp/${SAFE}_sta.log"
  TCL="/tmp/${SAFE}_sta.tcl"

  echo "Evaluating $NAME"

  cat > "$TCL" <<TCL_EOF
read_lef $FLOW/platforms/sky130hd/lef/sky130_fd_sc_hd_merged.lef
read_liberty $LIB
read_db $RESULT/6_final.odb
read_sdc $RESULT/6_final.sdc
source $FLOW/platforms/sky130hd/setRC.tcl
estimate_parasitics -placement
report_checks -path_delay max
report_checks -path_delay min
report_worst_slack -max
report_worst_slack -min
report_tns
exit
TCL_EOF

  if openroad -exit "$TCL" > "$LOG" 2>&1; then
    printf '%s | See %s | See %s | See %s | See %s | REVIEW LOG\n' \
      "$NAME" "$LOG" "$LOG" "$LOG" "$LOG" >> "$REPORT"
    echo "  Finished. Log: $LOG"
  else
    printf '%s | - | - | - | - | ERROR\n' "$NAME" >> "$REPORT"
    echo "  FAILED. Check: $LOG"
    tail -n 15 "$LOG"
  fi
done

echo
echo "Summary file: $REPORT"
echo "Libraries processed: ${#LIBS[@]}"
