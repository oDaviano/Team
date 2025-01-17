package com.mySpring.myapp.member.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.mySpring.myapp.member.vo.MemberVO;


public interface MemberDAO {
	 public MemberVO  selectMyInfo(String email)throws DataAccessException ;
	 public List selectAllMemberList() throws DataAccessException;
	 public int insertMember(MemberVO memberVO) throws DataAccessException ;
	 public int deleteMember(String email) throws DataAccessException;
	 public MemberVO loginById(MemberVO memberVO) throws DataAccessException;
	 public int checkEmail(String email) throws DataAccessException;

}
