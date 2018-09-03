//Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Command: generate_target bd_fc5c_wrapper.bd
//Design : bd_fc5c_wrapper
//Purpose: IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module bd_fc5c_wrapper
   (Clk,
    GPIO1_tri_i,
    GPIO1_tri_o,
    Reset,
    UART_rxd,
    UART_txd);
  input Clk;
  input [3:0]GPIO1_tri_i;
  output [6:0]GPIO1_tri_o;
  input Reset;
  input UART_rxd;
  output UART_txd;

  wire Clk;
  wire [3:0]GPIO1_tri_i;
  wire [6:0]GPIO1_tri_o;
  wire Reset;
  wire UART_rxd;
  wire UART_txd;

  bd_fc5c bd_fc5c_i
       (.Clk(Clk),
        .GPIO1_tri_i(GPIO1_tri_i),
        .GPIO1_tri_o(GPIO1_tri_o),
        .Reset(Reset),
        .UART_rxd(UART_rxd),
        .UART_txd(UART_txd));
endmodule
