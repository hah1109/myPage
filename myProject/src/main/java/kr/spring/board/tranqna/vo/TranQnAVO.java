package kr.spring.board.tranqna.vo;

import java.sql.Date;

import javax.validation.constraints.NotEmpty;

public class TranQnAVO {
	
	@NotEmpty
	private int tq_num;
	@NotEmpty
	private String tq_title;
	@NotEmpty
	private String tq_content;
	@NotEmpty
	private int tq_hit;
	@NotEmpty
	private Date tq_reg_date;
	@NotEmpty
	private Date tq_modify_date;
	
	private byte[] tq_file;
	private String tq_filename;
	
	@NotEmpty
	private String tq_ip;
	@NotEmpty
	private int mem_num;
	
	
	public int getTq_num() {
		return tq_num;
	}
	public void setTq_num(int tq_num) {
		this.tq_num = tq_num;
	}
	public String getTq_title() {
		return tq_title;
	}
	public void setTq_title(String tq_title) {
		this.tq_title = tq_title;
	}
	public String getTq_content() {
		return tq_content;
	}
	public void setTq_content(String tq_content) {
		this.tq_content = tq_content;
	}
	public int getTq_hit() {
		return tq_hit;
	}
	public void setTq_hit(int tq_hit) {
		this.tq_hit = tq_hit;
	}
	public Date getTq_reg_date() {
		return tq_reg_date;
	}
	public void setTq_reg_date(Date tq_reg_date) {
		this.tq_reg_date = tq_reg_date;
	}
	public Date getTq_modify_date() {
		return tq_modify_date;
	}
	public void setTq_modify_date(Date tq_modify_date) {
		this.tq_modify_date = tq_modify_date;
	}
	public byte[] getTq_file() {
		return tq_file;
	}
	public void setTq_file(byte[] tq_file) {
		this.tq_file = tq_file;
	}
	public String getTq_filename() {
		return tq_filename;
	}
	public void setTq_filename(String tq_filename) {
		this.tq_filename = tq_filename;
	}
	public String getTq_ip() {
		return tq_ip;
	}
	public void setTq_ip(String tq_ip) {
		this.tq_ip = tq_ip;
	}
	public int getMem_num() {
		return mem_num;
	}
	public void setMem_num(int mem_num) {
		this.mem_num = mem_num;
	}
	
	
}
