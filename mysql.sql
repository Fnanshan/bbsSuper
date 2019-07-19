/*
SQLyog Ultimate v11.11 (64 bit)
MySQL - 5.5.37 : Database - bbs
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`bbs` /*!40100 DEFAULT CHARACTER SET gbk */;

USE `bbs`;

/*Table structure for table `bbs_bbs` */

DROP TABLE IF EXISTS `bbs_bbs`;

CREATE TABLE `bbs_bbs` (
  `bbsid` bigint(20) NOT NULL COMMENT '板块自动编号',
  `boardid` bigint(20) DEFAULT NULL COMMENT '所属板块',
  `parentid` bigint(20) DEFAULT NULL COMMENT '父贴编号',
  `child` bigint(20) DEFAULT NULL COMMENT '跟贴数',
  `username` varchar(100) DEFAULT NULL COMMENT '发表人姓名',
  `expression` varchar(100) DEFAULT NULL COMMENT '发帖人E-mail',
  `bbstitle` varchar(200) DEFAULT NULL COMMENT '发表人',
  `bbscontent` text COMMENT '文章内容',
  `dateandtime` datetime DEFAULT NULL COMMENT '文章发表时间',
  `bbsclick` bigint(20) DEFAULT NULL COMMENT '论坛点击率',
  `bbshot` varchar(10) DEFAULT NULL COMMENT '是否为精华帖',
  PRIMARY KEY (`bbsid`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

/*Data for the table `bbs_bbs` */

/*Table structure for table `bbs_user` */

DROP TABLE IF EXISTS `bbs_user`;

CREATE TABLE `bbs_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '会员编号',
  `username` varchar(100) NOT NULL COMMENT '会员姓名',
  `userpass` varchar(100) DEFAULT NULL COMMENT '会员密码',
  `usertype` varchar(100) DEFAULT NULL COMMENT '类型',
  `usermail` varchar(100) DEFAULT NULL COMMENT '会员E-mail',
  `userhomepage` varchar(200) DEFAULT NULL COMMENT '会员主页',
  `homepagename` varchar(200) DEFAULT NULL COMMENT '会员主页名称',
  `sex` varchar(10) DEFAULT NULL COMMENT '会员性别',
  `comefrom` varchar(100) DEFAULT NULL COMMENT '会员籍贯',
  `usersign` varchar(100) DEFAULT NULL COMMENT '会员格言',
  `redate` datetime DEFAULT NULL COMMENT '会员注册时间',
  PRIMARY KEY (`id`,`username`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=gbk;

/*Data for the table `bbs_user` */

insert  into `bbs_user`(`id`,`username`,`userpass`,`usertype`,`usermail`,`userhomepage`,`homepagename`,`sex`,`comefrom`,`usersign`,`redate`) values (1,'fss','1234','1','111111@163.com','www.baidu.com','baidu','男','山东',NULL,NULL),(2,'czj','1234','0','222222@163.com','www.sohu.com','souhu','男','河南',NULL,NULL),(3,'gyx','12345','0','333333@163.com','www.youku.com','youku','男','内蒙',NULL,NULL),(5,'bjl','12345','0','555555@163.com','www.qq.com','qq','男','吉林',NULL,NULL),(6,'user000','user000',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(17,'zhaoLiu','1234',NULL,'1111',NULL,NULL,NULL,NULL,NULL,NULL),(18,'zhaoQi','1111',NULL,'1111',NULL,NULL,NULL,NULL,NULL,NULL),(20,'dfdf','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL),(21,'wangLiu','111',NULL,'111',NULL,NULL,NULL,NULL,NULL,NULL),(22,'wangWu','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL),(26,'','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL);

/*Table structure for table `board` */

DROP TABLE IF EXISTS `board`;

CREATE TABLE `board` (
  `boardid` varchar(11) NOT NULL COMMENT '板块自动编号',
  `boardname` varchar(200) DEFAULT NULL COMMENT '板块名称',
  `boardtopics` int(11) DEFAULT NULL COMMENT '板块主题数',
  `boardmanager` varchar(100) DEFAULT NULL COMMENT '版主名',
  `boardintroduce` varchar(500) DEFAULT NULL COMMENT '板块介绍',
  PRIMARY KEY (`boardid`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

/*Data for the table `board` */

insert  into `board`(`boardid`,`boardname`,`boardtopics`,`boardmanager`,`boardintroduce`) values ('1','java1',NULL,'小马',''),('2','spring',NULL,'小马','springContent'),('3','Struts入门学习',NULL,'会长','Struts介绍');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
