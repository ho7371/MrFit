----------------------------------------------------- 삭제 SQL
------------ 삭제순서 : 1. 시퀀스 삭제        2. 테이블 삭제
------------ 시퀀스 삭제
drop sequence note_no_seq;
drop table note;
drop sequence bno_seq;
drop table board;
drop TABLE order_product;
drop sequence ono_seq;
drop TABLE orders;
drop sequence ino_seq;
drop TABLE image;
drop sequence pqno_seq;
drop TABLE product_qna;
drop sequence rno_seq;
drop TABLE review;
drop sequence iqrno_seq;
drop TABLE inquiry_reply;
drop sequence iqno_seq;
drop TABLE inquiry;
drop sequence pdno_seq;
drop TABLE product_detail;
drop sequence psno_seq;
drop TABLE product_size;
drop sequence pcno_seq;
drop TABLE product_color;
drop sequence pno_seq;
drop TABLE product;
drop TABLE auth;
drop sequence point_no_seq;
drop TABLE point;
drop TABLE member_size;
drop TABLE member;
drop sequence qno_seq;
drop TABLE question;
drop TABLE grade;
   
----------------------------------------------------- 삭제 SQL 종료

-------------------------------------------------------- 테이블 생성 SQL

------------ 생성순서 : 1. 시퀀스 생성        2. 테이블 생성

------------ 외래키 이름은 일단 지어놨고, 규칙 정해서 나중에 확정할 것 : 진호

-----------시퀀스 생성


----------- 회원 등급 
CREATE TABLE grade (
   grade VARCHAR2(100) PRIMARY KEY, 
   percent NUMBER NOT NULL 
);

------- 비밀번호 찾기 질문 - 
create sequence qno_seq;
CREATE TABLE question (
   qno NUMBER PRIMARY KEY, 
   question VARCHAR2(100) NOT NULL 
);

------------ 회원 -
CREATE TABLE member (
   id VARCHAR2(100) PRIMARY KEY,
   password VARCHAR2(100) NOT NULL, 
   name VARCHAR2(100) NOT NULL, 
   phone VARCHAR2(100) NOT NULL,
   address VARCHAR2(100) NOT NULL, 
   email VARCHAR2(100) NOT NULL,
   point NUMBER default 0, 
   totalspent NUMBER default 0,
   status VARCHAR2(100) default 1, 
   answer VARCHAR2(100) NOT NULL, 
   qno NUMBER NOT NULL, 
   grade VARCHAR2(100) default '브론즈',
   constraint fk_qno_in_member foreign key(qno) references question(qno),
   constraint fk_grade_in_member foreign key(grade) references grade(grade)
);

      --------- 회원치수 -
      CREATE TABLE member_size (
         id VARCHAR2(100) NOT NULL,
         shoulder NUMBER default 0, 
         chest NUMBER default 0, 
         sleeve NUMBER default 0, 
         armhole NUMBER default 0,
         toplength NUMBER default 0, 
         waist NUMBER default 0,
         crotch NUMBER default 0, 
         thigh NUMBER default 0, 
         hem NUMBER default 0, 
         bottomlength NUMBER default 0,
         constraint fk_id_in_member foreign key(id) references member(id)
      );
      CREATE INDEX member_size_unique ON member_size(id);


---------- 포인트 --------
create sequence point_no_seq;
CREATE TABLE point (
   point_no NUMBER PRIMARY KEY, 
   id VARCHAR2(100) NOT NULL, 
   updown NUMBER NOT NULL,
   change_date date NOT NULL,
   status VARCHAR2(100) default '상품구입',
   constraint fk_id_in_point foreign key(id) references member(id)
);

------- 권한 -------
CREATE TABLE auth (
   id VARCHAR2(100) NOT NULL,
   auth VARCHAR2(100) NOT NULL,
   constraint fk_id_in_auth foreign key(id) references member(id),
   constraint pk_auth primary key(id, auth)
);


------ 상품 --------
create sequence pno_seq;
CREATE TABLE product (
   pno NUMBER PRIMARY KEY, 
   name VARCHAR2(100) NOT NULL,
   price NUMBER NOT NULL,
   content CLOB NOT NULL, 
   category VARCHAR2(100) NOT NULL,
   hit NUMBER DEFAULT 0 
);



   -----------상품 색상 [진행중인 테이블 선택시 추가해야 할 테이블]----  
      create sequence pcno_seq;
      CREATE TABLE product_color (
         pcno NUMBER PRIMARY KEY,
         color_name VARCHAR2(100) NOT NULL
      );
         
     ---------- 상품치수 [작업중인 테이블]-------
      create sequence psno_seq;
      CREATE TABLE product_size (
         psno NUMBER PRIMARY KEY,
         size_name VARCHAR2(100) NOT NULL, ------ 칼럼명 변경 --------
         size1 NUMBER NOT NULL,
         size2 NUMBER NOT NULL,
         size3 NUMBER NOT NULL,
         size4 NUMBER NOT NULL,
         size5 NUMBER NOT NULL
      );
      
    -------상품상세 [작업중인 테이블]--------
      create sequence pdno_seq;
      CREATE TABLE product_detail (
         pdno NUMBER PRIMARY KEY,
         pno NUMBER NOT NULL,
         pcno NUMBER NOT NULL, 
         psno NUMBER NOT NULL,
         inventory NUMBER NOT NULL,
         constraint fk_pno_in_product_detail foreign key(pno) references product(pno) on delete cascade,
         constraint fk_color_in_product_detail foreign key(pcno) references product_color(pcno) on delete cascade,
         constraint fk_psno_in_product_detail foreign key(psno) references product_size(psno) on delete cascade
      );
         CREATE INDEX product_detail_unique ON product_detail(pno, pcno, psno);
         ------- CREATE INDEX 인덱스명 ON 테이블명(칼럼1, 칼럼2, 칼럼3); -------


------- 고객문의 게시판 -------
create sequence iqno_seq;
CREATE TABLE inquiry (
   iqno NUMBER PRIMARY KEY, 
   title VARCHAR2(100) NOT NULL,
   content CLOB NOT NULL, 
   regdate DATE NOT NULL, 
   security VARCHAR2(100) NOT NULL, 
   id VARCHAR2(100) NOT NULL,
   constraint fk_id_in_inquiry foreign key(id) references member(id)
);
-------
 *	delete from INQUIRY;
delete from INQUIRY_REPLY;
alter table inquiry add title VARCHAR2(100) NOT NULL;
 
 -------

      ------- 고객문의 댓글 -------
      create sequence iqrno_seq;
      CREATE TABLE inquiry_reply (
         iqrno NUMBER PRIMARY KEY,
         content CLOB NOT NULL,
         regdate DATE NOT NULL, 
         security VARCHAR2(100) NOT NULL, 
         iqno NUMBER NOT NULL,
         constraint fk_iqno_in_inquiry_reply foreign key(iqno) references inquiry(iqno)
      );

------- 리뷰 -------
create sequence rno_seq;
CREATE TABLE review (
   rno NUMBER PRIMARY KEY,
   pdno NUMBER NOT NULL,
   id VARCHAR2(100) NOT NULL,
   content CLOB NOT NULL,
   regdate DATE NOT NULL,
   constraint fk_pdno_in_review foreign key(pdno) references product_detail(pdno),
   constraint fk_id_in_review foreign key(id) references member(id)
);
CREATE INDEX review_unique ON review(pdno,id);

------- 상품 문의 -------
create sequence pqno_seq;
CREATE TABLE product_qna (
   pqno NUMBER PRIMARY KEY,
   id VARCHAR2(100) NOT NULL,
   pno NUMBER NOT NULL,
   content CLOB NOT NULL,
   regdate DATE NOT NULL,
   security VARCHAR2(100) NOT NULL, 
   constraint fk_id_in_product_qna foreign key(id) references member(id),
   constraint fk_pno_in_product_qna foreign key(pno) references product(pno) on delete cascade
);


------- 이미지 -------

create sequence ino_seq;
CREATE TABLE image (
   ino NUMBER PRIMARY KEY, 
   pno NUMBER NOT NULL, 
   url VARCHAR2(300) NOT NULL,
   constraint fk_pno_in_image foreign key(pno) references product(pno) on delete cascade
);

------- 주문 -------
create sequence ono_seq;
CREATE TABLE orders (
   ono NUMBER PRIMARY KEY, 
   id VARCHAR2(100) NOT NULL, 
   totalprice NUMBER NOT NULL, 
   ordertime DATE NOT NULL,
   status VARCHAR2(100) NOT NULL,
   destination VARCHAR2(100) NOT NULL,
   constraint fk_id_in_orders foreign key(id) references member(id)
);

------- 주문상품 -------
CREATE TABLE order_product (
   ono NUMBER NOT NULL, 
   pdno NUMBER NOT NULL,
   quantity VARCHAR2(100) NOT NULL,
   constraint fk_ono_in_product_detail foreign key(ono) references orders(ono),
   constraint fk_pdno_in_product_detail foreign key(pdno) references product_detail(pdno),
   constraint pk_order_product primary key(ono, pdno)
);

------- 게시판 -------      
create sequence bno_seq;
CREATE TABLE board (
   bno NUMBER PRIMARY KEY, 
   title VARCHAR2(100) NOT NULL, 
   id VARCHAR2(100) NOT NULL,
   content CLOB NOT NULL,
   regdate DATE NOT NULL,
   security VARCHAR2(100) NOT NULL,
   category VARCHAR2(100) NOT NULL,
   constraint fk_id_in_board foreign key(id) references member(id)
);

------- 쪽지 -------
create sequence note_no_seq;
CREATE TABLE note(
   note_no NUMBER PRIMARY KEY,
   content CLOB NOT NULL,
   send_date DATE NOT NULL,
   id VARCHAR2(100) NOT NULL,
   constraint fk_id_in_note foreign key(id) references member(id)
);
            
----------------------------------------------------- 테이블 생성 SQL 끝

----------------------------------------------------- 테이블 조회 SQL

select * from GRADE;
select * from QUESTION;
select * from MEMBER;
select * from MEMBER_SIZE;
select * from POINT; 
select * from AUTH;
select * from INQUIRY;
select * from INQUIRY_REPLY;
select * from PRODUCT;
select * from IMAGE;
select * from ORDERS;
select * from PRODUCT_COLOR;
select * from PRODUCT_DETAIL;
select * from ORDER_PRODUCT;
select * from PRODUCT_SIZE;
select * from REVIEW;
select * from PRODUCT_QNA;
select * from BOARD;

