module SPIcomponent_test(
);

reg		 CLK;
reg		 RST;
reg		 START;
reg		 SDI;
wire 	 SDO;
wire	 SCLK;
wire	 SS;
wire [9:0]  yAxis;

integer i;

SPIcomponent uut(
		.CLK(CLK),
		.RST(RST),
		.START(START),
		.SDI(SDI),
		.SDO(SDO),
		.SCLK(SCLK),
		.SS(SS),
		.yAxis(yAxis)
);

        always
        begin
            CLK = 0;
            #5;
            CLK = 1;
            #5;
        end
        
        
        initial
        begin
           RST = 0;
           START = 0;
           SDI = 0;
           #10;
           
           RST = 0;
           START = 1;
           SDI = 0;
           #200;
           
           RST = 0;
           START = 0;
           SDI = 1;
           #200;
              
           RST = 0;
           START = 1;
           SDI = 1;
           #200;
              
        end

endmodule