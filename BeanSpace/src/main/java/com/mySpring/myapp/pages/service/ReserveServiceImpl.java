package com.mySpring.myapp.pages.service;

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
	public List<ReserveVO> listReserves() {
		return reserveDAO.selectAllReserves();
	}

	@Override
	public void addReserve(ReserveVO reserveVO) {
		reserveDAO.insertReserve(reserveVO);
		
	}

	@Override
	public void removeReserve(int rsvnum) {
		reserveDAO.deleteReserve(rsvnum);
		
	}

	@Override
	public ReserveVO getReserveByRsvnum(int rsvnum) {
		return reserveDAO.selectReserveByRsvnum(rsvnum);
	}
	
}
