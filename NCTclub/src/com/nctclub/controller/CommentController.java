package com.nctclub.controller;

import static java.lang.Class.forName;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.codehaus.jackson.map.ObjectMapper;
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
	
	// 댓글조회
    @RequestMapping(value = "/list/{nctmember_id}", method = RequestMethod.GET)
	@ResponseBody
	public List<CommentDTO> showList(@PathVariable("nctmember_id") int nctmember_id) {
        List<CommentDTO> comments = commentService.getCommentsByMemberId(nctmember_id);
		return comments;
	}
    
	// 댓글추가
	@RequestMapping(value = "/new", method = RequestMethod.POST)
	@ResponseBody
	public String create(@RequestBody CommentDTO commentDTO)  {
		System.out.println("commentDTO = "+commentDTO.toString());
		int result = commentService.register(commentDTO);
		return "success"; 
	}
	
	// 댓글삭제
	@RequestMapping(value = "/delete/{commentid}", method = RequestMethod.DELETE)
	@ResponseBody
	public String remove(@PathVariable("commentid") int commentid) {
		System.out.println(commentid);
	    int resultCnt = commentService.removeComment(commentid); 
	    return "success";
	}

//	
//	// 댓글수정
//	@RequestMapping(value="/{commentid}", method= {RequestMethod.PUT})
//	@ResponseBody
//	public String modify(@PathVariable("commentid") int commentid, @RequestBody CommentDTO rDto) {		
//		return resultCnt == 1 ? "success" : "fail"; 
//	}
}
