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
	public int selectCount() throws DataAccessException {
		return sqlSession.selectOne("mapper.reserve.selectRsvCount");
	}

	@Override
	public int addRsvCnt() throws DataAccessException {
		return  sqlSession.update("mapper.reserve.addRsvCount");
	}
	
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
	public List<ReserveVO> selectMemberReserves(int uid) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("mapper.reserve.selectMemberReservesByUID", uid);
	}

	@Override
	public int addReserve(ReserveVO reserveVO) {
		return sqlSession.insert("mapper.reserve.addReserve", reserveVO);
	}


	@Override
	public int checkRsvnum() {
		return sqlSession. selectOne("mapper.reserve.checkRsvnum");
	}

	@Override
	public ReserveVO viewDetail(int rsvnum) {
		return sqlSession. selectOne("mapper.reserve.rsvDetail", rsvnum);
	}




	

}
