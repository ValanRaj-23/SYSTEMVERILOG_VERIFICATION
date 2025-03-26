class generator;
  virtual intf vinf;
  transaction trans;
  mailbox mb_gen;
  
  function new(virtual intf vinf, mailbox mb_gen);
    this.vinf = vinf;
    this.mb_gen = mb_gen;
  endfunction
  
  task start();
    repeat(5)
      begin
        @(posedge vinf.clk)
        #1
        trans = new();
        void'(trans.randomize());
        trans.check();
        mb_gen.put(trans);
        trans.display("generator");
       // #5;
       
      end
  endtask
  
endclass
    
        
