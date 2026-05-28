-- ---------------------------------------------------------
-- 1. Exibe o nome do autor e o nome por extenso do seu sexo
-- ---------------------------------------------------------
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
	tbl_autor.nome as autor,
    tbl_livro.titulo as titulo_livro
from tbl_autor
	left join tbl_livro
		on tbl_autor.id = tbl_livro.id
	;
    
-- ----------------------------------------------------
-- 4. Retorna todos os gêneros cadastrados no sistema e 
-- os títulos dos livros associados a eles.
-- ----------------------------------------------------
select
	tbl_genero.genero as nome_genero,
    tbl_livro.titulo as titulo_livro
from tbl_genero
	inner join tbl_livro
		on tbl_genero.id = tbl_livro.id
	;
