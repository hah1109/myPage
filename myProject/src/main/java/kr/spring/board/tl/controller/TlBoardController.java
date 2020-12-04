package kr.spring.board.tl.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.spring.board.tl.service.TlBoardService;
import kr.spring.board.tl.vo.TlBoardVO;
import kr.spring.member.vo.MemberVO;
import kr.spring.util.PagingUtil;

@Controller
public class TlBoardController {

	//로그 처리
	private Logger log = Logger.getLogger(this.getClass());

	@Resource
	private TlBoardService tlBoardService;

	//자바빈(VO) 초기화
	//서버 유효성 체크시 필수로 필요
	@ModelAttribute
	public TlBoardVO initCommand() {
		return new TlBoardVO();
	}


	//트레이너리스트를 눌렀을경우 들어올 페이지
	//트레이너리스트를 호출
	@RequestMapping("/trainerList/trainerList.do")
	public ModelAndView formTrainerList(
			@RequestParam(value="pageNum", defaultValue="1") int currentPage) {
		//로그인 상태일 경우 자신이 팔로우한 트레이너 리스트를 상단에 표시
		//비 로그인 상태일 경우 팔로우한 트레이너 리스트는 볼 수 없음

		//key와 value를 받아 배열로 사용할 map 선언
		Map<String,Object> map = new HashMap<String,Object>();

		//총 글의 갯수를 가져옴
		int count = tlBoardService.selectTrainerRowCount();
		
		//로그정보로 count 개수 잘들어왔는지 확인
		if(log.isDebugEnabled()) {
			log.debug("<<<count>>> :" + count);
		}
		
		//페이징 설정
		PagingUtil page = new PagingUtil(currentPage,count,10,10,"trainerList.do");
		map.put("start", page.getStartCount());
		map.put("end", page.getEndCount());
		
		List<TlBoardVO> list = null;
		
		//트레이너 리스트 정보가 있을 경우
		if(count > 0) {
			list = tlBoardService.selectTrainerList();
			
			//list가 제데로 담겼는지 로그정보로 확인
			if(log.isDebugEnabled()) {
				log.debug("<<<트레이너 리스트 목록>>> : " + list);
			}
		}
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("trainerList");//definition 설정명
		mav.addObject("count", count);
		mav.addObject("list", list);
		mav.addObject("pagingHtml", page.getPagingHtml());
		
		return mav;
	}

	//트레이너 상세정보페이지를 보여줄 메서드
	@RequestMapping(value="/trainerList/trainerListDetail.do", method=RequestMethod.GET)
	public String formTrainerListDetail(@RequestParam int mem_num, Model model) {

		//트레이너리스트 페이지에서 선택한 트레이너 mem_num이 잘 전송되었는지 확인
		if(log.isDebugEnabled()) {
			log.debug("<<<트레이너 mem_num 번호>>> :" + mem_num);
		}
		
		//mem_num인 트레이너의 정보를 가져오는 메서드 필요
		TlBoardVO vo = tlBoardService.selectTrainerDetail(mem_num);
		
		//읽어온 정보를 로그를 통해 보여줌
		if(log.isDebugEnabled()) {
			log.debug("<<<트레이너 상세 정보>>> : " + vo);
		}
		
		//읽어온 정보를 모델을 정해서 request에 저장
		model.addAttribute("trainer", vo);
		
		//definition 설정명을 호출
		return "trainerListDetail";
	}
	
	
	//프로필사진 & 간략자기소개 수정 페이지를 보여줄 메서드
	@RequestMapping(value="/trainerList/prUpdate.do", method=RequestMethod.GET)
	public String formPrUpdate(HttpSession session, Model model) {
		
		//세션에서 현재 로그인한 회원의 정보를 가져옴
		//로그인 할 때 MemberVO타입으로 세션을 부여해줘서 가져올 때도 MemberVO타입으로 가져와야함
		MemberVO user = (MemberVO)session.getAttribute("user");
		
		//읽어온 정보를 로그를 통해 보여줌
		if(log.isDebugEnabled()) {
			log.debug("<<<로그인한 유저 정보>>> : " + user);
		}
		
		//로그인한 회원의 mem_num으로 쿼리문 검색해서 trainer_detail의 정보를 가저옴
		TlBoardVO tlboardVO = tlBoardService.selectTrainerDetail(user.getMem_num());
		
		//읽어온 정보를 로그를 통해 보여줌
		if(log.isDebugEnabled()) {
			log.debug("<<<로그인한 회원의 테이블 정보>>> : " + tlboardVO);
		}
		
		//테이블에서 가저온 로그인한 회원 정보를 모델에 추가
		model.addAttribute("trainer", tlboardVO);
		
		//definition 설정명을 호출
		return "prUpdate";
	}
	
	//이미지를 출력해줄 메서드
	@RequestMapping("/trainerList/photoOutPut.do")
	public ModelAndView outPutImage(HttpSession session) {
		
		//세션에서 현재 로그인한 회원의 정보를 가져옴
		TlBoardVO user = (TlBoardVO)session.getAttribute("user");
		
		//읽어온 정보를 로그를 통해 보여줌
		if(log.isDebugEnabled()) {
			log.debug("<<<프로필과 자기소개 변경 페이지에서 세션정보>>> : " + user);
		}
		
		//로그인한 회원의 테이블 정보를 가저옴
		TlBoardVO vo = tlBoardService.selectTrainerDetail(user.getMem_num());
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("imageView");
		mav.addObject("imageFile", vo.getMem_pic());
		
		return mav;
	}


}
