`include "environment.sv"

class test;
  environment env;
  virtual c_inf inf;  
  
  function new(virtual c_inf inf);  
    this.inf = inf;
    env = new(inf);
  endfunction

  task run();
    env.run();
    $display("Test completed");
  endtask
endclass
