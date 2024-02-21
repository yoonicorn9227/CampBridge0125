package com.java.www.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.java.www.dto.BoardDto;

@Mapper
public interface MSearchMapper {

	int MlistSelectCountAll(String searchTitle, String searchWord);

	ArrayList<BoardDto> MlistSelectAll(int startRow, int endRow, String searchTitle, String searchWord);

	int MSelectSearchCount(String searchTitle, String searchWord);

	ArrayList<BoardDto> MSelectSearch(int startRow, int endRow, String searchTitle, String searchWord);

	BoardDto MlistSelectOne(int bno);

	BoardDto MPreSelectOne(int bno);

	BoardDto MNextSelectOne(int bno);

}

