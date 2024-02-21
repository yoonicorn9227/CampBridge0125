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
public class CppRDto {
	
	private int cpp_bno;
	private String id;
	private String cpp_btitle;
	private String cpp_bcontent;
	private String cpp_equipname;
	private Timestamp cpp_bdate;
	private String cpp_filename;
	private int cpp_bhit;
	private int cpp_blike;
	
	
}//CppRDto
