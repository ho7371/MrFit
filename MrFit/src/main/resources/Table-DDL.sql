/* 회원 */
CREATE TABLE member (
	id VARCHAR2(100) NOT NULL, /* 아이디 */
	password VARCHAR2(100) NOT NULL, /* 비밀번호 */
	name VARCHAR2(100) NOT NULL, /* 이름 */
	phone VARCHAR2(100) NOT NULL, /* 연락처 */
	address VARCHAR2(100) NOT NULL, /* 주소 */
	email VARCHAR2(100) NOT NULL, /* 이메일 */
	point NUMBER NOT NULL, /* 포인트 */
	totalspent NUMBER NOT NULL, /* 누적구매액 */
	status VARCHAR2(100) NOT NULL, /* 활성상태 */
	answer VARCHAR2(100) NOT NULL, /* 답변 */
	qno VARCHAR2(100) NOT NULL, /* 질문번호 */
	grade VARCHAR2(100) NOT NULL /* 등급명 */
);

COMMENT ON TABLE member IS '회원';

COMMENT ON COLUMN member.id IS '아이디';

COMMENT ON COLUMN member.password IS '비밀번호';

COMMENT ON COLUMN member.name IS '이름';

COMMENT ON COLUMN member.phone IS '연락처';

COMMENT ON COLUMN member.address IS '주소';

COMMENT ON COLUMN member.email IS '이메일';

COMMENT ON COLUMN member.point IS '포인트';

COMMENT ON COLUMN member.totalspent IS '누적구매액';

COMMENT ON COLUMN member.status IS '활성상태';

COMMENT ON COLUMN member.answer IS '답변';

COMMENT ON COLUMN member.qno IS '질문번호';

COMMENT ON COLUMN member.grade IS '등급명';

CREATE UNIQUE INDEX PK_member
	ON member (
		id ASC
	);

ALTER TABLE member
	ADD
		CONSTRAINT PK_member
		PRIMARY KEY (
			id
		);

/* 포인트 */
CREATE TABLE point (
	point_no VARCHAR2(100) NOT NULL, /* 이력번호 */
	id VARCHAR2(100) NOT NULL, /* 아이디 */
	updown VARCHAR2(100) NOT NULL /* 가감액 */
);

COMMENT ON TABLE point IS '포인트';

COMMENT ON COLUMN point.point_no IS '이력번호';

COMMENT ON COLUMN point.id IS '아이디';

COMMENT ON COLUMN point.updown IS '가감액';

CREATE UNIQUE INDEX PK_point
	ON point (
		point_no ASC
	);

ALTER TABLE point
	ADD
		CONSTRAINT PK_point
		PRIMARY KEY (
			point_no
		);

/* 회원등급 */
CREATE TABLE grade (
	grade VARCHAR2(100) NOT NULL, /* 등급명 */
	percent NUMBER NOT NULL /* 적립비율 */
);

COMMENT ON TABLE grade IS '회원등급';

COMMENT ON COLUMN grade.grade IS '등급명';

COMMENT ON COLUMN grade.percent IS '적립비율';

CREATE UNIQUE INDEX PK_grade
	ON grade (
		grade ASC
	);

ALTER TABLE grade
	ADD
		CONSTRAINT PK_grade
		PRIMARY KEY (
			grade
		);

/* 권한 */
CREATE TABLE auth (
	auth VARCHAR2(100) NOT NULL, /* 권한명 */
	id VARCHAR2(100) NOT NULL /* 아이디 */
);

COMMENT ON TABLE auth IS '권한';

COMMENT ON COLUMN auth.auth IS '권한명';

COMMENT ON COLUMN auth.id IS '아이디';

CREATE UNIQUE INDEX PK_auth
	ON auth (
		auth ASC,
		id ASC
	);

ALTER TABLE auth
	ADD
		CONSTRAINT PK_auth
		PRIMARY KEY (
			auth,
			id
		);

/* 회원치수 */
CREATE TABLE member_size (
	msno VARCHAR2(100) NOT NULL, /* 회원치수번호 */
	id VARCHAR2(100) NOT NULL, /* 아이디 */
	shoulder NUMBER, /* 어깨 */
	chest NUMBER, /* 가슴 */
	sleeve NUMBER, /* 소매 */
	armhole NUMBER, /* 암홀 */
	toplength NUMBER, /* 상의총기장 */
	waist NUMBER, /* 허리 */
	crotch NUMBER, /* 밑위 */
	thigh NUMBER, /* 허벅지 */
	hem NUMBER, /* 밑단 */
	bottomlength NUMBER /* 하의총기장 */
);

COMMENT ON TABLE member_size IS '회원치수';

COMMENT ON COLUMN member_size.msno IS '회원치수번호';

COMMENT ON COLUMN member_size.id IS '아이디';

COMMENT ON COLUMN member_size.shoulder IS '어깨';

COMMENT ON COLUMN member_size.chest IS '가슴';

COMMENT ON COLUMN member_size.sleeve IS '소매';

COMMENT ON COLUMN member_size.armhole IS '암홀';

COMMENT ON COLUMN member_size.toplength IS '상의총기장';

COMMENT ON COLUMN member_size.waist IS '허리';

COMMENT ON COLUMN member_size.crotch IS '밑위';

COMMENT ON COLUMN member_size.thigh IS '허벅지';

COMMENT ON COLUMN member_size.hem IS '밑단';

COMMENT ON COLUMN member_size.bottomlength IS '하의총기장';

CREATE UNIQUE INDEX PK_member_size
	ON member_size (
		msno ASC
	);

ALTER TABLE member_size
	ADD
		CONSTRAINT PK_member_size
		PRIMARY KEY (
			msno
		);

/* 주문 */
CREATE TABLE orders (
	ono VARCHAR2(100) NOT NULL, /* 주문번호 */
	id VARCHAR2(100) NOT NULL, /* 아이디 */
	totalprice NUMBER NOT NULL, /* 총주문금액 */
	ordertime DATE NOT NULL, /* 주문시각 */
	status VARCHAR2(100) NOT NULL /* 주문상태 */
);

COMMENT ON TABLE orders IS '주문';

COMMENT ON COLUMN orders.ono IS '주문번호';

COMMENT ON COLUMN orders.id IS '아이디';

COMMENT ON COLUMN orders.totalprice IS '총주문금액';

COMMENT ON COLUMN orders.ordertime IS '주문시각';

COMMENT ON COLUMN orders.status IS '주문상태';

CREATE UNIQUE INDEX PK_orders
	ON orders (
		ono ASC
	);

ALTER TABLE orders
	ADD
		CONSTRAINT PK_orders
		PRIMARY KEY (
			ono
		);

/* 상품게시판 */
CREATE TABLE board (
	bno VARCHAR2(100) NOT NULL, /* 글번호 */
	id VARCHAR2(100) NOT NULL, /* 아이디 */
	content CLOB NOT NULL, /* 본문 */
	regdate DATE NOT NULL, /* 작성일시 */
	security VARCHAR2(100) NOT NULL, /* 비밀등급 */
	category VARCHAR2(100) NOT NULL, /* 카테고리 */
	pno VARCHAR2(100) NOT NULL /* 상품번호 */
);

COMMENT ON TABLE board IS '상품게시판';

COMMENT ON COLUMN board.bno IS '글번호';

COMMENT ON COLUMN board.id IS '아이디';

COMMENT ON COLUMN board.content IS '본문';

COMMENT ON COLUMN board.regdate IS '작성일시';

COMMENT ON COLUMN board.security IS '비밀등급';

COMMENT ON COLUMN board.category IS '카테고리';

COMMENT ON COLUMN board.pno IS '상품번호';

CREATE UNIQUE INDEX PK_board
	ON board (
		bno ASC
	);

ALTER TABLE board
	ADD
		CONSTRAINT PK_board
		PRIMARY KEY (
			bno
		);

/* 댓글 */
CREATE TABLE reply (
	rno VARCHAR2(100) NOT NULL, /* 댓글번호 */
	content CLOB NOT NULL, /* 댓글내용 */
	regdate DATE NOT NULL, /* 작성일시 */
	bno VARCHAR2(100) NOT NULL /* 글번호 */
);

COMMENT ON TABLE reply IS '댓글';

COMMENT ON COLUMN reply.rno IS '댓글번호';

COMMENT ON COLUMN reply.content IS '댓글내용';

COMMENT ON COLUMN reply.regdate IS '작성일시';

COMMENT ON COLUMN reply.bno IS '글번호';

CREATE UNIQUE INDEX PK_reply
	ON reply (
		rno ASC
	);

ALTER TABLE reply
	ADD
		CONSTRAINT PK_reply
		PRIMARY KEY (
			rno
		);

/* 상품상세 */
CREATE TABLE product_detail (
	pdno VARCHAR2(100) NOT NULL, /* 상품상세번호 */
	color VARCHAR2(100) NOT NULL, /* 색상 */
	pno VARCHAR2(100) NOT NULL /* 상품번호 */
);

COMMENT ON TABLE product_detail IS '상품상세';

COMMENT ON COLUMN product_detail.pdno IS '상품상세번호';

COMMENT ON COLUMN product_detail.color IS '색상';

COMMENT ON COLUMN product_detail.pno IS '상품번호';

CREATE UNIQUE INDEX PK_product_detail
	ON product_detail (
		pdno ASC
	);

ALTER TABLE product_detail
	ADD
		CONSTRAINT PK_product_detail
		PRIMARY KEY (
			pdno
		);

/* 주문상품 */
CREATE TABLE order_product (
	pdno VARCHAR2(100) NOT NULL, /* 상품상세번호 */
	ono VARCHAR2(100) NOT NULL, /* 주문번호 */
	quantity VARCHAR2(100) NOT NULL /* 주문수량 */
);

COMMENT ON TABLE order_product IS '주문상품';

COMMENT ON COLUMN order_product.pdno IS '상품상세번호';

COMMENT ON COLUMN order_product.ono IS '주문번호';

COMMENT ON COLUMN order_product.quantity IS '주문수량';

CREATE UNIQUE INDEX PK_order_product
	ON order_product (
		pdno ASC,
		ono ASC
	);

ALTER TABLE order_product
	ADD
		CONSTRAINT PK_order_product
		PRIMARY KEY (
			pdno,
			ono
		);

/* 상품치수 */
CREATE TABLE product_size (
	psno VARCHAR2(100) NOT NULL, /* 상품치수 */
	size1 NUMBER NOT NULL, /* size1 */
	size2 NUMBER NOT NULL, /* size2 */
	size3 NUMBER NOT NULL, /* size3 */
	size4 NUMBER NOT NULL, /* size4 */
	size5 NUMBER NOT NULL, /* size5 */
	size_type VARCHAR2(100) NOT NULL, /* 사이즈타입 */
	inventory NUMBER NOT NULL, /* 재고수량 */
	pdno VARCHAR2(100) NOT NULL /* 상품상세번호 */
);

COMMENT ON TABLE product_size IS '상품치수';

COMMENT ON COLUMN product_size.psno IS '상품치수';

COMMENT ON COLUMN product_size.size1 IS 'size1';

COMMENT ON COLUMN product_size.size2 IS 'size2';

COMMENT ON COLUMN product_size.size3 IS 'size3';

COMMENT ON COLUMN product_size.size4 IS 'size4';

COMMENT ON COLUMN product_size.size5 IS 'size5';

COMMENT ON COLUMN product_size.size_type IS '사이즈타입';

COMMENT ON COLUMN product_size.inventory IS '재고수량';

COMMENT ON COLUMN product_size.pdno IS '상품상세번호';

CREATE UNIQUE INDEX PK_product_size
	ON product_size (
		psno ASC
	);

ALTER TABLE product_size
	ADD
		CONSTRAINT PK_product_size
		PRIMARY KEY (
			psno
		);

/* 이미지 */
CREATE TABLE image (
	ino VARCHAR2(100) NOT NULL, /* 이미지번호 */
	pno VARCHAR2(100) NOT NULL, /* 상품번호 */
	url VARCHAR2(300) NOT NULL /* url */
);

COMMENT ON TABLE image IS '이미지';

COMMENT ON COLUMN image.ino IS '이미지번호';

COMMENT ON COLUMN image.pno IS '상품번호';

COMMENT ON COLUMN image.url IS 'url';

CREATE UNIQUE INDEX PK_image
	ON image (
		ino ASC
	);

ALTER TABLE image
	ADD
		CONSTRAINT PK_image
		PRIMARY KEY (
			ino
		);

/* 상품 */
CREATE TABLE product (
	pno VARCHAR2(100) NOT NULL, /* 상품번호 */
	name VARCHAR2(100) NOT NULL, /* 상품명 */
	price NUMBER NOT NULL, /* 가격 */
	content CLOB NOT NULL, /* 상품설명 */
	category VARCHAR2(100) NOT NULL /* 카테고리 */
);

COMMENT ON TABLE product IS '상품';

COMMENT ON COLUMN product.pno IS '상품번호';

COMMENT ON COLUMN product.name IS '상품명';

COMMENT ON COLUMN product.price IS '가격';

COMMENT ON COLUMN product.content IS '상품설명';

COMMENT ON COLUMN product.category IS '카테고리';

CREATE UNIQUE INDEX PK_product
	ON product (
		pno ASC
	);

ALTER TABLE product
	ADD
		CONSTRAINT PK_product
		PRIMARY KEY (
			pno
		);

/* 회원게시판 */
CREATE TABLE member_board (
	mbno VARCHAR2(100) NOT NULL, /* 글번호 */
	content CLOB NOT NULL, /* 본문 */
	regdate DATE NOT NULL, /* 작성일시 */
	security VARCHAR2(100) NOT NULL, /* 비밀등급 */
	category VARCHAR2(100) NOT NULL, /* 카테고리 */
	id VARCHAR2(100) NOT NULL /* 아이디 */
);

COMMENT ON TABLE member_board IS '회원게시판';

COMMENT ON COLUMN member_board.mbno IS '글번호';

COMMENT ON COLUMN member_board.content IS '본문';

COMMENT ON COLUMN member_board.regdate IS '작성일시';

COMMENT ON COLUMN member_board.security IS '비밀등급';

COMMENT ON COLUMN member_board.category IS '카테고리';

COMMENT ON COLUMN member_board.id IS '아이디';

CREATE UNIQUE INDEX PK_member_board
	ON member_board (
		mbno ASC
	);

ALTER TABLE member_board
	ADD
		CONSTRAINT PK_member_board
		PRIMARY KEY (
			mbno
		);

/* 상품댓글 */
CREATE TABLE member_reply (
	mrno VARCHAR2(100) NOT NULL, /* 댓글번호 */
	content CLOB, /* 댓글내용 */
	regdate DATE, /* 작성일시 */
	mbno VARCHAR2(100) /* 글번호 */
);

COMMENT ON TABLE member_reply IS '상품댓글';

COMMENT ON COLUMN member_reply.mrno IS '댓글번호';

COMMENT ON COLUMN member_reply.content IS '댓글내용';

COMMENT ON COLUMN member_reply.regdate IS '작성일시';

COMMENT ON COLUMN member_reply.mbno IS '글번호';

CREATE UNIQUE INDEX PK_member_reply
	ON member_reply (
		mrno ASC
	);

ALTER TABLE member_reply
	ADD
		CONSTRAINT PK_member_reply
		PRIMARY KEY (
			mrno
		);

/* 비밀번호찾기질문 */
CREATE TABLE question (
	qno VARCHAR2(100) NOT NULL, /* 질문번호 */
	question VARCHAR2(100) NOT NULL /* 질문 */
);

COMMENT ON TABLE question IS '비밀번호찾기질문';

COMMENT ON COLUMN question.qno IS '질문번호';

COMMENT ON COLUMN question.question IS '질문';

CREATE UNIQUE INDEX PK_question
	ON question (
		qno ASC
	);

ALTER TABLE question
	ADD
		CONSTRAINT PK_question
		PRIMARY KEY (
			qno
		);

ALTER TABLE member
	ADD
		CONSTRAINT FK_grade_TO_member
		FOREIGN KEY (
			grade
		)
		REFERENCES grade (
			grade
		);

ALTER TABLE member
	ADD
		CONSTRAINT FK_question_TO_member
		FOREIGN KEY (
			qno
		)
		REFERENCES question (
			qno
		);

ALTER TABLE point
	ADD
		CONSTRAINT FK_member_TO_point
		FOREIGN KEY (
			id
		)
		REFERENCES member (
			id
		);

ALTER TABLE auth
	ADD
		CONSTRAINT FK_member_TO_auth
		FOREIGN KEY (
			id
		)
		REFERENCES member (
			id
		);

ALTER TABLE member_size
	ADD
		CONSTRAINT FK_member_TO_member_size
		FOREIGN KEY (
			id
		)
		REFERENCES member (
			id
		);

ALTER TABLE orders
	ADD
		CONSTRAINT FK_member_TO_orders
		FOREIGN KEY (
			id
		)
		REFERENCES member (
			id
		);

ALTER TABLE board
	ADD
		CONSTRAINT FK_product_TO_board
		FOREIGN KEY (
			pno
		)
		REFERENCES product (
			pno
		);

ALTER TABLE board
	ADD
		CONSTRAINT FK_member_TO_board
		FOREIGN KEY (
			id
		)
		REFERENCES member (
			id
		);

ALTER TABLE reply
	ADD
		CONSTRAINT FK_board_TO_reply
		FOREIGN KEY (
			bno
		)
		REFERENCES board (
			bno
		);

ALTER TABLE product_detail
	ADD
		CONSTRAINT FK_product_TO_product_detail
		FOREIGN KEY (
			pno
		)
		REFERENCES product (
			pno
		);

ALTER TABLE order_product
	ADD
		CONSTRAINT FK_product_detail_TO_order_product
		FOREIGN KEY (
			pdno
		)
		REFERENCES product_detail (
			pdno
		);

ALTER TABLE order_product
	ADD
		CONSTRAINT FK_orders_TO_order_product
		FOREIGN KEY (
			ono
		)
		REFERENCES orders (
			ono
		);

ALTER TABLE product_size
	ADD
		CONSTRAINT FK_product_detail_TO_product_size
		FOREIGN KEY (
			pdno
		)
		REFERENCES product_detail (
			pdno
		);

ALTER TABLE image
	ADD
		CONSTRAINT FK_product_TO_image
		FOREIGN KEY (
			pno
		)
		REFERENCES product (
			pno
		);

ALTER TABLE member_board
	ADD
		CONSTRAINT FK_member_TO_member_board
		FOREIGN KEY (
			id
		)
		REFERENCES member (
			id
		);

ALTER TABLE member_reply
	ADD
		CONSTRAINT FK_member_board_TO_member_reply
		FOREIGN KEY (
			mbno
		)
		REFERENCES member_board (
			mbno
		);