package com.nctclub.mapper;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.nctclub.model.NCTmemberDTO;
import com.nctclub.model.UserDTO;

public interface AdminMapper {
	
	
	// 전체 회원 선택
	public List<UserDTO> selectAllusers(HashMap<String, Integer> map); 
			
	// 회원 삭제
	public int deleteUser(String userId);
	
	// 엔시티 멤버 추가 (멤버 정보와 그룹 정보 추가)
	public int insertMember(NCTmemberDTO dto);

	public int insertGroupsForMember(NCTmemberDTO dto);
	
	// 엔시티 멤버 전체선택하기
	//public List<NCTmemberDTO> selectAllMembers();


	// 엔시티 멤버 한 명 선택하기
	public NCTmemberDTO selectMember(int memberId);

	// 엔시티 멤버 정보 수정하기
	public int updateMember(NCTmemberDTO dto);
	public int deleteGroup(NCTmemberDTO dto);
	public int updateGroup(NCTmemberDTO dto);
	
	// 엔시티 멤버 삭제
	public int deleteMember(int memberId);

	public ArrayList<String> getAllGroups();

	public int getUserCount();
	public NCTmemberDTO nameCheck(String name);

	public List<NCTmemberDTO> selectHiddenMembers();
	
	public int unhideMember(int memberId);

}
