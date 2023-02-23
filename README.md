# wiscv-sp23

RISCV based inorder 5 stage processor + cache design project. 

The project has the following hierarchy
             
             1.nopipe/src -> Implement unpipelined design here
             2.pipe/src -> Implement 5 stage pipelined design here
             3.withcache/src -> Implement cache system and integrate pipelined processor designed above + cache system
             
Each of the above design folders has the following hierarchy. 

            1. proc.sv -> Top Level Design Module. Contains instruction, data memory instances and the core.
            2. core.sv -> Implement the processor design in this file
  
  
Environment :
          Add RISCV toolchain to your PATH variable. Add the following command in .bashrc/.bashrc.local
          
                    export PATH=$PATH:/p/vertical/projects/552RISCV/riscv_toolchain_install/bin

TB Environment is located in ./tb directory. To run any testcase.

             1. cd tb
             2. make all PROG=<program name> MODE=<pipe,nopipe,nodut> MEM_MODE=<fixed,variable> RUN_DIR=<directory where simulation run files are created>
             
             MODE = nopipe -> picks design files from nopipe/src directory
             MODE = pipe -> picks design files from pipe/src directory
             MODE = nodut -> Runs in NO DUT mode. That is instructions are executed every cycle by the test bench simulator and Reg/Mem Trace is created
             
             MEM_MODE = fixed -> Runs the design in 1 cycle latency memory model. Reads happens immediately. Writes take 1 cycle
             MEM_MODE = variable -> Runs the design in variable latency memory model. Both Reads, Writes are of variable latency. 
             The design has to look in */src/core.sv at i_icache_done signal for Instruction Memory, i_dcache_done signal for Data Memory acknowlegments.
 
 TRACES : 
          Each of the test run creates traces for the designer to assist in debug.
          
          1. MODE=pipe -> Creates REF.pTrace, DUT.pTrace (p stand for pipelining)
          2. MODE=nopipe -> Creates REF.Trace, DUT.Trace
          3. MODE=nodut -> Created REF.Trace
          
          REF Trace : Reference/Golden Trace from the testbench simulator. 
          DUT Trace : Trace Captured from the design using probes in tb/dut_probes.sv.
          
 
             
