`timescale 1ns / 1ps

// hard to demonstrate on the board
module switch_debouncer( input RAW, input CLK, output reg CLEAN);
    // internal counter and TC signal
    reg[2:0] counter;
    wire TC;
    
    // reset and increment counter
    always @(posedge CLK) begin
        if(~RAW)
            counter <= 3'b000;
        else
            counter <= counter + 3'b001;
    end
    
    assign TC = (counter==3'b111);
    
    // change output signal
    // when counter reaches max
    always @(posedge CLK) begin
        if(~RAW)    
            CLEAN <= 1'b0;
        else if (TC)
            CLEAN <= 1'b1; 
    end
endmodule
