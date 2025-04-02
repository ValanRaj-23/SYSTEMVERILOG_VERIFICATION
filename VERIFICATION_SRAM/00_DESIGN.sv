module sram(intf.ds inf);

  reg [3:0] mem [0:15];

  always@(posedge inf.clk)
	begin
      if(!inf.rst)
        begin
        foreach(mem[i])
          begin
            mem[i] <= 4'h0;
          end
        end
      else
        begin
  		if(inf.en && inf.wr)
  		  	mem[inf.addr] <= inf.data_in;
  		else if (inf.en && !inf.wr)
			inf.data_out <= mem[inf.addr];
        end
	end

endmodule

