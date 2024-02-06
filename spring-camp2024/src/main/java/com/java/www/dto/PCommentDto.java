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
public class PCommentDto {

	private int p_cno;
	private int p_bno;
	private String id;
	private String p_cpw;
	private String p_ccontent;
	private Timestamp p_cdate;

}// PCommentDto
