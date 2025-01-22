package com.mySpring.myapp.member.controller;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mySpring.myapp.member.dao.MemberDAO;
import com.mySpring.myapp.member.service.MemberService;
import com.mySpring.myapp.member.vo.MemberVO;

@Controller("memberController")
//@EnableAspectJAutoProxy
public class MemberControllerImpl   implements MemberController {
	@Autowired
	private MemberService memberService;
	@Autowired
	MemberVO memberVO;
	@Autowired
	MemberDAO memberDAO;
	
	@RequestMapping(value = { "/","/main.do"}, method = RequestMethod.GET)
	private ModelAndView main(HttpServletRequest request, HttpServletResponse response) {
		String viewName = (String)request.getAttribute("viewName");	

		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}
	
	@Override
	@RequestMapping(value="/member/addMember.do" ,method = RequestMethod.POST)
	public ModelAndView addMember(@ModelAttribute("member") MemberVO member, HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		
		int counter = memberService.selectCount();
		int result= 0;
		member.setUID(++counter);
		result = memberService.addMember(member);
		result = memberService.addUIDCount();
		ModelAndView mav = new ModelAndView("redirect:/member/loginFom.do");
		return mav;
	}
	
	@Override
	@RequestMapping(value = "/member/modMember.do", method = RequestMethod.POST)
	public ModelAndView updateMember(@ModelAttribute("member") MemberVO member, HttpServletRequest request, HttpServletResponse response) throws Exception {		
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		int uid = (int)session.getAttribute("uid");
		member.setUID(uid);
		
		int reuslt = memberService.updateMember(member);

		ModelAndView mav = new ModelAndView();
		MemberVO curSes = memberService.selectMyInfo(uid) ;

		session.setAttribute("member", curSes);
		
		mav.setViewName("redirect:/member/user_info.do");
		return mav;
	}
	
	@Override
	@RequestMapping(value = "/member/login.do", method = RequestMethod.POST)
	public ModelAndView login(@ModelAttribute("member") MemberVO member,
				              RedirectAttributes rAttr,
		                       HttpServletRequest request, HttpServletResponse response) throws Exception {
	ModelAndView mav = new ModelAndView();
	//System.out.println(member.getUID()+"/"+member.getEmail()+"/"+member.getPwd()+"/"+member.getName()+"/"+member.getPhone()+"/"+member.getCarnum()+"/"+member.getMileage());
	memberVO = memberService.login(member);
	if(memberVO != null) {
	    HttpSession session = request.getSession();
	    int uid = memberVO.getUID();
	    session.setAttribute("userid", uid);
	    //session.setAttribute("member", memberVO);
	    System.out.println("userid: "+uid);
	    session.setAttribute("isLogOn", true);
	    session.setAttribute("name", memberVO.getName());
	    System.out.println("isLogOn: "+session.getAttribute("isLogOn"));
	    String action = (String)session.getAttribute("action");
	    session.removeAttribute("action");
	    if(action!= null) {	
	       mav.setViewName("redirect:"+action);
	    }else{
	       mav.setViewName("redirect:/main.do");	
	    }

	}else {
	   rAttr.addAttribute("result","loginFailed");
	   mav.setViewName("redirect:/member/loginForm.do");
	}
	return mav;
	}

	@Override
	@RequestMapping(value = "/member/logout.do", method =  RequestMethod.GET)
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		session.removeAttribute("uid");
		session.removeAttribute("isLogOn");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/main.do");
		return mav;
	}	

	@RequestMapping(value = "/member/*Form.do", method =  RequestMethod.GET)
	private ModelAndView form(@RequestParam(value= "result", required=false) String result,
							  @RequestParam(value= "action", required=false) String action,
						       HttpServletRequest request, 
						       HttpServletResponse response) throws Exception {
		String viewName = (String)request.getAttribute("viewName");
		HttpSession session = request.getSession();
		session.setAttribute("action", action);  
		ModelAndView mav = new ModelAndView();
		mav.addObject("result",result);
		mav.setViewName(viewName);
		Enumeration<String> attributeNames = session.getAttributeNames();
        StringBuilder sessionData = new StringBuilder("세션 데이터 목록:<br>");

          // 각 속성의 이름과 값을 출력
        while (attributeNames.hasMoreElements()) {
            String attributeName = attributeNames.nextElement();
            Object attributeValue = session.getAttribute(attributeName);
            sessionData.append(attributeName).append(": ").append(attributeValue).append("<br>");
        }

		return mav;
	}
	
	@Override
	@RequestMapping(value = "/member/user_info.do", method =  RequestMethod.GET)
	public ModelAndView myInfo( HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String)request.getAttribute("viewname");
		HttpSession session = request.getSession();
		int uid = ((int)session.getAttribute("userid"));

		MemberVO result = memberService.selectMyInfo(uid);
		System.out.println(result.getMileage());
		ModelAndView mav = new ModelAndView();
		mav.addObject("member", result);
		mav.setViewName(viewName); 
		return mav;
	}

	private String getViewName(HttpServletRequest request) throws Exception {
		String contextPath = request.getContextPath();
		String uri = (String) request.getAttribute("javax.servlet.include.request_uri");
		if (uri == null || uri.trim().equals("")) {
			uri = request.getRequestURI();
		}

		int begin = 0;
		if (!((contextPath == null) || ("".equals(contextPath)))) {
			begin = contextPath.length();
		}

		int end;
		if (uri.indexOf(";") != -1) {
			end = uri.indexOf(";");
		} else if (uri.indexOf("?") != -1) {
			end = uri.indexOf("?");
		} else {
			end = uri.length();
		}

		String viewName = uri.substring(begin, end);
		if (viewName.indexOf(".") != -1) {
			viewName = viewName.substring(0, viewName.lastIndexOf("."));
		}
		if (viewName.lastIndexOf("/") != -1) {
			viewName = viewName.substring(viewName.lastIndexOf("/", 1), viewName.length());
		}
		return viewName;
	}

	@Override
	@RequestMapping(value = "/member/confirmEmail.do", method = RequestMethod.POST)
	@ResponseBody
	public boolean confirmEmail(@RequestParam("email") String email) {
	    System.out.println("confirmEmail 호출됨: " + email);
	    boolean isAvailable = memberService.isEmailAvailable(email);
    // View 이름을 명시하지 않고 데이터를 직접 전달
	    return isAvailable;
	}

	@Override
	@RequestMapping(value = "/member/modMemberForm.do", method = RequestMethod.POST)
	public ModelAndView confirmPwd(String pwd, HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		HttpSession session  = request.getSession();
		int uid = ((int)session.getAttribute("uid"));
		MemberVO curInfo = memberService.selectMyInfo(uid);
		String curPwd = (curInfo.getPwd());
		ModelAndView mav = new ModelAndView();
		System.out.println("check: "+pwd);
		System.out.println("chekc2: "+curPwd);
		if(!pwd.equals(curPwd)) {
			request.setAttribute("msg", "비밀번호가 일치하지 않습니다.");
			String referer = request.getHeader("Referer");
		       mav.setViewName("redirect:"+referer);
		}
		else {
			String viewName = (String)request.getAttribute("viewName");	
		      mav.setViewName(viewName);
		}
		return mav;
}
	
}
