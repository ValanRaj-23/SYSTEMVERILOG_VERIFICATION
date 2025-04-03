class transaction;
  rand 	bit [3:0] data_in;
  randc	bit [3:0] addr;
		    bit wr;
  		  bit rst;
    		bit en ;
  		  bit [3:0] data_out;
      
  function void display(string str);
    $display("%0t [%s] en = %0b wr = %0d data = %0d addr = %0d",$time, str, en, wr, data_in, addr);
  endfunction
  
  function void display_line();
    $display("____________________________________");
  endfunction
  
 endclass
