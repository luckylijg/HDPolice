-- 暂考虑(不考虑用户组):用户-角色-权限(模块)

create table Role (-- 角色表
       roleid int auto_increment primary key,
       name varchar(30) not null unique,
       description varchar(100)
);
-- 注意:
-- int auto_increment输入负数,然后Hibernate Reverse Engineering...,反向失败并使mysql服务停止;
-- 但如果int auto_increment为正数或表中无数据则反向正常,why?可能是MyEclipse10.1 hibernate反向工程支持问题,因为如果使用原生sql语句则一定不存在问题。

-- 以下角色不可删除
insert into Role(roleid,name,description)values(1,'ROLE_SYS_ADMIN','系统管理员');-- ?
insert into Role(roleid,name,description)values(2,'ROLE_INSPECT_USER','督察单位录入人员');-- 只能 update/delete本单位insert的数据;
insert into Role(roleid,name,description)values(3,'ROLE_INSPECT_ADMIN','督察单位管理员(领导)');-- 只能查看所有涉及单位的统计数据 + 4张登记表'批示'、'审核'字段
insert into Role(roleid,name,description)values(4,'ROLE_RELATE_USER','涉及单位人员');-- 只能 查看 涉及本人的数据
insert into Role(roleid,name,description)values(5,'ROLE_RELATE_ADMIN','涉及单位管理员(领导)');-- 只能 查看 涉及本单位的数据
commit;

create table UserRole(-- 用户角色表(注：只有单纯的多对多关系表才不建独立model，有其他属性的多对多关系表必须将model(例如ls_company_node_tab))
       -- urid int primary key,-- 若在hibernate reverse Engineering第二步选中Enable many-to-many detection，则多对多关系表不形成独立model层实体(即所有关系都在实体model中，关系不形成独立model)
       userid int not null,-- 多对多在实体操作时都是一对多，所以关系实体不创建时，两端实体即为一对多操作
       roleid int not null,
       primary key(userid,roleid),-- 联合主键(可以认为多对多为两个多对一的组合)
       foreign key(userid) references user(userid),
       foreign key(roleid) references Role(roleid)
);
-- 开发阶段,每个角色至少提供一个用户(特注:ROLE_RELATE_USER为默认,不存,即系统中没有角色的人默认为之)
-- ROLE_SYS_ADMIN
insert into UserRole(userid,roleid)values(1,1);
-- ROLE_INSPECT_ADMIN(暂且设定每个督察单位第一个人)
insert into UserRole(userid,roleid)values(2,3);
insert into UserRole(userid,roleid)values(5,3);
insert into UserRole(userid,roleid)values(8,3);
insert into UserRole(userid,roleid)values(12,3);
-- ROLE_INSPECT_USER
insert into UserRole(userid,roleid)values(3,2);
insert into UserRole(userid,roleid)values(4,2);
insert into UserRole(userid,roleid)values(6,2);
insert into UserRole(userid,roleid)values(7,2);
insert into UserRole(userid,roleid)values(9,2);
insert into UserRole(userid,roleid)values(10,2);
insert into UserRole(userid,roleid)values(11,2);
insert into UserRole(userid,roleid)values(13,2);
insert into UserRole(userid,roleid)values(14,2);
-- ROLE_RELATE_ADMIN(暂且设定每个涉及单位第一个人)
insert into UserRole(userid,roleid)values(15,5);
insert into UserRole(userid,roleid)values(18,5);
insert into UserRole(userid,roleid)values(23,5);
insert into UserRole(userid,roleid)values(28,5);
-- ROLE_RELATE_USER(其余人们默认是也,不存,即系统中没有角色的人默认为之)
commit;

create table Module(-- 系统模块(权限)表   
       moduleid varchar(30) primary key,
       name varchar(50)  not null,
       icon varchar(100), -- 图标url
	   link varchar(200) -- 超链接
);
delete from Module;
commit;
-- 所有角色共有
insert into Module(moduleid,name,icon,link)values('100','基本信息','','');
insert into Module(moduleid,name,icon,link)values('100001','人员资料','','');-- 浏览本单位人员资料,不可编辑
insert into Module(moduleid,name,icon,link)values('100002','更改登录密码','','');

-- ROLE_INSPECT_USER(ROLE_INSPECT_ADMIN:4张登记表'批示'、'审核'字段,这个如何做？)
insert into Module(moduleid,name,icon,link)values('110','举报投诉','','');
insert into Module(moduleid,name,icon,link)values('110001','添加','','');
insert into Module(moduleid,name,icon,link)values('110002','修改/删除','',''); -- 组合查询 表格显示
insert into Module(moduleid,name,icon,link)values('120','现场督察','','');
insert into Module(moduleid,name,icon,link)values('120001','添加','','');
insert into Module(moduleid,name,icon,link)values('120002','修改/删除','','');
insert into Module(moduleid,name,icon,link)values('130','网上督察','','');
insert into Module(moduleid,name,icon,link)values('130001','添加','','');
insert into Module(moduleid,name,icon,link)values('130002','修改/删除','','');
insert into Module(moduleid,name,icon,link)values('140','网络舆情','','');
insert into Module(moduleid,name,icon,link)values('140001','添加','','');
insert into Module(moduleid,name,icon,link)values('140002','修改/删除','','');

-- ROLE_INSPECT_ADMIN
insert into Module(moduleid,name,icon,link)values('150','批示审核','','');
insert into Module(moduleid,name,icon,link)values('150001','批示','','');
insert into Module(moduleid,name,icon,link)values('150002','审核','','');

insert into Module(moduleid,name,icon,link)values('170','统计表','','');
insert into Module(moduleid,name,icon,link)values('170001','受理举报投诉登记表','','');
insert into Module(moduleid,name,icon,link)values('170002','现场督察登记表','','');
insert into Module(moduleid,name,icon,link)values('170003','网上督察登记表','','');
insert into Module(moduleid,name,icon,link)values('170004','网络舆情调查登记表','','');
insert into Module(moduleid,name,icon,link)values('170005','涉及单位千分制考核扣分明细表','','');
insert into Module(moduleid,name,icon,link)values('170006','各涉及单位千分制考核扣分排名统计表','','');
insert into Module(moduleid,name,icon,link)values('180','统计柱状图','','');
insert into Module(moduleid,name,icon,link)values('180001','按问题类别','','');
insert into Module(moduleid,name,icon,link)values('180002','按模块','','');
insert into Module(moduleid,name,icon,link)values('180003','按涉及单位','','');
insert into Module(moduleid,name,icon,link)values('180004','按月:总数+查实数','','');

-- ROLE_SYS_ADMIN
insert into Module(moduleid,name,icon,link)values('190','系统管理','','');
insert into Module(moduleid,name,icon,link)values('190001','用户','','');
-- insert into Module(moduleid,name,icon,link)values('190002','用户组','','');
insert into Module(moduleid,name,icon,link)values('190003','角色','','');
insert into Module(moduleid,name,icon,link)values('190004','权限','','');
insert into Module(moduleid,name,icon,link)values('190005','数据库备份','','');
insert into Module(moduleid,name,icon,link)values('190006','单位(督察+涉及)','','');
insert into Module(moduleid,name,icon,link)values('190007','问题类别','','');
insert into Module(moduleid,name,icon,link)values('190008','处理分类','','');
insert into Module(moduleid,name,icon,link)values('190009','千分制扣分','','');

commit;
select * from Module;

create table RoleModule( -- 角色权限(模块)表
       roleid int not null,
       moduleid varchar(30) not null,
       constraint RoleModule_pk primary key(roleid,moduleid), -- 联合主键
       constraint RoleModule_fk foreign key(roleid) references Role(roleid),
       constraint RoleModule_fk2 foreign key(moduleid) references Module(moduleid)
);
-- //在权限分配页面如上分配即可,暂不此手写了
commit;
select * from RoleModule;