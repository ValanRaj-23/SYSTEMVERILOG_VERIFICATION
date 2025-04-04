`include "interface.sv"
`include "test.sv"

module top_tb;
  inf inff();
  test tst(inff);  
  full_adder uut(inff);
  
endmodule
  
