package com.mySpring.myapp.pages.service;
import java.util.List;
import java.util.Date;
import org.springframework.dao.DataAccessException;
import com.mySpring.myapp.pages.vo.ReserveVO;
public interface ReserveService {
//    List<ReserveVO> listAllReserves();
	public int selectCount()throws DataAccessException;
	public int addRsvCount() throws DataAccessException;
    int addReserve(ReserveVO reserveVO);
    void removeReserve(int rsvnum);
    List<ReserveVO> selectMemberReserves(int uid);
  List<ReserveVO> selectMemberReserves(String email);
  public int checkRsvnum();
  public ReserveVO viewDetail(int rsvnum);
}
