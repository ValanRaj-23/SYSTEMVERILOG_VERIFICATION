class monitor;
  virtual inf vinf;
  mailbox mb_sb;

  function new(virtual inf vinf, mailbox mb_sb);
    this.vinf = vinf;
    this.mb_sb = mb_sb;
  endfunction
  
  task start();
    repeat(5)
    #2
    begin
    transaction trans;
    trans = new();
    
     trans.a 		=	vinf.a;
	   trans.b 		=	vinf.b;
	   trans.c 		=	vinf.c;
     trans.sum 		=	vinf.sum;
     trans.carry 	=	vinf.carry;
      
      mb_sb.put(trans);
      trans.display("monitor");
      #3;
    end
  endtask
    
    endclass
    
    
  
