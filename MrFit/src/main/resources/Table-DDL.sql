----------------------------------------------------- 삭제 SQL
------------ 삭제순서 : 1. 시퀀스 삭제  		2. 테이블 삭제
------------ 시퀀스 삭제
drop sequence qno_seq;
drop sequence point_no_seq;
drop sequence msno_seq;
drop sequence mbno_seq;
drop sequence rno_seq;
drop sequence pno_seq;
drop sequence pbno_seq;
drop sequence mrno_seq;
drop sequence irno_seq;
drop sequence ino_seq;
drop sequence ono_seq;
drop sequence pcno_seq;
drop sequence pdno_seq;
drop sequence psno_seq;


------------ 테이블 삭제

drop table ORDER_PRODUCT;
drop table PRODUCT_DETAIL;
drop table PRODUCT_SIZE;
drop table PRODUCT_COLOR;
drop table ORDERS;
drop table IMAGE;
drop table PRODUCT_REPLY;
drop table PRODUCT_BOARD;
drop table PRODUCT;
drop table INQUIRY_REPLY;
drop table INQUIRY;
drop table AUTH;
drop table POINT; 
drop table MEMBER;
drop table MEMBER_SIZE;
drop table QUESTION;
drop table GRADE;
	
----------------------------------------------------- 삭제 SQL 종료

-------------------------------------------------------- 테이블 생성 SQL

------------ 생성순서 : 1. 시퀀스 생성  		2. 테이블 생성

------------ 외래키 이름은 일단 지어놨고, 규칙 정해서 나중에 확정할 것 : 진호

/* 시퀀스 생성 */
create sequence qno_seq;
create sequence point_no_seq;
create sequence msno_seq;
create sequence mbno_seq;
create sequence rno_seq;
create sequence pno_seq;
create sequence pbno_seq;
create sequence mrno_seq;
create sequence ino_seq;
create sequence irno_seq;
create sequence ono_seq;
create sequence pcno_seq;
create sequence pdno_seq;
create sequence psno_seq;


/* 회원 등급 */
CREATE TABLE grade (
	grade VARCHAR2(100) PRIMARY KEY, 
	percent NUMBER NOT NULL 
);

/* 비밀번호 찾기 질문 */  
CREATE TABLE question (
	qno NUMBER PRIMARY KEY, 
	question VARCHAR2(100) NOT NULL 
);

/* 회원치수 */
CREATE TABLE member_size (
	id VARCHAR2(100) NOT NULL,
	shoulder NUMBER, 
	chest NUMBER, 
	sleeve NUMBER, 
	armhole NUMBER,
	toplength NUMBER, 
	waist NUMBER,
	crotch NUMBER, 
	thigh NUMBER, 
	hem NUMBER, 
	bottomlength NUMBER,
	constraint fk_id_in_member foreign key(id) references member(id)
);
CREATE INDEX member_size_unique ON member_size(id);


/* 회원 */
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
	msno NUMBER,
	constraint fk_qno_in_member foreign key(qno) references question(qno),
	constraint fk_grade_in_member foreign key(grade) references grade(grade),
	constraint fk_msno_in_member foreign key(msno) references member_size(msno)
);

/* 포인트 */
CREATE TABLE point (
	point_no NUMBER PRIMARY KEY, 
	id VARCHAR2(100) NOT NULL, 
	updown NUMBER NOT NULL,
	change_date date NOT NULL,
	constraint fk_id_in_point foreign key(id) references member(id)
);

/* 권한 */
CREATE TABLE auth (
	id VARCHAR2(100) NOT NULL,
	auth VARCHAR2(100) NOT NULL,
	constraint fk_id_in_auth foreign key(id) references member(id),
	constraint pk_auth primary key(id, auth)
);

/* 고객문의 게시판 */
CREATE TABLE inquiry (
	inquiry_no NUMBER PRIMARY KEY, 
	content CLOB NOT NULL, 
	regdate DATE NOT NULL, 
	security VARCHAR2(100) NOT NULL, 
	category VARCHAR2(100) NOT NULL, 
	id VARCHAR2(100) NOT NULL,
	constraint fk_id_in_inquiry foreign key(id) references member(id)
);

/* 고객문의 댓글 */
CREATE TABLE inquiry_reply (
	irno NUMBER PRIMARY KEY,
	content CLOB NOT NULL,
	regdate DATE NOT NULL, 
	inquiry_no NUMBER NOT NULL,
	constraint fk_inquiry_no_in_reply foreign key(inquiry_no) references inquiry(inquiry_no)
);

/* 상품 */
CREATE TABLE product (
	pno NUMBER PRIMARY KEY, 
	name VARCHAR2(100) NOT NULL,
	price NUMBER NOT NULL,
	content CLOB NOT NULL, 
	category VARCHAR2(100) NOT NULL
);

/* 상품게시판 */
CREATE TABLE product_board (
	pbno NUMBER PRIMARY KEY, 
	id VARCHAR2(100) NOT NULL,
	content CLOB NOT NULL,
	regdate DATE NOT NULL,
	security VARCHAR2(100) NOT NULL, 
	category VARCHAR2(100) NOT NULL, 
	pno NUMBER NOT NULL,
	constraint fk_pno_in_product_board foreign key(pno) references product(pno)
);

/* 상품댓글 */
CREATE TABLE product_reply (
	mrno NUMBER PRIMARY KEY, 
	content CLOB,
	regdate DATE NOT NULL,
	pbno NUMBER NOT NULL,
	constraint fk_pbno_in_product_reply foreign key(pbno) references product_board(pbno)
);

/* 이미지 */
CREATE TABLE image (
	ino NUMBER PRIMARY KEY, 
	pno NUMBER NOT NULL, 
	url VARCHAR2(300) NOT NULL,
	constraint fk_pno_in_image foreign key(pno) references product(pno)
);

/* 주문 */
CREATE TABLE orders (
	ono NUMBER PRIMARY KEY, 
	id VARCHAR2(100) NOT NULL, 
	totalprice NUMBER NOT NULL, 
	ordertime DATE NOT NULL,
	status VARCHAR2(100) NOT NULL,
	constraint fk_id_in_orders foreign key(id) references member(id)
);
			
				/* 상품 색상 [진행중인 테이블 선택시 추가해야 할 테이블] */			
					CREATE TABLE product_color (
						pcno NUMBER PRIMARY KEY,
						color_name VARCHAR2(100) NOT NULL
					);
					
				/* 상품치수 [작업중인 테이블]*/
				CREATE TABLE product_size (
					psno NUMBER PRIMARY KEY,
					size_name VARCHAR2(100) NOT NULL, /* 칼럼명 변경 */
					size1 NUMBER NOT NULL,
					size2 NUMBER NOT NULL,
					size3 NUMBER NOT NULL,
					size4 NUMBER NOT NULL,
					size5 NUMBER NOT NULL,
					inventory NUMBER NOT NULL
				);
				
				/* 상품치수 [기존 테이블]
				CREATE TABLE product_size (
					psno VARCHAR2(100) PRIMARY KEY,
					size1 NUMBER NOT NULL,
					size2 NUMBER NOT NULL,
					size3 NUMBER NOT NULL,
					size4 NUMBER NOT NULL,
					size5 NUMBER NOT NULL,
					size_type VARCHAR2(100) NOT NULL,
					inventory NUMBER NOT NULL,
					pdno VARCHAR2(100) NOT NULL,
					constraint fk_pdno_in_product_size foreign key(pdno) references product_detail(pdno)
				);*/
				
			/* 상품상세 [작업중인 테이블]*/
			CREATE TABLE product_detail (
				pdno NUMBER PRIMARY KEY,
				pno NUMBER NOT NULL,
				pcno NUMBER NOT NULL, 
				psno NUMBER NOT NULL,
				constraint fk_pno_in_product_detail foreign key(pno) references product(pno),
				constraint fk_color_in_product_detail foreign key(pcno) references product_color(pcno),
				constraint fk_psno_in_product_detail foreign key(psno) references product_size(psno)
			);
			CREATE INDEX product_detail_unique ON product_detail(pno, pcno, psno);
			/* CREATE INDEX 인덱스명 ON 테이블명(칼럼1, 칼럼2, 칼럼3); */
			
			
			/* 상품상세 [기존테이블]
			CREATE TABLE product_detail (
				pdno VARCHAR2(100) PRIMARY KEY,
				color VARCHAR2(100) NOT NULL, 
				pno VARCHAR2(100) NOT NULL,
				constraint fk_pno_in_product_detail foreign key(pno) references product(pno)
			);*/

/* 주문상품 */
CREATE TABLE order_product (
	ono NUMBER NOT NULL, 
	pdno NUMBER NOT NULL,
	quantity VARCHAR2(100) NOT NULL,
	constraint fk_ono_in_product_detail foreign key(ono) references orders(ono),
	constraint fk_pdno_in_product_detail foreign key(pdno) references product_detail(pdno),
	constraint pk_order_product primary key(ono, pdno)
);

				
----------------------------------------------------- 테이블 생성 SQL 끝

----------------------------------------------------- 테이블 조회 SQL

select * from GRADE;
select * from QUESTION;
select * from MEMBER;
select * from POINT; 
select * from AUTH;
select * from MEMBER_SIZE;
select * from INQUIRY;
select * from MEMBER_REPLY;
select * from PRODUCT;
select * from PRODUCT_BOARD;
select * from PRODUCT_REPLY;
select * from IMAGE;
select * from ORDERS;
select * from PRODUCT_COLOR;
select * from PRODUCT_DETAIL;
select * from ORDER_PRODUCT;
select * from PRODUCT_SIZE;
