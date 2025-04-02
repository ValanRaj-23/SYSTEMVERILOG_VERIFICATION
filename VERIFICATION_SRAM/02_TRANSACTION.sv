class transaction;
  rand 	bit [3:0] data_in;
  randc	bit [3:0] addr;
  		bit rst;
  		bit wr;
  		bit en;
  		bit [3:0] data_out;

  
  //   constraint c1{wr dist {1 := 50, 0 := 50};}
      
  function void display(string str);
    $display("%0t [%s] en = %0b wr = %0d data = %0d addr = %0d",$time, str, en, wr, data_in, addr);
  endfunction
  
  function void display_line();
    $display("____________________________________");
  endfunction
  
 endclass
