CREATE DATABASE db_livraria;

USE db_livraria;

CREATE TABLE tbl_editora (
    ID_Editora INT PRIMARY KEY,
    NomeEmpresa VARCHAR(100),
    TelefoneContato VARCHAR(20),
    EmailCorporativo VARCHAR(100)
);

CREATE TABLE tbl_autor (
    ID_Autor INT PRIMARY KEY,
    NomeCompleto VARCHAR(100),
    Nacionalidade VARCHAR(50),
    DataNascimento DATE
);

CREATE TABLE tbl_cliente (
    ID_Cliente INT PRIMARY KEY,
    NomeCompleto VARCHAR(100),
    Email VARCHAR(100) UNIQUE,
    CPF VARCHAR(11),
    DataCadastro DATE
);

CREATE TABLE tbl_livro (
    ISBN VARCHAR(13) PRIMARY KEY,
    Titulo VARCHAR(150) NOT NULL,
    PrecoVendaAtual DECIMAL(10,2),
    QtdEstoque INT CHECK (QtdEstoque >= 0),
    AnoPublicacao INT,
    ID_Editora INT FOREIGN KEY REFERENCES tbl_editora (ID_Editora)
);

CREATE TABLE tbl_livro_autor (
    ISBN VARCHAR(13) FOREIGN KEY REFERENCES tbl_livro (ISBN),
    ID_Autor INT FOREIGN KEY REFERENCES tbl_autor (ID_Autor),
    PRIMARY KEY (ISBN, ID_Autor)
);

CREATE TABLE tbl_pedido (
    ID_Pedido INT PRIMARY KEY,
    DataHora DATETIME,
    ValorTotal DECIMAL(10,2),
    ID_Cliente INT FOREIGN KEY REFERENCES tbl_cliente (ID_Cliente)
);

CREATE TABLE tbl_item_pedido (
    ID_ItemPedido INT PRIMARY KEY,
    Quantidade INT,
    PrecoUnitarioVenda DECIMAL(10,2),
    ID_Pedido INT FOREIGN KEY REFERENCES tbl_pedido (ID_Pedido),
    ISBN VARCHAR(13) FOREIGN KEY REFERENCES tbl_livro (ISBN)
);

INSERT INTO tbl_editora (ID_Editora, NomeEmpresa, TelefoneContato, EmailCorporativo) VALUES
(1, 'Horizonte Azul Editora', '(11) 3201-4501', 'contato@horizonteazul.com.br'),
(2, 'Caminho Novo Livros', '(11) 3202-4502', 'atendimento@caminhonovo.com.br'),
(3, 'Editora Rio Claro', '(19) 3203-4503', 'editorial@rioclaro.com.br'),
(4, 'Ponte das Letras', '(21) 3204-4504', 'contato@pontedasletras.com.br'),
(5, 'Biblioteca do Sul', '(51) 3205-4505', 'vendas@bibliotecadosul.com.br'),
(6, 'Editora Aurora Boreal', '(31) 3206-4506', 'contato@auroraboreal.com.br'),
(7, 'Casa do Saber Paulista', '(11) 3207-4507', 'comercial@casadosaber.com.br'),
(8, 'Editora Marco Zero', '(81) 3208-4508', 'contato@marcozero.com.br'),
(9, 'Letra Viva Publicações', '(71) 3209-4509', 'editorial@letraviva.com.br'),
(10, 'Editora Quatro Ventos', '(41) 3210-4510', 'atendimento@quatroventos.com.br');

INSERT INTO tbl_cliente (ID_Cliente, NomeCompleto, Email, CPF, DataCadastro) VALUES
(1, 'Ana Beatriz Souza', 'ana.souza@email.com', '12345678909', '20260112'),
(2, 'Bruno Henrique Lima', 'bruno.lima@email.com', '23456789173', '20260125'),
(3, 'Camila Ferreira Alves', 'camila.alves@email.com', '34567891228', '20260210'),
(4, 'Diego Martins Rocha', 'diego.rocha@email.com', '45678912364', '20260303'),
(5, 'Eduarda Nogueira Costa', 'eduarda.costa@email.com', '56789123482', '20260318'),
(6, 'Felipe Araújo Santos', 'felipe.santos@email.com', '67891234582', '20260422'),
(7, 'Gabriela Moreira Dias', 'gabriela.dias@email.com', '78912345664', '20260509'),
(8, 'Henrique Barbosa Pinto', 'henrique.pinto@email.com', '89123456728', '20260614'),
(9, 'Isabela Cardoso Ramos', 'isabela.ramos@email.com', '91234567873', '20260702'),
(10, 'João Pedro Teixeira', 'joao.teixeira@email.com', '13579246828', '20260819');

INSERT INTO tbl_autor (ID_Autor, NomeCompleto, Nacionalidade, DataNascimento) VALUES
(1, 'Marina Almeida Prado', 'Brasileira', '19400101'),
(2, 'Rafael Barros Vasconcelos', 'Brasileira', '19470612'),
(3, 'Helena Cavalcanti Queiroz', 'Portuguesa', '19541123'),
(4, 'Otávio Duarte Lacerda', 'Brasileira', '19610406'),
(5, 'Beatriz Esteves Siqueira', 'Argentina', '19680917'),
(6, 'Lucas Fonseca Tavares', 'Brasileira', '19750228'),
(7, 'Carla Guimarães Campos', 'Angolana', '19820711'),
(8, 'Tiago Holanda Neves', 'Brasileira', '19891222'),
(9, 'Renata Ibrahim Medeiros', 'Uruguaia', '19460505'),
(10, 'Vinícius Junqueira Bastos', 'Brasileira', '19531016'),
(11, 'Larissa Almeida Neves', 'Brasileira', '19600327'),
(12, 'Gustavo Barros Medeiros', 'Brasileira', '19670810'),
(13, 'Patrícia Cavalcanti Bastos', 'Portuguesa', '19740121'),
(14, 'Leandro Duarte Prado', 'Brasileira', '19810604'),
(15, 'Sofia Esteves Vasconcelos', 'Argentina', '19881115'),
(16, 'Mateus Fonseca Queiroz', 'Brasileira', '19450426'),
(17, 'Juliana Guimarães Lacerda', 'Angolana', '19520909'),
(18, 'Fernando Holanda Siqueira', 'Brasileira', '19590220'),
(19, 'Clara Ibrahim Tavares', 'Uruguaia', '19660703'),
(20, 'Rodrigo Junqueira Campos', 'Brasileira', '19731214'),
(21, 'Paula Almeida Siqueira', 'Brasileira', '19800525'),
(22, 'André Barros Tavares', 'Brasileira', '19871008'),
(23, 'Luiza Cavalcanti Campos', 'Portuguesa', '19440319'),
(24, 'Caio Duarte Neves', 'Brasileira', '19510802'),
(25, 'Elisa Esteves Medeiros', 'Argentina', '19580113'),
(26, 'Nina Fonseca Bastos', 'Brasileira', '19650624'),
(27, 'Davi Guimarães Prado', 'Angolana', '19721107'),
(28, 'Aline Holanda Vasconcelos', 'Brasileira', '19790418'),
(29, 'Ricardo Ibrahim Queiroz', 'Uruguaia', '19860901'),
(30, 'Bianca Junqueira Lacerda', 'Brasileira', '19430212'),
(31, 'Samuel Almeida Vasconcelos', 'Brasileira', '19500723'),
(32, 'Mônica Barros Queiroz', 'Brasileira', '19571206'),
(33, 'Pedro Cavalcanti Lacerda', 'Portuguesa', '19640517'),
(34, 'Alice Duarte Siqueira', 'Brasileira', '19711028'),
(35, 'Igor Esteves Tavares', 'Argentina', '19780311'),
(36, 'Vera Fonseca Campos', 'Brasileira', '19850822'),
(37, 'Murilo Guimarães Neves', 'Angolana', '19420105'),
(38, 'Tânia Holanda Medeiros', 'Brasileira', '19490616'),
(39, 'Breno Ibrahim Bastos', 'Uruguaia', '19561127'),
(40, 'Lívia Junqueira Prado', 'Brasileira', '19630410'),
(41, 'Hugo Almeida Medeiros', 'Brasileira', '19700921'),
(42, 'Débora Barros Bastos', 'Brasileira', '19770204'),
(43, 'Ícaro Cavalcanti Prado', 'Portuguesa', '19840715'),
(44, 'Yasmin Duarte Vasconcelos', 'Brasileira', '19411226'),
(45, 'Emanuel Esteves Queiroz', 'Argentina', '19480509'),
(46, 'Raquel Fonseca Lacerda', 'Brasileira', '19551020'),
(47, 'Jonas Guimarães Siqueira', 'Angolana', '19620303'),
(48, 'Flávia Holanda Tavares', 'Brasileira', '19690814'),
(49, 'Otto Ibrahim Campos', 'Uruguaia', '19760125'),
(50, 'Nádia Junqueira Neves', 'Brasileira', '19830608');

INSERT INTO tbl_livro (ISBN, Titulo, PrecoVendaAtual, QtdEstoque, AnoPublicacao, ID_Editora) VALUES
('9788500000001', 'O Farol das Marés Calmas', 49.90, 25, 2015, 1),
('9788500000002', 'Cartas para o Sertão', 39.90, 40, 2018, 2),
('9788500000003', 'Algoritmos no Dia a Dia', 59.90, 12, 2021, 3),
('9788500000004', 'A Casa dos Ventos', 44.90, 30, 2012, 4),
('9788500000005', 'Bancos de Dados para Iniciantes', 69.90, 18, 2019, 5),
('9788500000006', 'Crônicas de uma Cidade Pequena', 34.90, 50, 2010, 6),
('9788500000007', 'O Último Trem para Santos', 42.90, 22, 2016, 7),
('9788500000008', 'Introdução à Química Cotidiana', 54.90, 15, 2022, 8),
('9788500000009', 'Mapas, Rotas e Fronteiras', 64.90, 35, 2020, 9),
('9788500000010', 'O Segredo da Biblioteca Velha', 37.90, 28, 2014, 10),
('9788500000011', 'Programação Orientada a Objetos com Java', 79.90, 10, 2023, 1),
('9788500000012', 'Histórias do Império Esquecido', 52.90, 20, 2011, 2),
('9788500000013', 'Receitas de Família', 47.90, 45, 2017, 3),
('9788500000014', 'Biomas do Brasil: Uma Viagem', 58.90, 14, 2024, 4),
('9788500000015', 'O Detetive de Cidade Tiradentes', 36.90, 32, 2013, 5),
('9788500000016', 'Poemas de Fim de Tarde', 29.90, 60, 2009, 6),
('9788500000017', 'Redes de Computadores sem Mistério', 67.90, 16, 2022, 7),
('9788500000018', 'A Menina que Contava Estrelas', 33.90, 38, 2018, 8),
('9788500000019', 'Física em Movimento', 62.90, 24, 2021, 9),
('9788500000020', 'O Jardim Suspenso', 41.90, 27, 2015, 10),
('9788500000021', 'Lógica de Programação Ilustrada', 56.90, 19, 2020, 1),
('9788500000022', 'Memórias de um Navegador', 48.90, 42, 2008, 2),
('9788500000023', 'Sociedade e Tecnologia', 45.90, 13, 2019, 3),
('9788500000024', 'O Código das Montanhas', 38.90, 36, 2016, 4),
('9788500000025', 'Pequeno Manual de Escrita Criativa', 35.90, 48, 2023, 5),
('9788500000026', 'A Travessia', 31.90, 55, 2012, 6),
('9788500000027', 'Desenvolvimento Web do Zero', 72.90, 11, 2025, 7),
('9788500000028', 'Contos do Litoral', 32.90, 29, 2014, 8),
('9788500000029', 'Matemática para Todos', 57.90, 21, 2021, 9),
('9788500000030', 'O Mistério da Rua das Flores', 40.90, 33, 2017, 10);

INSERT INTO tbl_livro_autor (ISBN, ID_Autor) VALUES
('9788500000001', 1),
('9788500000002', 2),
('9788500000003', 3),
('9788500000004', 4),
('9788500000005', 5),
('9788500000006', 6),
('9788500000007', 7),
('9788500000008', 8),
('9788500000009', 9),
('9788500000010', 10),
('9788500000011', 11),
('9788500000012', 12),
('9788500000013', 13),
('9788500000014', 14),
('9788500000015', 15),
('9788500000016', 16),
('9788500000017', 17),
('9788500000018', 18),
('9788500000019', 19),
('9788500000020', 20),
('9788500000021', 21),
('9788500000022', 22),
('9788500000023', 23),
('9788500000024', 24),
('9788500000025', 25),
('9788500000026', 26),
('9788500000027', 27),
('9788500000028', 28),
('9788500000029', 29),
('9788500000030', 30),
('9788500000001', 31),
('9788500000002', 32),
('9788500000003', 33),
('9788500000004', 34),
('9788500000005', 35),
('9788500000006', 36),
('9788500000007', 37),
('9788500000008', 38),
('9788500000009', 39),
('9788500000010', 40),
('9788500000011', 41),
('9788500000012', 42),
('9788500000013', 43),
('9788500000014', 44),
('9788500000015', 45),
('9788500000016', 46),
('9788500000017', 47),
('9788500000018', 48),
('9788500000019', 49),
('9788500000020', 50);

INSERT INTO tbl_pedido (ID_Pedido, DataHora, ValorTotal, ID_Cliente) VALUES
(1, '20260903 10:15:00', 179.70, 1),
(2, '20260905 14:40:00', 49.90, 2),
(3, '20260912 09:05:00', 115.70, 3),
(4, '20260918 16:20:00', 79.90, 1),
(5, '20260925 11:30:00', 127.70, 4),
(6, '20261002 19:10:00', 87.80, 5),
(7, '20261008 13:45:00', 129.80, 6),
(8, '20261015 15:00:00', 101.70, 7),
(9, '20261022 10:25:00', 195.60, 3),
(10, '20261105 17:50:00', 44.90, 8);

INSERT INTO tbl_item_pedido (ID_ItemPedido, ID_Pedido, ISBN, Quantidade, PrecoUnitarioVenda) VALUES
(1, 1, '9788500000003', 1, 39.90),
(2, 1, '9788500000005', 2, 69.90),
(3, 2, '9788500000001', 1, 49.90),
(4, 3, '9788500000010', 1, 37.90),
(5, 3, '9788500000015', 1, 36.90),
(6, 3, '9788500000030', 1, 40.90),
(7, 4, '9788500000011', 1, 79.90),
(8, 5, '9788500000007', 2, 42.90),
(9, 5, '9788500000020', 1, 41.90),
(10, 6, '9788500000002', 1, 39.90),
(11, 6, '9788500000013', 1, 47.90),
(12, 7, '9788500000027', 1, 72.90),
(13, 7, '9788500000021', 1, 56.90),
(14, 8, '9788500000018', 3, 33.90),
(15, 9, '9788500000009', 1, 64.90),
(16, 9, '9788500000014', 1, 58.90),
(17, 9, '9788500000025', 2, 35.90),
(18, 10, '9788500000004', 1, 44.90);

SELECT * FROM tbl_editora;
SELECT * FROM tbl_cliente;
SELECT * FROM tbl_autor;
SELECT * FROM tbl_livro;
SELECT * FROM tbl_livro_autor;
SELECT * FROM tbl_pedido;
SELECT * FROM tbl_item_pedido;
