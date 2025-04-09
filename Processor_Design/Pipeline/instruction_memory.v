module instruction_memory (
    input [63:0] PC,     
    output reg [31:0] instruction
);
reg [7:0] memory [0:1023];


initial begin
    memory[0] = 8'h63;
    memory[1] = 8'h8F;
    memory[2] = 8'h51;
    memory[3] = 8'h00;
    memory[4] = 8'hB3;
    memory[5] = 8'h81;
    memory[6] = 8'h20;
    memory[7] = 8'h00;
    memory[8] = 8'hB3;
    memory[9] = 8'h82;
    memory[10] = 8'h41;
    memory[11] = 8'h00;
    memory[12] = 8'h7F;
    memory[13] = 8'h00;
    memory[14] = 8'h00;
    memory[15] = 8'h00;
    memory[60] = 8'h33;
    memory[61] = 8'h85;
    memory[62] = 8'hA4;
    memory[63] = 8'h40;
    memory[64] = 8'h00;
    memory[65] = 8'h00;
    memory[66] = 8'h00;
    memory[67] = 8'h00;
    memory[68] = 8'h00;
    memory[69] = 8'h00;
    memory[70] = 8'h00;
    memory[71] = 8'h00;
    memory[72] = 8'h00;
    memory[73] = 8'h00;
    memory[74] = 8'h00;
    memory[75] = 8'h00;
    memory[76] = 8'h7F;
    memory[77] = 8'h00;
    memory[78] = 8'h00;
    memory[79] = 8'h00;

    
end

wire [63:0] A1,A2,A3;
wire overflow1,overflow2,overflow3;

Cla64bit add1(
    .A(PC),
    .B(64'd1),
    .Sum(A1),
    .overflow(overflow1)
);
Cla64bit add2(
    .A(PC),
    .B(64'd2),
    .Sum(A2),
    .overflow(overflow2)
);
Cla64bit add3(
    .A(PC),
    .B(64'd3),
    .Sum(A3),
    .overflow(overflow3)
);


always @(*) begin
    instruction = {memory[A3], memory[A2], memory[A1], memory[PC]};
end
endmodule