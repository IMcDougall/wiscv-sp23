wire [31:0] dut_gprs[32];
wire [31:0] dut_pc;
wire dut_ecall;
wire dut_rf_wr_en;
wire [31:0] dut_rf_rd_data;
wire [4:0] dut_rf_rd_addr;
wire dut_data_mem_en;
wire dut_data_mem_rd_wr;
wire [31:0] dut_data_mem_addr;
wire [31:0] dut_data_mem_data_in;
wire dut_data_mem_ready;
wire dut_branch_taken;
wire [31:0] dut_target_pc;
wire [31:0] dut_data_memory[0:8191];

assign dut_gprs = u_proc.u_core.u_register_file.gprs;
assign dut_pc = u_proc.u_core.write_back_pc;
assign dut_ecall = u_proc.ecall;
assign dut_rf_wr_en = u_proc.u_core.u_register_file.i_rf_wr_en;
assign dut_rf_rd_data = u_proc.u_core.u_register_file.i_rd_data;
assign dut_rf_rd_addr = u_proc.u_core.u_register_file.i_rd_addr;
assign dut_data_mem_en = u_proc.data_mem_en;
assign dut_data_mem_rd_wr = u_proc.data_mem_rd_wr;
assign dut_data_mem_addr = u_proc.data_mem_addr;
assign dut_data_mem_data_in = u_proc.data_mem_data_in;
assign dut_data_mem_ready = u_proc.dcache_done;
assign dut_branch_taken = u_proc.u_core.u_fetch_stage.i_branch_taken;
assign dut_target_pc = u_proc.u_core.u_fetch_stage.i_target_pc;
assign dut_data_memory = u_proc.u_data_mem.mem

  
