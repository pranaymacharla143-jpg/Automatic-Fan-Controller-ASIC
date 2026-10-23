# Automatic Fan Controller ASIC

**Verilog RTL | SKY130HD | OpenROAD | Physical Design | 16-Corner Static Timing Analysis**

## 1. Project Overview

The Automatic Fan Controller ASIC is an RTL-based digital controller implemented in Verilog HDL. The design uses a temperature input to control fan operation and PWM output according to the behavior defined in the RTL and testbench.

The project demonstrates functional simulation and an ASIC implementation workflow using the SKY130HD standard-cell platform and OpenROAD. It includes selected implementation reports, final physical-design outputs, and a 16-corner static timing analysis (STA) study.

### Project Highlights

- Verilog RTL implementation of an automatic fan controller.
- Icarus Verilog functional simulation and GTKWave waveform evidence.
- SKY130HD standard-cell technology.
- OpenROAD physical-design flow evidence.
- Floorplanning, placement, clock-tree synthesis, routing, and final layout evidence.
- Selected final netlist, DEF, SDC, and GDS outputs.
- 16-corner STA scripts and summary reports.

## 2. Problem Statement

A conventional fan controller may use a fixed threshold or a separate controller circuit. This project explores how fan-control logic and PWM behavior can be described in Verilog and implemented as a standard-cell ASIC design. The design is evaluated through simulation, physical-design reports, and multi-corner timing analysis.

## 3. Project Objectives

1. Implement fan-control logic using Verilog HDL.
2. Verify temperature-based fan and PWM behavior using a testbench.
3. Inspect the simulation waveform.
4. Synthesize and implement the design using the SKY130HD platform.
5. Collect reports from key OpenROAD stages.
6. Generate final physical-design outputs.
7. Evaluate timing across 16 library corners.
8. Document limitations and timing issues transparently.

## 4. Design Technology and Tools

| Parameter | Description |
|---|---|
| Project | Automatic Fan Controller ASIC |
| HDL | Verilog |
| Standard-cell platform | SKY130HD |
| RTL simulation | Icarus Verilog |
| Waveform viewer | GTKWave |
| Physical-design flow | OpenROAD-flow-scripts |
| Timing analysis | Static Timing Analysis (STA) |
| Physical output | GDSII |
| Clock constraint | See `Constraints/constraint.sdc` |

## 5. Repository Structure

```text
Automatic-Fan-Controller-ASIC/
├── README.md
├── .gitignore
├── RTL/
│   ├── fan_controller.v
│   └── fan_controller_tb.v
├── Constraints/
│   └── constraint.sdc
├── STA_Reports/
│   ├── run_16_corner_sta.sh
│   ├── run_16_corner_sta.tcl
│   ├── STA_16_Corner_Summary.txt
│   ├── STA_Corner_Summary.csv
│   └── multi-corner logs
├── OpenROAD/
│   ├── selected implementation reports
│   ├── detailed_route.log
│   └── configuration files
├── Final_Outputs/
│   ├── 6_final.v
│   ├── 6_final.def
│   ├── 6_final.sdc
│   └── 6_1_merged.gds
└── Screenshots/
    └── selected simulation and implementation evidence
```

The package intentionally omits repeated intermediate OpenROAD databases and duplicated logs. Keep the original archive as the complete run backup.

## 6. Functional Verification

From the repository root, run:

```bash
iverilog -o /tmp/fan_controller_sim RTL/fan_controller.v RTL/fan_controller_tb.v
vvp /tmp/fan_controller_sim
```

The recorded simulation output reported **18 checks passed**. Refer to the testbench and simulation evidence for the exact scenarios exercised.

## 7. ASIC Implementation Flow

The physical-design evidence covers synthesis, floorplanning, placement, clock-tree synthesis, global routing, detailed routing, and final layout generation. Selected reports are in `OpenROAD/`, while final artifacts are in `Final_Outputs/`.

The detailed-routing log for the recorded run reports zero detailed-route violations and zero antenna, net, and pin violations. This is a result for that specific run, not a claim of complete manufacturing sign-off.

## 8. Multi-Corner Static Timing Analysis

The repository contains scripts and summaries for 16 SKY130HD library corners. Different process, voltage, and temperature conditions can change path delay and timing margin.

**Timing status:** The supplied 16-corner summary marks multiple corners `REVIEW`, and some reported slack values are negative. In particular, the summary includes a worst minimum slack of **-2.53 ns** and a worst slack-max value of **-0.32 ns** in the `ss_n40C_1v28` corner. These reports must not be described as fully timing-clean. Setup, hold, and reset recovery/removal checks should be reviewed separately before claiming sign-off.

## 9. Reproducibility Notes

The STA scripts may rely on an installed OpenROAD-flow-scripts checkout and SKY130HD libraries. Those external dependencies are not bundled in this repository. Update paths as needed for your environment and preserve the SDC and library conditions when comparing results.

## 10. Limitations and Future Work

- Review the reported setup, hold, and reset removal violations.
- Repeat STA with verified libraries, parasitics, and constraints.
- Record tool versions and the exact implementation configuration.
- Re-run the complete flow after any approved RTL or physical-design change.
- Perform the appropriate sign-off checks before making fabrication-readiness claims.

## 11. License

No license is specified. Add a license only if you have the rights to grant its terms.
