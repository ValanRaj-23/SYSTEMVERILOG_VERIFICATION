class transaction;
  
  	rand 	bit rst;
  	rand 	bit wr_en, rd_en;
  	rand 	bit [7:0] din;	
  		bit full, empty;
		bit [7:0] dout; 
  		int count;	//to randomize reset condition
  
  constraint c1{ rst 	dist {1:=20, 0:=80};}
  constraint c2{ wr_en 	dist {1:=80, 0:=20};}
  constraint c3{ rd_en	dist {1:=80, 0:=20};}
  
  function void display(string str);
    $display("%t %s rst = %0b wr_en = %0b rd_en = %0b full = %0b empty = %0b din = %0d dout = %0d", $time, str, rst, wr_en, rd_en, full, empty, din, dout);
  endfunction
  
  function void display_line();
    $display("------------------------------------");
  endfunction
  
endclass
  
