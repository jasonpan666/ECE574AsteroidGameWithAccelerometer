
//===================================================================================
//  							  Define Module, Inputs and Outputs
//===================================================================================
module top_logic(  
		clk,
		rst,
		FRZ,
		SDI1,
//		SDI2,
		vsync,
		hsync,
		VGA_R,
		VGA_G,
		VGA_B,
		SS1,
		SDO1,
		SCLK1,
//		SS2,
//		SDO2,
//		SCLK2
        rst_n,
        scl,
        sda,
        led,
        led1,
        button,
        rx,
        tx,
        sw,
        seven_seg,
        an
);

// ====================================================================================
// 										Port Declarations
// ====================================================================================	
	input	     clk;
    input 		 rst;
	input 		 FRZ;
	input 		 SDI1;
//	input 		 SDI2;
	output 		 vsync;
	output 		 hsync;
	output [2:0] VGA_R;
	output [2:0] VGA_G;
	output [1:0] VGA_B;
	output 		 SS1;
	output 		 SDO1;
	output 		 SCLK1;
//	output 		 SS2;
//	output 		 SDO2;
//	output 		 SCLK2;
     input       rst_n;
     output      scl;
     inout       sda;
     output [7:0] led;
     output [7:0] led1;		
     input [2:0] button;
     input  rx;
     output tx;
     input [3:0] sw;
     output [6:0] seven_seg;
     output [7:0]  an;

// ====================================================================================
// 								Parameters, Register, and Wires
// ====================================================================================
	wire		clk_acl;
	wire [9:0] 	yAxis1;
//	wire [9:0] 	yAxis2;
    reg  [7:0] an;

//  ===================================================================================
// 							  				Implementation
//  ===================================================================================

     always @(*)
     begin
        case(sw)
        4'b1000:
             an = 8'b01110111;
        4'b0100:
             an <= 8'b10111011;
        4'b0010:
             an = 8'b11011101;
        4'b0001:
             an = 8'b11101110;                            
        default:
             an = 8'b11111111;         
        endcase
     end

		//-------------------------------------------------------------------------
		//	 								Generate the vga output
		//-------------------------------------------------------------------------
		xvga VGA( 
			 .clk(clk),
			 .rst(rst),
			 .frz(FRZ),
			 .vsync(vsync),
			 .hsync(hsync),
			 .ACL1(yAxis1),
//			 .ACL2(yAxis2),
			 .VGA_R(VGA_R),
			 .VGA_G(VGA_G),
			 .VGA_B(VGA_B),
			 .button(button)
		);	

		//-------------------------------------------------------------------------
		//	 					Generate 5hz clock for the accelerometers
		//-------------------------------------------------------------------------
		ClkDiv_5Hz acl_clk(
			 .CLK(clk),
			 .RST(rst),
			 .CLKOUT(clk_acl)
		);

		//-------------------------------------------------------------------------
		//	 								Control Accelerometer 1
		//-------------------------------------------------------------------------
		SPIcomponent SPI1(
			 .CLK(clk),
			 .RST(rst),
			 .START(clk_acl),
			 .SDI(SDI1),
			 .SDO(SDO1),
			 .SCLK(SCLK1),
			 .SS(SS1),
			 .yAxis(yAxis1)
		);

		//-------------------------------------------------------------------------
		//	 								Control Accelerometer 2
		//-------------------------------------------------------------------------
//		SPIcomponent SPI2(
//			 .CLK(clk),
//			 .RST(rst),
//			 .START(clk_acl),
//			 .SDI(SDI2),
//			 .SDO(SDO2),
//			 .SCLK(SCLK2),
//			 .SS(SS2),
//			 .yAxis(yAxis2)
//		);
         temp_sensor(
			    .clk(clk),
			    .rst_n(rst_n),
			    .scl(scl),
			    .sda(sda),
			    .read_data(led),
			    .read_data1(led1)
						);
		 microblaze_mcs_0 MCS (
                          .Clk(clk),                  // input wire Clk
                          .Reset(rst),              // input wire Reset
                          .UART_rxd(rx),        // input wire UART_rxd
                          .UART_txd(tx),        // output wire UART_txd
                          .GPIO1_tri_i(sw),  // input wire [3 : 0] GPIO1_tri_i
                          .GPIO1_tri_o(seven_seg)  // output wire [6 : 0] GPIO1_tri_o
                        );
		
endmodule
