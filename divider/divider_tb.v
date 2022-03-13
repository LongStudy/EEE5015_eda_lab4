
module divider_tb;
    reg clk,reset;
    wire clk_out;


  divider u_divider(reset,clk,clk_out);

  parameter CLK_PERIOD = 20;


     initial begin
          clk = 0;
          forever begin
               #(CLK_PERIOD/2) clk = ~clk;
          end
     end


     initial begin
          reset = 0;
          #10 
          reset = 1;
     end
  
  always @(posedge clk) begin

  end

  // watch dog
  initial begin
    #400 $finish;
  end


  initial begin
    $vcdpluson; 
  end
endmodule