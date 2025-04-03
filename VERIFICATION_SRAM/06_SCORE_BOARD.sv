class scoreboard #(int times = 10);
  	transaction trans;
  	mailbox mb_drv;
  	bit [3:0] temp [16];  
  	bit [3:0] temp_data;
  	event next;
  
  function new(mailbox mb_drv);
    this.mb_drv = mb_drv;
  endfunction
  
  task start();
    repeat(times)
      begin
      mb_drv.get(trans);
		trans.display("SCB");

      if (trans.en && trans.wr)
        write();
      else if (trans.en && !trans.wr) 
        read();
        
      -> next; 
    end
  endtask  
  
  task write();
     if (trans.addr < 16) 
            begin
          		temp[trans.addr] <= trans.data_in;
              $display(" DATA IS STORED ");
        end 
  endtask
  
  task read();
    if (trans.addr < 16) begin
          temp_data = temp[trans.addr];
          
          if (temp_data == trans.data_out) begin
            $display("DATA IS MATCHED at Address: %0d, Expected: %0d, Got: %0d", trans.addr, temp_data, trans.data_out);
          end 
      	else begin
            $display("DATA IS NOT MATCHED at Address: %0d, Expected: %0d, Got: %0d", trans.addr, temp_data, trans.data_out);
          end
        end 
  endtask
    

endclass
