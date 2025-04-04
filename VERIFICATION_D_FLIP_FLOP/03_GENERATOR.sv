class generator;
  transaction trans;
  mailbox mb_gen;
  event next;
  
  function new(mailbox mb_gen);
    this.mb_gen = mb_gen;
  endfunction
  
  task start();
    repeat(5)
      begin
        trans = new();
        void'(trans.randomize());
        trans.check();
        mb_gen.put(trans);
        trans.display_line();
        trans.display("GEN");        
        @(next);     
      end
  endtask
  
endclass
    
        
