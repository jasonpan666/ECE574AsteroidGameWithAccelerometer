// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.3 (win64) Build 2018833 Wed Oct  4 19:58:22 MDT 2017
// Date        : Tue Dec 12 20:11:53 2017
// Host        : ZhenyuPan running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               D:/Study/USA_Graduate/WPI_Graduate_3/17_Fall_Courses/project_final/project_final.srcs/sources_1/ip/microblaze_mcs_0/microblaze_mcs_0_stub.v
// Design      : microblaze_mcs_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "bd_fc5c,Vivado 2017.3" *)
module microblaze_mcs_0(Clk, Reset, UART_rxd, UART_txd, GPIO1_tri_i, 
  GPIO1_tri_o)
/* synthesis syn_black_box black_box_pad_pin="Clk,Reset,UART_rxd,UART_txd,GPIO1_tri_i[3:0],GPIO1_tri_o[6:0]" */;
  input Clk;
  input Reset;
  input UART_rxd;
  output UART_txd;
  input [3:0]GPIO1_tri_i;
  output [6:0]GPIO1_tri_o;
endmodule
