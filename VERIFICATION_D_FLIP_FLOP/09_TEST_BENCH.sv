`include "interface.sv"
`include "test.sv"

module tb;
	
  bit clk;
  intf inf(clk);
  test tb(inf);
  d_ff uut(inf.ds);
	
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
    


// # ________________________________________
// #  0 [GEN] count = 1 rst = 0 d = 0 q = 0
// #  0 [DRV] count = 1 rst = 0 d = 0 q = 0
// #  6 [MON] count = 1 rst = 0 d = 0 q = 0
// #  6 [SBD] count = 1 rst = 0 d = 0 q = 0
// # 	    test case passed
// # ________________________________________
// # ________________________________________
// #  6 [GEN] count = 2 rst = 1 d = 1 q = 0
// #  6 [DRV] count = 2 rst = 1 d = 1 q = 0
// #  16 [MON] count = 2 rst = 1 d = 1 q = 1
// #  16 [SBD] count = 2 rst = 1 d = 1 q = 1
// # 	    test case passed
// # ________________________________________
// # ________________________________________
// #  16 [GEN] count = 3 rst = 1 d = 0 q = 0
// #  16 [DRV] count = 3 rst = 1 d = 0 q = 0
// #  26 [MON] count = 3 rst = 1 d = 0 q = 0
// #  26 [SBD] count = 3 rst = 1 d = 0 q = 0
// # 	    test case passed
// # ________________________________________
// # ________________________________________
// #  26 [GEN] count = 4 rst = 1 d = 1 q = 0
// #  26 [DRV] count = 4 rst = 1 d = 1 q = 0
// #  36 [MON] count = 4 rst = 1 d = 1 q = 1
// #  36 [SBD] count = 4 rst = 1 d = 1 q = 1
// # 	    test case passed
// # ________________________________________
// # ________________________________________
// #  36 [GEN] count = 5 rst = 1 d = 0 q = 0
// #  36 [DRV] count = 5 rst = 1 d = 0 q = 0
// #  46 [MON] count = 5 rst = 1 d = 0 q = 0
// #  46 [SBD] count = 5 rst = 1 d = 0 q = 0
// # 	    test case passed
// # ________________________________________
