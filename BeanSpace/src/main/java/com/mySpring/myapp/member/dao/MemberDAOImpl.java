package com.mySpring.myapp.member.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.mySpring.myapp.member.vo.MemberVO;


@Repository("memberDAO")
public class MemberDAOImpl implements MemberDAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public int selectCount() throws DataAccessException {
		return sqlSession.selectOne("mapper.member.selectCount");
	}
	
	@Override
	public int addUserID() throws DataAccessException {
		int result = sqlSession.update("mapper.member.addUIDCount");
		return result;
	}
	
	@Override
	public MemberVO  selectMyInfo(int uid)throws DataAccessException {
		MemberVO myInfo = sqlSession.selectOne("mapper.member.selectMyInfo", uid);
		return myInfo;
		
	}
//	@Override
//	public List selectAllMemberList() throws DataAccessException {
//		List<MemberVO> membersList = null;
//		membersList = sqlSession.selectList("mapper.member.selectAllMemberList");
//		return membersList;
//	}

	@Override
	public int insertMember(MemberVO memberVO) throws DataAccessException {
		int result = sqlSession.insert("mapper.member.insertMember", memberVO);
		return result;
	}

//	@Override
//	public int deleteMember(String email) throws DataAccessException {
//		int result = sqlSession.delete("mapper.member.deleteMember", email);
//		return result;
//	}
	
	@Override
	public MemberVO loginById(MemberVO memberVO) throws DataAccessException{
		  MemberVO vo = sqlSession.selectOne("mapper.member.loginById",memberVO);
//			System.out.println(vo.getEmail()+"/"+vo.getPwd()+"/"+vo.getName()+"/"+vo.getPhone()+"/"+vo.getCarnum()+"/"+vo.getMileage());
		return vo;
	}
	
	@Override
    public int checkEmail(String email) throws DataAccessException {
        return sqlSession.selectOne("mapper.member.checkEmail", email);
    }
	
	@Override
	public boolean checkPwd(String pwd) throws DataAccessException {
		 return sqlSession.selectOne("mapper.member.checkPwd", pwd);
	}
	
	@Override
	public int updateMember(MemberVO memberVO) throws DataAccessException {
		int result = sqlSession.update("mapper.member.updateMember", memberVO);
		return result;
	}

	@Override
	public int updateMileage(MemberVO memberVO) throws DataAccessException {
		return sqlSession.update("mapper.member.updateMileage",memberVO);
	}

	@Override
	public String findPwd(String email) throws DataAccessException {
		return sqlSession.selectOne("mapper.member.findPwd",email);

	}




}
