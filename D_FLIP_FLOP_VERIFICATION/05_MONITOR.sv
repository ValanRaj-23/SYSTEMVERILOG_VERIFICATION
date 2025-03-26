class monitor;
  virtual intf vinf;
  transaction trans;
  mailbox mb_mtr;
  
  function new(virtual intf vinf, mailbox mb_mtr);
    this.mb_mtr = mb_mtr;
    this.vinf = vinf;
  endfunction
  
  task start();
    repeat(5)
		begin
          @(posedge vinf.clk)
          #3;
          	trans = new();
			      trans.rst	=   vinf.rst; 	
			      trans.d  	=	  vinf.d;
			      trans.q  	= 	vinf.q; 
          	
          mb_mtr.put(trans);
          trans.display("monitor");

        end
  endtask
  
endclass
