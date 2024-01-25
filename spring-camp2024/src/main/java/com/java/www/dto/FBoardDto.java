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
public class FBoardDto {

	private int f_bno;
	private String id;
	private String f_btype;
	private String f_btitle;
	private String f_bcontent;
	private Timestamp f_bdate;
	private int f_bhit;
	private int f_bgroup;
	private int f_bstep;
	private int f_bindent;
	private String f_bfile;

}// FBoardDto
