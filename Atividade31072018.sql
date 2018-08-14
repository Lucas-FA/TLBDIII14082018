--use master
--go
--drop database Atividade31072018

create database Atividade31072018
go
use Atividade31072018

  create table tarefa (
  id_tarefa int primary key identity(1,1),
  titulo nvarchar(100) not null,
  prazo_estimado date,
  descricao nvarchar(100),
  data_inicio date,
  data_termino date,
  id_metodologia int
  )
  
  create table metodologia (
  id_metodologia int primary key identity(1,1),
  titulo nvarchar(100),
  )
  
  create table rel_taref_pessoas (
  id int primary key identity(1,1),
  id_tarefa int,
  id_pessoa int
  )
  
  create table pessoa (
  id_pessoa int primary key identity(1,1),
  nome nvarchar(100),
  email nvarchar(100),
  sexo nvarchar(1)
  )
  
--  --alter table tarefa add constraint fk_id_metodologia foreign key (id_metodologia) references metodologia (id_metodologia)
--  --alter table rel_taref_pessoas add constraint fk_id_tarefa foreign key (id_tarefa) references tarefa (id_tarefa)
--  --alter table rel_taref_pessoas add constraint fk_id_pessoa foreign key (id_pessoa) references pessoa (id_pessoa)
  
  insert into tarefa (titulo, prazo_estimado, descricao, data_inicio, data_termino, id_metodologia)
  values ('Química', '23/07/2018', 'Experimento de Química', '21/07/2018', '21/07/2018', '2'),
  ('Química', '23/07/2018', 'Relatório de Química', '18/07/2018', '22/07/2018', '2'),
  ('História', '28/07/2018', 'Pesquisa de História', '28/07/2018', '01/08/2018', '3')
  
  insert into metodologia (titulo)
  values ('Pesquisa Descritiva'),
  ('Pesquisa Explicativa'),
  ('Análise de documentos'),
  ('Entrevistas')
  
  insert into rel_taref_pessoas (id_tarefa, id_pessoa)
  values ('1', '1'),
  ('2', '1'),
  ('3', '4'),
  
  insert into pessoa (nome, email, sexo)
  values ('Lara', 'lara@email', 'F'),
  ('Isaac', 'isaac@email', 'M'),
  ('Rosana', 'rosana@email', 'F'),
  ('Renata', 'renata@email', 'F')
  
  --1
  SELECT * FROM pessoa WHERE id_pessoa NOT IN (SELECT id_pessoa FROM rel_taref_pessoas);  
  --2
  SELECT count(*) as quantidade, a.id_metodologia, a.titulo FROM metodologia as a inner join tarefa as b on a.id_metodologia = b.id_metodologia GROUP BY a.id_metodologia, a.titulo ORDER BY quantidade DESC 
  --3
  SELECT count(*) as quantidade, a.sexo FROM pessoa as a inner join rel_taref_pessoas as b on a.id_pessoa = b.id_pessoa GROUP BY a.sexo ORDER BY quantidade DESC 
  --4
  SELECT a.nome, b.data_termino, b.prazo_estimado FROM pessoa AS a join rel_taref_pessoas AS c on a.id_pessoa = c.id_pessoa join tarefa AS b ON c.id_tarefa = b.id_tarefa where b.data_termino > b.prazo_estimado