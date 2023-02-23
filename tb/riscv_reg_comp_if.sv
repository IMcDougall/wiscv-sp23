interface riscv_reg_comp_if #(parameter BOOT_ADDRESS = 32'h00000000, CLOCK_PERIOD = 1000, PIPELINE_EN = 4'b1111, NO_DUT = 1'b0) (input clk, input resetn, input wire [31:0] gprs[32], input [31:0] pc, input ecall, input rf_wr_en, input [31:0] rf_rd_data, input [4:0] rf_rd_addr, input mem_en , input mem_rd_wr, input [31:0] mem_addr, input [31:0] mem_data, input mem_ready, input branch_taken, input [31:0] target_pc, output [31:0] tb_cycle_count, input [31:0] mem[8192]);

reg [31:0] tb_gprs[31:0];
reg [31:0] tb_csrs[31:0];
reg [31:0] tb_mem[8192];
bit [31:0] tb_next_pc;
//reg [DATA_WIDTH-1 : 0] tb_gprs[REG_NUM];  
//reg [DATA_WIDTH-1 : 0] tb_csrs[REG_NUM]; 
reg [31:0] pc_old; 
`define FILE_PATH /home/batchu/riscv/c_compile/wisc_compile

integer error_count_cycles=0;
bit error_detect=0;
bit [31:0] address, mem_value, temp, address_temp;

//Golden ELF Run
reg [2000:0] elf_run_fpath = "./wiscv.golden_run";
reg [2000:0] instr_funct_name_fpath = "./instr_funct_name.txt";
reg [2000:0] instr_pc_fpath = "./instr_pc.txt";
reg [2000:0] instr_name_fpath = "./instr_name.txt";
reg [2000:0] instr_rs1_fpath = "./instr_rs1.txt";
reg [2000:0] instr_rs2_fpath = "./instr_rs2.txt";
reg [2000:0] instr_rd_fpath = "./instr_rd.txt";
reg [2000:0] instr_imm_fpath = "./instr_imm.txt";
reg [2000:0] instr_fpath = "./instr.txt";
//Instr Mem - Need to loaded into data mem too for having data
reg [2000:0] instr_mem_fh = "./wiscv.hex";

//Trace Files - no pipe file names
reg [2000:0] ref_trace = "REF.Trace";
reg [2000:0] dut_trace = "DUT.Trace";

//Trace Files - pipelined implementation file names
reg [2000:0] ref_ptrace = "REF.pTrace";
reg [2000:0] dut_ptrace = "DUT.pTrace";

//Cycle Count : Can be used to trace Latency ect
reg [31:0] cycle_count;

assign tb_cycle_count = cycle_count;

wire [31:0] rf_rd_data_dut;

integer ref_trace_fh, dut_trace_fh;

initial begin
   if(PIPELINE_EN && (NO_DUT==0)) // REF.Trace is used for NO_DUT=1 mode too
   begin
      ref_trace_fh = $fopen(ref_ptrace,"w"); 
      dut_trace_fh = $fopen(dut_ptrace,"w"); 
   end else begin
      ref_trace_fh = $fopen(ref_trace,"w"); 
      dut_trace_fh = $fopen(dut_trace,"w"); 
   end
end

//instruction memory
initial begin 
    // LOADS PROGRAM INTO MEMORY 
    for(int i = 0; i < 8192; i=i+1) begin tb_mem[i] = 32'b0; end
    $readmemh(instr_mem_fh,tb_mem);   // Instruction Memory has some data values for addressing

    for(int i = 0; i < 32; i=i+1) begin tb_gprs[i] = 32'b0; end
    for(int i = 0; i < 32; i=i+1) begin tb_csrs[i] = 32'b0; end
    

end
 
always@(posedge clk, negedge resetn)
begin
    if(!resetn)
    begin
        //pc_old <= 32'h00000044;
        pc_old <= 32'h0;
    end else begin
        pc_old <= pc;
    end
end

//always@(*)
//begin
//    if((pc_old!=pc) && (resetn) && (pc_old!=32'h0) && (pc_old != BOOT_ADDRESS))
//    begin
//        checker_enable();
//    end
//end

integer elf_run_instr_ptr;
integer instr_funct_name_fh, instr_pc_fh, instr_name_fh, instr_rs1_fh, instr_rs2_fh, instr_rd_fh, instr_imm_fh, instr_fh;
integer funct_file,i, scan_ret0, scan_ret1, scan_ret2, scan_ret3, scan_ret4, scan_ret5, scan_ret6, scan_ret7;
reg [999:0] elf_run_instr;
reg [200:0] elf_run_instr_funct_name, elf_run_instr_name;
reg [31:0] elf_run_instr_pc, elf_run_instr_imm, elf_run_instr_pc_old;
reg [4:0] elf_run_instr_rs1, elf_run_instr_rs2, elf_run_instr_rd;

always@(posedge clk, negedge resetn)
begin
    if(!resetn)
    begin
        //pc_old <= 32'h00000044;
        elf_run_instr_pc_old <= 32'hffffffff;
    end else begin
        elf_run_instr_pc_old <= elf_run_instr_pc;
    end
end


function void check_reg_files();

  for(int i = 0; i < 32; i=i+1) begin//{
    if(tb_gprs[i]!=gprs[i]) begin//{
      error_detect = 1;
      $display("@%t cycle_count = %d ERROR : Reg values mismatch at index %0d ; Expected : %0h, Actual : %0h current_pc : %0h old_pc : %0h",$time,cycle_count,i,tb_gprs[i],gprs[i],pc,pc_old);
    end//}
  end//}

endfunction 

function void check_mem_files();

  for(int i = 0; i < 8192; i=i+1) begin//{
    if(tb_mem[i]!=mem[i]) begin//{
      error_detect = 1;
      $display("ERROR : Mem mismatch address = 0x%x, Expected value = 0x%x Actual value = 0x%x",i, tb_mem[i], mem[i]);
    end//}
  end//}

endfunction 


function void fetch_instruction();
    //scan_ret0 = $fscanf(funct_file, "%s", elf_run_instr);
    scan_ret0 = $fscanf(instr_funct_name_fh, "%s", elf_run_instr_funct_name);
    scan_ret1 = $fscanf(instr_pc_fh, "%h", elf_run_instr_pc);
    scan_ret2 = $fscanf(instr_name_fh, "%s", elf_run_instr_name);
    scan_ret3 = $fscanf(instr_rs1_fh, "%d", elf_run_instr_rs1);
    scan_ret4 = $fscanf(instr_rs2_fh, "%d", elf_run_instr_rs2);
    scan_ret5 = $fscanf(instr_rd_fh, "%d", elf_run_instr_rd);
    scan_ret6 = $fscanf(instr_imm_fh, "%d", elf_run_instr_imm);
    scan_ret7 = $fscanf(instr_fh, "%s", elf_run_instr);
endfunction 

function void execute_instruction();
    case(elf_run_instr_name)
        "lui"      : begin wiscv_lui(elf_run_instr_rd, elf_run_instr_imm); end 
        "auipc"    : begin wiscv_auipc(elf_run_instr_rd, elf_run_instr_imm); end 
        "jal"      : begin wiscv_jal(elf_run_instr_rd, elf_run_instr_imm); end
        "jalr"     : begin wiscv_jalr(elf_run_instr_rd, elf_run_instr_rs1, elf_run_instr_imm); end
        "addi"     : begin wiscv_addi(elf_run_instr_rd, elf_run_instr_rs1, elf_run_instr_imm[11:0]); end 
        "slti"     : begin wiscv_slti(elf_run_instr_rd, elf_run_instr_rs1, elf_run_instr_imm[11:0]); end
        "sltiu"    : begin wiscv_sltiu(elf_run_instr_rd, elf_run_instr_rs1, elf_run_instr_imm[11:0]); end 
        "xori"     : begin wiscv_xori(elf_run_instr_rd, elf_run_instr_rs1, elf_run_instr_imm[11:0]); end
        "ori"      : begin wiscv_ori(elf_run_instr_rd, elf_run_instr_rs1, elf_run_instr_imm[11:0]); end
        "andi"     : begin wiscv_andi(elf_run_instr_rd, elf_run_instr_rs1, elf_run_instr_imm[11:0]); end
        "slli"     : begin wiscv_slli(elf_run_instr_rd, elf_run_instr_rs1, elf_run_instr_imm[4:0]); end
        "srli"     : begin wiscv_srli(elf_run_instr_rd, elf_run_instr_rs1, elf_run_instr_imm[4:0]); end
        "srai"     : begin wiscv_srai(elf_run_instr_rd, elf_run_instr_rs1, elf_run_instr_imm[4:0]); end
        "beq"      : begin wiscv_beq(elf_run_instr_rs1, elf_run_instr_rs2, elf_run_instr_imm[12:0]); end 
        "bne"      : begin wiscv_bne(elf_run_instr_rs1, elf_run_instr_rs2, elf_run_instr_imm[12:0]); end
        "blt"      : begin wiscv_blt(elf_run_instr_rs1, elf_run_instr_rs2, elf_run_instr_imm[12:0]); end
        "bge"      : begin wiscv_bge(elf_run_instr_rs1, elf_run_instr_rs2, elf_run_instr_imm[12:0]); end
        "bltu"     : begin wiscv_bltu(elf_run_instr_rs1, elf_run_instr_rs2, elf_run_instr_imm[12:0]); end
        "bgeu"     : begin wiscv_bgeu(elf_run_instr_rs1, elf_run_instr_rs2, elf_run_instr_imm[12:0]); end
        "add"      : begin wiscv_add(elf_run_instr_rd, elf_run_instr_rs1, elf_run_instr_rs2); end 
        "sub"      : begin wiscv_sub(elf_run_instr_rd, elf_run_instr_rs1, elf_run_instr_rs2); end
        "slt"      : begin wiscv_slt(elf_run_instr_rd, elf_run_instr_rs1, elf_run_instr_rs2); end
        "sltu"     : begin wiscv_sltu(elf_run_instr_rd, elf_run_instr_rs1, elf_run_instr_rs2); end
        "xor"      : begin wiscv_xor(elf_run_instr_rd, elf_run_instr_rs1, elf_run_instr_rs2); end 
        "or"       : begin wiscv_or(elf_run_instr_rd, elf_run_instr_rs1, elf_run_instr_rs2); end
        "and"      : begin wiscv_and(elf_run_instr_rd, elf_run_instr_rs1, elf_run_instr_rs2); end
        "sll"      : begin wiscv_sll(elf_run_instr_rd, elf_run_instr_rs1, elf_run_instr_rs2); end
        "srl"      : begin wiscv_srl(elf_run_instr_rd, elf_run_instr_rs1, elf_run_instr_rs2); end
        "sra"      : begin wiscv_sra(elf_run_instr_rd, elf_run_instr_rs1, elf_run_instr_rs2); end
        "lb"       : begin wiscv_lb(elf_run_instr_rd, elf_run_instr_rs1, elf_run_instr_imm[11:0]); end 
        "lh"       : begin wiscv_lh(elf_run_instr_rd, elf_run_instr_rs1, elf_run_instr_imm[11:0]); end 
        "lw"       : begin wiscv_lw(elf_run_instr_rd, elf_run_instr_rs1, elf_run_instr_imm[11:0]); end 
        "lbu"      : begin wiscv_lbu(elf_run_instr_rd, elf_run_instr_rs1, elf_run_instr_imm[11:0]); end 
        "lhu"      : begin wiscv_lhu(elf_run_instr_rd, elf_run_instr_rs1, elf_run_instr_imm[11:0]); end
        "sb"       : begin wiscv_sb(elf_run_instr_rs1, elf_run_instr_rs2, elf_run_instr_imm[11:0]); end 
        "sh"       : begin wiscv_sh(elf_run_instr_rs1, elf_run_instr_rs2, elf_run_instr_imm[11:0]); end
        "sw"       : begin wiscv_sw(elf_run_instr_rs1, elf_run_instr_rs2, elf_run_instr_imm[11:0]); end
        "fence"    : begin /*wiscv_fence()*/; end 
        "fence.i"  : begin /*wiscv_fencei();*/ end
        "ecall"    : begin /*wiscv_ecall(); */end
        "ebreak"   : begin /*wiscv_ebreak();*/ end
        "csrrw"    : begin wiscv_csrrw(elf_run_instr_rd, elf_run_instr_rs1, elf_run_instr_imm[11:0]); end
        "csrrs"    : begin wiscv_csrrs(elf_run_instr_rd, elf_run_instr_rs1, elf_run_instr_imm[11:0]); end
        "csrrc"    : begin wiscv_csrrc(elf_run_instr_rd, elf_run_instr_rs1, elf_run_instr_imm[11:0]); end
        "csrrwi"   : begin wiscv_csrrwi(elf_run_instr_rd, elf_run_instr_rs2, elf_run_instr_imm[11:0]); end
        "csrrsi"   : begin wiscv_csrrsi(elf_run_instr_rd, elf_run_instr_rs2, elf_run_instr_imm[11:0]); end
        "csrrci"   : begin wiscv_csrrci(elf_run_instr_rd, elf_run_instr_rs2, elf_run_instr_imm[11:0]); end
        default    : begin end
    endcase
endfunction

//Open ELF Run
initial begin
    //funct_file = $fopen(elf_run_fh, "r");
    instr_funct_name_fh = $fopen(instr_funct_name_fpath, "r");
    instr_pc_fh = $fopen(instr_pc_fpath, "r");
    instr_name_fh = $fopen(instr_name_fpath, "r");
    instr_rs1_fh = $fopen(instr_rs1_fpath, "r");
    instr_rs2_fh = $fopen(instr_rs2_fpath, "r");
    instr_rd_fh = $fopen(instr_rd_fpath, "r");
    instr_imm_fh = $fopen(instr_imm_fpath, "r");
    instr_fh = $fopen(instr_fpath, "r");
    
    //fetch_instruction();
    //execute_instruction();
    //$display("%s", elf_run_instr_funct_name);
    //$display("%s", elf_run_instr_name);
    //$display("%h", elf_run_instr_pc);
    //$display("%d", elf_run_instr_rs1);
    //$display("%d", elf_run_instr_rs2);
    //$display("%d", elf_run_instr_rd);
    //$display("%d", elf_run_instr_imm);
    //$display("%d", (elf_run_instr_name=="auipc"));
end



function void wiscv_lui (input bit[4:0] rd , input bit [31:0] imm);

//tb_gprs[rd] = {imm,12'b0};
tb_gprs[rd] = imm;
tb_next_pc = elf_run_instr_pc + 4 ;
tb_gprs[0] = 0;

//$fwrite(ref_trace_fh,"PC: 0x%x, Instr : %s, RD=0x%x\n", elf_run_instr_pc, elf_run_instr_name, tb_gprs[rd]); 
print_reg_write();
endfunction


function void wiscv_auipc (input bit[4:0] rd , input bit [31:0] imm);

//tb_gprs[rd] = elf_run_instr_pc + {imm,12'b0};
tb_gprs[rd] = elf_run_instr_pc + imm;
tb_next_pc = elf_run_instr_pc + 4 ;
tb_gprs[0] = 0; 
print_reg_write();

endfunction


function void wiscv_jal (input bit[4:0] rd , input bit [31:0] imm); //TODO

tb_gprs[rd] = elf_run_instr_pc + 4 ;
//tb_next_pc = {{11{imm[20]}},imm[20:1],1'b0};
tb_next_pc = elf_run_instr_pc + imm;
tb_gprs[0] = 0; 
print_reg_write();
print_control_transfer_instr(); 

endfunction


function void wiscv_jalr (input bit[4:0] rd , input bit[4:0] rs1 , input bit [31:0] imm); //TODO

tb_gprs[rd] = elf_run_instr_pc + 4 ;
//tb_next_pc = tb_gprs[rs1] + {{20{imm[11]}},imm[11:0]};
tb_next_pc = tb_gprs[rs1] + imm;
tb_gprs[0] = 0; 
print_reg_write();
print_control_transfer_instr(); 

endfunction


function void wiscv_beq ( input bit[4:0] rs1 , input bit[4:0] rs2 , input bit [31:0] imm);

if(tb_gprs[rs1]==tb_gprs[rs2])
  //tb_next_pc = elf_run_instr_pc + {{19{imm[12]}},imm[12:1],1'b0};
  tb_next_pc = elf_run_instr_pc + imm;
else
  tb_next_pc = elf_run_instr_pc + 4 ;
print_control_transfer_instr(); 
endfunction


function void wiscv_bne (input bit[4:0] rs1 , input bit[4:0] rs2 , input bit [31:0] imm);

if(tb_gprs[rs1]!=tb_gprs[rs2])
  //tb_next_pc = elf_run_instr_pc + {{19{imm[12]}},imm[12:1],1'b0};
  tb_next_pc = elf_run_instr_pc + imm;
else
  tb_next_pc = elf_run_instr_pc + 4 ;
print_control_transfer_instr(); 

endfunction


function void wiscv_blt (input bit[4:0] rs1 , input bit[4:0] rs2 , input bit [31:0] imm);

if($signed(tb_gprs[rs1])<$signed(tb_gprs[rs2]))
  //tb_next_pc = elf_run_instr_pc + {{19{imm[12]}},imm[12:1],1'b0};
  tb_next_pc = elf_run_instr_pc + imm;
else
  tb_next_pc = elf_run_instr_pc + 4 ;
print_control_transfer_instr(); 

endfunction


function void wiscv_bge (input bit[4:0] rs1 , input bit[4:0] rs2 , input bit [31:0] imm);

if($signed(tb_gprs[rs1])>=$signed(tb_gprs[rs2]))
  //tb_next_pc = elf_run_instr_pc + {{19{imm[12]}},imm[12:1],1'b0};
  tb_next_pc = elf_run_instr_pc + imm;
else
  tb_next_pc = elf_run_instr_pc + 4 ;
print_control_transfer_instr(); 

endfunction


function void wiscv_bltu (input bit[4:0] rs1 , input bit[4:0] rs2 , input bit [31:0] imm);

if(tb_gprs[rs1]<tb_gprs[rs2])
  //tb_next_pc = elf_run_instr_pc + {{19{imm[12]}},imm[12:1],1'b0};
  tb_next_pc = elf_run_instr_pc + imm;
else
  tb_next_pc = elf_run_instr_pc + 4 ;
print_control_transfer_instr(); 

endfunction


function void wiscv_bgeu (input bit[4:0] rs1 , input bit[4:0] rs2 , input bit [31:0] imm);

if(tb_gprs[rs1]>=tb_gprs[rs2])
  //tb_next_pc = elf_run_instr_pc + {{19{imm[12]}},imm[12:1],1'b0};
  tb_next_pc = elf_run_instr_pc + imm;
else
  tb_next_pc = elf_run_instr_pc + 4 ;
print_control_transfer_instr(); 

endfunction


function void wiscv_lb (input bit[4:0] rd , input bit[4:0] rs1 , input bit[11:0] imm);

address = tb_gprs[rs1] + {{20{imm[11]}},imm[11:0]};
//address = tb_gprs[rs1] + imm;
mem_value = tb_mem[address[14:2]];
temp = (address[1:0] == 2'b11) ? mem_value[31:24] : ( (address[1:0] == 2'b10) ? mem_value[23:16] : ( (address[1:0] == 2'b01) ? mem_value[15:8] : mem_value[7:0]));
tb_gprs[rd] = {{24{temp[7]}},temp[7:0]};
tb_next_pc = elf_run_instr_pc + 4 ;
tb_gprs[0] = 0;  // Handling hardwired Reg 0
print_reg_write();

endfunction


function void wiscv_lh (input bit[4:0] rd , input bit[4:0] rs1 , input bit[11:0] imm);

address = tb_gprs[rs1] + {{20{imm[11]}},imm[11:0]};
//address = tb_gprs[rs1] + imm;
mem_value = tb_mem[address[14:2]];
temp = (address[1] == 1'b1) ? mem_value[31:16] : mem_value[15:0];
tb_gprs[rd] = {{16{temp[15]}},temp[15:0]};
tb_next_pc = elf_run_instr_pc + 4 ;
tb_gprs[0] = 0; 
print_reg_write();

endfunction


function void wiscv_lw (input bit[4:0] rd , input bit[4:0] rs1 , input bit[11:0] imm);

address = tb_gprs[rs1] + {{20{imm[11]}},imm[11:0]};
mem_value = tb_mem[address[14:2]];
tb_gprs[rd] = mem_value;
tb_next_pc = elf_run_instr_pc + 4 ;
tb_gprs[0] = 0; 
print_reg_write();

endfunction


function void wiscv_lbu (input bit[4:0] rd , input bit[4:0] rs1 , input bit[11:0] imm);

address = tb_gprs[rs1] + {{20{imm[11]}},imm[11:0]};
mem_value = tb_mem[address[14:2]];
temp = (address[1:0] == 2'b11) ? mem_value[31:24] : ( (address[1:0] == 2'b10) ? mem_value[23:16] : ( (address[1:0] == 2'b01) ? mem_value[15:8] : mem_value[7:0]));
tb_gprs[rd] = {24'b0,temp[15:0]};
tb_next_pc = elf_run_instr_pc + 4 ;
tb_gprs[0] = 0; 
print_reg_write();

endfunction


function void wiscv_lhu (input bit[4:0] rd , input bit[4:0] rs1 , input bit[11:0] imm);

address = tb_gprs[rs1] + {{20{imm[11]}},imm[11:0]};
mem_value = tb_mem[address[14:2]];
temp = (address[1] == 1'b1) ? mem_value[31:16] : mem_value[15:0];
tb_gprs[rd] = {16'b0,temp[15:0]};
tb_next_pc = elf_run_instr_pc + 4 ;
tb_gprs[0] = 0; 
print_reg_write();

endfunction

function void wiscv_sb (input bit[4:0] rs1 , input bit[4:0] rs2 , input bit[11:0] imm);

address = tb_gprs[rs2] + {{20{imm[11]}},imm[11:0]};
mem_value = tb_mem[address[14:2]];
temp[7:0] = tb_gprs[rs1][7:0];
tb_mem[address[14:2]] = (address[1:0] == 2'b11)? {temp[7:0], 24'h0} : (address[1:0] == 2'b10)? {8'h0, temp[7:0], 16'h0} : (address[1:0] == 2'b01)? {16'h0, temp[7:0], 8'h0} : temp ;
tb_next_pc = elf_run_instr_pc + 4 ;
//$fwrite(ref_trace_fh,"Reg RD index = %d, value = 0x%x\n", rd, tb_gprs[rd]);
print_mem_write();

endfunction

function void wiscv_sh (input bit[4:0] rs1 , input bit[4:0] rs2 , input bit[11:0] imm);

address = tb_gprs[rs2] + {{20{imm[11]}},imm[11:0]};
temp[15:0] = tb_gprs[rs1][15:0];
tb_mem[address[14:2]] = (address[1]) ? {temp[15:0],16'h0} : temp;
tb_next_pc = elf_run_instr_pc + 4 ;
print_mem_write();

endfunction

function void wiscv_sw (input bit[4:0] rs1 , input bit[4:0] rs2 , input bit[11:0] imm);

address = tb_gprs[rs2] + {{20{imm[11]}},imm[11:0]};
tb_mem[address[14:2]] = tb_gprs[rs1];
tb_next_pc = elf_run_instr_pc + 4 ;
print_mem_write();

endfunction

 
//Register Immediate Instructions
// ADDI
function void wiscv_addi(input bit [4:0] rd, input bit [4:0] rs1, input bit [11:0] imm);
tb_gprs[rd] = tb_gprs[rs1] + {{20{imm[11]}},imm[11:0]};
tb_next_pc = elf_run_instr_pc + 4 ;
tb_gprs[0] = 0; 
tb_gprs[0] = 0; 
//$display("pc 0x%x, reg-dst 0x%x, value 0x%x", elf_run_instr_pc, rd, tb_gprs[rd]);
print_reg_write();

endfunction

//SLTI
function void wiscv_slti(input bit [4:0] rd, input bit [4:0] rs1, input bit [11:0] imm);

tb_gprs[rd] = ($signed(tb_gprs[rs1]) < $signed({{20{imm[11]}},imm[11:0]})) ? 1 : 0;
tb_next_pc = elf_run_instr_pc + 4 ;
tb_gprs[0] = 0; 
tb_gprs[0] = 0; 
print_reg_write();

endfunction

//SLTIU
function void wiscv_sltiu(input bit [4:0] rd, input bit [4:0] rs1, input bit [11:0] imm);

tb_gprs[rd] = (tb_gprs[rs1] < {{20{imm[11]}},imm[11:0]}) ? 1 : 0;
tb_next_pc = elf_run_instr_pc + 4 ;
tb_gprs[0] = 0; 
print_reg_write();

endfunction

//XORI
function void wiscv_xori(input bit [4:0] rd, input bit [4:0] rs1, input bit [11:0] imm);

tb_gprs[rd] = tb_gprs[rs1] ^ {{20{imm[11]}},imm[11:0]};
tb_next_pc = elf_run_instr_pc + 4 ;
tb_gprs[0] = 0; 
print_reg_write();

endfunction

//ORI
function void wiscv_ori(input bit [4:0] rd, input bit [4:0] rs1, input bit [11:0] imm);

tb_gprs[rd] = tb_gprs[rs1] | {{20{imm[11]}},imm[11:0]};
tb_next_pc = elf_run_instr_pc + 4 ;
tb_gprs[0] = 0; 
print_reg_write();

endfunction

//ANDI
function void wiscv_andi(input bit [4:0] rd, input bit [4:0] rs1, input bit [11:0] imm);

tb_gprs[rd] = tb_gprs[rs1] & {{20{imm[11]}},imm[11:0]};
tb_next_pc = elf_run_instr_pc + 4 ;
tb_gprs[0] = 0; 
print_reg_write();

endfunction

//SLLI
function void wiscv_slli(input bit [4:0] rd, input bit [4:0] rs1, input bit [4:0] shamt); //shift amount

tb_gprs[rd] = tb_gprs[rs1] << shamt;
tb_next_pc = elf_run_instr_pc + 4 ;
tb_gprs[0] = 0; 
print_reg_write();

endfunction

//SRLI
function void wiscv_srli(input bit [4:0] rd, input bit [4:0] rs1, input bit [4:0] shamt); //shift amount

tb_gprs[rd] = tb_gprs[rs1] >> shamt;
tb_next_pc = elf_run_instr_pc + 4 ;
tb_gprs[0] = 0; 
print_reg_write();

endfunction

//SRAI
function void wiscv_srai(input bit [4:0] rd, input bit [4:0] rs1, input bit [4:0] shamt); //shift amount

tb_gprs[rd] = $signed(tb_gprs[rs1]) >> shamt;
tb_next_pc = elf_run_instr_pc + 4 ;
tb_gprs[0] = 0; 
print_reg_write();

endfunction

//Register Register Instructions
// ADD
function void wiscv_add(input bit [4:0] rd, input bit [4:0] rs1, input bit [4:0] rs2);

tb_gprs[rd] = tb_gprs[rs1] + tb_gprs[rs2];
tb_next_pc = elf_run_instr_pc + 4 ;
tb_gprs[0] = 0; 
print_reg_write();

endfunction

// SUB
function void wiscv_sub(input bit [4:0] rd, input bit [4:0] rs1, input bit [4:0] rs2);

tb_gprs[rd] = tb_gprs[rs1] - tb_gprs[rs2];
tb_next_pc = elf_run_instr_pc + 4 ;
tb_gprs[0] = 0; 
print_reg_write();

endfunction

//SLL
function void wiscv_sll(input bit [4:0] rd, input bit [4:0] rs1, input bit [4:0] rs2); //shift amount

tb_gprs[rd] = tb_gprs[rs1] << tb_gprs[rs2][4:0];
tb_next_pc = elf_run_instr_pc + 4 ;
tb_gprs[0] = 0; 
print_reg_write();

endfunction

//SLT
function void wiscv_slt(input bit [4:0] rd, input bit [4:0] rs1, input bit [4:0] rs2);

tb_gprs[rd] = ($signed(tb_gprs[rs1]) < $signed(tb_gprs[rs2])) ? 1 : 0;
tb_next_pc = elf_run_instr_pc + 4 ;
tb_gprs[0] = 0; 
print_reg_write();

endfunction

//SLTU
function void wiscv_sltu(input bit [4:0] rd, input bit [4:0] rs1, input bit [4:0] rs2);

tb_gprs[rd] = (tb_gprs[rs1] < tb_gprs[rs2]) ? 1 : 0;
tb_next_pc = elf_run_instr_pc + 4 ;
tb_gprs[0] = 0; 
print_reg_write();

endfunction

//XOR
function void wiscv_xor(input bit [4:0] rd, input bit [4:0] rs1, input bit [4:0] rs2);

tb_gprs[rd] = tb_gprs[rs1] ^ tb_gprs[rs2];
tb_next_pc = elf_run_instr_pc + 4 ;
tb_gprs[0] = 0; 
print_reg_write();

endfunction

//SRL
function void wiscv_srl(input bit [4:0] rd, input bit [4:0] rs1, input bit [4:0] rs2); //shift amount

tb_gprs[rd] = tb_gprs[rs1] >> tb_gprs[rs2][4:0];
tb_next_pc = elf_run_instr_pc + 4 ;
tb_gprs[0] = 0; 
print_reg_write();

endfunction

//SRA
function void wiscv_sra(input bit [4:0] rd, input bit [4:0] rs1, input bit [4:0] rs2); //shift amount

tb_gprs[rd] = $signed(tb_gprs[rs1]) >> tb_gprs[rs2][4:0];
tb_next_pc = elf_run_instr_pc + 4 ;
tb_gprs[0] = 0; 
print_reg_write();

endfunction

//OR
function void wiscv_or(input bit [4:0] rd, input bit [4:0] rs1, input bit [4:0] rs2);

tb_gprs[rd] = tb_gprs[rs1] | tb_gprs[rs2];
tb_gprs[0] = 0; 
tb_next_pc = elf_run_instr_pc + 4 ;
print_reg_write();

endfunction

//AND
function void wiscv_and(input bit [4:0] rd, input bit [4:0] rs1, input bit [4:0] rs2);

tb_gprs[rd] = tb_gprs[rs1] & tb_gprs[rs2];
tb_next_pc = elf_run_instr_pc + 4 ;
tb_gprs[0] = 0; 
print_reg_write();

endfunction

function void wiscv_csrrw(input bit [4:0] rd, input bit [4:0] rs1, input bit [11:0] csr);

tb_gprs[rd] = tb_csrs[csr];
tb_csrs[csr] = tb_gprs[rs1];
tb_next_pc = elf_run_instr_pc + 4 ;
tb_gprs[0] = 0; 
print_reg_write();

endfunction

function void wiscv_csrrs(input bit [4:0] rd, input bit [4:0] rs1, input bit [11:0] csr);

tb_gprs[rd] = tb_csrs[csr];
tb_csrs[csr] = tb_csrs[csr] | tb_gprs[rs1] ;
tb_next_pc = elf_run_instr_pc + 4 ;
tb_gprs[0] = 0; 
print_reg_write();

endfunction

function void wiscv_csrrc(input bit [4:0] rd, input bit [4:0] rs1, input bit [11:0] csr);

tb_gprs[rd] = tb_csrs[csr];
tb_csrs[csr] = ~tb_gprs[rs1] & tb_csrs[csr] ;
tb_next_pc = elf_run_instr_pc + 4 ;
tb_gprs[0] = 0; 
print_reg_write();

endfunction

function void wiscv_csrrwi(input bit [4:0] rd, input bit [4:0] zimm, input bit[11:0] csr);

tb_gprs[rd] = tb_csrs[csr];
tb_csrs[csr] = zimm;
tb_next_pc = elf_run_instr_pc + 4 ;
tb_gprs[0] = 0; 
print_reg_write();

endfunction

function void wiscv_csrrsi(input bit [4:0] rd, input bit [4:0] zimm, input bit[11:0] csr);

tb_gprs[rd] = tb_csrs[csr];
tb_csrs[csr] = tb_csrs[csr] | zimm ;
tb_next_pc = elf_run_instr_pc + 4 ;
tb_gprs[0] = 0; 
print_reg_write();

endfunction

function void wiscv_csrrci(input bit [4:0] rd, input bit [4:0] zimm, input bit[11:0] csr);

tb_gprs[rd] = tb_csrs[csr];
tb_csrs[csr] = tb_csrs[csr] & ~zimm ;
tb_next_pc = elf_run_instr_pc + 4 ;
tb_gprs[0] = 0; 
print_reg_write();

endfunction

function void print_reg_write();
    if(PIPELINE_EN)
        $fwrite(ref_trace_fh,"Reg RD index = %d, value = 0x%x\n", elf_run_instr_rd, tb_gprs[elf_run_instr_rd]);
    else
        $fwrite(ref_trace_fh,"PC: 0x%x Reg RD index = %d, value = 0x%x\n", elf_run_instr_pc, elf_run_instr_rd, tb_gprs[elf_run_instr_rd]);
endfunction

function void print_mem_write();
    address_temp = {address[31:2],2'b00}; // Aligned address prints
    if(PIPELINE_EN)
        $fwrite(ref_trace_fh,"Mem write addr = 0x%x, value = 0x%x\n", address_temp, tb_mem[address[14:2]]);
    else 
        $fwrite(ref_trace_fh,"PC: 0x%x Mem write addr = 0x%x, value = 0x%x\n", elf_run_instr_pc, address_temp, tb_mem[address[14:2]]);
endfunction

function void print_control_transfer_instr();
 /*   if(PIPELINE_EN)
        $fwrite(ref_trace_fh,"Branch/Jump Taken = %d, Target PC = 0x%x\n", (tb_next_pc!=elf_run_instr_pc+4), tb_next_pc);
    else
        $fwrite(ref_trace_fh,"PC: 0x%x Branch/Jump Taken = %d, Target PC = 0x%x\n", elf_run_instr_pc, (tb_next_pc!=elf_run_instr_pc+4), tb_next_pc);
*/
        
endfunction

task checker_enable();
   //@(posedge clk);  //write back stage
   //@(posedge clk);  //memory stage
   //fetch_instruction();
   $display("Checking ELF Run golden with test output");
   execute_instruction();
   check_reg_files();
endtask

initial begin
    while(1)  // check only in out of reset case
    begin
        fetch_instruction();
        if(scan_ret0 == 0) 
        begin
            //break;
            $display("INFO : ELF run output trace comparison done");
            $finish;
        end
        if(!NO_DUT) 
        begin 
            if(elf_run_instr_pc == elf_run_instr_pc_old)
            begin
                $display("Reached end of ELF Run output. Ecall Not seen");
            end else begin
                $display("Waiting for instr 0x%h",elf_run_instr_pc);
            end
            fork 
            begin
                wait((resetn) && (elf_run_instr_pc==pc_old) && (pc!=pc_old));
            end 
            begin
                //repeat(32) begin
                repeat(150) begin
                   @(posedge clk);
                end
               //#(30*CLOCK_PERIOD);
               $display("ERROR : Timed out in waiting");
               $finish;
            end
            join_any
            disable fork;
            error_detect = 0; // setting it to 0 for next cycle
            checker_enable();
            if(error_detect) error_count_cycles = error_count_cycles + 1;
        end else begin
            if(tb_mem[elf_run_instr_pc[14:2]] ==32'h73)
            begin
                $display("Ecall seen in REF Trace");
                $finish;
            end
            execute_instruction();
        end
        @(posedge clk);
    end
end

initial begin
   wait(ecall);
   check_mem_files();
   $display("Ecall Seen. Test Existing");
   $finish;
end

//For R0, rd_data probe from design may vary as per designer. Since R0 is hardwired to '0, rd_data being 0 or non zero doesnt impact. Designer can quash within the design before it appears on RF ports.
//For the above reason printing rd_data as 0 always irrespective of zero or non zero
assign rf_rd_data_dut = (rf_rd_addr == 5'h0) ? '0 : rf_rd_data;

//Trace of DUT
always@(posedge clk)
begin
    if(resetn) // out of reset
    begin
        if(rf_wr_en) begin  // can detect load instruction by checking the last cycle mem ready instruction using delayed versions of mem probes. LOADS are included as part of this print
            if(PIPELINE_EN)
                $fwrite(dut_trace_fh,"Reg RD index = %d, value = 0x%x\n", rf_rd_addr, rf_rd_data_dut);
            else
                $fwrite(dut_trace_fh,"PC: 0x%x Reg RD index = %d, value = 0x%x\n", pc, rf_rd_addr, rf_rd_data_dut);
        end
  
        if(mem_en && mem_rd_wr && mem_ready)  // store instruction
        begin
            if(PIPELINE_EN)
                $fwrite(dut_trace_fh,"Mem write addr = 0x%x, value = 0x%x\n", mem_addr, mem_data);
            else
                $fwrite(dut_trace_fh,"PC: 0x%x Mem write addr = 0x%x, value = 0x%x\n", pc, mem_addr, mem_data);
        end
        
        //Branch/Jump Instruction trace - Target PC. Probing branch/jump from Execute stage and printing there itself may cause incorrect order of instruction trace since there may be reg write instruction in mem stage. 
        //If a Mem instruction is in memory stage and caused mem stalls, using delayed versions of branch instruction probes to avoid above problem isnt helpful. 
        if(branch_taken) // Branch instruction 
        begin
           /*if(PIPELINE_EN)
                $fwrite(dut_trace_fh,"Branch/Jump Taken = %d, Target PC = 0x%x\n", branch_taken, target_pc);
            else
                $fwrite(dut_trace_fh,"PC: 0x%x Branch/Jump Taken = %d, Target PC = 0x%x\n", pc, branch_taken, target_pc);*/
        end
    end
end

always@(posedge clk, negedge resetn)
begin
    if(!resetn)
    begin
        cycle_count <= 32'h0;
    end else begin
        cycle_count <= cycle_count + 1;
    end
end 

endinterface
