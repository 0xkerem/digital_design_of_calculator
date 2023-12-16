module binary_to_bcd (
  input [15:0] in,
  output reg [15:0] out
);
   
  integer i;
   
  always @(in) begin
    out = 0;
    for (i = 0; i < 16; i = i + 1) begin  // Iterate once for each bit in input number
      if (out[3:0] >= 5) out[3:0] = out[3:0] + 3; // If any out digit is >= 5, add three
      if (out[7:4] >= 5) out[7:4] = out[7:4] + 3;
      if (out[11:8] >= 5) out[11:8] = out[11:8] + 3;
      if (out[15:12] >= 5) out[15:12] = out[15:12] + 3;
      out = {out[14:0], in[15 - i]};  // Shift one bit, and shift in proper bit from input
    end
  end  
endmodule
