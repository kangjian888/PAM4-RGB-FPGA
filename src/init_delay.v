// =============================================================================
// Filename: init_delay.v
// Author: KANG, Jian
// Email: jkangac@connect.ust.hk
// Affiliation: Hong Kong University of Science and Technology
// Description: this module is used to adjust the phase difference of three path signal
// -----------------------------------------------------------------------------
`timescale 1 ns / 1 ps
module init_delay(
	input clk,
	input [3:0] delay_r,
  input [3:0] delay_g,
  input [3:0] delay_b,
	input [2:0] data_in,
	output reg [2:0] data_out		
);

localparam INITIALISE = 1'b0;

  wire [3:0] delay_i [2:0];
  assign delay_i[2] = delay_r;
  assign delay_i[1] = delay_g;
  assign delay_i[0] = delay_b;

	wire [2:0] data_sync0;
	wire [2:0] data_sync1;
	wire [2:0] data_sync2;
	wire [2:0] data_sync3;
	wire [2:0] data_sync4;
	wire [2:0] data_sync5;
	wire [2:0] data_sync6;
	wire [2:0] data_sync7;
	wire [2:0] data_sync8;
	wire [2:0] data_sync9;

generate
	genvar i;
	for (i = 0; i <= 2; i = i + 1)
	begin:delay_circuit//Add name here
  		(* SHREG_EXTRACT = "NO" *)
  		FDRE #(
  		  .INIT (INITIALISE[0])
  		) data_sync_reg0 (
  		  .C  (clk),
  		  .D  (data_in[i]),
  		  .Q  (data_sync0[i]),
		  .CE (1'b1),
  		  .R  (1'b0)
  		);
		
  		(* SHREG_EXTRACT = "NO" *)
  		FDRE #(
  		 .INIT (INITIALISE[0])
  		) data_sync_reg1 (
  		.C  (clk),
  		.D  (data_sync0[i]),
  		.Q  (data_sync1[i]),
  		.CE (1'b1),
  		.R  (1'b0)
  		);
		
  		(* SHREG_EXTRACT = "NO" *)
  		FDRE #(
  		 .INIT (INITIALISE[0])
  		) data_sync_reg2 (
  		.C  (clk),
  		.D  (data_sync1[i]),
  		.Q  (data_sync2[i]),
  		.CE (1'b1),
  		.R  (1'b0)
  		);
		
  		(* SHREG_EXTRACT = "NO" *)
  		FDRE #(
  		 .INIT (INITIALISE[0])
  		) data_sync_reg3 (
  		.C  (clk),
  		.D  (data_sync2[i]),
  		.Q  (data_sync3[i]),
  		.CE (1'b1),
  		.R  (1'b0)
  		);
		
  		(* SHREG_EXTRACT = "NO" *)
  		FDRE #(
  		 .INIT (INITIALISE[0])
  		) data_sync_reg4 (
  		.C  (clk),
  		.D  (data_sync3[i]),
  		.Q  (data_sync4[i]),
  		.CE (1'b1),
  		.R  (1'b0)
  		);
		
  		(* SHREG_EXTRACT = "NO" *)
  		FDRE #(
  		 .INIT (INITIALISE[0])
  		) data_sync_reg5 (
  		.C  (clk),
  		.D  (data_sync4[i]),
  		.Q  (data_sync5[i]),
  		.CE (1'b1),
  		.R  (1'b0)
  		);	
		
  		(* SHREG_EXTRACT = "NO" *)
  		FDRE #(
  		 .INIT (INITIALISE[0])
  		) data_sync_reg6 (
  		.C  (clk),
  		.D  (data_sync5[i]),
  		.Q  (data_sync6[i]),
  		.CE (1'b1),
  		.R  (1'b0)
  		);
		
  		(* SHREG_EXTRACT = "NO" *)
  		FDRE #(
  		 .INIT (INITIALISE[0])
  		) data_sync_reg7 (
  		.C  (clk),
  		.D  (data_sync6[i]),
  		.Q  (data_sync7[i]),
  		.CE (1'b1),
  		.R  (1'b0)
  		);	
		
  		(* SHREG_EXTRACT = "NO" *)
  		FDRE #(
  		 .INIT (INITIALISE[0])
  		) data_sync_reg8 (
  		.C  (clk),
  		.D  (data_sync7[i]),
  		.Q  (data_sync8[i]),
  		.CE (1'b1),
  		.R  (1'b0)
  		);	
		
  		(* SHREG_EXTRACT = "NO" *)
  		FDRE #(
  		 .INIT (INITIALISE[0])
  		) data_sync_reg9 (
  		.C  (clk),
  		.D  (data_sync8[i]),
  		.Q  (data_sync9[i]),
  		.CE (1'b1),
  		.R  (1'b0)
  		);				
	end
endgenerate

generate
  genvar j;
  for (j = 0; j <= 2; j = j + 1)
  begin:output_choice//Add name here
    always @ (*)
      begin
          case (delay_i[j]) 
              4'd0:
                  begin
                      data_out[j] = data_in[j];
                  end
              4'd1:
                  begin
                      data_out[j] = data_sync0[j];
                  end
              4'd2:
                  begin
                      data_out[j] = data_sync1[j];
                  end
              4'd3:
                  begin
                      data_out[j] = data_sync2[j];
                  end
              4'd4:
                  begin
                      data_out[j] = data_sync3[j];
                  end
              4'd5:
                  begin
                      data_out[j] = data_sync4[j];
                  end
              4'd6:
                  begin
                      data_out[j] = data_sync5[j];
                  end
              4'd7:
                  begin
                      data_out[j] = data_sync6[j];
                  end
              4'd8:
                  begin
                      data_out[j] = data_sync7[j];
                  end
              4'd9:
                  begin
                      data_out[j] = data_sync8[j];
                  end
              4'd10:
                  begin
                      data_out[j] = data_sync9[j];
                  end                                                                                                                                                                                                                    
              default:
                  begin
                      data_out[j] = data_in[j];
                  end
          endcase
      end
  end
endgenerate

endmodule