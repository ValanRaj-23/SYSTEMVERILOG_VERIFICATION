class driver;
  virtual intf vinf;
  transaction trans;
  mailbox mb_gen;
  event next;

  
  function new(virtual intf vinf, mailbox mb_gen);
    this.vinf = vinf;
    this.mb_gen = mb_gen;
  endfunction
  
  task start();
    repeat(5)
      begin
	      
	mb_gen.get(trans);
        vinf.rst 	= 	trans.rst;
        vinf.d		=	trans.d;
        trans.display("DRV");  
	      
      end
  endtask
endclass
        
        
        
  
  
