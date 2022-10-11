`timescale 1ns / 1ps

module Upcounter_to_4_FND(
    input i_clk,
    input i_reset,
    input i_enable,
    output [3:0] o_digit_select,
    output [7:0] o_FND_value
    );
    wire w_clock_counter_digit, w_clock_counter_10000;
    wire [1:0] w_to_2_4_decoder;
    wire [13:0] w_to_digit_divider; 
    wire [3:0] w_1000, w_100, w_10, w_1;
    wire [3:0] w_mux_to_BCD_to_FND_decoder;

    Clock_divider Clock_divider(
        .i_clk(i_clk),
        .i_reset(i_reset),
        .o_clk(w_clock_counter_digit)
    );

    count_divider count_divider(
        .i_clk(i_clk),
        .i_reset(i_reset),
        .o_clk(w_clock_counter_10000)
    );

    counter_data counter_data(
        .i_clk(w_clock_counter_10000),
        .i_reset(i_reset),
        .o_value(w_to_digit_divider)
    );

    counter_FND counter_FND(
        .i_clk(w_clock_counter_digit),
        .i_reset(i_reset),
        .o_digit_select(w_to_2_4_decoder)
    );

    decoder_2_to_4 decoder_2_to_4(
        .i_digit_select(w_to_2_4_decoder),
        .i_enable(i_enable),
        .o_digit(o_digit_select)
    );

    decoder_BCD_to_FND decoder_BCD_to_FND(
        .i_value(w_mux_to_BCD_to_FND_decoder),
        .i_enable(i_enable),
        .o_FND_value(o_FND_value)
    );

    digit_divider digit_divider(
        .i_value(w_to_digit_divider),
        .o_1000(w_1000), 
        .o_100(w_100), 
        .o_10(w_10), 
        .o_1(w_1)
    );

    MUX_4_to_1 MUX_4_to_1(
    .i_1000(w_1000), 
    .i_100(w_100), 
    .i_10(w_10), 
    .i_1(w_1),
    .i_counter(w_to_2_4_decoder),
    .o_value(w_mux_to_BCD_to_FND_decoder)
    );
endmodule
