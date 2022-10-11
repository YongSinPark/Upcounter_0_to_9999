`timescale 1ns / 1ps

module count_divider(
    input i_clk,
    input i_reset,
    output o_clk
    );
    // 10Hz = 50_000_000
    reg r_clk;
    reg [31:0] r_counter = 0;
    assign o_clk = r_clk;

    always @(posedge i_clk, posedge i_reset) begin
        if(i_reset) begin
            r_counter <= 0;
            r_clk <= 0;
        end
        else begin
            if(r_counter == 5_000_000 - 1) begin
                r_counter <= 0;
                r_clk = ~r_clk;
            end
            else begin
                r_counter <= r_counter + 1;
            end 
        end
    end

endmodule
