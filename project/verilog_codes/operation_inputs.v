module operation_inputs (
  output reg a,
  output reg s,
  output reg m,
  output reg d,
  input [3:0] inp,
  input reset
);

  reg flag; // Internal signal to control operations

  always @ (reset) begin
    a <= 1'b0;
    s <= 1'b0;
    m <= 1'b0;
    d <= 1'b0;
    flag <= 1'b0; // Initialize flag
  end

  always @ (inp) begin
    if (flag == 1'b0) begin
      case (inp)
        4'b0001: // Addition
          begin
            a <= 1'b1;
            s <= 1'b0;
            m <= 1'b0;
            d <= 1'b0;
            flag <= 1'b1;
          end
        4'b0010: // Subtraction
          begin
            a <= 1'b0;
            s <= 1'b1;
            m <= 1'b0;
            d <= 1'b0;
            flag <= 1'b1;
          end
        4'b0100: // Multiplication
          begin
            a <= 1'b0;
            s <= 1'b0;
            m <= 1'b1;
            d <= 1'b0;
            flag <= 1'b1;
          end
        4'b1000: // Division
          begin
            a <= 1'b0;
            s <= 1'b0;
            m <= 1'b0;
            d <= 1'b1;
            flag <= 1'b1;
          end
      endcase
    end
  end
endmodule
