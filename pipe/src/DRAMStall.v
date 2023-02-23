/* $Author: karu $ */
/* $LastChangedDate: 2009-03-04 23:09:45 -0600 (Wed, 04 Mar 2009) $ */
/* $Rev: 45 $ */
/* Revised 04/22 2:22pm */
/* Modified by KARL JOHN WALLINGER and SAMUEL LAWRENCE WASMUNDT 04/19/2011 */
/* To make similar to cache interface */
//////////////////////////////////////
//
// Memory -- stalling single cycle version
//
// written for CS/ECE 552, Spring '06
// Andy Phelps, 25 Jan 2006
//
// Added reading seed from command line args
// all mem is intialized to zero first
// 
// This is a byte-addressable,
// 16-bit wide, 64K-byte memory that allows aligned accesses only.
//
// This module produces a "ready" signal;
// if "ready" is not asserted, the read
// or write did not take place.
//
// Reads happen combinationally with zero delay in cycles that ready is high.
// Writes occur on rising clock edge in cycles that ready is high.
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
module DRAMStall (DataOut, Done, Stall, CacheHit, err, Addr, DataIn, Rd, Wr, createdump, clk, rst);

   output wire [31:0] DataOut;
   output wire        Done;
   output wire        Stall;
   output wire        CacheHit;
   input wire [31:0]  DataIn;
   input wire [15:0]  Addr;
   input wire         Wr;
   input wire         Rd;
   input wire         createdump;
   input wire         clk;
   input wire         rst;
   output wire        err;

   localparam DEPTH = 8192;
   reg [31:0]      mem [0:DEPTH-1];
   reg            loaded;
   reg [16:0]     largest;
   reg [31:0]     rand_pat;

   wire           ready;

   integer        mcd;
   integer        i;

   assign         ready = (Wr|Rd) ?  rand_pat[0] : 1'b1; 
   assign         Stall = (Wr|Rd) & ~rand_pat[0];
   assign         err = ready & |Addr[1:0]; //word aligned; non 4 multiple address is invalid
   assign         Done = ready;
   assign         DataOut = 
                            ((ready & (~Wr))? {mem[Addr[14:2]]}: 0);
   assign         CacheHit = 1'b0;

   integer        seed;
   
   initial begin
      loaded = 0;
      largest = 0;
//      rand_pat = 32'b01010010011000101001111000001010;
      seed = 10;
      //$value$plusargs("seed=%d", seed);
      $display("Using seed %d", seed);
      rand_pat = $random(seed);
      $display("rand_pat=%08x %32b", rand_pat, rand_pat);
      // initialize memories to 0 first
      for (i=0; i<=65535; i=i+1) begin
         mem[i] = 8'd0;
      end 
         
   end

   always @(posedge clk) begin
      if (rst) begin
        /* if (!loaded) begin
            $readmemh("loadfile_all.img", mem);
            loaded = 1;
         end*/
      end
      else begin
         if (ready & Wr & ~err) begin
            mem[Addr[14:2]] = DataIn;       // The actual write
            if ({1'b0, Addr} > largest) largest = Addr;  // avoid negative numbers
         end
         if (createdump) begin
            mcd = $fopen("dumpfile");
            for (i=0; i<=largest; i=i+1) begin
               $fdisplay(mcd,"%4h %8h", i, mem[i]);
            end
            $fclose(mcd);
         end
         rand_pat = (rand_pat >> 1) | (rand_pat[0] << 31);
      end
   end


endmodule
`default_nettype wire
// DUMMY LINE FOR REV CONTROL :0:
