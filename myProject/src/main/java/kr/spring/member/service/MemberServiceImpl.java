package kr.spring.member.service;

import org.springframework.stereotype.Service;

import kr.spring.member.vo.MemberVO;

@Service("memberService")
public class MemberServiceImpl implements MemberService{

	@Override
	public void insertMember_detail(MemberVO member) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void insertTrainer_detail(MemberVO member) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteMember_detail(int mem_num) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteTrainer_detail(int mem_num) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public MemberVO selectFindIdMember_detail(String phone, String email) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public MemberVO selectFindIdTrainer_detail(String phone, String email) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public MemberVO selectCheckMember_detail(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public MemberVO selectCheckTrainer_detail(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateMemberPassword(MemberVO member) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateTrainerPassword(MemberVO member) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateMemberPhoto(MemberVO member) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateTrainerPhoto(MemberVO member) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateMember_detail(MemberVO member) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateTrainer_detail(MemberVO member) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public MemberVO selectMember_detail(int mem_num) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public MemberVO selectTrainer_detail(int mem_num) {
		// TODO Auto-generated method stub
		return null;
	}

}
