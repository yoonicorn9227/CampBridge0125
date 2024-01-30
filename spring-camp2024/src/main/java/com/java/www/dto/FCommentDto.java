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
public class FCommentDto {

	private int f_cno;
	private int f_bno;
	private String id;
	private String f_cpw;
	private String f_ccontent;
	private Timestamp f_cdate;

}// FCommentDto
