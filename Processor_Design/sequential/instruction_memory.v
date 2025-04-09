module instruction_memory (
    //input clk,
    input [63:0] PC,     
    output reg [31:0] instruction
);
    reg [7:0] memory [0:1023];


    initial begin
     memory[0] = 8'h63;
      memory[1] = 8'h8C;
      memory[2] = 8'h20;
      memory[3] = 8'h00;
      memory[4] = 8'hB3;
      memory[5] = 8'h82;
      memory[6] = 8'h41;
      memory[7] = 8'h00;
      memory[8] = 8'hB3;
      memory[9] = 8'h01;
      memory[10] = 8'h02;
      memory[11] = 8'h00;
      memory[12] = 8'h33;
      memory[13] = 8'h82;
      memory[14] = 8'h02;
      memory[15] = 8'h00;
      memory[16] = 8'h33;
      memory[17] = 8'h01;
      memory[18] = 8'h71;
      memory[19] = 8'h00;
      memory[20] = 8'h63;
      memory[21] = 8'h0B;
      memory[22] = 8'h00;
      memory[23] = 8'hFE;
      memory[48] = 8'h7F;
      memory[49] = 8'h00;
      memory[50] = 8'h00;
      memory[51] = 8'h00;
        
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