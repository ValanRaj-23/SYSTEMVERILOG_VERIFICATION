`include "interface.sv"
`include "test.sv"

module tb;
	
  bit clk;
  intf inf(clk);
  test tb(inf);
  d_ff uut(inf);
      
  always #5 clk = ~clk;
  
  initial begin
    $display("testb");

    #100;
    $finish;
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end
  
endmodule    
    
