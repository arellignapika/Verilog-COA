`include "pipeline.v" 

module pipeline_tb; 
    parameter a=10; 
    wire [a-1:0] F; 
    reg [a-1:0] A, B, C, D; 
    reg clk; pipeline uut(F, A, B, C, D, clk); 
    initial clk=0; 

    always #5 clk = ~clk; 
    initial 
    begin 
        $dumpfile("pipeline.vcd"); 
        $dumpvars(0, pipeline_tb); 
        #5; A = 10; B = 20; C = 6; D = 3; 
        #15; A = 3; B = 24; C = 6; D = 35; 
        #30; A = 19; B = 12; C = 16; D = 13; 
        #45; A = 14; B = 7; C = 20; D = 34; #65; A = 8; B = 2; C = 26; D = 33; 
    end 

    initial 
    begin 
        $monitor("Time = %d, F = %d", $time, F); 
        #3000; $finish; 
    end 
endmodule 
