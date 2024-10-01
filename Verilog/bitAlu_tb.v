// Include the operator file
`include "bitAlu.v"
module bitAlu_tb;
reg [3:0] a,b;
reg [2:0]op;
wire [3:0]out;
bitAlu a1(a,b,op,out);
    initial begin
        // Declaring dumpfile name
        $dumpfile("test_FBA.vcd");
        $dumpvars(0,bitAlu_tb);
            op = 3'b000;a=4'b0001;b=4'b0010;
            #1;
            op = 3'b001;a=4'b0001;b=4'b0010;
            #5;
            op = 3'b010;a=4'b0111;b=4'b0010;
            #10;
            op = 3'b011;a=4'b0110;b=4'b0011;
            #20;
            op = 3'b011;a=4'b0011;b=4'b0010;
            #50;
            op = 3'b010;a=4'b0011;b=4'b0010;
            #70;
        #100 $finish;
    end

endmodule
