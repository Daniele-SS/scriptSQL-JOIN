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


-- -----------------------------------------------------
-- 4. Retorna todos os gêneros cadastrados no sistema e
-- os títulos dos livros associados a eles,
-- inclusive gêneros sem livros atrelados.
-- -----------------------------------------------------
SELECT
    tbl_genero.genero AS nome_genero,
    tbl_livro.titulo AS titulo_livro
FROM tbl_genero
    LEFT JOIN tbl_livro
        ON tbl_genero.id = tbl_livro.id_genero
;


-- ---------------------------------------------------
-- 5. Retorna o título do livro, o nome do autor
-- principal e o nome da editora que o publicou.
-- ---------------------------------------------------
SELECT
    tbl_livro.titulo AS titulo_livro,
    tbl_autor.nome AS nome_autor,
    tbl_editora.nome AS nome_editora
FROM tbl_livro
    INNER JOIN tbl_autor
        ON tbl_livro.id_autor = tbl_autor.id
    INNER JOIN tbl_editora
        ON tbl_livro.id_editora = tbl_editora.id
;


-- ---------------------------------------------------
-- 6. Retorna o título do livro, o tipo de acabamento
-- e o país de origem da obra.
-- ---------------------------------------------------
SELECT
    tbl_livro.titulo AS titulo_livro,
    tbl_acabamento.tipo AS tipo_acabamento,
    tbl_pais.nome AS pais_origem
FROM tbl_livro
    INNER JOIN tbl_acabamento
        ON tbl_livro.id_acabamento = tbl_acabamento.id
    INNER JOIN tbl_pais
        ON tbl_livro.id_pais = tbl_pais.id
;


-- ---------------------------------------------------
-- 7. Retorna título e biografia dos livros
-- do gênero 'Terror ou Horror'.
-- ---------------------------------------------------
SELECT
    tbl_livro.titulo AS titulo_livro,
    tbl_livro.biografia AS biografia
FROM tbl_livro
    INNER JOIN tbl_genero
        ON tbl_livro.id_genero = tbl_genero.id
WHERE tbl_genero.genero = 'Terror ou Horror'
;


-- ---------------------------------------------------
-- 8. Relatório completo e unificado de todo o ecossistema.
-- ---------------------------------------------------
SELECT
    tbl_livro.titulo            AS titulo_livro,
    tbl_livro.valor             AS valor,
    tbl_livro.qtd_paginas       AS quantidade_paginas,
    tbl_livro.data_publicacao   AS data_publicacao,
    tbl_livro.isbn              AS codigo_isbn,

    tbl_acabamento.tipo         AS tipo_acabamento,
    tbl_pais.nome               AS pais_origem,

    tbl_genero.genero           AS genero_literario,

    tbl_editora.nome            AS nome_editora,
    tbl_editora.telefone        AS telefone_editora,

    tbl_autor.nome              AS nome_autor,
    tbl_autor.data_nascimento   AS data_nascimento_autor,
    tbl_sexo.nome               AS sexo_autor,

    tbl_nacionalidade.nome      AS nacionalidade_autor

FROM tbl_livro
    INNER JOIN tbl_acabamento
        ON tbl_livro.id_acabamento = tbl_acabamento.id
    INNER JOIN tbl_pais
        ON tbl_livro.id_pais = tbl_pais.id
    INNER JOIN tbl_genero
        ON tbl_livro.id_genero = tbl_genero.id
    INNER JOIN tbl_editora
        ON tbl_livro.id_editora = tbl_editora.id
    INNER JOIN tbl_autor
        ON tbl_livro.id_autor = tbl_autor.id
    INNER JOIN tbl_sexo
        ON tbl_autor.id_sexo = tbl_sexo.id
    INNER JOIN tbl_autor_nacionalidade
        ON tbl_autor.id = tbl_autor_nacionalidade.id_autor
    INNER JOIN tbl_nacionalidade
        ON tbl_autor_nacionalidade.id_nacionalidade = tbl_nacionalidade.id
;


-- ---------------------------------------------------
-- 9. Mesmo relatório, filtrado por valor > R$ 50,00.
-- ---------------------------------------------------
SELECT
    tbl_livro.titulo            AS titulo_livro,
    tbl_livro.valor             AS valor,
    tbl_livro.qtd_paginas       AS quantidade_paginas,
    tbl_livro.data_publicacao   AS data_publicacao,
    tbl_livro.isbn              AS codigo_isbn,

    tbl_acabamento.tipo         AS tipo_acabamento,
    tbl_pais.nome               AS pais_origem,

    tbl_genero.genero           AS genero_literario,

    tbl_editora.nome            AS nome_editora,
    tbl_editora.telefone        AS telefone_editora,

    tbl_autor.nome              AS nome_autor,
    tbl_autor.data_nascimento   AS data_nascimento_autor,
    tbl_sexo.nome               AS sexo_autor,

    tbl_nacionalidade.nome      AS nacionalidade_autor

FROM tbl_livro
    INNER JOIN tbl_acabamento
        ON tbl_livro.id_acabamento = tbl_acabamento.id
    INNER JOIN tbl_pais
        ON tbl_livro.id_pais = tbl_pais.id
    INNER JOIN tbl_genero
        ON tbl_livro.id_genero = tbl_genero.id
    INNER JOIN tbl_editora
        ON tbl_livro.id_editora = tbl_editora.id
    INNER JOIN tbl_autor
        ON tbl_livro.id_autor = tbl_autor.id
    INNER JOIN tbl_sexo
        ON tbl_autor.id_sexo = tbl_sexo.id
    INNER JOIN tbl_autor_nacionalidade
        ON tbl_autor.id = tbl_autor_nacionalidade.id_autor
    INNER JOIN tbl_nacionalidade
        ON tbl_autor_nacionalidade.id_nacionalidade = tbl_nacionalidade.id
WHERE tbl_livro.valor > 50.00
;


-- ---------------------------------------------------
-- 10. Nacionalidade do autor e média de páginas,
-- excluindo livros do tipo 'Ebook / Digital'.
-- ---------------------------------------------------
SELECT
    tbl_nacionalidade.nome          AS nacionalidade,
    AVG(tbl_livro.qtde_paginas)      AS media_paginas
FROM tbl_livro
    INNER JOIN tbl_acabamento
        ON tbl_livro.id_acabamento = tbl_acabamento.id
    INNER JOIN tbl_autor
        ON tbl_livro.id_autor = tbl_autor.id
    INNER JOIN tbl_autor_nacionalidade
        ON tbl_autor.id = tbl_autor_nacionalidade.id_autor
    INNER JOIN tbl_nacionalidade
        ON tbl_autor_nacionalidade.id_nacionalidade = tbl_nacionalidade.id
WHERE tbl_acabamento.tipo != 'Ebook / Digital'
GROUP BY tbl_nacionalidade.nome
;