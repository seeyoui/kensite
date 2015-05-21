drop table OA_LEAVE cascade constraints;
drop table SYS_DEPARTMENT cascade constraints;
drop table SYS_MENU cascade constraints;
drop table SYS_MODULE cascade constraints;
drop table SYS_MODULE_PERMISSION cascade constraints;
drop table SYS_PERMISSION cascade constraints;
drop table SYS_ROLE cascade constraints;
drop table SYS_ROLE_MENU cascade constraints;
drop table SYS_ROLE_MODULE cascade constraints;
drop table SYS_USER cascade constraints;
drop table SYS_USER_ROLE cascade constraints;
create table OA_LEAVE
(
  id         CHAR(32) not null,
  createdate DATE,
  createuser VARCHAR2(50),
  updatedate DATE,
  updateuser VARCHAR2(50),
  bindid     VARCHAR2(60),
  reason     VARCHAR2(500),
  starttime  DATE,
  endtime    DATE,
  leavetype  VARCHAR2(50)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 8K
    minextents 1
    maxextents unlimited
  );
comment on table OA_LEAVE
  is '请假申请';
comment on column OA_LEAVE.id
  is '主键';
comment on column OA_LEAVE.createdate
  is '创建日期';
comment on column OA_LEAVE.createuser
  is '创建用户';
comment on column OA_LEAVE.updatedate
  is '修改日期';
comment on column OA_LEAVE.updateuser
  is '修改用户';
comment on column OA_LEAVE.bindid
  is '流程绑定主键';
comment on column OA_LEAVE.reason
  is '请假原因';
comment on column OA_LEAVE.starttime
  is '请假开始时间';
comment on column OA_LEAVE.endtime
  is '请假结束时间';
comment on column OA_LEAVE.leavetype
  is '请假类型';
alter table OA_LEAVE
  add constraint OA_LEAVE_ID primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

create table SYS_DEPARTMENT
(
  id       CHAR(32) not null,
  parentid CHAR(32),
  sequence NUMBER(10),
  name     VARCHAR2(50),
  code     VARCHAR2(100)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 8K
    minextents 1
    maxextents unlimited
  );
comment on table SYS_DEPARTMENT
  is '部门';
comment on column SYS_DEPARTMENT.id
  is '主键';
comment on column SYS_DEPARTMENT.parentid
  is '外键';
comment on column SYS_DEPARTMENT.sequence
  is '排序';
comment on column SYS_DEPARTMENT.name
  is '部门名称';
comment on column SYS_DEPARTMENT.code
  is '部门编号';
alter table SYS_DEPARTMENT
  add constraint SYS_DEPARTMENT_ID primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

create table SYS_MENU
(
  id       CHAR(32) not null,
  parentid CHAR(32),
  name     VARCHAR2(50),
  url      VARCHAR2(500),
  sequence NUMBER,
  icon     VARCHAR2(50),
  target   VARCHAR2(50)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 8K
    minextents 1
    maxextents unlimited
  );
comment on table SYS_MENU
  is '导航菜单';
comment on column SYS_MENU.id
  is '主键';
comment on column SYS_MENU.parentid
  is '外键';
comment on column SYS_MENU.name
  is '名称';
comment on column SYS_MENU.url
  is 'URL';
comment on column SYS_MENU.sequence
  is '排序';
comment on column SYS_MENU.icon
  is '图标';
comment on column SYS_MENU.target
  is '打开方式';
alter table SYS_MENU
  add constraint SYS_MENU_ID primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

create table SYS_MODULE
(
  id    CHAR(32) not null,
  name  VARCHAR2(50),
  shiro VARCHAR2(50)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SYS_MODULE
  is '系统模块';
comment on column SYS_MODULE.id
  is '主键';
comment on column SYS_MODULE.name
  is '模块名称';
comment on column SYS_MODULE.shiro
  is '权限';
alter table SYS_MODULE
  add constraint SYS_MODULE_ID primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

create table SYS_MODULE_PERMISSION
(
  moduleid     CHAR(32) not null,
  permissionid VARCHAR2(50) not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 8K
    minextents 1
    maxextents unlimited
  );
comment on table SYS_MODULE_PERMISSION
  is '模块权限';
comment on column SYS_MODULE_PERMISSION.moduleid
  is '模块主键';
comment on column SYS_MODULE_PERMISSION.permissionid
  is '权限主键';
alter table SYS_MODULE_PERMISSION
  add constraint SYS_MODULE_PERMISSION_ID primary key (MODULEID, PERMISSIONID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

create table SYS_PERMISSION
(
  id       VARCHAR2(50) not null,
  sequence NUMBER(10),
  name     VARCHAR2(50)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 8K
    minextents 1
    maxextents unlimited
  );
comment on table SYS_PERMISSION
  is '权限';
comment on column SYS_PERMISSION.id
  is '主键';
comment on column SYS_PERMISSION.sequence
  is '排序';
comment on column SYS_PERMISSION.name
  is '权限名';
alter table SYS_PERMISSION
  add constraint SYS_PERMISSION_ID primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

create table SYS_ROLE
(
  id    CHAR(32) not null,
  name  VARCHAR2(50),
  shiro VARCHAR2(50)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 8K
    minextents 1
    maxextents unlimited
  );
comment on table SYS_ROLE
  is '角色';
comment on column SYS_ROLE.id
  is '主键';
comment on column SYS_ROLE.name
  is '角色名';
comment on column SYS_ROLE.shiro
  is '权限';
alter table SYS_ROLE
  add constraint SYS_ROLE_ID primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

create table SYS_ROLE_MENU
(
  roleid CHAR(32) not null,
  menuid CHAR(32) not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 8K
    minextents 1
    maxextents unlimited
  );
comment on table SYS_ROLE_MENU
  is '角色菜单';
comment on column SYS_ROLE_MENU.roleid
  is '角色主键';
comment on column SYS_ROLE_MENU.menuid
  is '菜单主键';
alter table SYS_ROLE_MENU
  add constraint SYS_ROLE_MENU_ID primary key (ROLEID, MENUID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

create table SYS_ROLE_MODULE
(
  roleid   CHAR(32) not null,
  moduleid CHAR(32) not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 8K
    minextents 1
    maxextents unlimited
  );
comment on table SYS_ROLE_MODULE
  is '角色模块';
comment on column SYS_ROLE_MODULE.roleid
  is '角色主键';
comment on column SYS_ROLE_MODULE.moduleid
  is '模块主键';
alter table SYS_ROLE_MODULE
  add constraint SYS_ROLE_MODULE_ID primary key (ROLEID, MODULEID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

create table SYS_USER
(
  id           CHAR(32) not null,
  username     VARCHAR2(50),
  password     VARCHAR2(50),
  name         VARCHAR2(50),
  departmentid CHAR(32),
  state        CHAR(1),
  email        VARCHAR2(50),
  phone        VARCHAR2(50)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 8K
    minextents 1
    maxextents unlimited
  );
comment on table SYS_USER
  is '用户信息';
comment on column SYS_USER.id
  is '主键';
comment on column SYS_USER.username
  is '账号';
comment on column SYS_USER.password
  is '密码';
comment on column SYS_USER.name
  is '用户名';
comment on column SYS_USER.departmentid
  is '部门';
comment on column SYS_USER.state
  is '状态';
comment on column SYS_USER.email
  is '邮箱';
comment on column SYS_USER.phone
  is '电话';
alter table SYS_USER
  add constraint SYS_USER_ID primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

create table SYS_USER_ROLE
(
  userid CHAR(32) not null,
  roleid CHAR(32) not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 8K
    minextents 1
    maxextents unlimited
  );
comment on table SYS_USER_ROLE
  is '用户角色';
comment on column SYS_USER_ROLE.userid
  is '用户主键';
comment on column SYS_USER_ROLE.roleid
  is '角色主键';
alter table SYS_USER_ROLE
  add constraint SYS_USER_ROLE_ID primary key (USERID, ROLEID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

alter table OA_LEAVE disable all triggers;
alter table SYS_DEPARTMENT disable all triggers;
alter table SYS_MENU disable all triggers;
alter table SYS_MODULE disable all triggers;
alter table SYS_MODULE_PERMISSION disable all triggers;
alter table SYS_PERMISSION disable all triggers;
alter table SYS_ROLE disable all triggers;
alter table SYS_ROLE_MENU disable all triggers;
alter table SYS_ROLE_MODULE disable all triggers;
alter table SYS_USER disable all triggers;
alter table SYS_USER_ROLE disable all triggers;
insert into OA_LEAVE (id, createdate, createuser, updatedate, updateuser, bindid, reason, starttime, endtime, leavetype)
values ('21dd1a1b00bb4ee0bd9ed9414942408d', to_date('18-05-2015 09:53:17', 'dd-mm-yyyy hh24:mi:ss'), 'system', null, null, '7ffd9c027055408a81370f2049f7672c', null, null, null, null);
insert into OA_LEAVE (id, createdate, createuser, updatedate, updateuser, bindid, reason, starttime, endtime, leavetype)
values ('574153be887b4540bbb677ece61744aa', to_date('19-05-2015 09:02:20', 'dd-mm-yyyy hh24:mi:ss'), 'system', to_date('19-05-2015 11:48:35', 'dd-mm-yyyy hh24:mi:ss'), 'system', '4b1f797a871a4d249cf67eaffb8ff065', '生病请假三天', to_date('19-05-2015 11:00:00', 'dd-mm-yyyy hh24:mi:ss'), to_date('21-05-2015 11:00:00', 'dd-mm-yyyy hh24:mi:ss'), '病假');
insert into OA_LEAVE (id, createdate, createuser, updatedate, updateuser, bindid, reason, starttime, endtime, leavetype)
values ('9d0129487b3a401ea4ccc51768f43609', to_date('18-05-2015 20:51:48', 'dd-mm-yyyy hh24:mi:ss'), 'system', null, null, '9fa313e28b1b4a38ac792498d02f7549', null, null, null, null);
insert into OA_LEAVE (id, createdate, createuser, updatedate, updateuser, bindid, reason, starttime, endtime, leavetype)
values ('3fad75717bfc4b24b6ad9576924af6fa', to_date('20-05-2015 09:43:06', 'dd-mm-yyyy hh24:mi:ss'), 'system', to_date('20-05-2015 09:44:54', 'dd-mm-yyyy hh24:mi:ss'), 'system', '30a7a843ba4842808cca50302cef1991', '病假一天', to_date('20-05-2015 09:44:00', 'dd-mm-yyyy hh24:mi:ss'), to_date('21-05-2015 09:44:00', 'dd-mm-yyyy hh24:mi:ss'), '病假');
insert into OA_LEAVE (id, createdate, createuser, updatedate, updateuser, bindid, reason, starttime, endtime, leavetype)
values ('190c68ed6b0d451182a05aaaf08d80f3', to_date('20-05-2015 10:29:37', 'dd-mm-yyyy hh24:mi:ss'), 'system', to_date('20-05-2015 10:32:20', 'dd-mm-yyyy hh24:mi:ss'), 'system', 'd3153729fb8b4f91aa7e141e936a28e1', '再请病假~123', to_date('20-05-2015 10:29:00', 'dd-mm-yyyy hh24:mi:ss'), to_date('21-05-2015 10:30:00', 'dd-mm-yyyy hh24:mi:ss'), '病假');
insert into OA_LEAVE (id, createdate, createuser, updatedate, updateuser, bindid, reason, starttime, endtime, leavetype)
values ('2c76e6d5a70e4b4689dd128129ee2509', to_date('20-05-2015 08:52:22', 'dd-mm-yyyy hh24:mi:ss'), 'system', to_date('20-05-2015 09:28:23', 'dd-mm-yyyy hh24:mi:ss'), 'system', 'c57bf5653f614c4ebf50001532009c51', '生病请假三天。', to_date('20-05-2015 09:28:00', 'dd-mm-yyyy hh24:mi:ss'), to_date('22-05-2015 09:28:00', 'dd-mm-yyyy hh24:mi:ss'), '病假');
commit;
insert into SYS_DEPARTMENT (id, parentid, sequence, name, code)
values ('00000000000000000000000000000000', 'ffffffffffffffffffffffffffffffff', 1, '部门管理', '001');
insert into SYS_DEPARTMENT (id, parentid, sequence, name, code)
values ('b41c66947b7f4577968d4249c3c52a85', '00000000000000000000000000000000', 0, '系统管理', '003');
insert into SYS_DEPARTMENT (id, parentid, sequence, name, code)
values ('dad8faf2f3eb4d279ef04decb91ca4c0', 'b41c66947b7f4577968d4249c3c52a85', 0, '超级系统管理员', '001');
commit;
insert into SYS_MENU (id, parentid, name, url, sequence, icon, target)
values ('b3d67c1d94d7408f878d9c0726d9f09c', 'c617ec2d6eee475ea05fbe779ab3b7c8', '权限管理', '/sysPermission/showPageList.do', 7, '/', null);
insert into SYS_MENU (id, parentid, name, url, sequence, icon, target)
values ('9e189622e7944d899cbbbf6677892e9e', '863a29b9f37c45579f1666254d1b557c', '运行中流程管理', '/actProcess/showRunningPageList.do', 10, '/', '_blank');
insert into SYS_MENU (id, parentid, name, url, sequence, icon, target)
values ('18e69a5a441a4f8da3d0e4e13f01de9b', '863a29b9f37c45579f1666254d1b557c', '流程模型', '/actModel/showPageList.do', 0, '/', '_blank');
insert into SYS_MENU (id, parentid, name, url, sequence, icon, target)
values ('e293c0ce48354d1896934700e1f0282c', 'c617ec2d6eee475ea05fbe779ab3b7c8', '模块管理', '/sysModule/showPageList.do', 3, '/', '_blank');
insert into SYS_MENU (id, parentid, name, url, sequence, icon, target)
values ('dba5fbee0097464f92e3abac9d0372c1', '863a29b9f37c45579f1666254d1b557c', '流程管理', '/actProcess/showPageList.do', 5, '/', '_blank');
insert into SYS_MENU (id, parentid, name, url, sequence, icon, target)
values ('00000000000000000000000000000000', 'ffffffffffffffffffffffffffffffff', '导航菜单', '/', 1, '/', null);
insert into SYS_MENU (id, parentid, name, url, sequence, icon, target)
values ('08e27f9288d04c7a8839dc65f6cbd1fa', 'c617ec2d6eee475ea05fbe779ab3b7c8', '用户管理', '/sysUser/showPageList.do', 10, '/', null);
insert into SYS_MENU (id, parentid, name, url, sequence, icon, target)
values ('0a0bf010a2e54ee5a82d0d2fe3708d2f', 'c617ec2d6eee475ea05fbe779ab3b7c8', '部门管理', '/sysDepartment/showPageList.do', 8, '/', null);
insert into SYS_MENU (id, parentid, name, url, sequence, icon, target)
values ('8bf056fec564462e9f6dd02d89630b9d', 'c617ec2d6eee475ea05fbe779ab3b7c8', '菜单管理', '/sysMenu/showPageList.do', 1, '/', null);
insert into SYS_MENU (id, parentid, name, url, sequence, icon, target)
values ('935acd7355634b278549b0ebbba01876', 'c617ec2d6eee475ea05fbe779ab3b7c8', '角色管理', '/sysRole/showPageList.do', 5, '/', null);
insert into SYS_MENU (id, parentid, name, url, sequence, icon, target)
values ('c617ec2d6eee475ea05fbe779ab3b7c8', '00000000000000000000000000000000', '系统管理', '/', 99, '/', null);
insert into SYS_MENU (id, parentid, name, url, sequence, icon, target)
values ('863a29b9f37c45579f1666254d1b557c', '00000000000000000000000000000000', '流程建模', '/', 88, '/', '_blank');
insert into SYS_MENU (id, parentid, name, url, sequence, icon, target)
values ('61102bf49a004196ba0fb418ed1929e3', '00000000000000000000000000000000', 'OA办公', '/', 77, '/', '_blank');
insert into SYS_MENU (id, parentid, name, url, sequence, icon, target)
values ('5d2d5ddfd20f4783938fe636eedb5b37', '61102bf49a004196ba0fb418ed1929e3', '请假流程', '/oa/leave/list.do', 0, '/', '_blank');
insert into SYS_MENU (id, parentid, name, url, sequence, icon, target)
values ('035c58f70576403e9c31767469b15258', '61102bf49a004196ba0fb418ed1929e3', '请假待办流程', '/oa/leave/list/task.do', 5, '/', '_blank');
commit;
insert into SYS_MODULE (id, name, shiro)
values ('7466722e008349cfb7ed1d034b856bad', 'sysRoleMenu', 'sysRoleMenu');
insert into SYS_MODULE (id, name, shiro)
values ('0cc19fd4409a4d8b832a02584b15e45f', 'sysRoleModule', 'sysRoleModule');
insert into SYS_MODULE (id, name, shiro)
values ('3570d90302404b769704bd810ea3696a', 'sysUserRole', 'sysUserRole');
insert into SYS_MODULE (id, name, shiro)
values ('ddc3b32e4fae473e82a69a28c41a6b48', 'sysModulePermission', 'sysModulePermission');
insert into SYS_MODULE (id, name, shiro)
values ('7d741c551b984b7bb776e742090d076f', 'sysRole', 'sysRole');
insert into SYS_MODULE (id, name, shiro)
values ('2b5d24bdb8b6413e9a1b2fb2e12437a6', 'sysPermission', 'sysPermission');
insert into SYS_MODULE (id, name, shiro)
values ('8996fada7b6542779535357d7eee8197', 'sysUser', 'sysUser');
insert into SYS_MODULE (id, name, shiro)
values ('bce58ffd35774b91a6ffc6c690d22d34', 'sysMenu', 'sysMenu');
insert into SYS_MODULE (id, name, shiro)
values ('465292ff14d64226ada2b34cf4826a2e', 'actModel', 'actModel');
insert into SYS_MODULE (id, name, shiro)
values ('8b92453ba86642478dca3aa7ee9106c2', 'sysDepartment', 'sysDepartment');
insert into SYS_MODULE (id, name, shiro)
values ('6267cc893dcf47c2b41279e52bc5fa73', 'sysModule', 'sysModule');
insert into SYS_MODULE (id, name, shiro)
values ('e0ca626efde34ad788365f020094e22d', 'actProcess', 'actProcess');
insert into SYS_MODULE (id, name, shiro)
values ('1eb16f4188dd451d9287116214bf215a', 'actTask', 'actTask');
insert into SYS_MODULE (id, name, shiro)
values ('60663fd923564eb3b4c9b7e9a37aadf6', 'oa:leave', 'oa:leave');
commit;
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('0cc19fd4409a4d8b832a02584b15e45f', 'build');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('0cc19fd4409a4d8b832a02584b15e45f', 'create');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('0cc19fd4409a4d8b832a02584b15e45f', 'delete');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('0cc19fd4409a4d8b832a02584b15e45f', 'deploy');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('0cc19fd4409a4d8b832a02584b15e45f', 'download');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('0cc19fd4409a4d8b832a02584b15e45f', 'drop');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('0cc19fd4409a4d8b832a02584b15e45f', 'export');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('0cc19fd4409a4d8b832a02584b15e45f', 'import');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('0cc19fd4409a4d8b832a02584b15e45f', 'insert');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('0cc19fd4409a4d8b832a02584b15e45f', 'print');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('0cc19fd4409a4d8b832a02584b15e45f', 'select');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('0cc19fd4409a4d8b832a02584b15e45f', 'update');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('0cc19fd4409a4d8b832a02584b15e45f', 'upload');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('0cc19fd4409a4d8b832a02584b15e45f', 'view');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('1eb16f4188dd451d9287116214bf215a', 'build');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('1eb16f4188dd451d9287116214bf215a', 'create');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('1eb16f4188dd451d9287116214bf215a', 'delete');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('1eb16f4188dd451d9287116214bf215a', 'deploy');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('1eb16f4188dd451d9287116214bf215a', 'download');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('1eb16f4188dd451d9287116214bf215a', 'drop');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('1eb16f4188dd451d9287116214bf215a', 'export');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('1eb16f4188dd451d9287116214bf215a', 'import');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('1eb16f4188dd451d9287116214bf215a', 'insert');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('1eb16f4188dd451d9287116214bf215a', 'print');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('1eb16f4188dd451d9287116214bf215a', 'select');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('1eb16f4188dd451d9287116214bf215a', 'update');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('1eb16f4188dd451d9287116214bf215a', 'upload');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('1eb16f4188dd451d9287116214bf215a', 'view');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('2b5d24bdb8b6413e9a1b2fb2e12437a6', 'build');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('2b5d24bdb8b6413e9a1b2fb2e12437a6', 'create');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('2b5d24bdb8b6413e9a1b2fb2e12437a6', 'delete');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('2b5d24bdb8b6413e9a1b2fb2e12437a6', 'deploy');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('2b5d24bdb8b6413e9a1b2fb2e12437a6', 'download');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('2b5d24bdb8b6413e9a1b2fb2e12437a6', 'drop');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('2b5d24bdb8b6413e9a1b2fb2e12437a6', 'export');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('2b5d24bdb8b6413e9a1b2fb2e12437a6', 'import');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('2b5d24bdb8b6413e9a1b2fb2e12437a6', 'insert');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('2b5d24bdb8b6413e9a1b2fb2e12437a6', 'print');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('2b5d24bdb8b6413e9a1b2fb2e12437a6', 'select');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('2b5d24bdb8b6413e9a1b2fb2e12437a6', 'update');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('2b5d24bdb8b6413e9a1b2fb2e12437a6', 'upload');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('2b5d24bdb8b6413e9a1b2fb2e12437a6', 'view');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('3570d90302404b769704bd810ea3696a', 'build');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('3570d90302404b769704bd810ea3696a', 'create');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('3570d90302404b769704bd810ea3696a', 'delete');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('3570d90302404b769704bd810ea3696a', 'deploy');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('3570d90302404b769704bd810ea3696a', 'download');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('3570d90302404b769704bd810ea3696a', 'drop');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('3570d90302404b769704bd810ea3696a', 'export');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('3570d90302404b769704bd810ea3696a', 'import');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('3570d90302404b769704bd810ea3696a', 'insert');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('3570d90302404b769704bd810ea3696a', 'print');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('3570d90302404b769704bd810ea3696a', 'select');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('3570d90302404b769704bd810ea3696a', 'update');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('3570d90302404b769704bd810ea3696a', 'upload');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('3570d90302404b769704bd810ea3696a', 'view');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('465292ff14d64226ada2b34cf4826a2e', 'build');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('465292ff14d64226ada2b34cf4826a2e', 'create');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('465292ff14d64226ada2b34cf4826a2e', 'delete');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('465292ff14d64226ada2b34cf4826a2e', 'deploy');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('465292ff14d64226ada2b34cf4826a2e', 'download');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('465292ff14d64226ada2b34cf4826a2e', 'drop');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('465292ff14d64226ada2b34cf4826a2e', 'export');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('465292ff14d64226ada2b34cf4826a2e', 'import');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('465292ff14d64226ada2b34cf4826a2e', 'insert');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('465292ff14d64226ada2b34cf4826a2e', 'print');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('465292ff14d64226ada2b34cf4826a2e', 'select');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('465292ff14d64226ada2b34cf4826a2e', 'update');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('465292ff14d64226ada2b34cf4826a2e', 'upload');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('465292ff14d64226ada2b34cf4826a2e', 'view');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('60663fd923564eb3b4c9b7e9a37aadf6', 'build');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('60663fd923564eb3b4c9b7e9a37aadf6', 'create');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('60663fd923564eb3b4c9b7e9a37aadf6', 'delete');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('60663fd923564eb3b4c9b7e9a37aadf6', 'deploy');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('60663fd923564eb3b4c9b7e9a37aadf6', 'download');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('60663fd923564eb3b4c9b7e9a37aadf6', 'drop');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('60663fd923564eb3b4c9b7e9a37aadf6', 'export');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('60663fd923564eb3b4c9b7e9a37aadf6', 'import');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('60663fd923564eb3b4c9b7e9a37aadf6', 'insert');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('60663fd923564eb3b4c9b7e9a37aadf6', 'print');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('60663fd923564eb3b4c9b7e9a37aadf6', 'select');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('60663fd923564eb3b4c9b7e9a37aadf6', 'update');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('60663fd923564eb3b4c9b7e9a37aadf6', 'upload');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('60663fd923564eb3b4c9b7e9a37aadf6', 'view');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('6267cc893dcf47c2b41279e52bc5fa73', 'build');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('6267cc893dcf47c2b41279e52bc5fa73', 'create');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('6267cc893dcf47c2b41279e52bc5fa73', 'delete');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('6267cc893dcf47c2b41279e52bc5fa73', 'deploy');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('6267cc893dcf47c2b41279e52bc5fa73', 'download');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('6267cc893dcf47c2b41279e52bc5fa73', 'drop');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('6267cc893dcf47c2b41279e52bc5fa73', 'export');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('6267cc893dcf47c2b41279e52bc5fa73', 'import');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('6267cc893dcf47c2b41279e52bc5fa73', 'insert');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('6267cc893dcf47c2b41279e52bc5fa73', 'print');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('6267cc893dcf47c2b41279e52bc5fa73', 'select');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('6267cc893dcf47c2b41279e52bc5fa73', 'update');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('6267cc893dcf47c2b41279e52bc5fa73', 'upload');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('6267cc893dcf47c2b41279e52bc5fa73', 'view');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('7466722e008349cfb7ed1d034b856bad', 'build');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('7466722e008349cfb7ed1d034b856bad', 'create');
commit;
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('7466722e008349cfb7ed1d034b856bad', 'delete');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('7466722e008349cfb7ed1d034b856bad', 'deploy');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('7466722e008349cfb7ed1d034b856bad', 'download');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('7466722e008349cfb7ed1d034b856bad', 'drop');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('7466722e008349cfb7ed1d034b856bad', 'export');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('7466722e008349cfb7ed1d034b856bad', 'import');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('7466722e008349cfb7ed1d034b856bad', 'insert');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('7466722e008349cfb7ed1d034b856bad', 'print');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('7466722e008349cfb7ed1d034b856bad', 'select');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('7466722e008349cfb7ed1d034b856bad', 'update');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('7466722e008349cfb7ed1d034b856bad', 'upload');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('7466722e008349cfb7ed1d034b856bad', 'view');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('7d741c551b984b7bb776e742090d076f', 'build');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('7d741c551b984b7bb776e742090d076f', 'create');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('7d741c551b984b7bb776e742090d076f', 'delete');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('7d741c551b984b7bb776e742090d076f', 'deploy');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('7d741c551b984b7bb776e742090d076f', 'download');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('7d741c551b984b7bb776e742090d076f', 'drop');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('7d741c551b984b7bb776e742090d076f', 'export');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('7d741c551b984b7bb776e742090d076f', 'import');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('7d741c551b984b7bb776e742090d076f', 'insert');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('7d741c551b984b7bb776e742090d076f', 'print');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('7d741c551b984b7bb776e742090d076f', 'select');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('7d741c551b984b7bb776e742090d076f', 'update');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('7d741c551b984b7bb776e742090d076f', 'upload');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('7d741c551b984b7bb776e742090d076f', 'view');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('8996fada7b6542779535357d7eee8197', 'build');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('8996fada7b6542779535357d7eee8197', 'create');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('8996fada7b6542779535357d7eee8197', 'delete');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('8996fada7b6542779535357d7eee8197', 'deploy');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('8996fada7b6542779535357d7eee8197', 'download');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('8996fada7b6542779535357d7eee8197', 'drop');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('8996fada7b6542779535357d7eee8197', 'export');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('8996fada7b6542779535357d7eee8197', 'import');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('8996fada7b6542779535357d7eee8197', 'insert');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('8996fada7b6542779535357d7eee8197', 'print');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('8996fada7b6542779535357d7eee8197', 'select');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('8996fada7b6542779535357d7eee8197', 'update');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('8996fada7b6542779535357d7eee8197', 'upload');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('8996fada7b6542779535357d7eee8197', 'view');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('8b92453ba86642478dca3aa7ee9106c2', 'build');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('8b92453ba86642478dca3aa7ee9106c2', 'create');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('8b92453ba86642478dca3aa7ee9106c2', 'delete');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('8b92453ba86642478dca3aa7ee9106c2', 'deploy');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('8b92453ba86642478dca3aa7ee9106c2', 'download');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('8b92453ba86642478dca3aa7ee9106c2', 'drop');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('8b92453ba86642478dca3aa7ee9106c2', 'export');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('8b92453ba86642478dca3aa7ee9106c2', 'import');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('8b92453ba86642478dca3aa7ee9106c2', 'insert');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('8b92453ba86642478dca3aa7ee9106c2', 'print');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('8b92453ba86642478dca3aa7ee9106c2', 'select');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('8b92453ba86642478dca3aa7ee9106c2', 'update');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('8b92453ba86642478dca3aa7ee9106c2', 'upload');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('8b92453ba86642478dca3aa7ee9106c2', 'view');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('bce58ffd35774b91a6ffc6c690d22d34', 'build');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('bce58ffd35774b91a6ffc6c690d22d34', 'create');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('bce58ffd35774b91a6ffc6c690d22d34', 'delete');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('bce58ffd35774b91a6ffc6c690d22d34', 'deploy');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('bce58ffd35774b91a6ffc6c690d22d34', 'download');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('bce58ffd35774b91a6ffc6c690d22d34', 'drop');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('bce58ffd35774b91a6ffc6c690d22d34', 'export');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('bce58ffd35774b91a6ffc6c690d22d34', 'import');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('bce58ffd35774b91a6ffc6c690d22d34', 'insert');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('bce58ffd35774b91a6ffc6c690d22d34', 'print');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('bce58ffd35774b91a6ffc6c690d22d34', 'select');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('bce58ffd35774b91a6ffc6c690d22d34', 'update');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('bce58ffd35774b91a6ffc6c690d22d34', 'upload');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('bce58ffd35774b91a6ffc6c690d22d34', 'view');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('ddc3b32e4fae473e82a69a28c41a6b48', 'build');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('ddc3b32e4fae473e82a69a28c41a6b48', 'create');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('ddc3b32e4fae473e82a69a28c41a6b48', 'delete');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('ddc3b32e4fae473e82a69a28c41a6b48', 'deploy');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('ddc3b32e4fae473e82a69a28c41a6b48', 'download');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('ddc3b32e4fae473e82a69a28c41a6b48', 'drop');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('ddc3b32e4fae473e82a69a28c41a6b48', 'export');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('ddc3b32e4fae473e82a69a28c41a6b48', 'import');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('ddc3b32e4fae473e82a69a28c41a6b48', 'insert');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('ddc3b32e4fae473e82a69a28c41a6b48', 'print');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('ddc3b32e4fae473e82a69a28c41a6b48', 'select');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('ddc3b32e4fae473e82a69a28c41a6b48', 'update');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('ddc3b32e4fae473e82a69a28c41a6b48', 'upload');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('ddc3b32e4fae473e82a69a28c41a6b48', 'view');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('e0ca626efde34ad788365f020094e22d', 'build');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('e0ca626efde34ad788365f020094e22d', 'create');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('e0ca626efde34ad788365f020094e22d', 'delete');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('e0ca626efde34ad788365f020094e22d', 'deploy');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('e0ca626efde34ad788365f020094e22d', 'download');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('e0ca626efde34ad788365f020094e22d', 'drop');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('e0ca626efde34ad788365f020094e22d', 'export');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('e0ca626efde34ad788365f020094e22d', 'import');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('e0ca626efde34ad788365f020094e22d', 'insert');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('e0ca626efde34ad788365f020094e22d', 'print');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('e0ca626efde34ad788365f020094e22d', 'select');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('e0ca626efde34ad788365f020094e22d', 'update');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('e0ca626efde34ad788365f020094e22d', 'upload');
insert into SYS_MODULE_PERMISSION (moduleid, permissionid)
values ('e0ca626efde34ad788365f020094e22d', 'view');
commit;
insert into SYS_PERMISSION (id, sequence, name)
values ('view', 1, '展示');
insert into SYS_PERMISSION (id, sequence, name)
values ('select', 2, '查询');
insert into SYS_PERMISSION (id, sequence, name)
values ('insert', 3, '插入');
insert into SYS_PERMISSION (id, sequence, name)
values ('update', 4, '修改');
insert into SYS_PERMISSION (id, sequence, name)
values ('delete', 5, '删除');
insert into SYS_PERMISSION (id, sequence, name)
values ('import', 6, '导入');
insert into SYS_PERMISSION (id, sequence, name)
values ('export', 7, '导出');
insert into SYS_PERMISSION (id, sequence, name)
values ('print', 10, '打印');
insert into SYS_PERMISSION (id, sequence, name)
values ('create', 11, '创建');
insert into SYS_PERMISSION (id, sequence, name)
values ('drop', 12, '销毁');
insert into SYS_PERMISSION (id, sequence, name)
values ('build', 13, '同步');
insert into SYS_PERMISSION (id, sequence, name)
values ('download', 9, '下载');
insert into SYS_PERMISSION (id, sequence, name)
values ('upload', 8, '上传');
insert into SYS_PERMISSION (id, sequence, name)
values ('deploy', 14, '部署');
commit;
insert into SYS_ROLE (id, name, shiro)
values ('233e1814d0484ae6ad600a84ae8b2a1b', '员工', 'employee');
insert into SYS_ROLE (id, name, shiro)
values ('d3f34652eb03447b9cc8bb7375df675d', '系统管理员', 'sys');
insert into SYS_ROLE (id, name, shiro)
values ('e015765dbaf1429fa34bbff7eb4e9b79', '经理', 'deptmanager');
insert into SYS_ROLE (id, name, shiro)
values ('4bb7b95168a04cb6885d31dc583cde40', '人事', 'hrmanager');
commit;
insert into SYS_ROLE_MENU (roleid, menuid)
values ('233e1814d0484ae6ad600a84ae8b2a1b', '00000000000000000000000000000000');
insert into SYS_ROLE_MENU (roleid, menuid)
values ('233e1814d0484ae6ad600a84ae8b2a1b', '035c58f70576403e9c31767469b15258');
insert into SYS_ROLE_MENU (roleid, menuid)
values ('233e1814d0484ae6ad600a84ae8b2a1b', '08e27f9288d04c7a8839dc65f6cbd1fa');
insert into SYS_ROLE_MENU (roleid, menuid)
values ('233e1814d0484ae6ad600a84ae8b2a1b', '0a0bf010a2e54ee5a82d0d2fe3708d2f');
insert into SYS_ROLE_MENU (roleid, menuid)
values ('233e1814d0484ae6ad600a84ae8b2a1b', '18e69a5a441a4f8da3d0e4e13f01de9b');
insert into SYS_ROLE_MENU (roleid, menuid)
values ('233e1814d0484ae6ad600a84ae8b2a1b', '5d2d5ddfd20f4783938fe636eedb5b37');
insert into SYS_ROLE_MENU (roleid, menuid)
values ('233e1814d0484ae6ad600a84ae8b2a1b', '61102bf49a004196ba0fb418ed1929e3');
insert into SYS_ROLE_MENU (roleid, menuid)
values ('233e1814d0484ae6ad600a84ae8b2a1b', '614408a7ec044cd5b1f7b5990460e605');
insert into SYS_ROLE_MENU (roleid, menuid)
values ('233e1814d0484ae6ad600a84ae8b2a1b', '863a29b9f37c45579f1666254d1b557c');
insert into SYS_ROLE_MENU (roleid, menuid)
values ('233e1814d0484ae6ad600a84ae8b2a1b', '8bf056fec564462e9f6dd02d89630b9d');
insert into SYS_ROLE_MENU (roleid, menuid)
values ('233e1814d0484ae6ad600a84ae8b2a1b', '935acd7355634b278549b0ebbba01876');
insert into SYS_ROLE_MENU (roleid, menuid)
values ('233e1814d0484ae6ad600a84ae8b2a1b', '9e189622e7944d899cbbbf6677892e9e');
insert into SYS_ROLE_MENU (roleid, menuid)
values ('233e1814d0484ae6ad600a84ae8b2a1b', 'b3d67c1d94d7408f878d9c0726d9f09c');
insert into SYS_ROLE_MENU (roleid, menuid)
values ('233e1814d0484ae6ad600a84ae8b2a1b', 'c617ec2d6eee475ea05fbe779ab3b7c8');
insert into SYS_ROLE_MENU (roleid, menuid)
values ('233e1814d0484ae6ad600a84ae8b2a1b', 'dba5fbee0097464f92e3abac9d0372c1');
insert into SYS_ROLE_MENU (roleid, menuid)
values ('233e1814d0484ae6ad600a84ae8b2a1b', 'e293c0ce48354d1896934700e1f0282c');
insert into SYS_ROLE_MENU (roleid, menuid)
values ('4bb7b95168a04cb6885d31dc583cde40', '00000000000000000000000000000000');
insert into SYS_ROLE_MENU (roleid, menuid)
values ('4bb7b95168a04cb6885d31dc583cde40', '035c58f70576403e9c31767469b15258');
insert into SYS_ROLE_MENU (roleid, menuid)
values ('4bb7b95168a04cb6885d31dc583cde40', '08e27f9288d04c7a8839dc65f6cbd1fa');
insert into SYS_ROLE_MENU (roleid, menuid)
values ('4bb7b95168a04cb6885d31dc583cde40', '0a0bf010a2e54ee5a82d0d2fe3708d2f');
insert into SYS_ROLE_MENU (roleid, menuid)
values ('4bb7b95168a04cb6885d31dc583cde40', '18e69a5a441a4f8da3d0e4e13f01de9b');
insert into SYS_ROLE_MENU (roleid, menuid)
values ('4bb7b95168a04cb6885d31dc583cde40', '5d2d5ddfd20f4783938fe636eedb5b37');
insert into SYS_ROLE_MENU (roleid, menuid)
values ('4bb7b95168a04cb6885d31dc583cde40', '61102bf49a004196ba0fb418ed1929e3');
insert into SYS_ROLE_MENU (roleid, menuid)
values ('4bb7b95168a04cb6885d31dc583cde40', '614408a7ec044cd5b1f7b5990460e605');
insert into SYS_ROLE_MENU (roleid, menuid)
values ('4bb7b95168a04cb6885d31dc583cde40', '863a29b9f37c45579f1666254d1b557c');
insert into SYS_ROLE_MENU (roleid, menuid)
values ('4bb7b95168a04cb6885d31dc583cde40', '8bf056fec564462e9f6dd02d89630b9d');
insert into SYS_ROLE_MENU (roleid, menuid)
values ('4bb7b95168a04cb6885d31dc583cde40', '935acd7355634b278549b0ebbba01876');
insert into SYS_ROLE_MENU (roleid, menuid)
values ('4bb7b95168a04cb6885d31dc583cde40', '9e189622e7944d899cbbbf6677892e9e');
insert into SYS_ROLE_MENU (roleid, menuid)
values ('4bb7b95168a04cb6885d31dc583cde40', 'b3d67c1d94d7408f878d9c0726d9f09c');
insert into SYS_ROLE_MENU (roleid, menuid)
values ('4bb7b95168a04cb6885d31dc583cde40', 'c617ec2d6eee475ea05fbe779ab3b7c8');
insert into SYS_ROLE_MENU (roleid, menuid)
values ('4bb7b95168a04cb6885d31dc583cde40', 'dba5fbee0097464f92e3abac9d0372c1');
insert into SYS_ROLE_MENU (roleid, menuid)
values ('4bb7b95168a04cb6885d31dc583cde40', 'e293c0ce48354d1896934700e1f0282c');
insert into SYS_ROLE_MENU (roleid, menuid)
values ('d3f34652eb03447b9cc8bb7375df675d', '00000000000000000000000000000000');
insert into SYS_ROLE_MENU (roleid, menuid)
values ('d3f34652eb03447b9cc8bb7375df675d', '035c58f70576403e9c31767469b15258');
insert into SYS_ROLE_MENU (roleid, menuid)
values ('d3f34652eb03447b9cc8bb7375df675d', '08e27f9288d04c7a8839dc65f6cbd1fa');
insert into SYS_ROLE_MENU (roleid, menuid)
values ('d3f34652eb03447b9cc8bb7375df675d', '0a0bf010a2e54ee5a82d0d2fe3708d2f');
insert into SYS_ROLE_MENU (roleid, menuid)
values ('d3f34652eb03447b9cc8bb7375df675d', '18e69a5a441a4f8da3d0e4e13f01de9b');
insert into SYS_ROLE_MENU (roleid, menuid)
values ('d3f34652eb03447b9cc8bb7375df675d', '5d2d5ddfd20f4783938fe636eedb5b37');
insert into SYS_ROLE_MENU (roleid, menuid)
values ('d3f34652eb03447b9cc8bb7375df675d', '61102bf49a004196ba0fb418ed1929e3');
insert into SYS_ROLE_MENU (roleid, menuid)
values ('d3f34652eb03447b9cc8bb7375df675d', '614408a7ec044cd5b1f7b5990460e605');
insert into SYS_ROLE_MENU (roleid, menuid)
values ('d3f34652eb03447b9cc8bb7375df675d', '863a29b9f37c45579f1666254d1b557c');
insert into SYS_ROLE_MENU (roleid, menuid)
values ('d3f34652eb03447b9cc8bb7375df675d', '8bf056fec564462e9f6dd02d89630b9d');
insert into SYS_ROLE_MENU (roleid, menuid)
values ('d3f34652eb03447b9cc8bb7375df675d', '935acd7355634b278549b0ebbba01876');
insert into SYS_ROLE_MENU (roleid, menuid)
values ('d3f34652eb03447b9cc8bb7375df675d', '9e189622e7944d899cbbbf6677892e9e');
insert into SYS_ROLE_MENU (roleid, menuid)
values ('d3f34652eb03447b9cc8bb7375df675d', 'b3d67c1d94d7408f878d9c0726d9f09c');
insert into SYS_ROLE_MENU (roleid, menuid)
values ('d3f34652eb03447b9cc8bb7375df675d', 'c617ec2d6eee475ea05fbe779ab3b7c8');
insert into SYS_ROLE_MENU (roleid, menuid)
values ('d3f34652eb03447b9cc8bb7375df675d', 'dba5fbee0097464f92e3abac9d0372c1');
insert into SYS_ROLE_MENU (roleid, menuid)
values ('d3f34652eb03447b9cc8bb7375df675d', 'e293c0ce48354d1896934700e1f0282c');
insert into SYS_ROLE_MENU (roleid, menuid)
values ('e015765dbaf1429fa34bbff7eb4e9b79', '035c58f70576403e9c31767469b15258');
insert into SYS_ROLE_MENU (roleid, menuid)
values ('e015765dbaf1429fa34bbff7eb4e9b79', '5d2d5ddfd20f4783938fe636eedb5b37');
insert into SYS_ROLE_MENU (roleid, menuid)
values ('e015765dbaf1429fa34bbff7eb4e9b79', '61102bf49a004196ba0fb418ed1929e3');
commit;
insert into SYS_ROLE_MODULE (roleid, moduleid)
values ('233e1814d0484ae6ad600a84ae8b2a1b', '0cc19fd4409a4d8b832a02584b15e45f');
insert into SYS_ROLE_MODULE (roleid, moduleid)
values ('233e1814d0484ae6ad600a84ae8b2a1b', '1eb16f4188dd451d9287116214bf215a');
insert into SYS_ROLE_MODULE (roleid, moduleid)
values ('233e1814d0484ae6ad600a84ae8b2a1b', '2b5d24bdb8b6413e9a1b2fb2e12437a6');
insert into SYS_ROLE_MODULE (roleid, moduleid)
values ('233e1814d0484ae6ad600a84ae8b2a1b', '3570d90302404b769704bd810ea3696a');
insert into SYS_ROLE_MODULE (roleid, moduleid)
values ('233e1814d0484ae6ad600a84ae8b2a1b', '465292ff14d64226ada2b34cf4826a2e');
insert into SYS_ROLE_MODULE (roleid, moduleid)
values ('233e1814d0484ae6ad600a84ae8b2a1b', '60663fd923564eb3b4c9b7e9a37aadf6');
insert into SYS_ROLE_MODULE (roleid, moduleid)
values ('233e1814d0484ae6ad600a84ae8b2a1b', '6267cc893dcf47c2b41279e52bc5fa73');
insert into SYS_ROLE_MODULE (roleid, moduleid)
values ('233e1814d0484ae6ad600a84ae8b2a1b', '7466722e008349cfb7ed1d034b856bad');
insert into SYS_ROLE_MODULE (roleid, moduleid)
values ('233e1814d0484ae6ad600a84ae8b2a1b', '7d741c551b984b7bb776e742090d076f');
insert into SYS_ROLE_MODULE (roleid, moduleid)
values ('233e1814d0484ae6ad600a84ae8b2a1b', '8996fada7b6542779535357d7eee8197');
insert into SYS_ROLE_MODULE (roleid, moduleid)
values ('233e1814d0484ae6ad600a84ae8b2a1b', '8b92453ba86642478dca3aa7ee9106c2');
insert into SYS_ROLE_MODULE (roleid, moduleid)
values ('233e1814d0484ae6ad600a84ae8b2a1b', 'bce58ffd35774b91a6ffc6c690d22d34');
insert into SYS_ROLE_MODULE (roleid, moduleid)
values ('233e1814d0484ae6ad600a84ae8b2a1b', 'ddc3b32e4fae473e82a69a28c41a6b48');
insert into SYS_ROLE_MODULE (roleid, moduleid)
values ('233e1814d0484ae6ad600a84ae8b2a1b', 'e0ca626efde34ad788365f020094e22d');
insert into SYS_ROLE_MODULE (roleid, moduleid)
values ('4bb7b95168a04cb6885d31dc583cde40', '0cc19fd4409a4d8b832a02584b15e45f');
insert into SYS_ROLE_MODULE (roleid, moduleid)
values ('4bb7b95168a04cb6885d31dc583cde40', '1eb16f4188dd451d9287116214bf215a');
insert into SYS_ROLE_MODULE (roleid, moduleid)
values ('4bb7b95168a04cb6885d31dc583cde40', '2b5d24bdb8b6413e9a1b2fb2e12437a6');
insert into SYS_ROLE_MODULE (roleid, moduleid)
values ('4bb7b95168a04cb6885d31dc583cde40', '3570d90302404b769704bd810ea3696a');
insert into SYS_ROLE_MODULE (roleid, moduleid)
values ('4bb7b95168a04cb6885d31dc583cde40', '465292ff14d64226ada2b34cf4826a2e');
insert into SYS_ROLE_MODULE (roleid, moduleid)
values ('4bb7b95168a04cb6885d31dc583cde40', '60663fd923564eb3b4c9b7e9a37aadf6');
insert into SYS_ROLE_MODULE (roleid, moduleid)
values ('4bb7b95168a04cb6885d31dc583cde40', '6267cc893dcf47c2b41279e52bc5fa73');
insert into SYS_ROLE_MODULE (roleid, moduleid)
values ('4bb7b95168a04cb6885d31dc583cde40', '7466722e008349cfb7ed1d034b856bad');
insert into SYS_ROLE_MODULE (roleid, moduleid)
values ('4bb7b95168a04cb6885d31dc583cde40', '7d741c551b984b7bb776e742090d076f');
insert into SYS_ROLE_MODULE (roleid, moduleid)
values ('4bb7b95168a04cb6885d31dc583cde40', '8996fada7b6542779535357d7eee8197');
insert into SYS_ROLE_MODULE (roleid, moduleid)
values ('4bb7b95168a04cb6885d31dc583cde40', '8b92453ba86642478dca3aa7ee9106c2');
insert into SYS_ROLE_MODULE (roleid, moduleid)
values ('4bb7b95168a04cb6885d31dc583cde40', 'bce58ffd35774b91a6ffc6c690d22d34');
insert into SYS_ROLE_MODULE (roleid, moduleid)
values ('4bb7b95168a04cb6885d31dc583cde40', 'ddc3b32e4fae473e82a69a28c41a6b48');
insert into SYS_ROLE_MODULE (roleid, moduleid)
values ('4bb7b95168a04cb6885d31dc583cde40', 'e0ca626efde34ad788365f020094e22d');
insert into SYS_ROLE_MODULE (roleid, moduleid)
values ('d3f34652eb03447b9cc8bb7375df675d', '0cc19fd4409a4d8b832a02584b15e45f');
insert into SYS_ROLE_MODULE (roleid, moduleid)
values ('d3f34652eb03447b9cc8bb7375df675d', '1eb16f4188dd451d9287116214bf215a');
insert into SYS_ROLE_MODULE (roleid, moduleid)
values ('d3f34652eb03447b9cc8bb7375df675d', '2b5d24bdb8b6413e9a1b2fb2e12437a6');
insert into SYS_ROLE_MODULE (roleid, moduleid)
values ('d3f34652eb03447b9cc8bb7375df675d', '3570d90302404b769704bd810ea3696a');
insert into SYS_ROLE_MODULE (roleid, moduleid)
values ('d3f34652eb03447b9cc8bb7375df675d', '465292ff14d64226ada2b34cf4826a2e');
insert into SYS_ROLE_MODULE (roleid, moduleid)
values ('d3f34652eb03447b9cc8bb7375df675d', '60663fd923564eb3b4c9b7e9a37aadf6');
insert into SYS_ROLE_MODULE (roleid, moduleid)
values ('d3f34652eb03447b9cc8bb7375df675d', '6267cc893dcf47c2b41279e52bc5fa73');
insert into SYS_ROLE_MODULE (roleid, moduleid)
values ('d3f34652eb03447b9cc8bb7375df675d', '7466722e008349cfb7ed1d034b856bad');
insert into SYS_ROLE_MODULE (roleid, moduleid)
values ('d3f34652eb03447b9cc8bb7375df675d', '7d741c551b984b7bb776e742090d076f');
insert into SYS_ROLE_MODULE (roleid, moduleid)
values ('d3f34652eb03447b9cc8bb7375df675d', '8996fada7b6542779535357d7eee8197');
insert into SYS_ROLE_MODULE (roleid, moduleid)
values ('d3f34652eb03447b9cc8bb7375df675d', '8b92453ba86642478dca3aa7ee9106c2');
insert into SYS_ROLE_MODULE (roleid, moduleid)
values ('d3f34652eb03447b9cc8bb7375df675d', 'bce58ffd35774b91a6ffc6c690d22d34');
insert into SYS_ROLE_MODULE (roleid, moduleid)
values ('d3f34652eb03447b9cc8bb7375df675d', 'ddc3b32e4fae473e82a69a28c41a6b48');
insert into SYS_ROLE_MODULE (roleid, moduleid)
values ('d3f34652eb03447b9cc8bb7375df675d', 'e0ca626efde34ad788365f020094e22d');
insert into SYS_ROLE_MODULE (roleid, moduleid)
values ('e015765dbaf1429fa34bbff7eb4e9b79', '0cc19fd4409a4d8b832a02584b15e45f');
insert into SYS_ROLE_MODULE (roleid, moduleid)
values ('e015765dbaf1429fa34bbff7eb4e9b79', '1eb16f4188dd451d9287116214bf215a');
insert into SYS_ROLE_MODULE (roleid, moduleid)
values ('e015765dbaf1429fa34bbff7eb4e9b79', '2b5d24bdb8b6413e9a1b2fb2e12437a6');
insert into SYS_ROLE_MODULE (roleid, moduleid)
values ('e015765dbaf1429fa34bbff7eb4e9b79', '3570d90302404b769704bd810ea3696a');
insert into SYS_ROLE_MODULE (roleid, moduleid)
values ('e015765dbaf1429fa34bbff7eb4e9b79', '465292ff14d64226ada2b34cf4826a2e');
insert into SYS_ROLE_MODULE (roleid, moduleid)
values ('e015765dbaf1429fa34bbff7eb4e9b79', '60663fd923564eb3b4c9b7e9a37aadf6');
insert into SYS_ROLE_MODULE (roleid, moduleid)
values ('e015765dbaf1429fa34bbff7eb4e9b79', '6267cc893dcf47c2b41279e52bc5fa73');
insert into SYS_ROLE_MODULE (roleid, moduleid)
values ('e015765dbaf1429fa34bbff7eb4e9b79', '7466722e008349cfb7ed1d034b856bad');
insert into SYS_ROLE_MODULE (roleid, moduleid)
values ('e015765dbaf1429fa34bbff7eb4e9b79', '7d741c551b984b7bb776e742090d076f');
insert into SYS_ROLE_MODULE (roleid, moduleid)
values ('e015765dbaf1429fa34bbff7eb4e9b79', '8996fada7b6542779535357d7eee8197');
insert into SYS_ROLE_MODULE (roleid, moduleid)
values ('e015765dbaf1429fa34bbff7eb4e9b79', '8b92453ba86642478dca3aa7ee9106c2');
insert into SYS_ROLE_MODULE (roleid, moduleid)
values ('e015765dbaf1429fa34bbff7eb4e9b79', 'bce58ffd35774b91a6ffc6c690d22d34');
insert into SYS_ROLE_MODULE (roleid, moduleid)
values ('e015765dbaf1429fa34bbff7eb4e9b79', 'ddc3b32e4fae473e82a69a28c41a6b48');
insert into SYS_ROLE_MODULE (roleid, moduleid)
values ('e015765dbaf1429fa34bbff7eb4e9b79', 'e0ca626efde34ad788365f020094e22d');
commit;
insert into SYS_USER (id, username, password, name, departmentid, state, email, phone)
values ('3a657ea8ddc745a698d51aeea2183f4d', 'system', 'c4ca86dead4518ac4fd6e30172db3d9e', '管理员', 'dad8faf2f3eb4d279ef04decb91ca4c0', '1', null, null);
insert into SYS_USER (id, username, password, name, departmentid, state, email, phone)
values ('1e995b4cf4c449afa6c31033b6786cef', 'dept', '41dab460432fd36459e9dd9cf33bb81b', '部门经理', 'b41c66947b7f4577968d4249c3c52a85', '1', null, null);
commit;
insert into SYS_USER_ROLE (userid, roleid)
values ('1e995b4cf4c449afa6c31033b6786cef', 'e015765dbaf1429fa34bbff7eb4e9b79');
insert into SYS_USER_ROLE (userid, roleid)
values ('3a657ea8ddc745a698d51aeea2183f4d', 'd3f34652eb03447b9cc8bb7375df675d');
commit;
alter table OA_LEAVE enable all triggers;
alter table SYS_DEPARTMENT enable all triggers;
alter table SYS_MENU enable all triggers;
alter table SYS_MODULE enable all triggers;
alter table SYS_MODULE_PERMISSION enable all triggers;
alter table SYS_PERMISSION enable all triggers;
alter table SYS_ROLE enable all triggers;
alter table SYS_ROLE_MENU enable all triggers;
alter table SYS_ROLE_MODULE enable all triggers;
alter table SYS_USER enable all triggers;
alter table SYS_USER_ROLE enable all triggers;
