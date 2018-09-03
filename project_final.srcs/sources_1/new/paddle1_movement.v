//  ===================================================================================
//  								  Define Module, Inputs and Outputs
//						* Calculate paddle1 movement based on the accelerometer1 *
//  ===================================================================================
module paddle1_movement #(parameter X = 400,  // default X & Y
											   Y = 580 )(
		frame, 
		clk,
		ACL_IN,
		rst,
		win_rst,
		paddle_x,
		paddle_y
);

// ====================================================================================
// 										Port Declarations
// ====================================================================================
	input 		  frame;
	input			  clk;
	input [9:0]   ACL_IN;
	input 		  rst;
	input 		  win_rst;
	output [10:0] paddle_x;
	output [9:0]  paddle_y;

// ====================================================================================
// 								Parameters, Registers, and Wires
// ====================================================================================
	reg [10:0] 	  paddle_x;
	reg [1:0] 	  v_y;

//  ===================================================================================
// 							  				Implementation
//  ===================================================================================

		assign paddle_y = Y;
	 	 
		always @ ( posedge clk) 
		begin
			if ( rst == 1 || win_rst == 1 ) 
			begin
				paddle_x <= X;
				v_y <= 1; // velocity on y axis
			end
			else
			begin
			      if ( frame == 1 ) 
                  begin
				   paddle_x <= paddle_x;
					
					if  ((ACL_IN[8:0] >= 0 && ACL_IN[8:0] <= 175) && paddle_x > 2)
						paddle_x <= paddle_x - v_y;
								
					if  ((ACL_IN[8:0] > 175 && ACL_IN[8:0] <= 250) && paddle_x > 3)
						paddle_x <= paddle_x - v_y - v_y;
									 
					if  ((ACL_IN[8:0] > 250 && ACL_IN[8:0] <=375) && paddle_x < 759)
						paddle_x <= paddle_x + v_y + v_y;
									 
					if ((ACL_IN[8:0] > 375 && ACL_IN[8:0] <= 550) && paddle_x < 769)
						paddle_x <= paddle_x + v_y;		
				   end		
			end
		end
								  
endmodule
