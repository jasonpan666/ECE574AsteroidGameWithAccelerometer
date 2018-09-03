module temp_sensor_test(
    );

reg clk;
reg rst_n;


wire scl;
wire [7:0] read_data;
wire [7:0] read_data1;


reg sda_link;
reg sda_r;

wire sda;

integer i;

//assign scl = sda;
assign sda = sda_link? sda_r : 1'bz;

temp_sensor uut(
    .clk(clk),
    .rst_n(rst_n),
    .scl(scl),
    .sda(sda),
    .read_data(read_data),
    .read_data1(read_data1)
);

        always
        begin
            clk = 0;
            #5;
            clk = 1;
            #5;
        end
        
        always
        begin
            rst_n = 0;
            #20;
            rst_n = 1;
            #20;
        end

initial
begin
        for( i = 0; i < 25; i = i + 1)
           begin
               sda_link = 0;
               sda_r = 0;
               #10;
               sda_link = 0;
               sda_r = 1;
               #10;
               sda_link = 1;
               sda_r = 0;
               #10;
               sda_link = 1;
               sda_r = 1;
               #10;
           end

end   


endmodule