
module cnt10_tb;
    reg clk,en,rst,load;
    reg [3:0] data;
    wire [3:0] dout;
    wire cout;


  cnt10 u_cnt10(clk,rst,en,load,cout,dout,data);

  parameter CLK_PERIOD = 20;


     initial begin
          clk = 0;
          forever begin
               #(CLK_PERIOD/2) clk = ~clk;
          end
     end

     initial begin
          en = 0;
          #10 
          en = 1;
     end

     initial begin
          rst = 0;
          #10 
          rst = 1;
     end

     initial begin
          load = 1;
          #200 
          load = 0;
          #20
          load = 1;
     end

     integer seed;
          initial begin
          if(!$value$plusargs("seed=%d",seed)) begin
               seed = 100;
          end else begin
               $display("Random function with the SEED=%d", seed);
          end
     end 
  

  always @(negedge clk) begin
    if (~rst) begin
          data = 0;
    end else begin
      data = $random(seed); 
    end
  end

  // watch dog
  initial begin
    #400 $finish;
  end


  initial begin
    $vcdpluson; 
  end
endmodule