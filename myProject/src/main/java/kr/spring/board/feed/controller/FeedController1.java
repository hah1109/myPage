package kr.spring.board.feed.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.spring.board.feed.service.FeedService1;
import kr.spring.board.feed.vo.FeedVO;
import kr.spring.util.PagingUtil;
   
//이상훈
@Controller
public class FeedController1 {
	private Logger log = Logger.getLogger(this.getClass());
	   
	@Resource
	FeedService1 FeedService;
	
	//자바빈 초기화
	@ModelAttribute
	public FeedVO initCommand() {
		return new FeedVO();
	}
	
	//게시판 목록
		@RequestMapping("/boardFeed/feedReco.do")
		public ModelAndView process(@RequestParam(value="pageNum",defaultValue="1")int currnetPage,
				@RequestParam(value="keyfield",defaultValue="")String keyfield,
				@RequestParam(value="keyword",defaultValue="")String keyword) {
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("keyfield", keyfield);
			map.put("keyword", keyword);

			//총 글의 갯수 또는 검색된 글의 갯수
			int count = FeedService.selectCount(map);

			if(log.isDebugEnabled()) {
				log.debug("<<count>> : " + count);
			}

			PagingUtil page = new PagingUtil(keyfield, keyword, currnetPage, count, 10, 10, "/boardFeed/feedReco.do");

			map.put("start", page.getStartCount());
			map.put("end", page.getEndCount());

			List<FeedVO> list = null;
			if(count > 0) {
				list = FeedService.selectRecoList(map);

				if(log.isDebugEnabled()) {
					log.debug("<<글 목록>> : " + list);
				}
			}


			ModelAndView mav = new ModelAndView();
			mav.setViewName("feedReco");
			mav.addObject("count",count);
			mav.addObject("list",list);
			mav.addObject("pagingHtml",page.getPagingHtml());

			return mav;
		}
		
		//이미지 출력
		@RequestMapping("/boardFeed/imageView.do")
		public ModelAndView viewImage(@RequestParam int feed_num) {

			FeedVO feed = FeedService.selectRecoBoard(feed_num);

			ModelAndView mav = new ModelAndView();
			mav.setViewName("imageView");
			//byte[]타입의 데이터
			mav.addObject("imageFile", feed.getFeed_file());
			mav.addObject("filename", feed.getFeed_filename());


			return mav;
		}
	
}
