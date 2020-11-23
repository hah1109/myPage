package kr.spring.member.service;

import kr.spring.member.vo.MemberVO;

public interface MemberService {
	
	/*//유저 정보 기입 관련 메서드
	public int selectMem_num(); //시퀀스 가져오고
	public void insertMember(MemberVO member); //공통 멤버테이블에 넣고 
	public void insertMember_detail(MemberVO member); //일반회원 회원정보 넣고
	 */
	public void insertMember_detail(MemberVO member);

	/*public int selectMem_num(); //시퀀스 가져오고
	public void insertTrainer(MemberVO member); //공통 멤버테이블에 넣고 
	public void insertTrainer_detail(MemberVO member); //트레이너 회원정보 넣고 가 한 사이클
	 */
	public void insertTrainer_detail(MemberVO member);


	//회원탈퇴시 auth값 변경
	//회원탈퇴시 탈퇴회원 삭제
	/*public void deleteMember(Integer mem_num); //auth값 3(탈퇴회원)으로 변경
	public void deleteMember_detail(MemberVO member); //일반회원 탈퇴
	 */
	public void deleteMember_detail(int mem_num);

	/*	
 	public void deleteMember(Integer mem_num); //auth값 3(탈퇴회원)으로 변경
	public void deleteTrainer_detail(MemberVO member); //트레이너 탈퇴
	 */
	public void deleteTrainer_detail(int mem_num);

	//id찾기
	public MemberVO selectFindIdMember_detail(String phone, String email);
	public MemberVO selectFindIdTrainer_detail(String phone, String email);

	//pw찾기 & 입력한 id/pw 가 db에 저장된 data와 일치하는지 확인
	//로그인 처리와 아이디 중복체크 확인에도 쓰임
	public MemberVO selectCheckMember_detail(String id);
	public MemberVO selectCheckTrainer_detail(String id);

	//비밀번호 변경
	public void updateMemberPassword(MemberVO member);
	public void updateTrainerPassword(MemberVO member);

	//프로필 사진 변경
	public void updateMemberPhoto(MemberVO member);
	public void updateTrainerPhoto(MemberVO member);

	//나머지 개인정보 변경
	public void updateMember_detail(MemberVO member);
	public void updateTrainer_detail(MemberVO member);

	//개인정보 마이페이지에 불러오기
	public MemberVO selectMember_detail(int mem_num);
	public MemberVO selectTrainer_detail(int mem_num);
}
