`include "environment.sv"

class test;
  virtual intf vinf;
  environment env;
  
  function new(virtual intf vinf);
    this.vinf = vinf;
    env = new(vinf);
  endfunction
  
  task start();
    $display("PROCESS STARTED");
    env.run();
    $display("PROCESS ENDED");
  endtask
  
endclass
