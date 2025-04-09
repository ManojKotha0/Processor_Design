module mux3to1 (
    input wire [63:0] A,   
    input wire [63:0] B,   
    input wire [63:0] C,   
    input wire [1:0] sel,    
    output reg [63:0] out    
);

always @(*) begin
    case (sel)
        2'b00: out = A;  
        2'b01: out = B;  
        2'b10: out = C; 
        default: out = 63'b0;  
    endcase
end

endmodule
