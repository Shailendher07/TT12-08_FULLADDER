module d_ff_wori(clk , rst , d, out);
input clk , rst , d;
output reg out;

always @(posedge clk or posedge rst)
begin

if (rst)
begin
out <= 0;
end

else
begin
out <= d;
end

end
endmodule
