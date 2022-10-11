`timescale 1ns / 1ps

module decoder_BCD_to_FND(
    input [3:0] i_value,
    input i_enable,
    output [7:0] o_FND_value
    );
    reg [7:0] r_FND_value;
    assign o_FND_value = r_FND_value;

    always @(i_value, i_enable) begin
        if(i_enable) begin
            r_FND_value = 8'hff;
        end
        else begin
            case(i_value) 
                4'h0 : r_FND_value = 8'hc0;
                4'h1 : r_FND_value = 8'hf9;
                4'h2 : r_FND_value = 8'ha4;
                4'h3 : r_FND_value = 8'hb0;
                4'h4 : r_FND_value = 8'h99;
                4'h5 : r_FND_value = 8'h92;
                4'h6 : r_FND_value = 8'h82;
                4'h7 : r_FND_value = 8'hf8;
                4'h8 : r_FND_value = 8'h80;
                4'h9 : r_FND_value = 8'h90;
                4'ha : r_FND_value = 8'h7f;
                default : r_FND_value = 8'hff;
            endcase
        end
    end
endmodule