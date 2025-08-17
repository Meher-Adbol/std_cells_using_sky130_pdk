module my_dff (
    input wire D,         
    input wire clk,       
    output reg Q        
);

always @(negedge clk) begin
    Q <= D;               
end

endmodule 


