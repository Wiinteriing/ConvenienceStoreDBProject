-- 1. 회원 테이블
CREATE TABLE 회원 (
    회원아이디 VARCHAR(30) NOT NULL,
    비밀번호 VARCHAR(100) NOT NULL,
    이메일 VARCHAR(100) NULL,
    이름 VARCHAR(50) NOT NULL,
    나이 INT NULL DEFAULT 0,
    생성일 DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT PK_회원 PRIMARY KEY (회원아이디),
    CONSTRAINT UQ_회원_이메일 UNIQUE (이메일),
    CONSTRAINT CK_회원_나이 CHECK (나이 >= 0)
);

-- 2. 마이페이지 테이블
CREATE TABLE 마이페이지 (
    회원아이디 VARCHAR(30) NOT NULL,
    프로필이미지 VARCHAR(255) NULL,
    닉네임 VARCHAR(50) NULL,
    이름 VARCHAR(50) NULL,
    소개 VARCHAR(255) NULL,
    가입일 DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT PK_마이페이지 PRIMARY KEY (회원아이디),
    CONSTRAINT FK_마이페이지_회원 FOREIGN KEY (회원아이디) REFERENCES 회원(회원아이디)
);

-- 3. 상품 테이블
CREATE TABLE 상품 (
    상품명 VARCHAR(100) NOT NULL,
    재고량 INT NOT NULL DEFAULT 0,
    단가 INT NOT NULL DEFAULT 0,
    CONSTRAINT PK_상품 PRIMARY KEY (상품명),
    CONSTRAINT CK_상품_재고량 CHECK (재고량 >= 0),
    CONSTRAINT CK_상품_단가 CHECK (단가 >= 0)
);

-- 4. 편의점 테이블
CREATE TABLE 편의점 (
    편의점ID VARCHAR(30) NOT NULL,
    편의점명 VARCHAR(100) NOT NULL,
    지점명 VARCHAR(100) NULL,
    지점위치 VARCHAR(255) NULL,
    `GPS정보(위도)` DECIMAL(9,6) NULL,
    `GPS정보(경도)` DECIMAL(9,6) NULL,
    전화번호 VARCHAR(20) NULL,
    CONSTRAINT PK_편의점 PRIMARY KEY (편의점ID)
);

-- 5. 재고 테이블
CREATE TABLE 재고 (
    재고ID INT NOT NULL,
    편의점ID VARCHAR(30) NOT NULL,
    상품명 VARCHAR(100) NOT NULL,
    재고수량 INT NOT NULL DEFAULT 0,
    CONSTRAINT PK_재고 PRIMARY KEY (재고ID),
    CONSTRAINT FK_재고_편의점 FOREIGN KEY (편의점ID) REFERENCES 편의점(편의점ID),
    CONSTRAINT FK_재고_상품 FOREIGN KEY (상품명) REFERENCES 상품(상품명),
    CONSTRAINT UQ_재고_편의점_상품 UNIQUE (편의점ID, 상품명),
    CONSTRAINT CK_재고_재고수량 CHECK (재고수량 >= 0)
);

-- 6. 즐겨찾기 테이블
CREATE TABLE 즐겨찾기 (
    회원아이디 VARCHAR(30) NOT NULL,
    상품명 VARCHAR(100) NOT NULL,
    즐겨찾기등록일 DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT PK_즐겨찾기 PRIMARY KEY (회원아이디, 상품명),
    CONSTRAINT FK_즐겨찾기_회원 FOREIGN KEY (회원아이디) REFERENCES 회원(회원아이디),
    CONSTRAINT FK_즐겨찾기_상품 FOREIGN KEY (상품명) REFERENCES 상품(상품명)
);

-- 7. 관리자 테이블
CREATE TABLE 관리자 (
    아이디 VARCHAR(30) NOT NULL,
    비밀번호 VARCHAR(100) NOT NULL,
    이름 VARCHAR(50) NOT NULL,
    CONSTRAINT PK_관리자 PRIMARY KEY (아이디)
);

-- 8. 공지사항 테이블
CREATE TABLE 공지사항 (
    공지ID INT NOT NULL,
    공지내용 VARCHAR(1000) NOT NULL,
    작성일 DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT PK_공지사항 PRIMARY KEY (공지ID)
);

-- 9. 회원정보 테이블
CREATE TABLE 회원정보 (
    회원아이디 VARCHAR(30) NOT NULL,
    이메일 VARCHAR(100) NULL,
    전화번호 VARCHAR(20) NULL,
    CONSTRAINT PK_회원정보 PRIMARY KEY (회원아이디),
    CONSTRAINT FK_회원정보_회원 FOREIGN KEY (회원아이디) REFERENCES 회원(회원아이디)
);