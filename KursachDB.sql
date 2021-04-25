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
values ('Кровь эльфов','Сапковский Анджей','Кино','Зарубежное фэнтези','Издательство АСТ','978-17-118219-9','р5479034','16+','2020','672','Твердый','Типографская','133x207 мм','0.54 кг','pack://application:,,,/img/Кровь_эльфов.jpg','Сага Анджея Сапковского занимает одно из первых мест в отечественных и зарубежных списках лучшего фэнтези, а Геральт, культовый персонаж литературы и компьютерных игр, уже во второй раз появляется на телеэкранах.','Таинственные силы Предназначения связали ведьмака Геральта с девочкой, принцессой по имени Цирилла. Возможно ли сбежать от своего Предназначения, ставшего судьбой – и нужно ли это Геральту?','Читайте продолжение великолепной саги и сравнивайте приключения любимого героя в кинематографическом и литературном мирах!')
Insert into DataBook(Nazvanie,AvtorFIO,Seria,Section,Izdatelstvo,ISBN,Artikyl,Vozrast,GodIzdaniya,Kol_vo_str,Pereplet,Paper,Formatk,Ves,Pathimg,Abz1,Abz2,Abz3)
values ('Институт','Стивен Кинг','Темная башня','Зарубежная фантастика','Издательство АСТ','978-5-17-120986-1','р5567526','16+','2020','608','Твердый','Типографская','130x208 мм','0.55 кг','pack://application:,,,/img/Институт.jpg','Еще недавно у двенадцатилетнего Люка Эллиса была вполне привычная жизнь: школа, обеды с родителями в любимой пиццерии, вечера в компании лучшего друга… Пока одним июньским утром он не просыпается в собственной комнате, вот только в ней нет окон и находится она в тщательно укрытом от всего мира месте под названием "Институт".','Здесь над похищенными из разных городов детьми, обладающими даром телепатии или телекинеза, проводят жестокие эксперименты с целью максимально развить их паранормальные способности.','Бежать невозможно. Будущее предопределено, и это будущее — загадочная Дальняя половина Института, откуда не возвращался еще никто…')
Insert into DataBook(Nazvanie,AvtorFIO,Seria,Section,Izdatelstvo,ISBN,Artikyl,Vozrast,GodIzdaniya,Kol_vo_str,Pereplet,Paper,Formatk,Ves,Pathimg,Abz1,Abz2,Abz3)
values ('Зулейха открывает глаза','Яхина Гузель Шамилевна','Проза Гузель Яхиной','Современная отечественная проза','Издательство АСТ','978-5-17-090436-5','р183024','16+','2020','512','Твердый','Офсетная','130x207 мм','0.44 кг','pack://application:,,,/img/Зулейха.jpg','Гузель Яхина родилась и выросла в Казани, окончила факультет иностранных языков, учится на сценарном факультете Московской школы кино. Публиковалась в журналах "Нева", "Сибирские огни", "Октябрь".','Роман "Зулейха открывает глаза" начинается зимой 1930 года в глухой татарской деревне. Крестьянку Зулейху вместе с сотнями других переселенцев отправляют в вагоне-теплушке по извечному каторжному маршруту в Сибирь.','Дремучие крестьяне и ленинградские интеллигенты, деклассированный элемент и уголовники, мусульмане и христиане, язычники и атеисты, русские, татары, немцы, чуваши — все встретятся на берегах Ангары, ежедневно отстаивая у тайги и безжалостного государства свое право на жизнь.')
Insert into DataBook(Nazvanie,AvtorFIO,Seria,Section,Izdatelstvo,ISBN,Artikyl,Vozrast,GodIzdaniya,Kol_vo_str,Pereplet,Paper,Formatk,Ves,Pathimg,Abz1,Abz2,Abz3)
values ('Змей и голубка','Махёрин Шелби','Фэнтези','Зарубежная фантастика','Издательство АСТ','978-5-17-121141-7','р5581107','18+','2020','640','Твердый','Офсетная','125x200 мм','0.55 кг','pack://application:,,,/img/Змей.jpg','Два года назад ведьма Луиза ле Блан покинула свой ковен, нашла приют в городе Цезарин и теперь живет лишь воровством. Ей пришлось отказаться от колдовства, ведь в Цезарине на ведьм идет охота. Их боятся. Их предают огню. ','Рид Диггори — охотник на ведьм и преданный служитель Церкви. Их с Луизой пути никогда не должны были сойтись, и все же коварная уловка сводит их вместе в невозможный союз.','Война между ведьмами и Церковью стара как мир, и опаснейшие враги грозят Лу судьбой куда страшнее огня. Но она не в силах противиться чувствам, которые зарождаются в душе, но так же не в силах изменить свою сущность. Лу должна сделать выбор.')
Insert into DataBook(Nazvanie,AvtorFIO,Seria,Section,Izdatelstvo,ISBN,Artikyl,Vozrast,GodIzdaniya,Kol_vo_str,Pereplet,Paper,Formatk,Ves,Pathimg,Abz1,Abz2,Abz3)
values ('Дети мои','Яхина Гузель Шамилевна','Проза Гузель Яхиной','Современная отечественная проза','Издательсттво АСТ','978-5-17-107766-2','р2429615','16+','2020','496','Твердый','Классик','145x219 мм','0.48 кг','pack://application:,,,/img/Дети_мои.jpg','Новый роман лауреата премий «Большая книга» и «Ясная Поляна», автора бестселлера «Зулейха открывает глаза»!','Гузель Яхина – автор Тотального диктанта в 2018 году: три отрывка из нового романа «Дети мои» задействованы в одной из самых масштабных просветительских акций в России.','')
Insert into DataBook(Nazvanie,AvtorFIO,Seria,Section,Izdatelstvo,ISBN,Artikyl,Vozrast,GodIzdaniya,Kol_vo_str,Pereplet,Paper,Formatk,Ves,Pathimg,Abz1,Abz2,Abz3)
values ('Внутри убийцы','Омер Майк','Главный триллер года','Зарубежные детективы','Издательство Эксмо','978-5-04-105557-8','р5427188','16+','2020','416','Твердый','Офсетная','134x207 мм','0.37 кг','pack://application:,,,/img/Внутри_убийцы.jpg','На мосту в Чикаго, облокотившись на перила, стоит молодая красивая женщина. Очень бледная и очень грустная. Она неподвижно смотрит на темную воду, прикрывая ладонью плачущие глаза. И никому не приходит в голову, что…','На мосту стоит тело задушенной женщины, забальзамированное особым составом, который позволяет придать трупу любую позу. Поистине дьявольская фантазия. Но еще хуже, что таких тел, горюющих о собственной смерти, найдено уже три. В городе появился…','Расследование ведет полиция Чикаго, но ФБР не доверяет местному профайлеру, считая его некомпетентным. Для такого сложного дела у Бюро есть свой специалист – Зои Бентли. Она – лучшая из лучших. Во-многом потому, что когда-то, много лет назад, лично столкнулась с серийным убийцей ')
Insert into DataBook(Nazvanie,AvtorFIO,Seria,Section,Izdatelstvo,ISBN,Artikyl,Vozrast,GodIzdaniya,Kol_vo_str,Pereplet,Paper,Formatk,Ves,Pathimg,Abz1,Abz2,Abz3)
values ('Страна радости','Стивен Кинг','Король на все времена','Триллеры','Издательство АСТ','978-5-17-120613-0','р5493387','16+','2020','320','Твердый','газетная','130x207 мм','0.28 кг','pack://application:,,,/img/Страна_радости.jpg','Студент Девин Джонс, решивший подработать в парке развлечений "Страна радости", внезапно словно попадает в своеобразный параллельный мир.','Здесь живут по своим правилам, говорят на особом языке и очень не любят, когда кто-то задает "лишние" вопросы. Особенно – если они касаются убийства молодой девушки Линды Грей, тело которой было обнаружено в парке, в павильоне "Дом ужасов".','Пытаясь найти ответы на эти вопросы, Девин понимает: за ярким фасадом парка развлечений скрываются опасные тайны, а если разворошить прошлое обитателей "страны радости", то его собственная жизнь может непостижимым образом измениться раз и навсегда…')
Insert into DataBook(Nazvanie,AvtorFIO,Seria,Section,Izdatelstvo,ISBN,Artikyl,Vozrast,GodIzdaniya,Kol_vo_str,Pereplet,Paper,Formatk,Ves,Pathimg,Abz1,Abz2,Abz3)
values ('Игры Немезиды','Джеймс Кори','Кинофантастика','Зарубежная фантастика','Издательство АСТ','978-5-91878-352-8','р5581184','16+','2020','515','Твердый','Офсетная','159x234 мм','0.59 кг','pack://application:,,,/img/Игры_немезиды.png','Открытие далеких миров повлекло за собой величайшую в истории человечества экспансию. Искатели приключений тысячами отправляются в путешествия на поиски лучшей жизни, а между тем основы власти в Солнечной системе оказываются под угрозой. ','Многие корабли колонистов исчезают без следа. Тайно формируются мощные военные силы. Последний образец протомолекулы похищен. Атаки террористов держат в страхе внутренние планеты.','Грехи прошлого возвращаются, взыскивая высокую плату. В то время как в огне и крови устанавливается новый порядок, Джеймс Холден и команда "Росинанта" вынуждены бороться, чтобы выжить и вернуться в единственный ставшийся у них дом.')
Insert into DataBook(Nazvanie,AvtorFIO,Seria,Section,Izdatelstvo,ISBN,Artikyl,Vozrast,GodIzdaniya,Kol_vo_str,Pereplet,Paper,Formatk,Ves,Pathimg,Abz1,Abz2,Abz3)
values ('Великий Гэтсби','Фицджералд Фрэнсис Скотт','Яркие страницы','Классческая зарубежная проза','Издательство Эксмо','978-5-04-105379-6','р5426428','16+','2020','320','Твердый','Офсетная','131x206 мм','0.3 кг','pack://application:,,,/img/Великий_гэтсби.jpg','Фрэнсис Скотт Фицджеральд – американский классик мировой литературы. Писатель, ярко и беспристрастно отразивший безумную жизнь 20-х годов. Он и сам был плотью от плоти той легендарной эпохи. Но эксцентричность и внешняя позолота канули в прошлое, и в настоящем остались его бессмертные книги.','"Великий Гэтсби" – самый известный роман Фицджеральда, ставший символом "века джаза". Америка, 1925 г., время "сухого закона" и гангстерских разборок, ярких огней и яркой жизни. Но для Джея Гэтсби воплощение американской мечты обернулось настоящей трагедией. А путь наверх, несмотря на славу и богатство, привел к тотальному крушению. Ведь каждый из нас в первую очередь стремится не к материальным благам, а к любви, истинной и вечной…','В издание также включен неоконченный роман "Последний магнат" о владельце огромной студии в Голливуде, настоящем баловене судьбы. Он также воплотил в жизнь мечту, которая стоила утерянного человеческого счастья.')
Insert into DataBook(Nazvanie,AvtorFIO,Seria,Section,Izdatelstvo,ISBN,Artikyl,Vozrast,GodIzdaniya,Kol_vo_str,Pereplet,Paper,Formatk,Ves,Pathimg,Abz1,Abz2,Abz3)
values ('Божественная комедия','Алигьери Данте','Зарубежная классика','Классческая зарубежная поэзия','Издательство АСТ','978-5-17-077960-4','р181371','16+','2019','864','Твердый','газетная','135x208 мм','0.58 кг','pack://application:,,,/img/Божественная_комедия.jpg','Это - "Божественная Комедия"','Уникальное поэтическое произведение, о котором по сию пору отчаянно спорят историки и критики, философы - и даже адепты самых разных мистических и эзотерических учений.','Что же такое эта поэма, по-прежнему не дающая покоя десяткам, сотням людей? Своеобразный "путеводитель" по сложному и красивому миру христианской мифологии? Попытка рационально осмыслить с точки зрения итальянского гуманизма нечто по определнию ИРРАЦИОНАЛЬНОЕ? Или, наконец, просто гениальная, ядовитая и блестящая поэтическая сатира?')

Select AvtorFIO From DataBook Where Nazvanie = 'Божественная комедия'
Select AvtorFIO From DataBook Where Nazvanie = 'Змей и голубка'
Insert Into BookOrder(Nazvanie,Avtor,CardFio,CardNumber,DateOrder,StatusOrder,IDBook,IDCard)
Values('Кровь эльфов','Сапковский Анджей','Nikita Kharitonov Andreevich',20015,'16-10-2020','Просрочен',1,1)
Insert Into BookOrder(Nazvanie,Avtor,CardFio,CardNumber,DateOrder,StatusOrder,IDBook,IDCard)
Values('Страна радости','Стивен Кинг','Petya Makarenko Aleksandrovich',20010,'10-10-2020','Просрочен',5,2)
use Kursach
---------------View----------------
Create view ChangesBook as
Select * From DataBook

Create View ChangesCard as
Select * From DataCards

Create View Debtor as
Select * From BookOrder Where BookOrder.StatusOrder = 'Просрочен'

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

--Exec InsertNewBook 'Божественная комедия','Алигьери Данте','Зарубежная классика','Классческая зарубежная поэзия','Издательство АСТ','978-5-17-077960-4','р181371','16+','2019','864','Твердый','газетная','135x208 мм','0.58 кг','pack://application:,,,/img/Божественная_комедия.jpg','Это - "Божественная Комедия"','Уникальное поэтическое произведение, о котором по сию пору отчаянно спорят историки и критики, философы - и даже адепты самых разных мистических и эзотерических учений.','Что же такое эта поэма, по-прежнему не дающая покоя десяткам, сотням людей? Своеобразный "путеводитель" по сложному и красивому миру христианской мифологии? Попытка рационально осмыслить с точки зрения итальянского гуманизма нечто по определнию ИРРАЦИОНАЛЬНОЕ? Или, наконец, просто гениальная, ядовитая и блестящая поэтическая сатира?'

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
Update BookOrder Set StatusOrder = 'Просрочен' Where GETDATE()> DATEADD(month,1,DateOrder)

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

Select * From QueBook join DataBook on DataBook.IDBook = QueBook.IDBookInQue join DataCards on DataCards.IDCards = QueBook.IDCardInQue Where IDCards = (Select IDCards From DataCards Where CardSurname = 'Makarenko') And IDBook = (Select IDBook From DataBook Where Nazvanie = 'Кровь эльфов')

Insert into QueBook(IDBookInQue,IDCardInQue) values(1,1)

Select * From QueBook join DataBook on DataBook.IDBook = QueBook.IDBookInQue join DataCards on DataCards.IDCards = QueBook.IDCardInQue Where Nazvanie = 'Институт'