--2017 07 14 create by lichenc

create table MenuMessage(
	id varchar2(64 char) not null,
	category varchar2(64 char),
	color varchar2(64 char),
	num number(19,0),
	username varchar2(64 char) not null,
	phone varchar2(64 char),
	province varchar2(64 char),
	city varchar2(64 char),
	region varchar2(64 char),
	detail_address varchar2(200 char),
	payType varchar2(64 char),
	price number(20,0),
	leave_message clob,
	create_time timestamp,
	modify_time timestamp,
	status char(1 char),
	primary key (id)
);

 create table menu_vars (
        va_name varchar2(64 char) not null,
        va_version number(19,0) not null,
        va_value varchar2(256 char),
        primary key (va_name)
  );
  
  insert into menu_vars (va_name, va_version, va_value) values ('SchemaVersion', 1, '1001');