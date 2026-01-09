`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.12.2025 20:13:00
// Design Name: 
// Module Name: eight_bit_arithmetic_logic_unit
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


module eight_bit_arithmetic_logic_unit(a, b, c_in, sel_code, result, c_out);
input [7:0] a;//eight bit inputs
input [7:0] b;
input c_in;
input [3:0] sel_code; //four bit
output reg [7:0] result;
output reg c_out;

always @(a, b, c_in, sel_code)
begin
    if(~sel_code [3]) //msb is used to select mode of the operation
        begin
        case(sel_code[2:0])
            3'b000:{c_out, result} = {1'b0, a}; //Pass A
            3'b001:{c_out, result} = a + b; // addition without carry in 
            3'b010:{c_out, result} = a + b + c_in; //addition with carry
            3'b011:{c_out, result} = a - b; //subtract without borrow
            3'b100:{c_out, result} = a - b - c_in; //subtract with borrow
            3'b101:{c_out, result} = a + 1'b1; //increment
            3'b110:{c_out, result} = a - 1'b1; //decrement
            3'b111:{c_out, result} = {1'b0, b}; // Pass B
            default:{c_out, result} = 9'b0_0000_0000; 
        endcase
        end
    else
        begin
            case(sel_code[2:0])
            3'b000:{c_out, result} = {1'b0, (a & b)};
            3'b001:{c_out, result} = {1'b0, (a | b)};
            3'b010:{c_out, result} = {1'b0, (a ^ b)};
            3'b011:{c_out, result} = {1'b0, (~a)};
            3'b100:{c_out, result} = {1'b0, (a << 1)}; // multiply by 2
            3'b101:{c_out, result} = {1'b0, (a >> 1)}; //divide by 2
            3'b110:{c_out, result} = {1'b0,{a[6:0], a[7]}}; //rotate left
            3'b111:{c_out, result} = {1'b0,{a[0], a[7:1]}}; //rotate right
            default:{c_out, result} = 9'b0_0000_0000; 
            endcase
        end
 end
endmodule
