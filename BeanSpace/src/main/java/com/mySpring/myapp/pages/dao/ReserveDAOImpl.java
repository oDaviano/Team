package com.mySpring.myapp.pages.dao;
import java.util.List;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;
import com.mySpring.myapp.pages.vo.ReserveVO;

@Repository("reserveDAO")
public class ReserveDAOImpl implements ReserveDAO{

	@Autowired
	private SqlSession sqlSession;
	/*
	 * @Override public List<ReserveVO> selectAllReserves() throws
	 * DataAccessException { List<ReserveVO> reservesList = null; reservesList =
	 * sqlSession.selectList("mapper.pages.selectAllReserves"); return reservesList;
	 * }
	 */

	@Override
	public int deleteReserve(int rsvnum) {
		return sqlSession.delete("mapper.reserve.deleteReserve", rsvnum);
	}

	@Override
	public List<ReserveVO> selectMemberReserves(String email) {
//		List<ReserveVO> reservesList = null;
//		reservesList = sqlSession.selectList("mapper.reserve.selectMemberReserves", email);
		return sqlSession.selectList("mapper.reserve.selectMemberReserves", email);
	}
	@Override
	public int addReserve(ReserveVO reserveVO) {
		System.out.println("rsvnum values: "+reserveVO.getRsvnum() +", "+reserveVO.getEmail());
		return sqlSession.insert("mapper.reserve.addReserve", reserveVO);
	}


	@Override
	public int checkRsvnum(int rsvnum) {
		return sqlSession. selectOne("mapper.reserve.checkRsvnum", rsvnum);
	}

	@Override
	public ReserveVO viewDetail(int rsvnum) {
		return sqlSession. selectOne("mapper.reserve.rsvDetail", rsvnum);
	}

	

}
