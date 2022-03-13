module cnt10 (clk,rst,en,load,cout,dout,data);
    input clk,en,rst,load;
    input [3:0] data;
    output [3:0] dout;
    output cout;
    reg [3:0] q1; 
    reg cout;

    assign dout=q1;
    always@(posedge clk or negedge rst) begin
            if(!rst)       q1<=0;
       else if(en) begin
            if(!load)      q1<=data;
            else if(q1<9)  q1<=q1+1;
            else           q1<=4'b0000; 
       end
    end 
    
    always@ (q1)
        if(q1==4'h9) cout=1'b1; 
        else         cout=1'b0; 

endmodule
