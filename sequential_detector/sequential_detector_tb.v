
module sequential_detector_tb;
	reg clk, reset;
	wire y,d;

    reg [23 : 0] data;

  sequential_detector u_sequential_detector(clk, reset, d, y);

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
        #20
        reset = 0;
    end


    initial begin
    	data = 24'b0000_0000_1001_0000_1001_0100;
    end

    always@(negedge clk) begin
        #5 data = {data[22 : 0], data[23]};
    end
    
    assign d = data[23]; 

  // watch dog
  initial begin
    #1000 $finish;
  end


  initial begin
    $vcdpluson; 
  end
endmodule