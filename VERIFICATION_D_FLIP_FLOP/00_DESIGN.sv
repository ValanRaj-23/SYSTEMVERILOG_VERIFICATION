module d_ff(intf.ds inf);
  
  always@(posedge inf.clk)
    begin
      if(!inf.rst)	
        inf.q <= 0;
      else 		
        inf.q <= inf.d;
    end
endmodule        
