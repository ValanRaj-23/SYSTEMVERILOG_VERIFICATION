class score_board #(parameter count = 10);
	virtual intf vinf;
	transaction trans;
  
	mailbox mb_mon;
	event move;
  
	bit [7:0] que [$];
	bit [7:0] temp;

  function new(mailbox mb_mon);
		this.mb_mon = mb_mon;
	endfunction

	task start();
		repeat(count)
		begin
			mb_mon.get(trans);
          	trans.display("SCB");

			fork
				reset();
				write();
				read();
			join
          	
          check_test();
          trans.display("SCB");
          
          -> move;
		end
	endtask

	task reset();
// 		@(posedge vinf.clk)
      if(trans.rst)
			foreach(que[i])
				que[i] = 0;
	endtask

	task write();
// 		@(posedge vinf.clk)
      if(trans.wr_en && !trans.full && !trans.rst)
			que.push_back(trans.din);
	endtask

	task read();
// 		@(posedge vinf.clk)
      if(trans.rd_en && !trans.empty && !trans.rst)
        temp = que.pop_front();
	endtask
  
  	task check_test();
      if(temp == trans.dout)
      		$display("TEST CASE PASSED");
    	else 
      		$display("TEST CASE PASSED");
  	endtask    
			
endclass
				

			
