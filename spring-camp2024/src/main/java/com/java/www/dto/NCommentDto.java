package com.java.www.dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@Builder
@NoArgsConstructor
public class NCommentDto {
	private int n_cno;
	private int n_bno;
	private String id;
	private String n_cpw;
	private String n_ccontent;
	private Timestamp n_cdate; 

	

}
