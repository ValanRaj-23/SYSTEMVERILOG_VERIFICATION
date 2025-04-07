
`define DRIVER_IF vinf.DRV_INF.driver_cb

class driver #(int t = 10);
  	virtual c_inf vinf;
	transaction trans;
  	mailbox mb_gen;
  
  function new( virtual c_inf vinf, mailbox mb_gen);
    this.vinf 	= vinf;
    this.mb_gen	= mb_gen;
  endfunction
  
  task start();
    repeat(t)
    begin
    mb_gen.get(trans);
   
//    @(posedge vinf.clk)
//       #1;
	`DRIVER_IF.rst	<=	trans.rst;
    `DRIVER_IF.updo	<=	trans.updo;

    trans.display("DRV");
      
    end   
  endtask
endclass
    
