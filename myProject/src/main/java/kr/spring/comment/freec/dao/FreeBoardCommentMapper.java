package kr.spring.comment.freec.dao;

import kr.spring.comment.freec.vo.FreeBoardCommentVO;

public interface FreeBoardCommentMapper {
	
	public void insertFreeBoardComment(FreeBoardCommentVO freec);
	
	public FreeBoardCommentVO selectFreeBoardComment(int freec);

}
