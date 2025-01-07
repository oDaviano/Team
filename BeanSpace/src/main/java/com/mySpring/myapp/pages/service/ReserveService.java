package com.mySpring.myapp.pages.service;
import java.util.List;

import com.mySpring.myapp.pages.vo.ReserveVO;
public interface ReserveService {
    List<ReserveVO> listReserves();
    void addReserve(ReserveVO reserveVO);
    void removeReserve(int rsvnum);
    ReserveVO getReserveByRsvnum(int rsvnum );
}
