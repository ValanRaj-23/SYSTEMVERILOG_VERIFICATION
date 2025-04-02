class generator;
  transaction trans;
  mailbox mb_gen;
  event next;
  
  function new(mailbox mb_gen);
    this.mb_gen = mb_gen;
  endfunction
  
  task start();
    repeat(5);
    begin
      
    trans = new();
    void'(trans.randomize());
      
    mb_gen.put(trans);
    trans.rst 	<= 1;
    trans.en	<= 1;
    trans.wr	<= 0;
    trans.display_line();
    trans.display("GEN");
    
    @(next);
     
    end
  endtask
endclass
      
      
      
    
  
  	
