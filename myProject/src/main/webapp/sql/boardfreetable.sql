create table board_free(
  free_num number not null,
  free_title varchar2(100) not null,
  free_content clob not null,
  free_hit number(5) default 0 not null,
  free_reg_date date default sysdate not null,
  free_modify_date date default sysdate not null,
  free_file blob,
  free_filename varchar2(100),
  free_ip varchar2(40) not null,
  free_type number not null,
  mem_num number not null,
  constraint boardfree_pk primary key (free_num),
  constraint boardfree_fk foreign key (mem_num) references member(mem_num)
);
create sequence board_free_seq;