package kr.spring.board.hw.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.spring.board.hw.service.HwBoardService;
import kr.spring.board.hw.vo.HwBoardVO;
import kr.spring.util.PagingUtil;

@Controller
public class HwBoardController {
	//로그
	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource
	HwBoardService hwBoardService;
	
	//자바빈(VO) 초기화 
	@ModelAttribute
	public HwBoardVO initCommand() {
		return new HwBoardVO();
	}
	
	//list 호출	
	// 트레이닝 화면을 호출해주는 부분
	//조건에 따라 view에 노출되는 동영상, 메인 글씨 변경(조건은 부위를 조건으로)
	//검색버튼이 눌렸을 경우에도 여기로 호출
	@RequestMapping(value="/homeTraining/hwList.do")
	public ModelAndView hwList(@RequestParam(value="pageNum", defaultValue="1")
						 int currentPage,
						 @RequestParam(value="keyfield",defaultValue="")
						 String keyfield,
						 @RequestParam(value="keyword", defaultValue="")
						 String keyword) {
		
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("keyfield", keyfield);
		map.put("keyword", keyword);
		
		//총 글 갯수
		int count = hwBoardService.selectRowCount(map);
		
		//로그
		if(log.isDebugEnabled()) {
			log.debug("<<count>> : " + count);
		}
		
		PagingUtil page = new PagingUtil(keyfield, keyword,currentPage,count,10,10,"hwboardlist.do");
		map.put("start", page.getStartCount());
		map.put("end", page.getEndCount());
	
		List<HwBoardVO> list = null;
		if(count > 0) {
			list = hwBoardService.hwSelectList(map);
			
			if(log.isDebugEnabled()) {
				log.debug("<<글 목록>> : " + list);
			}
		}
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("hwBoardList");
		mav.addObject("count",count);
		mav.addObject("list", list);
		mav.addObject("pagingHtml", page.getPagingHtml());
		
		return mav;
	}

	//글 상세페이지 호출
	@RequestMapping(value="/homeTraining/hwDetail.do")
	public ModelAndView hwDetailView(@RequestParam int hwboard_num) {
		//로그
		if(log.isDebugEnabled()) {
			log.debug("hwboard 글 상세" + hwboard_num);
		}
		
		HwBoardVO hwBoardVO = hwBoardService.selectHwBoard(hwboard_num);
		return new ModelAndView("hwBoardView", "hwBoardVO", hwBoardVO);
	}

	//관리자만 등록할 수 있는 버튼이눌렸을 경우 글 등록 폼 호출
	@RequestMapping(value="/hwboard/hwboardwrite.do",method=RequestMethod.GET)
	public String form() {
		return "hwBoardWrite";
	}
	
	//등록 폼에서 글 등록(Submit)
	@RequestMapping(value="/homeTraining/hwBoardwrite.do", method=RequestMethod.POST)
	public String submitHwBoardWrite(@Valid HwBoardVO hwBoardVO, BindingResult result, HttpServletRequest request,HttpSession session) {
		//로그
		if(log.isDebugEnabled()) {
			log.debug("<<hw게시판 글 저장>> : " + hwBoardVO);
		}
		
		//유효성 체크 결과 오류가 있으면 폼 호출
		if(result.hasErrors()) {
			return "hwBoardWrite";
		}
		
		//글쓰기
		hwBoardService.insertHwBoard(hwBoardVO);
		
		return "redirect:/homeTraining/hwList.do";
	}

	//관리자만 수행 할 수있는 게시판 수정(이건 상세페이지의버튼)
	@RequestMapping(value="/homeTraining/hwBoardUpdate.do", method=RequestMethod.GET)
	public String hwBoardUpdateForm(@RequestParam int hwBoard_num, Model model) {
		
		HwBoardVO hwBoardVO = hwBoardService.selectHwBoard(hwBoard_num);
		
		model.addAttribute("hwBoardVO", hwBoardVO);

		return "hwBoardModity";
	}

	//수정 페이지에서 submit했을 때
	@RequestMapping(value="/homeTraining/hwBoardUpdate.do", method=RequestMethod.POST)
	public String submitHwBoardUpdate(@Valid HwBoardVO hwBoardVO, BindingResult result, HttpServletRequest request,HttpSession session, Model model) {

		if(log.isDebugEnabled()) {
			log.debug("<<hw글 정보 수정>> : " + hwBoardVO);
		}
		//유효성 체크 결과 오류가 있으면 폼 호출
		if(result.hasErrors()) {
			return "hwBoardModify";
		}
		
		//글 수정
		hwBoardService.updateHwBoard(hwBoardVO);
		
		//View에 표시할 메시지
		model.addAttribute("message", "글 수정 완료!!");
		model.addAttribute("url", 
				request.getContextPath()+"/homeTraining/hwList.do");
		
		//타일스 설정에 아래 뷰이름이 없으면 단독으로 JSP 호출
		return "common/result";
	}

	//삭제
	@RequestMapping(value="/hwboard/hwboardupdate.do")
	public String submitHwBoardDelete(@Valid int hwBoard_num, BindingResult result, HttpServletRequest request, Model model) {

		if(log.isDebugEnabled()) {
			log.debug("<<hw게시판 글 삭제>> : " + hwBoard_num);
		}
		
		//글 삭제
		hwBoardService.deleteHwBoard(hwBoard_num);
		
		model.addAttribute("message", "글 삭제 완료!!");
		model.addAttribute("url", 
				request.getContextPath()+"/homeTraining/hwList.do");
		
		return "common/result";
	}
}
