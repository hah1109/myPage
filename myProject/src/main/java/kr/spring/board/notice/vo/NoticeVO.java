package kr.spring.board.notice.vo;

import java.sql.Date;

public class NoticeVO {
	
	private int notice_num;
	private int board_num;
	private int writer_memnum;
	private int reply_mem_num;
	private String board_comment;
	private Date reg_date;
	private String notice_comment;
	private String return_url;
	private Date check_date;
	
	//댓글 단 사람의 아이디
	private String mem_id;
	
	public int getNotice_num() {
		return notice_num;
	}
	public void setNotice_num(int notice_num) {
		this.notice_num = notice_num;
	}
	public int getBoard_num() {
		return board_num;
	}
	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}
	public int getWriter_memnum() {
		return writer_memnum;
	}
	public void setWriter_memnum(int writer_memnum) {
		this.writer_memnum = writer_memnum;
	}
	public int getReply_mem_num() {
		return reply_mem_num;
	}
	public void setReply_mem_num(int reply_mem_num) {
		this.reply_mem_num = reply_mem_num;
	}
	public String getBoard_comment() {
		return board_comment;
	}
	public void setBoard_comment(String board_comment) {
		this.board_comment = board_comment;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public String getNotice_comment() {
		return notice_comment;
	}
	public void setNotice_comment(String notice_comment) {
		this.notice_comment = notice_comment;
	}
	public String getReturn_url() {
		return return_url;
	}
	public void setReturn_url(String return_url) {
		this.return_url = return_url;
	}
	public Date getCheck_date() {
		return check_date;
	}
	public void setCheck_date(Date check_date) {
		this.check_date = check_date;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	
	@Override
	public String toString() {
		return "NoticeVO [notice_num=" + notice_num + ", board_num=" + board_num + ", writer_memnum=" + writer_memnum
				+ ", reply_mem_num=" + reply_mem_num + ", board_comment=" + board_comment + ", reg_date=" + reg_date
				+ ", notice_comment=" + notice_comment + ", return_url=" + return_url + ", check_date=" + check_date
				+ ", reply_mem_id=" + mem_id + "]";
	}
	

}
