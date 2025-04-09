module register_file (
    //input wire clk,                  
    //input wire RegWrite,          
    input wire [4:0] read_reg1,      
    input wire [4:0] read_reg2,      
    //input wire [4:0] write_reg,      
    //input wire [63:0] write_data,    
    output wire [63:0] read_data1,   
    output wire [63:0] read_data2    
);
    reg signed [63:0] registers [31:0];
        initial begin   
    registers[0]  = 64'd0;
      registers[1]  = 64'd5;//n=5
      registers[2]  = 64'd2; //i=2
      registers[3]  = 64'd0;// fib(1)
      registers[4]  = 64'd1;//fib(2)
      registers[5]  = 64'd0;//result
      registers[6]  = 64'd0;
      registers[7]  = 64'd1;
      registers[8]  = 64'd0;
      registers[9]  = 64'd9;
      registers[10] = 64'd10;
      registers[11] = 64'd0;
      registers[12] = 64'd0;
      registers[13] = 64'd0;
      registers[14] = 64'd0;
      registers[15] = 64'd0;
      registers[16] = 64'd0;
      registers[17] = 64'd0;
      registers[18] = 64'd0;
      registers[19] = 64'd0;
      registers[20] = 64'd0;
      registers[21] = 64'd0;
      registers[22] = 64'd0;
      registers[23] = 64'd0;
      registers[24] = 64'd0;
      registers[25] = 64'd0;
      registers[26] = 64'd0;
      registers[27] = 64'd0;
      registers[28] = 64'd0;
      registers[29] = 64'd0;
      registers[30] = 64'd0;
      registers[31] = 64'd0;
        end 

        // always @(posedge clk) begin
        //     if (RegWrite && write_reg != 5'b00000) begin
        //         registers[write_reg] <= write_data; // Write to register on clock edge
        //     end
        // end 
         
        assign read_data1 = registers[read_reg1];  
        assign read_data2 = registers[read_reg2];  
        
endmodule
