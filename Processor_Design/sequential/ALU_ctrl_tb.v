`timescale 1ns / 1ps

module alu_control_tb;
    
    reg [1:0] ALUOp;
    reg [3:0] funct;
    wire [3:0] ALUCtrl;
    
    alu_control uut (
        .ALUOp(ALUOp),
        .funct(funct),
        .ALUCtrl(ALUCtrl)
    );
    
    initial begin
        $dumpfile("alu_ctrl.vcd");
        $dumpvars(0,alu_control_tb);
        $monitor("Time = %0t | ALUOp = %b | funct = %b | ALUCtrl = %b", $time, ALUOp, funct, ALUCtrl);
        
        // Load/Store
        ALUOp = 2'b00;
        funct = 4'b0000;
        #10;
        
        // Branch
        ALUOp = 2'b01;
        funct = 4'b0000;
        #10;
        
        //ADD
        ALUOp = 2'b10;
        funct = 4'b0000;
        #10;
        
        // SUB
        ALUOp = 2'b10;
        funct = 4'b1000;
        #10;
        
        // AND 
        ALUOp = 2'b10;
        funct = 4'b0111;
        #10;
        
        // OR
        ALUOp = 2'b10;
        funct = 4'b0110;
        #10;
        

        ALUOp = 2'b11;
        funct = 4'b1111;
        #10;
        
        $finish;
    end

endmodule