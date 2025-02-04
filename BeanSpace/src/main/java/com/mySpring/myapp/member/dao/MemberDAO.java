package com.mySpring.myapp.member.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.mySpring.myapp.member.vo.MemberVO;


public interface MemberDAO {
		public int selectCount()throws DataAccessException;
		public int addUserID() throws DataAccessException; 
	 public MemberVO  selectMyInfo(int uid)throws DataAccessException ;
	 //public List selectAllMemberList() throws DataAccessException;
	 public int insertMember(MemberVO memberVO) throws DataAccessException ;
	 //public int deleteMember(String email) throws DataAccessException;
	 public MemberVO loginById(MemberVO memberVO) throws DataAccessException;
	 public int checkEmail(String email) throws DataAccessException;
	 public String findPwd(String email)  throws DataAccessException;
	 public boolean checkPwd(String pwd) throws DataAccessException;
	 public int updateMember(MemberVO memberVO) throws DataAccessException ;
	 public int updateMileage(MemberVO memberVO)throws DataAccessException ;

}
