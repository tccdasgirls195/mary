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
("luaragporto@gmail.com","123456");

INSERT INTO gestao (email, senha, id_administrador)
VALUES ('gestao@email.com', '123456', 1);

INSERT INTO coordenador (email, senha, curso, id_administrador)
VALUES ('coordenador@email.com', '123456', 'DS', 1);

INSERT INTO professor (email, senha, id_coordenador, id_administrador)
VALUES ('professor@email.com', '123456', 1, 1);

INSERT INTO ambientes (nome, tipo)
VALUES('Laboratório de Informática 1', 'DS');


INSERT INTO agendamentos
(nome_prof, descr, data_agendamento, id_gestao, id_professor, id_ambientes, horario)
VALUES
('João', 'Aula de BD', '2026-07-31', 1, 1, 1, '13h50 - 14h40');

select * from agendamentos;
select * from professor;
select * from coordenador;
select * from gestao;
select * from administrador;

SELECT * FROM agendamentos
WHERE id_ambientes = 1;

SELECT id_ambientes 
FROM agendamentos
WHERE data_agendamento = '2026-07-31'
AND horario = '13h50 - 14h40';

alter table administrador modify senha varchar (255);

alter table coordenador modify senha varchar (255);

alter table professor modify senha varchar (255);

alter table representante modify senha varchar (255);

alter table gestao modify senha varchar (255);


UPDATE administrador
SET senha = '$2y$10$l.iQDnnwC5HSiUMn9O95kuiEhBjaalYokwsnPXplEkRzbpG2nTlBO'
WHERE id_administrador = 1;

UPDATE gestao
SET senha = '$2y$10$Ie/L6qzFA0mOFnTT/R1HouahVABAN1RGRe.BqkK2gCNTKZ7sLu9PS'
WHERE id_gestao = 1;

UPDATE coordenador
SET senha = '$2y$10$4oDpXQaXvqZls7.OSJ15RezUvzi40iALwOLjAdXy1M4y6N.RwWplG'
WHERE id_coordenador = 1;

UPDATE professor
SET senha = '$2y$10$FEUhkuMAkDCd5m7spI0Q6.flGfWEQiN9/MCLrn/xzsuC4PSGkC8gO'
WHERE id_professor = 1;

