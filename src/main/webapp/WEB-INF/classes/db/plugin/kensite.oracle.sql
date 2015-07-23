-- 日志表
CREATE TABLE sys_log
(
	id char(32) NOT NULL,
	type char(1) DEFAULT '1',
	title varchar2(500),
	createuser varchar2(64),
	createdate date,
	remote_addr varchar2(255),
	user_agent varchar2(255),
	request_uri varchar2(255),
	method varchar2(5),
	params varchar2(4000),
	exception clob,
	PRIMARY KEY (id)
);
COMMENT ON TABLE sys_log IS '日志表';
COMMENT ON COLUMN sys_log.id IS '主键';
COMMENT ON COLUMN sys_log.type IS '日志类型';
COMMENT ON COLUMN sys_log.title IS '日志标题';
COMMENT ON COLUMN sys_log.createuser IS '创建者';
COMMENT ON COLUMN sys_log.createdate IS '创建时间';
COMMENT ON COLUMN sys_log.remote_addr IS '操作用户的IP地址';
COMMENT ON COLUMN sys_log.user_agent IS '操作用户代理信息';
COMMENT ON COLUMN sys_log.request_uri IS '操作的URI';
COMMENT ON COLUMN sys_log.method IS '操作的方式';
COMMENT ON COLUMN sys_log.params IS '操作提交的数据';
COMMENT ON COLUMN sys_log.exception IS '异常信息';

-- 附件表
create table SYS_UPLOADFILE
(
  id         CHAR(32),
  viewname   VARCHAR2(100),
  realname   VARCHAR2(100),
  url        VARCHAR2(500),
  realurl    VARCHAR2(500),
  suffix     VARCHAR2(10),
  filesize   VARCHAR2(50),
  createdate DATE
)
;
-- Add comments to the table 
comment on table SYS_UPLOADFILE
  is '系统附件表';
-- Add comments to the columns 
comment on column SYS_UPLOADFILE.id
  is '主键';
comment on column SYS_UPLOADFILE.viewname
  is '文件原名';
comment on column SYS_UPLOADFILE.realname
  is '文件存储名';
comment on column SYS_UPLOADFILE.url
  is 'WEB访问路径';
comment on column SYS_UPLOADFILE.realurl
  is '服务器真实路径';
comment on column SYS_UPLOADFILE.suffix
  is '后缀名';
comment on column SYS_UPLOADFILE.filesize
  is '文件大小';
comment on column SYS_UPLOADFILE.createdate
  is '上传时间';

  
  -- Create table
create table sys_information
(
  id       char(32) not null,
  sendtime	date,
  content  varchar2(100),
  type     char(1),
  sender   varchar2(100),
  receiver varchar2(100),
  timeout  number default -1,
  status   number default 0
)
;
-- Add comments to the table 
comment on table sys_information
  is '系统消息';
-- Add comments to the columns 
comment on column sys_information.id
  is '主键';
comment on column sys_information.content
  is '发送时间';
comment on column sys_information.content
  is '消息内容';
comment on column sys_information.type
  is '消息类型';
comment on column sys_information.sender
  is '发送者';
comment on column sys_information.receiver
  is '接收者';
comment on column sys_information.timeout
  is '时效';
comment on column sys_information.status
  is '状态';
-- Create/Recreate primary, unique and foreign key constraints 
alter table sys_information
  add primary key (ID);

-- Create table
create table SYS_SKINS
(
  id    CHAR(32) not null,
  name  VARCHAR2(50),
  url   VARCHAR2(100),
  state VARCHAR2(1) default 0
)
;
-- Add comments to the table 
comment on table SYS_SKINS
  is '系统皮肤';
-- Add comments to the columns 
comment on column SYS_SKINS.id
  is '主键';
comment on column SYS_SKINS.name
  is '说明';
comment on column SYS_SKINS.url
  is '页面路径';
comment on column SYS_SKINS.state
  is '状态';
-- Create/Recreate primary, unique and foreign key constraints 
alter table SYS_SKINS
  add constraint SYS_SKINS_ID primary key (ID);
  
insert into SYS_SKINS (id, name, url, state)
values ('87871541b05e411ca5e8da15015c821f', 'XENON皮肤', 'skins/xenon/top_left_main', '0');
insert into SYS_SKINS (id, name, url, state)
values ('3df2a557ac47442889212395848b9213', 'EASYUI皮肤', 'skins/poor/main', '1');

-- Create table
create table SYS_DICT
(
  id          char(32) not null,
  value       varchar2(50),
  label       varchar2(50),
  category    varchar2(50),
  description varchar2(50),
  sequence    number(10) default 0,
  parentid    char(32)
)
;
-- Add comments to the table 
comment on table SYS_DICT
  is '系统字典';
-- Add comments to the columns 
comment on column SYS_DICT.id
  is '主键';
comment on column SYS_DICT.value
  is '数据值';
comment on column SYS_DICT.label
  is '标签名';
comment on column SYS_DICT.category
  is '分类';
comment on column SYS_DICT.description
  is '描述';
comment on column SYS_DICT.sequence
  is '排序';
comment on column SYS_DICT.parentid
  is '父主键';
-- Create/Recreate primary, unique and foreign key constraints 
alter table SYS_DICT
  add constraint SYS_DICT_ID primary key (ID);
