
create table bbs_t (
    b_idx number constraint bbs_t_pk primary key, 
    writer varchar2(50) not null, 
    title varchar2(50) not null, 
    content clob, 					
    pw varchar2(20),
    hit number,
    ip varchar2(15),
    filename varchar2(100), 
    reg_date date
);

create sequence bbs_seq start with 1 increment by 1;
select * from bbs_seq;

INSERT INTO bbs_t VALUES (bbs_seq.NEXTVAL, '홍길동', '첫 번째 글입니다',  '첫 번째 글 내용입니다.',  NULL, 0, NULL, NULL, SYSDATE);
INSERT INTO bbs_t VALUES (bbs_seq.NEXTVAL, '이순신', '두 번째 글입니다',  '두 번째 글 내용입니다.',  NULL, 0, NULL, NULL, SYSDATE);
INSERT INTO bbs_t VALUES (bbs_seq.NEXTVAL, '강감찬', '세 번째 글입니다',  '세 번째 글 내용입니다.',  NULL, 0, NULL, NULL, SYSDATE);
INSERT INTO bbs_t VALUES (bbs_seq.NEXTVAL, '유관순', '네 번째 글입니다',  '네 번째 글 내용입니다.',  NULL, 0, NULL, NULL, SYSDATE);
INSERT INTO bbs_t VALUES (bbs_seq.NEXTVAL, '안중근', '다섯 번째 글입니다', '다섯 번째 글 내용입니다.', NULL, 0, NULL, NULL, SYSDATE);

INSERT INTO bbs_t VALUES (bbs_seq.NEXTVAL, '김철수', '여섯 번째 글입니다',  '여섯 번째 글 내용입니다.',  NULL, 0, NULL, NULL, SYSDATE);
INSERT INTO bbs_t VALUES (bbs_seq.NEXTVAL, '이영희', '일곱 번째 글입니다',  '일곱 번째 글 내용입니다.',  NULL, 0, NULL, NULL, SYSDATE);
INSERT INTO bbs_t VALUES (bbs_seq.NEXTVAL, '박민수', '여덟 번째 글입니다',  '여덟 번째 글 내용입니다.',  NULL, 0, NULL, NULL, SYSDATE);
INSERT INTO bbs_t VALUES (bbs_seq.NEXTVAL, '정하늘', '아홉 번째 글입니다',  '아홉 번째 글 내용입니다.',  NULL, 0, NULL, NULL, SYSDATE);
INSERT INTO bbs_t VALUES (bbs_seq.NEXTVAL, '최지훈', '열 번째 글입니다',  '열 번째 글 내용입니다.',  NULL, 0, NULL, NULL, SYSDATE);

INSERT INTO bbs_t VALUES (bbs_seq.NEXTVAL, '한지민', '열한 번째 글입니다',  '열한 번째 글 내용입니다.',  NULL, 0, NULL, NULL, SYSDATE);
INSERT INTO bbs_t VALUES (bbs_seq.NEXTVAL, '손흥민', '열두 번째 글입니다',  '열두 번째 글 내용입니다.',  NULL, 0, NULL, NULL, SYSDATE);
INSERT INTO bbs_t VALUES (bbs_seq.NEXTVAL, '황희찬', '열세 번째 글입니다',  '열세 번째 글 내용입니다.',  NULL, 0, NULL, NULL, SYSDATE);
INSERT INTO bbs_t VALUES (bbs_seq.NEXTVAL, '김민재', '열네 번째 글입니다',  '열네 번째 글 내용입니다.',  NULL, 0, NULL, NULL, SYSDATE);
INSERT INTO bbs_t VALUES (bbs_seq.NEXTVAL, '이강인', '열다섯 번째 글입니다','열다섯 번째 글 내용입니다.',NULL, 0, NULL, NULL, SYSDATE);

INSERT INTO bbs_t VALUES (bbs_seq.NEXTVAL, '장원영', '열여섯 번째 글입니다','열여섯 번째 글 내용입니다.',NULL, 0, NULL, NULL, SYSDATE);
INSERT INTO bbs_t VALUES (bbs_seq.NEXTVAL, '카리나',   '열일곱 번째 글입니다','열일곱 번째 글 내용입니다.',NULL, 0, NULL, NULL, SYSDATE);
INSERT INTO bbs_t VALUES (bbs_seq.NEXTVAL, '지수',     '열여덟 번째 글입니다','열여덟 번째 글 내용입니다.',NULL, 0, NULL, NULL, SYSDATE);
INSERT INTO bbs_t VALUES (bbs_seq.NEXTVAL, '아이유',   '열아홉 번째 글입니다','열아홉 번째 글 내용입니다.',NULL, 0, NULL, NULL, SYSDATE);
INSERT INTO bbs_t VALUES (bbs_seq.NEXTVAL, '수지',     '스무 번째 글입니다',   '스무 번째 글 내용입니다.',  NULL, 0, NULL, NULL, SYSDATE);

select * from bbs_t;
