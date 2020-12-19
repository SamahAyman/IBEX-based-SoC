// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0

// Example clock gating module for yosys synthesis

module prim_clock_gating (
  input  clk_i,
  input  en_i,
  input  test_en_i,
  output clk_o
);
 assign en_latch = en_i | test_en_i;
 sky130_fd_sc_hd__dlclkp_1 clk_gate (
    .GCLK(clk_o),
    .GATE(en_latch),
    .CLK(clk_i)
 );
 // always @* begin
 //   if (!clk_i) begin
//     en_latch = en_i | test_en_i;
//   end
// end
// assign clk_o = en_latch & clk_i;
endmodule

