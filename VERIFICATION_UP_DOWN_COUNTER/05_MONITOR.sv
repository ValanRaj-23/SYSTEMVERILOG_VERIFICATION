`define MONITOR vinf.MON_INF.monitor_cb 
class monitor #(int t = 10);
	virtual c_inf vinf;
  	transaction trans;
  	mailbox mb_mon;
  
  function new( virtual c_inf vinf , mailbox mb_mon);
    this.vinf 	= vinf;
    this.mb_mon	= mb_mon;
  endfunction
  
  task start();
    repeat(t)
      begin
        trans = new();
        
        @(posedge vinf.clk)   
        #1;
        trans.rst	= vinf.rst;
        trans.updo	= vinf.updo;
        trans.count	= vinf.count;
        
        mb_mon.put(trans);
        trans.display("MON");
        
      end
  endtask
endclass
        
        
    
