class monitor;
	virtual intf vinf;
  	transaction trans;
  	mailbox mb_drv;
  
  function new( mailbox mb_drv, virtual intf vinf);
    this.vinf 	= vinf;
    this.mb_drv	= mb_drv;
  endfunction
  
  task start();
    repeat(5)
      begin
        trans = new();
        
        @(posedge vinf.clk)
        #1;
        trans.data_in 	= vinf.data_in;
        trans.addr 		= vinf.addr;
        trans.en		= vinf.en;
        trans.wr		= vinf.wr;
        trans.data_out	= vinf.data_out;
        
        mb_drv.put(trans);
        trans.display("MON");
        
      end
  endtask
endclass
        
        
    
