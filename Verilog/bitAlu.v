// Code for Four Bit ALU
module bitAlu(A,B,sel,alu_out);
input [3:0]A,B;
input [2:0]sel;
output reg[3:0]alu_out;
always @(*)
    begin
        case (sel)
            3'b000: alu_out = 0;
            3'b001: alu_out = A<<1;
            3'b010: alu_out = B<<1;
            3'b011: alu_out = ~A^~B;
            3'b100: alu_out = A&~B;
            3'b101: alu_out = A|B;
            3'b110: alu_out = ~A+B;
            3'b111: alu_out = 1;
            default: alu_out=0;
        endcase
    end
endmodule
