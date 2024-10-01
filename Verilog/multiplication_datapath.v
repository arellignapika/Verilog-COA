module multiplication_datapath(LdA,LdB,LdP,ClrP,DecB,eqz,clk,data_in); 
    input LdA,LdB,LdP,ClrP,DecB,clk; 
    output eqz; 
    input[15:0] data_in; 
    wire[15:0] X,Y,Z,Bout; 

    PIPO1 A (X,LdA,data_in,clk); 
    PIPO2 P(Y,ClrP,LdP,Z,clk); 
    CNTR B (LdB,DecB,Bout,data_in,clk); 
    Add AD(Z,X,Y); EQZ comp(Bout,eqz); 
endmodule 

module PIPO1 (dout,LdA,din,clk); 
    input [15:0] din; 
    input LdA,clk; 
    output reg [15:0] dout; 

    always @(posedge clk) 
    if (LdA) dout<=din; 
endmodule 

module PIPO2 (dout,ClrP,LdP,din,clk); 
    input [15:0] din; 
    output reg [15:0] dout; 
    input LdP,clk,ClrP; 
    always @(posedge clk) 
    if (ClrP) dout<=16'b0; 
    else 
    if (LdP) dout<=din; 
endmodule 

module Add (out,in1,in2); 
    input [15:0] in1,in2; 
    output reg [15:0] out; 
    always @(*) out=in1+in2; 
endmodule 

module EQZ(Bout,eqz); 
    input[15:0] Bout; 
    output eqz; 
    assign eqz=(Bout==0); 
endmodule 

module CNTR(LdB,DecB,dout,din,clk); 
    input[15:0] din; 
    output reg [15:0] dout; 
    input LdB,clk,DecB; 
    always @(posedge clk) 
    if (DecB) dout<=dout-1; 
    else 
    if(LdB) dout<=din; 
endmodule 
