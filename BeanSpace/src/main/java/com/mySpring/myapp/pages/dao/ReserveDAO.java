package com.mySpring.myapp.pages.dao;
import java.util.List;
import com.mySpring.myapp.pages.vo.ReserveVO;
public interface ReserveDAO {
	List<ReserveVO> selectMemberReserves();
	int addReserve(ReserveVO reserveVO);
	int deleteReserve(int rsvnum);
	int checkRsvnum(int rsvnum);
}
