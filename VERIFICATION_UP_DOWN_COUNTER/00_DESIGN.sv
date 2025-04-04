module up_down(c_inf inf);
  
  always@(posedge inf.clk)
    if(!inf.rst)
      inf.count <= 0;
 	else
      case(inf.updo)
        0 : inf.count <= inf.count + 1;
        1 : inf.count <= inf.count - 1;
      endcase
  
endmodule
