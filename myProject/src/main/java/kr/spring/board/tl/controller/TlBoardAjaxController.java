package kr.spring.board.tl.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.spring.board.tl.service.TlBoardService;
import kr.spring.board.tl.vo.TlBoardVO;
import kr.spring.member.vo.MemberVO;

@Controller
public class TlBoardAjaxController {
	private Logger log = Logger.getLogger(this.getClass());

	//트레이너 프로필 사진 변경은 trainer_detail테이블에 수정해야함
	@Resource
	private TlBoardService tlBoardService;

	//프로필 사진 업데이트
	@RequestMapping("/trainerList/updatePic.do")
	@ResponseBody
	public Map<String,String> processProfile(TlBoardVO tlboardVO, HttpSession session){
		Map<String,String> map = new HashMap<String,String>();

		//로그인 되어있는지 아닌지 확인해야함
		MemberVO user = (MemberVO)session.getAttribute("user");

		if(user==null) {
			//로그인이 되지 않은 경우
			map.put("result", "logout");
		}else {
			//로그인이 된 경우
			tlboardVO.setMem_num(user.getMem_num());
			tlBoardService.updateTrainerProfile(tlboardVO);

			//이미지를 업로드한 후 세션에 저장된 회원 정보의 이미지 이름을 교체
			user.setMem_picName(tlboardVO.getMem_picName());	

			map.put("result", "success");
		}

		return map;
	}
	
}











