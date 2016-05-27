/*
MySQL Data Transfer
Source Host: localhost
Source Database: police
Target Host: localhost
Target Database: police
Date: 2013-5-10 20:43:03
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for code
-- ----------------------------
CREATE TABLE `code` (
  `codeid` int(11) NOT NULL AUTO_INCREMENT,
  `nextcode` varchar(20) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`codeid`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for complaint
-- ----------------------------
CREATE TABLE `complaint` (
  `complaintid` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(11) NOT NULL,
  `sno` varchar(30) NOT NULL,
  `time` datetime NOT NULL,
  `departmentid` int(11) NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `sex` int(11) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `profession` varchar(30) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `mode` int(11) DEFAULT NULL,
  `idnumber` varchar(18) DEFAULT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `people` varchar(100) DEFAULT NULL,
  `question` varchar(2048) NOT NULL,
  `filename` varchar(300) DEFAULT NULL,
  `leadercomment` varchar(200) DEFAULT NULL,
  `investigateresult` varchar(300) DEFAULT NULL,
  `filename2` varchar(300) DEFAULT NULL,
  `yesno` int(11) DEFAULT '0',
  `visitopinion` int(11) DEFAULT '2',
  `time2` datetime DEFAULT NULL,
  `score` int(11) DEFAULT '0',
  `earlywarning` int(11) DEFAULT '0',
  `leaderapproved` int(11) DEFAULT '0',
  `remark` varchar(300) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  `entertime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `userid2` int(11) DEFAULT NULL,
  `edittime` datetime NOT NULL,
  `ip` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`complaintid`),
  UNIQUE KEY `sno` (`sno`),
  KEY `departmentid` (`departmentid`),
  KEY `userid` (`userid`),
  KEY `userid2` (`userid2`),
  CONSTRAINT `complaint_ibfk_1` FOREIGN KEY (`departmentid`) REFERENCES `department` (`departmentid`),
  CONSTRAINT `complaint_ibfk_2` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`),
  CONSTRAINT `complaint_ibfk_3` FOREIGN KEY (`userid2`) REFERENCES `user` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=124 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for complaintdepartment
-- ----------------------------
CREATE TABLE `complaintdepartment` (
  `complaintid` int(11) NOT NULL,
  `departmentid` int(11) NOT NULL,
  PRIMARY KEY (`complaintid`,`departmentid`),
  KEY `departmentid` (`departmentid`),
  CONSTRAINT `complaintdepartment_ibfk_1` FOREIGN KEY (`complaintid`) REFERENCES `complaint` (`complaintid`),
  CONSTRAINT `complaintdepartment_ibfk_2` FOREIGN KEY (`departmentid`) REFERENCES `department` (`departmentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for complainthandlesort
-- ----------------------------
CREATE TABLE `complainthandlesort` (
  `complaintid` int(11) NOT NULL,
  `handlesortid` int(11) NOT NULL,
  PRIMARY KEY (`complaintid`,`handlesortid`),
  KEY `handlesortid` (`handlesortid`),
  CONSTRAINT `complainthandlesort_ibfk_1` FOREIGN KEY (`complaintid`) REFERENCES `complaint` (`complaintid`),
  CONSTRAINT `complainthandlesort_ibfk_2` FOREIGN KEY (`handlesortid`) REFERENCES `handlesort` (`handlesortid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for complaintinspector
-- ----------------------------
CREATE TABLE `complaintinspector` (
  `complaintid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  PRIMARY KEY (`complaintid`,`userid`),
  KEY `userid` (`userid`),
  CONSTRAINT `complaintinspector_ibfk_1` FOREIGN KEY (`complaintid`) REFERENCES `complaint` (`complaintid`),
  CONSTRAINT `complaintinspector_ibfk_2` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for complaintquestionsort
-- ----------------------------
CREATE TABLE `complaintquestionsort` (
  `complaintid` int(11) NOT NULL,
  `questionsortid` int(11) NOT NULL,
  PRIMARY KEY (`complaintid`,`questionsortid`),
  KEY `questionsortid` (`questionsortid`),
  CONSTRAINT `complaintquestionsort_ibfk_1` FOREIGN KEY (`complaintid`) REFERENCES `complaint` (`complaintid`),
  CONSTRAINT `complaintquestionsort_ibfk_2` FOREIGN KEY (`questionsortid`) REFERENCES `questionsort` (`questionsortid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for department
-- ----------------------------
CREATE TABLE `department` (
  `type` int(11) DEFAULT '0',
  `departmentid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `address` varchar(100) DEFAULT NULL,
  `phone` varchar(40) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`departmentid`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for feedback
-- ----------------------------
CREATE TABLE `feedback` (
  `feedbackid` int(11) NOT NULL AUTO_INCREMENT,
  `departmentid` int(11) NOT NULL,
  `complaintid` int(11) NOT NULL,
  `userid` int(11) DEFAULT NULL,
  `message` varchar(1000) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`feedbackid`),
  KEY `complaintid` (`complaintid`),
  KEY `departmentid` (`departmentid`),
  KEY `userid` (`userid`),
  CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`complaintid`) REFERENCES `complaint` (`complaintid`),
  CONSTRAINT `feedback_ibfk_2` FOREIGN KEY (`departmentid`) REFERENCES `department` (`departmentid`),
  CONSTRAINT `feedback_ibfk_3` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for handlesort
-- ----------------------------
CREATE TABLE `handlesort` (
  `handlesortid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`handlesortid`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for module
-- ----------------------------
CREATE TABLE `module` (
  `moduleid` varchar(30) NOT NULL,
  `name` varchar(50) NOT NULL,
  `icon` varchar(100) DEFAULT NULL,
  `link` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`moduleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for questionsort
-- ----------------------------
CREATE TABLE `questionsort` (
  `questionsortid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`questionsortid`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for role
-- ----------------------------
CREATE TABLE `role` (
  `roleid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`roleid`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for rolemodule
-- ----------------------------
CREATE TABLE `rolemodule` (
  `roleid` int(11) NOT NULL,
  `moduleid` varchar(30) NOT NULL,
  PRIMARY KEY (`roleid`,`moduleid`),
  KEY `RoleModule_fk2` (`moduleid`),
  CONSTRAINT `RoleModule_fk` FOREIGN KEY (`roleid`) REFERENCES `role` (`roleid`),
  CONSTRAINT `RoleModule_fk2` FOREIGN KEY (`moduleid`) REFERENCES `module` (`moduleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for scoreserial
-- ----------------------------
CREATE TABLE `scoreserial` (
  `serialid` int(11) NOT NULL AUTO_INCREMENT,
  `score` int(11) NOT NULL,
  PRIMARY KEY (`serialid`),
  UNIQUE KEY `score` (`score`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for user
-- ----------------------------
CREATE TABLE `user` (
  `departmentid` int(11) NOT NULL,
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `pwd` varchar(20) DEFAULT '123456',
  `sno` varchar(10) DEFAULT NULL,
  `entrytime` datetime DEFAULT NULL,
  `job` varchar(20) DEFAULT NULL,
  `realname` varchar(20) NOT NULL,
  `sex` int(11) DEFAULT '0',
  `birthday` date DEFAULT NULL,
  `idnumber` varchar(18) DEFAULT NULL,
  `photo` varchar(100) DEFAULT NULL,
  `mobile` varchar(30) DEFAULT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `qq` varchar(20) DEFAULT NULL,
  `state` int(11) DEFAULT '1',
  `indate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `latest_login_time` datetime DEFAULT NULL,
  `login_times` int(11) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`userid`),
  KEY `departmentid` (`departmentid`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`departmentid`) REFERENCES `department` (`departmentid`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for userrole
-- ----------------------------
CREATE TABLE `userrole` (
  `userid` int(11) NOT NULL,
  `roleid` int(11) NOT NULL,
  PRIMARY KEY (`userid`,`roleid`),
  KEY `roleid` (`roleid`),
  CONSTRAINT `userrole_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`),
  CONSTRAINT `userrole_ibfk_2` FOREIGN KEY (`roleid`) REFERENCES `role` (`roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `code` VALUES ('1', 'TS0896', '(举报)投诉');
INSERT INTO `code` VALUES ('2', 'XC0131', '现场(督察)');
INSERT INTO `code` VALUES ('3', 'WD0044', '网上督察');
INSERT INTO `code` VALUES ('4', 'WY0043', '网络舆情');
INSERT INTO `code` VALUES ('5', 'TS0001', null);
INSERT INTO `code` VALUES ('6', 'TS0001', null);
INSERT INTO `code` VALUES ('7', 'TS0001', null);
INSERT INTO `code` VALUES ('8', 'TS0001', null);
INSERT INTO `code` VALUES ('9', 'TS0001', null);
INSERT INTO `complaint` VALUES ('1', '0', 'TS0399', '2013-04-02 00:00:00', '6', 'zdx ', '1', '12', '23', '23', '1', '122', '123', '123fdg ', '12213', '123', '121', '1231', '123w12', '1', '1', '2013-04-24 00:00:00', '2', '1', '1', 'qewdfhg ', '1', '2013-04-21 00:07:09', '1', '2013-04-21 00:07:09', '0:0:0:0:0:0:0:1');
INSERT INTO `complaint` VALUES ('2', '1', 'XC0128', '2013-04-03 00:00:00', '6', null, '0', '0', null, null, null, null, null, 'segv  ', 'dsrfsdfb ', 'se', 'dfv', 'sdfv', 'sdfv', '1', '0', '2013-04-01 00:00:00', '10', '1', '1', 'sdfv fdfsdffds', '1', '2013-04-21 00:04:06', '1', '2013-04-21 00:04:06', '127.1.1.1');
INSERT INTO `complaint` VALUES ('3', '2', 'WD0085', '2013-04-02 00:00:00', '6', null, '0', '0', null, null, '0', null, null, 'ds', 'dfvd ', 'dsf ', 'dxfbfdb', 'dfgbfb', 'dfgnb', '1', '0', '2013-04-16 00:00:00', '10', '1', '1', 'dfhbfgn', '1', '2013-04-20 17:54:18', '1', '2013-04-20 17:54:18', '0:0:0:0:0:0:0:1');
INSERT INTO `complaint` VALUES ('4', '3', 'WY0018', '2013-04-16 00:00:00', '6', '123', '1', '12', null, '1234', null, null, '123234', '14324', '12432432', '23432', '12432432', '1243234', '23432', '1', '1', '2013-04-23 00:00:00', '80', '1', '1', '2342', '1', '2013-04-20 17:55:43', '1', '2013-04-20 17:55:43', '0:0:0:0:0:0:0:1');
INSERT INTO `complaint` VALUES ('5', '1', 'TS0427', '2013-03-31 00:00:00', '6', '123', '1', '112', '123', '231', '0', '1231', '123', '', '', '', '', '', '', '0', '2', '2013-04-03 19:59:39', '3', '0', '1', '', '1', '2013-04-20 23:45:56', '1', '2013-04-20 23:45:56', '127.1.1.1');
INSERT INTO `complaint` VALUES ('26', '0', 'TS0414', '2013-04-09 00:00:00', '3', '', '1', '0', '', '', '0', '', '', '', '', '', '', '', '', '0', '2', '2013-04-25 19:59:43', '1', '0', '1', '', null, '2013-04-20 20:11:19', '1', '2013-04-20 20:11:19', '127.0.0.1');
INSERT INTO `complaint` VALUES ('27', '0', 'TS0416', '2013-04-01 00:00:00', '3', '', '1', '0', '', '', '0', '', '', '', '', '', '', '', '', '0', '2', '2013-04-24 21:23:16', '1', '0', '1', '', null, '2013-04-20 20:11:45', '1', '2013-04-20 20:11:45', '127.0.0.1');
INSERT INTO `complaint` VALUES ('39', '0', 'TS0492', '2013-04-01 00:00:00', '2', '', '1', '0', '', '', '0', '', '', '', '', '', '', '', '', '0', '2', null, '1', '1', '1', '', '1', '2013-04-21 01:00:14', '1', '2013-04-21 01:00:14', '127.0.0.1');
INSERT INTO `complaint` VALUES ('40', '0', 'TS0493', '2013-04-01 00:00:00', '2', '', '1', '0', '', '', '0', '', '', '', '', '', '', '', '', '0', '2', null, '1', '1', '1', '', '1', '2013-04-21 01:00:24', '1', '2013-04-21 01:00:24', '127.0.0.1');
INSERT INTO `complaint` VALUES ('41', '0', 'TS0494', '2013-04-01 00:00:00', '2', '', '1', '0', '', '', '0', '', '', '', '', '', '', '', '', '0', '2', null, '1', '1', '1', '', '1', '2013-04-21 01:00:30', '1', '2013-04-21 01:00:30', '127.0.0.1');
INSERT INTO `complaint` VALUES ('42', '0', 'TS0495', '2013-04-01 00:00:00', '2', '', '1', '0', '', '', '0', '', '', '', '', '', '', '', '', '0', '2', null, '1', '1', '1', '', '1', '2013-04-21 01:02:01', '1', '2013-04-21 01:02:01', '127.0.0.1');
INSERT INTO `complaint` VALUES ('43', '1', 'TS0496', '2013-04-01 00:00:00', '2', '', '1', '0', '', '', '0', '', '', '', '', '', '', '', '', '0', '2', null, '1', '1', '1', '', '1', '2013-04-21 01:01:54', '1', '2013-04-21 01:01:54', '127.0.0.1');
INSERT INTO `complaint` VALUES ('44', '2', 'TS0497', '2013-04-01 00:00:00', '2', '', '1', '0', '', '', '0', '', '', '', '', '', '', '', '', '0', '2', null, '1', '1', '1', '', '1', '2013-04-21 01:01:47', '1', '2013-04-21 01:01:47', '127.0.0.1');
INSERT INTO `complaint` VALUES ('46', '0', 'TS0570', '2013-04-01 00:00:00', '2', '凯', '1', '23', '', '', '0', '', '', '', '', '', '', '', '', '0', '2', '2013-04-01 00:00:00', '2', '1', '1', '', '3', '2013-04-24 20:20:11', '3', '2013-04-24 20:20:11', '127.0.0.1');
INSERT INTO `complaint` VALUES ('47', '1', 'XC0017', '2013-04-01 00:00:00', '2', null, '0', '0', null, null, null, null, null, '', '', '', '', '', '', '0', '0', '2013-04-09 00:00:00', '2', '1', '1', '', '3', '2013-04-24 20:20:57', '3', '2013-04-24 20:20:57', '127.0.0.1');
INSERT INTO `complaint` VALUES ('48', '2', 'WD0008', '2013-04-01 00:00:00', '2', null, '0', '0', null, null, '0', null, null, '', '', '', '', '', '', '0', '0', null, '20', '1', '1', '', '3', '2013-04-24 20:21:25', '3', '2013-04-24 20:21:25', '127.0.0.1');
INSERT INTO `complaint` VALUES ('50', '0', 'TS0581', '2013-04-26 00:00:00', '3', '小瑞', '1', '0', '', '', '0', '', '', '', '', '', '', '', '', '0', '2', null, '1', '0', '1', '', '3', '2013-04-26 15:45:55', '3', '2013-04-26 15:45:55', '127.0.0.1');
INSERT INTO `complaint` VALUES ('65', '0', 'TS0597', '2013-04-28 00:00:00', '3', '', '1', '0', '', null, '0', '', '', '', '', '', '', '', '', '1', '2', null, '1', '1', '2', '', '3', '2013-04-30 10:54:53', '3', '2013-04-30 10:54:53', '127.0.0.1');
INSERT INTO `complaint` VALUES ('97', '0', 'TS0701', '2013-05-03 00:00:00', '3', '', '1', '0', '', '', '0', '', '', '', '', '', '', '', '', '1', '2', null, '0', '1', '11', '', '1', '2013-05-03 14:10:33', '1', '2013-05-03 14:10:33', '127.0.0.1');
INSERT INTO `complaint` VALUES ('98', '0', 'TS0702', '2013-05-03 00:00:00', '3', '', '1', '0', '', '', '0', '', '', '', '', '', '', '', '', '1', '2', null, '0', '1', '11', '', '1', '2013-05-03 14:12:18', '1', '2013-05-03 14:12:18', '127.0.0.1');
INSERT INTO `complaint` VALUES ('99', '0', 'TS0703', '2013-05-03 00:00:00', '4', '', '1', '0', '', '', '0', '', '', '', '', '', '', '', '', '1', '2', null, '0', '1', '11', '', '1', '2013-05-03 14:12:48', '1', '2013-05-03 14:12:48', '127.0.0.1');
INSERT INTO `complaint` VALUES ('100', '0', 'TS0706', '2013-05-03 00:00:00', '3', '', '1', '0', '', '', '0', '', '', '', '', '', '', '', '', '1', '2', null, '0', '1', '11', '', '1', '2013-05-03 14:14:50', '1', '2013-05-03 14:14:50', '127.0.0.1');
INSERT INTO `complaint` VALUES ('101', '0', 'TS0707', '2013-05-03 00:00:00', '3', '', '1', '0', '', '', '0', '', '', '', '', '', '', '', '', '1', '2', null, '0', '1', '11', '', '1', '2013-05-03 14:15:15', '1', '2013-05-03 14:15:15', '127.0.0.1');
INSERT INTO `complaint` VALUES ('103', '0', 'TS0709', '2013-05-03 00:00:00', '4', '', '1', '0', '', '', '0', '', '', '', '', '', '', '', '', '1', '2', null, '0', '1', '11', '', '1', '2013-05-03 14:16:47', '1', '2013-05-03 14:16:47', '127.0.0.1');
INSERT INTO `complaint` VALUES ('104', '0', 'TS0710', '2013-05-03 00:00:00', '3', '', '1', '0', '', '', '0', '', '', '', '', '', '', '', '', '1', '2', null, '0', '1', '1', '', '1', '2013-05-03 14:17:09', '1', '2013-05-03 14:17:09', '127.0.0.1');
INSERT INTO `complaint` VALUES ('107', '0', 'TS0714', '2013-05-03 00:00:00', '2', '', '1', '0', '', '', '0', '', '', '', '', '', '', '', '', '1', '2', null, '0', '1', '2', '', '1', '2013-05-03 14:20:50', '1', '2013-05-03 14:20:50', '127.0.0.1');
INSERT INTO `complaint` VALUES ('108', '0', 'TS0715', '2013-05-03 00:00:00', '2', '', '1', '0', '', '', '0', '', '', '', '', '', '', '', '', '1', '2', null, '0', '1', '1', '', '1', '2013-05-03 14:22:41', '1', '2013-05-03 14:22:41', '127.0.0.1');
INSERT INTO `complaint` VALUES ('109', '1', 'XC0099', '2013-05-04 00:00:00', '3', null, '0', '0', null, null, null, null, null, '', '', '', null, '', null, '1', '0', null, '0', '1', '1', '', '3', '2013-05-04 22:55:30', '3', '2013-05-04 22:55:30', '127.0.0.1');
INSERT INTO `complaint` VALUES ('112', '0', 'TS0737', '2013-05-04 00:00:00', '3', '', '1', '0', '', '', '0', '', '', '', '', '', '', '', '', '1', '2', null, '0', '1', '11', '', '3', '2013-05-04 23:03:04', '3', '2013-05-04 23:03:04', '127.0.0.1');
INSERT INTO `complaint` VALUES ('114', '2', 'WD0028', '2013-05-04 00:00:00', '4', null, '0', '0', null, null, '0', null, null, '', '', '', '', '', '', '1', '0', null, '2', '1', '11', '', '3', '2013-05-04 23:04:17', '3', '2013-05-04 23:04:17', '127.0.0.1');
INSERT INTO `complaint` VALUES ('116', '2', 'WD0030', '2013-05-04 00:00:00', '4', null, '0', '0', null, null, '0', null, null, '', '', '', '', '', '', '1', '0', null, '0', '1', '11', '', '3', '2013-05-04 23:16:18', '3', '2013-05-04 23:16:18', '127.0.0.1');
INSERT INTO `complaint` VALUES ('117', '3', 'WY0035', '2013-05-05 00:00:00', '4', '', '1', '0', null, '', null, null, '', '', '', '', '', '', '', '1', '2', null, '0', '1', '1', '', '3', '2013-05-05 13:34:43', '3', '2013-05-05 13:34:43', '127.1.1.1');
INSERT INTO `complaint` VALUES ('118', '3', 'WY0037', '2013-05-05 00:00:00', '4', '', '1', '0', null, '', null, null, '', '', '', '', '', '', '', '1', '2', null, '0', '1', '1', '', '3', '2013-05-05 13:35:18', '3', '2013-05-05 13:35:18', '127.1.1.1');
INSERT INTO `complaint` VALUES ('119', '3', 'WY0038', '2013-05-05 00:00:00', '4', '', '1', '0', null, '', null, null, '', '', '', '', '', '', '', '1', '2', null, '0', '1', '2', '', '3', '2013-05-05 13:35:33', '3', '2013-05-05 13:35:33', '127.1.1.1');
INSERT INTO `complaint` VALUES ('120', '1', 'XC0114', '2013-05-05 00:00:00', '3', null, '0', '0', null, null, null, null, null, '', '', '', '', '', null, '1', '0', null, '0', '1', '11', '', '1', '2013-05-05 18:23:45', '1', '2013-05-05 18:23:45', '127.0.0.1');
INSERT INTO `complaint` VALUES ('121', '0', 'TS0887', '2013-05-06 00:00:00', '3', 'aaaa', '1', '12', '1212', '12121212', '0', '131127199107017010', '18232026261', 'aaaa', 'aaaa', '', 'aaaa', 'aaaa', 'aa', '2', '0', '2013-05-14 00:00:00', '2', '2', '2', 'aa', '1', '2013-05-06 21:49:34', '1', '2013-05-06 21:49:34', 'aaaa');
INSERT INTO `complaint` VALUES ('122', '1', 'XC0125', '2013-05-06 00:00:00', '3', null, '0', '0', null, null, null, null, null, 'aa', 'aaa', 'aaa', 'aa', 'aa', null, '2', '0', '2013-05-13 00:00:00', '20', '1', '2', 'aaa', '1', '2013-05-06 22:12:07', '1', '2013-05-06 22:12:07', '127.0.0.1');
INSERT INTO `complaint` VALUES ('123', '3', 'WY0040', '2013-05-06 00:00:00', '2', '1212', '1', '12', null, '1212', null, null, '13112743655', '121', '2121', '121', '121', '1212', '1212', '1', '0', '2013-05-28 00:00:00', '6', '1', '11', 'aaaaa', '1', '2013-05-06 22:27:15', '1', '2013-05-06 22:27:15', '1212');
INSERT INTO `complaintdepartment` VALUES ('1', '6');
INSERT INTO `complaintdepartment` VALUES ('2', '6');
INSERT INTO `complaintdepartment` VALUES ('65', '6');
INSERT INTO `complaintdepartment` VALUES ('107', '6');
INSERT INTO `complaintdepartment` VALUES ('4', '7');
INSERT INTO `complaintdepartment` VALUES ('109', '7');
INSERT INTO `complaintdepartment` VALUES ('114', '7');
INSERT INTO `complaintdepartment` VALUES ('122', '7');
INSERT INTO `complaintdepartment` VALUES ('1', '8');
INSERT INTO `complaintdepartment` VALUES ('2', '8');
INSERT INTO `complaintdepartment` VALUES ('3', '8');
INSERT INTO `complaintdepartment` VALUES ('4', '8');
INSERT INTO `complaintdepartment` VALUES ('100', '8');
INSERT INTO `complaintdepartment` VALUES ('121', '8');
INSERT INTO `complaintdepartment` VALUES ('2', '9');
INSERT INTO `complaintdepartment` VALUES ('3', '9');
INSERT INTO `complaintdepartment` VALUES ('4', '9');
INSERT INTO `complaintdepartment` VALUES ('103', '9');
INSERT INTO `complaintdepartment` VALUES ('104', '9');
INSERT INTO `complaintdepartment` VALUES ('2', '10');
INSERT INTO `complaintdepartment` VALUES ('65', '11');
INSERT INTO `complaintdepartment` VALUES ('107', '11');
INSERT INTO `complaintdepartment` VALUES ('117', '11');
INSERT INTO `complaintdepartment` VALUES ('109', '12');
INSERT INTO `complaintdepartment` VALUES ('114', '12');
INSERT INTO `complaintdepartment` VALUES ('122', '12');
INSERT INTO `complaintdepartment` VALUES ('47', '13');
INSERT INTO `complaintdepartment` VALUES ('100', '13');
INSERT INTO `complaintdepartment` VALUES ('121', '13');
INSERT INTO `complaintdepartment` VALUES ('103', '14');
INSERT INTO `complaintdepartment` VALUES ('104', '14');
INSERT INTO `complaintdepartment` VALUES ('112', '14');
INSERT INTO `complaintdepartment` VALUES ('2', '15');
INSERT INTO `complaintdepartment` VALUES ('117', '16');
INSERT INTO `complaintdepartment` VALUES ('50', '17');
INSERT INTO `complaintdepartment` VALUES ('98', '17');
INSERT INTO `complaintdepartment` VALUES ('46', '18');
INSERT INTO `complaintdepartment` VALUES ('47', '18');
INSERT INTO `complaintdepartment` VALUES ('100', '18');
INSERT INTO `complaintdepartment` VALUES ('121', '18');
INSERT INTO `complaintdepartment` VALUES ('39', '19');
INSERT INTO `complaintdepartment` VALUES ('40', '19');
INSERT INTO `complaintdepartment` VALUES ('41', '19');
INSERT INTO `complaintdepartment` VALUES ('42', '19');
INSERT INTO `complaintdepartment` VALUES ('43', '19');
INSERT INTO `complaintdepartment` VALUES ('44', '19');
INSERT INTO `complaintdepartment` VALUES ('103', '19');
INSERT INTO `complaintdepartment` VALUES ('112', '19');
INSERT INTO `complaintdepartment` VALUES ('2', '20');
INSERT INTO `complaintdepartment` VALUES ('26', '21');
INSERT INTO `complaintdepartment` VALUES ('108', '21');
INSERT INTO `complaintdepartment` VALUES ('117', '21');
INSERT INTO `complaintdepartment` VALUES ('50', '22');
INSERT INTO `complaintdepartment` VALUES ('98', '22');
INSERT INTO `complaintdepartment` VALUES ('108', '22');
INSERT INTO `complaintdepartment` VALUES ('101', '23');
INSERT INTO `complaintdepartment` VALUES ('101', '24');
INSERT INTO `complaintdepartment` VALUES ('2', '25');
INSERT INTO `complaintdepartment` VALUES ('26', '26');
INSERT INTO `complaintdepartment` VALUES ('108', '26');
INSERT INTO `complaintdepartment` VALUES ('117', '26');
INSERT INTO `complaintdepartment` VALUES ('48', '27');
INSERT INTO `complaintdepartment` VALUES ('108', '27');
INSERT INTO `complaintdepartment` VALUES ('101', '28');
INSERT INTO `complaintdepartment` VALUES ('48', '32');
INSERT INTO `complainthandlesort` VALUES ('1', '2');
INSERT INTO `complainthandlesort` VALUES ('1', '3');
INSERT INTO `complainthandlesort` VALUES ('2', '3');
INSERT INTO `complainthandlesort` VALUES ('46', '3');
INSERT INTO `complainthandlesort` VALUES ('112', '3');
INSERT INTO `complainthandlesort` VALUES ('121', '3');
INSERT INTO `complainthandlesort` VALUES ('2', '4');
INSERT INTO `complainthandlesort` VALUES ('48', '6');
INSERT INTO `complainthandlesort` VALUES ('26', '8');
INSERT INTO `complainthandlesort` VALUES ('27', '8');
INSERT INTO `complainthandlesort` VALUES ('47', '8');
INSERT INTO `complainthandlesort` VALUES ('112', '8');
INSERT INTO `complainthandlesort` VALUES ('121', '8');
INSERT INTO `complainthandlesort` VALUES ('3', '12');
INSERT INTO `complainthandlesort` VALUES ('4', '12');
INSERT INTO `complainthandlesort` VALUES ('122', '12');
INSERT INTO `complainthandlesort` VALUES ('3', '13');
INSERT INTO `complainthandlesort` VALUES ('4', '13');
INSERT INTO `complainthandlesort` VALUES ('26', '13');
INSERT INTO `complainthandlesort` VALUES ('27', '13');
INSERT INTO `complainthandlesort` VALUES ('47', '13');
INSERT INTO `complainthandlesort` VALUES ('112', '13');
INSERT INTO `complainthandlesort` VALUES ('121', '13');
INSERT INTO `complainthandlesort` VALUES ('3', '14');
INSERT INTO `complainthandlesort` VALUES ('4', '14');
INSERT INTO `complainthandlesort` VALUES ('48', '15');
INSERT INTO `complaintinspector` VALUES ('1', '2');
INSERT INTO `complaintinspector` VALUES ('4', '2');
INSERT INTO `complaintinspector` VALUES ('5', '2');
INSERT INTO `complaintinspector` VALUES ('46', '2');
INSERT INTO `complaintinspector` VALUES ('48', '2');
INSERT INTO `complaintinspector` VALUES ('107', '2');
INSERT INTO `complaintinspector` VALUES ('123', '2');
INSERT INTO `complaintinspector` VALUES ('2', '3');
INSERT INTO `complaintinspector` VALUES ('3', '3');
INSERT INTO `complaintinspector` VALUES ('39', '3');
INSERT INTO `complaintinspector` VALUES ('40', '3');
INSERT INTO `complaintinspector` VALUES ('41', '3');
INSERT INTO `complaintinspector` VALUES ('42', '3');
INSERT INTO `complaintinspector` VALUES ('43', '3');
INSERT INTO `complaintinspector` VALUES ('44', '3');
INSERT INTO `complaintinspector` VALUES ('47', '3');
INSERT INTO `complaintinspector` VALUES ('108', '3');
INSERT INTO `complaintinspector` VALUES ('2', '4');
INSERT INTO `complaintinspector` VALUES ('47', '4');
INSERT INTO `complaintinspector` VALUES ('112', '5');
INSERT INTO `complaintinspector` VALUES ('26', '6');
INSERT INTO `complaintinspector` VALUES ('50', '6');
INSERT INTO `complaintinspector` VALUES ('65', '6');
INSERT INTO `complaintinspector` VALUES ('97', '6');
INSERT INTO `complaintinspector` VALUES ('98', '6');
INSERT INTO `complaintinspector` VALUES ('101', '6');
INSERT INTO `complaintinspector` VALUES ('104', '6');
INSERT INTO `complaintinspector` VALUES ('121', '6');
INSERT INTO `complaintinspector` VALUES ('122', '6');
INSERT INTO `complaintinspector` VALUES ('27', '7');
INSERT INTO `complaintinspector` VALUES ('100', '7');
INSERT INTO `complaintinspector` VALUES ('109', '7');
INSERT INTO `complaintinspector` VALUES ('120', '7');
INSERT INTO `complaintinspector` VALUES ('117', '8');
INSERT INTO `complaintinspector` VALUES ('99', '9');
INSERT INTO `complaintinspector` VALUES ('116', '9');
INSERT INTO `complaintinspector` VALUES ('103', '10');
INSERT INTO `complaintinspector` VALUES ('118', '10');
INSERT INTO `complaintinspector` VALUES ('119', '10');
INSERT INTO `complaintinspector` VALUES ('114', '11');
INSERT INTO `complaintquestionsort` VALUES ('2', '1');
INSERT INTO `complaintquestionsort` VALUES ('1', '2');
INSERT INTO `complaintquestionsort` VALUES ('2', '2');
INSERT INTO `complaintquestionsort` VALUES ('26', '2');
INSERT INTO `complaintquestionsort` VALUES ('27', '2');
INSERT INTO `complaintquestionsort` VALUES ('47', '2');
INSERT INTO `complaintquestionsort` VALUES ('112', '2');
INSERT INTO `complaintquestionsort` VALUES ('114', '2');
INSERT INTO `complaintquestionsort` VALUES ('122', '2');
INSERT INTO `complaintquestionsort` VALUES ('1', '3');
INSERT INTO `complaintquestionsort` VALUES ('2', '3');
INSERT INTO `complaintquestionsort` VALUES ('3', '3');
INSERT INTO `complaintquestionsort` VALUES ('5', '3');
INSERT INTO `complaintquestionsort` VALUES ('26', '3');
INSERT INTO `complaintquestionsort` VALUES ('27', '3');
INSERT INTO `complaintquestionsort` VALUES ('46', '3');
INSERT INTO `complaintquestionsort` VALUES ('47', '3');
INSERT INTO `complaintquestionsort` VALUES ('114', '3');
INSERT INTO `complaintquestionsort` VALUES ('117', '3');
INSERT INTO `complaintquestionsort` VALUES ('122', '3');
INSERT INTO `complaintquestionsort` VALUES ('2', '4');
INSERT INTO `complaintquestionsort` VALUES ('3', '4');
INSERT INTO `complaintquestionsort` VALUES ('4', '4');
INSERT INTO `complaintquestionsort` VALUES ('5', '4');
INSERT INTO `complaintquestionsort` VALUES ('48', '4');
INSERT INTO `complaintquestionsort` VALUES ('117', '4');
INSERT INTO `complaintquestionsort` VALUES ('121', '4');
INSERT INTO `complaintquestionsort` VALUES ('2', '5');
INSERT INTO `complaintquestionsort` VALUES ('4', '5');
INSERT INTO `complaintquestionsort` VALUES ('48', '5');
INSERT INTO `complaintquestionsort` VALUES ('121', '5');
INSERT INTO `complaintquestionsort` VALUES ('2', '6');
INSERT INTO `department` VALUES ('-1', '1', '默认单位', null, null, '0');
INSERT INTO `department` VALUES ('0', '2', '警务督察处', null, null, '0');
INSERT INTO `department` VALUES ('0', '3', '现场督察中队', null, null, '0');
INSERT INTO `department` VALUES ('0', '4', '网上督察中队', null, null, '0');
INSERT INTO `department` VALUES ('0', '5', '综合指导中队', null, null, '0');
INSERT INTO `department` VALUES ('1', '6', '一大队', null, null, '4');
INSERT INTO `department` VALUES ('1', '7', '二大队', null, null, '2');
INSERT INTO `department` VALUES ('1', '8', '三大队', null, null, '1');
INSERT INTO `department` VALUES ('1', '9', '四大队', null, null, '2');
INSERT INTO `department` VALUES ('1', '10', '五大队', null, null, '0');
INSERT INTO `department` VALUES ('1', '11', '六大队', null, null, '0');
INSERT INTO `department` VALUES ('1', '12', '防空大队', null, null, '0');
INSERT INTO `department` VALUES ('1', '13', '机动大队', null, null, '0');
INSERT INTO `department` VALUES ('1', '14', '邯郸县大队', null, null, '0');
INSERT INTO `department` VALUES ('1', '15', '峰峰大队', null, null, '0');
INSERT INTO `department` VALUES ('1', '16', '大名大队', null, null, '0');
INSERT INTO `department` VALUES ('1', '17', '成安大队', null, null, '0');
INSERT INTO `department` VALUES ('1', '18', '魏县大队', null, null, '0');
INSERT INTO `department` VALUES ('1', '19', '曲周大队', null, null, '0');
INSERT INTO `department` VALUES ('1', '20', '馆陶大队', null, null, '0');
INSERT INTO `department` VALUES ('1', '21', '肥乡大队', null, null, '0');
INSERT INTO `department` VALUES ('1', '22', '临漳大队', null, null, '0');
INSERT INTO `department` VALUES ('1', '23', '邱县大队', null, null, '0');
INSERT INTO `department` VALUES ('1', '24', '广平大队', null, null, '0');
INSERT INTO `department` VALUES ('1', '25', '涉县大队', null, null, '0');
INSERT INTO `department` VALUES ('1', '26', '武安大队', null, null, '0');
INSERT INTO `department` VALUES ('1', '27', '磁县大队', null, null, '0');
INSERT INTO `department` VALUES ('1', '28', '永年大队', null, null, '0');
INSERT INTO `department` VALUES ('1', '29', '鸡泽大队', null, null, '0');
INSERT INTO `department` VALUES ('2', '30', '车管所', null, null, '2');
INSERT INTO `department` VALUES ('2', '31', '事故处', null, null, '1');
INSERT INTO `department` VALUES ('2', '32', '人检中心', null, null, '0');
INSERT INTO `department` VALUES ('2', '33', '考试中心', null, null, '2');
INSERT INTO `department` VALUES ('2', '34', '交通秩序处', null, null, '0');
INSERT INTO `department` VALUES ('2', '35', '公路巡警处', null, null, '0');
INSERT INTO `department` VALUES ('2', '36', '法制科', null, null, '0');
INSERT INTO `department` VALUES ('2', '37', '特勤大队', null, null, '3');
INSERT INTO `department` VALUES ('2', '38', '指挥中心', null, null, '1');
INSERT INTO `department` VALUES ('2', '39', '信息通信中心', null, null, '0');
INSERT INTO `department` VALUES ('2', '40', '办公室', null, null, '3');
INSERT INTO `department` VALUES ('2', '41', '政治处', null, null, '0');
INSERT INTO `department` VALUES ('2', '42', '行政科', null, null, '4');
INSERT INTO `department` VALUES ('2', '43', '纪委', null, null, '0');
INSERT INTO `department` VALUES ('2', '44', '财务科', null, null, '0');
INSERT INTO `department` VALUES ('2', '45', '审计科', null, null, '0');
INSERT INTO `department` VALUES ('2', '46', '交通设施科', null, null, '0');
INSERT INTO `department` VALUES ('2', '47', '宣传科', null, null, '0');
INSERT INTO `department` VALUES ('2', '48', '科研中心', null, null, '0');
INSERT INTO `department` VALUES ('2', '49', '服务中心', null, null, '0');
INSERT INTO `department` VALUES ('2', '50', '宣教中心', null, null, '0');
INSERT INTO `handlesort` VALUES ('1', '书面检查', null);
INSERT INTO `handlesort` VALUES ('2', '通报批评', null);
INSERT INTO `handlesort` VALUES ('3', '参加培训班', null);
INSERT INTO `handlesort` VALUES ('4', '罚款', null);
INSERT INTO `handlesort` VALUES ('5', '禁闭', null);
INSERT INTO `handlesort` VALUES ('6', '停止执行职务', null);
INSERT INTO `handlesort` VALUES ('7', '调离工作岗位', null);
INSERT INTO `handlesort` VALUES ('8', '调离执法岗位', null);
INSERT INTO `handlesort` VALUES ('9', '诫勉谈话', null);
INSERT INTO `handlesort` VALUES ('10', '警告', null);
INSERT INTO `handlesort` VALUES ('11', '记过', null);
INSERT INTO `handlesort` VALUES ('12', '记大过', null);
INSERT INTO `handlesort` VALUES ('13', '辞退', null);
INSERT INTO `handlesort` VALUES ('14', '开除', null);
INSERT INTO `handlesort` VALUES ('15', '其他', null);
INSERT INTO `module` VALUES ('100', '基本信息', '', '');
INSERT INTO `module` VALUES ('100001', '人员资料', '', 'manage/system/user!personal.action ');
INSERT INTO `module` VALUES ('100002', '更改登录密码', '', 'manage/system/updatepwd.jsp');
INSERT INTO `module` VALUES ('110', '举报投诉', '', '');
INSERT INTO `module` VALUES ('110001', '添加', '', 'manage/complaint/complaint!inAdd.action');
INSERT INTO `module` VALUES ('110002', '修改/删除', '', 'manage/complaint/complaint!list.action');
INSERT INTO `module` VALUES ('120', '现场督察', '', 'manage/complaint/fieldInspect!inAdd.action');
INSERT INTO `module` VALUES ('120001', '添加', '', 'manage/complaint/fieldInspect!inAdd.action');
INSERT INTO `module` VALUES ('120002', '修改/删除', '', 'manage/complaint/fieldInspect!list.action');
INSERT INTO `module` VALUES ('130', '网上督察', '', '');
INSERT INTO `module` VALUES ('130001', '添加', '', 'manage/complaint/webInspect!inAdd.action');
INSERT INTO `module` VALUES ('130002', '修改/删除', '', 'manage/complaint/webInspect!list.action');
INSERT INTO `module` VALUES ('140', '网络舆情', '', '');
INSERT INTO `module` VALUES ('140001', '添加', '', 'manage/complaint/popularFeelings!inAdd.action');
INSERT INTO `module` VALUES ('140002', '修改/删除', '', 'manage/complaint/popularFeelings!list.action');
INSERT INTO `module` VALUES ('150', '批示审核', '', '');
INSERT INTO `module` VALUES ('150001', '批示', '', '');
INSERT INTO `module` VALUES ('150002', '审核', '', 'manage/complaint/audit!auditList.action');
INSERT INTO `module` VALUES ('170', '统计表', '', '');
INSERT INTO `module` VALUES ('170001', '受理举报投诉统计表', '', '/manage/complaint/statistics!statisticsList.action?type=0');
INSERT INTO `module` VALUES ('170002', '现场督察统计表', '', '/manage/complaint/statistics!statisticsList.action?type=1');
INSERT INTO `module` VALUES ('170003', '网上督察统计表', '', '/manage/complaint/statistics!statisticsList.action?type=2');
INSERT INTO `module` VALUES ('170004', '网络舆情调查统计表', '', '/manage/complaint/statistics!statisticsList.action?type=3');
INSERT INTO `module` VALUES ('170005', '千分制考核扣分明细表', '', 'manage/department/department!qianfen.action');
INSERT INTO `module` VALUES ('170006', '大队排名统计表', '', 'manage/department/department!paimingdadui.action');
INSERT INTO `module` VALUES ('170008', '科室排名统计表', null, 'manage/department/department!paimingkeshi.action');
INSERT INTO `module` VALUES ('170009', '总查询', null, 'manage/complaint/complaint!allList.action');
INSERT INTO `module` VALUES ('180', '统计柱状图', '', '');
INSERT INTO `module` VALUES ('180001', '预警信息问题类别柱状统计图', '', 'jfreechart/questionSort!list.action');
INSERT INTO `module` VALUES ('180002', '预警信息问题来源柱状统计图', '', 'jfreechart/complaint1!listByEarlyWarining.action');
INSERT INTO `module` VALUES ('180003', '各单位预警信息柱状统计图', '', 'jfreechart/department!list.action');
INSERT INTO `module` VALUES ('180004', '按月:总数+查实数', '', '');
INSERT INTO `module` VALUES ('190', '系统管理', '', '');
INSERT INTO `module` VALUES ('190001', '用户', '', 'manage/system/user!list3.action');
INSERT INTO `module` VALUES ('190004', '权限', '', 'manage/system/role!roleModule.action');
INSERT INTO `module` VALUES ('190005', '数据库备份', '', 'manage/system/mysqlbackup.jsp');
INSERT INTO `module` VALUES ('190006', '数据库还原', '', 'manage/system/mysqlload.jsp');
INSERT INTO `module` VALUES ('190009', '千分制扣分', '', '');
INSERT INTO `module` VALUES ('190010', '模块', null, 'manage/system/module!list.action');
INSERT INTO `module` VALUES ('190011', '单位管理', null, 'manage/data/department!list1.action');
INSERT INTO `module` VALUES ('190012', '问题分类', null, 'manage/data/questionSort!list1.action');
INSERT INTO `module` VALUES ('190013', '处理分类', null, 'manage/data/handleSort!list.action');
INSERT INTO `module` VALUES ('190014', '角色', null, 'manage/system/role!list.action');
INSERT INTO `questionsort` VALUES ('1', '现场执勤执法', null);
INSERT INTO `questionsort` VALUES ('2', '非现场处罚', null);
INSERT INTO `questionsort` VALUES ('3', '车驾管业务', null);
INSERT INTO `questionsort` VALUES ('4', '事故处理', null);
INSERT INTO `questionsort` VALUES ('5', '内务纪律', null);
INSERT INTO `questionsort` VALUES ('6', '其它', null);
INSERT INTO `role` VALUES ('1', 'ROLE_SYS_ADMIN', '管理员');
INSERT INTO `role` VALUES ('2', 'ROLE_INSPECT_USER', '录入人员');
INSERT INTO `role` VALUES ('3', 'ROLE_INSPECT_ADMIN', '督察单位管理员');
INSERT INTO `role` VALUES ('4', 'ROLE_RELATE_USER', '涉及单位人员');
INSERT INTO `role` VALUES ('6', 'ROL_CHECK_USER', '审核人员');
INSERT INTO `rolemodule` VALUES ('1', '100');
INSERT INTO `rolemodule` VALUES ('2', '100');
INSERT INTO `rolemodule` VALUES ('3', '100');
INSERT INTO `rolemodule` VALUES ('4', '100');
INSERT INTO `rolemodule` VALUES ('6', '100');
INSERT INTO `rolemodule` VALUES ('1', '100001');
INSERT INTO `rolemodule` VALUES ('2', '100001');
INSERT INTO `rolemodule` VALUES ('3', '100001');
INSERT INTO `rolemodule` VALUES ('4', '100001');
INSERT INTO `rolemodule` VALUES ('6', '100001');
INSERT INTO `rolemodule` VALUES ('1', '100002');
INSERT INTO `rolemodule` VALUES ('2', '100002');
INSERT INTO `rolemodule` VALUES ('3', '100002');
INSERT INTO `rolemodule` VALUES ('4', '100002');
INSERT INTO `rolemodule` VALUES ('6', '100002');
INSERT INTO `rolemodule` VALUES ('2', '110');
INSERT INTO `rolemodule` VALUES ('2', '110001');
INSERT INTO `rolemodule` VALUES ('2', '110002');
INSERT INTO `rolemodule` VALUES ('2', '120');
INSERT INTO `rolemodule` VALUES ('2', '120001');
INSERT INTO `rolemodule` VALUES ('2', '120002');
INSERT INTO `rolemodule` VALUES ('2', '130');
INSERT INTO `rolemodule` VALUES ('2', '130001');
INSERT INTO `rolemodule` VALUES ('2', '130002');
INSERT INTO `rolemodule` VALUES ('2', '140');
INSERT INTO `rolemodule` VALUES ('2', '140001');
INSERT INTO `rolemodule` VALUES ('2', '140002');
INSERT INTO `rolemodule` VALUES ('6', '150');
INSERT INTO `rolemodule` VALUES ('6', '150002');
INSERT INTO `rolemodule` VALUES ('3', '170');
INSERT INTO `rolemodule` VALUES ('4', '170');
INSERT INTO `rolemodule` VALUES ('3', '170001');
INSERT INTO `rolemodule` VALUES ('4', '170001');
INSERT INTO `rolemodule` VALUES ('3', '170002');
INSERT INTO `rolemodule` VALUES ('4', '170002');
INSERT INTO `rolemodule` VALUES ('3', '170003');
INSERT INTO `rolemodule` VALUES ('4', '170003');
INSERT INTO `rolemodule` VALUES ('3', '170004');
INSERT INTO `rolemodule` VALUES ('4', '170004');
INSERT INTO `rolemodule` VALUES ('3', '170005');
INSERT INTO `rolemodule` VALUES ('3', '170006');
INSERT INTO `rolemodule` VALUES ('3', '170008');
INSERT INTO `rolemodule` VALUES ('3', '170009');
INSERT INTO `rolemodule` VALUES ('3', '180');
INSERT INTO `rolemodule` VALUES ('3', '180001');
INSERT INTO `rolemodule` VALUES ('3', '180002');
INSERT INTO `rolemodule` VALUES ('3', '180003');
INSERT INTO `rolemodule` VALUES ('1', '190');
INSERT INTO `rolemodule` VALUES ('1', '190001');
INSERT INTO `rolemodule` VALUES ('1', '190005');
INSERT INTO `rolemodule` VALUES ('1', '190006');
INSERT INTO `rolemodule` VALUES ('1', '190011');
INSERT INTO `rolemodule` VALUES ('1', '190012');
INSERT INTO `rolemodule` VALUES ('1', '190013');
INSERT INTO `scoreserial` VALUES ('1', '0');
INSERT INTO `scoreserial` VALUES ('2', '1');
INSERT INTO `scoreserial` VALUES ('3', '2');
INSERT INTO `scoreserial` VALUES ('4', '3');
INSERT INTO `scoreserial` VALUES ('5', '4');
INSERT INTO `scoreserial` VALUES ('6', '5');
INSERT INTO `scoreserial` VALUES ('7', '6');
INSERT INTO `scoreserial` VALUES ('8', '8');
INSERT INTO `scoreserial` VALUES ('9', '10');
INSERT INTO `scoreserial` VALUES ('10', '20');
INSERT INTO `scoreserial` VALUES ('11', '30');
INSERT INTO `scoreserial` VALUES ('12', '40');
INSERT INTO `scoreserial` VALUES ('13', '50');
INSERT INTO `user` VALUES ('1', '1', 'admin', '11', null, null, '', '系统管理员', '1', '2013-04-01', null, null, '', null, null, null, '1', '2013-04-26 14:43:22', null, '65', null);
INSERT INTO `user` VALUES ('29', '2', 'tuojunwu', '123456', 'aaaa', null, 'aa', '脱军武', '0', null, null, null, '', null, null, null, '1', '2013-05-07 16:09:20', null, null, null);
INSERT INTO `user` VALUES ('2', '3', 'xieming', '123456', null, null, null, '谢明', '0', null, null, null, null, null, null, null, '1', '2013-03-29 15:48:06', null, null, null);
INSERT INTO `user` VALUES ('2', '4', 'wuzhiguo', '123456', null, null, null, '吴志国', '0', null, null, null, null, null, null, null, '1', '2013-03-29 15:48:06', null, null, null);
INSERT INTO `user` VALUES ('3', '5', 'guofeng', '123456', null, null, null, '郭峰', '0', null, null, null, null, null, null, null, '1', '2013-03-29 15:48:06', null, null, null);
INSERT INTO `user` VALUES ('3', '6', 'renzhigang', '123456', null, null, null, '任志刚', '0', null, null, null, null, null, null, null, '1', '2013-03-29 15:48:06', null, null, null);
INSERT INTO `user` VALUES ('3', '7', 'wangzhentao', '123456', null, null, null, '王振涛', '0', null, null, null, null, null, null, null, '1', '2013-03-29 15:48:06', null, null, null);
INSERT INTO `user` VALUES ('4', '8', 'wuming', '123456', null, null, null, '吴铭', '0', null, null, null, null, null, null, null, '1', '2013-03-29 15:48:06', null, null, null);
INSERT INTO `user` VALUES ('4', '9', 'zhaiyiran', '123456', null, null, null, '翟毅然', '0', null, null, null, null, null, null, null, '1', '2013-03-29 15:48:06', null, null, null);
INSERT INTO `user` VALUES ('27', '10', 'zhaozhijian', '123456', 'aaa', '2013-04-29 00:00:00', 'aaa', '赵志坚', '0', '2013-04-29', null, null, 'aaa', null, null, null, '1', '2013-05-07 16:07:25', null, null, null);
INSERT INTO `user` VALUES ('4', '11', 'chenli', '123456', null, null, null, '陈莉', '0', null, null, null, null, null, null, null, '1', '2013-03-29 15:48:06', null, null, null);
INSERT INTO `user` VALUES ('5', '12', 'songchunsheng', '123456', null, null, null, '宋春生', '0', null, null, null, null, null, null, null, '1', '2013-03-29 15:48:06', null, null, null);
INSERT INTO `user` VALUES ('5', '13', 'zhaoziyun', '123456', null, null, null, '赵紫云', '0', null, null, null, null, null, null, null, '1', '2013-03-29 15:48:06', null, null, null);
INSERT INTO `user` VALUES ('5', '14', 'wangyan', '123456', null, null, null, '王严', '0', null, null, null, null, null, null, null, '1', '2013-03-29 15:48:06', null, null, null);
INSERT INTO `user` VALUES ('6', '15', 'test1', '123456', 'qq', null, '', '测试涉及单位人员1', '0', null, null, null, '', null, null, null, '1', '2013-05-08 15:23:43', null, null, null);
INSERT INTO `user` VALUES ('6', '16', 'test2', '123456', null, null, null, '测试涉及单位人员2', '0', null, null, null, null, null, null, null, '1', '2013-03-29 15:48:06', null, null, null);
INSERT INTO `user` VALUES ('6', '17', 'test3', '123456', null, null, null, '测试涉及单位人员3', '0', null, null, null, null, null, null, null, '1', '2013-03-29 15:48:06', null, null, null);
INSERT INTO `user` VALUES ('7', '18', 'test4', '123456', null, null, null, '测试涉及单位人员4', '0', null, null, null, null, null, null, null, '1', '2013-04-02 15:48:06', null, null, null);
INSERT INTO `user` VALUES ('7', '19', 'test5', '123456', null, null, null, '测试涉及单位人员5', '0', null, null, null, null, null, null, null, '1', '2013-03-29 15:48:06', null, null, null);
INSERT INTO `user` VALUES ('7', '20', 'test6', '123456', null, null, null, '测试涉及单位人员6', '0', null, null, null, null, null, null, null, '1', '2013-03-29 15:48:06', null, null, null);
INSERT INTO `user` VALUES ('7', '21', 'test7', '123456', null, null, null, '测试涉及单位人员7', '0', null, null, null, null, null, null, null, '1', '2013-03-29 15:48:06', null, null, null);
INSERT INTO `user` VALUES ('7', '22', 'test8', '123456', null, null, null, '测试涉及单位人员8', '0', null, null, null, null, null, null, null, '1', '2013-04-02 15:48:06', null, null, null);
INSERT INTO `user` VALUES ('8', '23', 'test9', '123456', null, null, null, '测试涉及单位人员9', '0', null, null, null, null, null, null, null, '1', '2013-03-29 15:48:06', null, null, null);
INSERT INTO `user` VALUES ('8', '24', 'test10', '123456', null, null, null, '测试涉及单位人员10', '0', null, null, null, null, null, null, null, '1', '2013-03-29 15:48:06', null, null, null);
INSERT INTO `user` VALUES ('8', '25', 'test11', '123456', null, null, null, '测试涉及单位人员11', '0', null, null, null, null, null, null, null, '1', '2013-03-29 15:48:06', null, null, null);
INSERT INTO `user` VALUES ('8', '26', 'test12', '123456', null, null, null, '测试涉及单位人员12', '0', null, null, null, null, null, null, null, '1', '2013-03-29 15:48:06', null, null, null);
INSERT INTO `user` VALUES ('8', '27', 'test13', '123456', null, null, null, '测试涉及单位人员13', '0', null, null, null, null, null, null, null, '1', '2013-03-29 15:48:06', null, null, null);
INSERT INTO `user` VALUES ('9', '28', 'test18', '123456', null, null, null, '测试涉及单位人员18', '0', null, null, null, null, null, null, null, '1', '2013-03-29 15:48:06', null, null, null);
INSERT INTO `user` VALUES ('9', '29', 'test19', '123456', null, null, null, '测试涉及单位人员19', '0', null, null, null, null, null, null, null, '1', '2013-03-29 15:48:06', null, null, null);
INSERT INTO `user` VALUES ('1', '30', 'shenhe', '123456', 'ts110', null, '', '审核', '0', null, null, null, '', null, null, null, null, '2013-04-24 20:41:27', null, null, null);
INSERT INTO `user` VALUES ('1', '31', 'a', '123456', 'a', null, 'a', 'a', '0', null, null, null, '', null, null, null, null, '2013-04-26 19:42:30', null, null, null);
INSERT INTO `user` VALUES ('1', '32', 'a', '123456', 'a', null, 'a', 'a', '0', null, null, null, '', null, null, null, null, '2013-04-26 19:42:33', null, null, null);
INSERT INTO `user` VALUES ('6', '33', 'a1a', '123456', 'a', null, 'aadfsf', 'a', '0', '2013-05-06', null, null, 'as', null, null, null, null, '2013-05-07 16:06:45', null, null, null);
INSERT INTO `userrole` VALUES ('1', '1');
INSERT INTO `userrole` VALUES ('31', '1');
INSERT INTO `userrole` VALUES ('32', '1');
INSERT INTO `userrole` VALUES ('3', '2');
INSERT INTO `userrole` VALUES ('4', '2');
INSERT INTO `userrole` VALUES ('6', '2');
INSERT INTO `userrole` VALUES ('7', '2');
INSERT INTO `userrole` VALUES ('9', '2');
INSERT INTO `userrole` VALUES ('10', '2');
INSERT INTO `userrole` VALUES ('11', '2');
INSERT INTO `userrole` VALUES ('13', '2');
INSERT INTO `userrole` VALUES ('14', '2');
INSERT INTO `userrole` VALUES ('33', '2');
INSERT INTO `userrole` VALUES ('2', '3');
INSERT INTO `userrole` VALUES ('5', '3');
INSERT INTO `userrole` VALUES ('8', '3');
INSERT INTO `userrole` VALUES ('12', '3');
INSERT INTO `userrole` VALUES ('15', '4');
INSERT INTO `userrole` VALUES ('30', '6');
