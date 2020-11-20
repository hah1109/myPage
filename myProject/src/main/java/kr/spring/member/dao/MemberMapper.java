package kr.spring.member.dao;



import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.spring.member.vo.MemberVO;

public interface MemberMapper {
	
	//회원번호 정할 시퀀스
	@Select("SELECT mem_num.nextval FROM dual")
	public int selectMem_num(); 

	//member테이블에 정보 입력
	@Insert("INSERT INTO member(mem_num,mem_id,mem_auth) VALUES (#{mem_num},#{mem_id},#{mem_auth})")
	public void insertMember(MemberVO member); 

	//일반회원 정보 입력
	@Insert("INSERT INTO member_detail (mem_num, t_num, mem_gender, mem_name, mem_pw, mem_cell, mem_email, mem_pic, mem_zipcode, mem_addr1, mem_addr2, mem_intro, mem_date)"
	+ "VALUES (#{mem_num}, null, #{mem_gender}, #{mem_name}, #{mem_pw}, #{mem_cell}, #{mem_email}, #{mem_pic}, #{mem_zipcode}, #{mem_addr1}, #{eme_addr2}, #{mem_intro}, SYSDATE)")
	public void insertMember_detail(MemberVO member);

	//트레이너 정보 입력
	@Insert("INSERT INTO trainer_detail (mem_num, g_addr, career, mem_gender, exp, mem_name, mem_pw, mem_cell, mem_email, mem_pic, mem_zipcode, mem_addr1, mem_addr2, mem_intro, mem_date)"+
	"VALUES (#{mem_num}, #{g_addr}, #{career}, #{mem_gender}, #{exp}, #{mem_name}, #{mem_pw}, #{mem_cell}, #{mem_email}, #{mem_pic}, #{mem_zipcode}, #{mem_addr1}, #{mem_addr2}, #{mem_intro}, SYSDATE)")
	public void insertTrainer_detail(MemberVO member);

	//id찾기
	@Select("mem_id FROM member_detail WHERE mem_phone=#{phone} && mem_email=#{mem_email}")
	public MemberVO selectFindIdMember_detail(String phone, String email);
	@Select("mem_id FROM trainer_detail WHERE mem_phone=#{phone} && mem_email=#{mem_email}")
	public MemberVO selectFindIdTrainer_detail(String phone, String email);

	//pw찾기 & 입력한 id/pw 가 db에 저장된 data와 일치하는지 확인
	//로그인 처리와 아이디 중복체크 확인에도 쓰임
	@Select("SELECT m.mem_num,m.mem_id,m.mem_auth,d.t_num,d.mem_gender,d.mem_name,d.mem_pw,d.mem_cell,d.mem_email,d.mem_pic,d.mem_zipcode,d.mem_addr1,d.mem_addr2,d.mem_intro,d.mem_date FROM member m LEFT OUTER JOIN member_detail d ON m.mem_num=d.mem_num WHERE m.mem_id=#{id}")
	public MemberVO selectCheckMember_detail(String id);
	@Select("SELECT m.mem_num,m.mem_id,m.mem_auth,d.g_addr,d.career,d.mem_gender,d.exp,d.mem_name,d.mem_pw,d.mem_cell,d.mem_email,d.mem_pic,d.mem_zipcode,d.mem_addr1,d.mem_addr2,d.mem_intro,d.mem_date FROM member m LEFT OUTER JOIN trainer_detail d ON m.mem_num=d.mem_num WHERE m.mem_id=#{id}")
	public MemberVO selectCheckTrainer_detail(String id);


	//비밀번호 변경
	@Update("UPDATE member_detail SET mem_pw=#{mem_pw} WHERE m.mem_id=#{mem_id}")
	public void updateMemberPassword(MemberVO member);
	@Update("UPDATE trainer_detail SET mem_pw=#{mem_pw} WHERE m.mem_id=#{mem_id}")
	public void updateTrainerPassword(MemberVO member);
	

	//프로필 사진 변경
	@Update("UPDATE member_detail SET mem_pic=#{mem_pic} WHERE mem_num=#{mem_num}")
	public void updateMemberPhoto(MemberVO member);
	@Update("UPDATE trainer_detail SET mem_pic=#{mem_pic} WHERE mem_num=#{mem_num}")
	public void updateTrainerPhoto(MemberVO member);

	//나머지 개인정보 변경
	@Update("UPDATE member_detail SET t_num=#{t_num},mem_cell=#{mem_cell},mem_email=#{mem_email},mem_pic=#{mem_pic},mem_zipcode=#{mem_zipcode},mem_addr1=#{mem_addr1},mem_addr2=#{mem_addr2},mem_intro=#{mem_intro} WHERE mem_num=#{mem_num}")
	public void updateMember_detail(MemberVO member);
	@Update("UPDATE trainer_detail SET g_addr=#{g_addr},career=#{career},exp=#{exp},mem_cell=#{mem_cell},mem_email=#{mem_email},mem_pic=#{mem_pic},mem_zipcode=#{mem_zipcode},mem_addr1=#{mem_addr1},mem_addr2=#{mem_addr2},mem_intro=#{mem_intro} WHERE mem_num=#{mem_num}")
	public void updateTrainer_detail(MemberVO member);

	//개인정보 마이페이지에 불러오기
	@Select("SELECT m.mem_id,d.t_num,d.mem_gender,d.mem_name,d.mem_pw,d.mem_cell,d.mem_email,d.mem_pic,d.mem_zipcode,d.mem_addr1,d.mem_addr2,d.mem_intro,d.mem_date FROM member m LEFT OUTER JOIN member_detail d ON m.mem_num=d.mem_num WHERE m.mem_num=#{mem_num}")
	public MemberVO selectMember_detail(Integer mem_num);
	@Select("SELECT m.mem_id,d.g_addr,d.career,d.mem_gender,d.exp,d.mem_name,d.mem_pw,d.mem_cell,d.mem_email,d.mem_pic,d.mem_zipcode,d.mem_addr1,d.mem_addr2,d.mem_intro,d.mem_date FROM member m LEFT OUTER JOIN trainer_detail d ON m.mem_num=d.mem_num WHERE m.mem_num=#{mem_num}")
	public MemberVO selectTrainer_detail(Integer mem_num);

	
	//회원탈퇴시 auth값 변경
	@Update("UPDATE member SET auth=3 WHERE mem_num=#{mem_num}")
	public void deleteMember(Integer mem_num);

	//회원탈퇴시 탈퇴회원 삭제
	@Delete("DELETE FROM member_detail WHERE mem_num=#{mem_num}")
	public void deleteMember_detail(int mem_num); 
	@Delete("DELETE FROM trainer_detail WHERE mem_num=#{mem_num}")
	public void deleteTrainer_detail(int mem_num); 

}
