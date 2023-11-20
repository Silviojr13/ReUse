-- Criação do banco de dados "reuse"
CREATE DATABASE IF NOT EXISTS reuse;

-- Utilizando o banco de dados "reuse"
USE reuse;

-- Criação da tabela "cidade"
CREATE TABLE cidade (
  id_cidade INT AUTO_INCREMENT PRIMARY KEY,
  cidade VARCHAR(255),
  UF CHAR(2)
);

-- Criação da tabela "telefone"
CREATE TABLE telefone (
  id_telefone INT AUTO_INCREMENT PRIMARY KEY,
  id_associado INT,
  telefone VARCHAR(20),
  FOREIGN KEY (id_associado) REFERENCES associado(id_associado)
);

-- Criação da tabela "perfil"
CREATE TABLE perfil (
  id_perfil INT AUTO_INCREMENT PRIMARY KEY,
  descricao VARCHAR(255)
);

-- Criação da tabela "disponibilidade"
CREATE TABLE disponibilidade (
  id_disponibilidade INT AUTO_INCREMENT PRIMARY KEY,
  disponibilidade VARCHAR(255)
);

-- Criação da tabela "categoria"
CREATE TABLE categoria (
  id_categoria INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(255)
);

-- Criação da tabela "endereco"
CREATE TABLE endereco (
  id_endereco INT AUTO_INCREMENT PRIMARY KEY,
  id_associado INT,
  bairro VARCHAR(255),
  numero VARCHAR(10),
  cep CHAR(8),
  FOREIGN KEY (id_associado) REFERENCES associado(id_associado)
);

-- Criação da tabela "usuario"
CREATE TABLE usuario (
  id_usuario INT AUTO_INCREMENT PRIMARY KEY,
  id_perfil INT,
  nome_usuario VARCHAR(255),
  email_usuario VARCHAR(255),
  senha_usuario VARCHAR(255),
  FOREIGN KEY (id_perfil) REFERENCES perfil(id_perfil)
);

-- Criação da tabela "produto"
CREATE TABLE produto (
  id_produto INT AUTO_INCREMENT PRIMARY KEY,
  id_estoque INT,
  id_categoria INT,
  id_disponibilidade INT,
  nome VARCHAR(255),
  descricao TEXT,
  preco DECIMAL(10,2),
  quantidadeestoque INT,
  datafabricacao DATE,
  caminhoimagem VARCHAR(255),
  FOREIGN KEY (id_estoque) REFERENCES estoque(id_estoque),
  FOREIGN KEY (id_categoria) REFERENCES categoria(id_categoria),
  FOREIGN KEY (id_disponibilidade) REFERENCES disponibilidade(id_disponibilidade)
);

-- Criação da tabela "produto_pedido"
CREATE TABLE produto_pedido (
  id_produtoPedido INT AUTO_INCREMENT PRIMARY KEY,
  id_produto INT,
  id_pedido INT,
  quantidade INT,
  FOREIGN KEY (id_produto) REFERENCES produto(id_produto),
  FOREIGN KEY (id_pedido) REFERENCES pedido(id_pedido)
);

-- Criação da tabela "entrega"
CREATE TABLE entrega (
  id_entrega INT AUTO_INCREMENT PRIMARY KEY,
  tipo VARCHAR(255),
  id_endereco INT,
  descricao VARCHAR(255),
  FOREIGN KEY (id_endereco) REFERENCES endereco(id_endereco)
);

-- Criação da tabela "pagamento"
CREATE TABLE pagamento (
  id_pagamento INT AUTO_INCREMENT PRIMARY KEY,
  id_cobranca INT,
  FOREIGN KEY (id_cobranca) REFERENCES cobranca(id_cobranca)
);

-- Criação da tabela "cobranca"
CREATE TABLE cobranca (
  id_cobranca INT AUTO_INCREMENT PRIMARY KEY,
  id_tipoCobranca INT,
  FOREIGN KEY (id_tipoCobranca) REFERENCES tipo_cobranca(id_tipoCobranca)
);

-- Criação da tabela "tipo_cobranca"
CREATE TABLE tipo_cobranca (
  id_tipoCobranca INT AUTO_INCREMENT PRIMARY KEY,
  tipo VARCHAR(255)
);



-- Criação da tabela "associado"
CREATE TABLE associado (
  id_associado INT AUTO_INCREMENT PRIMARY KEY,
  id_filial INT,
  id_usuario INT,
  email VARCHAR(255),
  nome VARCHAR(255),
  dataNascimento DATE,
  cpf CHAR(11),
  nacionalidade VARCHAR(255),
  sexo CHAR(1),
  FOREIGN KEY (id_filial) REFERENCES filial(id_filial),
  FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)
);

-- Criação da tabela "cliente"
CREATE TABLE cliente (
  id_cliente INT AUTO_INCREMENT PRIMARY KEY,
  id_associado INT,
  data_criacao DATE,
  FOREIGN KEY (id_associado) REFERENCES associado(id_associado)
);

-- Criação da tabela "funcionario"
CREATE TABLE funcionario (
  id_funcionario INT AUTO_INCREMENT PRIMARY KEY,
  profissao VARCHAR(255),
  salario DECIMAL(10,2),
  id_associado INT,
  FOREIGN KEY (id_associado) REFERENCES associado(id_associado)
);

-- Criação da tabela "pedido"
CREATE TABLE pedido (
  id_pedido INT AUTO_INCREMENT PRIMARY KEY,
  id_funcionario INT,
  id_cliente INT,
  id_cobranca INT,
  id_pagamento INT,
  id_filial INT,
  id_entrega INT,
  status_pedido INT,
  valorTotal DECIMAL(10,2),
  FOREIGN KEY (id_funcionario) REFERENCES funcionario(id_funcionario),
  FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente),
  FOREIGN KEY (id_cobranca) REFERENCES cobranca(id_cobranca),
  FOREIGN KEY (id_pagamento) REFERENCES pagamento(id_pagamento),
  FOREIGN KEY (id_filial) REFERENCES filial(id_filial),
  FOREIGN KEY (id_entrega) REFERENCES entrega(id_entrega)
);

-- Criação da tabela "filial"
CREATE TABLE filial (
  id_filial INT AUTO_INCREMENT PRIMARY KEY,
  endereco_filial VARCHAR(255)  
);

-- Criação da tabela "reuse"
CREATE TABLE reuse (
  cnpj CHAR(14) PRIMARY KEY,
  endereco VARCHAR(255)
);

CREATE TABLE carrinho (
	id_carrinho INT PRIMARY KEY AUTO_INCREMENT,
    id_produto INT,
    id_usuario INT
);

 -- ------------------------------------------------------------------------------------------------------
 
 -- Inserir registros na tabela "perfil"
INSERT INTO perfil (descricao)
VALUES
  ('ADM'),
  ('Gerente'),
  ('Funcionário'),
  ('Cliente');

-- Inserir registros na tabela "filial"
INSERT INTO filial (endereco_filial)
VALUES
  ('Rua A, 123'),
  ('Avenida B, 456'),
  ('Rua C, 789'),
  ('Avenida D, 1011');

-- Inserir 20 registros na tabela "usuario" com nomes de pessoas
INSERT INTO usuario (id_perfil, nome_usuario, email_usuario, senha_usuario)
VALUES
  (2, 'JohnDoe', 'john.doe@example.com', 'senha123'),
  (3, 'AliceSmith', 'alice.smith@example.com', 'senha456'),
  (4, 'MichaelJohnson', 'michael.johnson@example.com', 'senha789'),
  (2, 'EmilyBrown', 'emily.brown@example.com', 'senha101112'),
  (3, 'WilliamWilson', 'william.wilson@example.com', 'senha131415'),
  (4, 'OliviaLee', 'olivia.lee@example.com', 'senha161718'),
  (2, 'JamesEvans', 'james.evans@example.com', 'senha192021'),
  (3, 'SophiaTaylor', 'sophia.taylor@example.com', 'senha222324'),
  (4, 'BenjaminHarris', 'benjamin.harris@example.com', 'senha252627'),
  (2, 'EmmaClark', 'emma.clark@example.com', 'senha282930'),
  (3, 'AlexanderLewis', 'alexander.lewis@example.com', 'senha313233'),
  (4, 'MiaHall', 'mia.hall@example.com', 'senha343536'),
  (2, 'EthanScott', 'ethan.scott@example.com', 'senha373839'),
  (3, 'AvaGreen', 'ava.green@example.com', 'senha404142'),
  (4, 'DanielAdams', 'daniel.adams@example.com', 'senha434445'),
  (2, 'SophieMitchell', 'sophie.mitchell@example.com', 'senha464748'),
  (3, 'MatthewYoung', 'matthew.young@example.com', 'senha495051'),
  (4, 'ChloeWalker', 'chloe.walker@example.com', 'senha525354'),
  (2, 'LiamHall', 'liam.hall@example.com', 'senha555657'),
  (3, 'AmeliaBaker', 'amelia.baker@example.com', 'senha585960');


INSERT INTO filial (endereco_filial) VALUES
  ('Endereço Filial 1'),
  ('Endereço Filial 2'),
  ('Endereço Filial 3'),
  ('Endereço Filial 4');


-- Populando a tabela associado
INSERT INTO associado (id_filial, id_usuario, email, nome, dataNascimento, cpf, nacionalidade, sexo)
VALUES
  (1, 21, 'joanna.miller@example.com', 'Joanna Miller', '1994-06-12', '54321678901', 'Canadian', 'F'),
  (1, 22, 'david.wilson@example.com', 'David Wilson', '1987-02-03', '65432178902', 'American', 'M'),
  (1, 23, 'sophia.brown@example.com', 'Sophia Brown', '1990-08-17', '76543289012', 'Brazilian', 'F'),
  (1, 24, 'ethan.davis@example.com', 'Ethan Davis', '1983-10-24', '87654390123', 'British', 'M'),
  (2, 25, 'olivia.taylor@example.com', 'Olivia Taylor', '1997-04-05', '98765401234', 'French', 'F'),
  (2, 26, 'benjamin.johnson@example.com', 'Benjamin Johnson', '1991-12-29', '09876512345', 'German', 'M'),
  (2, 27, 'mia.smith@example.com', 'Mia Smith', '1989-05-18', '10987623456', 'Italian', 'F'),
  (2, 28, 'logan.anderson@example.com', 'Logan Anderson', '1986-03-22', '21098734567', 'Japanese', 'M'),
  (3, 29, 'emily.evans@example.com', 'Emily Evans', '1995-11-06', '32109845678', 'Korean', 'F'),
  (3, 30, 'william.hall@example.com', 'William Hall', '1993-09-14', '43210956789', 'Russian', 'M'),
  (3, 31, 'grace.mitchell@example.com', 'Grace Mitchell', '1996-07-26', '54321067890', 'Spanish', 'F'),
  (3, 32, 'james.martin@example.com', 'James Martin', '1992-01-01', '65432178901', 'Chinese', 'M'),
  (4, 33, 'lily.jones@example.com', 'Lily Jones', '1998-03-31', '76543289012', 'Indian', 'F'),
  (4, 34, 'henry.robinson@example.com', 'Henry Robinson', '1994-08-08', '87654390123', 'Australian', 'M'),
  (4, 35, 'amelia.lewis@example.com', 'Amelia Lewis', '1988-09-20', '98765401234', 'South African', 'F'),
  (4, 36, 'michael.white@example.com', 'Michael White', '1990-10-15', '10987623456', 'Swiss', 'M'),
  (5, 37, 'sophia.walker@example.com', 'Sophia Walker', '1985-06-03', '21098734567', 'Swedish', 'F'),
  (5, 38, 'jack.martin@example.com', 'Jack Martin', '1984-04-18', '32109845678', 'Mexican', 'M'),
  (5, 39, 'olivia.clark@example.com', 'Olivia Clark', '1997-12-14', '43210956789', 'Canadian', 'F'),
  (5, 40, 'noah.thomas@example.com', 'Noah Thomas', '1982-07-29', '54321067890', 'Spanish', 'M');

INSERT INTO endereco (id_associado, bairro, numero, cep)
VALUES
  (21, 'Bairro do Associado 21', '123', '12345-67'),
  (22, 'Bairro do Associado 22', '456', '23456-78'),
  (23, 'Bairro do Associado 23', '789', '34567-89'),
  (24, 'Bairro do Associado 24', '1011', '45678-90'),
  (25, 'Bairro do Associado 25', '1213', '56789-01'),
  (26, 'Bairro do Associado 26', '1415', '67890-12'),
  (27, 'Bairro do Associado 27', '1617', '78901-23'),
  (28, 'Bairro do Associado 28', '1819', '89012-34'),
  (29, 'Bairro do Associado 29', '2021', '90123-45'),
  (30, 'Bairro do Associado 30', '2223', '01234-56'),
  (31, 'Bairro do Associado 31', '2425', '12345-67'),
  (32, 'Bairro do Associado 32', '2627', '23456-78'),
  (33, 'Bairro do Associado 33', '2829', '34567-89'),
  (34, 'Bairro do Associado 34', '3031', '45678-90'),
  (35, 'Bairro do Associado 35', '3233', '56789-01'),
  (36, 'Bairro do Associado 36', '3435', '67890-12'),
  (37, 'Bairro do Associado 37', '3637', '78901-23'),
  (38, 'Bairro do Associado 38', '3839', '89012-34'),
  (39, 'Bairro do Associado 39', '4041', '90123-45'),
  (40, 'Bairro do Associado 40', '4243', '01234-56');






-- Inserir 20 registros na tabela "cliente" com base nos associados existentes
INSERT INTO cliente (id_associado, data_criacao)
SELECT id_associado, CURDATE() FROM associado LIMIT 20;



INSERT INTO funcionario (id_associado, profissao, salario)
SELECT a.id_associado, 'Cargo do Funcionário', 2000.00
FROM associado a
JOIN usuario u ON a.id_usuario = u.id_usuario
WHERE u.id_perfil = 4
LIMIT 20;

-- Populando a tabela categoria
INSERT INTO categoria (nome) VALUES
('Eletrônicos'),
('Roupas'),
('Móveis'),
('Alimentos'),
('Esportes'),
('Livros'),
('Bebidas'),
('Automóveis'),
('Brinquedos'),
('Jóias');

INSERT INTO tipo_cobranca (tipo) VALUES
('Boleto Bancário'),
('Cartão de Crédito'),
('Transferência Bancária'),
('Dinheiro'),
('Cheque');


-- Populando a tabela disponibilidade
INSERT INTO disponibilidade (disponibilidade) VALUES
('Disponível'),
('Esgotado'),
('Em Estoque'),
('Pré-venda');

INSERT INTO produto (id_estoque, id_categoria, id_disponibilidade, nome, descricao, preco, quantidadeestoque, datafabricacao, caminhoimagem)
 VALUES
   (1, 1, 1, 'Produto 1', 'Descrição do Produto 1', 49.99, 100, '2023-11-01', 'caminho/imagem1.jpg'),
   (1, 2, 2, 'Produto 2', 'Descrição do Produto 2', 29.99, 150, '2023-11-02', 'caminho/imagem2.jpg'),
   (1, 3, 3, 'Produto 3', 'Descrição do Produto 3', 19.99, 200, '2023-11-03', 'caminho/imagem3.jpg'),
   (1, 1, 1, 'Produto 4', 'Descrição do Produto 4', 39.99, 120, '2023-11-04', 'caminho/imagem4.jpg'),
   (2, 2, 2, 'Produto 5', 'Descrição do Produto 5', 34.99, 180, '2023-11-05', 'caminho/imagem5.jpg'),
   (2, 3, 3, 'Produto 6', 'Descrição do Produto 6', 24.99, 220, '2023-11-06', 'caminho/imagem6.jpg'),
   (2, 1, 1, 'Produto 7', 'Descrição do Produto 7', 59.99, 90, '2023-11-07', 'caminho/imagem7.jpg'),
   (2, 2, 2, 'Produto 8', 'Descrição do Produto 8', 44.99, 130, '2023-11-08', 'caminho/imagem8.jpg'),
   (3, 3, 3, 'Produto 9', 'Descrição do Produto 9', 54.99, 170, '2023-11-09', 'caminho/imagem9.jpg'),
   (3, 1, 1, 'Produto 10', 'Descrição do Produto 10', 69.99, 80, '2023-11-10', 'caminho/imagem10.jpg'),
   (3, 2, 2, 'Produto 11', 'Descrição do Produto 11', 39.99, 110, '2023-11-11', 'caminho/imagem11.jpg'),
   (3, 3, 3, 'Produto 12', 'Descrição do Produto 12', 29.99, 160, '2023-11-12', 'caminho/imagem12.jpg'),
   (4, 1, 1, 'Produto 13', 'Descrição do Produto 13', 49.99, 70, '2023-11-13', 'caminho/imagem13.jpg'),
   (4, 2, 2, 'Produto 14', 'Descrição do Produto 14', 34.99, 100, '2023-11-14', 'caminho/imagem14.jpg'),
   (4, 3, 3, 'Produto 15', 'Descrição do Produto 15', 59.99, 140, '2023-11-15', 'caminho/imagem15.jpg'),
   (4, 1, 1, 'Produto 16', 'Descrição do Produto 16', 39.99, 60, '2023-11-16', 'caminho/imagem16.jpg'),
   (5, 2, 2, 'Produto 17', 'Descrição do Produto 17', 29.99, 90, '2023-11-17', 'caminho/imagem17.jpg'),
   (5, 3, 3, 'Produto 18', 'Descrição do Produto 18', 44.99, 120, '2023-11-18', 'caminho/imagem18.jpg'),
   (5, 1, 1, 'Produto 19', 'Descrição do Produto 19', 59.99, 50, '2023-11-19', 'caminho/imagem19.jpg'),
   (5, 2, 2, 'Produto 20', 'Descrição do Produto 20', 54.99, 80, '2023-11-20', 'caminho/imagem20.jpg');



-- Inserir registros na tabela "entrega"
-- Inserir registros na tabela "entrega" com IDs de endereço entre 21 e 40
INSERT INTO entrega (tipo, id_endereco, descricao)
VALUES
    ('Entrega Padrão', 21, 'Entrega residencial no horário comercial'),
    ('Entrega Rápida', 22, 'Entrega expressa em 2 horas'),
    ('Retirada na Loja', 23, 'Retire o pedido na loja em horário comercial'),
    ('Entrega Noturna', 24, 'Entrega agendada durante a noite'),
    ('Entrega Internacional', 25, 'Entrega fora do país, tempo de entrega variável'),
    ('Entrega Econômica', 26, 'Entrega econômica com prazo estendido'),
    ('Entrega Padrão', 27, 'Entrega residencial no horário comercial'),
    ('Entrega Rápida', 28, 'Entrega expressa em 2 horas'),
    ('Retirada na Loja', 29, 'Retire o pedido na loja em horário comercial'),
    ('Entrega Noturna', 30, 'Entrega agendada durante a noite'),
    ('Entrega Internacional', 31, 'Entrega fora do país, tempo de entrega variável'),
    ('Entrega Econômica', 32, 'Entrega econômica com prazo estendido'),
    ('Entrega Padrão', 33, 'Entrega residencial no horário comercial'),
    ('Entrega Rápida', 34, 'Entrega expressa em 2 horas'),
    ('Retirada na Loja', 35, 'Retire o pedido na loja em horário comercial'),
    ('Entrega Noturna', 36, 'Entrega agendada durante a noite'),
    ('Entrega Internacional', 37, 'Entrega fora do país, tempo de entrega variável'),
    ('Entrega Econômica', 38, 'Entrega econômica com prazo estendido'),
    ('Entrega Padrão', 39, 'Entrega residencial no horário comercial'),
    ('Entrega Rápida', 40, 'Entrega expressa em 2 horas');


-- Inserir registros na tabela "pedido"
INSERT INTO pedido (id_funcionario, id_cliente, id_cobranca, id_pagamento, id_filial, id_entrega, status_pedido, valorTotal)
VALUES
  (1, 1, 1, 1, 1, 1, 1, 49.99),
  (1, 2, 2, 2, 1, 2, 1, 29.99),
  (2, 3, 3, 3, 2, 1, 1, 19.99),
  (2, 4, 4, 4, 2, 2, 1, 39.99);
  
  
   
SELECT * FROM produto;


SELECT * FROM produto
WHERE id_categoria = 1;

SELECT * FROM produto
WHERE id_produto = 1;


SELECT * FROM reuse.cliente;

SELECT * FROM cliente
WHERE id_cliente = 1;


SELECT * FROM pedido
WHERE id_pedido = 16;


SELECT pedido.*
FROM pedido
INNER JOIN cliente ON pedido.id_cliente = cliente.id_cliente
WHERE cliente.id_cliente = 1;

SELECT pedido.*
FROM pedido
INNER JOIN entrega ON pedido.id_entrega = entrega.id_entrega
WHERE entrega.id_entrega = 7;

SELECT disponibilidade FROM pedidos
WHERE disponibilidade = 'Esgotado';

SELECT *
FROM produto
WHERE quantidadeestoque > 0;

SELECT *
FROM produto
WHERE id_disponibilidade = 2;

ALTER TABLE pedido
ADD data_pedido DATE;

-- Exemplo: definindo datas para alguns pedidos
UPDATE pedido
SET data_pedido = '2023-11-01'
WHERE id_pedido = 1;

UPDATE pedido
SET data_pedido = '2023-11-02'
WHERE id_pedido = 2;

-- Repita o processo para outros pedidos, ajustando as datas conforme necessário.

SELECT *
FROM pedido
WHERE data_pedido BETWEEN '2023-11-01' AND '2023-11-05';

SELECT pedido.*
FROM pedido
INNER JOIN cobranca ON pedido.id_cobranca = cobranca.id_cobranca
WHERE cobranca.id_tipoCobranca = 1;

SELECT cliente.id_cliente, cliente.id_associado, cliente.data_criacao, COUNT(pedido.id_pedido) AS total_pedidos
FROM cliente
LEFT JOIN pedido ON cliente.id_cliente = pedido.id_cliente
GROUP BY cliente.id_cliente, cliente.id_associado, cliente.data_criacao
ORDER BY total_pedidos DESC;

SELECT *
FROM produto
WHERE preco < 300;

SELECT *
FROM produto
ORDER BY datafabricacao DESC
LIMIT 10;


SELECT *
FROM cliente
ORDER BY data_criacao DESC;

SELECT *
FROM produto
WHERE id_disponibilidade = 2; 

SELECT pedido.id_pedido, filial.endereco_filial
FROM pedido
INNER JOIN filial ON pedido.id_filial = filial.id_filial;

SELECT *
FROM produto
WHERE quantidadeestoque < 120;


SELECT c.id_cliente AS ca.id_categoria, ca.nome AS nome_categoria, COUNT(p.id_produto) AS total_compras
FROM cliente AS c
INNER JOIN pedido AS p ON c.id_cliente = p.id_cliente
INNER JOIN produto AS pr ON p.id_pedido = pr.id_pedido
INNER JOIN categoria AS ca ON pr.id_categoria = ca.id_categoria
WHERE ca.id_categoria = 1
GROUP BY c.id_cliente
ORDER BY total_compras DESC
LIMIT 1;







SELECT P.* 
FROM produto P
INNER JOIN carrinho C ON C.id_produto = P.id_produto
WHERE id_usuario = 35;



