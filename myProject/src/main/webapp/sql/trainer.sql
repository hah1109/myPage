create table matching(
mat_num number,
mem_num number not null,
mat_id varchar2(40),
mat_from number,
mat_to number, 
constraint matching_num_pk primary key (mem_num),
constraint matching_mem_num_fk foreign key (mem_num) references member_detail (mem_num)
);

create sequence mat_seq; 