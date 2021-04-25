Create database Kursach
use Kursach

create table DataUsers(
IDUser int not null identity(1,1),
UserName varchar(30) unique,
UserSurname varchar(30) unique,
UserPassword varchar(30),
constraint PKUser primary key(IDUser))

create table DataCards(
IDCards int not null identity(1,1),
CardName varchar(20),
CardSurname varchar(20),
CardPatronymic varchar(20),
CardNumber varchar(10) unique,
constraint PKCards primary key(IDCards))

Insert Into DataCards(CardName,CardSurname,CardPatronymic,CardNumber) values ('Nikita','Kharitonov','Andreevich','20015')
Insert Into DataCards(CardName,CardSurname,CardPatronymic,CardNumber) values ('Petya','Makarenko','Aleksandrovich','20010')

create table DataBook(
IDBook int not null identity(1,1),
Nazvanie varchar(80),
AvtorFIO varchar(80),
Seria varchar(30),
Section varchar(50),
Izdatelstvo varchar(50),
ISBN varchar(50),
Artikyl varchar(30),
Vozrast varchar(6),
GodIzdaniya varchar(8),
Kol_vo_str varchar(5),
Pereplet varchar(30),
Paper varchar(30),
Formatk varchar(20),
Ves varchar(10),
Pathimg varchar(100),
Abz1 text,
Abz2 text,
Abz3 text,
constraint PKBook primary key(IDBook))
Alter table DataBook add constraint ISBVNunique unique(ISBN)
Alter table DataBook add constraint ArtikylUnique unique(Artikyl)
Alter table DataBook add Amount int
 
create table BookOrder(
IDOrder int not null identity(1,1),
Nazvanie varchar(200),
Avtor varchar(200),
CardFio varchar(50),
CardNumber int,
DateOrder date,
StatusOrder varchar(10),
IDBook int not null,
IDCard int not null,
constraint PKOrder primary key(IDOrder),
constraint FKBook foreign key(IDBook) references DataBook(IDBook) on delete cascade on update cascade,
constraint FKCard foreign key(IDCard) references DataCards(IDCards) on delete cascade on update cascade)

create table QueBook(
IDQue int not null identity(1,1),
IDBookInQue int not null,
IDCardInQue int not null,
constraint PKQue primary key(IDQue),
constraint FKBookInQue foreign key(IDBookInQue) references DataBook(IDBook) on delete cascade on update cascade,
constraint FKCardInQue foreign key(IDCardInQue) references DataCards(IDCards) on delete cascade on update cascade)


Create table ReturnBook(
IDReturn int not null identity(1,1),
Nazvanie varchar(60),
CardFio varchar(60),
CardNumber varchar(60),
DateRuturn date,
IDCardOrder int not null,
constraint PKReturn primary key(IDReturn),
constraint FKCardOrder foreign key(IDCardOrder) references DataCards(IDCards)  on delete cascade on update cascade) 

drop table ReturnBook
insert into DataUsers(UserName,UserSurname,UserPassword) values ('admin','admin','1234')
Insert into DataBook(Nazvanie,AvtorFIO,Seria,Section,Izdatelstvo,ISBN,Artikyl,Vozrast,GodIzdaniya,Kol_vo_str,Pereplet,Paper,Formatk,Ves,Pathimg,Abz1,Abz2,Abz3)
values ('����� ������','���������� ������','����','���������� �������','������������ ���','978-17-118219-9','�5479034','16+','2020','672','�������','������������','133x207 ��','0.54 ��','pack://application:,,,/img/�����_������.jpg','���� ������ ����������� �������� ���� �� ������ ���� � ������������� � ���������� ������� ������� �������, � �������, ��������� �������� ���������� � ������������ ���, ��� �� ������ ��� ���������� �� �����������.','������������ ���� �������������� ������� �������� �������� � ��������, ���������� �� ����� �������. �������� �� ������� �� ������ ��������������, �������� ������� � � ����� �� ��� ��������?','������� ����������� ������������ ���� � ����������� ����������� �������� ����� � ������������������� � ������������ �����!')
Insert into DataBook(Nazvanie,AvtorFIO,Seria,Section,Izdatelstvo,ISBN,Artikyl,Vozrast,GodIzdaniya,Kol_vo_str,Pereplet,Paper,Formatk,Ves,Pathimg,Abz1,Abz2,Abz3)
values ('��������','������ ����','������ �����','���������� ����������','������������ ���','978-5-17-120986-1','�5567526','16+','2020','608','�������','������������','130x208 ��','0.55 ��','pack://application:,,,/img/��������.jpg','��� ������� � ����������������� ���� ������ ���� ������ ��������� �����: �����, ����� � ���������� � ������� ��������, ������ � �������� ������� ������ ���� ����� �������� ����� �� �� ����������� � ����������� �������, ��� ������ � ��� ��� ���� � ��������� ��� � ��������� ������� �� ����� ���� ����� ��� ��������� "��������".','����� ��� ����������� �� ������ ������� ������, ����������� ����� ��������� ��� ����������, �������� �������� ������������ � ����� ����������� ������� �� �������������� �����������.','������ ����������. ������� ��������������, � ��� ������� � ���������� ������� �������� ���������, ������ �� ����������� ��� �����')
Insert into DataBook(Nazvanie,AvtorFIO,Seria,Section,Izdatelstvo,ISBN,Artikyl,Vozrast,GodIzdaniya,Kol_vo_str,Pereplet,Paper,Formatk,Ves,Pathimg,Abz1,Abz2,Abz3)
values ('������� ��������� �����','����� ������ ���������','����� ������ ������','����������� ������������� �����','������������ ���','978-5-17-090436-5','�183024','16+','2020','512','�������','��������','130x207 ��','0.44 ��','pack://application:,,,/img/�������.jpg','������ ����� �������� � ������� � ������, �������� ��������� ����������� ������, ������ �� ��������� ���������� ���������� ����� ����. ������������� � �������� "����", "��������� ����", "�������".','����� "������� ��������� �����" ���������� ����� 1930 ���� � ������ ��������� �������. ���������� ������� ������ � ������� ������ ������������ ���������� � ������-�������� �� ��������� ���������� �������� � ������.','�������� ��������� � ������������� ������������, ���������������� ������� � ����������, ���������� � ���������, �������� � �������, �������, ������, �����, ������ � ��� ���������� �� ������� ������, ��������� ��������� � ����� � ������������� ����������� ���� ����� �� �����.')
Insert into DataBook(Nazvanie,AvtorFIO,Seria,Section,Izdatelstvo,ISBN,Artikyl,Vozrast,GodIzdaniya,Kol_vo_str,Pereplet,Paper,Formatk,Ves,Pathimg,Abz1,Abz2,Abz3)
values ('���� � �������','������� �����','�������','���������� ����������','������������ ���','978-5-17-121141-7','�5581107','18+','2020','640','�������','��������','125x200 ��','0.55 ��','pack://application:,,,/img/����.jpg','��� ���� ����� ������ ����� �� ���� �������� ���� �����, ����� ����� � ������ ������� � ������ ����� ���� ����������. �� �������� ���������� �� ����������, ���� � �������� �� ����� ���� �����. �� ������. �� ������� ����. ','��� ������� � ������� �� ����� � ��������� ��������� ������. �� � ������ ���� ������� �� ������ ���� �������, � ��� �� �������� ������ ������ �� ������ � ����������� ����.','����� ����� �������� � �������� ����� ��� ���, � ���������� ����� ������ �� ������� ���� �������� ����. �� ��� �� � ����� ����������� ��������, ������� ����������� � ����, �� ��� �� �� � ����� �������� ���� ��������. �� ������ ������� �����.')
Insert into DataBook(Nazvanie,AvtorFIO,Seria,Section,Izdatelstvo,ISBN,Artikyl,Vozrast,GodIzdaniya,Kol_vo_str,Pereplet,Paper,Formatk,Ves,Pathimg,Abz1,Abz2,Abz3)
values ('���� ���','����� ������ ���������','����� ������ ������','����������� ������������� �����','������������� ���','978-5-17-107766-2','�2429615','16+','2020','496','�������','�������','145x219 ��','0.48 ��','pack://application:,,,/img/����_���.jpg','����� ����� �������� ������ �������� ����� � ������ ������, ������ ����������� �������� ��������� �����!','������ ����� � ����� ���������� �������� � 2018 ����: ��� ������� �� ������ ������ ����� ��� ������������� � ����� �� ����� ���������� ���������������� ����� � ������.','')
Insert into DataBook(Nazvanie,AvtorFIO,Seria,Section,Izdatelstvo,ISBN,Artikyl,Vozrast,GodIzdaniya,Kol_vo_str,Pereplet,Paper,Formatk,Ves,Pathimg,Abz1,Abz2,Abz3)
values ('������ ������','���� ����','������� ������� ����','���������� ���������','������������ �����','978-5-04-105557-8','�5427188','16+','2020','416','�������','��������','134x207 ��','0.37 ��','pack://application:,,,/img/������_������.jpg','�� ����� � ������, ������������� �� ������, ����� ������� �������� �������. ����� ������� � ����� ��������. ��� ���������� ������� �� ������ ����, ��������� ������� �������� �����. � ������ �� �������� � ������, ���','�� ����� ����� ���� ���������� �������, ������������������ ������ ��������, ������� ��������� ������� ����� ����� ����. �������� ����������� ��������. �� ��� ����, ��� ����� ���, �������� � ����������� ������, ������� ��� ���. � ������ ���������','������������� ����� ������� ������, �� ��� �� �������� �������� ����������, ������ ��� ��������������. ��� ������ �������� ���� � ���� ���� ���� ���������� � ��� ������. ��� � ������ �� ������. ��-������ ������, ��� �����-��, ����� ��� �����, ����� ����������� � �������� ������� ')
Insert into DataBook(Nazvanie,AvtorFIO,Seria,Section,Izdatelstvo,ISBN,Artikyl,Vozrast,GodIzdaniya,Kol_vo_str,Pereplet,Paper,Formatk,Ves,Pathimg,Abz1,Abz2,Abz3)
values ('������ �������','������ ����','������ �� ��� �������','��������','������������ ���','978-5-17-120613-0','�5493387','16+','2020','320','�������','��������','130x207 ��','0.28 ��','pack://application:,,,/img/������_�������.jpg','������� ����� �����, �������� ����������� � ����� ����������� "������ �������", �������� ������ �������� � ������������ ������������ ���.','����� ����� �� ����� ��������, ������� �� ������ ����� � ����� �� �����, ����� ���-�� ������ "������" �������. �������� � ���� ��� �������� �������� ������� ������� ����� ����, ���� ������� ���� ���������� � �����, � ��������� "��� ������".','������� ����� ������ �� ��� �������, ����� ��������: �� ����� ������� ����� ����������� ���������� ������� �����, � ���� ����������� ������� ���������� "������ �������", �� ��� ����������� ����� ����� ������������ ������� ���������� ��� � ���������')
Insert into DataBook(Nazvanie,AvtorFIO,Seria,Section,Izdatelstvo,ISBN,Artikyl,Vozrast,GodIzdaniya,Kol_vo_str,Pereplet,Paper,Formatk,Ves,Pathimg,Abz1,Abz2,Abz3)
values ('���� ��������','������ ����','��������������','���������� ����������','������������ ���','978-5-91878-352-8','�5581184','16+','2020','515','�������','��������','159x234 ��','0.59 ��','pack://application:,,,/img/����_��������.png','�������� ������� ����� �������� �� ����� ���������� � ������� ������������ ���������. �������� ����������� �������� ������������ � ����������� �� ������ ������ �����, � ����� ��� ������ ������ � ��������� ������� ����������� ��� �������. ','������ ������� ���������� �������� ��� �����. ����� ����������� ������ ������� ����. ��������� ������� ������������� �������. ����� ����������� ������ � ������ ���������� �������.','����� �������� ������������, ��������� ������� �����. � �� ����� ��� � ���� � ����� ��������������� ����� �������, ������ ������ � ������� "���������" ��������� ��������, ����� ������ � ��������� � ������������ ��������� � ��� ���.')
Insert into DataBook(Nazvanie,AvtorFIO,Seria,Section,Izdatelstvo,ISBN,Artikyl,Vozrast,GodIzdaniya,Kol_vo_str,Pereplet,Paper,Formatk,Ves,Pathimg,Abz1,Abz2,Abz3)
values ('������� ������','���������� ������� �����','����� ��������','����������� ���������� �����','������������ �����','978-5-04-105379-6','�5426428','16+','2020','320','�������','��������','131x206 ��','0.3 ��','pack://application:,,,/img/�������_������.jpg','������� ����� ����������� � ������������ ������� ������� ����������. ��������, ���� � �������������� ���������� �������� ����� 20-� �����. �� � ��� ��� ������ �� ����� ��� ����������� �����. �� ��������������� � ������� �������� ������ � �������, � � ��������� �������� ��� ����������� �����.','"������� ������" � ����� ��������� ����� ������������, ������� �������� "���� �����". �������, 1925 �., ����� "������ ������" � ������������ ��������, ����� ����� � ����� �����. �� ��� ���� ������ ���������� ������������ ����� ���������� ��������� ���������. � ���� ������, �������� �� ����� � ���������, ������ � ���������� ��������. ���� ������ �� ��� � ������ ������� ��������� �� � ������������ ������, � � �����, �������� � ������','� ������� ����� ������� ������������ ����� "��������� ������" � ��������� �������� ������ � ���������, ��������� �������� ������. �� ����� �������� � ����� �����, ������� ������ ���������� ������������� �������.')
Insert into DataBook(Nazvanie,AvtorFIO,Seria,Section,Izdatelstvo,ISBN,Artikyl,Vozrast,GodIzdaniya,Kol_vo_str,Pereplet,Paper,Formatk,Ves,Pathimg,Abz1,Abz2,Abz3)
values ('������������ �������','�������� �����','���������� ��������','����������� ���������� ������','������������ ���','978-5-17-077960-4','�181371','16+','2019','864','�������','��������','135x208 ��','0.58 ��','pack://application:,,,/img/������������_�������.jpg','��� - "������������ �������"','���������� ����������� ������������, � ������� �� ��� ���� �������� ������ �������� � �������, �������� - � ���� ������ ����� ������ ����������� � ������������� ������.','��� �� ����� ��� �����, ��-�������� �� ������ ����� ��������, ������ �����? ������������ "������������" �� �������� � ��������� ���� ������������ ���������? ������� ����������� ��������� � ����� ������ ������������ ��������� ����� �� ���������� ��������������? ���, �������, ������ ����������, �������� � ��������� ����������� ������?')

Select AvtorFIO From DataBook Where Nazvanie = '������������ �������'
Select AvtorFIO From DataBook Where Nazvanie = '���� � �������'
Insert Into BookOrder(Nazvanie,Avtor,CardFio,CardNumber,DateOrder,StatusOrder,IDBook,IDCard)
Values('����� ������','���������� ������','Nikita Kharitonov Andreevich',20015,'16-10-2020','���������',1,1)
Insert Into BookOrder(Nazvanie,Avtor,CardFio,CardNumber,DateOrder,StatusOrder,IDBook,IDCard)
Values('������ �������','������ ����','Petya Makarenko Aleksandrovich',20010,'10-10-2020','���������',5,2)
use Kursach
---------------View----------------
Create view ChangesBook as
Select * From DataBook

Create View ChangesCard as
Select * From DataCards

Create View Debtor as
Select * From BookOrder Where BookOrder.StatusOrder = '���������'

Create View OrderBookView as
Select * From BookOrder

Select * From Debtor

----------------Proc------------------------
Create Proc DeleteBookFromDataBase
	@ID int
AS
Delete From DataBook Where IDBook=@ID

Create Proc InsertNewBook
	@nazvanie varchar(80),
	@avtor varchar(80),
	@seria varchar(30),
	@section varchar(50),
	@izdatelstv varchar(50),
	@isbn varchar(50),
	@artikyl varchar(30),
	@age varchar(6),
	@god varchar(8),
	@str varchar(5),
	@pereplet varchar(30),
	@paper varchar(30),
	@formatk varchar(20),
	@ves varchar(10),
	@img varchar(100),
	@abz1 text,
	@abz2 text,
	@abz3 text
AS
Insert into DataBook(Nazvanie,AvtorFIO,Seria,Section,Izdatelstvo,ISBN,Artikyl,Vozrast,GodIzdaniya,Kol_vo_str,Pereplet,Paper,Formatk,Ves,Pathimg,Abz1,Abz2,Abz3)
Values(@nazvanie,@avtor,@seria,@section,@izdatelstv,@isbn,@artikyl,@age,@god,@str,@pereplet,@paper,@formatk,@ves,@img,@abz1,@abz2,@abz3)

--Exec InsertNewBook '������������ �������','�������� �����','���������� ��������','����������� ���������� ������','������������ ���','978-5-17-077960-4','�181371','16+','2019','864','�������','��������','135x208 ��','0.58 ��','pack://application:,,,/img/������������_�������.jpg','��� - "������������ �������"','���������� ����������� ������������, � ������� �� ��� ���� �������� ������ �������� � �������, �������� - � ���� ������ ����� ������ ����������� � ������������� ������.','��� �� ����� ��� �����, ��-�������� �� ������ ����� ��������, ������ �����? ������������ "������������" �� �������� � ��������� ���� ������������ ���������? ������� ����������� ��������� � ����� ������ ������������ ��������� ����� �� ���������� ��������������? ���, �������, ������ ����������, �������� � ��������� ����������� ������?'

Create Proc ChangesBookSearch
	@nazvanie varchar(80),
	@avtor varchar(80),
	@seria varchar(30),
	@section varchar(50),
	@izdatelstv varchar(50),
	@isbn varchar(50),
	@artikyl varchar(30),
	@age varchar(6),
	@god varchar(8),
	@str varchar(5),
	@pereplet varchar(30),
	@paper varchar(30),
	@formatk varchar(20),
	@ves varchar(10),
	@img varchar(100),
	@abz1 varchar(8000),
	@abz2 varchar(8000),
	@abz3 varchar(8000)
AS
Select * From DataBook Where Nazvanie like '%'+ @nazvanie+'%' and AvtorFIO like '%'+ @avtor + '%' and Seria like '%'+ @seria +'%' and Section like '%'+ @section +'%' and Izdatelstvo like '%'+ @izdatelstv +'%' and ISBN like '%'+ @isbn +'%' and Artikyl like '%'+ @artikyl +'%' and Vozrast like '%'+ @age +'%' and GodIzdaniya like '%'+ @god +'%' and Kol_vo_str like '%'+ @str +'%' and Pereplet like '%'+ @pereplet +'%' and Paper like '%'+ @paper +'%' and Formatk like '%'+ @formatk +'%' and Ves like '%'+ @ves +'%' and Pathimg like '%'+ @img +'%' and Abz1 like '%'+ @abz1 +'%' and Abz2 like '%'+ @abz2 +'%' and Abz3 like '%'+ @abz3 +'%'

Create Proc DeleteCardFromDataBase
	@ID int
as
Delete From DataCards Where IDCards = @ID

Create Proc ChangesCardSearch
	@name varchar(50),
	@surname varchar(50),
	@patr varchar(50),
	@number varchar(10)
as
Select * From DataCards Where CardName like '%'+ @name +'%' and CardSurname like '%'+ @surname +'%' and CardPatronymic like '%'+ @patr +'%' and CardNumber like '%'+ @number +'%'

Create Proc DebtorSearch
	@nazv varchar(60),
	@avtr varchar(60),
	@FIO varchar(60),
	@number varchar(10),
	@dateorder varchar(15),
	@stat varchar(10)
AS
Select * From BookOrder Where Nazvanie like '%'+ @nazv+'%' and Avtor like '%'+ @avtr + '%' and CardFio like '%'+ @FIO +'%' and CardNumber like '%'+ @number +'%' and DateOrder like '%'+ @dateorder +'%' and StatusOrder like '%'+ @stat +'%'

--Exec DebtorSearch '','','','','',''

Create Proc OrderNewBook
	@nazv varchar(100),
	@avtor varchar(100),
	@fio varchar(100),
	@number varchar(10),
	@date varchar(10),
	@stat varchar(15)
as
if((Select IDCards from DataCards Where CardNumber=@number) is not null AND (Select IDOrder From BookOrder Where Nazvanie=@nazv and Avtor=@avtor and CardFio=@fio and CardNumber=@number) is null)
	Begin
	Insert Into BookOrder(Nazvanie,Avtor,CardFio,CardNumber,DateOrder,StatusOrder,IDBook,IDCard) Values(@nazv,@avtor,@fio,@number,@date,@stat,(Select IDBook From DataBook Where AvtorFIO=@avtor and Nazvanie=@nazv),(Select IDCards From DataCards Where CardNumber=@number))
	Update DataBook set Amount = Amount - 1 Where IDBook = (Select IDBook From DataBook Where AvtorFIO=@avtor and Nazvanie=@nazv)
	end
else
	throw 1,'Error',1

Create Proc InsertNewLibCard
	@name varchar(30),
	@surname varchar(50),
	@patron varchar(50),
	@number varchar(50)
AS
Insert Into DataCards(CardName,CardSurname,CardPatronymic,CardNumber) Values(@name,@surname,@patron,@number)

Create Proc SearchInSearch
	@nazv varchar(100),
	@avtor varchar(100),
	@god varchar(15)
as
Select * from DataBook Where Nazvanie like '%'+ @nazv+'%' and AvtorFIO like '%'+ @avtor + '%' and GodIzdaniya like '%'+ @god  +'%'

Create Proc PersonlOrderBook
	@ID int
as
Select * From BookOrder Where IDCard = @ID

Create Proc UpdateOrderStatys
AS
Update BookOrder Set StatusOrder = '���������' Where GETDATE()> DATEADD(month,1,DateOrder)

Create Proc PersonalReturnBook
	@number varchar(15)
as
Select * From BookOrder Where CardNumber = @number

Create Proc InsertNewReturnBook
	@fio varchar(100),
	@number varchar(15),
	@nazv varchar(100),
	@avtor varchar(100),
	@date varchar(15)
AS
if((Select IDOrder From BookOrder Where CardFio = @fio and CardNumber = @number and Nazvanie = @nazv and Avtor = @avtor) is not null)
	begin
	Insert Into ReturnBook(Nazvanie,CardFio,CardNumber,DateRuturn,IDCardOrder) values(@nazv,@fio,@number,@date,(Select IDCards From DataCards Where CardNumber = @number))
	Delete From BookOrder Where IDOrder = (Select IDOrder From BookOrder Where CardFio = @fio and CardNumber = @number and Nazvanie = @nazv and Avtor = @avtor)

	end

Create Proc InsertNewQue
	@name varchar(100),
	@surname varchar(100),
	@patron varchar(100),
	@number varchar(15),
	@nazvanie varchar(100)
As
Insert Into QueBook(IDBookInQue,IDCardInQue) VALUES ((Select IDBook from DataBook Where Nazvanie = @nazvanie),(Select IDCards From DataCards Where CardName = @name and CardSurname = @surname and CardPatronymic =  @patron and CardNumber = @number))

Select * From QueBook join DataBook on DataBook.IDBook = QueBook.IDBookInQue join DataCards on DataCards.IDCards = QueBook.IDCardInQue Where IDCards = (Select IDCards From DataCards Where CardSurname = 'Makarenko') And IDBook = (Select IDBook From DataBook Where Nazvanie = '����� ������')

Insert into QueBook(IDBookInQue,IDCardInQue) values(1,1)

Select * From QueBook join DataBook on DataBook.IDBook = QueBook.IDBookInQue join DataCards on DataCards.IDCards = QueBook.IDCardInQue Where Nazvanie = '��������'