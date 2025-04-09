class monitor #(parameter count = 10);
	virtual intf vinf;
	transaction trans;
	mailbox mb_mon;

  	function new(virtual intf vinf, mailbox mb_mon);
		this.vinf 	= 	vinf;
		this.mb_mon =	mb_mon;
	endfunction

	task start();
		repeat(count)
		begin
			trans 	= new();
			@(posedge vinf.clk)
          
				trans.rst		=	vinf.rst;
				trans.wr_en		= 	vinf.wr_en;
				trans.rd_en		=	vinf.rd_en;
				trans.din		=	vinf.din;
				trans.dout		= 	vinf.dout;
				trans.full		=	vinf.full;
				trans.empty		=	vinf.empty;
			
			  mb_mon.put(trans);
        trans.display("MON");

		end
	endtask
	
endclass
