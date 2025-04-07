class score_board #(int t = 10);
  transaction trans;
  mailbox mb_mon;
  event next;
  
  bit [3:0] temp;
  
  function new(mailbox mb_mon);
    this.mb_mon	= mb_mon;
  endfunction
  
  task start();
    repeat(t)
      begin
    
        mb_mon.get(trans);
        trans.display("SCB");
        
        if(!trans.rst)
          temp = 0;
        else
          case(trans.updo)
            0 : temp = temp + 1;
            1 : temp = temp - 1;
          endcase
    
        check();
//         -> next;
        
      end
  endtask
        
        task check();
          if(temp == trans.count)
          $display(" DATA IS MATCHED");
        else 
          $display("DATA IS NOT MATCHED");
		endtask
endclass
     
        
