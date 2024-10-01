`include "multiplication_datapath.v" 

module datapath_controller_tb; 
    reg [15:0] data_in; 
    reg clk, Start; 
    wire Done; 

    multiplication_datapath DP(LdA,LdB,LdP,ClrP,DecB,eqz,clk,data_in); 
    controller CON(LdA,LdB,LdP,ClrP,DecB,eqz,clk,Done,Start); 
    initial 
    begin 
        clk=1'b0; #3 
        Start =1'b1; 
    end 
    always #5 clk=~clk; 
    initial 
    begin 
        data_in =17; #10 
        data_in =5; 
    end 
    initial 
    begin 
        $monitor($time, "%d %b", DP.Y,Done); 
        $dumpfile("multiplication_datapath.vcd");  
        $dumpvars(0,datapath_controller_tb); 
        #500 $finish; 
    end 
endmodule 
