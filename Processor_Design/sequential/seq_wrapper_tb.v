`timescale 1ns/1ps

module processor_tb;
    reg clk;
    
    processor uut (
        .clk(clk)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end


    initial begin
        $dumpfile("sequen.vcd");
        $dumpvars(0,processor_tb);
        #1000;
        $finish;
    end
        always @(posedge clk) begin
            $display("\n%-8s | %-4s | %-12s | %-6s | %-8s | %-4s | %-6s | %-6s | %-10s | %-10s | %-10s | %-10s | %-10s", 
                    "Time", "PC", "Current Instr", "Branch", "ALU_ctrl", "zero", "new_PC", "imm64", "Write_Data", "rs2" , "rs1", "ALU_result", "final_write_data"
            );

            
            $monitor("%-8t | %-4d | %-12h | %-6b | %-8b | %-4b | %-6d | %-6d | %-10d | %-10d | %-10d | %-10d | %-10d", 
                    $time, 
                    uut.PC, 
                    uut.current_instruction,
                    uut.Branch, 
                    uut.ALUCtrl,
                    uut.zero,
                    uut.new_PC, 
                    uut.imm64, 
                    uut.write_data,
                    uut.rs2,
                    uut.rs1,
                    uut.ALU_result,
                    uut.final_write_data
            );

            

            
            $display("\nFinal Register File State:");
            $display("x5  = %-4d", uut.register.registers[5]);
            $display("x8  = %-4d", uut.register.registers[8]);
            // $display("x4 = %-4d", uut.register.registers[1]);
            // $display("x5 = %-4d", uut.register.registers[28]);
            // $display("x6 = %-4d", uut.register.registers[29]);
            // $display("x7 = %-4d", uut.register.registers[30]);
            // $display("x8 = %-4d", uut.register.registers[31]);
            // $display("x4 = %-4d", uut.register.registers[4]);
            // $display("x3 = %-4d", uut.register.registers[3]);

            
            $display("\nData Memory at Address 17:");
            $display("mem[17] = %h", {uut.data.memory[17]});
        end
        




endmodule
