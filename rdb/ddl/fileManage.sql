create table tb_file_manage
(
    FILE_MANAGE_CD      varchar(10)                            not null comment '파일 관리 코드',
    DOMAIN_NAME         varchar(50)                            not null comment 'CDN 도메인 명',
    BUCKET_NAME         varchar(100)                           not null comment 'CDN 버킷 명',
    UPLOAD_PATH         varchar(100)                           not null comment '업로드 경로',
    ORIGIN_FILE_NAME_YN varchar(1) default 'N'                 not null comment '원본 파일 명 사용 여부',
    USE_YN              varchar(1) default 'Y'                 not null comment '파일 관리 사용 여부',
    REG_ID              varchar(36)                            not null comment '등록자',
    REG_TIME            datetime   default current_timestamp() not null comment '등록일시',
    UPD_ID              varchar(36)                            not null comment '수정자',
    UPD_TIME            datetime   default current_timestamp() not null comment '수정일시',
    primary key (FILE_MANAGE_CD)
)
    comment '파일 관리 테이블' engine = InnoDB;

insert into tb_file_manage (FILE_MANAGE_CD, DOMAIN_NAME, BUCKET_NAME, UPLOAD_PATH, ORIGIN_FILE_NAME_YN, USE_YN,
                                REG_ID, REG_TIME,
                                UPD_ID, UPD_TIME)
values ('EVENT', 'https://dev-cdn.jesomi.com/', 'dev-cdn.jesomi.com', 'event/', 'Y', 'Y',
        'f12c5d9e-e112-11ee-9fa6-0a29d499fce4', NOW(),
        'f12c5d9e-e112-11ee-9fa6-0a29d499fce4', NOW());

create table tb_cms_file_upload
(
    FILE_SEQ         bigint(20) unsigned auto_increment         not null comment '파일 업로드 일련번호',
    FILE_MANAGE_CD   varchar(10)                            not null comment '파일 관리 코드(tb_cms_file_manage.FILE_MANAGE_CD)',
    BUCKET_NAME      varchar(100)                           not null comment '업로드 버킷 명',
    UPLOAD_PATH      varchar(100)                           not null comment '업로드 경로',
    UPLOAD_FILE_NAME varchar(100)                           not null comment '업로드 파일 명',
    ORIGIN_FILE_NAME varchar(100)                           not null comment '원본 파일 명',
    UPLOAD_STATUS    varchar(1) default 'P'                 not null comment '업로드 상태(P:업로드 준비,C:업로드 완료,D:삭제)',
    REG_ID           varchar(36)                            not null comment '등록자',
    REG_TIME         datetime   default current_timestamp() not null comment '등록일시',
    UPD_ID           varchar(36)                            not null comment '수정자',
    UPD_TIME         datetime   default current_timestamp() not null comment '수정일시',
    primary key (FILE_SEQ)
)
    comment '파일 업로드 테이블' engine = InnoDB;

create index IDX_FILE_UPLOAD_01
    on tb_file_upload (FILE_MANAGE_CD);