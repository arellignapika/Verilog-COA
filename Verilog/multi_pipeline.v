module pipeline(Zout,rs1,rs2,rd,func,addr,Clock1,Clock2); 
    input[3:0] rs1,rs2,rd; 
    input Clock1,Clock2; 
    input[3:0] func; 
    input[7:0] addr; 
    output [15:0] Zout; 
    reg[15:0] L12_A,L12_B,L23_Z,L34_Z; 
    reg[7:0] L12_addr,L23_addr,L34_addr; 
    reg[3:0] L12_func,L12_rd,L23_rd; 
    reg[15:0] regbank[15:0]; 
    reg[15:0] membank[255:0]; 

    assign Zout=L34_Z; 
    always @(posedge Clock1) 
    begin 
        L12_A<= #2 regbank[rs1]; 
        L12_B<=#2 regbank[rs2]; 
        L12_func<=#2 func; 
        L12_rd<=#2 rd; L12_addr<=#2 addr; 
    end 
    always @(posedge Clock2) 
    begin 
        case(func) 
            0: L23_Z<= #2 L12_A+L12_B; 
            1: L23_Z<= #2 L12_A-L12_B; 
            2: L23_Z<= #2 L12_A*L12_B; 
            3: L23_Z<= #2 L12_A; 
            4: L23_Z<= #2 L12_B; 
            5: L23_Z<= #2 L12_A&L12_B; 
            6: L23_Z<= #2 L12_A|L12_B; 
            7: L23_Z<= #2 L12_A^L12_B; 
            8: L23_Z<= #2 ~L12_A; 
            9: L23_Z<= #2 ~L12_B; 
            10: L23_Z<=L12_A>>1; 11: L23_Z<=L12_B<<1; 
            default: L23_Z<=16'hxxxx; 
        endcase 
        L23_rd<=#2 L12_rd; L23_addr<=#2 L12_addr; 
    end always @(posedge Clock1) 
    begin 
        regbank[L23_rd]<=#2 L23_Z; 
        L34_Z<=#2 L23_Z; L34_addr=#2 L23_addr; 
    end 
    always @ (posedge Clock2) 
    begin 
        membank[L34_addr]= #2 L34_Z; 
    end 
endmodule 
