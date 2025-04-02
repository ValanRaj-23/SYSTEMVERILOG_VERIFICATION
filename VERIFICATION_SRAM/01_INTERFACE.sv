interface intf(input logic clk);
  logic rst, en, wr;
  logic [3:0] data_in;
  logic [3:0] addr;
  logic [3:0] data_out;

  modport ds(input clk, rst, en, wr, data_in, addr,output data_out);
  
endinterface
