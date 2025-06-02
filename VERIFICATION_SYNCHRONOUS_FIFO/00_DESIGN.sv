module SYNC_FIFO(	input 		  	clk,
                 	input		  	rst,
		   	input 		  	wr_en,
	      	   	input 		  	rd_en,
		 	input 		[7:0]  	din,
	           	output 		  	full,
	           	output 		  	empty,
		 	output reg 	[7:0]	dout);
  

  		reg [7:0] mem [7:0];
		  reg [2:0] wrptr, rdptr;
		  reg wr_err, rd_err;
  
	always@(posedge clk or negedge rst)
	if(rst)begin
		dout <= 0;	
	end

	always@(posedge clk or posedge rst)begin
	if(rst)
		wrptr <= 0;
	else if(wr_en && (!full))
		begin
		mem[wrptr] <= din;
		wrptr <= wrptr + 1'b1; // write pointer
		end
    else
        wr_err <= 0;
	end
  
	always@(posedge clk or posedge rst)begin
	if(rst)
		rdptr <= 0;
	else if(rd_en && (!empty))
		begin
		dout <= mem[rdptr];
		rdptr <= rdptr + 1'b1;// read poiner
        end
   	else
        rd_err <= 0;
      
	end

  assign full = ((wrptr + 1'b1)) == rdptr;
  assign empty = (wrptr == rdptr);
  
endmodule	
