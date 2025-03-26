`include "environment.sv"

program test(intf inf);
  environment env;
  
 initial begin
    env = new(inf);
    env.finish();
   $display("test");
  end
  
endprogram
