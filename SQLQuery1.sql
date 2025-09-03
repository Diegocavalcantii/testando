CREATE DATABASE Teste1;

CREATE TABLE Autor (
IdAutor SMALLINT IDENTITY,
NomeAutor VARCHAR(50) NOT NULL,
SobreNome VARCHAR(60) NOT NULL,
CONSTRAINT pk_id_autor PRIMARY KEY (IdAutor)
);

sp_help Livro;

CREATE TABLE Editora (
IdEditora SMALLINT PRIMARY KEY IDENTITY,
NomeEditora VARCHAR(50) NOT NULL
);

CREATE TABLE Assunto (
IdAssunto TINYINT PRIMARY KEY,
NomeAssunto VARCHAR (25) NOT NULL
);

/* Usa ON DELETE CASCADE para que n�o seja permitido deletar tabelas
que possuem rela��o protejendo sua integridade */
CREATE TABLE Livro (
IdLivro SMALLINT PRIMARY KEY IDENTITY(100,1),
NomeLivro VARCHAR(70) NOT NULL,
ISBN13 CHAR(13) UNIQUE NOT NULL,
DataPub DATE,
Pre�oLivro MONEY NOT NULL,
NumeroPaginas SMALLINT NOT NULL,
IdEditora SMALLINT NOT NULL,
IdAssunto TINYINT NOT NULL,
CONSTRAINT fk_id_editora FOREIGN KEY (IdEditora)
	REFERENCES Editora(IdEditora),
CONSTRAINT fk_id_assunto FOREIGN KEY (IdAssunto)
	REFERENCES Assunto(IdAssunto),
CONSTRAINT verifica_preco CHECK(Pre�oLivro >= 0)
);

-- N�o usa ON DELETE CASCADE pq n�o vai executar opera��es diretamente sobre a tabela
-- ela vai ter apenas IDS e ser� usada pelo JOIN para consultar informa��es
-- ter� uma chave prim�ria composta, pq um livro pode ser publicado por mais de 1 autor
-- e um autor pode publicar mais de um livro
CREATE TABLE LivroAutor (
IdLivro SMALLINT NOT NULL,
IdAutor SMALLINT NOT NULL,
CONSTRAINT fk_id_livros FOREIGN KEY (IdLivro)
	REFERENCES Livro(IdLivro),
CONSTRAINT fk_id_autores FOREIGN KEY (IdAutor)
	REFERENCES Autor(IdAutor),
CONSTRAINT pk_livro_autor PRIMARY KEY (IdLivro, IdAutor)
);
