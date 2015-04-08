prompt PL/SQL Developer import file
prompt Created on 2015年3月26日星期四 by Administrator
set feedback off
set define off
prompt Disabling triggers for SYS_PERMISSION...
alter table SYS_PERMISSION disable all triggers;
prompt Deleting SYS_PERMISSION...
delete from SYS_PERMISSION;
commit;
prompt Loading SYS_PERMISSION...
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
commit;
prompt 13 records loaded
prompt Enabling triggers for SYS_PERMISSION...
alter table SYS_PERMISSION enable all triggers;
set feedback on
set define on
prompt Done.
