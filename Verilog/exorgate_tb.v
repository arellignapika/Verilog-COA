module exorgate_tb;
reg a;
reg b;
wire c;
exorgate exor (
.a_i(a),
.b_i(b), 
.c_o(c)
);
initial begin
$dumpfile("test_exor.vcd");
$dumpvars(0,exorgate_tb);
#1 a = 1'b0;
#2 b = 1'b1;
#5 a = 1'b1;
#10 b = 1'b0;
#20 a = 1'b0;
#30 b = 1'b1;
#50 a = 1'b1;
#70 b = 1'b0;
#100 $finish;
end

endmodule;