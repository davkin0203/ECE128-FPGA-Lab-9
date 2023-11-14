`timescale 1ns / 1ps

module mealy_machine(
input P1,P2,clk,reset,  //P1-to represent -1, P2-to represent-0
output reg z
);

parameter S0 = 0 , S1 = 1 , S2 = 2 , S3 = 3 ;
reg [1:0] PS,NS ;

    always@(posedge clk or posedge reset)
        begin
            if(reset)
                PS <= S0;   
            else    
                PS <= NS ;
        end             

    always@(PS or P1 or P2)
        begin 
            case(PS)
              S0 : begin 
                            z = 0 ;
                            if (P1)
                                   NS = S1;
                            else 
	                             NS = S0;
                            end
                S1 : begin 
                        if (P2)
                            NS = S2;
                        else 
                            NS = S1;
                        end
                        
                S2 : begin 
                    if (P1)
                        NS = S3;
                    else
                        NS = S2;
                        end 
                S3 : begin 
                    if (P2)
                        NS = S0;
                    else
                        NS = S3;
                end
            endcase
        end

always @ (PS or P1 or P2)
begin
    case (PS)
        S0 : z = 0 ;
        S1 : z = 0 ;
        S2 : z = 0 ;
        S3 :  begin
	if (P1)
	z = 1 ;
	end
         
    endcase
end
endmodule
