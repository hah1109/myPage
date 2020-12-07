create table notice(
    notice_num number,
    board_num number not null,
    writer_memnum number not null,
    reply_mem_num number not null,
    board_comment varchar2(100) not null, 
    reg_date Date default sysdate not null,
    notice_comment varchar2(100) not null,
    return_url varchar2(100) not null,
    check_date Date,
    constraint notice_num_pk primary key (notice_num)   
);
create sequence notice_num_seq;