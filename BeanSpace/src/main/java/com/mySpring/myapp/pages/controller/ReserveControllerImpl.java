package com.mySpring.myapp.pages.controller;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.mySpring.myapp.member.dao.MemberDAO;
import com.mySpring.myapp.member.service.MemberService;
import com.mySpring.myapp.member.vo.MemberVO;
import com.mySpring.myapp.pages.dao.ReserveDAO;
import com.mySpring.myapp.pages.service.ReserveService;
import com.mySpring.myapp.pages.vo.ReserveVO;

@Controller("reserveController")
public class ReserveControllerImpl implements ReserveController{
	
	@Autowired
	private MemberService memberService;
	@Autowired
	MemberVO memberVO;
	@Autowired
	MemberDAO memberDAO;
	
	@Autowired
	private ReserveService reserveService;

	@Autowired
	ReserveVO reserveVO;
	@Autowired
	ReserveDAO reserveDAO;
	
//	@Override
//	@RequestMapping(value = "/pages/list_reservation_detail.do", method = RequestMethod.GET)
//	public ModelAndView detail(@RequestParam("rsvnum") int rsvnum, HttpServletRequest request,
//			HttpServletResponse response) throws Exception {
//		String viewName = (String) request.getAttribute("viewName");
//		ReserveVO reserveVO = reserveService.getReserveByRsvnum(rsvnum);
//		if (reserveVO == null) {
//			throw new Exception("Reservation not found for rsvnum: " + rsvnum);
//		}
//		ModelAndView mav = new ModelAndView();
//		mav.setViewName(viewName);
//		mav.addObject("reserve", reserveVO);
//		return mav;
//	}

//	@Override
//	@RequestMapping(value = "/pages/list_reservation.do", method = RequestMethod.GET)
//	public ModelAndView listReserves(HttpServletRequest request, HttpServletResponse response) throws Exception {
//		String viewName = (String) request.getAttribute("viewName");
//		List<ReserveVO> reservesList = reserveService.listReserves();
//		ModelAndView mav = new ModelAndView(viewName);
//		mav.addObject("reservesList", reservesList);
//		return mav;
//	}

	@Override
	@RequestMapping(value = "/reservation/reservation_confirm.do", method = RequestMethod.POST)
	public ModelAndView addReserve(@ModelAttribute("reserve") ReserveVO reserve,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		int uid = 0;
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		int result = 0;	
		int chkrsv = reserveService.selectCount();

		reserve.setRsvnum(++chkrsv);
		
		result = reserveService.addRsvCount();


		if(session.getAttribute("isLogOn")!=null && (boolean)session.getAttribute("isLogOn") ) {
		uid = (int)session.getAttribute("userid");
		MemberVO edit = memberService.selectMyInfo(uid);
		reserve.setEmail(edit.getEmail());
		edit.setMileage(reserve.getMileage()+ edit.getMileage());
		result = memberService.updateMileage(edit);
		}
	
		System.out.println("email: "+ reserve.getEmail());

		reserve.setUID(uid);
		result = reserveService.addReserve(reserve);
		reserveService.addRsvCount();

		return mav;
	}

	@Override
	@RequestMapping(value = "/pages/reservation_cancel.do", method = RequestMethod.POST)
	public ModelAndView removeReserve(@ModelAttribute("rsvnum") int rsvnum, @ModelAttribute("mileage")int mileage,  HttpServletRequest request,
			HttpServletResponse response) throws Exception {
	    HttpSession session = request.getSession();

	    int uid =(Integer)session.getAttribute("userid");	    
	    System.out.println("rsvnum: "+ rsvnum);
		reserveService.removeReserve(rsvnum);
		
		if((boolean)session.getAttribute("isLogOn")){
		MemberVO edit = memberService.selectMyInfo(uid);
		edit.setMileage(edit.getMileage()-mileage);
		memberService.updateMember(edit);
		}
		
		ModelAndView mav = new ModelAndView("redirect:/pages/memrsvlist.do");
		
		return mav;
	}

	@Override
	@RequestMapping(value = "/pages/list_reservation.do", method = RequestMethod.GET)
	public ModelAndView selectReserves(@RequestParam("email")String email, HttpServletRequest request, HttpServletResponse response) throws Exception {

		
		System.out.println(email);
		List<ReserveVO> reservesList = reserveService.selectMemberReserves(email);
		ModelAndView mav = new ModelAndView("/pages/list_reservation");
		mav.addObject("reservesList", reservesList);
		
		return mav;
	}
	

	@Override
	@RequestMapping(value = "/pages/memrsvlist.do", method = RequestMethod.GET)
	public ModelAndView selectMemberReserves(HttpServletRequest request, HttpServletResponse response) throws Exception {

		
		HttpSession session = request.getSession();
		ModelAndView mav;
		if(session.getAttribute("isLogOn")!=null &&(boolean)session.getAttribute("isLogOn") ) {
		String viewName = (String) request.getAttribute("viewName");

		int uid = (int)session.getAttribute("userid");
		

		List<ReserveVO> reservesList = reserveService.selectMemberReserves(uid);
		mav = new ModelAndView("/pages/list_reservation");
		mav.addObject("reservesList", reservesList);
		}
		else {
			String viewName = (String) request.getAttribute("viewName");
			mav = new ModelAndView("redirect:/main.do");

		}
		return mav;
	}

	@Override
	@RequestMapping(value = "/reservation/reservation.do", method = RequestMethod.POST)
	public ModelAndView buy( HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();

		
		String viewName = (String) request.getAttribute("viewName");
			ModelAndView mav = new ModelAndView(viewName);
			return mav;
	}

	@Override
	@RequestMapping(value = "/pages/reservecheck.do", method = RequestMethod.POST)
	public ModelAndView checkRsvnum(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();

		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		return mav;
	}

	@Override
	@RequestMapping(value = "/reservation/reservation_detail.do", method = RequestMethod.GET)
	public ModelAndView viewRsvDetail(@ModelAttribute("rsvnum") int rsvnum, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		request.setCharacterEncoding("utf-8");
		
		String viewName = (String)request.getAttribute("viewName");
		reserveVO = reserveService.viewDetail(rsvnum);
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("reserve",reserveVO);
		return mav;
	}

	@Override
	@RequestMapping(value = "/pages/non_member_authentication.do", method = RequestMethod.GET)
	public ModelAndView nonmemberAuth(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		String viewName = (String)request.getAttribute("viewName");	
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}


}
