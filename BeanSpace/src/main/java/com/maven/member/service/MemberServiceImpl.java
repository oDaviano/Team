package com.maven.member.service;

import java.util.List;
import org.springframework.dao.DataAccessException;
import com.maven.member.dao.MemberDAO;

public class MemberServiceImpl implements MemberService {
	private MemberDAO memberDAO;
	
	public void setMemberDAO(MemberDAO memberDAO) {
		this.memberDAO = memberDAO;
	}
	
	public List listMembers() throws DataAccessException {
		List membersList = null;
		membersList = memberDAO.selectAllMembers();
		
//		List membersList = memberDAO.selectAllMembers();
		
		return membersList;
	}
}
