interface intf(); 
  
	  bit 	  clk;
  	logic 	rst;
 	  logic 	wr_en, rd_en;
  	logic 	full, empty; 
  	logic 	[7:0] din;
  	logic 	[7:0] dout;
  
endinterface

