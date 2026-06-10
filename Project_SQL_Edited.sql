-- 1. 회원 테이블 (이메일/전화번호 분리)
CREATE TABLE 회원 (
    회원아이디  VARCHAR(30)  NOT NULL,
    비밀번호    VARCHAR(100) NOT NULL,
    이름        VARCHAR(50)  NOT NULL,
    나이        INT          NULL DEFAULT 0,
    생성일      DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT PK_회원 PRIMARY KEY (회원아이디),
    CONSTRAINT CK_회원_나이 CHECK (나이 >= 0)
);

-- 2. 회원정보 테이블 (이메일과 전화번호 분리 → 1NF)
CREATE TABLE 회원정보 (
    회원아이디  VARCHAR(30)  NOT NULL,
    이메일      VARCHAR(100) NULL,
    전화번호    VARCHAR(20)  NULL,
    CONSTRAINT PK_회원정보 PRIMARY KEY (회원아이디),
    CONSTRAINT UQ_회원정보_이메일 UNIQUE (이메일),
    CONSTRAINT FK_회원정보_회원 FOREIGN KEY (회원아이디)
        REFERENCES 회원(회원아이디)
);

-- 3. 마이페이지 테이블 (이름 중복 제거)
CREATE TABLE 마이페이지 (
    회원아이디    VARCHAR(30)  NOT NULL,
    프로필이미지  VARCHAR(255) NULL,
    닉네임        VARCHAR(50)  NULL,
    소개          VARCHAR(255) NULL,
    가입일        DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT PK_마이페이지 PRIMARY KEY (회원아이디),
    CONSTRAINT FK_마이페이지_회원 FOREIGN KEY (회원아이디)
        REFERENCES 회원(회원아이디)
);

-- 4. 상품 테이블 (재고량 제거 → 재고 테이블로 통합)
CREATE TABLE 상품 (
    상품명  VARCHAR(100) NOT NULL,
    단가    INT          NOT NULL DEFAULT 0,
    CONSTRAINT PK_상품 PRIMARY KEY (상품명),
    CONSTRAINT CK_상품_단가 CHECK (단가 >= 0)
);

-- 5. 편의점 테이블 (컬럼명 정리)
CREATE TABLE 편의점 (
    편의점ID  VARCHAR(30)    NOT NULL,
    편의점명  VARCHAR(100)   NOT NULL,
    지점명    VARCHAR(100)   NULL,
    시        VARCHAR(50)    NULL,   -- 지점위치 분리
    구        VARCHAR(50)    NULL,
    상세주소  VARCHAR(150)   NULL,
    위도      DECIMAL(9,6)   NULL,   -- GPS 컬럼명 정리
    경도      DECIMAL(9,6)   NULL,
    전화번호  VARCHAR(20)    NULL,
    CONSTRAINT PK_편의점 PRIMARY KEY (편의점ID)
);

-- 6. 재고 테이블 (복합 PK로 변경, 상품명 FK 명시)
CREATE TABLE 재고 (
    편의점ID  VARCHAR(30)  NOT NULL,
    상품명    VARCHAR(100) NOT NULL,
    재고수량  INT          NOT NULL DEFAULT 0,
    CONSTRAINT PK_재고 PRIMARY KEY (편의점ID, 상품명), -- 복합 PK
    CONSTRAINT FK_재고_편의점 FOREIGN KEY (편의점ID)
        REFERENCES 편의점(편의점ID),
    CONSTRAINT FK_재고_상품 FOREIGN KEY (상품명)       -- ERD 누락된 FK
        REFERENCES 상품(상품명),
    CONSTRAINT CK_재고_재고수량 CHECK (재고수량 >= 0)
);

-- 7. 즐겨찾기 테이블 (변경 없음)
CREATE TABLE 즐겨찾기 (
    회원아이디      VARCHAR(30)  NOT NULL,
    상품명          VARCHAR(100) NOT NULL,
    즐겨찾기등록일  DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT PK_즐겨찾기 PRIMARY KEY (회원아이디, 상품명),
    CONSTRAINT FK_즐겨찾기_회원 FOREIGN KEY (회원아이디)
        REFERENCES 회원(회원아이디),
    CONSTRAINT FK_즐겨찾기_상품 FOREIGN KEY (상품명)
        REFERENCES 상품(상품명)
);

-- 8. 관리자 테이블
CREATE TABLE 관리자 (
    아이디    VARCHAR(30)  NOT NULL,
    비밀번호  VARCHAR(100) NOT NULL,
    이름      VARCHAR(50)  NOT NULL,
    CONSTRAINT PK_관리자 PRIMARY KEY (아이디)
);

-- 9. 공지사항 테이블 (작성자 FK 추가)
CREATE TABLE 공지사항 (
    공지ID      INT          NOT NULL,
    작성자      VARCHAR(30)  NOT NULL,
    공지내용    VARCHAR(1000) NOT NULL,
    작성일      DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT PK_공지사항 PRIMARY KEY (공지ID),
    CONSTRAINT FK_공지사항_관리자 FOREIGN KEY (작성자)
        REFERENCES 관리자(아이디)
);
