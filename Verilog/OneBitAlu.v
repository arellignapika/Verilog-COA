// Code for One Bit ALU
// module is like A function
module OneBitAlu (A,B,sel,out);
input A,B;
input [1:0] sel;
output reg out; // selection line
always @(*)
    begin
        case(sel) 
        2'b00: out = A^B;
        2'b01: out = A|B;
        2'b10: out = A&B;
        2'b11: out = ~A|~B;
        default: out = 0;
        endcase
    end
endmodule