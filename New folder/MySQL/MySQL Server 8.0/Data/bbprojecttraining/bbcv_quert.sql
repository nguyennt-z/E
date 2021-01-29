create database bb_cv;
use bb_cv;
create table  cv_template(
	cv_template int primary key auto_increment,
    location varchar(50),
    tag_name varchar(15),
    product varchar(4000),
    link_img varchar (250),
    user_role_id int,
	created_at TIMESTAMP,
    update_at TIMESTAMP
);
show variables like 'sql_mode' ; 
SET sql_mode = '';
set global sql_mode = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
/*Xu ly loi invalid defaul value cua update_at
/* show variables like 'sql_mode' ; 
SET sql_mode = '';
set global sql_mode = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
*/
create table user_role(
	user_role_id int primary key auto_increment,
    role_id int,
    user_id int,
    create_at timestamp,
    update_at timestamp
);
alter table cv_template add foreign key(user_role_id) references user_role(user_role_id);
create table role(
	role_id int primary key auto_increment,
    role_name varchar(20),
    create_at timestamp,
    update_at timestamp
    
);
alter table user_role add foreign key(role_id) references role(role_id);
create table user_account(
	user_id int primary key auto_increment,
    user_password varchar(20),
    phone_numbers char(10),
    email varchar(150),
    user_name varchar(50),
    role_name varchar(10),
    link_img varchar(250),
    create_at timestamp,
    update_at timestamp
);
alter table user_role add foreign key(user_id) references user_account(user_id);
create table cv(
	cv_id int primary key auto_increment,
    location varchar(50),
    tag_name varchar(15),
    skill varchar(4000),
    product varchar(4000),
    number_of_like int,
    link_img varchar (250),
    user_role_id int,
    create_at timestamp,
    update_at timestamp,
    foreign key(user_role_id) references user_role(user_role_id)
);
create table attribute(
	attribute_id int primary key auto_increment,
    attribute_name varchar(50)
);
create table attribute_value(
	attribute_value_id int primary key auto_increment,
    attribute_value_name varchar(4000),
    attribute_id int,
    cv_id int,
	create_at timestamp,
    update_at timestamp,
    foreign key(cv_id) references cv(cv_id),
    foreign key(attribute_id) references attribute(attribute_id)
);
create table permission (
	permission_id int primary key auto_increment,
    permission_name varchar(25),
    create_at timestamp,
    update_at timestamp
);
create table role_permission(
	role_permission_id  int primary key auto_increment,
    role_id int,
    permission_id int,
    create_at timestamp,
    update_at timestamp,
    foreign key(role_id) references role(role_id),
    foreign key(permission_id) references permission(permission_id)
);
create table experience (
	experience_id int primary key auto_increment,
    old_company varchar(50),
    join_date date,
    out_date date,
    cv_id int,
    create_at timestamp,
    update_at timestamp,
    foreign key(cv_id) references cv(cv_id)
);

create table programming_language_used(
	programming_language_id int primary key auto_increment,
    programming_language_name varchar(20),
    experience_id int,
	create_at timestamp,
    update_at timestamp,
     foreign key(experience_id) references experience(experience_id)
);
create table experience_template (
	experience_template_id int primary key auto_increment,
    old_company varchar(50),
    join_date date,
    out_date date,
    cv_template_id int,
    create_at timestamp,
    update_at timestamp,
    foreign key(cv_template_id) references cv_template (cv_template)
);
create table programming_language_used_template(
	programming_language_template_id int primary key auto_increment,
    programming_language_templates_name varchar(20),
	create_at timestamp,
    update_at timestamp,
    experience_template_id int,
    foreign key(experience_template_id) references experience_template (experience_template_id)
);
select * from user_account where user_name= "a";
INSERT into user_account(user_password,phone_numbers,email,	user_name,role_name) values('1234','0362972828','trungnguyen98html@gmail.com','trungnguyen03','member');
SELECT * FROM user_account WHERE user_name ="trungnguyen04";
/* fix create at error*/
show variables like 'sql_mode' ; 
SET sql_mode = '';
alter table user_account add permission int;
create table profile(
	profile_id int primary key auto_increment,
	create_at timestamp,
    update_at timestamp
);
alter table user_account add profile_id int;
alter table user_account add foreign key(profile_id) references profile(profile_id);
alter table cv add profile_id int;
alter table cv add foreign key	(profile_id) references profile(profile_id);
alter table user_account add permission int;