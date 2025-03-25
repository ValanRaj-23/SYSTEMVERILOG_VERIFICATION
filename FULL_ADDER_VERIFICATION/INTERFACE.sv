interface inf;
  logic a;
  logic b;
  logic c;
  logic sum;
  logic carry;

  modport ds(input a, b, c, output sum, carry);
  modport tb(input sum, carry, input a, b, c);
  
endinterface
