package com.nctclub.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.nctclub.model.NCTmemberDTO;
import com.nctclub.service.SearchService;

@Controller
@RequestMapping("/user")
public class SearchController {
	
	@Autowired
	SearchService searchService;
	

	// 검색 기능 
	@RequestMapping(value = "/searchmember", method = RequestMethod.GET)
	public String search(@RequestParam String search, String option, @RequestParam(value = "check", defaultValue=" ")String check, Model model) {
		Map<String, Object> parameterMap = new HashMap<>();
		parameterMap.put("option", option); // option 변수에 검색 옵션 값 설정
		parameterMap.put("search", search.toUpperCase()); // search 변수에 검색어 값 설정

		System.out.println(search);
		System.out.println(option);
		List<NCTmemberDTO> searchResult = new ArrayList<>();
		if (check.equals("yes")) {
			searchResult = searchService.searchHiddenMember(parameterMap);
			System.out.println(searchResult.toString());
			model.addAttribute("check", "yes");
		} else {
			searchResult = searchService.searchMember(parameterMap);
			System.out.println(searchResult.toString());
		}
		model.addAttribute("nctmemberList", searchResult);
		model.addAttribute("map", parameterMap);

		return "main";
		
		

		 		
	}
	
	

	
}
