class driver #(parameter count = 10);
	virtual intf vinf;
	transaction trans;
	mailbox mb_gen;

	function new(virtual intf vinf, mailbox mb_gen);
	       this.vinf	= 	vinf;
	       this.mb_gen 	= 	mb_gen;
       endfunction

       task start();
	       repeat(count)
	       begin
		       mb_gen.get(trans);
		       @(posedge vinf.clk)
             
	       			vinf.rst 	<= 	trans.rst;
					vinf.wr_en	<= 	trans.wr_en;
					vinf.rd_en	<=	trans.rd_en;
					vinf.din	<= 	trans.din;
			
				trans.display("DRV");
		end
	endtask
endclass

		       
