package kr.spring.comment.freec.vo;

import java.sql.Date;

public class FreeBoardCofCVO {
	
	private int cofc_num;
	private String cofc_comment;
	private Date cofc_date;
	private int freec_num;
	private int mem_num;
	private String mem_id;
	private int mem_auth;
	
	public int getCofc_num() {
		return cofc_num;
	}
	public void setCofc_num(int cofc_num) {
		this.cofc_num = cofc_num;
	}
	public String getCofc_comment() {
		return cofc_comment;
	}
	public void setCofc_comment(String cofc_comment) {
		this.cofc_comment = cofc_comment;
	}
	public Date getCofc_date() {
		return cofc_date;
	}
	public void setCofc_date(Date cofc_date) {
		this.cofc_date = cofc_date;
	}
	public int getFreec_num() {
		return freec_num;
	}
	public void setFreec_num(int freec_num) {
		this.freec_num = freec_num;
	}
	public int getMem_num() {
		return mem_num;
	}
	public void setMem_num(int mem_num) {
		this.mem_num = mem_num;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public int getMem_auth() {
		return mem_auth;
	}
	public void setMem_auth(int mem_auth) {
		this.mem_auth = mem_auth;
	}
	
	@Override
	public String toString() {
		return "FreeBoardCofCVO [cofc_num=" + cofc_num + ", cofc_comment=" + cofc_comment + ", cofc_date=" + cofc_date
				+ ", freec_num=" + freec_num + ", mem_num=" + mem_num + ", mem_id=" + mem_id + ", mem_auth=" + mem_auth
				+ "]";
	}

}
