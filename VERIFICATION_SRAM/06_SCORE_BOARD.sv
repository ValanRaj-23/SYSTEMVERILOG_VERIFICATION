class scoreboard;
  	transaction trans;
  	mailbox mb_drv;
  	bit [3:0] temp [16];  // 16 locations for memory storage
  	bit [3:0] temp_data;
  	event next;
  
  function new(mailbox mb_drv);
    this.mb_drv = mb_drv;
  endfunction
  
  task start();
  // Initialize transaction object
    repeat(5) begin
      mb_drv.get(trans);
      
      if (trans.en && trans.wr) begin
        if (trans.addr < 16) begin
          temp[trans.addr] <= trans.data_in;
          $display(" DATA IS STORED at Address: %0d, Data: %0d", trans.addr, trans.data_in);
        end else begin
          $display("ERROR: Address out of range: %0d", trans.addr);
        end
      end
      
      else if (trans.en && !trans.wr) begin
        if (trans.addr < 16) begin
          temp_data = temp[trans.addr];
          
          if (temp_data == trans.data_out) begin
            $display(" DATA IS MATCHED at Address: %0d, Expected: %0d, Got: %0d", trans.addr, temp_data, trans.data_out);
          end else begin
            $display(" DATA IS NOT MATCHED at Address: %0d, Expected: %0d, Got: %0d", trans.addr, temp_data, trans.data_out);
          end
        end else begin
          $display("ERROR: Read Address out of range: %0d", trans.addr);
        end
      end
      
      -> next; // Trigger next event
    end
  endtask

endclass
