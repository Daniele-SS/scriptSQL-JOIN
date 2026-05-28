-- -----------------------------------------------------
-- DB_LIVRARIA
-- -----------------------------------------------------
DROP DATABASE IF EXISTS db_livraria_turma_a;
CREATE DATABASE IF NOT EXISTS db_livraria_turma_a;

USE db_livraria_turma_a ;

-- -----------------------------------------------------
-- Table tbl_pais_origem
-- -----------------------------------------------------
CREATE TABLE tbl_pais_origem (
  id INT NOT NULL AUTO_INCREMENT  PRIMARY KEY,
  pais VARCHAR(45) NOT NULL)
;


-- -----------------------------------------------------
-- Table tbl_acabamento
-- -----------------------------------------------------
CREATE TABLE tbl_acabamento (
  id INT NOT NULL AUTO_INCREMENT  PRIMARY KEY,
  tipo VARCHAR(45) NOT NULL)
;


-- -----------------------------------------------------
-- Table tbl_livro
-- -----------------------------------------------------
CREATE TABLE tbl_livro (
  id INT NOT NULL AUTO_INCREMENT  PRIMARY KEY,
  titulo VARCHAR(80) NOT NULL,
  biografia TEXT NOT NULL,
  capa VARCHAR(255) NOT NULL,
  data_publicacao DATE NOT NULL,
  isbn VARCHAR(30) NOT NULL,
  valor DECIMAL(6,2) NOT NULL DEFAULT 0,
  qtde_paginas INT NOT NULL,
  id_pais_origem INT NOT NULL,
  id_acabamento INT NOT NULL,
  

  CONSTRAINT FK_PAISORIGEM_LIVRO
    FOREIGN KEY (id_pais_origem)
    REFERENCES tbl_pais_origem (id)
    ,
  CONSTRAINT FK_ACABAMENTO_LIVRO
    FOREIGN KEY (id_acabamento)
    REFERENCES tbl_acabamento (id)
    )
;


-- -----------------------------------------------------
-- Table tbl_genero
-- -----------------------------------------------------
CREATE TABLE tbl_genero (
   id INT NOT NULL AUTO_INCREMENT  PRIMARY KEY,
  genero VARCHAR(45) NOT NULL)
;


-- -----------------------------------------------------
-- Table tbl_livro_genero
-- -----------------------------------------------------
CREATE TABLE tbl_livro_genero (
  id INT NOT NULL AUTO_INCREMENT  PRIMARY KEY,
  id_livro INT NOT NULL,
  id_genero INT NOT NULL,
  
  
  CONSTRAINT FK_LIVRO_LIVROGENERO
    FOREIGN KEY (id_livro)
    REFERENCES tbl_livro (id)
    ,
  CONSTRAINT FK_GENERO_LIVROGENERO
    FOREIGN KEY (id_genero)
    REFERENCES tbl_genero (id)
    )
;


-- -----------------------------------------------------
-- Table tbl_sexo
-- -----------------------------------------------------
CREATE TABLE tbl_sexo (
  id INT NOT NULL AUTO_INCREMENT  PRIMARY KEY,
  sigla VARCHAR(2) NOT NULL,
  nome VARCHAR(45) NOT NULL)
;


-- -----------------------------------------------------
-- Table tbl_autor
-- -----------------------------------------------------
CREATE TABLE tbl_autor (
  id INT NOT NULL AUTO_INCREMENT  PRIMARY KEY,
  nome VARCHAR(80) NOT NULL,
  data_nascimento DATE NOT NULL,
  id_sexo INT NOT NULL,
  

  CONSTRAINT FK_SEXO_AUTOR
    FOREIGN KEY (id_sexo)
    REFERENCES tbl_sexo (id)
    )
;


-- --------------------------------------------------------
-- 1. Exibe o nome do autor e o nome por extenso do seu sexo
-- --------------------------------------------------------
SELECT 
    tbl_autor.nome   AS autor,
    tbl_sexo.nome    AS sexo
FROM tbl_autor
	INNER JOIN tbl_sexo
		ON tbl_autor.id_sexo = tbl_sexo.id
	;

-- -----------------------------------------------------------
-- 2. Retorna o nome do autor e a sua respectiva nacionalidade
-- -----------------------------------------------------------
select 
	tbl_autor.nome as autor,
    tbl_nacionalidade.nome as nacionalidade
from tbl_autor
	inner join tbl_autor_nacionalidade
		on tbl_autor.id = tbl_autor_nacionalidade.id_autor
	inner join tbl_nacionalidade
		on tbl_autor_nacionalidade.id_nacionalidade = tbl_nacionalidade.id
	;
        
-- ------------------------------------------------------------------
-- 3. Lista o nome de todos os autores e, ao lado, o título do livro. 
-- Caso o autor não tenha livro, o título aparece como NULL
-- ------------------------------------------------------------------
select 
	tbl_autor.nome as nome,
    tbl_livro.titulo as título_livro
from tbl_autor
	left join tbl_livro
		on tbl_autor.id = tbl_livro.id
	;
    




-- -----------------------------------------------------
-- Table tbl_livro_autor
-- -----------------------------------------------------
CREATE TABLE tbl_livro_autor (
   id INT NOT NULL AUTO_INCREMENT  PRIMARY KEY,
  id_livro INT NOT NULL,
  id_autor INT NOT NULL,

  CONSTRAINT FK_LIVRO_LIVROAUTOR
    FOREIGN KEY (id_livro)
    REFERENCES tbl_livro (id)
    ,
  CONSTRAINT FK_AUTOR_LIVROAUTOR
    FOREIGN KEY (id_autor)
    REFERENCES tbl_autor (id)
    )
;


-- -----------------------------------------------------
-- Table tbl_telefone
-- -----------------------------------------------------
CREATE TABLE tbl_telefone (
  id INT NOT NULL AUTO_INCREMENT  PRIMARY KEY,
  telefone VARCHAR(18) NOT NULL)
;


-- -----------------------------------------------------
-- Table tbl_editora
-- -----------------------------------------------------
CREATE TABLE tbl_editora (
  id INT NOT NULL AUTO_INCREMENT  PRIMARY KEY,
  nome VARCHAR(45) NOT NULL,
  cnpj VARCHAR(20) NOT NULL,
  id_telefone INT NOT NULL,
  
  CONSTRAINT FK_TELEFONE_EDITORA
    FOREIGN KEY (id_telefone)
    REFERENCES tbl_telefone (id)
    )
;


-- -----------------------------------------------------
-- Table tbl_livro_editora
-- -----------------------------------------------------
CREATE TABLE tbl_livro_editora (
  id INT NOT NULL AUTO_INCREMENT  PRIMARY KEY,
  id_livro INT NOT NULL,
  id_editora INT NOT NULL,
  
  CONSTRAINT FK_LIVRO_LIVROEDITORA
    FOREIGN KEY (id_livro)
    REFERENCES tbl_livro (id)
    ,
  CONSTRAINT FK_EDITORA_LIVROEDITORA
    FOREIGN KEY (id_editora)
    REFERENCES tbl_editora (id)
    )
;


-- -----------------------------------------------------
-- Table tbl_nacionalidade
-- -----------------------------------------------------
CREATE TABLE tbl_nacionalidade (
  id INT NOT NULL AUTO_INCREMENT  PRIMARY KEY,
  nome VARCHAR(45) NOT NULL)
;


-- -----------------------------------------------------
-- Table tbl_autor_nacionalidade
-- -----------------------------------------------------
CREATE TABLE tbl_autor_nacionalidade (
  id INT NOT NULL AUTO_INCREMENT  PRIMARY KEY,
  id_autor INT NOT NULL,
  id_nacionalidade INT NOT NULL,
  
  CONSTRAINT FK_AUTOR_AUTORNACIONALIDADE
    FOREIGN KEY (id_autor)
    REFERENCES tbl_autor (id)
    ,
  CONSTRAINT FK_NACIONALIDADE_AUTORNACIONALIDADE
    FOREIGN KEY (id_nacionalidade)
    REFERENCES tbl_nacionalidade (id)
    )
;