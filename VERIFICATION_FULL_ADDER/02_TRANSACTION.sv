class transaction;
  rand bit a;
  rand bit b;
  rand bit c;
  bit sum;
  bit carry;

  function void display(string update);
    $display("%s",update);
    $display("%0t a = %0b b = %0b c = %0b sum = %0b carry = %0b",$time, a, b, c, sum, carry);
  endfunction
  
endclass
  
