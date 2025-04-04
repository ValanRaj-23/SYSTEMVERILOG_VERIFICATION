class generator;
  mailbox mb_gen;
  
  function new(mailbox mb_gen);
    this.mb_gen = mb_gen;
  endfunction
  
  task start();
      transaction trans;

    repeat(5) 
    begin 
    trans = new();
    trans.randomize();
    mb_gen.put(trans);
    trans.display("Generator");
    #5;
      
    end
  endtask
endclass
