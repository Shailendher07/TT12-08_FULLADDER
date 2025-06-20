module tb;

  // Wire up the inputs and outputs:
  reg clk;
  reg rst_n;
  reg ena;
  reg [7:0] ui_in = 8'b0;
  reg [7:0] uio_in = 8'b0;
  wire [7:0] uo_out;
  wire [7:0] uio_out;
  wire [7:0] uio_oe;

  // Replace tt_um_example with your module name:
  tt_um_ringcounter dut (
      .ui_in  (ui_in),    
      .uo_out (uo_out),   
      .uio_in (uio_in),   
      .uio_out(uio_out),  
      .uio_oe (uio_oe),  
      .ena    (ena),      
      .clk    (clk),      
      .rst_n  (rst_n)     
  );

   initial begin
      rst_n = 1;
      ena = 0;
      clk= 0;
      
      #100 rst_n = 0;
      #1000 rst_n = 1;
      #100 rst_n = 0;
   end

   
    initial begin
        clk = 0;
        forever #50 clk = ~clk; // 100ns clock period = 10 MHz
    end

   
endmodule
