class transaction;
  randc bit rst, d;
  		bit q;
  static bit [3:0] count;
  
  
    constraint c1{
      if(count < 1)
      rst == 0;
    else 
      rst == 1;
  }
  
  function void display(string dis);
    $display(" %0t [%s] count = %0d rst = %0b d = %0b q = %0b",$time, dis, count, rst, d, q);
  endfunction
  
    function void display_line();
    $display("________________________________________");
  	endfunction
  
  function void check();
    count++;
  endfunction
  
endclass

  
