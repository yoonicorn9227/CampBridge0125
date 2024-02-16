package com.java.www.dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Data
public class PBoardDto {

	private int p_bno;
	private String id;
	private String p_btype;
	private String p_btitle;
	private String p_bcontent;
	private Timestamp p_bdate;
	private String p_local;
	private int p_bnum;
	private int p_joinnum;
	private String p_bfile;

}// PBoardDto
