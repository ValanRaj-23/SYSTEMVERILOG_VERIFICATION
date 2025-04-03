`include "interface.sv"
`include "test.sv"

module tb;
  
  bit clk;
 
  always #5 clk = ~clk;  
  intf inf(clk);
  sram uut(inf);
  test tst;

  initial begin
    tst = new(inf); 
  	#5;
    inf.rst = 0;
    #15;
    inf.rst = 1;
    inf.wr 	= 1;
    inf.en 	= 1;
    
    #180;
    inf.wr 	= 0;
    inf.en 	= 1;
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
    #500;
    $finish;
  end
  
  initial begin
      tst.run();
  end
  
endmodule

