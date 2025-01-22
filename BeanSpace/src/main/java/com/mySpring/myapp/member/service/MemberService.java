package com.mySpring.myapp.member.service;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.mySpring.myapp.member.vo.MemberVO;

public interface MemberService {
	public int selectCount() throws DataAccessException;
	public int addUIDCount()throws DataAccessException;
	public MemberVO selectMyInfo(int uid)throws DataAccessException;
	// public List listMembers() throws DataAccessException;
	 public int addMember(MemberVO memberVO) throws DataAccessException;
	// public int removeMember(String id) throws DataAccessException;
	 public int updateMember(MemberVO memberVO) throws DataAccessException;
	 public MemberVO login(MemberVO memberVO) throws Exception;
	 public boolean isEmailAvailable(String email) throws DataAccessException;
	 public boolean isPwdAvailable(String pwd) throws DataAccessException;
	 public int updateMileage (MemberVO memberVO) throws DataAccessException;
}
