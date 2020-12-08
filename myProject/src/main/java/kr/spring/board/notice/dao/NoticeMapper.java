package kr.spring.board.notice.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Update;

import kr.spring.board.notice.vo.NoticeVO;


public interface NoticeMapper {

	public List<NoticeVO> selectList(Map<String,Object> map);
	public int selectRowCount(Map<String,Object> map);
	
	public void insertNoticeVO(NoticeVO notice);
	
	@Update("UPDATE notice SET check_date=SYSDATE WHERE notice_num=#{notice_num}")
	public void confirmOneNotice(Integer notice_num);
	
	@Update("UPDATE notice SET check_date=SYSDATE WHERE board_num=#{board_num} AND writer_memnum=#{writer_memnum}")
	public void updateNoticeCheckdate(NoticeVO notice);
	
	@Update("UPDATE notice SET check_date=SYSDATE WHERE writer_memnum=#{writer_memnum}")
	public void confirmAllNotice(Integer writer_memnum);
	
}
