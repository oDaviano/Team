package com.mySpring.myapp.pages.controller;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mySpring.myapp.member.vo.MemberVO;
import com.mySpring.myapp.pages.vo.ReserveVO;

public interface ReserveController {
	
	ModelAndView buy(HttpServletRequest request,RedirectAttributes redirectAttributes,  HttpServletResponse response) throws Exception;
	ModelAndView addReserve(ReserveVO reserve, HttpServletRequest request, HttpServletResponse response)
			throws Exception;
	ModelAndView removeReserve(int rsvnum,int mileage, HttpServletRequest request, HttpServletResponse response) throws Exception;
//	ModelAndView detail(@RequestParam("rsvnum") int rsvnum, HttpServletRequest request, HttpServletResponse response)throws Exception;
	ModelAndView selectMemberReserves( HttpServletRequest request, HttpServletResponse response) throws Exception;
	ModelAndView selectReserves(String email, HttpServletRequest request, HttpServletResponse response) throws Exception;
	ModelAndView checkRsvnum(HttpServletRequest request, HttpServletResponse response) throws Exception;
	ModelAndView viewRsvDetail(int rsvnum, HttpServletRequest request, HttpServletResponse response) throws Exception;
	ModelAndView nonmemberAuth( HttpServletRequest request, HttpServletResponse response) throws Exception;
}
