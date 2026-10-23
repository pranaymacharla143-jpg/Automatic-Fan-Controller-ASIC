`timescale 1ns/1ps
module fan_controller (
    input  wire       clk,
    input  wire       rst,
    input  wire       enable,
    input  wire [7:0] temperature,

    output reg        pwm_out,
    output reg        fan_on,
    output reg        over_temp
);

    // Temperature states
    localparam S_OFF  = 3'd0;
    localparam S_LOW  = 3'd1;
    localparam S_MED  = 3'd2;
    localparam S_HIGH = 3'd3;
    localparam S_FULL = 3'd4;

    reg [2:0] state;
    reg [2:0] next_state;
    reg [7:0] pwm_counter;

    // State register
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            state       <= S_OFF;
            pwm_counter <= 8'd0;
            fan_on      <= 1'b0;
            over_temp   <= 1'b0;
        end
        else if (!enable) begin
            state       <= S_OFF;
            pwm_counter <= 8'd0;
            fan_on      <= 1'b0;
            over_temp   <= 1'b0;
        end
        else begin
            state <= next_state;

            case (next_state)

                S_OFF: begin
                    fan_on    <= 1'b0;
                    over_temp <= 1'b0;
                end

                S_LOW: begin
                    fan_on    <= 1'b1;
                    over_temp <= 1'b0;
                end

                S_MED: begin
                    fan_on    <= 1'b1;
                    over_temp <= 1'b0;
                end

                S_HIGH: begin
                    fan_on    <= 1'b1;
                    over_temp <= 1'b0;
                end

                S_FULL: begin
                    fan_on    <= 1'b1;
                    over_temp <= 1'b1;
                end

                default: begin
                    fan_on    <= 1'b0;
                    over_temp <= 1'b0;
                end

            endcase

            pwm_counter <= pwm_counter + 8'd1;
        end
    end

    // Next-state combinational logic
    always @(*) begin

        case (temperature)

            8'd0  : next_state = S_OFF;

            default: begin
                if (temperature < 8'd25)
                    next_state = S_OFF;
                else if (temperature < 8'd30)
                    next_state = S_LOW;
                else if (temperature < 8'd35)
                    next_state = S_MED;
                else if (temperature < 8'd40)
                    next_state = S_HIGH;
                else
                    next_state = S_FULL;
            end

        endcase

        if (!enable)
            next_state = S_OFF;

    end

    // State-based PWM comparator
    always @(*) begin
        if (!enable || state == S_OFF)
            pwm_out = 1'b0;
        else begin
            case (state)
                S_LOW:  pwm_out = (pwm_counter < 8'd77);
                S_MED:  pwm_out = (pwm_counter < 8'd153);
                S_HIGH: pwm_out = (pwm_counter < 8'd204);
                S_FULL: pwm_out = 1'b1;
                default: pwm_out = 1'b0;
            endcase
        end
    end

endmodule
