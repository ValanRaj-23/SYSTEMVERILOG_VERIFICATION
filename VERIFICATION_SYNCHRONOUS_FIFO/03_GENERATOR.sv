class generator #(parameter count = 10);
  transaction trans;
  mailbox mb_gen;
  event move;
  
  function new(mailbox mb_gen);
  this.mb_gen = mb_gen;
  endfunction
  
  	task start();
		repeat(count)
	  	begin
          
			trans = new();
			void'(trans.randomize());
			mb_gen.put(trans);
          		trans.display_line();
			trans.display("GEN");
			@(move);
		
        	end
	endtask
  
endclass
