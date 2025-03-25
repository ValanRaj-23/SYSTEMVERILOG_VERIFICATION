class driver;
  virtual inf vinf;
  mailbox mb_gen;
  
  function new(virtual inf vinf, mailbox mb_gen);
    this.vinf = vinf;
    this.mb_gen = mb_gen;
  endfunction
  
  task start();
    repeat(5)
      #1
      begin
      transaction trans;
      mb_gen.get(trans);
      vinf.a = trans.a;
      vinf.b = trans.b;
      vinf.c = trans.c;
      trans.display("driver");
      #4;
    end
  endtask
endclass
  
  
      
    	
   
    
