module sequential_detector(clk, reset, d, y);
	input clk, reset, d;
	output y;
	
	reg [2 : 0] state;
	wire y;
	
	parameter idle = 3'b000, s1 = 3'b001, s2 = 3'b010, s3 = 3'b011,
			  s4 = 3'b100, s5 = 3'b101, s6 = 3'b110, s7 = 3'b111;
	//状态机实现
	always@(posedge clk or posedge reset)
	begin
		if(reset) state <= idle;
		else
		begin
			casex(state)
				idle: begin
						if(d == 1) state <= s1;
						else state <= idle;
					  end
				s1: begin
						if(d == 0) state <= s2;
						else state <= s1;
					end
				s2: begin
						if(d == 0) state <= s3;
						else state <= s7;
					end
				s3: begin
						if(d == 1) state <= s4;
						else state <= s6;
					end
				s4:	begin
						if(d == 0) state <= s5;
						else state <= s1;
					end
				s5: begin
						if(d == 1) state <= s1;
						else state <= s3;
					end
				s6: begin
						if(d == 1) state <= s7;
						else state <= s6;
					end
				s7: begin
						if(d == 1) state <= s1;
						else state <= s2;
					end
				default: state <= idle;
			endcase
		end
	end
	
	assign y = (state == s4 && d == 0) ? 1 : 0;
endmodule			
