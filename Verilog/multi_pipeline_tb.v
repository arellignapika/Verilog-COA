`include "multi_pipeline.v" 

module pipeline_tb; 
    reg [3:0] rs1,rs2,rd; 
    reg clk1, clk2; 
    reg [3:0] func; 
    reg [7:0] addr; 
    wire [15:0] Zout; 
    integer k; 
    
    pipeline uut(Zout, rs1, rs2, rd, func, addr, clk1, clk2);

    initial 
    begin 
        $dumpfile("multi_pipeline.vcd"); 
        $dumpvars(0, pipeline_tb); 
        repeat(20) 
        begin 
            #5 clk1 = 0; clk2 = 1; 
            #5 clk1 = 1; clk2 = 0; 
        end 
    end 

    initial 
    begin 
        for(k=0; k<256; k++) 
        begin 
            uut.regbank[k] = k; 
        end
    end 

    initial 
    begin 
        #5 rs1 = 4'b0010; rs2 = 4'b0011; rd = 4'b0001; 
        func = 4'b0000; addr = 120; 
        #20 rs1 = 4'b0101; rs2 = 4'b0011; rd = 4'b0011; 
        func = 4'b0001; addr = 121; 
        #20; 
    end 
    
    initial 
    begin 
        $monitor("time = %d, F = %d", $time, Zout); 
        #300 $finish; 
    end 
endmodule 


