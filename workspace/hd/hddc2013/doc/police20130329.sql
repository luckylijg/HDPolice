-- 创建用户并为所有的远程用户授权  root/
-- create user police identified by 'police';
-- grant insert,delete,update,select,create,drop,alter on *.* to 'police'@'%' identified by 'police';
-- flush privileges;

drop database if exists police;
create database police character set utf8;
use police;
-- show variables like 'character_set_database'
--
drop table if exists code;
create table code(-- 编号(存放下一个可用的编号)BaseAction.getNextCode(int codeid)应synchronized
	codeid int auto_increment primary key,
	nextcode varchar(20) not null, -- 下一个可用的编号
    description varchar(100) -- 描述
);
insert into code(nextcode,description) 
values ('TS0000','(举报)投诉'),
('XC0000','现场(督察)'),
('WD0000','网上督察'),
('WY0000','网络舆情');
commit;
select * from code;

drop table if exists user;
drop table if exists department;
create table department(-- 督察单位+涉及单位 表（考虑每个单位加一个固定的'编号'字段）
	type int default 0, -- 单位类型  -1默认单位(如测试用户等)  0-督察单位 1-涉及单位
	departmentid int auto_increment primary key,
	name varchar(30) not null unique,-- 名称
	address varchar(100), -- 地址
    phone varchar(40), -- 电话
	description varchar(100) -- 描述
)ENGINE = InnoDB;
insert into department(type,name) 
values(-1,'默认单位'),(0,'警务督察处'),(0,'现场督察中队'),(0,'网上督察中队'),
(0,'综合指导中队'),(1,'一大队'),(1,'二大队'),(1,'三大队'),(1,'四大队'),
(1,'五大队'),(1,'六大队'),(1,'防空大队'),(1,'机动大队'),(1,'邯郸县大队'),
(1,'峰峰大队'),(1,'大名大队'),(1,'成安大队'),(1,'魏县大队'),(1,'曲周大队'),
(1,'馆陶大队'),(1,'肥乡大队'),(1,'临漳大队'),(1,'邱县大队'),(1,'广平大队'),
(1,'涉县大队'),(1,'武安大队'),(1,'磁县大队'),(1,'永年大队'),(1,'鸡泽大队'),
(1,'车管所'),(1,'事故处'),(1,'人检中心'),(1,'考试中心'),(1,'交通秩序处'),
(1,'公路巡警处'),(1,'法制科'),(1,'特勤大队'),(1,'指挥中心'),
(1,'信息通信中心'),(1,'办公室'),(1,'政治处'),(1,'行政科'),(1,'纪委'),
(1,'财务科'),(1,'审计科'),(1,'交通设施科'),(1,'宣传科'),(1,'科研中心'),
(1,'服务中心'),(1,'宣教中心');
commit;
select * from department;

create table user(-- 用户表
	departmentid int not null,
	userid int auto_increment primary key,
    username varchar(20) not null, -- 用户名(默认为根据真实姓名全拼,汉字自动转换拼音代码段)
	pwd varchar(20) default '123456', -- 密码
	
	sno varchar(10),-- (警员)编号
    entrytime datetime,-- 入职时间
    job varchar(20),-- 职务

	realname varchar(20) not null, -- 真实姓名
	sex int default 0, -- 性别 0-男 1-女
	birthday date , -- 生日
    idnumber varchar(18),-- 身份证号码
    photo varchar(100),-- 照片路径
	mobile varchar(30), -- 手机
	phone varchar(30), -- 固定电话
	email varchar(100),
	qq varchar(20),
	state int default 1, -- 状态，默认正常，0锁定
	indate timestamp default CURRENT_TIMESTAMP, -- insert时间
	latest_login_time datetime,-- 最后一次登陆时间
	login_times int, -- 登录次数
    description varchar(200),
	foreign key(departmentid) references department(departmentid)
)ENGINE = InnoDB;
-- 系统管理员
insert into user(departmentid,username,pwd,realname)values(1,'admin','11','系统管理员');
-- 督察单位人员(第一个人为督察单位管理员(领导)角色:ROLE_INSPECT_ADMIN)
insert into user(departmentid,username,realname)values(2,'tuojunwu','脱军武');
insert into user(departmentid,username,realname)values(2,'xieming','谢明');
insert into user(departmentid,username,realname)values(2,'wuzhiguo','吴志国');
insert into user(departmentid,username,realname)values(3,'guofeng','郭峰');
insert into user(departmentid,username,realname)values(3,'renzhigang','任志刚');
insert into user(departmentid,username,realname)values(3,'wangzhentao','王振涛');
insert into user(departmentid,username,realname)values(4,'wuming','吴铭');
insert into user(departmentid,username,realname)values(4,'zhaiyiran','翟毅然');
insert into user(departmentid,username,realname)values(4,'zhaozhijian','赵志坚');
insert into user(departmentid,username,realname)values(4,'chenli','陈莉');
insert into user(departmentid,username,realname)values(5,'songchunsheng','宋春生');
insert into user(departmentid,username,realname)values(5,'zhaoziyun','赵紫云');
insert into user(departmentid,username,realname)values(5,'wangyan','王严');
-- 涉及单位人员
insert into user(departmentid,username,realname)values(6,'test1','测试涉及单位人员1');-- 一大队
insert into user(departmentid,username,realname)values(6,'test2','测试涉及单位人员2');
insert into user(departmentid,username,realname)values(6,'test3','测试涉及单位人员3');
insert into user(departmentid,username,realname)values(7,'test4','测试涉及单位人员4');-- 二大队
insert into user(departmentid,username,realname)values(7,'test5','测试涉及单位人员5');
insert into user(departmentid,username,realname)values(7,'test6','测试涉及单位人员6');
insert into user(departmentid,username,realname)values(7,'test7','测试涉及单位人员7');
insert into user(departmentid,username,realname)values(7,'test8','测试涉及单位人员8');
insert into user(departmentid,username,realname)values(8,'test9','测试涉及单位人员9');-- 三大队
insert into user(departmentid,username,realname)values(8,'test10','测试涉及单位人员10');
insert into user(departmentid,username,realname)values(8,'test11','测试涉及单位人员11');
insert into user(departmentid,username,realname)values(8,'test12','测试涉及单位人员12');
insert into user(departmentid,username,realname)values(8,'test13','测试涉及单位人员13');
insert into user(departmentid,username,realname)values(9,'test18','测试涉及单位人员18');-- 四大队
insert into user(departmentid,username,realname)values(9,'test19','测试涉及单位人员19');
commit;
select * from user;

drop table if exists questionsort;
drop table if exists handlesort;
create table questionsort(-- 问题类别表
       questionsortid int auto_increment primary key,
       name varchar(30) not null unique,-- 类别名
       description varchar(100)-- 描述
);
insert into questionsort(name) 
values('现场执勤执法'),('非现场处罚'),('车驾管业务'),('事故处理'),('内务纪律'),('其它');
commit;
select * from questionsort;

create table handlesort(-- 处理分类表
       handlesortid int auto_increment primary key,
       name varchar(30) not null unique,-- 分类名
       description varchar(100)-- 描述
);
insert into handlesort(name) 
values('书面检查'),('通报批评'),('参加培训班'),('罚款'),('禁闭'),('停止执行职务'),('调离工作岗位'),('调离执法岗位'),('诫勉谈话'),('警告'),('记过'),('记大过'),('辞退'),('开除'),('其他');
commit;
select * from handlesort;

create table scoreserial(-- 千分制扣分序列表(暂时写死页面可以不用)
 serialid int auto_increment primary key,
 score int not null unique
);
insert into scoreserial(score) 
values(0),(1),(2),(3),(4),(5),(6),(8),(10),(20),(30),(40),(50);
commit;
select * from scoreserial;

-- /***4张打印报表特殊说明***/
-- a.举报投诉表:督察民警、问题类别、涉及单位(涉及人员选?)、处理分类 可多选
-- b.现场督察表:督察民警、问题类别、涉及单位(涉及人员选?)、处理分类 可多选
-- c.网上督察表:督察民警、问题类别、涉及单位(涉及人员选?)、处理分类 可多选
-- d.网络舆情表:督察民警、问题类别、涉及单位(涉及人员选?)、处理分类 可多选
-- 注：4张打印报表上的'可多选'字段应该为多对多，所以还要见多对多关系表
-- 4张打印报表虽然主要地方字段一样，为便于扩充更改，分开设计(客户将来很可能对每个模块提出不同的修改)
-- 但是,进一步可以发现,举报投诉表的字段包含了其他三个表的字段,
-- 所以暂且将4张打印报表合于举报投诉表,加一字段type即可(不用编号TS0000头两字母区别是因为要取字串)
-- 如此4者antion-service-dao-model相同合一,仅jsp稍有字段区别,
-- 这样既减少暂时的工作量,又便于将来分开,也便于查询统计
-- /*注:4张表区别为(这个每个人要十分清楚),ad仅舆情发布人和发帖人稍有区别(a包括d),
-- bc相同,ad有回访意见+查办结果视频(bc无),4者编号不同.但是4者彼此不同
-- 不参与查询统计,此4表合一基础*/

-- //举报投诉-----------------------------------------------
drop table if exists complaint;
create table complaint(-- 举报投诉表
   complaintid int auto_increment primary key,
   
   -- /********************
   type int not null, -- /*暂且将4张打印报表合一标识 0-举报投诉表 1-现场督察表 2-网上督察表 3-网络舆情表*/
   -- 操作方法:(1)模块入口将type写入session,因为每次都是先入口再用,所以不会有错;
   --        (2)每个模块建单独的action
   -- ********************/

   sno varchar(30) not null unique,-- 编号TS0000
   time datetime not null,-- 时间(可选)
   departmentid int not null, -- 督察单位id(默认为登录人单位id?),外键(如果有单位编号则用编号)
   -- 督察民警(可多选,多对多)
   
   -- //舆情发布人
   name varchar(30),-- 姓名
   sex int, -- 性别 0-男 1-女
   age int,-- 年龄
   profession varchar(30),-- 职业
   address varchar(100),-- 单位或地址
   mode int, -- 投诉方式 0-来电 1-来访 2-批转
   idnumber varchar(18), -- 身份证号码
   phone varchar(30), -- 联系电话

   -- //被投诉人
   -- 涉及单位(可多选,多对多)
   people varchar(100),-- 涉及人员
   -- 问题类别(可多选,多对多)

   -- //反映问题及要求
   question varchar(2048) not null, -- 反映问题及要求
   filename varchar(300), -- 有/无图片视频资料 文件名:

   leadercomment varchar(200), -- 领导批示
   
   -- //查办结果
   investigateresult varchar(300),-- 查办结果
   filename2 varchar(300), -- 有/无图片视频资料 文件名:
   yesno int default 0, -- 0-未定 1-查实 2-查否 注:有限的下拉可选字段,用数字便于查询统计sql/hql
 
   visitopinion int default 2,-- 回访意见 0-不满意 1-满意 2-无
   time2 datetime,-- 查结时间(可选)
   -- 处理分类(可多选,多对多)
   score int default 0, -- 千分制扣分:可选
   earlywarning int default 0,-- 预警是否0-未定 1-是 2-否 预警的条件?
   leaderapproved int default 0, -- 0-未审核 1-通过  2-未通过
   remark varchar(300),
   
   userid int not null,-- 录入人,外键
   entertime timestamp default CURRENT_TIMESTAMP, -- 录入时间 
   userid2 int not null,-- 最近一次编辑人,外键(录入时为录入人)
   edittime datetime not null, -- 最近一次编辑时间 (录入时为录入时间)
   ip varchar(40),-- 最近一次编辑机器ip
   
   foreign key(departmentid) references department(departmentid),
   foreign key(userid) references user(userid),
   foreign key(userid2) references user(userid)
);

create table complaintInspector(-- 举报投诉-督察民警(多对多)
	complaintid int not null,
	userid int not null,
	primary key(complaintid,userid), -- 联合主键
    foreign key(complaintid) references complaint(complaintid),
    foreign key(userid) references user(userid)
);

create table complaintDepartment(-- 举报投诉-单位表(多对多)
	complaintid int not null,
	departmentid int not null,
	primary key(complaintid,departmentid), -- 联合主键
    foreign key(complaintid) references complaint(complaintid),
    foreign key(departmentid) references department(departmentid)
);

drop table if exists complaintQuestionsort;
create table complaintQuestionsort(-- 举报投诉-问题类别表(多对多)
	complaintid int not null,
	questionsortid int not null,
	primary key(complaintid,questionsortid), -- 联合主键
    foreign key(complaintid) references complaint(complaintid),
    foreign key(questionsortid) references questionsort(questionsortid)
);

create table complaintHandlesort(-- 举报投诉-处理类别表(多对多)
	complaintid int not null,
	handlesortid int not null,
	primary key(complaintid,handlesortid), -- 联合主键
    foreign key(complaintid) references complaint(complaintid),
    foreign key(handlesortid) references handlesort(handlesortid)
);

create table Feedback( --  回馈信息表
       feedbackid int auto_increment primary key,
       departmentid int not null,
       complaintid int not null,
       userid int,
       message varchar(1000),
       description varchar(100),
       foreign key(complaintid) references complaint(complaintid),
       foreign key(departmentid) references department(departmentid),
       foreign key(userid) references user(userid)
);

-- //现场督察-----------------------------------------------

create table fieldinspect(-- 现场督察表

);

-- //网上督察-----------------------------------------------

create table webinspect(-- 网上督察表
       
);

-- //网络舆情-----------------------------------------------

create table popularfeelings(-- 网络舆情表
       
);

