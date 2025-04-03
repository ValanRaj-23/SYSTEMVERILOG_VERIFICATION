class driver #(int times = 10);
	transaction trans;
  	virtual intf vinf;
  	mailbox mb_gen;
  
  function new( virtual intf vinf, mailbox mb_gen);
    this.vinf 	= vinf;
    this.mb_gen	= mb_gen;
  endfunction
  
  task start();
    repeat(times)
    begin
      
    mb_gen.get(trans);
      
   @(posedge vinf.clk)
      
    vinf.data_in 	= trans.data_in;
    vinf.addr		= trans.addr;
	    
    trans.display("DRV");
      
    end
   
  endtask
endclass
    
