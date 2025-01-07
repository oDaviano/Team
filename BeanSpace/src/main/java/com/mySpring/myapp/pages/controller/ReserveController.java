package com.mySpring.myapp.pages.controller;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.servlet.ModelAndView;

import com.mySpring.myapp.pages.vo.ReserveVO;

public interface ReserveController {

	ModelAndView addReserve(ReserveVO reserve, HttpServletRequest request, HttpServletResponse response)
			throws Exception;

	ModelAndView removeReserve(int id, HttpServletRequest request, HttpServletResponse response) throws Exception;

	ModelAndView main(HttpServletRequest request, HttpServletResponse response);

	ModelAndView detail(HttpServletRequest request, HttpServletResponse response);

	ModelAndView listReserves(HttpServletRequest request, HttpServletResponse response) throws Exception;
}
