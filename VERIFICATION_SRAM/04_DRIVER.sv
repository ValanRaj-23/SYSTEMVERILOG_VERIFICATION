class driver;
	transaction trans;
  	virtual intf vinf;
  	mailbox mb_gen;
  
  function new( mailbox mb_gen, virtual intf vinf);
    this.vinf 	= vinf;
    this.mb_gen	= mb_gen;
  endfunction
  
  task start();
    repeat(5);
    begin
      
    mb_gen.get(trans);
      
    vinf.data_in 	= trans.data_in;
    vinf.addr		= trans.addr;
    vinf.en			= trans.en;
    vinf.wr			= trans.wr;
//     vinf.data_out	= trans.data_out;
      
    trans.display("DRV");
      
    end
   
  endtask
endclass
    
