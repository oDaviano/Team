package com.mySpring.myapp.pages.dao;
import java.util.List;
import com.mySpring.myapp.pages.vo.ReserveVO;
public interface ReserveDAO {
	List<ReserveVO> selectAllReserves();
	int insertReserve(ReserveVO reserveVO);
	int deleteReserve(int rsvnum);
	ReserveVO selectReserveByRsvnum(int rsvnum);

}
