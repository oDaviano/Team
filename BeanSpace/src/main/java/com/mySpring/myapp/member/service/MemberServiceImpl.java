package com.mySpring.myapp.member.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.mySpring.myapp.member.dao.MemberDAO;
import com.mySpring.myapp.member.vo.MemberVO;



@Service("memberService")
@Transactional(propagation = Propagation.REQUIRED)
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberDAO memberDAO;
	
	@Override
	public MemberVO selectMyInfo(String email) throws DataAccessException {
		return memberDAO.selectMyInfo(email);
	}

	@Override
	public List listMembers() throws DataAccessException {
		List membersList = null;
		membersList = memberDAO.selectAllMemberList();
		return membersList;
	}

	@Override
	public int addMember(MemberVO member) throws DataAccessException {
		return memberDAO.insertMember(member);
	}

	@Override
	public int removeMember(String id) throws DataAccessException {
		return memberDAO.deleteMember(id);
	}
	
	@Override
	public MemberVO login(MemberVO memberVO) throws Exception{

		return memberDAO.loginById(memberVO);
	}
	
	@Override
    public boolean isEmailAvailable(String email) throws DataAccessException {
        int count = memberDAO.checkEmail(email);
        return count == 0; // email�씠 議댁옱�븯吏� �븡�쑝硫� true 諛섑솚
    }

	@Override
	public int updateMember(MemberVO memberVO) throws DataAccessException {
		return memberDAO.updateMember(memberVO);
	}


	

}
