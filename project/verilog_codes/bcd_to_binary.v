module bcd_to_binary (
  input [15:0] bcd_input,
  output reg [15:0] binary_output
);

  // Temporary variables
  reg [3:0] first_place;
  reg [3:0] second_place;
  reg [3:0] third_place;
  reg [3:0] fourth_place;

  always @* begin
    // Extract the ones and tens places of each BCD digit
    first_place  = bcd_input[3:0];
    second_place = bcd_input[7:4];
    third_place  = bcd_input[11:8];
    fourth_place = bcd_input[15:12];

    // Convert BCD to binary representation
    binary_output = first_place + second_place * 10 + third_place * 100 + fourth_place * 1000;
  end

endmodule
