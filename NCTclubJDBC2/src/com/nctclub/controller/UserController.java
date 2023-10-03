package com.nctclub.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.nctclub.model.CustomUserDetails;
import com.nctclub.model.NCTmemberDTO;
import com.nctclub.model.UserDTO;
import com.nctclub.service.CustomUserDetailsService;
import com.nctclub.service.UserService;


@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	CustomUserDetailsService customUserDetailsService;
	
	@Autowired
	UserService userService;
	
	// 회원가입 폼으로 이동
	@RequestMapping(value = "/registerform", method = RequestMethod.GET)
	public String registerform() {
		return "registerform";
	}
	
	// 회원가입 기능 (회원가입 후 메인 페이지로 이동)
    @RequestMapping(value="/register", method = RequestMethod.POST)
    public String userRegister(@ModelAttribute UserDTO dto) {
    	int result = userService.userRegister(dto);
    	// System.out.println(result);
        return "redirect:/user/main";
    }
    
    // 로그인 폼으로 이동
    @RequestMapping(value = "/loginform", method = RequestMethod.GET)
	public String loginform() {
		return "loginform";
	}
    
    // 로그인하기 기능 
    @RequestMapping(value="/login", method = RequestMethod.POST)
    public String loginProcess(UserDTO dto, HttpServletRequest req, Model model) {
    	UserDetails userDetails = userService.userLogin(dto); // userDetails는 로그인한 정보를 가져옴
    	
        if(userDetails != null) {
        	// authentication 객체 생성 
            UsernamePasswordAuthenticationToken authentication = 
            	    new UsernamePasswordAuthenticationToken(userDetails, null, userDetails.getAuthorities());

            
            SecurityContextHolder.getContext().setAuthentication(authentication);
            
            HttpSession session = req.getSession();
            
            CustomUserDetails customUserDetails = (CustomUserDetails) userDetails;
            session.setAttribute("loginDto", customUserDetails.getUserDto());
            System.out.println(customUserDetails.getUserDto());
            return "redirect:/user/main";
        } else {
            model.addAttribute("errorMessage", "아이디 또는 비밀번호가 틀렸습니다.");
            return "loginform";
        }
    }

        /**
         * 
         * 위 컨트롤러 과정 *
         * 
         * 
            1.로그인 요청 처리:
        	login 엔드포인트에 POST 요청이 오면 loginProcess 메서드가 실행
        	사용자가 제출한 아이디와 비밀번호를 UserDTO dto 객체로 받는다.
        	
        	2.사용자 인증 확인:
        	userService.userLogin(dto)를 호출하여 사용자의 아이디와 비밀번호가 맞는지 데이터베이스에서 확인한다.
        	올바른 사용자 정보가 반환되면, result에 저장된다.
        	
        	3.UserDetails 객체 로드:
        	customUserDetailsService.loadUserByUsername(result.getUserId())를 호출하여 사용자의 세부 정보와 권한을 포함한 UserDetails 객체를 얻는다.
     
        	4.인증 토큰 생성:
        	사용자의 세부 정보와 입력한 패스워드, 그리고 권한 정보를 사용하여 UsernamePasswordAuthenticationToken 객체를 생성한다
        	이 토큰은 현재 사용자가 인증되었다는 것을 나타낸다.
        	
        	5.인증 정보 설정:
			생성된 UsernamePasswordAuthenticationToken 객체를 SecurityContextHolder의 현재 컨텍스트에 설정하여, 스프링 시큐리티가 현재 사용자가 인증되었다는 것을 알 수 있게 한다.
        	
        	6.세션 정보 설정:
        	인증된 사용자의 정보를 HttpSession에 저장합니다. 이로써 다른 페이지나 요청에서도 현재 로그인한 사용자의 정보에 접근할 수 있게 된다.
        	메인 페이지 리다이렉트:

        	7.모든 인증 과정이 성공적으로 완료되면 사용자를 메인 페이지로 리다이렉트 시킨다
    	**/
    
    
    // 메인 화면에서 엔시티 멤버 전체 정보 가져오기
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String selectAllMembers (Model model) {
		List<NCTmemberDTO> nctmembers = userService.selectAllMembers();
		//System.out.println(nctmembers.get(1));
		model.addAttribute("nctmemberList", nctmembers);
		return "main";
	}
	
	// 메인에서 정보 상세보기를 누르면 각 멤버의 정보를 가져오기. 
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String selectMember (@RequestParam("memberId") int memberId, Model model) {
		NCTmemberDTO dto = userService.selectMember(memberId);
		model.addAttribute("nctmemberDTO", dto);
		return "nctdetailform";
	}
	
    
    @RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logoutform(HttpServletRequest req) {
    	   HttpSession session = req.getSession();
    	   session.invalidate();
		return "redirect:loginform";
	}


    
    
    
	@RequestMapping("idCheck.do")	
	@ResponseBody
	public String userIdCheck(@RequestParam("userId") String userId) {
		
		UserDTO dto = userService.idCheck(userId);
		
		System.out.println("userId" +userId);
		System.out.println("dto" +dto);
		
		if(dto != null || "".equals(userId.trim())) {
			return "no"; // 사용불가
		}
		
		return "yes"; // 사용가능 
	}
}
