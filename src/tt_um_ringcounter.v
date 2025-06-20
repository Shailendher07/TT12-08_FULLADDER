module tt_um_ringcounter (
    input  wire [7:0] ui_in,    
    output wire [7:0] uo_out,   
    input  wire [7:0] uio_in,   
    output wire [7:0] uio_out,  
    output wire [7:0] uio_oe,   
    input  wire ena,     
    input  wire clk,    
    input  wire rst_n    
);


    wire [7:0] ring;

    always@(*)
        begin
        uo_out <= ring;
        end  

    d_ff_wori f0 (.clk(clk) , .rst(rst_n) , .d(ring[1]), .out(ring[0]));
    d_ff_wori f1 (.clk(clk) , .rst(rst_n) , .d(ring[2]), .out(ring[1]));
    d_ff_wori f2 (.clk(clk) , .rst(rst_n) , .d(ring[3]), .out(ring[2]));
    d_ff_wori f3 (.clk(clk) , .rst(rst_n) , .d(ring[4]), .out(ring[3]));
    d_ff_wori f4 (.clk(clk) , .rst(rst_n) , .d(ring[5]), .out(ring[4]));
    d_ff_wori f5 (.clk(clk) , .rst(rst_n) , .d(ring[6]), .out(ring[5]));
    d_ff_wori f6 (.clk(clk) , .rst(rst_n) , .d(ring[7]), .out(ring[6]));
    d_ff f7 (.clk(clk) , .rst(rst_n) , .d(ring[0]), .out(ring[7]));



    // All output pins must be assigned. If not used, assign to 0.
    assign uio_out = 0;
    assign uio_oe  = 0;



endmodule
