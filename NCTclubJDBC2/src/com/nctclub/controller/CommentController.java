package com.nctclub.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.nctclub.model.CommentDTO;
import com.nctclub.service.CommentService;
import com.nctclub.service.UserService;

@Controller
@RequestMapping("/comment")
public class CommentController {
	
	@Autowired
	CommentService commentService;
	
//	// 댓글조회
//	@RequestMapping(value = "/{commentid}", method = RequestMethod.GET)
//	@ResponseBody
//	public CommentDTO get(@PathVariable("commentid") int commentid) {
//
//	}
//	
	// 댓글추가
	@RequestMapping(value = "/new", method = RequestMethod.POST)
	@ResponseBody
	public String create(@RequestBody CommentDTO commentDto) {
		int resultCnt = commentService.register(commentDto);
		return "success"; 
	}
//
//	// 댓글삭제
//	@RequestMapping(value = "/{commentid}", method = RequestMethod.DELETE)
//	@ResponseBody
//	public String remove(@PathVariable("rno") int rno) {		
//		return resultCnt == 1 ? "success" : "fail"; 
//	}
//	
//	// 댓글수정
//	@RequestMapping(value="/{commentid}", method= {RequestMethod.PUT})
//	@ResponseBody
//	public String modify(@PathVariable("commentid") int commentid, @RequestBody CommentDTO rDto) {		
//		return resultCnt == 1 ? "success" : "fail"; 
//	}
}
