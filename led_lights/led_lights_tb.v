
module led_lights_tb;
    reg clk;
    reg rst_n;		 
    wire [3:0] led;


  led_lights u_led_lights(clk,rst_n,led);

  parameter CLK_PERIOD = 10;


    initial begin
        clk = 0;
        forever begin
            #(CLK_PERIOD/2) clk = ~clk;
        end
    end

    initial begin
        rst_n = 0;
        #10 
        rst_n = 1;
    end


  // watch dog
  initial begin
    #2000 $finish;
  end


  initial begin
    $vcdpluson; 
  end
endmodule