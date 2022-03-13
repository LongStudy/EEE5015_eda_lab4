
module divider_tb;
    reg clk,reset;
    wire clk_out;


  divider u_divider(reset,clk,clk_out);

  parameter CLK_PERIOD = 2;


    initial begin
      clk = 0;
      forever begin
            #(CLK_PERIOD/2) clk = ~clk;
      end
    end


    initial begin
        reset = 0;
        #40 
        reset = 1;
    end


  // watch dog
  initial begin
    #10000 $finish;
  end


  initial begin
    $vcdpluson; 
  end
endmodule