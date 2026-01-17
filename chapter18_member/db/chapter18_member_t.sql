
create table member_t(
    m_idx number primary key,
    mId VARCHAR(30) not null unique,
    mPw VARCHAR(30) not null,
    mName VARCHAR(30) not null,
    mEmail VARCHAR(30) not null,
    mRegDate date
);

DROP SEQUENCE member_seq;
create sequence member_seq start with 1 increment by 1;

SELECT sequence_name, last_number
FROM user_sequences
WHERE sequence_name = 'MEMBER_SEQ';
