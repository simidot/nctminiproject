package com.nctclub.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nctclub.mapper.SearchMapper;
import com.nctclub.model.NCTmemberDTO;

@Service
public class SearchServiceImpl implements SearchService {
	
	@Autowired
	private SearchMapper mapper;


	@Override
	public List<NCTmemberDTO> searchMember(Map<String, Object> parameterMap) {
		return mapper.searchMember(parameterMap);
	}
	
	@Override
	public List<NCTmemberDTO> searchHiddenMember(Map<String, Object> parameterMap) {
		return mapper.searchHiddenMember(parameterMap);
	}

}
