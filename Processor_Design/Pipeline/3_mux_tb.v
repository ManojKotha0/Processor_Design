module tb_mux3to1;
    reg [63:0] A, B, C;   
    reg [1:0] sel;        
    wire [63:0] out;      

   
    mux3to1 uut (
        .A(A),
        .B(B),
        .C(C),
        .sel(sel),
        .out(out)
    );

    initial begin
       
        A = 64'hAAAAAAAAAAAAAAAA;  
        B = 64'hBBBBBBBBBBBBBBBB;  
        C = 64'hCCCCCCCCCCCCCCCC; 

        
        sel = 2'b00; #10;
        $display("sel = %b, out = %h (Expected: %h)", sel, out, A);
        
        
        sel = 2'b01; #10;
        $display("sel = %b, out = %h (Expected: %h)", sel, out, B);
        
        
        sel = 2'b10; #10;
        $display("sel = %b, out = %h (Expected: %h)", sel, out, C);

        
        sel = 2'b11; #10;
        $display("sel = %b, out = %h (Expected: Undefined or 0)", sel, out);

        
        $finish;
    end

endmodule
