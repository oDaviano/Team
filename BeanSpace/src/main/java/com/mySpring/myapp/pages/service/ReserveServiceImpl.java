package com.mySpring.myapp.pages.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mySpring.myapp.pages.dao.ReserveDAO;
import com.mySpring.myapp.pages.vo.ReserveVO;

@Service("reserveService")
public class ReserveServiceImpl implements ReserveService {

	
	@Autowired
	private ReserveDAO reserveDAO;
	
	@Override
	public List<ReserveVO> selectMemberReserves() {
		return reserveDAO.selectMemberReserves();
	}

	
//	@Override
//	public List<ReserveVO> listAllReserves() {
//		return reserveDAO.selectMeberReserves();
//	}

	@Override
	public int addReserve(ReserveVO reserveVO) {
		return reserveDAO.addReserve(reserveVO);
		
	}

	@Override
	public void removeReserve(int rsvnum) {
		reserveDAO.deleteReserve(rsvnum);
		
	}
	
	public int checkRsvnum(int rsvnum) {
		
		return reserveDAO.checkRsvnum(rsvnum);
	}
	
}
