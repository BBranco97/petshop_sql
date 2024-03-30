-- criacao e uso  do database
create database petshop;
use petshop;

-- criacao das tabelas (com uso de descricoes)
create table funcionario (
	id int primary key auto_increment,
    nome varchar(50) not null,
    cpf varchar(11) not null,
    uf varchar(2),
    cidade varchar(10),
    bairro varchar(10),
    rua varchar(30),
    num varchar(6),
    cep varchar(8));
    
create table telefones_funcionario (
	id_funcionario int primary key,
    telefone varchar(11) not null unique,
	foreign key (id_funcionario) references funcionario(id));

create table banhista (
	id_funcionario int primary key,
    tempo_exp int,
    especialidade varchar(20),
    foreign key (id_funcionario) references funcionario(id));

create table fotografo (
	id_funcionario int primary key,
    qnt_fotos int,
    estilo varchar(20),
    foreign key (id_funcionario) references funcionario(id));
    
create table tutor (
	id int auto_increment primary key,
    nome varchar (100) not null,
    cpf varchar(11) not null,
    uf varchar(2),
    cidade varchar(20),
    bairro varchar(20),
    rua varchar(100),
    num varchar(6),
    cep varchar(8));
    
create table animal (
	id int auto_increment primary key,
    nome varchar(20) not null,
    especie varchar(20),
    raca varchar(20) not null,
    id_tutor int not null,
    foreign key (id_tutor) references tutor(id));

create table atendimento (
	id int auto_increment primary key,
    produtos varchar(100),
    valor decimal(8,2) not null check (valor > 0),
    id_funcionario int not null,
    id_animal int not null,
    foreign key (id_funcionario) references funcionario(id),
    foreign key (id_animal) references animal(id));
    
create table nota_fiscal (
    num int primary key,
    valor decimal(8,2) check (valor > 0),
    id_atend int not null,
    foreign key (id_atend) references atendimento(id)); 

create table telefones_tutor (
	id_tutor int primary key,
    telefone varchar(11) not null unique,
    foreign key (id_tutor) references tutor(id));
    
create table fotografo_animal(
	id int auto_increment primary key,
	id_animal int,
    id_funcionario int,
    data_atend date not null,
    foreign key (id_animal) references animal(id),
    foreign key (id_funcionario) references funcionario(id));

-- populando as tabelas
insert into funcionario (nome, cpf, uf, cidade, bairro, rua, num, cep) values
    ('Gilberto', '12345678901', 'SP', 'São Paulo', 'Centro', 'Avenida Paulista', '123', '12345678'),
    ('Caetano', '23456789012', 'RJ', 'Rio de Janeiro', 'Copacabana', 'Avenida Atlântica', '456', '98765432'),
    ('Rita', '345678901234', 'MG', 'Belo Horizonte', 'Savassi', 'Rua da Paz', '789', '45612378'),
    ('Tom', '56789012345', 'RS', 'Porto Alegre', 'Moinhos de Vento', 'Rua Padre Chagas', '123', '78945612'),
    ('Gal', '67890123456', 'BA', 'Salvador', 'Barra', 'Avenida Oceânica', '456', '65432178'),
    ('Jorge', '78901234567', 'SP', 'São Paulo', 'Vila Madalena', 'Rua Fradique Coutinho', '789', '32165498'),
    ('Nara', '89012345678', 'MG', 'Belo Horizonte', 'Savassi', 'Rua da Paz', '123', '12378945'),
    ('Chico', '90123456789', 'RJ', 'Rio de Janeiro', 'Ipanema', 'Rua Visconde de Piraja', '456', '78945632'),
    ('Wilson', '01234567890', 'RS', 'Porto Alegre', 'Moinhos de Vento', 'Rua Padre Chagas', '789', '45698712'),
    ('Carmem', '12345678901', 'BA', 'Salvador', 'Barra', 'Avenida Oceanica', '123', '32178965');

insert into telefones_funcionario (id_funcionario, telefone) values
    (1, '1234567890'),
    (2, '2345678901'),
    (3, '3456789012'),
    (4, '4567890123'),
    (5, '5678901234'),
    (6, '6789012345'),
    (7, '7890123456'),
    (8, '8901234567'),
    (9, '0123456789'),
    (10, '112345678');
    
insert into banhista (id_funcionario, tempo_exp, especialidade) values
    (1, 3, 'Caes de pequeno porte'),
    (2, 5, 'Caes de grande porte'),
    (3, 2, 'Gatos domesticos'),
    (4, 4, 'Caes de raças exoticas'),
    (5, 6, 'Caes de pequeno porte'),
    (6, 3, 'Caes de grande porte'),
    (7, 1, 'Gatos domesticos'),
    (8, 7, 'Caes de raças exoticas'),
    (9, 5, 'Caes de pequeno porte'),
    (10, 2, 'Caes de grande porte');

insert into fotografo (id_funcionario, qnt_fotos, estilo) values
    (1, 50, 'Retratos de animais de estimaçao'),
    (2, 30, 'Fotografia de eventos caninos'),
    (3, 40, 'Fotografia de gatos'),
    (4, 60, 'Retratos de caes exóticos'),
    (5, 75, 'Retratos de animais de estimaçao'),
    (6, 45, 'Fotografia de eventos caninos'),
    (7, 55, 'Fotografia de gatos'),
    (8, 70, 'Retratos de caes de raças exoticas'),
    (9, 35, 'Retratos de animais de estimaçao'),
    (10, 25, 'Fotografia de eventos caninos');

insert into tutor (nome, cpf, uf, cidade, bairro, rua, num, cep) values
    ('Gilberto', '12345678901', 'SP', 'São Paulo', 'Centro', 'Avenida Paulista', '123', '12345678'),
    ('Caetano', '23456789012', 'RJ', 'Rio de Janeiro', 'Copacabana', 'Avenida Atlântica', '456', '98765432'),
    ('Rita', '345678901234', 'MG', 'Belo Horizonte', 'Savassi', 'Rua da Paz', '789', '45612378'),
    ('Tom', '56789012345', 'RS', 'Porto Alegre', 'Moinhos de Vento', 'Rua Padre Chagas', '123', '78945612'),
    ('Gal', '67890123456', 'BA', 'Salvador', 'Barra', 'Avenida Oceânica', '456', '65432178'),
    ('Jorge', '78901234567', 'SP', 'São Paulo', 'Vila Madalena', 'Rua Fradique Coutinho', '789', '32165498'),
    ('Nara', '89012345678', 'MG', 'Belo Horizonte', 'Savassi', 'Rua da Paz', '123', '12378945'),
    ('Chico', '90123456789', 'RJ', 'Rio de Janeiro', 'Ipanema', 'Rua Visconde de Piraja', '456', '78945632'),
    ('Wilson', '01234567890', 'RS', 'Porto Alegre', 'Moinhos de Vento', 'Rua Padre Chagas', '789', '45698712'),
    ('Carmem', '12345678901', 'BA', 'Salvador', 'Barra', 'Avenida Oceanica', '123', '32178965');

insert into animal (nome, especie, raca, id_tutor) values
    ('Rex', 'Cão', 'Labrador', 1),
    ('Bolinha', 'Gato', 'Siamês', 2),
    ('Mi', 'Cão', 'Golden Retriever', 3),
    ('Mia', 'Gato', 'Maine Coon', 4),
    ('Pitty', 'Cão', 'Bulldog', 5),
    ('Luna', 'Gato', 'Persa', 6),
    ('Cake', 'Cão', 'Dachshund', 7),
    ('Oliver', 'Gato', 'Ragdoll', 8),
    ('Bili', 'Cão', 'Poodle', 9),
    ('Simba', 'Gato', 'Siamese', 10);

insert into atendimento (produtos, valor, id_funcionario, id_animal) values
    ('Shampoo, Condicionador', 50.00, 1, 1),
    ('Shampoo', 55.00, 3, 3),
    ('Shampoo, Perfume', 40.00, 5, 5),
    ('Pasta de dente', 48.00, 7, 7),
    ('pasta de dente, perfume', 70.00, 8, 8),
    ('shampoo', 52.00, 9, 9);
    
insert into atendimento (valor, id_funcionario, id_animal) values
	(75.00, 2, 2),
	(65.00, 4, 4),
    (80.00, 6, 6),
    (90.00, 10, 10);

insert into nota_fiscal (num, valor, id_atend) values
    (1, 50.00, 1),
    (2, 75.00, 2),
    (3, 55.00, 3),
    (4, 65.00, 4),
    (5, 40.00, 5),
    (6, 80.00, 6),
    (7, 48.00, 7),
    (8, 70.00, 8),
    (9, 52.00, 9),
    (10, 90.00, 10);

insert into telefones_tutor (id_tutor, telefone) values
    (1, '31987654321'),
    (2, '51876543210'),
    (3, '21987654321'),
    (4, '31987654322'),
    (5, '11987654323'),
    (6, '21987654323'),
    (7, '31987654324'),
    (8, '11987654325'),
    (9, '21987654326'),
    (10, '31987654327');

insert into fotografo_animal (id_animal, id_funcionario, data_atend) values
    (1, 1, '2023-10-23'),
    (2, 3, '2023-10-24'),
    (3, 5, '2023-10-25'),
    (4, 7, '2023-10-26'),
    (5, 9, '2023-10-27'),
    (6, 2, '2023-10-28'),
    (7, 4, '2023-10-29'),
    (8, 6, '2023-10-30'),
    (9, 8, '2023-10-31'),
    (10, 10, '2023-11-01');

-- updates 
update funcionario set nome = 'mariana' where id = 1;
update banhista set tempo_exp = 6 where id_funcionario = 2;
update fotografo set qnt_fotos = 40 where id_funcionario = 3;
update tutor set nome = 'ricardo' where id = 4;
update animal set nome = 'luna' where id = 5;
update atendimento set valor = 60.00 where id = 6;
update atendimento set produtos = 'shampoo' where id = 7;
update nota_fiscal set valor = 55.00 where num = 1;
update telefones_tutor set telefone = '11002200330' where id_tutor = 8;
update fotografo_animal set data_atend = '2020-10-01' where id = 9;

-- selects
select * from funcionario;
select * from telefones_funcionario;
select * from banhista;
select * from fotografo;
select * from tutor;
select * from animal;
select * from atendimento;
select * from nota_fiscal;
select * from telefones_tutor;
select * from fotografo_animal;

-- consultas

-- 3 consultas simples (em uma única tabela) e que façam filtros utilizando AND e OR. No mínimo uma delas deve usar a cláusula ORDER BY.
 use petshop;

--  todos os funcionários que estão localizados em SP ou RJ ordenados por nome
SELECT * FROM funcionario WHERE uf = 'SP' or uf= 'RJ'ORDER BY nome;

--  todos os animais que são cães
SELECT * FROM animal WHERE especie = LOWER('cão');

--  todos os atendimentos com valor acima de 60
SELECT * FROM atendimento WHERE valor>60.000;

--  2 consultas que utilizem funções de manipulação de caracteres (LIKE, SUBSTR, LENGTH, UPPER, etc)

--  todos os tutores em que o nome começa com a letra 'R'
SELECT * FROM tutor WHERE SUBSTR(nome,1,1)='R';

-- todos os animais cujo nome contém a letra 'o'.
SELECT * FROM animal WHERE nome LIKE '%o%';

-- 2 consultas que utilizem inner join de duas tabelas

-- os nomes dos animais e de seus tutores
SELECT a.nome AS nome_animal , t.nome AS nome_tutor
FROM animal a JOIN tutor t
ON a.id_tutor = t.id;

-- id do atendimento e numero da nota fiscal
SELECT a.id as numero_atendimento , n.num as numero_nf
FROM atendimento a JOIN nota_fiscal n
ON a.id = n.id_atend;

-- 2 consultas que utilizem inner join de três ou mais tabelas

--  ID dos atendimentos feitos por fotógrafos, com os nomes dos dos animais
SELECT a.id as num_atendimento, anim.nome as nome_animal
FROM atendimento a join fotografo f 
ON a.id_funcionario = f.id_funcionario
JOIN animal anim
on a.id_animal= anim.id;

-- nome dos animais atendidos por banhistas e tempo de experiencia dos banhistas
select a.nome, b.tempo_exp
from animal a join atendimento 
on atendimento.id_animal = a.id
join banhista b 
on atendimento.id_funcionario  = b.id_funcionario;

-- 2 consultas que utilizem outer join (left ou right) de tabela

-- nome de todos os animais e id dos fotografos que os atenderam (quando houver atendimentos realizados por fotografos)
select a.nome,  f.id_funcionario
from animal a join atendimento
on a.id = id_animal 
left join fotografo f
on f.id_funcionario = atendimento.id_funcionario;

-- retorna todos os nomes dos tutores e os nomes de seus animais, mesmo que não tenham atendimentos
SELECT t.nome, a.nome AS nome_animal
FROM tutor t JOIN animal a
ON t.id = a.id_tutor
LEFT JOIN atendimento 
ON a.id = atendimento.id_animal;

-- 2 consultas que utilizem GROUP BY e funções agregadas (SUM, COUNT, MAX, MIN, AVG)

-- quantidade de animais por espécie
SELECT count(especie), a.especie
from animal a
group by especie;

--  soma do valor de todos os atendimentos por funcionario
select sum(valor), f.id
from atendimento join funcionario f
on f.id = atendimento.id_funcionario
group by id;

-- 2 consultas que utilizem a cláusula HAVING juntamente com GROUP BY

-- especialidade e media de tempo de experiencia dos banhistas que tem mais de 3 anos de experiência
SELECT banhista.especialidade, AVG(banhista.tempo_exp) AS media_experiencia
FROM banhista
GROUP BY banhista.especialidade
HAVING AVG(banhista.tempo_exp) > 3;

-- estilos de fotografos que tiraram mais de 40 fotos no total
SELECT fotografo.estilo, SUM(fotografo.qnt_fotos) AS total_fotos
FROM fotografo
GROUP BY fotografo.estilo
HAVING SUM(fotografo.qnt_fotos) > 40;

-- 4 consultas que utilizem subconsultas, sendo que ao menos duas delas utilizem os operadores IN, ANY, ALL para tartar subconsultas que retornam mais de 1 registro

-- animais que tiveram atendimento com valor superior a 70
SELECT * FROM animal WHERE id IN (SELECT id_animal FROM atendimento WHERE valor > 70.00);

-- tutores com mais de um animal
SELECT * FROM tutor WHERE id IN (SELECT id_tutor FROM animal GROUP BY id_tutor HAVING COUNT(*) > 1);

-- animais que tiveram atendimento com produtos 'shampoo' ou 'condicionador'.
SELECT * FROM animal WHERE id IN (SELECT id_animal FROM atendimento WHERE produtos LIKE '%shampoo%' OR produtos LIKE '%condicionador%');

-- animais que tiveram atendimento por fotógrafos na data de '2023-10-28'.
SELECT * FROM animal WHERE id IN (SELECT id_animal FROM fotografo_animal WHERE data_atend = '2023-10-28');

-- 1 consulta que utilize o operador UNION

-- nomes dos animais, unindo as listas de cães e gatos
SELECT nome FROM animal WHERE especie = 'Cão'
UNION
SELECT nome FROM animal WHERE especie = 'Gato';

-- 1 consulta que utilize o operador EXISTS ou NOT EXISTS

-- animais que nao foram fotografados
SELECT *
FROM animal
WHERE NOT EXISTS (
    SELECT 1
    FROM atendimento JOIN fotografo 
    ON atendimento.id_funcionario = fotografo.id_funcionario
    WHERE animal.id = atendimento.id_animal
);