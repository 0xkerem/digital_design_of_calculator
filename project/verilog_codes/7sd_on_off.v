module on_of(
  input [6:0] n,
  input reset,
  output reg [6:0] out
);

  // Initialize output to 0000000
  always @(reset) begin
    if (reset == 1'b1) begin
      out <= 7'b0000000;
    end
  end

  // Pass input to output when reset is not active
  always @(n) begin
    if (reset == 1'b0) begin
      out <= n;
    end
  end

endmodule
