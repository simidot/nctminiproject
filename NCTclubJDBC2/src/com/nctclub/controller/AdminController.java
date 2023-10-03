package com.nctclub.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.nctclub.model.NCTmemberDTO;
import com.nctclub.model.UserDTO;
import com.nctclub.service.AdminService;
import com.nctclub.service.CustomUserDetailsService;


@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	CustomUserDetailsService customUserDetailsService;
	
	@Autowired
	AdminService adminService;
	

	/*
	 * @RequestMapping(value = "/main", method = RequestMethod.GET) public String
	 * selectAllMembers (Model model) { List<NCTmemberDTO> nctmembers =
	 * adminService.selectAllMembers(); System.out.println(nctmembers.get(1));
	 * model.addAttribute("nctmemberList", nctmembers); return "main"; }
	 */
	
	// 회원 관련 기능
	
	// 모든 회원 정보 조회 + 페이징 처리
	@RequestMapping(value = "/userlist", method = RequestMethod.GET)
	public String selectallusers(HttpServletRequest request, Model model) {
		int pg=1;
		String strPg = request.getParameter("pg"); 
		if(strPg!=null){
			pg = Integer.parseInt(strPg);			
		}
		int rowSize = 10;
		int start = (pg*rowSize)-(rowSize -1);
		int end = pg*rowSize;
		
		int total = adminService.getUserCount(); //총 회원 수
		System.out.println("시작 : "+start +" 끝: "+end);
		System.out.println("회원 수 : "+total);
		
		int allPage = (int) Math.ceil(total/(double)rowSize); //페이지수
		System.out.println("페이지수 : "+ allPage);
		
		int block = 10; //한페이지에 보여줄  범위 << [1] [2] [3] [4] [5] [6] [7] [8] [9] [10] >>
		int fromPage = ((pg-1)/block*block)+1;  //보여줄 페이지의 시작
		//((1-1)/10*10)
		int toPage = ((pg-1)/block*block)+block; //보여줄 페이지의 끝
		if(toPage> allPage){ // 예) 20>17
			toPage = allPage;
		}
		
		HashMap<String, Integer> map = new HashMap<>();
		map.put("start", start);
		map.put("end", end);
		
		List<UserDTO> members = adminService.selectAllUsers(map);
		model.addAttribute("memberList", members);
		request.setAttribute("pg",pg);
		request.setAttribute("allPage",allPage);
		request.setAttribute("block",block);
		request.setAttribute("fromPage",fromPage);
		request.setAttribute("toPage",toPage);	
		return "userListForm";
	}
	
	// 회원정보 삭제 기능
	@RequestMapping(value = "/deleteuser", method = RequestMethod.GET)
	public String deleteUser(@RequestParam("userId") String userId) {
		System.out.println(userId);
		int result = adminService.deleteUser(userId);
		if (result ==1) {
			return "redirect:/admin/userlist";
		} else {
			return "no"; //여기 에러페이지로 이동하도록 수정하기**
		}
	}
	
	
	// NCT member 관련 기능
	
	// 엔시티 멤버 세부정보 조회
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String selectMember (@RequestParam("memberId") int memberId, Model model) {
		NCTmemberDTO dto = adminService.selectMember(memberId);
		model.addAttribute("nctmemberDTO", dto);
		System.out.println(dto);
		return "nctdetailform";
	}
	
	// 엔시티 멤버 중복 확인
	@RequestMapping("nameCheck.do")	
	@ResponseBody
	public String nameCheck(@RequestParam("name") String name) {
		
		NCTmemberDTO dto = adminService.nameCheck(name);
		
		System.out.println("name" +name);
		System.out.println("dto" +dto);
		
		if(dto != null || "".equals(name)) {
			return "no"; // 사용불가
		}
		
		return "yes"; // 사용가능 
	}

	// 엔시티 멤버 등록 폼으로 이동
	@RequestMapping(value = "/nctregisterform", method = RequestMethod.GET)
	public String registerform() {
		return "nctregisterform";
	}
	
	/**
	 * 회원 등록 요청을 처리하는 컨트롤러 메서드.
	 * 사용자가 제출한 파일과 회원 정보를 받아서 처리한다.
	 * 
	 * @param file - 사용자가 업로드한 파일
	 * @param dto - 사용자가 입력한 회원 정보
	 * @param request - HttpServletRequest 객체
	 * @param model - Model 객체
	 * @return String - 리다이렉션 URL
	 * @throws Exception
	 */
	// 엔시티 멤버 등록하기 기능 (이미지 파일 업로드 기능 탑재)
    @RequestMapping("/nctregister")
    public String memberRegister(@RequestParam("file") MultipartFile file, @ModelAttribute NCTmemberDTO dto, HttpServletRequest request, Model model) throws Exception {

        // 파일을 업로드할 디렉토리 경로 설정
        String UPLOAD_DIR = "resources/file_repo";
        ServletContext servletContext = request.getSession().getServletContext();
        
        /*
         * 톰캣을 포함한 많은 웹 서버는 웹 애플리케이션을 실행할 때 원본 프로젝트의 위치가 아닌 다른 임시 디렉터리에 애플리케이션을 배포하여 실행한다.
        servletContext.getRealPath("")를 사용하면, 그 임시 디렉터리 내의 애플리케이션 루트 경로를 얻게 된다.
        이렇게 임시 디렉터리에 저장된 파일들은 IDE의 프로젝트 구조 내에서는 직접적으로 보이지 않음.
        만약 웹 애플리케이션을 다시 시작하거나 재배포할 경우, 이 임시 디렉터리의 내용은 리셋됨.
        */
        
        // 업로드 경로 
        String uploadPath = servletContext.getRealPath("") + File.separator + UPLOAD_DIR;
        // System.out.println(uploadPath);
        
        // 파일이 비어 있지 않은 경우 파일 업로드 처리
        if (!file.isEmpty()) {
            File uploadedFile = adminService.uploadFile(file, uploadPath);
            System.out.println("저장소 : " + uploadPath);
            dto.setImage(uploadedFile.getName()); // 이미지는 이미지파일의 제목으로 설정.
            System.out.println("테스트완료");
        }
        // System.out.println(dto.toString());
        // System.out.println(dto.getGroupList().toString());

        // 멤버 정보를 데이터베이스에 추가
        adminService.addMemberWithGroups(dto);
        System.out.println(dto.toString());
    
        // 멤버 등록 후 메인 페이지로 리다이렉션
        return "redirect:/user/main";
    }
    
    // 엔시티 멤버 정보 수정하기폼으로 이동 (멤버id를 파라미터로 가져와서 그 멤버의 정보수정)
    @RequestMapping("/updatememberform")
    public String updatemember(@RequestParam("memberId") int memberId, Model model) {
    	NCTmemberDTO dto = adminService.selectMember(memberId);
		model.addAttribute("nctmemberDTO", dto);
		// 그룹 전체 정보를 가져오기 위한 모델 설정
        model.addAttribute("allGroups", adminService.getAllGroups());
		System.out.println(dto);
		return "updatememberform";
    }
    
    // 엔시티 멤버 정보 수정하기 기능 (이미지 파일도 새로 업로드 가능)
    @RequestMapping("/updatemember")
    public String updatemember(@RequestParam("file") MultipartFile file, @ModelAttribute NCTmemberDTO dto, HttpServletRequest request, Model model) throws Exception {
    	String UPLOAD_DIR = "resources/file_repo";
        ServletContext servletContext = request.getSession().getServletContext();
        String uploadPath = servletContext.getRealPath("") + File.separator + UPLOAD_DIR;
        System.out.println(uploadPath);

        //업로드 파일이 있을 경우 업로드 경로에 파일 옮기고 파일제목을 이미지로 설정
        if (!file.isEmpty()) {
            File uploadedFile = adminService.uploadFile(file, uploadPath);
            System.out.println("저장소 : " + uploadPath);
            dto.setImage(uploadedFile.getName());
            System.out.println("테스트완료");
        }
        
        // 그 후 수정된 정보를 저장
        adminService.updateMemberWithGroups(dto);
        System.out.println("수정완:" + dto.toString());
        model.addAttribute("successMessage", "멤버 정보 수정이 완료되었습니다.");

		return "redirect:detail?memberId="+dto.getMemberId();
    }
    
    // 엔시티 멤버 삭제 기능
    @RequestMapping(value = "/deletemember", method = RequestMethod.GET)
	public String deleteMember(@RequestParam("memberId") int memberId) {
		int result = adminService.deleteMember(memberId);
		if (result ==1) {
			return "redirect:/user/main";
		} else {
			return "no"; //여기 에러페이지로 이동하도록 수정하기**
		}
	}

}
