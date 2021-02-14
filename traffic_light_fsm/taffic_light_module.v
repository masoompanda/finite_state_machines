module traffic_light(
    input clk,
    input reset,
    output reg [2:0] lightA,  //country side
    output reg [2:0] lightB   //highway
    );
    reg[2:0] state;      //different states
    localparam S0=3'b000,
               S1=3'b001,
               S2=3'b010,
               S3=3'b011,
               S4=3'b100,
               S5=3'b101;
               
    localparam sec5=4'd5, //delays
               sec1=4'd1;
    
    reg[3:0] count; //count value 
always @(posedge clk or posedge reset) begin   //FSM
  if(reset==1'b1) begin
     state <= S0;
     count <=0;
  end else 
     case(state) 
      S0 : if(count<sec5) begin
            state<=S0;
            count <= count+1;
           end else begin
            state<=S1;
            count<=0;
           end
      S1 : if(count<sec1) begin
            state<=S1;
            count <= count+1;
           end else begin
            state<=S2;
            count<=0;
           end
      S2 : if(count<sec1) begin
            state<=S2;
            count <= count+1;
           end else begin
            state<=S3;
            count<=0;
           end
      S3 : if(count<sec5) begin
            state<=S3;
            count <= count+1;
           end else begin
            state<=S4;
            count<=0;
           end
       S4 : if(count<sec1) begin
              state<=S4;
              count <= count+1;
            end else begin
              state<=S5;
              count<=0;
            end
        S5 : if(count<sec1) begin
              state<=S5;
              count <= count+1;
             end else begin
               state<=S0;
               count<=0;
             end
         default state<=S0;
     endcase
     end
     
     always @(*) begin
      case(state)
        S0: begin lightA<=3'b001;lightB<=3'b100; end
        S1: begin lightA<=3'b010;lightB<=3'b100; end
        S2: begin lightA<=3'b100;lightB<=3'b100; end
        S3: begin lightA<=3'b100;lightB<=3'b001; end
        S4: begin lightA<=3'b100;lightB<=3'b010; end
        S5: begin lightA<=3'b100;lightB<=3'b100; end
      endcase
     end
endmodule
