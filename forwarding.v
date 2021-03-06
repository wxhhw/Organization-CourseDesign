module forwarding(
	input[4:0] rs,
	input[4:0] rt,
	input[4:0] rw_mem,
	input[4:0] rw_wr,
	input RegWr_mem,
	input RegWr_wr,
	input ALUSrc,
	input mflo,
	input mfhi,
	input mtlo_mem,
	input mthi_mem,
	input mtlo_wr,
	input mthi_wr,
	
	output[1:0] ALUSrc_A,
	output[1:0] ALUSrc_B
    );
	
	assign ALUSrc_A[0] = (RegWr_mem&&rs==rw_mem) || (mflo&&mtlo_mem&&!mtlo_wr) || (mfhi&&mthi_mem&&!mthi_wr);
	assign ALUSrc_A[1] = (RegWr_wr && rs==rw_wr && rs!=rw_mem) || (RegWr_wr && rs==rw_wr && !RegWr_mem) || (mflo&&!mtlo_mem&&mtlo_wr) || (mfhi&&!mthi_mem&&mthi_wr);

	assign ALUSrc_B[0] = (ALUSrc == 1)? 1:RegWr_mem&&rt==rw_mem;
	assign ALUSrc_B[1] = (ALUSrc == 1)? 1:RegWr_wr && rt==rw_wr && rw_mem!=rt;
	 

endmodule

