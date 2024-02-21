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
public class Cps_commentDto {
	
	private int cps_cno;
	private int cps_bno;
	private String id;
	private String cps_cpw;
	private String cps_ccontent;
	private Timestamp cps_cdate;

}
