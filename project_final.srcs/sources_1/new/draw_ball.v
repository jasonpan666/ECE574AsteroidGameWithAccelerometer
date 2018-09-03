//  ===================================================================================
//  								  Define Module, Inputs and Outputs
//													* Draw ball *
//  ===================================================================================
module draw_ball #(parameter WIDTH = 32,  // default width: 32 pixels
                   HEIGHT = 32)(          // default height: 32 pixels
		x,
		hcount, 
		y,
		vcount,
		clk,
		pixel,
		button
);

// ====================================================================================
// 										Port Declarations
// ====================================================================================
	input [10:0] x;
	input [10:0] hcount;
	input [9:0]  y;
	input [9:0]  vcount;
	input 		 clk;
	output [7:0] pixel;
	input [2:0] button;
	
// ====================================================================================
// 								Parameters, Register, and Wires
// ====================================================================================
	reg [7:0]	COLOR;
	reg [7:0] 	 pixel;

//  ===================================================================================
// 							  				Implementation
//  ===================================================================================
    always @(button)
        begin
            if (button[0] == 1)
                COLOR = 8'b00000011;  // cold blue
            else if (button[1] == 1)
                COLOR = 8'b11111100;  // mild yellow
            else if (button[2] == 1)
                COLOR = 8'b11100000 ;  // fire red
            else
                COLOR = 8'b11111111;  // pure white
        end

		always @(posedge clk) 
		begin
			if ((hcount >= x && hcount < (x+WIDTH)) && (vcount >= y && vcount < (y+HEIGHT)))
				pixel <= COLOR;
			else
				pixel <= 8'b0;
		end
				
endmodule
