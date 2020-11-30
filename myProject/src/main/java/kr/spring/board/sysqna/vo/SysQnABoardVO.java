package kr.spring.board.sysqna.vo;

import java.sql.Date;

import javax.validation.constraints.NotEmpty;

public class SysQnAVO {
	@NotEmpty
	private int sq_num;
	@NotEmpty
	private String sq_title;
	@NotEmpty
	private String sq_content;
	@NotEmpty
	private int sq_hit;
	@NotEmpty
	private Date sq_reg_date;
	@NotEmpty
	private Date sq_modify_date;
	
	private byte[] sq_file;
	private String sq_filename;
	
	@NotEmpty
	private String sq_ip;
	@NotEmpty
	private String sq_id;
	@NotEmpty
	private int mem_num;
	
	
	public int getSq_num() {
		return sq_num;
	}
	public void setSq_num(int sq_num) {
		this.sq_num = sq_num;
	}
	public String getSq_title() {
		return sq_title;
	}
	public void setSq_title(String sq_title) {
		this.sq_title = sq_title;
	}
	public String getSq_content() {
		return sq_content;
	}
	public void setSq_content(String sq_content) {
		this.sq_content = sq_content;
	}
	public int getSq_hit() {
		return sq_hit;
	}
	public void setSq_hit(int sq_hit) {
		this.sq_hit = sq_hit;
	}
	public Date getSq_reg_date() {
		return sq_reg_date;
	}
	public void setSq_reg_date(Date sq_reg_date) {
		this.sq_reg_date = sq_reg_date;
	}
	public Date getSq_modify_date() {
		return sq_modify_date;
	}
	public void setSq_modify_date(Date sq_modify_date) {
		this.sq_modify_date = sq_modify_date;
	}
	public byte[] getSq_file() {
		return sq_file;
	}
	public void setSq_file(byte[] sq_file) {
		this.sq_file = sq_file;
	}
	public String getSq_filename() {
		return sq_filename;
	}
	public void setSq_filename(String sq_filename) {
		this.sq_filename = sq_filename;
	}
	public String getSq_ip() {
		return sq_ip;
	}
	public void setSq_ip(String sq_ip) {
		this.sq_ip = sq_ip;
	}
	public String getSq_id() {
		return sq_id;
	}
	public void setSq_id(String sq_id) {
		this.sq_id = sq_id;
	}
	public int getMem_num() {
		return mem_num;
	}
	public void setMem_num(int mem_num) {
		this.mem_num = mem_num;
	}
	
	
}
