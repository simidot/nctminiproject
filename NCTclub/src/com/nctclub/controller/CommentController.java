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
		int resultCnt = commentService.register(commentDTO);
		return resultCnt > 0 ? "success" : "fail"; 
	}
	
	// 댓글삭제
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	@ResponseBody
	public String remove(@RequestBody CommentDTO commentDTO) {
	    Long commentid = commentDTO.getCommentid();
	    int depth = commentDTO.getDepth();
//	    System.out.println("Comment ID: " + commentid);
//	    System.out.println("Depth: " + depth);
	    int resultCnt = commentService.removeComment(commentDTO); 
	    return resultCnt > 0 ? "success" : "fail"; 
	}

	// 댓글수정
	@RequestMapping(value="/update/{commentid}", method= RequestMethod.PUT)
	@ResponseBody
	public String modify(@PathVariable("commentid") int commentid, @RequestBody CommentDTO commentDTO) {		
		System.out.println(commentDTO.toString());
		int resultCnt = commentService.updateComment(commentDTO);
		System.out.println(resultCnt);
		return resultCnt > 0 ? "success" : "fail"; 
	}
}
