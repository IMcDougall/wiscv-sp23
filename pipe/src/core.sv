
module core (

input i_clk,                                        // clock to the design
input i_rst,                                        // Reset to the design : Active High

//I -cache interface
input [31 : 0] i_instr,                               // Instruction word
input i_icache_done,                                  // Icache Done. No Need to worry for DRAMIdeal
output o_instr_mem_rd,                                // Instruction Mem Read. Tie to 1'b1 for simplicity.
output [31 : 0] o_instr_mem_addr,                     // 32 bit Instruction address

//D-cache interface
input [31 : 0] i_data_mem_out,                        // Data read from Data Memory
input i_dcache_done,                                  // Dcache Done. No Need to worry for DRAMIdeal
output [31 : 0] o_data_mem_addr,                      // Data Mem address
output o_data_mem_en,                                 // Data Mem Enable
output o_data_mem_rd_wr,                              // Data Mem Read Write Strobe, 1'b0 : Read strobe, 1'b1 Write Strobe
output [31 : 0] o_data_mem_in,                        // Data written to Data Memory

//Ecall   - Indicate end of the code
output o_ecall                                        // Ecall taken from Writeback stage in case of pipe design. Without this all tests fail
 

);


/* Include your code here. Instantiate fetch  : u_fetch_stage, decode : u_decode_stage, execute : u_execute_stage, memory : u_memory_stage, write_back : u_write_back_stage, register_file : u_register_file modules with given instance names */

endmodule
