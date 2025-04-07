`include "package.sv"
import my_pkg::*; 


class environment ;
  transaction trans;
  generator 	#(t) gen;
  driver 		  #(t) drv;
  monitor 		#(t) mon;
  score_board #(t) sbd;
  virtual c_inf vinf;
  event next_n;
  
  mailbox mb_gen;
  mailbox mb_mon;
  
  function new(virtual c_inf vinf);
    this.vinf = vinf;
    
    mb_gen 	 =	new();
    mb_mon	 = 	new();
     
    gen 	 = 	new(vinf, mb_gen);
    drv 	 = 	new(vinf, mb_gen);
    mon		 =	new(vinf, mb_mon);
    sbd		 =	new(mb_mon);
    
    gen.next = next_n;
    sbd.next = next_n;
    $display("environment new");

  
  endfunction
  
  
  task run();
    fork
      gen.start();
      drv.start();
      mon.start();
      sbd.start(); 
    join
  endtask
  
endclass
