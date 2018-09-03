//  ===================================================================================
//  								  Define Module, Inputs and Outputs
//											* Calculate ball movement *
//  ===================================================================================
module ball_movement #(parameter X = 200,  // default X & Y
											Y = 500 )(
		frame, 
		clk,
		rst,
		paddle1,
//		paddle2,
		ball_x,
		ball_y,
		win_rst1
//		win_rst2
);

// ====================================================================================
// 										Port Declarations
// ====================================================================================
	input 		  frame;
	input 		  clk;
	input 		  rst;
	input [9:0]   paddle1;
//	input [9:0]   paddle2;
	output [10:0] ball_x;
	output [9:0]  ball_y;
	output 		  win_rst1;
//	output 		  win_rst2;

// ====================================================================================
// 								Parameters, Register, and Wires
// ====================================================================================
	reg [10:0] 	  ball_x;
	reg [9:0] 	  ball_y;
	reg [1:0] 	  v_x;
	reg [1:0] 	  v_y;
	reg 			  sw_y;
	reg 			  sw_x;
	reg 			  win_rst1;
//	reg 			  win_rst2;

//  ===================================================================================
// 							  				Implementation
//  ===================================================================================	
	
		always @  ( posedge clk) 
		begin
			if ( rst == 1 ) 
			begin
				ball_y <= Y;
				ball_x <= X;
				v_x <= 1; // initial velocity on x axis
				v_y <= 1; // initial velocity on y axis
				sw_y <= 0;
				sw_x <= 0;
				win_rst1 <= 0;
//				win_rst2 <= 0;
			end
			else 
			begin
				if ( frame == 1 && win_rst1 == 0) 
				
				begin 
                          
                                    if ( ball_y == 2 )
                                        sw_y <= 1;
                                    else if ( ball_y == 566 )
                                        win_rst1 <= 1;
                                    else
                                        sw_y <= sw_y;
                                        
                                	if ( ball_x == 2 )
                                           sw_x <= 1;
                                    else if ( ball_x == 766 )
                                           sw_x <= 0;
                                    else
                                          sw_x <= sw_x;     
                                
                                    /* If you touch the borders reset game*/
                
                                    /* If the ball hits the walls or the paddles change the trajectory */
                                    if ( sw_x == 1 )
                                        ball_x <= ball_x + v_x;
                                    else 
                                        ball_x <= ball_x - v_x;
                                            
                                    if ( sw_y == 1 )
                                        ball_y <= ball_y + v_y;
                                    else 
                                        ball_y <= ball_y - v_y;
                                        
                                    
                                 //   if ( ((ball_x <= paddle1 + 128) && ( (ball_x >= paddle1 - 32) || ( paddle1 <= 32 && ball_x <= 128 ) )) && ball_y == 580 )
                                    //    win_rst1 <= 1;
                                              
                                    // Find collision between ball and the paddles
                                    //if ( ((ball_y <= paddle1 + 128) && ( (ball_y >= paddle1 - 32) || ( paddle1 <= 32 && ball_y <= 128 ) )) && ball_x == 18 )
                                   //     sw_x <= 1;
                                    end            

				
				
				else if ( win_rst1 == 1 ) 
				begin
					/* Reset ball */
					ball_y <= Y;
					ball_x <= X;
				    sw_y <= 0;
				    sw_x <= 0;
					win_rst1 <= 0;
//					win_rst2 <= 0;
				end
			end
		end

endmodule
