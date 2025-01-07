package com.mySpring.myapp.pages.dao;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;
import com.mySpring.myapp.pages.vo.ReserveVO;
public class ReserveDAOImpl implements ReserveDAO{

	@Autowired
	private SqlSession sqlSession;
	@Override
	public List<ReserveVO> selectAllReserves() throws DataAccessException {
	List<ReserveVO> reservesList = null;
	reservesList = sqlSession.selectList("mapper.pagees.selectAllReserves");
		return 	reservesList;
	}
	@Override
	public int insertReserve(ReserveVO reserveVO)throws DataAccessException {
		return sqlSession.insert("mapper.pages.deleteCampingSite", reserveVO);
	}

	@Override
	public int deleteReserve(int rsvnum) {
		return sqlSession.delete("mapper.pages.deleteCampingSite", rsvnum);
	}

	@Override
	public ReserveVO selectReserveByRsvnum(int rsvnum) {
		return sqlSession.selectOne("mapper.pages.selectReservesByRsvnum", rsvnum);
	}

	

}
