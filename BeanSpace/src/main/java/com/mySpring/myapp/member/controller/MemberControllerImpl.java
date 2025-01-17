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
		System.out.println(viewName);
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}
	
//	@Override 
//	@RequestMapping(value="/member/listMembers.do" ,method = RequestMethod.GET)
//	public ModelAndView listMembers(HttpServletRequest request, HttpServletResponse response) throws Exception {
//		String viewName = (String)request.getAttribute("viewName");
//		System.out.println("listviewName: " + viewName);
//		List membersList = memberService.listMembers();
//		ModelAndView mav = new ModelAndView(viewName);
//		mav.addObject("membersList", membersList);
//		return mav;
//	}

	@Override
	@RequestMapping(value="/member/addMember.do" ,method = RequestMethod.POST)
	public ModelAndView addMember(@ModelAttribute("member") MemberVO member,
			                  HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		int result = 0;
		result = memberService.addMember(member);
		ModelAndView mav = new ModelAndView("redirect:/member/user_info.do");
		return mav;
	}
	
//	@Override
//	@RequestMapping(value="/member/removeMember.do" ,method = RequestMethod.GET)
//	public ModelAndView removeMember(@RequestParam("id") String id, 
//			           HttpServletRequest request, HttpServletResponse response) throws Exception{
//		request.setCharacterEncoding("utf-8");
////		String user_id = request.getParameter("id");
//		memberService.removeMember(id);
//		ModelAndView mav = new ModelAndView("redirect:/member/listMembers.do");
//		return mav;
//	}
	/*
	@RequestMapping(value = { "/member/loginForm.do", "/member/memberForm.do" }, method =  RequestMethod.GET)
	@RequestMapping(value = "/member/*Form.do", method =  RequestMethod.GET)
	public ModelAndView form(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = getViewName(request);
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}
	*/
	
	@Override
	@RequestMapping(value = "/member/login.do", method = RequestMethod.POST)
	public ModelAndView login(@ModelAttribute("member") MemberVO member,
				              RedirectAttributes rAttr,
		                       HttpServletRequest request, HttpServletResponse response) throws Exception {
	ModelAndView mav = new ModelAndView();
//	System.out.println(member.getEmail()+"/"+member.getPwd()+"/"+member.getName()+"/"+member.getPhone()+"/"+member.getCarnum()+"/"+member.getMileage());
	memberVO = memberService.login(member);
	if(memberVO != null) {
	    HttpSession session = request.getSession();
	    session.setAttribute("member", memberVO);
	    session.setAttribute("isLogOn", true);
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
		session.removeAttribute("member");
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
		System.out.println("info: "+session.getAttribute("member"));
		ModelAndView mav = new ModelAndView();
//		if(!(boolean) session.getAttribute("isLogOn")){
//		    
//		 	   mav.setViewName("redirect:/member/loginForm.do");	
//		    }
		mav.setViewName(viewName); 
		mav.addObject("member",memberVO);
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
	
//	@Override
//	@RequestMapping(value = "/member/confirmEmail.do", method = RequestMethod.POST)
//	public ModelAndView confirmEmail(@RequestParam("email") String email) {
//	    System.out.println("confirmEmail 호출됨: " + email);
//	    boolean isAvailable = memberService.isEmailAvailable(email);
//	    ModelAndView mav = new ModelAndView("jsonView");
//	    mav.addObject("isAvailable", isAvailable);
//	    return mav;
//	}

	@Override
	@RequestMapping(value = "/member/confirmEmail.do", method = RequestMethod.POST)
	@ResponseBody
	public boolean confirmEmail(@RequestParam("email") String email) {
	    System.out.println("confirmEmail 호출됨: " + email);
	    boolean isAvailable = memberService.isEmailAvailable(email);
    // View 이름을 명시하지 않고 데이터를 직접 전달
	    System.out.println(isAvailable);

	   // mav.addObject("isAvailable", isAvailable);
	    return isAvailable;
	}




}
