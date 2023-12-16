module reset (
  output reg [3:0] o,
  input r,
  input [3:0] n
);

  always @ (r)
    begin
      o <= 4'b0000;
    end

  always @ (n)
    begin
      o <= n;
    end

endmodule