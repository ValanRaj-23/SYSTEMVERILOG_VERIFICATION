module full_adder(inf.ds inff);
  
  assign inff.sum = (inff.a ^ inff.b ^ inff.c);
  assign inff.carry = ((inff.a & inff.b)|(inff.b & inff.c)|(inff.c & inff.a));
  
endmodule
