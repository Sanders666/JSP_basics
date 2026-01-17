create table comment_t (
    c_idx number constraint comment_t_pk primary key, 
    writer varchar2(50) not null, 
    content clob, 		
    pw varchar2(20), 
    ip varchar2(15),
    reg_date date, 
    b_idx number not null,
    constraint comment_t_fk foreign key (b_idx) references bbs_t (b_idx)
);

create sequence comment_seq start with 1 increment by 1;

insert into bbs_t(b_idx, writer, title, content, pw, hit, ip, filename, reg_date)
select bbs_seq.nextval, writer, title, content, pw, hit, ip, filename, sysdate
from bbs_t;

select * from bbs_t;
select * from comment_t;

commit;


select b_idx, writer, title, hit, reg_date
from
    (select rownum rn, a.*
    from
        (select b_idx, writer, title, hit, reg_date
        from bbs_t
        order by b_idx desc) a
        where rownum <= 2 * 5)
    where rn > (2-1) * 5;



