package kr.spring.member.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.spring.member.service.MemberService;
import kr.spring.member.vo.MemberVO;
import kr.spring.util.LoginCheckException;

@Controller
public class MemberController {
	
	@Resource
	private MemberService memberService;
	
	
	//유저 타입 폼
	//처리할게 없으니 get/post 안씀
	@RequestMapping("/member/userType.do")
	public String formUserType() {

		/*
		if(일반회원){
			//definition 설정명을 호출
			return “memberRegister”;
		}
		else{//트레이너
			//definition 설정명을 호출
			return “trainerRegister”
			
		}
		*/
		
		return "";
	}

	//일반회원 회원가입 폼
	@RequestMapping(value="/member/memberRegister.do", method=RequestMethod.GET)
	public String formMemberRegister() {
		//definition 설정명을 호출
		return "memberRegister";
	}

	//일반회원 회원가입 처리
	@RequestMapping(value="/member/memberRegister.do", method=RequestMethod.POST)
	public String submitMemberRegister(@Valid MemberVO memberVO, BindingResult result) {

		
		memberService.insertMember_detail(memberVO);
		
		
		//definition 설정명을 호출
		return "redirect:/main/main.do";
	}

	//트레이너 회원가입 폼
	@RequestMapping(value="/member/trainerRegister.do", method=RequestMethod.GET)
	public String form() {
		//definition 설정명을 호출
		return "trainerRegister";
	}

	//트레이너 회원가입 처리
	@RequestMapping(value="/member/trainerRegister.do", method=RequestMethod.POST)
	public String submitTrainerRegister(@Valid MemberVO memberVO, BindingResult result) {
		
		
		memberService.insertTrainer_detail(memberVO);
		
		//definition 설정명을 호출
		return "redirect:/main/main.do";
	}

	//로그인 폼
	@RequestMapping(value="/member/login.do", method=RequestMethod.GET)
	public String formLogin() {	
		return "memberLogin";
	}

	//일반회원 로그인 처리
	@RequestMapping(value="/member/memberlogin.do", method=RequestMethod.POST)
	public String submitMemberLogin(@Valid MemberVO memberVO, BindingResult result, HttpSession session) {

		//아이디와 비밀번호가 일치하는지 확인
		try {

			MemberVO member = memberService.selectCheckMember_detail(memberVO.getMem_id());
			boolean check = false;

			//id값이 있는 경우
			if(memberVO != null) {
				//비밀번호 일치여부 체크
				check = memberVO.isCheckedPasswd(member.getMem_pw());
			}

			if(check) {
				//인증 성공, 로그인 처리
				session.setAttribute("user", member);
				return "redirect:/main/main.do";
			}else {
				//인증 실패
				throw new LoginCheckException();
			}

		}catch(LoginCheckException e) {
			//인증 실패로 로그인폼 호출
			result.reject("invalidIdOrPassword");

			return formLogin();
		}
	}




	//트레이너 로그인 처리
	@RequestMapping(value="/member/trainerlogin.do", method=RequestMethod.POST)
	public String submitTrainerLogin(@Valid MemberVO memberVO, BindingResult result, HttpSession session) {

	//아이디와 비밀번호가 일치하는지 확인
	try {
		MemberVO trainer = memberService.selectCheckTrainer_detail(memberVO.getMem_id());
		boolean check = false;
				
		//id값이 있는 경우
		if(memberVO != null) {
			//비밀번호 일치여부 체크
			check = memberVO.isCheckedPasswd(trainer.getMem_pw());
		}
				
		if(check) {
			//인증 성공, 로그인 처리
			session.setAttribute("user", trainer);
			return "redirect:/main/main.do";
		}else {
			//인증 실패
			throw new LoginCheckException();
			}
				
			}catch(LoginCheckException e) {
				//인증 실패로 로그인폼 호출
				result.reject("invalidIdOrPassword");
				
				return formLogin();
			}
	}
			



	//로그아웃 처리
	@RequestMapping("/member/logout.do")
	public String processLogout(HttpSession session) {	
		//로그아웃
		//단순하게 세션값을 없애는 작업
		session.invalidate();
			
		//definition 설정명을 호출
		return "redirect:/main/main.do";
		}



	//id/pw 찾기 폼
	@RequestMapping(value="/member/findIdPw.do", method=RequestMethod.GET)
	public String formFindIdPw() {

		/*
		if(일반회원){
			//definition 설정명을 호출
			return “findMemberIdPw”;
		}
		else{//트레이너
			//definition 설정명을 호출
			return “findTrainerIdPw”
		}
		*/
		return "";
	}

	//일반회원 id/pw 찾기 처리
	@RequestMapping(value="/member/findMemberIdPw.do", method=RequestMethod.POST)
	public String submitFindMemberIdPw(MemberVO memberVO){

		//id 찾기
		memberService.selectFindIdMember_detail(memberVO.getMem_cell(),memberVO.getMem_email());
		
		//pw 찾기
		memberService.selectCheckMember_detail(memberVO.getMem_id());
		
		return "redirect:/member/login.do";
	}

	//트레이너 id/pw 찾기 처리
	@RequestMapping(value="/member/findTrainerIdPw.do", method=RequestMethod.POST)
	public String submitFindTrainerIdPw(MemberVO memberVO){

		//id 찾기
		memberService.selectFindIdTrainer_detail(memberVO.getMem_cell(),memberVO.getMem_email());
		//pw찾기
		memberService.selectCheckTrainer_detail(memberVO.getMem_id());
		
		return "redirect:/member/login.do";
	}

	//일반회원 상세 정보
	//마이페이지에 보여질 정보
	@RequestMapping("/member/myPageMember.do")
	public String myPageMember(HttpSession session, Model model) {
			
		//회원번호를 얻기위해 세션에 저장된 회원 정보를 반환
		MemberVO memberVO = (MemberVO)session.getAttribute("user");
		
		//회원번호를 넣어준 다음 정보를 읽어옴
		MemberVO member = memberService.selectMember_detail(memberVO.getMem_num());
		
		//읽어온 정보를 모델을 정해서 request에 저장
		model.addAttribute("member", member);
			
		return "memberView";
	} 

	//트레이너 상세 정보
	//마이페이지에 보여질 정보
	@RequestMapping("/member/myPageMember.do")
	public String myPageTrainer(HttpSession session, Model model) {
			
		//회원번호를 얻기위해 세션에 저장된 회원 정보를 반환
		MemberVO memberVO = (MemberVO)session.getAttribute("user");
		
		//회원번호를 넣어준 다음 정보를 읽어옴
		MemberVO trainer = memberService.selectTrainer_detail(memberVO.getMem_num());
		
		//읽어온 정보를 모델을 정해서 request에 저장
		model.addAttribute("trainer", trainer);
			
		return "trinerView";
	} 

	//일반회원 정보 수정 폼
	@RequestMapping(value="/member/updateMember.do",method=RequestMethod.GET)
	public String formUpdateMember(HttpSession session,Model model) {
			
		//회원 번호가 필요함
		//회원 번호를 구하기 위해 session에 저장된 회원 정보 반환
		MemberVO memberVO = (MemberVO)session.getAttribute("user");
			
		MemberVO member = memberService.selectMember_detail(memberVO.getMem_num());
			
		model.addAttribute("memberVO", member);
			
		return "memberModify";
	}


	//트레이너 정보 수정 폼
	@RequestMapping(value="/member/updateTrainer.do",method=RequestMethod.GET)
	public String formUpdateTrainer(HttpSession session,Model model) {
			
		//회원 번호가 필요함
		//회원 번호를 구하기 위해 session에 저장된 회원 정보 반환
		MemberVO memberVO = (MemberVO)session.getAttribute("user");
			
		MemberVO member = memberService.selectTrainer_detail(memberVO.getMem_num());
			
		model.addAttribute("memberVO", member);
			
		return "trainerModify";
	}

	//회원 정보 수정 처리
	@RequestMapping(value="/member/update.do",method=RequestMethod.POST)
	public String submitUpdateMember(@Valid MemberVO memberVO, BindingResult result, HttpSession session) {
			
			
		//회원 번호를 얻기 위해 session에 저장된 회원 정보 반환
		MemberVO member = (MemberVO)session.getAttribute("user");
			
		//전송된 데이터가 저장된 자바빈에 회원 번호를 저장
		member.setMem_num(memberVO.getMem_num());
			
		//회원 정보 수정
		memberService.updateMember_detail(member);
			
		return "redirect:/member/myPage.do";
	}

	//회원 정보 수정 처리
	@RequestMapping(value="/member/update.do",method=RequestMethod.POST)
	public String submitUpdateTrainer(@Valid MemberVO memberVO, BindingResult result, HttpSession session) {
			
			
		//회원 번호를 얻기 위해 session에 저장된 회원 정보 반환
		MemberVO member = (MemberVO)session.getAttribute("user");
			
		//전송된 데이터가 저장된 자바빈에 회원 번호를 저장
		memberVO.setMem_num(member.getMem_num());
			
		//회원 정보 수정
		memberService.updateMember_detail(member);
			
		return "redirect:/member/myPage.do";
	}

	//일반회원 비밀번호 변경 폼
	@RequestMapping(value="/member/memberChangePassword.do",method=RequestMethod.GET)
	public String formMemberChangePassword() {
		return "memberChangePassword";
	}

	//트레이너 비밀번호 변경 폼
	@RequestMapping(value="/member/trainerChangePassword.do",method=RequestMethod.GET)
	public String formTrainerChangePassword() {
		return "trainerChangePassword";
	}

	//일반회원 비밀번호 변경 처리
	@RequestMapping(value="/member/memberChangePassword.do",method=RequestMethod.POST)
	public String submitMemberChangePassword(@Valid MemberVO memberVO, BindingResult result, HttpSession session) {
			
		//정상 전송일 경우
		//회원 번호를 얻기 위해서 세션에 저장된 회원 정보 반환
		MemberVO vo = (MemberVO)session.getAttribute("user");
			
		//현재 비밀번호와 변경할 비밀번호가 저장되 자바빈에 회원 번호 저장
		memberVO.setMem_num(vo.getMem_num());
			
		//회원 번호를 통해서 회원 정보를 db로부터 읽어와서 입력한 현재 비밀번호와
		//db에서 읽어온 현재 비밀번호가 일치하는지 확인
		MemberVO member = memberService.selectMember_detail(memberVO.getMem_num());
		
		
		/*
		if(!member.getMem_pw().equals(memberVO.getNow_passwd())) {
			result.rejectValue("now_passwd", "invalidPassword");
			return "memberChangePassword";
		}
		*/
		
			
		//일치할 경우 비밀번호 수정 처리
		//memberService.updateMemberPassword_detail(memberVO);
			
		return "redirect:/member/myPageMember.do";
	}


	//트레이너 비밀번호 변경 처리
	@RequestMapping(value="/member/trainerChangePassword.do",method=RequestMethod.POST)
	public String submitTrainerChangePassword(@Valid MemberVO memberVO, BindingResult result, HttpSession session) {
			
		//정상 전송일 경우
		//회원 번호를 얻기 위해서 세션에 저장된 회원 정보 반환
		MemberVO vo = (MemberVO)session.getAttribute("user");
			
		//현재 비밀번호와 변경할 비밀번호가 저장되 자바빈에 회원 번호 저장
		memberVO.setMem_num(vo.getMem_num());
			
		//회원 번호를 통해서 회원 정보를 db로부터 읽어와서 입력한 현재 비밀번호와
		//db에서 읽어온 현재 비밀번호가 일치하는지 확인
		MemberVO member = memberService.selectTrainer_detail(memberVO.getMem_num());
			
		
		/*
		if(!member.getPasswd().equals(memberVO.getNow_passwd())) {
			result.rejectValue("now_passwd", "invalidPassword");
			return "trianerChangePassword";
		}
		*/
			
		//일치할 경우 비밀번호 수정 처리
		//memberService.updateTrainerPassword_detail(memberVO);
			
		return "redirect:/member/myPageMember.do";
	}

	//일반회원 회원 탈퇴 폼
	@RequestMapping(value="/member/memberdelete.do",method=RequestMethod.GET)
	public String formMemberDelete() {
		return "memberDelete";
	}


	//트레이너 회원 탈퇴 폼
	@RequestMapping(value="/member/trainerdelete.do",method=RequestMethod.GET)
	public String formTrainerDelete() {
		return "trainerDelete";
	}

	//일반회원 회원 탈퇴 처리
	@RequestMapping(value="/member/memberdelete.do",method=RequestMethod.POST)
	public String submitMemberDelete(@Valid MemberVO memberVO, BindingResult result, HttpSession session) {
			
		//회원 번호를 얻기 위해 세션에 저장된 회원 정보 반환
		MemberVO vo = (MemberVO)session.getAttribute("user");
		//전송된 데이터가 저장된 자바빈에 회원 번호를 저장
		memberVO.setMem_num(vo.getMem_num());
			
		//비밀번호 일치 여부 체크
		//회원 번호를 이용해서 회원 정보를 읽기
		MemberVO member = memberService.selectMember_detail(memberVO.getMem_num());
		boolean check = false;
			
		//데이터가 있을 경우
		if(memberVO!=null && memberVO.getMem_id().equals(vo.getMem_id())) {
			//비밀번호 일치 여부 체크
			check = memberVO.isCheckedPasswd(memberVO.getMem_pw());
		}
			
		if(check) {
			//인증 성공, 회원정보 삭제
			memberService.deleteMember_detail(memberVO.getMem_num());
			
			//로그아웃
			session.invalidate();
			return "redirect:/main/main.do";
		}else {
			//인증 실패
			result.reject("invalidIdOrPassword");
			return "memberDelete";
		}
	}

	//트레이너 회원 탈퇴 처리
	@RequestMapping(value="/member/trainerdelete.do",method=RequestMethod.POST)
	public String submitTrainerDelete(@Valid MemberVO memberVO, BindingResult result, HttpSession session) {
			
		//회원 번호를 얻기 위해 세션에 저장된 회원 정보 반환
		MemberVO vo = (MemberVO)session.getAttribute("user");
		//전송된 데이터가 저장된 자바빈에 회원 번호를 저장
		memberVO.setMem_num(vo.getMem_num());
			
		//비밀번호 일치 여부 체크
		//회원 번호를 이용해서 회원 정보를 읽기
		MemberVO member = memberService.selectTrainer_detail(memberVO.getMem_num());
		boolean check = false;
			
		//데이터가 있을 경우
		if(memberVO!=null && memberVO.getMem_id().equals(vo.getMem_id())) {
			//비밀번호 일치 여부 체크
			check = memberVO.isCheckedPasswd(memberVO.getMem_pw());
		}
			
		if(check) {
			//인증 성공, 회원정보 삭제
			memberService.deleteTrainer_detail(memberVO.getMem_num());
			
			//로그아웃
			session.invalidate();
			return "redirect:/main/main.do";
		}else {
			//인증 실패
			result.reject("invalidIdOrPassword");
			return "trainerDelete";
		}
	}

	//이미지 출력
	//프로필 사진 관련 내용
	//ImageView.java 추가 클래스 필요 이부분은 잘 모르겠음
	//mav.addObject("filename", user.getFileName); -> ImageView.java 연결해서 처리할 것.
	@RequestMapping("/member/photoView.do")
	public ModelAndView viewImage(HttpSession session) {
		
		MemberVO user = (MemberVO)session.getAttribute("user");
			
		//한건의 레코드를 가져옴
		MemberVO memberVO = memberService.selectMember_detail(user.getMem_num());
			
		ModelAndView mav = new ModelAndView();
		mav.setViewName("imageView");
		mav.addObject("imageFile", memberVO.getMem_pic());
		//mav.addObject("filename", memberVO.getFileName());
			
		return mav;
	}
}
