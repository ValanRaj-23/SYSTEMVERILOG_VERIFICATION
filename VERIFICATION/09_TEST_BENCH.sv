`include "interface.sv"
`include "test.sv"

module SYNC_FIFO_TB;	
  
    always #5 inf.clk = ~inf.clk;	
  
  	intf inf(clk);
  	test tst;
	  SYNC_FIFO uut(
      				.clk				(inf.clk),
      				.rst				(inf.rst),
      				.wr_en				(inf.wr_en),
      				.rd_en				(inf.rd_en),
      				.din				(inf.din),
      				.full				(inf.full),
      				.empty				(inf.empty),
      				.dout				(inf.dout)
    );



  	initial begin
      	tst = new(inf);
  	end
  	
  	initial begin
      	tst.start();
    end
  
	initial begin
//   	$monitor("%0t inf.rst = %b inf.wr_en = %d inf.rd_en = %d inf.din = %d inf.dout = %d ", $time, inf.rst, inf.wr_en, inf.rd_en, inf.din, inf.dout);
	$dumpfile("dump.vcd");
	$dumpvars;
	#250;
	$finish;
	end
  
endmodule
