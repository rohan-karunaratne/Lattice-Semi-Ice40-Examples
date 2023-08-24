// v1.6 sends back +1 char
/* module */
module top (hwclk, reset, led1, led2, led3, led4, led5, led6, led7, led8, upButton, downButton, rx_data, tx_data, edge_detect, sampling, start_edge, baud_rate_cycle);
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

    input rx_data;
    output reg tx_data;
    output reg edge_detect;
    output reg sampling;
    output reg start_edge;

    output reg baud_rate_cycle;


    reg [4:0] led_state = 5'b00000; 
    reg [31:0] counter = 32'b0; 
	reg [31:0] speedCounter = 32'b0; 
    reg [31:0] counter2;
    reg rx_data_dly;
    reg rx_data_dly_dly;
    reg [7:0] received_byte;
    reg [3:0] bit_index;
    reg [31:0] counter_baud_rate;
    reg [31:0] counter_idle;
    reg [23:0] counter_sq_wave;

    parameter IDLE = 2'b00, START = 2'b01, SAMPLE = 2'b10;
    parameter WAITING = 1'b0, LISTENING = 1'b1;
    reg [1:0] uart_state;
    reg holding;


    parameter SYS_FREQ = 11900000;
    parameter DESIRED_BAUD_RATE = 9600;
    parameter BAUD_RATE = SYS_FREQ / DESIRED_BAUD_RATE;


    reg [3:0] transmission_state;
    parameter CASE_ZERO = 4'b0000, CASE_ONE = 4'b0001, CASE_TWO = 4'b0010, CASE_THREE = 4'b0011, CASE_FOUR = 4'b0100, CASE_FIVE = 4'b0101, CASE_SIX = 4'b0110, CASE_SEVEN = 4'b0111, CASE_EIGHT = 4'b1000, 
              CASE_NINE = 4'b1001, CASE_TEN = 4'b1010, CASE_ELEVEN = 4'b1011, CASE_TWELVE = 4'b1100, CASE_THIRTEEN = 4'b1101, CASE_FOURTEEN = 4'b1110, CASE_FIFTEEN = 4'b1111;

    reg transmit_byte_ready;
    reg [7:0] transmit_byte;

    reg byte_ready;

    reg [3:0] byte_state;

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
				led_state <= led_state + 1;
				if(led_state == 13) led_state <= 0;
			 end
			 
        end
    end


    /* LED drivers */
	always @(*) begin

	case (led_state)
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
	
	end


always @(posedge hwclk or posedge reset) begin
    if (reset) begin
        rx_data_dly <= 1'b0;
        rx_data_dly_dly <= 1'b0;
        counter2 <= 0;
        //tx_data <= 1'b0;
        edge_detect <= 1'b0;
    end 
    else begin
        rx_data_dly <= rx_data;
        rx_data_dly_dly <= rx_data_dly;
        //tx_data <= rx_data_dly_dly;

        if(rx_data_dly == 1'b0 && rx_data_dly_dly == 1'b1) begin
            edge_detect <= 1'b1;
        end
        else begin
            edge_detect <= 1'b0;
        end
    end
end



always @(posedge hwclk or posedge reset) begin
    if (reset) begin
        counter_baud_rate <= 0;
    end 
    else if (start_edge) begin
        counter_baud_rate <= 0;
    end
    else begin
        counter_baud_rate <= counter_baud_rate + 1;  
    end
end

 

always @(posedge hwclk or posedge reset) begin
    if (reset) begin
        uart_state <= IDLE;
        received_byte <= 0;
        bit_index <= 0;
        sampling <= 0;
    end
    else begin
        case(uart_state)
            IDLE: begin
                sampling <= 0;
                byte_ready <= 0;
                if(start_edge) begin
                    uart_state <= START;
                end
            end
            START: begin
                if(counter_baud_rate == (BAUD_RATE / 2)) begin
                    if (rx_data == 0) begin //check to make sure that data is low, and that we were not triggered on glitch
                        uart_state <= SAMPLE;
                        sampling <= 1;
                    end

                    else begin
                        uart_state <= IDLE;
                    end

                end
            end
            SAMPLE: begin
                if(counter_baud_rate % BAUD_RATE == (BAUD_RATE / 2)) begin
                    received_byte[bit_index] <= rx_data;
                    sampling <= !sampling;
                    bit_index <= bit_index + 1;
                    if(bit_index == 8) begin
                        uart_state <= IDLE;
                        bit_index <= 0; 
                        byte_ready <= 1;
                    end
                end
            end
        endcase
    end
end





always @(posedge hwclk or posedge reset) begin
    if (reset) begin
        counter_idle <= 0;
        start_edge <= 0;
        holding <= WAITING;
    end
    else begin
        case(holding)
            WAITING: begin
                start_edge <= 0; //comment to show listening period
                if(rx_data) begin
                    counter_idle <= counter_idle + 1;
                end
                else begin
                    counter_idle <= 0;
                end
                if(counter_idle >= BAUD_RATE * 10) begin
//                    start_edge <= 0; //uncomment to show listening period
                    holding <= LISTENING;
                    counter_idle <= 0;
                end
            end
            LISTENING: begin
                if(edge_detect) begin
                    start_edge <= 1;
                    holding <= WAITING;
                end
                else begin
                    start_edge <= 0;
                end
            end
        endcase
    end
end

//transmit baud rate counter
always @(posedge hwclk) begin
    if (counter_sq_wave >= BAUD_RATE) begin
        baud_rate_cycle <= 1;
        counter_sq_wave <= 0;
    end else begin
        counter_sq_wave <= counter_sq_wave + 1;
        baud_rate_cycle <= 0;
    end
end


always @(posedge hwclk or posedge reset) begin
    if (reset) begin
        transmit_byte_ready <= 1;
        transmit_byte <= 01000010;
        transmission_state <= CASE_ZERO;
    end
    else begin
        transmit_byte_ready <= 1;
        transmit_byte <= received_byte + 1;
        case(byte_state)
            CASE_ZERO: begin
                if (byte_ready) begin
                    byte_state <= CASE_ONE;
                end
            end
            CASE_ONE: begin
                if (baud_rate_cycle) begin
                    case(transmission_state)
                        CASE_ZERO: begin
                            if (transmit_byte_ready) begin
                                transmission_state <= CASE_ONE;
                            end else begin
                                tx_data <= 1;
                            end

                        end
                        CASE_ONE: begin
                            tx_data <= 0;
                            transmission_state <= CASE_TWO;
                        end
                        CASE_TWO: begin
                            tx_data <= transmit_byte[0];
                            transmission_state <= CASE_THREE;
                        end
                        CASE_THREE: begin
                            tx_data <= transmit_byte[1];
                            transmission_state <= CASE_FOUR;
                        end
                        CASE_FOUR: begin
                            tx_data <= transmit_byte[2];
                            transmission_state <= CASE_FIVE;
                        end
                        CASE_FIVE: begin
                            tx_data <= transmit_byte[3];
                            transmission_state <= CASE_SIX;
                        end
                        CASE_SIX: begin
                            tx_data <= transmit_byte[4];
                            transmission_state <= CASE_SEVEN;
                        end
                        CASE_SEVEN: begin
                            tx_data <= transmit_byte[5];
                            transmission_state <= CASE_EIGHT;
                        end
                        CASE_EIGHT: begin
                            tx_data <= transmit_byte[6];
                            transmission_state <= CASE_NINE;
                        end
                        CASE_NINE: begin
                            tx_data <= transmit_byte[7];
                            transmission_state <= CASE_TEN;
                        end
                        CASE_TEN: begin
                            tx_data <= 0;
                            transmission_state <= CASE_ELEVEN;
                        end
                        CASE_ELEVEN: begin
                            tx_data <= 1;
                            transmission_state <= CASE_TWELVE;
                        end
                        CASE_TWELVE: begin
                            tx_data <= 1;
                            transmission_state <= CASE_THIRTEEN;
                        end
                        CASE_THIRTEEN: begin
                            tx_data <= 1;
                            transmission_state <= CASE_FOURTEEN;
                        end
                        CASE_FOURTEEN: begin
                            tx_data <= 1;
                            transmission_state <= CASE_FIFTEEN;
                        end
                        CASE_FIFTEEN: begin
                            tx_data <= 1;
                            transmission_state <= CASE_ZERO;
                            byte_state <= CASE_ZERO;
                        end

                    endcase
                end
            end
        endcase
    end
end


endmodule	