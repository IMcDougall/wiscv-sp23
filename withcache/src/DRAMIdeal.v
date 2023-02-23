/* $Author: karu $ */
/* $LastChangedDate: 2009-03-04 23:09:45 -0600 (Wed, 04 Mar 2009) $ */
/* $Rev: 45 $ */
//////////////////////////////////////
//
// Memory -- single cycle version
//
// written for CS/ECE 552, Spring '07
// Pratap Ramamurthy, 19 Mar 2007
// revised by David Wood, 1 May 2007
// Modified by Matt Sinclair 3/5/22
// Added default_nettype and appropriate missing wire/reg declarations
//
// This is a byte-addressable,
// 16-bit wide, 64K-byte memory that supports aligned accesses only.
//
// All reads happen combinationally with zero delay.
// All writes occur on rising clock edge.
// Concurrent read and write not allowed.
//
// On reset, memory loads from file "loadfile_all.img".
// (You may change the name of the file in
// the $readmemh statement below.)
// File format:
//     @0
//     <hex data 0>
//     <hex data 1>
//     ...etc
//
// If input "createdump" is true on rising clock,
// contents of memory will be dumped to
// file "dumpfile", from location 0 up through
// the highest location modified by a write.
//
//
//////////////////////////////////////

`default_nettype none
module DRAMIdeal (data_out, data_in, addr, enable, wr, createdump, clk, rst, err);

    output wire  [31:0] data_out;
    input wire   [31:0] data_in;
    input wire   [15:0] addr;
    input wire          enable;
    input wire          wr;
    input wire          createdump;
    input wire          clk;
    input wire          rst;
    output wire         err;
       
   localparam DEPTH = 8192;
    reg     [31:0] mem [0:DEPTH-1];
    reg            loaded;
    reg     [16:0] largest;

    integer        mcd;
    integer        i;

//    assign data_temp_0 = mem[addr];
//    assign data_temp_2 = mem[{addr+8'h1];
    assign err = enable & (|addr[1:0]); //word aligned; non 4 multiple address is invalid

    // unaligned access returns nearest aligned
    assign data_out = 
                      ((enable & (~wr))? mem[addr[14:2]]: 0);

    initial begin
       loaded = 0;
       largest = 0;
       for (i=0; i<=DEPTH-1; i=i+1) begin
          mem[i] = 32'h0;
       end          
    end

    always @(posedge clk) begin
      if (rst) begin
        /*if (!loaded) begin
          $readmemh("loadfile_all.img", mem);
          loaded = 1;
        end*/
      end
      else begin
        if (enable & wr & (~(|addr[1:0]))) begin // No writing word unaligned addresses
           mem[addr[14:2]] = data_in;       // The actual write
           if ({1'b0, addr} > largest) largest = addr;  // avoid negative numbers
        end
        if (createdump) begin
          mcd = $fopen("dumpfile", "w");
          for (i=0; i<=largest+1; i=i+1) begin
            $fdisplay(mcd,"%4h %8h", i, mem[i]);
          end
          $fclose(mcd);
        end
      end
    end

endmodule
`default_nettype wire
// DUMMY LINE FOR REV CONTROL :0:
