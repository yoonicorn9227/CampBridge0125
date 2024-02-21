package com.java.www.service;

import java.util.Map;

public interface MSearchService {

	Map<String, Object> MlistSelectAll(int page, String searchTitle, String searchWord);

	Map<String, Object> MSelectSearch(int page, String searchTitle, String searchWord);

	Map<String, Object> MlistSelectOne(int bno);

}


