class monitor #(int times = 10);
	virtual intf vinf;
  	transaction trans;
  	mailbox mb_drv;
  
  function new( virtual intf vinf, mailbox mb_drv);
    this.vinf 	= vinf;
    this.mb_drv	= mb_drv;
  endfunction
  
  task start();
    repeat(times)
      begin
        trans = new();
        
        @(posedge vinf.clk)
		#1;        
        trans.data_in 	= vinf.data_in;
        trans.addr 	= vinf.addr;
        trans.en	= vinf.en;
        trans.wr	= vinf.wr;
        trans.data_out	= vinf.data_out;
        
        mb_drv.put(trans);
        trans.display("MON");
        
      end
  endtask
endclass
        
        
    
