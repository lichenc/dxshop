--2017 07 14 create by lichenc

create table MenuMessage(
	id varchar(64) not null,
	category varchar(50),
	color varchar(64),
	num bigint,
	username varchar(64) not null,
	phone varchar(64),
	province varchar(64),
	city varchar(64),
	region varchar(64),
	detail_address varchar(200),
	payType varchar(64),
	price bigint,
	leave_message longtext,
	create_time datetime(3),
	modify_time datetime(3),
	status char(1),
	primary key (id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

    create table menu_vars (
        va_name varchar(64) not null,
        va_version bigint not null,
        va_value varchar(256),
        primary key (va_name)
    ) ENGINE=InnoDB;
  
  insert into menu_vars (va_name, va_version, va_value) values ('SchemaVersion', 1, '1001');