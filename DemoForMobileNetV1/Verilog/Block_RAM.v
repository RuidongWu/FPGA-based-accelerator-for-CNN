`timescale 1ns / 1ps


module Block_RAM (
addr0,
ce0,
q0,
addr1,
ce1,
d1,
q1,
we1,
clk
);

parameter DWIDTH = 32;
parameter AWIDTH = 9;
parameter MEM_SIZE = 512;

input[AWIDTH-1:0] addr0;
input ce0;
output reg[DWIDTH-1:0] q0;
input[AWIDTH-1:0] addr1;
input ce1;
input[DWIDTH-1:0] d1;
output reg[DWIDTH-1:0] q1;
input we1;
input clk;

(* ram_style = "block" *)reg [DWIDTH-1:0] ram[0:MEM_SIZE-1];




always @(posedge clk)  
begin 
    if (ce0) 
    begin
        q0 <= ram[addr0];
    end
end


always @(posedge clk)  
begin 
    if (ce1) 
    begin
        if (we1) 
        begin 
            ram[addr1] <= d1; 
        end
        else
        begin
            q1 <= ram[addr1];
        end
    end
end

endmodule
