module led_lights(
    input clk,
    input rst_n,    		 
    output [3:0] led
    );

reg[1:0] state;   
reg[4:0] led;			
reg[21:0]cn;	
reg clk_show;	

always @ ( posedge clk or negedge rst_n)
begin
	if(!rst_n)
		begin
			clk_show<=0;
			cn<=0;
		end
	else
		if(cn<12) 
			cn<=cn+1;
		else
			begin
				cn<=0;			
				clk_show<=~clk_show;
			end
end

always@(posedge clk_show or negedge rst_n )
begin
	if(!rst_n)
		begin
			led<=4'b1111;
			state<=0;
		end
	else
	begin      
		case(state)
			0:begin            
				led<=4'b0111;
				state<=1;        
				end
			1:begin
				led<=4'b1011;
				state<=2;			
				end
			2:begin
				led<=4'b1101;	
				state<=3;				
				end
			3:begin
				led<=4'b1110;
				state<=0;			
				end
			default: 
				state<=0;
			endcase
	end
end
endmodule
