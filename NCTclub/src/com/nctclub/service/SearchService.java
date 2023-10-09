package com.nctclub.service;

import java.util.List;
import java.util.Map;

import com.nctclub.model.NCTmemberDTO;

public interface SearchService {
	
	// 검색 기능

	public List<NCTmemberDTO> searchMember(Map<String, Object> parameterMap);
	
	public List<NCTmemberDTO> searchHiddenMember(Map<String, Object> parameterMap);



}
