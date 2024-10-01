module cyclic_lamp(clock, light);

input clock;

output reg[0:2] light;  // light is avector
parameter s0=2'b00,51=2'b01,52=2'b10;  // parameter decleration as constant
parameter RED=3'b100,GREEN=3'b010,YELLOW=3'b001;
reg(0:1) state;//state as two bit variable
reg[0:25] count=0;

reg clock out;

always @( posedge clock)
begin
count<=count+1;
if (count==50000000)
begin count<=0;
clock_out = ~clock_out;
end
end

always @(posedge clock_out)
case (state)
s0: state<=s1;
sl: state<=s2;
s2: state<=s0;
default: state<=s0;
endcase

always @(state)
case(state)
s0: light=RED;
s1: light=GREEN;
s2: light=YELLOW;
default light=RED;
endcase
endmodule