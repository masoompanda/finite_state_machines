`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.09.2020 21:29:01
// Design Name: 
// Module Name: testbench
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
module testbench;
reg clk,reset;
wire [2:0]lightA,lightB;

traffic_light dut(clk,reset,lightA,lightB);

initial clk=1;
always #(500000000) clk=~clk;

initial begin
reset=1'b0;
#1000000000;

reset=1'b1;
#100000000;

reset=1'b0;
end
endmodule
