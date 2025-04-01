class monitor;
  virtual intf vinf;
  transaction trans;
  mailbox mb_mtr;
    event next;

  function new(virtual intf vinf, mailbox mb_mtr);
    this.mb_mtr = mb_mtr;
    this.vinf = vinf;
  endfunction
  
  task start();	
    repeat(5)
	begin
	trans = new();
          @(posedge vinf.clk)
   		  #1;         
			trans.rst	=  	vinf.rst; 	
			trans.d  	=	vinf.d;
			trans.q  	= 	vinf.q;
          mb_mtr.put(trans);
          trans.display("MON");
          
        end
  endtask
  
endclass
    
        
