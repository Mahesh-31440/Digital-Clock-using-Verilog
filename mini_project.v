`timescale 1ns / 1ps

module bcd_counter(input clock,input reset,input enable,output reg [3:0]q);
    always@(clock)begin
        if(reset)begin
            q<=4'd0;
        end
        else if (enable)begin
            if (q==4'd9)begin
                q<=4'd0;
            end
            else begin
                q<=q+1;
            end
        end
        else begin
            q<=q;
        end
    end
endmodule

module mod6 (input clock,input reset,input enable,output reg [3:0]q);
    always@(clock)begin
        if(reset)begin
            q<=4'd0;
        end
        else if (enable)begin
            if (q==4'd5)begin
                q<=4'd0;
            end
            else begin
                q<=q+1;
            end
        end
        else begin
            q<=q;
        end
    end
endmodule

module hour(
    input clock,
    input reset,
    input enable,
    output reg [3:0]d2,d1,
	output reg am);
   /* initial begin
        d2[3:0]=4'b0001;
        d1[3:0]=4'b0010;
        am=0;
    end
    */
    always@(posedge clock)begin
        if (reset)begin
            d2[3:0]<=4'b0001;
            d1[3:0]<=4'b0010;
            am<=0;
        end 
        else if(enable)begin
            if ((d2[3:0]==4'd1)&(d1[3:0]==4'd1))begin
                d1[3:0]<=d1[3:0]+1;
                am<=(~am);
            end else if ((d2[3:0]==4'd1)&(d1[3:0]==4'd2))begin
                d2[3:0]<=4'b0000;
                d1[3:0]<=4'b0001;
            end else if (d1[3:0]==4'd9)begin
                d1[3:0]<=4'd0;
                d2[3:0]<=d2[3:0]+1;
            end else begin
                d1[3:0]<=d1[3:0]+1;
            end
        end
        else begin
            d2<=d2;
            d1<=d1;
        end
    end
endmodule



module Clock(
    input clock, reset, enable, r_m,
    input [15:0] r_time,
    output [3:0] q1, q2, q3, q4, q5, q6,
    output am,
    output reg alarm);
    wire w, x, y, z;

    
    bcd_counter counter1(clock, reset, enable, q1);
    assign x = (q1 == 4'd9);
    mod6 counter2(clock, reset, x, q2);
    assign y = x & (q2 == 4'd5);
    bcd_counter counter3(clock, reset, y, q3);
    assign z = y & (q3 == 4'd9);
    mod6 counter4(clock, reset, z, q4);
    assign w = z & (q4 == 4'd5);
    hour counter5(clock, reset, w, q6, q5, am);

    always @(clock) begin
      
        if ((r_time == {q6, q5, q4, q3}) && (r_m == am)) begin
            alarm <= 1;
        end else begin
            alarm <= 0;
        end
    end
endmodule