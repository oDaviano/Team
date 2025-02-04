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
	public int selectCount() throws DataAccessException {
			return memberDAO.selectCount();
	}

	@Override
	public int addUIDCount() throws DataAccessException {

		return memberDAO.addUserID();
	}
	@Override
	public MemberVO selectMyInfo(int uid) throws DataAccessException {
		return memberDAO.selectMyInfo(uid);
	}

//	@Override
//	public List listMembers() throws DataAccessException {
//		List membersList = null;
//		membersList = memberDAO.selectAllMemberList();
//		return membersList;
//	}

	@Override
	public int addMember(MemberVO member) throws DataAccessException {
		return memberDAO.insertMember(member);
	}

//	@Override
//	public int removeMember(String id) throws DataAccessException {
//		return memberDAO.deleteMember(id);
//	}
	
	@Override
	public MemberVO login(MemberVO memberVO) throws Exception{
		return memberDAO.loginById(memberVO);
	}
	
	@Override
    public boolean isEmailAvailable(String email) throws DataAccessException {
        int count = memberDAO.checkEmail(email);
        return count == 0; 
    }

	@Override
	public int updateMember(MemberVO memberVO) throws DataAccessException {
		return memberDAO.updateMember(memberVO);
	}

	@Override
	public boolean isPwdAvailable(String pwd) throws DataAccessException {
		return memberDAO.checkPwd(pwd);
	}

	@Override
	public int updateMileage(MemberVO memberVO) throws DataAccessException {
		return memberDAO.updateMileage(memberVO);
	}

	@Override
	public String findPwd(String email) throws DataAccessException {
		return memberDAO.findPwd(email);
	}
	
	
}
