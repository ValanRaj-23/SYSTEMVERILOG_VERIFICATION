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
    $display(" %s ", dis);
    $display("rst = %0b d = %0b q = %0b", rst, d, q);
    $display(" count = %0d", count);
  endfunction
  
  
  function void check();
    count++;
  endfunction
  
  
endclass

  
