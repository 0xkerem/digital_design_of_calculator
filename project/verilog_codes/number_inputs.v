module number_inputs (
  output reg [3:0] out,
  output reg enable,
  input [9:0] inp,
  input reset
);

  always @ (reset)
    begin
      out <= 4'b0000;
      enable <= 1'b0;
    end

  always @ (inp)
    begin
      enable <= 1'b1;
      case (inp)
        16'b0000000000000001: // if the input is 0, special behavior for 0
          out <= 4'b1111;
        16'b0000000000000010: // if the input is 1
          out <= 4'b0001;
        16'b0000000000000100: // if the input is 2
          out <= 4'b0010;
        16'b0000000000001000: // if the input is 3
          out <= 4'b0011;
        16'b0000000000010000: // if the input is 4
          out <= 4'b0100;
        16'b0000000000100000: // if the input is 5
          out <= 4'b0101;
        16'b0000000001000000: // if the input is 6
          out <= 4'b0110;
        16'b0000000010000000: // if theinput is 7
          out <= 4'b0111;
        16'b0000000100000000: // if the input is 8
          out <= 4'b1000;
        16'b0000001000000000: // if the input is 9
          out <= 4'b1001;
        default:
          enable <= 1'b0;
      endcase
    end

endmodule
