`include "booth_multiplier.v" 

module booth_multiplier_tb; 
    reg [3:0] X;
    reg [3:0] Y;
    wire [7:0] Z; 
 
    BoothMultiplier uut (X, Y, Z);
    initial
    begin 
        $dumpfile("booth_multiplier.vcd"); 
        $dumpvars(0, booth_multiplier_tb); 
        X=0; Y=0; #20;  
        X=5; Y=7; #50; 
        $display("Z = ", Z);
        X=7; Y=3; #50;
        $display("Z = ", Z);
    end
endmodule 
