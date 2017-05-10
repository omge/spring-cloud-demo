CREATE DATABASE IF NOT EXISTS `SCHEMA_USER`;
USE `SCHEMA_USER`;

DROP TABLE IF EXISTS `USER`;
CREATE TABLE `USER` (
  `ID`            CHAR(36)     NOT NULL,
  `LOGIN_NAME`    VARCHAR(45)  NOT NULL,
  `PASSWORD`      VARCHAR(100) NOT NULL,
  `NICK_NAME`     VARCHAR(45)  NOT NULL,
  `EMAIL`         VARCHAR(45)  NOT NULL,
  `PHONE`         VARCHAR(45)       DEFAULT NULL,
  `STATUS`        VARCHAR(20)  NOT NULL,
  `GRADE`         TINYINT(2)        DEFAULT 0,
  `VERSION`       BIGINT(20)        DEFAULT NULL,
  `CREATED_TIME`  TIMESTAMP    NULL DEFAULT CURRENT_TIMESTAMP,
  `MODIFIED_TIME` TIMESTAMP    NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `USER_ID_UINDEX` (`ID`)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

DROP TABLE IF EXISTS `USER_AUTHORITY`;
CREATE TABLE `USER_AUTHORITY` (
  `ID`        CHAR(36)    NOT NULL,
  `USER_ID`   CHAR(36)    NOT NULL,
  `AUTHORITY` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `USER_AUTHORITY_ID_UINDEX` (`ID`),
  KEY `USER_AUTHORITY_USER_ID_FK` (`USER_ID`),
  CONSTRAINT `USER_AUTHORITY_USER_ID_FK` FOREIGN KEY (`USER_ID`) REFERENCES `USER` (`ID`)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

INSERT INTO SCHEMA_USER.USER (ID, LOGIN_NAME, PASSWORD, NICK_NAME, EMAIL, PHONE, STATUS, GRADE, VERSION, CREATED_TIME, MODIFIED_TIME)
VALUES ('806f0ac6-a3e4-42a1-8dfc-1a3e56002881', 'gavin', '$2a$10$lZtZ84C7opaUODCAdYzhwuNOuGqpSVjZLiM/gcZiAqEDDI/Vfq/Vu',
                                                'gavin-guo', 'gavin.guo@msn.com', '13621670031', 'ENABLED', 1, 1,
                                                '2016-11-03 07:25:03', '2016-11-03 07:25:03');

INSERT INTO SCHEMA_USER.USER_AUTHORITY (ID, USER_ID, AUTHORITY)
VALUES ('bca21a1c-2afe-4305-875d-ee5ec5ac395f', '806f0ac6-a3e4-42a1-8dfc-1a3e56002881', 'AUTHORITY_SUPER');