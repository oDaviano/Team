package com.mySpring.myapp.pages.service;
import java.util.List;
import java.util.Date;
import com.mySpring.myapp.pages.vo.ReserveVO;
public interface ReserveService {
//    List<ReserveVO> listAllReserves();
    int addReserve(ReserveVO reserveVO);
    void removeReserve(int rsvnum);
  List<ReserveVO> selectMemberReserves(String email);
  public int checkRsvnum(int rsvnum);
  public ReserveVO viewDetail(int rsvnum);
}
