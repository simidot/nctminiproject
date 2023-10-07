package com.nctclub.mapper;

import java.util.List;
import java.util.Map;


import com.nctclub.model.NCTmemberDTO;

public interface SearchMapper {
	// 엔시티 멤버 검색하기
	public List<NCTmemberDTO> searchMember(Map<String, Object> parameterMap);
	
	// 숨겨진 멤버 검색하기
	public List<NCTmemberDTO> searchHiddenMember(Map<String, Object> parameterMap);
}
