package kr.spring.member.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.spring.member.dao.MemberMapper;
import kr.spring.member.vo.MemberVO;

@Service("memberService")
public class MemberServiceImpl implements MemberService{

	@Resource
	private MemberMapper memberMapper;

	//일반회원 회원가입 사이클
	@Override
	public void insertMember_detail(MemberVO member) {
		//3개의 메서드가 전부 성공해야지만 commit
		//아닐 경우 rollback
		member.setMem_num(memberMapper.selectMem_num());//시퀀스 적용하고
		memberMapper.insertMember(member);//사용자 공통인 member테이블에 저장하고
		memberMapper.insertMember_detail(member);//일반회원 테이블에 저장한다
	}

	//트에이너 회원가입 사이클
	@Override
	public void insertTrainer_detail(MemberVO member) {
		//3개의 메서드가 전부 성공해야지만 commit
		//아닐 경우 rollback
		member.setMem_num(memberMapper.selectMem_num());//시퀀스 적용하고
		memberMapper.insertTrainer(member);//사용자 공통인 member테이블에 저장하고
		memberMapper.insertTrainer_detail(member);//트에이너 테이블에 저장한다
	}

	@Override
	public void deleteMember_detail(int mem_num) {
		// TODO Auto-generated method stub

	}

	@Override
	public void deleteTrainer_detail(int mem_num) {
		// TODO Auto-generated method stub

	}

	//일반회원 id찾는 메서드
	@Override
	public MemberVO selectFindIdMember_detail(String cell, String email) {
		return memberMapper.selectFindIdMember_detail(cell, email);
	}
	
	//트레이너 id찾는 메서드
	@Override
	public MemberVO selectFindIdTrainer_detail(String cell, String email) {
		return memberMapper.selectFindIdTrainer_detail(cell, email);
	}

	//일반회원 pw찾는 메서드
	@Override
	public MemberVO selectFindPwMember_detail(String id, String cell) {
		return memberMapper.selectFindPwMember_detail(id, cell);

	}

	//트레이너 pw찾는 메서드
	@Override
	public MemberVO selectFindPwTrainer_detail(String id, String cell) {
		return memberMapper.selectFindPwTrainer_detail(id, cell);
	}

	//일반회원 로그인 처리와 아이디 중복체크 확인에 쓰일 메서드
	@Override
	public MemberVO selectCheckMember_detail(String id) {
		return memberMapper.selectCheckMember_detail(id);
	}

	//트레이너 로그인 처리와 아이디 중복체크 확인에 쓰일 메서드
	@Override
	public MemberVO selectCheckTrainer_detail(String id) {
		return memberMapper.selectCheckTrainer_detail(id);
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
