`timescale 1ns / 1ps

module mealy_machine_tb;
    // Inputs
    reg P1,P2;
    reg clk;
    reg reset;
    // Outputs
    wire z;
    // Instantiate the Unit Under Test (UUT)
    mealy_machine uut (
        .P1(P1), 
        .P2(P2),
        .clk(clk), 
        .reset(reset), 
        .z(z)
    );

initial
    begin
        clk = 1'b0;
        reset = 1'b1;
        #15 reset = 1'b0;
    end

always #5 clk = ~ clk;  

initial begin
        #10 P2 = 0; P1 = 1;
        #10 P2 = 1; P1 = 0;
        #10 P2 = 1; P1 = 0;
        #10 P2 = 0; P1 = 1;
        #10 $finish;
    end
    
    endmodule
