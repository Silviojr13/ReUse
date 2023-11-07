/* Base de Dados ReUse: 
	
    esta BD esta sendo atualizada na data de 02/11/2023.
    
    Responsaveis pelo armazenamento e sigilo dos dados sensiveis:
    Silvio Junior;
    Lucas Bertoli;
    Luiz Roberto;
    João Trevisan.
    
    Visando protejer e respeitar nossos clientes seguimos em rigor com a lei da LGPD.
    
    EDIÇÕES FEITA :
    
    NOME   |   DATA    |  HORA DE COMEÇO | HORA DE TERMINO
   Silvio  |02/11/2023 | 14:43           |       *****
   Silvio  |06/11/2023 | 08:45           |       *****
  
  
  
*/ 
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

-- Criação da Base de Dados:

CREATE DATABASE reusee;
USE reusee;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
-- Tabela de nivel dos perfis logados:

CREATE TABLE tb_perfil(
	id_perfil INT PRIMARY KEY AUTO_INCREMENT,
	nivel_perfil INT NOT NULL,
    descricao VARCHAR(35) NOT NULL
);

-- esta tabela é para limitar o acesso dos usuarios

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
-- Criação da tabela de registro de login dos usuarios, tabela de pré-registro dos mesmos:

CREATE TABLE tb_login(
	id_usuario INT PRIMARY KEY AUTO_INCREMENT,
    id_perfil INT NOT NULL,
	nome_usuario VARCHAR(255) NOT NULL,
    email_usuario VARCHAR(255) NOT NULL,
    senha_usuario VARCHAR(32) NOT NULL,
    FOREIGN KEY(id_perfil) references tb_perfil(id_perfil)
);

-- OBS:  sempre que for inserir dados nesta tabela use no campo senha_usuario a função de criptografia md5

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
-- Criação da tabela produto

 CREATE TABLE produto(
	id_produto INT PRIMARY KEY AUTO_INCREMENT,
    nome_produto VARCHAR(45),
    descricao VARCHAR(255),
    preco DECIMAL(7,2)
);

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- - --- -- -- -- -- -- -- -- -- -- -- --
-- Criação da tabela de associados

CREATE TABLE associado(
    id_associado INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    nascimento DATE NOT NULL,
    cpf CHAR(11) NOT NULL UNIQUE,
    rg CHAR(9) NOT NULL UNIQUE,
    sexo ENUM("M","F","NI") NOT NULL,
    email VARCHAR(50) NOT NULL UNIQUE,
    est_civil ENUM("CASADO","SOLTEIRO","DIVORCIADO","VIÚVO","SEPARADO")
    nacionalidade VARCHAR(50) NOT NULL,
    data_criacao TIMESTAMP NOT NULL
)






















--§===================================================================================================



-- MySQL Workbench Synchronization
-- Generated: 2023-11-06 16:02
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: silvi

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

CREATE SCHEMA IF NOT EXISTS `testado` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;

CREATE TABLE IF NOT EXISTS `testado`.`associados` (
  `IDassociado` INT(11) NOT NULL,
  `IDfiliais` INT(11) NULL DEFAULT NULL,
  `IDtelefone` INT(11) NULL DEFAULT NULL,
  `IDendereco` INT(11) NULL DEFAULT NULL,
  `email` VARCHAR(255) NULL DEFAULT NULL,
  `nome` VARCHAR(255) NULL DEFAULT NULL,
  `dataNascimento` DATE NULL DEFAULT NULL,
  `cpf` CHAR(11) NULL DEFAULT NULL,
  `nacionalidade` VARCHAR(255) NULL DEFAULT NULL,
  `sexo` CHAR(1) NULL DEFAULT NULL,
  PRIMARY KEY (`IDassociado`),
  INDEX `IDfiliais` (`IDfiliais` ASC) VISIBLE,
  INDEX `IDtelefone` (`IDtelefone` ASC) VISIBLE,
  INDEX `IDendereco` (`IDendereco` ASC) VISIBLE,
  CONSTRAINT `associados_ibfk_1`
    FOREIGN KEY (`IDfiliais`)
    REFERENCES `testado`.`filial` (`IDfilial`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `testado`.`cliente` (
  `IDcliente` INT(11) NOT NULL AUTO_INCREMENT,
  `dataCriacao` DATE NULL DEFAULT NULL,
  `IDassociado` INT(11) NOT NULL,
  PRIMARY KEY (`IDcliente`),
  INDEX `cliente_ibfk_1` (`IDassociado` ASC) VISIBLE,
  CONSTRAINT `cliente_ibfk_1`
    FOREIGN KEY (`IDassociado`)
    REFERENCES `testado`.`associados` (`IDassociado`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `testado`.`cobranca` (
  `IDcobranca` INT(11) NOT NULL,
  `IDtipoCobranca` INT(11) NULL DEFAULT NULL,
  `IDpedido` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`IDcobranca`),
  INDEX `IDtipoCobranca` (`IDtipoCobranca` ASC) VISIBLE,
  INDEX `IDpedido` (`IDpedido` ASC) VISIBLE,
  CONSTRAINT `cobranca_ibfk_1`
    FOREIGN KEY (`IDtipoCobranca`)
    REFERENCES `testado`.`tipo_cobranca` (`IDtipoCobranca`),
  CONSTRAINT `cobranca_ibfk_2`
    FOREIGN KEY (`IDpedido`)
    REFERENCES `testado`.`pedido` (`IDpedido`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `testado`.`disponibilidade` (
  `IDdisponibilidade` INT(11) NOT NULL,
  `disponibilidade` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`IDdisponibilidade`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `testado`.`endereco` (
  `IDendereco` INT(11) NOT NULL,
  `cidade` VARCHAR(255) NULL DEFAULT NULL,
  `estado` VARCHAR(2) NULL DEFAULT NULL,
  `bairro` VARCHAR(255) NULL DEFAULT NULL,
  `numero` VARCHAR(10) NULL DEFAULT NULL,
  `cep` CHAR(8) NULL DEFAULT NULL,
  PRIMARY KEY (`IDendereco`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `testado`.`entrega` (
  `IDentrega` INT(11) NOT NULL,
  `IDendereco` INT(11) NULL DEFAULT NULL,
  `descricao` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`IDentrega`),
  INDEX `IDendereco` (`IDendereco` ASC) VISIBLE,
  CONSTRAINT `entrega_ibfk_1`
    FOREIGN KEY (`IDendereco`)
    REFERENCES `testado`.`endereco` (`IDendereco`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `testado`.`estoque` (
  `IDestoque` INT(11) NOT NULL,
  `IDproduto` INT(11) NULL DEFAULT NULL,
  `local` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`IDestoque`),
  INDEX `IDproduto` (`IDproduto` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `testado`.`filial` (
  `IDfilial` INT(11) NOT NULL,
  `endereco` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`IDfilial`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `testado`.`fornecedor` (
  `IDfornecedor` INT(11) NOT NULL,
  `IDtelefoneFornecedor` INT(11) NULL DEFAULT NULL,
  `nome` VARCHAR(255) NULL DEFAULT NULL,
  `endereco` VARCHAR(255) NULL DEFAULT NULL,
  `email` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`IDfornecedor`),
  INDEX `IDtelefoneFornecedor` (`IDtelefoneFornecedor` ASC) VISIBLE,
  CONSTRAINT `fornecedor_ibfk_1`
    FOREIGN KEY (`IDtelefoneFornecedor`)
    REFERENCES `testado`.`telefone` (`IDtelefone`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `testado`.`funcionario` (
  `IDfuncionario` INT(11) NOT NULL,
  `profissao` VARCHAR(255) NULL DEFAULT NULL,
  `salario` DECIMAL(10,2) NULL DEFAULT NULL,
  `IDassociado` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`IDfuncionario`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `testado`.`pedido` (
  `IDpedido` INT(11) NOT NULL,
  `valorTotal` DECIMAL(10,2) NULL DEFAULT NULL,
  `IDentrega` INT(11) NULL DEFAULT NULL,
  `IDfiliais` INT(11) NULL DEFAULT NULL,
  `IDpagamento` INT(11) NULL DEFAULT NULL,
  `IDcobranca` INT(11) NULL DEFAULT NULL,
  `status_pedido` INT(11) NULL DEFAULT NULL,
  `IDcliente` INT(11) NULL DEFAULT NULL,
  `IDfuncionario` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`IDpedido`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `testado`.`perfil` (
  `IDperfil` INT(11) NOT NULL,
  `IDassociado` INT(11) NOT NULL,
  `tipo` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`IDperfil`),
  INDEX `perfil_ibfk_1` (`IDassociado` ASC) VISIBLE,
  CONSTRAINT `perfil_ibfk_1`
    FOREIGN KEY (`IDassociado`)
    REFERENCES `testado`.`associados` (`IDassociado`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `testado`.`produto` (
  `IDproduto` INT(11) NOT NULL,
  `IDestoque` INT(11) NOT NULL,
  `nome` VARCHAR(255) NULL DEFAULT NULL,
  `descricao` TEXT NULL DEFAULT NULL,
  `preco` DECIMAL(10,2) NULL DEFAULT NULL,
  `data_fabricacao` DATE NULL DEFAULT NULL,
  `categoria_produto` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`IDproduto`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `testado`.`produtos_pedido` (
  `IDprodutoPedido` INT(11) NOT NULL,
  `IDproduto` INT(11) NOT NULL,
  PRIMARY KEY (`IDprodutoPedido`),
  INDEX `produtos_pedido_ibfk_1` (`IDproduto` ASC) VISIBLE,
  CONSTRAINT `produtos_pedido_ibfk_1`
    FOREIGN KEY (`IDproduto`)
    REFERENCES `testado`.`produto` (`IDproduto`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `testado`.`reuse` (
  `cnpj` CHAR(14) NOT NULL,
  `endereco` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`cnpj`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `testado`.`telefone` (
  `IDtelefone` INT(11) NOT NULL,
  `IDassociado` INT(11) NOT NULL,
  `telefone` VARCHAR(20) NULL DEFAULT NULL,
  PRIMARY KEY (`IDtelefone`),
  INDEX `fkassociados_idx` (`IDassociado` ASC) VISIBLE,
  CONSTRAINT `fkassociados`
    FOREIGN KEY (`IDassociado`)
    REFERENCES `testado`.`associados` (`IDassociado`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `testado`.`tipo_cobranca` (
  `IDtipoCobranca` INT(11) NOT NULL,
  `tipo` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`IDtipoCobranca`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
