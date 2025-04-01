class scoreboard;
  transaction trans;
  mailbox mb_mon;
  event next;
  
  
  function new(mailbox mb_mon);
    this.mb_mon = mb_mon;
  endfunction
  
  task start();
    trans = new();
    repeat(5)
      begin
		mb_mon.get(trans);
        trans.display("SBD");
        
        if((trans.rst == 0) && (trans.q == 0))
          $display("\t    test case passed");
        else if((trans.rst == 1) && (trans.q == trans.d))
          $display("\t    test case passed");
        else
          $display("\t    test case failed");
        
        trans.display_line();
        -> next;
      end
		
  endtask
endclass  
  
