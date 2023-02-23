// This Module contains both core instantiation and memory system
module proc(
    input clk,
    input rst
);


wire [31:0] instr_mem_data_out;
wire [31:0] instr_mem_addr;
wire instr_mem_rd_wr;
wire [31:0] data_mem_data_out;
wire [31:0] data_mem_data_in;
wire [31:0] data_mem_addr;
wire data_mem_rd_wr;
wire data_mem_en;
wire ecall; // end of program



core u_core (
    .i_clk(clk),
    .i_rst(rst),
    .i_instr(instr_mem_data_out),
    .o_instr_mem_rd(instr_mem_rd_wr),
    .o_instr_mem_addr(instr_mem_addr),
    .i_data_mem_out(data_mem_data_out),
    .i_icache_done(icache_done),
    .i_dcache_done(dcache_done),
    .o_data_mem_addr(data_mem_addr),
    .o_data_mem_en(data_mem_en),
    .o_data_mem_rd_wr(data_mem_rd_wr),
    .o_data_mem_in(data_mem_data_in),
    .o_ecall(ecall)
);

`ifdef FIXED_LATENCY
DRAMIdeal u_data_mem(
    .data_out(data_mem_data_out),
    .data_in(data_mem_data_in),
    .addr(data_mem_addr[15:0]),
    .enable(data_mem_en),
    .wr(data_mem_rd_wr),
    .createdump(1'b0),
    .clk(clk),
    .rst(rst),
    .err());

DRAMIdeal u_instr_mem(
    .data_out(instr_mem_data_out),
    .data_in('0),
    .addr(instr_mem_addr[15:0]),
    .enable(1'b1),
    .wr(1'b0),
    .createdump(1'b0),
    .clk(clk),
    .rst(rst),
    .err());

assign dcache_done = 1'b1;
assign icache_done = 1'b1;

`elsif VARIABLE_LATENCY

DRAMStall u_data_mem(
    .DataOut(data_mem_data_out),
    .Done(dcache_done),
    .Stall(),
    .CacheHit(),
    .DataIn(data_mem_data_in),
    .Addr(data_mem_addr[15:0]),
    .Wr(data_mem_rd_wr && data_mem_en),
    .Rd(!data_mem_rd_wr && data_mem_en),
    .createdump(1'b0),
    .clk(clk),
    .rst(rst),
    .err());

DRAMStall u_instr_mem(
        .DataOut(instr_mem_data_out),
        .Done(icache_done),
        .Stall(),
        .CacheHit(),
        .DataIn('0),
        .Addr(instr_mem_addr[15:0]),
        .Wr(1'b0),
        .Rd(1'b1),
        .createdump(1'b0),
       .clk(clk),
        .rst(rst),
        .err());
`endif

endmodule
