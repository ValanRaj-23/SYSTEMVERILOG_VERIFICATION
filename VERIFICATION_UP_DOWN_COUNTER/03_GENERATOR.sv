class generator #(int t = 10);
  virtual c_inf vinf;
  transaction trans;
  mailbox mb_gen;
  event next;
  
  function new( virtual c_inf vinf, mailbox mb_gen);
    this.vinf 	= vinf;
    this.mb_gen	= mb_gen;
  endfunction
  
  task start();
    repeat(t)
      begin
        trans = new();
        @(posedge vinf.clk)
// 		#1;
        void'(trans.randomize());
        mb_gen.put(trans);
        trans.display_line();
        trans.display("GEN");

//         @(next);
        
      end
  endtask
endclass
