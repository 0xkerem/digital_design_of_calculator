module flag (
  output reg [3:0] a,
  output reg [3:0] b,
  output reg en_a,
  output reg en_b,
  output reg en2,
  input flag,
  input enable,
  input [3:0] number,
  input reset,
  input [6:0] da,
  input [6:0] db
);
  always @ (reset)
    begin
      en_a <= 1'b1;
      en_b <= 1'b1;
      a <= 4'b0000;
      b <= 4'b0000;
      en2 <= 1'b0;
      #10
      en_a <= 1'b0;
      en_b <= 1'b0;

    end

  always @ (number, enable)
    begin
      case (flag)
        1'b0:
          begin
            if ((da == 7'b1111110) || (da == 7'b0000000)) begin
              if (number == 4'b1111) begin
                a <= 4'b0000;
              end else begin
                a <= number;
              end
              en_a <= enable;
            end
          end
        1'b1:
          begin
            if ((db == 7'b1111110) || (db == 7'b0000000)) begin
              en2 <= 1'b1;
              if (number == 4'b1111) begin
                b <= 4'b0000;
              end else begin
                b <= number;
              end
              en_b <= enable;
            end
          end
        default:
          begin
            en_a <= 1'b0;
            en_b <= 1'b0;

          end
      endcase
    end
endmodule