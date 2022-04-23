`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/23/2022 11:45:38 AM
// Design Name: 
// Module Name: square_demo
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


module square_demo(
    input logic [10:0] x, y,
    input logic [1:0] sq_size,
    input logic [11:0] sq_color,
    output logic [11:0] sq_rgb      
    );
    
    logic [3:0] r, g, b;
    //square size
    logic [7:0] sq = (2**sq_size) * 16;
    
    always_comb
    begin
        //make the square
        if((y > (240 - sq)) && (y < (240 + sq))) 
            begin
                //fill square with user input color
                if((x > (320 - sq)) && (x < (320 + sq)))
                    sq_rgb = sq_color;
                //fill in cross that forms with complment
                if((x < (320 - sq)) || (x > (320 + sq)))
                    sq_rgb = ~sq_color;
            end
        //fill in the rest with complment
        else 
         sq_rgb = ~sq_color;
    end   
endmodule
