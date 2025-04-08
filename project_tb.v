`timescale 1ns / 1ps

module seconds_tb;
    reg clock, reset, enable, r_m;
    reg [15:0] r_time;
    wire [3:0] q1, q2, q3, q4, q5, q6;
    wire am, alarm;
    
    Clock dut(clock, reset, enable, r_m, r_time, q1, q2, q3, q4, q5, q6, am, alarm);
    
    initial begin
       
        reset = 0;
        clock = 0;
        enable=1;
        r_time = 16'b0001_0010_0001_0000; 
        r_m = 0; 
        
        #5 reset = 1;
        #5 reset =0; 
        #1000 $finish;
    end
    
   
    always #1 clock = ~clock;
    
    
    initial
        $monitor("$time=%g,clock=%b,reset=%b,enable=%b,r_m=%b,r_time=%b,%d%d hrs:%d%d min:%d%d sec AM=%b,Alarm=%b", 
                 $time, clock, reset, enable, r_m, r_time, q6, q5, q4, q3, q2, q1, am, alarm);
    
endmodule