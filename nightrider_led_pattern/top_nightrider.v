// nightrider LED pattern with buttons to toggle speed
// v1.5
/* module */
module top (hwclk, reset, led1, led2, led3, led4, led5, led6, led7, led8, upButton, downButton);
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

	input upButton; 
	input downButton;


    /* State register */
    reg [4:0] state = 5'b00000; // Increase state register size

    /* Counter register */
    reg [31:0] counter = 32'b0; 

	/* Speed register */
	reg [31:0] speedCounter = 32'b0; 



    /* always */
	always @(posedge hwclk or posedge reset) begin
		if (reset) begin
			speedCounter <= 32'b00000000000100000000000000000000; 
		end else begin
			if (~upButton) begin
				speedCounter <= speedCounter + 1;
			end

			else if (~downButton) begin
				speedCounter <= speedCounter - 1;
			end
		end
	end      
    


    always @(posedge hwclk or posedge reset) begin
        if (reset) begin
            counter <= 32'b0;
        end else begin
			 if (counter <= speedCounter) begin
            	counter <= counter + 1;
			 end

			 else if (counter > speedCounter) begin
			 	counter <= 32'b0;
				state <= state + 1;
				if(state == 13) state <= 0; // Reset state after reaching 16
			 end
			 
        end
    end


//    always @(posedge counter[20] or posedge reset) begin
//        if (reset) begin
//            state <= 5'b00000;
//       end else begin
//            state <= state + 1;
//        end
//    end


    /* LED drivers */

	always @(*) begin

	case (state)
		5'b00000: {led1, led2, led3, led4, led5, led6, led7, led8} = 8'b10000000;
            5'b00001: {led1, led2, led3, led4, led5, led6, led7, led8} = 8'b01000000;
            5'b00010: {led1, led2, led3, led4, led5, led6, led7, led8} = 8'b00100000;
            5'b00011: {led1, led2, led3, led4, led5, led6, led7, led8} = 8'b00010000;
            5'b00100: {led1, led2, led3, led4, led5, led6, led7, led8} = 8'b00001000;
            5'b00101: {led1, led2, led3, led4, led5, led6, led7, led8} = 8'b00000100;
            5'b00110: {led1, led2, led3, led4, led5, led6, led7, led8} = 8'b00000010;
            5'b00111: {led1, led2, led3, led4, led5, led6, led7, led8} = 8'b00000001;

            // Reverse direction
            5'b01000: {led1, led2, led3, led4, led5, led6, led7, led8} = 8'b00000010;
            5'b01001: {led1, led2, led3, led4, led5, led6, led7, led8} = 8'b00000100;
            5'b01010: {led1, led2, led3, led4, led5, led6, led7, led8} = 8'b00001000;
            5'b01011: {led1, led2, led3, led4, led5, led6, led7, led8} = 8'b00010000;
            5'b01100: {led1, led2, led3, led4, led5, led6, led7, led8} = 8'b00100000;
            5'b01101: {led1, led2, led3, led4, led5, led6, led7, led8} = 8'b01000000;
	endcase

		//led1 <= speedCounter[18];
		//led2 <= speedCounter[19];
		//led3 <= speedCounter[20];
		//led4 <= speedCounter[21];
		//led5 <= speedCounter[22];
		//led6 <= speedCounter[23];
		//led7 <= speedCounter[24];
		//led8 <= speedCounter[25];
	
	end

endmodule	







