#source D:/github/BookManagementSystem/bms.sql

use db_bookms;

create table if not exists publishers(
	id int auto_increment,
	name varchar (30) NOT NULL,
	primary key (id)
);

create table  if not exists authors (
	id int auto_increment,
	firstName varchar (20) NOT NULL,
	lastName varchar (30) NOT NULL,
	primary key (id)
);

create table  if not exists titles(
	isbn varchar (20) NOT NULL,
	title varchar (100) NOT NULL,
	editionNumber int NOT NULL,
	copyright varchar (4) NOT NULL,
	publisherID int NOT NULL,
	imageFile varchar (20) NOT NULL,
	price float NOT NULL,
	foreign key (publisherID)
		references publishers (id), 
	primary key (isbn)
);

create table if not exists authorISBN(
	id int NOT NULL,
	isbn varchar (20) NOT NULL,
	foreign key (id)
		references authors (id), 
	foreign key (isbn)
		references titles (isbn)
) 
;
create table  if not exists users
(
    id int auto_increment,
    account     varchar(20) not null,
    password    varchar(20) not null,
    name        varchar(20) not null,
    createTime  datetime default now(),
    primary key (id)
);

insert into publishers (name) values ('Prentice Hall')
;
insert into publishers (name) values ('Prentice Hall PTG')
;

insert into authors (firstName,lastName) values ('Harvey','Deitel')
;
insert into authors (firstName,lastName) values ('Paul','Deitel')
;
insert into authors (firstName,lastName) values ('Tem','Nieto')
;
insert into authors (firstName,lastName) values ('Sean','Santry')
;

insert into titles (isbn,title,editionNumber,copyright,publisherID,imageFile,price) values ('0130895725','C How to Program',3,'2001',1,'chtp3.jpg',69.95)
;
insert into titles (isbn,title,editionNumber,copyright,publisherID,imageFile,price) values ('0132261197','C How to Program',2,'1994',1,'chtp2.jpg',49.95)
;
insert into titles (isbn,title,editionNumber,copyright,publisherID,imageFile,price) values ('0130895717','C++ How to Program',3,'2001',1,'cpphtp3.jpg',69.95)
;
insert into titles (isbn,title,editionNumber,copyright,publisherID, imageFile,price) values ('0135289106','C++ How to Program',2,'1998',1,'cpphtp2.jpg',49.95)
;
insert into titles (isbn,title,editionNumber,copyright,publisherID,imageFile,price) values ('0139163050','The Complete C++ Training Course',3,'2001',2,'cppctc3.jpg',109.95)
;
insert into titles (isbn,title,editionNumber,copyright,publisherID,imageFile,price) values ('013028419x','e-Business and e-Commerce How to Program',1,'2001',1,'ebechtp1.jpg',69.95)
;
insert into titles (isbn,title,editionNumber,copyright,publisherID,imageFile,price) values ('0130161438','Internet and World Wide Web How to Program',1,'2000',1,'iw3htp1.jpg',69.95)
;
insert into titles (isbn,title,editionNumber,copyright,publisherID,imageFile,price) values ('0130856118','The Complete Internet and World Wide Web Programming Training Course',1,'2000',2,'iw3ctc1.jpg',109.95)
;
insert into titles (isbn,title,editionNumber,copyright,publisherID,imageFile,price) values ('0130125075','Java How to Program (Java 2)',3,'2000',1,'jhtp3.jpg',69.95)
;
insert into titles (isbn,title,editionNumber,copyright,publisherID,imageFile,price) values ('0138993947','Java How to Program (Java 1.1)',2,'1998',1,'jhtp2.jpg',49.95)
;
insert into titles (isbn,title,editionNumber,copyright,publisherID,imageFile,price) values ('0130852473','The Complete Java 2 Training Course',3,'2000',2,'javactc3.jpg',109.95)
;
insert into titles (isbn,title,editionNumber,copyright,publisherID,imageFile,price) values ('0130829277','The Complete Java Training Course (Java 1.1)',2,'1998',2,'javactc2.jpg',99.95)
;
insert into titles (isbn,title,editionNumber,copyright,publisherID,imageFile,price) values ('0134569555','Visual Basic 6 How to Program',1,'1999',1,'vbhtp1.jpg',69.95)
;
insert into titles (isbn,title,editionNumber,copyright,publisherID,imageFile,price) values ('0130829293','The Complete Visual Basic 6 Training Course',1,'1999',2,'vbctc1.jpg',109.95)
;
insert into titles (isbn,title,editionNumber,copyright,publisherID,imageFile,price) values ('0130284173','XML How to Program',1,'2001',1,'xmlhtp1.jpg',69.95)
;
insert into titles (isbn,title,editionNumber,copyright,publisherID,imageFile,price) values ('0130284181','Perl How to Program',1,'2001',1,'perlhtp1.jpg',69.95)
;
insert into titles (isbn,title,editionNumber,copyright,publisherID,imageFile,price) values ('0130895601','Advanced Java 2 Platform How to Program',1,'2002',1,'advjhtp1.jpg',69.95)
;

insert into authorISBN (id,isbn) values (1,'0130895725')
;
insert into authorISBN (id,isbn) values (1,'0132261197')
;
insert into authorISBN (id,isbn) values (1,'0130895717')
;
insert into authorISBN (id,isbn) values (1,'0135289106')
;
insert into authorISBN (id,isbn) values (1,'0139163050')
;
insert into authorISBN (id,isbn) values (1,'013028419x')
;
insert into authorISBN (id,isbn) values (1,'0130161438')
;
insert into authorISBN (id,isbn) values (1,'0130856118')
;
insert into authorISBN (id,isbn) values (1,'0130125075')
;
insert into authorISBN (id,isbn) values (1,'0138993947')
;
insert into authorISBN (id,isbn) values (1,'0130852473')
;
insert into authorISBN (id,isbn) values (1,'0130829277')
;
insert into authorISBN (id,isbn) values (1,'0134569555')
;
insert into authorISBN (id,isbn) values (1,'0130829293')
;
insert into authorISBN (id,isbn) values (1,'0130284173')
;
insert into authorISBN (id,isbn) values (1,'0130284181')
;
insert into authorISBN (id,isbn) values (1,'0130895601')
;

insert into authorISBN (id,isbn) values (2,'0130895725')
;
insert into authorISBN (id,isbn) values (2,'0132261197')
;
insert into authorISBN (id,isbn) values (2,'0130895717')
;
insert into authorISBN (id,isbn) values (2,'0135289106')
;
insert into authorISBN (id,isbn) values (2,'0139163050')
;
insert into authorISBN (id,isbn) values (2,'013028419x')
;
insert into authorISBN (id,isbn) values (2,'0130161438')
;
insert into authorISBN (id,isbn) values (2,'0130856118')
;
insert into authorISBN (id,isbn) values (2,'0130125075')
;
insert into authorISBN (id,isbn) values (2,'0138993947')
;
insert into authorISBN (id,isbn) values (2,'0130852473')
;
insert into authorISBN (id,isbn) values (2,'0130829277')
;
insert into authorISBN (id,isbn) values (2,'0134569555')
;
insert into authorISBN (id,isbn) values (2,'0130829293')
;
insert into authorISBN (id,isbn) values (2,'0130284173')
;
insert into authorISBN (id,isbn) values (2,'0130284181')
;
insert into authorISBN (id,isbn) values (2,'0130895601')
;


insert into authorISBN (id,isbn) values (3,'013028419x')
;
insert into authorISBN (id,isbn) values (3,'0130161438')
;
insert into authorISBN (id,isbn) values (3,'0130856118')
;
insert into authorISBN (id,isbn) values (3,'0134569555')
;
insert into authorISBN (id,isbn) values (3,'0130829293')
;
insert into authorISBN (id,isbn) values (3,'0130284173')
;
insert into authorISBN (id,isbn) values (3,'0130284181')
;


insert into authorISBN (id,isbn) values (4,'0130895601')
;

insert into users (account, password, name, createTime)values('admin', 'admin', 'administrator', now());
