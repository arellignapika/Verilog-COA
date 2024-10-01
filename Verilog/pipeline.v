module pipeline(F, A, B, C, D, clk); 
    parameter a=10; 
    input [a-1:0] A, B, C, D; 
    input clk; 
    output [a-1:0] F; 
    reg [a-1:0] L12_X1, L12_X2, L12_D, L23_X3, L23_D, L34_F; 

    assign F = L34_F; 
    always @ (posedge clk) 
    begin 
        L12_X1 = A+B; 
        L12_X2 = C-D; 
        L12_D = D; 
        L23_X3 = L12_X1 + L12_X2; 
        L23_D = D; 
        L34_F = L23_X3 * L23_D; 
    end 
endmodule 
