//DAC v1.1


module top(bit0, bit1, bit2, bit3, bit4);
    output reg bit0;
    output reg bit1;
    output reg bit2;
    output reg bit3;
    output reg bit4;



    reg [4:0] dac_value = 5'b10101;  


    always @(*) begin
        bit0 = dac_value[0];
        bit1 = dac_value[1];
        bit2 = dac_value[2];
        bit3 = dac_value[3];
        bit4 = dac_value[4];
    end


    endmodule

