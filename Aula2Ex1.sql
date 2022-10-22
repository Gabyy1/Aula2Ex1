Create DataBase Aula2Ex1
Go
Use Aula2Ex1
Go



Create Table Filme (
id            int                                not null,
titulo        varchar(40)                        not null,
ano           int            Check(ano <= 2021)      null
Primary Key (id)
)
Go



Create Table Estrela (
id            int       not null,
nome        varchar(50) not null,

Primary Key (id)
)
Go



Create Table Cliente (
num_cadastro       int                                    not null,
nome               varchar(70)                            not null,
logradouro         varchar(150)                           not null,
num                int                Check(num > 0)      not null,
cep                char(8)            Check(Len (cep) = 8)    null
Primary Key (num_cadastro)
)
Go



Create Table Filme_Estrela (
Filmeid          int        not null,
Estrelaid        int        not null
Foreign Key (Filmeid)
    References Filme (id)
)
Go



Create Table DVD (
num                    int                  not null,
data_fabricacao        date                 not null,
Filmeid                int                  not null
Primary Key (num)
Foreign key (Filmeid)
    References Filme (id)
)



Create Table Locacao (
DVDnum                   int                                           not null,
Clientenum_cadastro      int                                           not null,
data_locacao             date     Default(GetDate())                   not null,
data_devolucao           date                                          not null,
valor                    decimal(7,2) Check(valor > 0)                 not null
Primary Key (data_locacao, Clientenum_cadastro,  DVDnum)
Foreign Key (DVDnum)
    References DVD (num),
Foreign Key (Clientenum_cadastro)
    References Cliente (num_cadastro),
Constraint check_dt Check(data_devolucao > data_locacao)
)
Go



Alter Table Estrela
Add        nomereal    varchar(50)        null
Go



Alter Table Filme
Alter Column    titulo    varchar(80) not null
Go



Insert Into Filme (id, titulo, ano) Values
(1001, 'Whiplash', 2015),
(1002, 'Birdman', 2015),
(1003, 'Interestelar', 2014),
(1004, 'A Culpa é das estrelas', 2014),
(1005, 'Alexandre e o Dia Terrível, Horrível, Espantoso e Horroroso', 2014),
(1006, 'Sing', 2016)



Insert Into Estrela (id,  nome, nomereal) Values
(9901, 'Michael Keaton', 'Michael John Douglas'),
(9902, 'Emma Stone', 'Emily Jean Stone'),
(9003, 'Miles Teller', null),
(9004, 'Steve Carell', 'Steven John Carell'),
(9905, 'Jennifer Garner', 'Jennifer Anne Garner')



Insert Into Filme_Estrela (Filmeid, Estrelaid) Values
(1002, 9901),
(1002, 9902),
(1001, 9903),
(1005, 9904),
(1005, 9905)



Insert Into DVD (num, data_fabricacao, Filmeid) Values
(10001, '20201202', 1001),
(10002, '20191018', 1002),
(10003, '20200403', 1003),
(10004, '20201202', 1001),
(10005, '20191018', 1004),
(10006, '20200403', 1002),
(10007, '20201202', 1005),
(10008, '20191018', 1002),
(10009, '20200403', 1003)



Insert Into Cliente (num_cadastro, nome, logradouro, num, cep) Values
(5501, 'Matilde Luz', 'Rua Síria', 150, '03086040'),
(5502, 'Carlos Carreiro', 'Rua Bartolomeu Aires', 1250, '04419110'),
(5503, 'Daniel Ramalho', 'Rua Itajutiba', 169, null),
(5504, 'Roberta Bento', 'Rua Jayme Von Rosenburg', 36, null),
(5505, 'Rosa Cerqueira', 'Rua Arnaldo Simões Pinto', 235, '02917110')



Insert Into Locacao (DVDnum, Clientenum_cadastro, data_locacao, data_devolucao, valor) Values
(10001, 5502, '20210218', '20210221', 3.50),
(10009, 5502, '20210218', '20210221', 3.50),
(10002, 5503, '20210218', '20210219', 3.50),
(10002, 5505, '20210220', '20210223', 3.00),
(10004, 5505, '20210220', '20210223', 3.00),
(10005, 5505, '20210220', '20210223', 3.00),
(10001, 5501, '20210224', '20210226', 3.50),
(10008, 5501, '20210224', '20210226', 3.50)

Update Cliente
Set cep = '08411150'
Where num_cadastro = 5503

Update Cliente 
Set cep = '02918190'
Where num_cadastro = 5504

Update Locacao
Set valor = 3.25
Where data_locacao = '20210218' and Clientenum_cadastro = 5502

Update Locacao
Set valor = 3.10
Where data_locacao = '20210224' and Clientenum_cadastro = 5501

Update DVD
Set data_fabricacao = '20190714'
Where num = 10005

Update Estrela
Set nomereal = 'Miles Alexander Teller'
Where nome = 'Miles Teller'

Delete Filme
Where titulo = 'Sing'

Select titulo From Filme
Where ano = 2014

Select id, ano From Filme
Where titulo = 'Birdman'

Select id, ano From Filme
Where titulo Like '%plash' 

Select*From Estrela
Where nome Like 'Steve%'

Select FilmeId, Convert (char(10), data_fabricacao, 103) As fab From DVD
Where data_fabricacao >= '20200101'

Select DVDnum, data_locacao, data_devolucao, valor, Cast( valor + 2.00 As Decimal(72)) As novo_valor From Locacao
Where Clientenum_cadastro = 5505

Select logradouro, num, cep From Cliente
Where nome = 'Matilde Luz'

Select nomereal From Estrela
Where nome = 'Michael Keaton'

Select num_cadastro, nome, logradouro + ' N°:' + Cast (num As Varchar(5)) + ' CEP:' + cep As end_comp From Cliente
Where num_cadastro >= 5503




Select*From DVD
Select*From Locacao
Select*From Cliente
Select*From Filme





