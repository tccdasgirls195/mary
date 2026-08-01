create database MODELO_TCC;

use MODELO_TCC;

create table administrador (
id_administrador int primary key auto_increment,
email varchar (80)  not null,
senha varchar (20)  not null
);

create table coordenador (
id_coordenador int primary key auto_increment,
email varchar (80)  not null,
senha varchar (20)  not null,
curso ENUM('DS', 'ADM', 'AUT', 'RH'),
id_administrador int not null,
foreign key (id_administrador) references administrador (id_administrador)
);

create table professor (
id_professor int primary key auto_increment,
email varchar (80)  not null,
senha varchar (20)  not null,
id_coordenador int not null,
foreign key (id_coordenador) references coordenador (id_coordenador),
id_administrador int not null,
foreign key (id_administrador) references administrador (id_administrador)
);

create table turma (
id_turma int primary key auto_increment,
serie ENUM('1°', '2°', '3°'),
curso ENUM('DS', 'ADM', 'AUT', 'RH'),
id_coordenador int not null,
foreign key (id_coordenador) references coordenador (id_coordenador)
);

create table representante (
id_representante int primary key auto_increment,
email varchar (80) not null,
senha varchar (20)  not null,
id_turma int not null,
foreign key (id_turma) references turma (id_turma)
);

create table gestao (
id_gestao int primary key auto_increment,
email varchar (80)  not null,
senha varchar (20)  not null,
id_administrador int not null,
foreign key (id_administrador) references administrador (id_administrador)
);

create table eventos (
id_eventos int primary key auto_increment,
nome varchar (80)  not null,
descr varchar (120)  not null,
data_evento date  not null,
tipo enum ('Prova','Seminário','Atividade', 'Evento', 'Palestra') not null
);

create table calendario (
id_calendario int primary key auto_increment,
id_eventos int,
foreign key (id_eventos)
references eventos(id_eventos)  
);

create table ambientes (
id_ambientes int primary key auto_increment,
nome varchar (80) not null,
tipo ENUM('DS', 'ADM','AUT', 'Auditório') not null
);

create table agendamentos (
id_agendamentos int primary key auto_increment,
nome_prof varchar (80) not null,
descr varchar (120) not null,
data_agendamento date not null,
id_gestao int not null,
foreign key (id_gestao) references gestao (id_gestao),
id_professor int not null,
foreign key (id_professor) references professor (id_professor),
id_ambientes int not null,
foreign key (id_ambientes) references ambientes (id_ambientes)
);

ALTER TABLE agendamentos
ADD horario VARCHAR(20) NOT NULL;

show tables;

select * from ambientes;

insert into administrador (email, senha) values 
("luaragporto@gmail.com", "123456");

alter table administrador modify senha varchar (255);

alter table coordenador modify senha varchar (255);

alter table professor modify senha varchar (255);

alter table representante modify senha varchar (255);

alter table gestao modify senha varchar (255);
