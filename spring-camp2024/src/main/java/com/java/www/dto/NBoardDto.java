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
public class NBoardDto {
	
	private int n_bno;
	private String id;
	private String n_btype;
	private String n_btitle;
	private String n_bcontent;
	private Timestamp n_bdate;
	private int n_bhit;
	private String n_bfile;

}
