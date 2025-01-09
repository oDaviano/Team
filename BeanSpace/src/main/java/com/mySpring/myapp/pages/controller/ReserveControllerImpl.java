package com.mySpring.myapp.pages.controller;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.mySpring.myapp.pages.service.ReserveService;
import com.mySpring.myapp.pages.vo.ReserveVO;

@Controller("reserveController")
public class ReserveControllerImpl implements ReserveController{
	
	@Autowired
	private ReserveService reserveService;

	@Override
	@RequestMapping(value = "/pages/list_reservation_detail.do", method = RequestMethod.GET)
	public ModelAndView detail(@RequestParam("rsvnum") int rsvnum, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ReserveVO reserveVO = reserveService.getReserveByRsvnum(rsvnum);
		if (reserveVO == null) {
			throw new Exception("Reservation not found for rsvnum: " + rsvnum);
		}
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		mav.addObject("reserve", reserveVO);
		return mav;
	}

	@Override
	@RequestMapping(value = "/pages/list_reservation.do", method = RequestMethod.GET)
	public ModelAndView listReserves(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		List<ReserveVO> reservesList = reserveService.listReserves();
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("reservesList", reservesList);
		return mav;
	}

	@Override
	@RequestMapping(value = "/pages/reservation_confirm.do", method = RequestMethod.POST)
	public ModelAndView addReserve(@ModelAttribute("reserve") ReserveVO reserve,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		reserveService.addReserve(reserve);
		ModelAndView mav = new ModelAndView("redirect:/pages/list_reservation.do");
		return mav;
	}

	@Override
	@RequestMapping(value = "/pages/list_reservation_cancel.do", method = RequestMethod.GET)
	public ModelAndView removeReserve(@RequestParam("rsvnum") int rsvnum, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		reserveService.removeReserve(rsvnum);
		ModelAndView mav = new ModelAndView("redirect:/pages/list_reservation.do");
		return mav;
	}


}
