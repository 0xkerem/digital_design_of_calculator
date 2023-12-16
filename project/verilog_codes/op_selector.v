module op_selector (
  input [31:0] a_in,
  input [15:0] s_in,
  input [63:0] m_in,
  input [31:0] d_in,

  input a_er,
  input m_er,
  input d_er,

  input a,
  input s,
  input m,
  input d,

  input reset,  // Reset input

  output reg enable,
  output reg [15:0] abs_out, // Output representing absolute value
  output reg err,
  output reg neg  // Output indicating negative value
);

  reg signed [15:0] signed_out;

  always @* begin
    if (reset) begin
      // Reset all outputs and internal registers
      signed_out <= 16'b0;
      err <= 1'b0;
      neg <= 1'b0;
      abs_out <= 16'b0;
      enable <= 1'b0;
    end else begin
      case ({a, s, m, d})
        4'b1000: begin
          signed_out <= $signed(a_in[15:0]);
          err <= a_er;
          enable <= 1'b1;
          if (a_er) begin
            enable <= 1'b0;
          end
        end
        4'b0100: begin
          signed_out <= $signed(s_in);
          enable <= 1'b1;
          err <= 1'b0;
        end
        4'b0010: begin
          signed_out <= $signed(m_in[15:0]);
          err <= m_er;
          enable <= 1'b1;
          if (m_er) begin
            enable <= 1'b0;
          end
        end
        4'b0001: begin
          signed_out <= $signed(d_in[15:0]);
          err <= d_er;
          enable <= 1'b1;
          if (d_er) begin
            enable <= 1'b0;
          end
        end
      endcase
      
      if (signed_out < 0) begin  // Check if output is negative
        neg <= 1'b1;  // Set neg signal to indicate negative output
        abs_out <= -signed_out; // Output absolute value if negative
      end else begin
        neg <= 1'b0;  // Output is positive, set neg signal to 0
        abs_out <= signed_out; // Output positive value directly
      end
    end
  end

endmodule
