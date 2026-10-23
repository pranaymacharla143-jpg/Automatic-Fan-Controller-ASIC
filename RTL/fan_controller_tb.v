`timescale 1ns/1ps

module fan_controller_tb;

    reg clk;
    reg rst;
    reg enable;
    reg [7:0] temperature;

    wire pwm_out;
    wire fan_on;
    wire over_temp;

    integer passed = 0;

    fan_controller uut (
        .clk(clk),
        .rst(rst),
        .enable(enable),
        .temperature(temperature),
        .pwm_out(pwm_out),
        .fan_on(fan_on),
        .over_temp(over_temp)
    );

    always #5 clk = ~clk;

    task check_mode;
        input [7:0] temp;
        input [7:0] expected_duty;
        input expected_fan;
        input expected_over;
        begin
            @(negedge clk);
            temperature = temp;
            enable = 1'b1;

            repeat (2) @(posedge clk);
            #1;

            if (
                fan_on !== expected_fan ||
                over_temp !== expected_over) begin
                $display("FAIL: T=%0d duty=%0d fan=%b over=%b",
                         temp, expected_duty, fan_on, over_temp);
                $fatal(1, "Temperature mode mismatch");
            end

            if (pwm_out !==
                ((expected_duty == 8'd255) ? 1'b1 :
                 (expected_duty != 8'd0 &&
                  uut.pwm_counter < expected_duty))) begin
                $fatal(1, "PWM comparator mismatch at T=%0d", temp);
            end

            passed = passed + 1;
            $display("PASS: T=%0d duty=%0d fan=%b over=%b",
                     temp, expected_duty, fan_on, over_temp);
        end
    endtask

    // Verify one complete 256-count PWM period.
    task check_pwm_period;
        input [7:0] temp;
        input integer expected_high;
        integer high_count;
        integer i;
        begin
            @(negedge clk);
            rst = 1'b1;
            enable = 1'b0;
            #1;
            @(negedge clk);
            rst = 1'b0;
            enable = 1'b1;
            temperature = temp;

            // Allow the selected state to register.
            repeat (2) @(negedge clk);

            // Wait until the 8-bit counter wraps to zero.
            while (uut.pwm_counter !== 8'd0)
                @(negedge clk);

            high_count = 0;
            for (i = 0; i < 256; i = i + 1) begin
                #1;
                if (pwm_out === 1'b1)
                    high_count = high_count + 1;
                @(negedge clk);
            end

            if (high_count != expected_high) begin
                $display("FAIL: PWM period T=%0d expected=%0d actual=%0d",
                         temp, expected_high, high_count);
                $fatal(1, "PWM full-period check failed");
            end

            passed = passed + 1;
            $display("PASS: full PWM period T=%0d HIGH counts=%0d",
                     temp, high_count);
        end
    endtask

    initial begin
        $dumpfile("sim/fan_controller.vcd");
        $dumpvars(0, fan_controller_tb);

        clk = 0;
        rst = 1;
        enable = 0;
        temperature = 0;

        #2;
        if (fan_on !== 0 || over_temp !== 0 ||
            uut.state !== 3'd0 || uut.pwm_counter !== 0)
            $fatal(1, "Asynchronous reset check failed");

        @(negedge clk);
        rst = 0;

        check_mode(8'd20,  8'd0,   1'b0, 1'b0);
        check_mode(8'd24,  8'd0,   1'b0, 1'b0);
        check_mode(8'd25,  8'd77,  1'b1, 1'b0);
        check_mode(8'd29,  8'd77,  1'b1, 1'b0);
        check_mode(8'd30,  8'd153, 1'b1, 1'b0);
        check_mode(8'd34,  8'd153, 1'b1, 1'b0);
        check_mode(8'd35,  8'd204, 1'b1, 1'b0);
        check_mode(8'd39,  8'd204, 1'b1, 1'b0);
        check_mode(8'd40,  8'd255, 1'b1, 1'b1);
        check_mode(8'd42,  8'd255, 1'b1, 1'b1);
        check_mode(8'd0,   8'd0,   1'b0, 1'b0);

        // Full 256-count PWM period verification
        check_pwm_period(8'd20,  0);
        check_pwm_period(8'd25,  77);
        check_pwm_period(8'd30,  153);
        check_pwm_period(8'd35,  204);
        check_pwm_period(8'd40,  256);

        @(negedge clk);
        enable = 0;
        repeat (1) @(posedge clk);
        #1;

        if (fan_on !== 0 || over_temp !== 0 || uut.state !== 3'd0 ||
            pwm_out !== 0)
            $fatal(1, "Disable check failed");

        passed = passed + 1;
        $display("PASS: disable behavior");

        @(negedge clk);
        rst = 1;
        #1;

        if (fan_on !== 0 || over_temp !== 0 ||
            uut.state !== 3'd0 || uut.pwm_counter !== 0)
            $fatal(1, "Reset check failed");

        passed = passed + 1;
        $display("PASS: asynchronous reset");

        $display("\nRESULT: %0d checks passed.", passed);
        $finish;
    end

endmodule
