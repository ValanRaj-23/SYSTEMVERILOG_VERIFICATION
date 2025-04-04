class score_board;
  mailbox mb_sb;
  
  function new(mailbox mb_sb);
    this.mb_sb = mb_sb;
  endfunction
  
  task start();
      transaction trans;

    repeat(5)
	begin
      mb_sb.get(trans);
      trans.display("score_board");
      	if((trans.a^trans.b^trans.c == trans.sum)&&((trans.a& trans.b)|(trans.c& trans.b)|(trans.a& trans.c) == trans.carry))
          begin
          $display("All test cases passed");		             
          end        
        else
          begin
        	$display("test cases failed");
          end
    end
    trans.display("score_board");

  endtask
endclass
