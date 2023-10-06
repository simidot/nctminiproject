package com.nctclub.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.nctclub.model.CommentDTO;

public interface CommentMapper {
	public int insert(CommentDTO commentDto);
	public List<CommentDTO> selectAll(int nctmember_id);
	public int delete(CommentDTO commentDto);
	public int update(CommentDTO commentDto);
	public int totalCnt(int nctmember_id);
	public List<CommentDTO> getCommentsByMemberIdWithPagination(@Param("nctmember_id") int nctmemberId, @Param("pagination") HashMap<String, Integer> map);
}
