package com.nctclub.mapper;

import java.util.List;
import java.util.Map;


import com.nctclub.model.NCTmemberDTO;

public interface SearchMapper {
	// 엔시티 멤버 한 명 선택하기
	public List<NCTmemberDTO> searchMember(Map<String, Object> parameterMap);

}
