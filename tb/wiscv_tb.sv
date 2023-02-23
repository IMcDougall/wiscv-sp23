`timescale 1ps / 1ps
module wiscv_tb();

//Include files

reg clk, rst;

localparam CLOCK_PERIOD = 1000;

// File Handler
//reg [2000:0] instr_mem_fh = "/home/batchu/riscv/c_compile/factorial.hex"; 
reg [2000:0] instr_mem_fh = "./wiscv.hex"; 


//Cycle Count -> Free running
wire [31:0] cycle_count;

`ifdef WAVES
initial begin
    $wlfdumpvars(0,"wiscv_tb");
end
`endif

// Clock Generation
initial begin
    clk = 1'b0;
    forever clk = #(CLOCK_PERIOD/2) ~clk;
end

// Reset Generation
initial begin
    rst = 1'b1;
    @(posedge clk);
    @(posedge clk);
    @(posedge clk);
    @(posedge clk);
    @(posedge clk);
    rst = 1'b0;
end

localparam BOOT_ADDRESS = 32'h00000000;

`ifdef PIPE
  localparam PIPELINE_EN = 4'b1111;
`elsif NO_PIPE
  localparam PIPELINE_EN = 4'b0000;
`else
  localparam PIPELINE_EN = 4'b1111;
`endif

`ifdef NO_DUT
   localparam NO_DUT = 1;
`else
   localparam NO_DUT = 0;
`endif

`ifdef FIXED_LATENCY
    localparam VARIABLE_LATENCY_EN = 0; 
`elsif VARIABLE_LATENCY
    localparam VARIABLE_LATENCY_EN = 1; 
`elsif CACHE
    localparam CACHE = 1;
`else
    localparam VARIABLE_LATENCY_EN = 0; 
    localparam CACHE = 0;
`endif

generate
if(NO_DUT)
begin : nodut_mode
    riscv_reg_comp_if  #(.BOOT_ADDRESS(BOOT_ADDRESS), .CLOCK_PERIOD(CLOCK_PERIOD), .PIPELINE_EN(PIPELINE_EN), .NO_DUT(NO_DUT)) u_riscv_tb_if (.clk(clk), .resetn(!rst) , .gprs('0), .pc('0), .ecall('0), .rf_wr_en('0), .rf_rd_data('0), .rf_rd_addr('0), .mem_en('0), .mem_rd_wr('0), .mem_addr('0), .mem_data('0), .mem_ready('0), .branch_taken('0), .target_pc('0), .mem('0), .tb_cycle_count(cycle_count));
end else begin : dut_mode

   `include "dut_probes.sv";

    riscv_reg_comp_if  #(.BOOT_ADDRESS(BOOT_ADDRESS), .CLOCK_PERIOD(CLOCK_PERIOD), .PIPELINE_EN(PIPELINE_EN), .NO_DUT(NO_DUT)) u_riscv_tb_if (.clk(clk), .resetn(!rst) , .gprs(dut_gprs), .pc(dut_pc), .ecall(dut_ecall), .rf_wr_en(dut_rf_wr_en), .rf_rd_data(dut_rf_rd_data), .rf_rd_addr(dut_rf_rd_addr), .mem_en(dut_data_mem_en), .mem_rd_wr(dut_data_mem_rd_wr), .mem_addr(dut_data_mem_addr), .mem_data(dut_data_mem_data_in), .mem_ready(dut_data_mem_ready), .branch_taken(dut_branch_taken), .target_pc(dut_target_pc), .mem(dut_data_memory), .tb_cycle_count(cycle_count));

// DUT instantiation
   proc u_proc(.clk(clk),.rst(rst));


//instruction memory
initial begin 
    // LOADS PROGRAM INTO MEMORY 
    $display("Loading Instruction Memory"); // Loading into Data Memory too for .data section
    $readmemh(instr_mem_fh,u_proc.u_instr_mem.mem);
    $readmemh(instr_mem_fh,u_proc.u_data_mem.mem);   // Instruction Memory has some data values for addressing
end
end
endgenerate



endmodule
