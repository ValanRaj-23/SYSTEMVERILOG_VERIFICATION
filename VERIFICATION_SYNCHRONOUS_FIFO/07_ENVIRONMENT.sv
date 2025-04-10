// `include "transaction.sv"
// `include "generator.sv"
// `include "driver.sv"
// `include "monitor.sv"
// `include "score_board.sv"
`include "package.sv"
import my_pkg::*; 


class environment;
  
  transaction trans;
  generator 	  #(count) gen;
  driver 		    #(count) drv;
  monitor 		  #(count) mon;
  score_board 	#(count) sbd;
  virtual intf vinf;
  event move_n;
  
  mailbox mb_gen;
  mailbox mb_mon;
  
  function new(virtual intf vinf);
    this.vinf = vinf;
    
    mb_gen 	 =	new();
    mb_mon	 = 	new();
     
    gen 	 = 	new(mb_gen);
    drv 	 = 	new(vinf, mb_gen);
    mon		 =	new(vinf, mb_mon);
    sbd		 =	new(mb_mon);
    
    gen.move = move_n;
    sbd.move = move_n;
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
