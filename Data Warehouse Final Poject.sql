--                                 Madhav Sigdel
--                        Data Warehouse Project 2020 Spring
--                              Tarleton State University
--                                   05/01/2020


-------------------------------------------------------------
----------------Publications_Cat-Table-01--------------------
-------------------------------------------------------------

drop table if exists Publication_raw cascade;
Create table  Publication_raw (Publication_id int,title text,url text,abstract text,date date ,sub_categories text);

COPY  publication_raw
FROM 'C:\Users\madha\OneDrive\Desktop\Data Warehouse Project(Final)\Publication_table_raw.csv' with CSV HEADER;

select * from publication_raw 
where sub_categories is not null
order by Publication_id;
select Publication_id,lower(title),url ,lower(abstract),date,lower(sub_categories) from publication_raw;

--Print Above table with lower case 
--and insert into the  table.

drop table if exists Publication_cat cascade;
Create table  Publication_cat (Publication_id int,title text,url text,abstract text,date date ,sub_categories text);

COPY  publication_cat
FROM 'C:\Users\madha\OneDrive\Desktop\Data Warehouse Project(Final)\Publication_cat.csv' with CSV HEADER;
select * from publication_cat;

-----------------------------------------------------
----------------Subcategories-Table-02---------------
-----------------------------------------------------
--##-First we import categories table then normalize and then add  sub_catgories_id column into it.
drop table if exists categories_raw cascade;
Create table categories_raw(Subcategories text,Categories text);
COPY  categories_raw
FROM 'C:\Users\madha\OneDrive\Desktop\Data Warehouse Project(Final)\categories_raw.csv' with CSV HEADER;
select lower(Subcategories), lower(Categories) from categories_raw;


--##-Normalize the categories table and We write categories table as Subcategories.
drop table if exists Subcategories cascade;
Create table Subcategories(sub_categories_id serial,Subcategories text,Categories text
						 , constraint SC_PK primary key (sub_categories_id ));
COPY  Subcategories
FROM 'C:\Users\madha\OneDrive\Desktop\Data Warehouse Project(Final)\Subcategories.csv' with CSV HEADER;

select * from Subcategories;

--##-We are doing this to replace subcategories by Subcategories_id in Publication_cat Table.
SELECT CONCAT('when  sub_categories= ''',lower(C.Subcategories),'''  then ', C.sub_categories_id) as full_name
FROM Subcategories C;

drop table if exists Publications_raw cascade;
create table  Publications_raw as (select publication_id as publication_id, title,url,abstract,date,
(case 
when  sub_categories= 'earth and planetary astrophysics'  then 1
when  sub_categories= 'high energy astrophysical phenomena'  then 2
when  sub_categories= 'solar and stellar astrophysics'  then 3
when  sub_categories= 'instrumentation and methods for astrophysics'  then 4
when  sub_categories= 'cosmology and nongalactic astrophysics'  then 5
when  sub_categories= 'astrophysics of galaxies'  then 6
when  sub_categories= 'cryptography and security'  then 7
when  sub_categories= 'performance'  then 8
when  sub_categories= 'computer science and game theory'  then 9
when  sub_categories= 'computational geometry'  then 10
when  sub_categories= 'other computer science'  then 11
when  sub_categories= 'computational complexity'  then 12
when  sub_categories= 'digital libraries'  then 13
when  sub_categories= 'networking and internet architecture'  then 14
when  sub_categories= 'symbolic computation'  then 15
when  sub_categories= 'multimedia'  then 16
when  sub_categories= 'numerical analysis'  then 17
when  sub_categories= 'information theory'  then 18
when  sub_categories= 'formal languages and automata theory'  then 19
when  sub_categories= 'emerging technologies'  then 20
when  sub_categories= 'general literature'  then 21
when  sub_categories= 'information retrieval'  then 22
when  sub_categories= 'hardware architecture'  then 23
when  sub_categories= 'learning'  then 24
when  sub_categories= 'software engineering'  then 25
when  sub_categories= 'distributed, parallel, and cluster computing'  then 26
when  sub_categories= 'social and information networks'  then 27
when  sub_categories= 'computer vision and pattern recognition'  then 28
when  sub_categories= 'discrete mathematics'  then 29
when  sub_categories= 'programming languages'  then 30
when  sub_categories= 'sound'  then 31
when  sub_categories= 'human-computer interaction'  then 32
when  sub_categories= 'logic in computer science'  then 33
when  sub_categories= 'computers and society'  then 34
when  sub_categories= 'systems and control'  then 35
when  sub_categories= 'databases'  then 36
when  sub_categories= 'computational engineering, finance, and science'  then 37
when  sub_categories= 'operating systems'  then 38
when  sub_categories= 'robotics'  then 39
when  sub_categories= 'graphics'  then 40
when  sub_categories= 'mathematical software'  then 41
when  sub_categories= 'data structures and algorithms'  then 42
when  sub_categories= 'neural and evolutionary computing'  then 43
when  sub_categories= 'artificial intelligence'  then 44
when  sub_categories= 'computation and language'  then 45
when  sub_categories= 'multiagent systems'  then 46
when  sub_categories= 'statistical mechanics'  then 47
when  sub_categories= 'disordered systems and neural networks'  then 48
when  sub_categories= 'soft condensed matter'  then 49
when  sub_categories= 'strongly correlated electrons'  then 50
when  sub_categories= 'other condensed matter'  then 51
when  sub_categories= 'quantum gases'  then 52
when  sub_categories= 'materials science'  then 53
when  sub_categories= 'mesoscale and nanoscale physics'  then 54
when  sub_categories= 'superconductivity'  then 55
when  sub_categories= 'econometrics'  then 56
when  sub_categories= 'signal processing'  then 57
when  sub_categories= 'audio and speech processing'  then 58
when  sub_categories= 'image and video processing'  then 59
when  sub_categories= 'experiment'  then 60
when  sub_categories= 'phenomenology'  then 61
when  sub_categories= 'lattice'  then 62
when  sub_categories= 'theory'  then 63
when  sub_categories= 'differential geometry'  then 64
when  sub_categories= 'analysis of pdes'  then 65
when  sub_categories= 'representation theory'  then 66
when  sub_categories= 'logic'  then 67
when  sub_categories= 'commutative algebra'  then 68
when  sub_categories= 'symplectic geometry'  then 69
when  sub_categories= 'general mathematics'  then 70
when  sub_categories= 'history and overview'  then 71
when  sub_categories= 'complex variables'  then 72
when  sub_categories= 'geometric topology'  then 73
when  sub_categories= 'number theory'  then 74
when  sub_categories= 'k-theory and homology'  then 75
when  sub_categories= 'combinatorics'  then 76
when  sub_categories= 'mathematical physics'  then 77
when  sub_categories= 'probability'  then 78
when  sub_categories= 'optimization and control'  then 79
when  sub_categories= 'classical analysis and odes'  then 80
when  sub_categories= 'metric geometry'  then 81
when  sub_categories= 'functional analysis'  then 82
when  sub_categories= 'group theory'  then 83
when  sub_categories= 'spectral theory'  then 84
when  sub_categories= 'dynamical systems'  then 85
when  sub_categories= 'information theory'  then 86
when  sub_categories= 'rings and algebras'  then 87
when  sub_categories= 'algebraic geometry'  then 88
when  sub_categories= 'algebraic topology'  then 89
when  sub_categories= 'quantum algebra'  then 90
when  sub_categories= 'general topology'  then 91
when  sub_categories= 'statistics theory'  then 92
when  sub_categories= 'category theory'  then 93
when  sub_categories= 'numerical analysis'  then 94
when  sub_categories= 'operator algebras'  then 95
when  sub_categories= 'adaptation and self-organizing systems'  then 96
when  sub_categories= 'chaotic dynamics'  then 97
when  sub_categories= 'pattern formation and solitons'  then 98
when  sub_categories= 'cellular automata and lattice gases'  then 99
when  sub_categories= 'exactly solvable and integrable systems'  then 100
when  sub_categories= 'computational physics'  then 101
when  sub_categories= 'general relativity and quantum cosmology'  then 102
when  sub_categories= 'nonlinear sciences'  then 103
when  sub_categories= 'nuclear theory'  then 104
when  sub_categories= 'optics'  then 105
when  sub_categories= 'condensed matter'  then 106
when  sub_categories= 'accelerator physics'  then 107
when  sub_categories= 'history and philosophy of physics'  then 108
when  sub_categories= 'geophysics'  then 109
when  sub_categories= 'mathematical physics'  then 110
when  sub_categories= 'classical physics'  then 111
when  sub_categories= 'physics and society'  then 112
when  sub_categories= 'biological physics'  then 113
when  sub_categories= 'medical physics'  then 114
when  sub_categories= 'plasma physics'  then 115
when  sub_categories= 'atomic and molecular clusters'  then 116
when  sub_categories= 'space physics'  then 117
when  sub_categories= 'atmospheric and oceanic physics'  then 118
when  sub_categories= 'popular physics'  then 119
when  sub_categories= 'fluid dynamics'  then 120
when  sub_categories= 'data analysis, statistics and probability'  then 121
when  sub_categories= 'chemical physics'  then 122
when  sub_categories= 'quantum physics'  then 123
when  sub_categories= 'atomic physics'  then 124
when  sub_categories= 'high energy physics'  then 125
when  sub_categories= 'astrophysics'  then 126
when  sub_categories= 'physics education'  then 127
when  sub_categories= 'instrumentation and detectors'  then 128
when  sub_categories= 'applied physics'  then 129
when  sub_categories= 'general physics'  then 130
when  sub_categories= 'nuclear experiment'  then 131
when  sub_categories= 'tissues and organs'  then 132
when  sub_categories= 'populations and evolution'  then 133
when  sub_categories= 'neurons and cognition'  then 134
when  sub_categories= 'biomolecules'  then 135
when  sub_categories= 'quantitative methods'  then 136
when  sub_categories= 'subcellular processes'  then 137
when  sub_categories= 'molecular networks'  then 138
when  sub_categories= 'other quantitative biology'  then 139
when  sub_categories= 'cell behavior'  then 140
when  sub_categories= 'genomics'  then 141
when  sub_categories= 'portfolio management'  then 142
when  sub_categories= 'risk management'  then 143
when  sub_categories= 'statistical finance'  then 144
when  sub_categories= 'pricing of securities'  then 145
when  sub_categories= 'computational finance'  then 146
when  sub_categories= 'general finance'  then 147
when  sub_categories= 'economics'  then 148
when  sub_categories= 'trading and market microstructure'  then 149
when  sub_categories= 'mathematical finance'  then 150
when  sub_categories= 'computation'  then 151
when  sub_categories= 'methodology'  then 152
when  sub_categories= 'other statistics'  then 153
when  sub_categories= 'applications'  then 154
when  sub_categories= 'machine learning'  then 155
--when  sub_categories= 'statistics theory'  then 156
else 156
 end)as sub_categories_id from Publication_cat
order by publication_id);
select * from publications_raw;
--##-We use this Publications_raw table to create Publication_Table and Pub_Sub_Cat_Table below

---------------------------------------------------------------
---------------------Publication_table-03----------------------
---------------------------------------------------------------
--We write this code to create Publication
select distinct  publication_id, title,url,abstract,date from publications_raw
order by publication_id;	

drop table if exists Publication_table cascade;
create table Publication_table( Publication_ID int,title text,url text,abstract text,date date
							  ,constraint Pt_PK primary key (Publication_ID)
							  );
							  
							  	

COPY  Publication_table
FROM 'C:\Users\madha\OneDrive\Desktop\Data Warehouse Project(Final)\Publication_table.csv' with CSV HEADER;

select * from Publication_table
where publication_id =1401;
select distinct publication_id from Publication_table;


-------------Pub_Sub_Cat_Table-04------------------
---------Join Publication and Category Table------
--------------------------------------------------

drop table if exists Pub_Sub_Cat_Table cascade;
create table Pub_Sub_Cat_table(publication_id int
							   ,sub_categories_id int
							   , constraint PSC_PK1 primary key (publication_id,sub_categories_id )
							   , constraint Pb_FK1 foreign key (Publication_ID) references Publication_table( Publication_ID)
  	                           , constraint SC_FK1 foreign key (sub_categories_id) references Subcategories(sub_categories_id)
							  ) ;
--We use this code to create table Pub_Sub_Cat_Table from Publications_raw  							  
select   distinct publication_id,sub_categories_id from publications_raw order by publication_id,sub_categories_id ;	

COPY Pub_Sub_Cat_Table --We take Distinct in Above Table{Publications_raw.csv}
FROM 'C:\Users\madha\OneDrive\Desktop\Data Warehouse Project(Final)\Pub_Sub_Cat_Table.csv' with CSV HEADER;

select   * from Pub_Sub_Cat_Table;

-------------------------------------------------
---------------------Author's table-05-----------
-------------------------------------------------
--I use this code according to the instruction of my professor (Dr.Scott Cook) (using inner join)
select distinct  publication_id,lower(first_name)as first_name,lower(last_name) as last_name from Authors_new A
inner join Publication_table B
using(Publication_Id) order by first_name;
/*
drop table if exists Authors_raw cascade;
create table Authors_raw(Publication_Id	int,first_name text,	last_name text);
COPY Authors_raw
FROM 'C:\Users\madha\OneDrive\Desktop\Data Warehouse Project\Authors_raw.csv' with CSV HEADER;
select * from Authors_raw;

select distinct  publication_id,lower(first_name) as first_name,lower(last_name) as last_name from Authors_raw
order by publication_id;
*/

drop table if exists Authors_new cascade;
create table Authors_new(Publication_Id	int,first_name text,	last_name text);
COPY Authors_new
FROM 'C:\Users\madha\OneDrive\Desktop\Data Warehouse Project(Final)\Authors_new.csv' with CSV HEADER;
select * from Authors_new;



----------------------------------------------------------------------
----------------------Author's Table-06-------------------------------
----------------------------------------------------------------------

drop table if exists Authors cascade;
create table Authors(Author_id serial,first_name text,last_name text );
COPY Authors
FROM 'C:\Users\madha\OneDrive\Desktop\Data Warehouse Project(Final)\Authors.csv' with CSV HEADER;
select * from Authors;

--We use this output to write case function for Author_Publication.
SELECT CONCAT('when first_name= ''',lower(C.first_name),''' and ', 'last_name= ''',lower(C.last_name),''' then ', C.Author_id) as full_name
FROM Authors C;


drop table if exists Author_Publication cascade;
create table Author_Publication as(select Publication_Id, first_name,last_name , 
(case 
when first_name= 'a.' and last_name= 'glatz' then 1
when first_name= 'a.' and last_name= 'frasca' then 2
when first_name= 'a.' and last_name= 'koitzsch' then 3
when first_name= 'a. a.' and last_name= 'kordyuk' then 4
when first_name= 'a. c.' and last_name= 'hewson' then 5
when first_name= 'a. o.' and last_name= 'barvinsky' then 6
when first_name= 'a. p.' and last_name= 'hatzes' then 7
when first_name= 'a. p.' and last_name= 'filin' then 8
when first_name= 'a. s.' and last_name= 'konstantinov' then 9
when first_name= 'a. t.' and last_name= 'savici' then 10
when first_name= 'a. v.' and last_name= 'inyakin' then 11
when first_name= 'a. yu.' and last_name= 'polyarush' then 12
when first_name= 'alexander yu.' and last_name= 'orlov' then 13
when first_name= 'alvaro' and last_name= 'pelayo' then 14
when first_name= 'andrea' and last_name= 'conti' then 15
when first_name= 'andrew' and last_name= 'gould' then 16
when first_name= 'andrew d.' and last_name= 'ludlow' then 17
when first_name= 'anon' and last_name= 'plangprasopchok' then 18
when first_name= 'anthony f. j.' and last_name= 'van raan' then 19
when first_name= 'antoine' and last_name= 'delcroix' then 20
when first_name= 'b.' and last_name= 'buechner' then 21
when first_name= 'b. l.' and last_name= 'altshuler' then 22
when first_name= 'b. scott' and last_name= 'gaudi' then 23
when first_name= 'baptiste' and last_name= 'sirjean' then 24
when first_name= 'benjamin' and last_name= 'schmidt' then 25
when first_name= 'bernard' and last_name= 'borderie' then 26
when first_name= 'brendan' and last_name= 'mullan' then 27
when first_name= 'bruce g.' and last_name= 'elmegreen' then 28
when first_name= 'c. d.' and last_name= 'mackay' then 29
when first_name= 'chenggang' and last_name= 'zhuang' then 30
when first_name= 'chris' and last_name= 'pearson' then 31
when first_name= 'corinna' and last_name= 'kollath' then 32
when first_name= 'd.' and last_name= 'trevese' then 33
when first_name= 'd.' and last_name= 'paris' then 34
when first_name= 'd.' and last_name= 'petz' then 35
when first_name= 'd. f. a.' and last_name= 'winters' then 36
when first_name= 'd. m.' and last_name= 'basko' then 37
when first_name= 'd. m.' and last_name= 'segal' then 38
when first_name= 'd. s.' and last_name= 'novikov' then 39
when first_name= 'damian c.' and last_name= 'swift' then 40
when first_name= 'darius' and last_name= 'abramavicius' then 41
when first_name= 'david p.' and last_name= 'bennett' then 42
when first_name= 'david t.' and last_name= 'kettler' then 43
when first_name= 'davide' and last_name= 'meloni' then 44
when first_name= 'debra meloy' and last_name= 'elmegreen' then 45
when first_name= 'delfim f. m.' and last_name= 'torres' then 46
when first_name= 'e.' and last_name= 'marilli' then 47
when first_name= 'eisuke' and last_name= 'abe' then 48
when first_name= 'elham' and last_name= 'kashefi' then 49
when first_name= 'eric' and last_name= 'sonnendrcker' then 50
when first_name= 'eric' and last_name= 'bonnet' then 51
when first_name= 'f.' and last_name= 'hiai' then 52
when first_name= 'f.' and last_name= 'vagnetti' then 53
when first_name= 'francesca' and last_name= 'gulminelli' then 54
when first_name= 'francesca' and last_name= 'rossi' then 55
when first_name= 'francesco' and last_name= 'santini' then 56
when first_name= 'francesco' and last_name= 'sannino' then 57
when first_name= 'francis' and last_name= 'filbet' then 58
when first_name= 'fr??d??rique' and last_name= 'battin-leclerc' then 59
when first_name= 'fuquan' and last_name= 'fang' then 60
when first_name= 'g.' and last_name= 'tsiropoula' then 61
when first_name= 'g. i.' and last_name= 'britvich' then 62
when first_name= 'g. m.' and last_name= 'stirpe' then 63
when first_name= 'george' and last_name= 'leitmann' then 64
when first_name= 'glenn j.' and last_name= 'white' then 65
when first_name= 'h.' and last_name= 'berger' then 66
when first_name= 'h.' and last_name= 'mineo' then 67
when first_name= 'h.' and last_name= 'eschrig' then 68
when first_name= 'hai-hu' and last_name= 'wen' then 69
when first_name= 'herve' and last_name= 'mohrbach' then 70
when first_name= 'hidenori' and last_name= 'watarai' then 71
when first_name= 'hideo' and last_name= 'matsuhara' then 72
when first_name= 'hirosi' and last_name= 'ooguri' then 73
when first_name= 'hitoshi' and last_name= 'hanami' then 74
when first_name= 'huan' and last_name= 'yang' then 75
when first_name= 'hyung mok' and last_name= 'lee' then 76
when first_name= 'i.' and last_name= 'grabec' then 77
when first_name= 'i. l.' and last_name= 'aleiner' then 78
when first_name= 'i. s.' and last_name= 'beloborodov' then 79
when first_name= 'i. y.' and last_name= 'korolkov' then 80
when first_name= 'igor m.' and last_name= 'kulic' then 81
when first_name= 'ioana' and last_name= 'paun' then 82
when first_name= 'j.' and last_name= 'setiawan' then 83
when first_name= 'j.' and last_name= 'geck' then 84
when first_name= 'j.' and last_name= 'bauer' then 85
when first_name= 'j.' and last_name= 'fink' then 86
when first_name= 'j.' and last_name= 'giannikakis' then 87
when first_name= 'j. -h.' and last_name= 'chung' then 88
when first_name= 'j. a.' and last_name= 'tjon' then 89
when first_name= 'j. e.' and last_name= 'lorenzo' then 90
when first_name= 'jean-andr??' and last_name= 'marti' then 91
when first_name= 'jinhua' and last_name= 'jiang' then 92
when first_name= 'joaquim' and last_name= 'ortega-cerda' then 93
when first_name= 'john' and last_name= 'harnad' then 94
when first_name= 'john h.' and last_name= 'schwarz' then 95
when first_name= 'joseph' and last_name= 'schechter' then 96
when first_name= 'jun' and last_name= 'ye' then 97
when first_name= 'k.' and last_name= 'biazzo' then 98
when first_name= 'k.' and last_name= 'koepernik' then 99
when first_name= 'k.' and last_name= 'tziotziou' then 100
when first_name= 'k.' and last_name= 'yamada' then 101
when first_name= 'k.' and last_name= 'tsushima' then 102
when first_name= 'k. v.' and last_name= 'datsko' then 103
when first_name= 'kae' and last_name= 'nemoto' then 104
when first_name= 'kalobaran' and last_name= 'maiti' then 105
when first_name= 'katsunori' and last_name= 'iwasaki' then 106
when first_name= 'kristina' and last_name= 'lerman' then 107
when first_name= 'l.' and last_name= 'girardi' then 108
when first_name= 'l.' and last_name= 'pasquini' then 109
when first_name= 'l.' and last_name= 'da silva' then 110
when first_name= 'lei' and last_name= 'shan' then 111
when first_name= 'luca' and last_name= 'stabellini' then 112
when first_name= 'm.' and last_name= 'knupfer' then 113
when first_name= 'm.' and last_name= 'vogel' then 114
when first_name= 'marie-france' and last_name= 'rivet' then 115
when first_name= 'martin m.' and last_name= 'boyd' then 116
when first_name= 'masakiyo' and last_name= 'kitazawa' then 117
when first_name= 'maurizio' and last_name= 'lusignoli' then 118
when first_name= 'michael' and last_name= 'k??hl' then 119
when first_name= 'michael' and last_name= 'oberguggenberger' then 120
when first_name= 'michael' and last_name= 'gutnic' then 121
when first_name= 'michael b.' and last_name= 'green' then 122
when first_name= 'minkyu' and last_name= 'kim' then 123
when first_name= 'moo-young' and last_name= 'chun' then 124
when first_name= 'muriel' and last_name= 'medard' then 125
when first_name= 'myung gyoon' and last_name= 'lee' then 126
when first_name= 'myungshin' and last_name= 'im' then 127
when first_name= 'n. m.' and last_name= 'law' then 128
when first_name= 'narae' and last_name= 'hwang' then 129
when first_name= 'nicolas' and last_name= 'besse' then 130
when first_name= 'nicolas le' and last_name= 'neindre' then 131
when first_name= 'ning' and last_name= 'kang' then 132
when first_name= 'o. g.' and last_name= 'tchikilev' then 133
when first_name= 'o. p.' and last_name= 'yushchenko' then 134
when first_name= 'olivier' and last_name= 'herbinet' then 135
when first_name= 'ozlem' and last_name= 'yesiltas' then 136
when first_name= 'p.' and last_name= 'young' then 137
when first_name= 'p.' and last_name= 'padovani' then 138
when first_name= 'p.' and last_name= 'heinzel' then 139
when first_name= 'p. l.' and last_name= 'russo' then 140
when first_name= 'paolo' and last_name= 'lipari' then 141
when first_name= 'patricio s.' and last_name= 'letelier' then 142
when first_name= 'paul-marie' and last_name= 'marquaire' then 143
when first_name= 'pedro' and last_name= 'resende' then 144
when first_name= 'peter' and last_name= 'olsson' then 145
when first_name= 'prakash' and last_name= 'panangaden' then 146
when first_name= 'qi' and last_name= 'li' then 147
when first_name= 'r. c.' and last_name= 'thompson' then 148
when first_name= 'r. k.' and last_name= 'thakur' then 149
when first_name= 'rafal' and last_name= 'oszwaldowski' then 150
when first_name= 'ramazan' and last_name= 'sever' then 151
when first_name= 'ren??' and last_name= 'fournet' then 152
when first_name= 's.' and last_name= 'catalano' then 153
when first_name= 's.' and last_name= 'teitel' then 154
when first_name= 's. a.' and last_name= 'akimenko' then 155
when first_name= 's. bilge' and last_name= 'ocak' then 156
when first_name= 's. n.' and last_name= 'yang' then 157
when first_name= 's. t.' and last_name= 'hodgkin' then 158
when first_name= 's. v.' and last_name= 'borisenko' then 159
when first_name= 's. v.' and last_name= 'laptev' then 160
when first_name= 'sameer m.' and last_name= 'ikhdair' then 161
when first_name= 'samuele' and last_name= 'bandi' then 162
when first_name= 'sebastian' and last_name= 'blatt' then 163
when first_name= 'sebastien g. r.' and last_name= 'louis' then 164
when first_name= 's??rgio' and last_name= 'marcelino' then 165
when first_name= 'seth m.' and last_name= 'foreman' then 166
when first_name= 'shaul' and last_name= 'mukamel' then 167
when first_name= 'shingo' and last_name= 'katsumoto' then 168
when first_name= 'shinki' and last_name= 'oyabu' then 169
when first_name= 'soojong' and last_name= 'pak' then 170
when first_name= 'stefano' and last_name= 'bistarelli' then 171
when first_name= 'svetlana v.' and last_name= 'boriskina' then 172
when first_name= 't. p.' and last_name= 'spiller' then 173
when first_name= 'taehyun' and last_name= 'kim' then 174
when first_name= 'takao' and last_name= 'nakagawa' then 175
when first_name= 'takehiko' and last_name= 'wada' then 176
when first_name= 'tanya' and last_name= 'zelevinsky' then 177
when first_name= 'teiji' and last_name= 'kunihiro' then 178
when first_name= 'thierry' and last_name= 'giamarchi' then 179
when first_name= 'thomas' and last_name= 'zanon-willette' then 180
when first_name= 'thomas' and last_name= 'ferguson' then 181
when first_name= 'thomas a.' and last_name= 'trainor' then 182
when first_name= 'tilman' and last_name= 'sauer' then 183
when first_name= 'tomoi' and last_name= 'koide' then 184
when first_name= 'toshinobu' and last_name= 'takagi' then 185
when first_name= 'u.' and last_name= 'schuehle' then 186
when first_name= 'ugo' and last_name= 'montanari' then 187
when first_name= 'una-may' and last_name= 'o reilly' then 188
when first_name= 'v.' and last_name= 'zitelli' then 189
when first_name= 'v. a.' and last_name= 'uvarov' then 190
when first_name= 'v. a.' and last_name= 'khmelnikov' then 191
when first_name= 'v. a.' and last_name= 'polyakov' then 192
when first_name= 'v. a.' and last_name= 'duk' then 193
when first_name= 'v. b.' and last_name= 'zabolotnyy' then 194
when first_name= 'v. f.' and last_name= 'obraztsov' then 195
when first_name= 'v. i.' and last_name= 'romanovsky' then 196
when first_name= 'v. i.' and last_name= 'shelikhov' then 197
when first_name= 'v. m.' and last_name= 'biryukov' then 198
when first_name= 'v. m.' and last_name= 'leontiev' then 199
when first_name= 'v. m.' and last_name= 'vinokur' then 200
when first_name= 'v. n.' and last_name= 'bolotov' then 201
when first_name= 'v. p.' and last_name= 'novikov' then 202
when first_name= 'valeria m.' and last_name= 'rosa' then 203
when first_name= 'varun' and last_name= 'aggarwal' then 204
when first_name= 'velio' and last_name= 'tralli' then 205
when first_name= 'viet-anh' and last_name= 'nguyen' then 206
when first_name= 'vincent' and last_name= 'danos' then 207
when first_name= 'vincent l.' and last_name= 'fish' then 208
when first_name= 'w.' and last_name= 'noertershaeuser' then 209
when first_name= 'w. j.' and last_name= 'munro' then 210
when first_name= 'wei' and last_name= 'bao' then 211
when first_name= 'xiaoxing' and last_name= 'xi' then 212
when first_name= 'xin' and last_name= 'yan' then 213
when first_name= 'yasuhiro' and last_name= 'iye' then 214
when first_name= 'yi' and last_name= 'cui' then 215
when first_name= 'ying' and last_name= 'chen' then 216
when first_name= 'ying' and last_name= 'jia' then 217
when first_name= 'yingzi' and last_name= 'zhang' then 218
when first_name= 'yoshiaki' and last_name= 'hashimoto' then 219
when first_name= 'yuguang' and last_name= 'zhang' then 220
when first_name= 'yukio' and last_name= 'nemoto' then 221
when first_name= 'yum-tong' and last_name= 'siu' then 222
when first_name= 'zhenlei' and last_name= 'zhang' then 223
when first_name= 'zikui' and last_name= 'liu' then 224
else null
end) as Author_Id
from Authors_new);
select  * from Author_Publication
where Author_id is not null
order by author_id;

drop table if exists Author_Publication cascade;
create table Author_Publication (Publication_Id int, first_name text,last_name text,Author_Id int); 
COPY  Author_Publication
FROM 'C:\Users\madha\OneDrive\Desktop\Data Warehouse Project(Final)\Author_Publication.csv' with CSV HEADER;
select * from Author_Publication;


select   distinct author_id, first_name,Last_name from Author_Publication
order by author_id;

select   distinct publication_id,Author_id  from Author_Publication
order by author_id;



drop table if exists Authors cascade;
create table Authors(Author_id serial,first_name text,last_name text 
					,constraint A_PK primary key (Author_id ) );
COPY Authors
FROM 'C:\Users\madha\OneDrive\Desktop\Data Warehouse Project(Final)\Authors.csv' with CSV HEADER;
select * from Authors;
select * from Authors order by Author_id; 

--------------------------------------------------------------------
-------------------Author_Bridge Table 07---------------------------
--------------------------------------------------------------------
select  distinct 
Publication_id,
Author_id from Author_Publication
where author_id is not null order by Author_id;

select author_id from authors;

drop table if exists Author_Bridge cascade;
Create table Author_Bridge(Publication_Id int,author_id int
						, constraint AB_PK1 primary key (publication_id,author_id ) 
					, constraint AB_FK1 foreign key (Publication_Id) references Publication_table(Publication_Id)
  	                    ,constraint AB_FK2 foreign key (author_id) references Authors(Author_id) 
						  );
 
COPY Author_Bridge
FROM 'C:\Users\madha\OneDrive\Desktop\Data Warehouse Project(Final)\Author_Bridge.csv' with CSV HEADER;
select *
--Publication_Id ,author_id  
from Author_Bridge;


select B.* from Author_Bridge A
inner join publication_table B
using(publication_id);
--------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------
--Qn.1-For each author, what proportion of their papers are in each category

select F.*,
      round(F.Author_No_in_Cat/F.No_Paper_in_cat,2) as Paper_proportion
	 -- ,F.No_Paper_in_cat/ (F.Author_No_in_Cat*5)

from(select distinct --D.*
                --D.Author_id
                D.Author_name
                ,D.categories
				,round(count(D.Publication_id) OVER(PARTITION BY D.categories),2) No_Paper_in_cat
                ,round(count(D.categories) OVER(PARTITION  BY D.Author_name ),2)AS Author_No_in_Cat
from
(select A.*
,C.* 
,F.*,concat(F.first_name,' ',F.last_name) as Author_name
from Publication_table A
inner join Pub_Sub_Cat_Table B
using(publication_id)
inner join Subcategories C
using(Sub_categories_id)
inner join Author_Bridge as E
 using(Publication_id)
inner join Authors F
using(Author_id)
) as D) as F ;





--Qn.2 What is are the mean and variance of the length of titles (or abstracts) in each category?

/*
select Publication_id
      ,title
      ,Abstract
	  ,categories,title_mean,Title_Variance,Abstract_mean,Abstract_Variance as Abstract_Variance
FROM (
*/	
SELECT E.Publication_id
      ,E.title
      ,E.Abstract
	  ,E.categories
     ,ROUND(E.Title_mean,2) as Title_mean
	 ,ROUND(E.Title_Ev_sq-E.Title_mean^2) AS Title_Variance
	 ,ROUND(E.Abstract_mean,2) as Abstract_mean
	 ,ROUND(E.Abstract_Ev_sq-E.Abstract_mean^2) AS Abstract_Variance
	 
From(	 
select D.*, length(D.title) AS X
,AVG(length(D.title)) OVER(PARTITION  BY D.Categories)AS Title_mean
,AVG(length(D.title)^2) OVER(PARTITION  BY D.Categories)AS Title_Ev_sq	
,AVG(length(D.Abstract))  OVER(PARTITION  BY D.Categories)AS Abstract_mean	
,AVG(length(D.Abstract)^2) OVER(PARTITION  BY D.Categories)AS Abstract_Ev_sq
from (select A.*
,C.* 
from Publication_table A
inner join Pub_Sub_Cat_Table B
using(publication_id)
inner join Subcategories C
using(Sub_categories_id)) as D) as E
--) AS F
;
	  



--Qn-3 Find the Publication_id, title, url, abstract ,categories and Author's full name  who have published paper in category
--     'Physics' and 'math' 



select D.Publication_id, D.title, D.url, D.abstract ,D.categories,D.Author_name,D.date 
from(select A.*
,C.* 
--,F.author_id 
,concat(F.first_name,' ',F.last_name) as Author_name
from Publication_table as  A
inner join Pub_Sub_Cat_Table B
using(publication_id)	 
inner join Subcategories C
using(Sub_categories_id)
inner join Author_Bridge as E
 using(Publication_id)
inner join Authors F
using(Author_id) ) D
 where D.categories in('physics','mathematics')	 
 ;


--Qn.4 Give the list of publication_id, title, abstract and categories which are published in June belong to Subcategory 'astrophysics'.

select A.publication_id, A.title,A.abstract,C.categories
from publication_table A
inner join Pub_Sub_Cat_Table B
using(publication_id)
inner join Subcategories C
using(Sub_categories_id)
where subcategories='astrophysics'
and  A.date between '2007-06-01' and '2007-06-30'
;


--Qn.1-For each author, what proportion of their papers are in each category

select F.*,
      round(F.Author_No_in_Cat/F.No_Paper_in_cat,2) as Paper_proportion
	 -- ,F.No_Paper_in_cat/ (F.Author_No_in_Cat*5)

from(select distinct --D.*
                --D.Author_id
                D.Author_name
                ,D.categories
				,round(count(D.Publication_id) OVER(PARTITION BY D.categories),2) AS No_Paper_in_cat
                ,round(count(D.categories) OVER(PARTITION  BY D.Author_name ),2)AS Author_No_in_Cat
from
(select A.*
,C.* 
,F.*,concat(F.first_name,' ',F.last_name) as Author_name
from Publication_table A
inner join Pub_Sub_Cat_Table B
using(publication_id)
inner join Subcategories C
using(Sub_categories_id)
inner join Author_Bridge as E
 using(Publication_id)
inner join Authors F
using(Author_id)
) as D) as F ;
