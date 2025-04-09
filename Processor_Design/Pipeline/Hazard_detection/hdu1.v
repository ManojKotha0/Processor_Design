module HazardDetectionUnit (
    input wire ID_EX_MemRead,         
    input wire [4:0] ID_EX_RegisterRd, 
    input wire [4:0] IF_ID_RegisterRs1,
    input wire [4:0] IF_ID_RegisterRs2, 
    input wire BranchTaken,         

    output reg Stall,     
    output reg PCWrite,     
    output reg IF_ID_Write, 
    output reg Flush       

always @(*) begin
    
    Stall = 0;
    PCWrite = 1;
    IF_ID_Write = 1;
    Flush = 0;

   
    if (ID_EX_MemRead && (ID_EX_RegisterRd == IF_ID_RegisterRs1 || ID_EX_RegisterRd == IF_ID_RegisterRs2)) begin
        Stall = 1;
        PCWrite = 0;
        IF_ID_Write = 0;
    end

    
    if (BranchTaken) begin 
        Flush = 1;
        PCWrite = 1; 
        IF_ID_Write = 1; 
    end
end

endmodule