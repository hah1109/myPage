package kr.spring.board.hw.vo;

import javax.validation.constraints.NotEmpty;

public class HwBoardVO {
	
	@NotEmpty
	private int hw_num;		//글번호 
	@NotEmpty
	private String hw_title;		//글제목
	@NotEmpty
	private String hw_link;		//유튜브링크
	@NotEmpty
	private String hw_part;		//부위 
	@NotEmpty
	private int hw_kcal;		//소모칼로리
	
}
