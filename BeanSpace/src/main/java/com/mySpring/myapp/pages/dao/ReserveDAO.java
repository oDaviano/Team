package com.mySpring.myapp.pages.dao;
import java.util.List;

import org.springframework.dao.DataAccessException;

import com.mySpring.myapp.pages.vo.ReserveVO;
public interface ReserveDAO {
	public int selectCount()throws DataAccessException;
	public int addRsvCnt() throws DataAccessException; 
	List<ReserveVO> selectMemberReserves(int uid);
	List<ReserveVO> selectMemberReserves(String email);
	int addReserve(ReserveVO reserveVO);
	int deleteReserve(int rsvnum);
	int checkRsvnum();
	ReserveVO viewDetail (int rsvnum);
}
