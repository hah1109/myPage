CREATE TABLE alarmreport(
	alarm_num NUMBER NOT NULL,
	board_type NUMBER,
	board_num NUMBER,
	alarm varchar2(200),
	mem_num NUMBER,
	reported_memnum NUMBER,
	CONSTRAINT alarm_num_pk PRIMARY KEY (alarm_num)
);

CREATE SEQUENCE alarm_num_seq;
