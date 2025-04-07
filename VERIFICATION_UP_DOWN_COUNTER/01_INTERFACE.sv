interface c_inf();
  bit clk;
  logic rst;
  logic updo;
  logic [3:0] count;
  
   clocking driver_cb@(posedge clk);
    default output #1;
    output rst;
    output updo;
  	endclocking
  
  clocking monitor_cb@(posedge clk);
//     default input #1;
    input rst;
    input updo;
    input count;
  endclocking
  
  
  	modport DRV_INF(clocking driver_cb, input clk);
    modport MON_INF(clocking monitor_cb, input clk);
    
 endinterface
  
