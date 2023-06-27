// reading encoder and counting up/down
// v1.1
/* module */
module top (hwclk, reset, led1, led2, led3, led4, led5, led6, led7, led8, A, B);
    /* I/O */
    input hwclk; 
    input reset; 

    output reg led1; 
    output reg led2; 
    output reg led3; 
    output reg led4; 
    output reg led5; 
    output reg led6; 
    output reg led7; 
    output reg led8;

	input A; 
	input B;

    /* State register */
    reg [4:0] state = 5'b00000; // Increase state register size

    /* Counter register */
    reg [31:0] counter = 32'b0; 
    reg error  = 1'b0;
    reg [3:0] encoderState = 4'b0;


    always @ (posedge hwclk) begin
        case (encoderState)
            // 00 prior state
            4'b0000: begin
                counter <= counter + 0; // +0
                error <= 0;
            end
            4'b0001: begin
                counter <= counter - 1; // -1
                error <= 0;
            end
            4'b0010: begin
                counter <= counter + 1; // +1
                error <= 0;
            end
            4'b0011: begin // error
                counter <= counter;
                error <= 1;
            end

            // 01 prior state
            4'b0100: begin
                counter <= counter + 1; // +1
                error <= 0;
            end
            4'b0101: begin
                counter <= counter + 0; // +0
                error <= 0;
            end
            4'b0110: begin // error
                counter <= counter;
                error <= 1;
            end
            4'b0111: begin
                counter <= counter - 1; // -1
                error <= 0;
            end

            // 10 prior state
            4'b1000: begin
                counter <= counter - 1; // -1
                error <= 0;
            end
            4'b1001: begin // error
                counter <= counter;
                error <= 1;
            end
            4'b1010: begin
                counter <= counter + 0; // +0
                error <= 0;
            end
            4'b1011: begin
                counter <= counter + 1; // +1
                error <= 0;
            end

            //11 prior state
            4'b1100: begin // error
                counter <= counter;
                error <= 1;
            end
            4'b1101: begin
                counter <= counter + 1; // +1
                error <= 0;
            end
            4'b1110: begin
                counter <= counter - 1; // -1
                error <= 0;
            end
            4'b1111: begin
                counter <= counter + 0; // +0
                error <= 0;
            end
        endcase
    end


    always @(posedge hwclk or posedge reset) begin
        if (reset) begin
            encoderState[0] <= A;
            encoderState[1] <= B;
            encoderState[2] <= A;
            encoderState[3] <= B;
   
        end else if (hwclk) begin
            encoderState[0] <= A;
            encoderState[1] <= B;
            encoderState[2] <= encoderState[0];
            encoderState[3] <= encoderState[1];
        end

    end


    /* LED drivers */
	always @(*) begin

		led1 <= counter[0];
		led2 <= counter[1];
		led3 <= counter[2];
		led4 <= counter[3];
		led5 <= counter[4];
		led6 <= counter[5];
		led7 <= counter[6];
		led8 <= error;

	end
endmodule	



//Logic: 
//old:new 0000, +0
//old:new 0001, -1
//old:new 0010, +1
//old:new 0011, error

//old:new 0100, +1
//old:new 0101, +0
//old:new 0110, error
//old:new 0111, -1

//old:new 1000, -1
//old:new 1001, error
//old:new 1010, +0
//old:new 1011, +1

//old:new 1100, error
//old:new 1101, +1
//old:new 1110, -1
//old:new 1111, +0