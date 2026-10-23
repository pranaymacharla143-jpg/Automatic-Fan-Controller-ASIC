module fan_controller (clk,
    enable,
    fan_on,
    over_temp,
    pwm_out,
    rst,
    temperature);
 input clk;
 input enable;
 output fan_on;
 output over_temp;
 output pwm_out;
 input rst;
 input [7:0] temperature;

 wire _000_;
 wire _001_;
 wire _002_;
 wire _003_;
 wire _004_;
 wire _005_;
 wire _006_;
 wire _007_;
 wire _008_;
 wire _009_;
 wire _010_;
 wire _011_;
 wire _012_;
 wire _013_;
 wire _014_;
 wire _015_;
 wire _016_;
 wire _017_;
 wire _018_;
 wire _019_;
 wire _020_;
 wire _021_;
 wire _022_;
 wire _023_;
 wire _024_;
 wire _025_;
 wire _026_;
 wire _027_;
 wire _028_;
 wire _029_;
 wire _030_;
 wire _031_;
 wire _032_;
 wire _033_;
 wire _034_;
 wire _035_;
 wire _036_;
 wire _037_;
 wire _038_;
 wire _039_;
 wire _040_;
 wire _041_;
 wire _042_;
 wire _043_;
 wire _044_;
 wire _045_;
 wire _046_;
 wire _047_;
 wire _048_;
 wire _049_;
 wire _050_;
 wire _051_;
 wire _052_;
 wire _053_;
 wire _054_;
 wire _055_;
 wire _056_;
 wire _057_;
 wire _058_;
 wire _059_;
 wire net11;
 wire net12;
 wire \pwm_counter[0] ;
 wire \pwm_counter[1] ;
 wire \pwm_counter[2] ;
 wire \pwm_counter[3] ;
 wire \pwm_counter[4] ;
 wire \pwm_counter[5] ;
 wire \pwm_counter[6] ;
 wire \pwm_counter[7] ;
 wire net13;
 wire \state[0] ;
 wire \state[1] ;
 wire \state[2] ;
 wire \state[3] ;
 wire \state[4] ;
 wire net1;
 wire net2;
 wire net3;
 wire net4;
 wire net5;
 wire net6;
 wire net7;
 wire net8;
 wire net9;
 wire net10;
 wire clknet_0_clk;
 wire clknet_1_0__leaf_clk;
 wire clknet_1_1__leaf_clk;

 sky130_fd_sc_hd__inv_1 _060_ (.A(net2),
    .Y(_020_));
 sky130_fd_sc_hd__inv_1 _061_ (.A(\pwm_counter[0] ),
    .Y(_010_));
 sky130_fd_sc_hd__inv_1 _062_ (.A(\pwm_counter[1] ),
    .Y(_011_));
 sky130_fd_sc_hd__nor2_1 _063_ (.A(net7),
    .B(net6),
    .Y(_023_));
 sky130_fd_sc_hd__nor2_1 _064_ (.A(net9),
    .B(net10),
    .Y(_024_));
 sky130_fd_sc_hd__o31ai_4 _065_ (.A1(net9),
    .A2(net8),
    .A3(net10),
    .B1(net1),
    .Y(_025_));
 sky130_fd_sc_hd__a21oi_1 _066_ (.A1(_023_),
    .A2(_024_),
    .B1(_025_),
    .Y(_001_));
 sky130_fd_sc_hd__or3_1 _067_ (.A(net5),
    .B(net4),
    .C(net3),
    .X(_026_));
 sky130_fd_sc_hd__nand4_1 _068_ (.A(net7),
    .B(net6),
    .C(net1),
    .D(_026_),
    .Y(_027_));
 sky130_fd_sc_hd__nand2_1 _069_ (.A(_025_),
    .B(_027_),
    .Y(_000_));
 sky130_fd_sc_hd__and2_2 _070_ (.A(_025_),
    .B(_027_),
    .X(_015_));
 sky130_fd_sc_hd__a21oi_1 _071_ (.A1(_023_),
    .A2(_024_),
    .B1(_025_),
    .Y(_016_));
 sky130_fd_sc_hd__a21oi_1 _072_ (.A1(net4),
    .A2(net3),
    .B1(net5),
    .Y(_028_));
 sky130_fd_sc_hd__nor2_2 _073_ (.A(_025_),
    .B(_028_),
    .Y(_029_));
 sky130_fd_sc_hd__and4_1 _074_ (.A(net7),
    .B(net5),
    .C(net4),
    .D(net6),
    .X(_030_));
 sky130_fd_sc_hd__mux2i_1 _075_ (.A0(_030_),
    .A1(_023_),
    .S(net8),
    .Y(_031_));
 sky130_fd_sc_hd__nand2_1 _076_ (.A(net1),
    .B(_024_),
    .Y(_032_));
 sky130_fd_sc_hd__nor4_1 _077_ (.A(net7),
    .B(net8),
    .C(net6),
    .D(_026_),
    .Y(_033_));
 sky130_fd_sc_hd__a2111oi_2 _078_ (.A1(_023_),
    .A2(_029_),
    .B1(_031_),
    .C1(_032_),
    .D1(_033_),
    .Y(_017_));
 sky130_fd_sc_hd__or3_2 _079_ (.A(net9),
    .B(net8),
    .C(net10),
    .X(_034_));
 sky130_fd_sc_hd__a211oi_1 _080_ (.A1(net5),
    .A2(net4),
    .B1(_034_),
    .C1(_027_),
    .Y(_018_));
 sky130_fd_sc_hd__and3_2 _081_ (.A(_023_),
    .B(_024_),
    .C(_029_),
    .X(_019_));
 sky130_fd_sc_hd__inv_1 _082_ (.A(net1),
    .Y(_035_));
 sky130_fd_sc_hd__nor2_1 _083_ (.A(\pwm_counter[0] ),
    .B(_035_),
    .Y(_002_));
 sky130_fd_sc_hd__and2_1 _084_ (.A(net1),
    .B(_013_),
    .X(_003_));
 sky130_fd_sc_hd__xnor2_1 _085_ (.A(\pwm_counter[2] ),
    .B(_014_),
    .Y(_036_));
 sky130_fd_sc_hd__nor2_1 _086_ (.A(_035_),
    .B(_036_),
    .Y(_004_));
 sky130_fd_sc_hd__nand3_2 _087_ (.A(\pwm_counter[0] ),
    .B(\pwm_counter[1] ),
    .C(\pwm_counter[2] ),
    .Y(_037_));
 sky130_fd_sc_hd__xor2_1 _088_ (.A(\pwm_counter[3] ),
    .B(_037_),
    .X(_038_));
 sky130_fd_sc_hd__nor2_1 _089_ (.A(_035_),
    .B(_038_),
    .Y(_005_));
 sky130_fd_sc_hd__nand3_1 _090_ (.A(\pwm_counter[2] ),
    .B(_014_),
    .C(\pwm_counter[3] ),
    .Y(_039_));
 sky130_fd_sc_hd__xor2_1 _091_ (.A(\pwm_counter[4] ),
    .B(_039_),
    .X(_040_));
 sky130_fd_sc_hd__nor2_1 _092_ (.A(_035_),
    .B(_040_),
    .Y(_006_));
 sky130_fd_sc_hd__nand2_1 _093_ (.A(\pwm_counter[3] ),
    .B(\pwm_counter[4] ),
    .Y(_041_));
 sky130_fd_sc_hd__o21ai_0 _094_ (.A1(_037_),
    .A2(_041_),
    .B1(\pwm_counter[5] ),
    .Y(_042_));
 sky130_fd_sc_hd__or3_1 _095_ (.A(\pwm_counter[5] ),
    .B(_037_),
    .C(_041_),
    .X(_043_));
 sky130_fd_sc_hd__a21oi_1 _096_ (.A1(_042_),
    .A2(_043_),
    .B1(_035_),
    .Y(_007_));
 sky130_fd_sc_hd__nand2_1 _097_ (.A(\pwm_counter[2] ),
    .B(_014_),
    .Y(_044_));
 sky130_fd_sc_hd__nand3_1 _098_ (.A(\pwm_counter[5] ),
    .B(\pwm_counter[3] ),
    .C(\pwm_counter[4] ),
    .Y(_045_));
 sky130_fd_sc_hd__o21ai_0 _099_ (.A1(_044_),
    .A2(_045_),
    .B1(\pwm_counter[6] ),
    .Y(_046_));
 sky130_fd_sc_hd__or3_1 _100_ (.A(\pwm_counter[6] ),
    .B(_044_),
    .C(_045_),
    .X(_047_));
 sky130_fd_sc_hd__a21oi_1 _101_ (.A1(_046_),
    .A2(_047_),
    .B1(_035_),
    .Y(_008_));
 sky130_fd_sc_hd__nand4_1 _102_ (.A(\pwm_counter[5] ),
    .B(\pwm_counter[3] ),
    .C(\pwm_counter[4] ),
    .D(\pwm_counter[6] ),
    .Y(_048_));
 sky130_fd_sc_hd__o21ai_0 _103_ (.A1(_037_),
    .A2(_048_),
    .B1(\pwm_counter[7] ),
    .Y(_049_));
 sky130_fd_sc_hd__or3_1 _104_ (.A(\pwm_counter[7] ),
    .B(_037_),
    .C(_048_),
    .X(_050_));
 sky130_fd_sc_hd__a21oi_1 _105_ (.A1(_049_),
    .A2(_050_),
    .B1(_035_),
    .Y(_009_));
 sky130_fd_sc_hd__nor2b_1 _106_ (.A(\pwm_counter[2] ),
    .B_N(_012_),
    .Y(_051_));
 sky130_fd_sc_hd__nor2_1 _107_ (.A(\pwm_counter[5] ),
    .B(\pwm_counter[6] ),
    .Y(_052_));
 sky130_fd_sc_hd__o211ai_1 _108_ (.A1(_041_),
    .A2(_051_),
    .B1(_052_),
    .C1(\state[2] ),
    .Y(_053_));
 sky130_fd_sc_hd__o21ba_2 _109_ (.A1(\state[2] ),
    .A2(\state[4] ),
    .B1_N(\pwm_counter[7] ),
    .X(_054_));
 sky130_fd_sc_hd__nor2_1 _110_ (.A(\state[1] ),
    .B(_054_),
    .Y(_055_));
 sky130_fd_sc_hd__nor2b_1 _111_ (.A(\pwm_counter[7] ),
    .B_N(\state[3] ),
    .Y(_056_));
 sky130_fd_sc_hd__and3b_1 _112_ (.A_N(\pwm_counter[7] ),
    .B(\state[3] ),
    .C(_012_),
    .X(_057_));
 sky130_fd_sc_hd__nand3_1 _113_ (.A(\pwm_counter[2] ),
    .B(\pwm_counter[3] ),
    .C(\pwm_counter[6] ),
    .Y(_058_));
 sky130_fd_sc_hd__o21ai_0 _114_ (.A1(\pwm_counter[5] ),
    .A2(\pwm_counter[4] ),
    .B1(\pwm_counter[6] ),
    .Y(_021_));
 sky130_fd_sc_hd__o221ai_1 _115_ (.A1(\state[4] ),
    .A2(_056_),
    .B1(_057_),
    .B2(_058_),
    .C1(_021_),
    .Y(_022_));
 sky130_fd_sc_hd__a311oi_1 _116_ (.A1(_053_),
    .A2(_055_),
    .A3(_022_),
    .B1(\state[0] ),
    .C1(_035_),
    .Y(net13));
 sky130_fd_sc_hd__ha_1 _117_ (.A(_010_),
    .B(_011_),
    .COUT(_012_),
    .SUM(_013_));
 sky130_fd_sc_hd__ha_1 _118_ (.A(\pwm_counter[0] ),
    .B(\pwm_counter[1] ),
    .COUT(_014_),
    .SUM(_059_));
 sky130_fd_sc_hd__dfrtp_1 \fan_on$_DFF_PP0_  (.D(_000_),
    .Q(net11),
    .RESET_B(_020_),
    .CLK(clknet_1_0__leaf_clk));
 sky130_fd_sc_hd__dfrtp_1 \over_temp$_DFF_PP0_  (.D(_001_),
    .Q(net12),
    .RESET_B(_020_),
    .CLK(clknet_1_0__leaf_clk));
 sky130_fd_sc_hd__dfrtp_1 \pwm_counter[0]$_DFF_PP0_  (.D(_002_),
    .Q(\pwm_counter[0] ),
    .RESET_B(_020_),
    .CLK(clknet_1_0__leaf_clk));
 sky130_fd_sc_hd__dfrtp_1 \pwm_counter[1]$_DFF_PP0_  (.D(_003_),
    .Q(\pwm_counter[1] ),
    .RESET_B(_020_),
    .CLK(clknet_1_0__leaf_clk));
 sky130_fd_sc_hd__dfrtp_1 \pwm_counter[2]$_DFF_PP0_  (.D(_004_),
    .Q(\pwm_counter[2] ),
    .RESET_B(_020_),
    .CLK(clknet_1_0__leaf_clk));
 sky130_fd_sc_hd__dfrtp_1 \pwm_counter[3]$_DFF_PP0_  (.D(_005_),
    .Q(\pwm_counter[3] ),
    .RESET_B(_020_),
    .CLK(clknet_1_1__leaf_clk));
 sky130_fd_sc_hd__dfrtp_1 \pwm_counter[4]$_DFF_PP0_  (.D(_006_),
    .Q(\pwm_counter[4] ),
    .RESET_B(_020_),
    .CLK(clknet_1_1__leaf_clk));
 sky130_fd_sc_hd__dfrtp_1 \pwm_counter[5]$_DFF_PP0_  (.D(_007_),
    .Q(\pwm_counter[5] ),
    .RESET_B(_020_),
    .CLK(clknet_1_1__leaf_clk));
 sky130_fd_sc_hd__dfrtp_1 \pwm_counter[6]$_DFF_PP0_  (.D(_008_),
    .Q(\pwm_counter[6] ),
    .RESET_B(_020_),
    .CLK(clknet_1_1__leaf_clk));
 sky130_fd_sc_hd__dfrtp_1 \pwm_counter[7]$_DFF_PP0_  (.D(_009_),
    .Q(\pwm_counter[7] ),
    .RESET_B(_020_),
    .CLK(clknet_1_1__leaf_clk));
 sky130_fd_sc_hd__dfstp_2 \state[0]$_DFF_PP1_  (.D(_015_),
    .Q(\state[0] ),
    .SET_B(_020_),
    .CLK(clknet_1_0__leaf_clk));
 sky130_fd_sc_hd__dfrtp_1 \state[1]$_DFF_PP0_  (.D(_016_),
    .Q(\state[1] ),
    .RESET_B(_020_),
    .CLK(clknet_1_0__leaf_clk));
 sky130_fd_sc_hd__dfrtp_1 \state[2]$_DFF_PP0_  (.D(_017_),
    .Q(\state[2] ),
    .RESET_B(_020_),
    .CLK(clknet_1_0__leaf_clk));
 sky130_fd_sc_hd__dfrtp_1 \state[3]$_DFF_PP0_  (.D(_018_),
    .Q(\state[3] ),
    .RESET_B(_020_),
    .CLK(clknet_1_0__leaf_clk));
 sky130_fd_sc_hd__dfrtp_1 \state[4]$_DFF_PP0_  (.D(_019_),
    .Q(\state[4] ),
    .RESET_B(_020_),
    .CLK(clknet_1_0__leaf_clk));
 sky130_fd_sc_hd__clkdlybuf4s50_1 input1 (.A(enable),
    .X(net1));
 sky130_fd_sc_hd__clkdlybuf4s50_1 input2 (.A(rst),
    .X(net2));
 sky130_fd_sc_hd__clkdlybuf4s50_1 input3 (.A(temperature[0]),
    .X(net3));
 sky130_fd_sc_hd__clkdlybuf4s50_1 input4 (.A(temperature[1]),
    .X(net4));
 sky130_fd_sc_hd__clkdlybuf4s50_1 input5 (.A(temperature[2]),
    .X(net5));
 sky130_fd_sc_hd__clkdlybuf4s50_1 input6 (.A(temperature[3]),
    .X(net6));
 sky130_fd_sc_hd__clkdlybuf4s50_1 input7 (.A(temperature[4]),
    .X(net7));
 sky130_fd_sc_hd__clkdlybuf4s50_1 input8 (.A(temperature[5]),
    .X(net8));
 sky130_fd_sc_hd__clkdlybuf4s50_1 input9 (.A(temperature[6]),
    .X(net9));
 sky130_fd_sc_hd__clkdlybuf4s50_1 input10 (.A(temperature[7]),
    .X(net10));
 sky130_fd_sc_hd__clkdlybuf4s50_1 output11 (.A(net11),
    .X(fan_on));
 sky130_fd_sc_hd__clkdlybuf4s50_1 output12 (.A(net12),
    .X(over_temp));
 sky130_fd_sc_hd__clkdlybuf4s50_1 output13 (.A(net13),
    .X(pwm_out));
 sky130_fd_sc_hd__clkbuf_4 clkbuf_0_clk (.A(clk),
    .X(clknet_0_clk));
 sky130_fd_sc_hd__clkbuf_4 clkbuf_1_0__f_clk (.A(clknet_0_clk),
    .X(clknet_1_0__leaf_clk));
 sky130_fd_sc_hd__clkbuf_4 clkbuf_1_1__f_clk (.A(clknet_0_clk),
    .X(clknet_1_1__leaf_clk));
 sky130_fd_sc_hd__clkinvlp_4 clkload0 (.A(clknet_1_1__leaf_clk));
endmodule
