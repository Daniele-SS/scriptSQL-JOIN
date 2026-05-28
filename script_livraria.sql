-- =======================================================================
-- SCRIPT DE INICIALIZAÇÃO DO BANCO DE DADOS (LIVRARIA)
-- =======================================================================

-- 1. Países de Origem
INSERT INTO tbl_pais_origem (id, pais) VALUES 
(1, 'Reino Unido'),
(2, 'Estados Unidos'),
(3, 'Brasil');

-- 2. Acabamentos dos Livros
INSERT INTO tbl_acabamento (id, tipo) VALUES 
(1, 'Capa Dura'),
(2, 'Brochura'),
(3, 'Ebook / Digital');

-- 3. Gêneros Literários
INSERT INTO tbl_genero (id, genero) VALUES 
(1, 'Fantasia'),
(2, 'Ficção Científica'),
(3, 'Distopia'),
(4, 'Romance'),
(5, 'Terror / Horror'),
(6, 'Suspense / Mistério'),
(7, 'Histórico');

-- 4. Sexo (para os autores)
INSERT INTO tbl_sexo (id, sigla, nome) VALUES 
(1, 'M', 'Masculino'),
(2, 'F', 'Feminino');

-- 5. Nacionalidades
INSERT INTO tbl_nacionalidade (id, nome) VALUES 
(1, 'Britânica'),
(2, 'Americana'),
(3, 'Brasileira');

-- 6. Telefones (para as editoras)
INSERT INTO tbl_telefone (id, telefone) VALUES 
(1, '(11) 3224-4000'),
(2, '(21) 3874-0011'),
(3, '(11) 5056-7000');

-- 6. Editoras
INSERT INTO tbl_editora (id, nome, cnpj, id_telefone) VALUES 
(1, 'Companhia das Letras', '55.789.390/0001-12', 1),
(2, 'Editora Rocco', '42.153.220/0001-85', 2),
(3, 'Intrínseca', '05.678.910/0001-99', 3);

-- 8. Autores 
INSERT INTO tbl_autor (id, nome, data_nascimento, id_sexo) VALUES 
(1, 'J.K. Rowling', '1965-07-31', 2),
(2, 'George R.R. Martin', '1948-09-20', 1),
(3, 'Machado de Assis', '1839-06-21', 1),
(4, 'Stephen King', '1947-09-21', 1),
(5, 'Agatha Christie', '1890-09-15', 2),
(6, 'George Orwell', '1903-06-25', 1),
(7, 'Isaac Asimov', '1920-01-02', 1),
(8, 'Clarice Lispector', '1920-12-10', 2),
(9, 'J.R.R. Tolkien', '1892-01-03', 1),
(10, 'Mary Shelley', '1797-08-30', 2),
(11, 'Neil Gaiman', '1960-11-10', 1),
(12, 'Margaret Atwood', '1939-11-18', 2),
(13, 'Jorge Amado', '1912-08-10', 1),
(14, 'Arthur Conan Doyle', '1859-05-22', 1),
(15, 'Virginia Woolf', '1882-01-25', 2),
(16, 'H.P. Lovecraft', '1890-08-20', 1),
(17, 'Ray Bradbury', '1920-08-22', 1),
(18, 'Dan Brown', '1964-06-22', 1),
(19, 'Rick Riordan', '1964-06-05', 1),
(20, 'Suzanne Collins', '1962-08-10', 2);

-- 9. Livros 
INSERT INTO tbl_livro (id, titulo, biografia, capa, data_publicacao, isbn, valor, qtde_paginas, id_pais_origem, id_acabamento) VALUES 
(1, 'Harry Potter e a Pedra Filosofal', 'O início da jornada do jovem bruxo contra as trevas.', 'capa_hp1.jpg', '1997-06-26', '9788532511010', 49.90, 223, 1, 2),
(2, 'A Guerra dos Tronos', 'Primeiro livro da aclamada série de fantasia épica.', 'capa_got1.jpg', '1996-08-01', '9788544102923', 89.90, 592, 2, 1),
(3, 'Dom Casmurro', 'Clássico da literatura brasileira sobre olhos de ressaca e dúvida.', 'capa_casmurro.jpg', '1899-12-31', '9788535914849', 29.90, 256, 3, 2),
(4, 'O Iluminado', 'Um clássico do terror psicológico em um hotel isolado.', 'iluminado.jpg', '1977-01-28', '9788581050393', 54.90, 464, 2, 1),
(5, 'E Não Sobrou Nenhum', 'O maior romance de mistério e a obra-prima da Rainha do Crime.', 'enanosobrou.jpg', '1939-11-06', '9788525057174', 39.90, 400, 1, 2),
(6, '1984', 'A icônica distopia sobre o Grande Irmão e a vigilância do Estado.', '1984.jpg', '1949-06-08', '9788535914840', 34.90, 336, 1, 2),
(7, 'Fundação', 'O pilar da ficção científica que narra a queda do império galáctico.', 'fundacao.jpg', '1951-06-01', '9788576571551', 62.00, 240, 2, 1),
(8, 'A Hora da Estrela', 'A comovente história de Macabéa na escrita única de Clarice.', 'hora_estrela.jpg', '1977-10-26', '9788532520623', 29.90, 88, 3, 2),
(9, 'O Hobbit', 'A aventura de Bilbo Bolseiro que precede O Senhor dos Anéis.', 'hobbit.jpg', '1937-09-21', '9788595084742', 59.90, 336, 1, 1),
(10, 'Frankenstein', 'O nascimento do terror moderno e da ficção científica.', 'frankenstein.jpg', '1818-01-01', '9788525415745', 24.90, 240, 1, 2),
(11, 'O Monstro de Mil Faces', 'Coletânea de contos que revolucionaram o horror cósmico.', 'lovecraft.jpg', '1928-02-01', '9788576573135', 45.00, 288, 2, 1),
(12, 'O Código Da Vinci', 'Um suspense eletrizante envolvendo mensagens ocultas em obras de arte.', 'davinci.jpg', '2003-03-18', '9788598078021', 49.90, 432, 2, 2),
(13, 'O Ladrão de Raios', 'Mitologia grega encontra o mundo moderno com Percy Jackson.', 'percy.jpg', '2005-06-28', '9788580575392', 44.90, 400, 2, 2);

-- 10. Nacionalidade dos Autores 

INSERT INTO tbl_autor_nacionalidade (id_autor, id_nacionalidade) VALUES 
(1, 1),  -- J.K. Rowling
(2, 2),  -- George R.R. Martin
(3, 3),  -- Machado de Assis
(4, 2),  -- Stephen King
(5, 1),  -- Agatha Christie
(6, 1),  -- George Orwell
(7, 2),  -- Isaac Asimov
(8, 3),  -- Clarice Lispector
(9, 1),  -- J.R.R. Tolkien
(10, 1), -- Mary Shelley
(11, 1), -- Neil Gaiman
(12, 2), -- Margaret Atwood
(13, 3), -- Jorge Amado
(14, 1), -- Arthur Conan Doyle
(15, 1), -- Virginia Woolf
(16, 2), -- H.P. Lovecraft
(17, 2), -- Ray Bradbury
(18, 2), -- Dan Brown
(19, 2), -- Rick Riordan
(20, 2); -- Suzanne Collins

-- 11. Relacionamento Livro e Autor 
INSERT INTO tbl_livro_autor (id_livro, id_autor) VALUES 
(1, 1),   -- Harry Potter -> J.K. Rowling
(2, 2),   -- A Guerra dos Tronos -> George R.R. Martin
(3, 3),   -- Dom Casmurro -> Machado de Assis
(4, 4),   -- O Iluminado -> Stephen King
(5, 5),   -- E Não Sobrou Nenhum -> Agatha Christie
(6, 6),   -- 1984 -> George Orwell
(7, 7),   -- Fundação -> Isaac Asimov
(8, 8),   -- A Hora da Estrela -> Clarice Lispector
(9, 9),   -- O Hobbit -> J.R.R. Tolkien
(10, 10), -- Frankenstein -> Mary Shelley
(11, 16), -- O Monstro de Mil Faces -> H.P. Lovecraft
(12, 18), -- O Código Da Vinci -> Dan Brown
(13, 19); -- O Ladrão de Raios -> Rick Riordan

-- 12. Relacionamento Livro e Gênero 
INSERT INTO tbl_livro_genero (id_livro, id_genero) VALUES 
(1, 1),  -- Harry Potter (Fantasia)
(2, 1),  -- Guerra dos Tronos (Fantasia)
(3, 4),  -- Dom Casmurro (Romance)
(4, 5),  -- O Iluminado (Terror)
(5, 6),  -- E Não Sobrou Nenhum (Suspense)
(6, 3),  -- 1984 (Distopia)
(7, 2),  -- Fundação (Ficção Científica)
(8, 4),  -- A Hora da Estrela (Romance)
(9, 1),  -- O Hobbit (Fantasia)
(10, 2), -- Frankenstein (Ficção Científica)
(10, 5), -- Frankenstein (Terror)
(11, 5), -- O Monstro de Mil Faces (Terror)
(12, 6), -- O Código Da Vinci (Suspense)
(13, 1); -- O Ladrão de Raios (Fantasia)

-- 13. Relacionamento Livro e Editora 
INSERT INTO tbl_livro_editora (id_livro, id_editora) VALUES 
(1, 2),  -- Harry Potter -> Rocco
(2, 1),  -- Guerra dos Tronos -> Cia das Letras
(3, 1),  -- Dom Casmurro -> Cia das Letras
(4, 1),  -- O Iluminado -> Cia das Letras
(5, 2),  -- E Não Sobrou Nenhum -> Rocco
(6, 1),  -- 1984 -> Cia das Letras
(7, 3),  -- Fundação -> Intrínseca
(8, 2),  -- A Hora da Estrela -> Rocco
(9, 3),  -- O Hobbit -> Intrínseca
(10, 1), -- Frankenstein -> Cia das Letras
(11, 3), -- O Monstro de Mil Faces -> Intrínseca
(12, 2), -- Código Da Vinci -> Rocco
(13, 3); -- Percy Jackson -> Intrínseca