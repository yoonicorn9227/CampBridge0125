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
public class Cps_reviewDto {
	
	private int cps_bno;
	private String id;
	private String cps_btitle;
	private String cps_bcontent;
	private String cps_sitename;
	private Timestamp cps_bdate;
	private String cps_bfile;
	private int cps_bhit;
	private int cps_blike;
	
}
