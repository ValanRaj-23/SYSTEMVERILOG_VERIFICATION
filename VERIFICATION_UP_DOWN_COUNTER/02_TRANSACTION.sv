class transaction;
  rand 	bit updo;
  rand 	bit rst;
  		bit [3:0] count;
  
  constraint c1{ rst 	dist {0:= 10, 1:= 90};}
  constraint c2{ updo 	dist {0:= 70, 1:= 50};}
  
  function void display(string str);
    $display("%t [%s] rst = %0b updo = %0d count = %0d", $time, str, rst, updo, count);
  endfunction
  
  function void display_line();
    $display("------------------------------------");
  endfunction
  
endclass
