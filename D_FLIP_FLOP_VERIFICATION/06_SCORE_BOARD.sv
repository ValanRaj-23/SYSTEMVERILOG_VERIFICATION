class scoreboard;
  transaction trans;
  mailbox mb_mon;
  
  function new(mailbox mb_mon);
    this.mb_mon = mb_mon;
  endfunction
  
  task start();
    repeat(5)
      begin
        mb_mon.get(trans);

        if((trans.rst == 0) && (trans.q == 0))
          	$display("test case passed");
        else if((trans.rst == 1) && (trans.q == trans.d))
         	$display("test case passed");
        else
          $display("test case failed");
          $display("score board");
        
       
      end
  endtask
endclass           
        
        
    
    
  
  
