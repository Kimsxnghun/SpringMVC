-- tboard = BoardVO : Spring JPA ( 테이블이름과 VO이름을 같게 하는 것이 좋다 )
create table tboard(
	idx int not null auto_increment,
	title varchar(1000) not null,
	contents varchar(3000) not null,
	count int not null default 0,
	writer varchar(100) not null,
	indate datetime not null default now(),
	primary key(idx)	
);

select * from tboard;

insert into tboard(title, contents, writer)
values ('스프링게시판','스프링게시판내용','관리자');

insert into tboard(title, contents, writer)
values ('스프링게시판2','스프링게시판내용2','김쿼리');

insert into tboard(title, contents, writer)
values ('민트초코손절합니다','제곧내','정세연');
