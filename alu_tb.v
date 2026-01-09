`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.01.2026 11:48:49
// Design Name: 
// Module Name: alu_tb
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


module alu_tb;
reg [7:0] a;
reg [7:0] b;
reg c_in;
reg [3:0] sel_code;
wire [7:0] result;
wire c_out;

eight_bit_arithmetic_logic_unit uut(a, b, c_in, sel_code, result, c_out);
initial
begin
    c_in = 1'b0;
    sel_code = 4'd0; a = 8'd1; b = 8'd0; #10 //pass A
    sel_code = 4'd1; a = 8'd2; b = 8'd1; #10 //adddition without c_in
    sel_code = 4'd2; a = 8'd2; b = 8'd5; #10 //addition with c_in
    sel_code = 4'd3; a = 8'd7; b = 8'd4; #10 //subtract without borrow
    sel_code = 4'd4; a = 8'd2; b = 8'd1; #10 //subtract with borrow
    sel_code = 4'd5; a = 8'd76;  #10 //increment by 1
    sel_code = 4'd6; a = 8'd48; #10 //decrement by 1
    sel_code = 4'd7; b = 8'd100; #10//pass B
    sel_code = 4'd8; a = 8'd1; b = 8'd0; #10 // a & b
    sel_code = 4'd9; a = 8'd1; b = 8'd1; #10//or
    sel_code = 4'd10; a = 8'd0; b = 8'd1; #10//xor
    sel_code = 4'd11; a = 8'd1; b = 8'd0;#10//not a
    sel_code = 4'd12; a = 8'd2; b = 8'd0; #10// multiply by 2
    sel_code = 4'd13; a = 8'd4; b = 8'd0; #10// divide by 2
    sel_code = 4'd14; a = 8'd7; b = 8'd0; #10// rotate left 
    sel_code = 4'd15; a = 8'd7; b = 8'd0; #10// rotate right
    $finish;
end
endmodule