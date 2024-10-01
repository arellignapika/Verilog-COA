// include the operator file
`include "OneBitAlu.v"
module OneBitAlu_tb;  // test bench
reg A;
reg B;
reg [1:0] sel;  // selection line
wire out;
// calling the file
OneBitAlu OBA(A,B,sel,out);
initial begin
    // Declaring dumpfile name
    $dumpfile("test_OBA.vcd");
    $dumpvars(0,OneBitAlu_tb);
    sel = 2'b00; A = 1'b1; B = 1'b0;
    #1;
    sel = 2'b11; A = 1'b0; B = 1'b0;
    #5;
    sel = 2'b10; A = 1'b0; B = 1'b1;
    #10;
    sel = 2'b01; A = 1'b1; B = 1'b0;
    #20;
    sel = 2'b11; A = 1'b1; B = 1'b0;
    #30;
    $finish;
end
endmodule