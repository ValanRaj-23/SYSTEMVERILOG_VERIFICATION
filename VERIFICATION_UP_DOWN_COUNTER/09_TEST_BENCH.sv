`include "interface.sv"
`include "test.sv"

module tb;

  always #5 inf.clk = ~inf.clk;
  c_inf inf();
  test tst;
  up_down uut(inf);
  
  initial begin
    tst = new(inf);
  end
  
  initial begin
    tst.run();
  end
    
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
    #500;
    $finish;
    
  end
  
endmodule
    
