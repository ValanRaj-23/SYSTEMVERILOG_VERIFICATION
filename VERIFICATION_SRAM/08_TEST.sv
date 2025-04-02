// `include "interface.sv"
`include "environment.sv"


class test;
  environment env;
  virtual intf inf;  // Use virtual interface

  function new(virtual intf inf);  // Pass virtual interface correctly
    this.inf = inf;
    env = new(inf);
  endfunction

  task run();
    env.run();
    $display("Test completed");
  endtask
endclass
