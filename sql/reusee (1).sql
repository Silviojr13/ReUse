CREATE DATABASE  IF NOT EXISTS `reuse` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `reuse`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: reuse
-- ------------------------------------------------------
-- Server version	8.0.34

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `associado`
--

DROP TABLE IF EXISTS `associado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `associado` (
  `id_associado` int NOT NULL AUTO_INCREMENT,
  `id_filial` int DEFAULT NULL,
  `id_usuario` int DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `dataNascimento` date DEFAULT NULL,
  `cpf` char(11) DEFAULT NULL,
  `nacionalidade` varchar(255) DEFAULT NULL,
  `sexo` char(1) DEFAULT NULL,
  PRIMARY KEY (`id_associado`),
  KEY `id_filial` (`id_filial`),
  KEY `id_usuario` (`id_usuario`),
  CONSTRAINT `associado_ibfk_1` FOREIGN KEY (`id_filial`) REFERENCES `filial` (`id_filial`),
  CONSTRAINT `associado_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `associado`
--

LOCK TABLES `associado` WRITE;
/*!40000 ALTER TABLE `associado` DISABLE KEYS */;
INSERT INTO `associado` VALUES (21,1,1,'john.doe@example.com','John Doe','1990-05-15','12345678901','Brazilian','M'),(22,1,2,'alice.smith@example.com','Alice Smith','1985-08-21','23456789012','American','F'),(23,1,3,'michael.johnson@example.com','Michael Johnson','1983-03-10','34567890123','British','M'),(24,1,4,'emily.brown@example.com','Emily Brown','1992-11-03','45678901234','Canadian','F'),(25,2,5,'william.wilson@example.com','William Wilson','1988-07-29','56789012345','French','M'),(26,2,6,'olivia.lee@example.com','Olivia Lee','1991-01-17','67890123456','German','F'),(27,2,7,'james.evans@example.com','James Evans','1987-06-04','78901234567','Italian','M'),(28,2,8,'sophia.taylor@example.com','Sophia Taylor','1995-09-22','89012345678','Japanese','F'),(29,3,9,'benjamin.harris@example.com','Benjamin Harris','1986-02-14','90123456789','Korean','M'),(30,3,10,'emma.clark@example.com','Emma Clark','1993-12-08','01234567890','Russian','F'),(31,3,11,'alexander.lewis@example.com','Alexander Lewis','1994-04-30','12345678901','Spanish','M'),(32,3,12,'mia.hall@example.com','Mia Hall','1989-10-12','23456789012','Chinese','F'),(33,4,13,'ethan.scott@example.com','Ethan Scott','1984-03-19','34567890123','Indian','M'),(34,4,14,'ava.green@example.com','Ava Green','1996-05-27','45678901234','Australian','F'),(35,4,15,'daniel.adams@example.com','Daniel Adams','1982-09-03','56789012345','South African','M'),(36,4,16,'sophie.mitchell@example.com','Sophie Mitchell','1998-11-01','67890123456','Swiss','F'),(37,5,17,'matthew.young@example.com','Matthew Young','1981-07-02','78901234567','Swedish','M'),(38,5,18,'chloe.walker@example.com','Chloe Walker','1997-06-15','89012345678','Mexican','F'),(39,5,19,'liam.hall@example.com','Liam Hall','1990-12-25','90123456789','Canadian','M'),(40,5,20,'amelia.baker@example.com','Amelia Baker','1993-02-28','01234567890','Spanish','F');
/*!40000 ALTER TABLE `associado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria` (
  `id_categoria` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,'Eletrônicos'),(2,'Roupas'),(3,'Móveis'),(4,'Alimentos'),(5,'Esportes'),(6,'Livros'),(7,'Bebidas'),(8,'Automóveis'),(9,'Brinquedos'),(10,'Jóias'),(11,'Eletrônicos'),(12,'Roupas'),(13,'Móveis'),(14,'Alimentos'),(15,'Esportes'),(16,'Livros'),(17,'Bebidas'),(18,'Automóveis'),(19,'Brinquedos'),(20,'Jóias');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cidade`
--

DROP TABLE IF EXISTS `cidade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cidade` (
  `id_cidade` int NOT NULL AUTO_INCREMENT,
  `cidade` varchar(255) DEFAULT NULL,
  `UF` char(2) DEFAULT NULL,
  PRIMARY KEY (`id_cidade`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cidade`
--

LOCK TABLES `cidade` WRITE;
/*!40000 ALTER TABLE `cidade` DISABLE KEYS */;
/*!40000 ALTER TABLE `cidade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `id_cliente` int NOT NULL AUTO_INCREMENT,
  `id_associado` int DEFAULT NULL,
  `data_criacao` date DEFAULT NULL,
  PRIMARY KEY (`id_cliente`),
  KEY `id_associado` (`id_associado`),
  CONSTRAINT `cliente_ibfk_1` FOREIGN KEY (`id_associado`) REFERENCES `associado` (`id_associado`)
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,21,'2023-11-08'),(2,22,'2023-11-08'),(3,23,'2023-11-08'),(4,24,'2023-11-08'),(5,25,'2023-11-08'),(6,26,'2023-11-08'),(7,27,'2023-11-08'),(8,28,'2023-11-08'),(9,29,'2023-11-08'),(10,30,'2023-11-08'),(11,31,'2023-11-08'),(12,32,'2023-11-08'),(13,33,'2023-11-08'),(14,34,'2023-11-08'),(15,35,'2023-11-08'),(16,36,'2023-11-08'),(17,37,'2023-11-08'),(18,38,'2023-11-08'),(19,39,'2023-11-08'),(20,40,'2023-11-08');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cobranca`
--

DROP TABLE IF EXISTS `cobranca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cobranca` (
  `id_cobranca` int NOT NULL AUTO_INCREMENT,
  `id_tipoCobranca` int DEFAULT NULL,
  PRIMARY KEY (`id_cobranca`),
  KEY `id_tipoCobranca` (`id_tipoCobranca`),
  CONSTRAINT `cobranca_ibfk_1` FOREIGN KEY (`id_tipoCobranca`) REFERENCES `tipo_cobranca` (`id_tipoCobranca`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cobranca`
--

LOCK TABLES `cobranca` WRITE;
/*!40000 ALTER TABLE `cobranca` DISABLE KEYS */;
INSERT INTO `cobranca` VALUES (1,1),(5,1),(6,1),(2,2),(3,3),(4,4);
/*!40000 ALTER TABLE `cobranca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `disponibilidade`
--

DROP TABLE IF EXISTS `disponibilidade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `disponibilidade` (
  `id_disponibilidade` int NOT NULL AUTO_INCREMENT,
  `disponibilidade` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_disponibilidade`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disponibilidade`
--

LOCK TABLES `disponibilidade` WRITE;
/*!40000 ALTER TABLE `disponibilidade` DISABLE KEYS */;
INSERT INTO `disponibilidade` VALUES (1,'Disponível'),(2,'Esgotado'),(3,'Em Estoque'),(4,'Pré-venda');
/*!40000 ALTER TABLE `disponibilidade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `endereco`
--

DROP TABLE IF EXISTS `endereco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `endereco` (
  `id_endereco` int NOT NULL AUTO_INCREMENT,
  `id_associado` int DEFAULT NULL,
  `bairro` varchar(255) DEFAULT NULL,
  `numero` varchar(10) DEFAULT NULL,
  `cep` char(8) DEFAULT NULL,
  PRIMARY KEY (`id_endereco`),
  KEY `id_associado` (`id_associado`),
  CONSTRAINT `endereco_ibfk_1` FOREIGN KEY (`id_associado`) REFERENCES `associado` (`id_associado`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `endereco`
--

LOCK TABLES `endereco` WRITE;
/*!40000 ALTER TABLE `endereco` DISABLE KEYS */;
INSERT INTO `endereco` VALUES (21,21,'Bairro do Associado 21','123','12345-67'),(22,22,'Bairro do Associado 22','456','23456-78'),(23,23,'Bairro do Associado 23','789','34567-89'),(24,24,'Bairro do Associado 24','1011','45678-90'),(25,25,'Bairro do Associado 25','1213','56789-01'),(26,26,'Bairro do Associado 26','1415','67890-12'),(27,27,'Bairro do Associado 27','1617','78901-23'),(28,28,'Bairro do Associado 28','1819','89012-34'),(29,29,'Bairro do Associado 29','2021','90123-45'),(30,30,'Bairro do Associado 30','2223','01234-56'),(31,31,'Bairro do Associado 31','2425','12345-67'),(32,32,'Bairro do Associado 32','2627','23456-78'),(33,33,'Bairro do Associado 33','2829','34567-89'),(34,34,'Bairro do Associado 34','3031','45678-90'),(35,35,'Bairro do Associado 35','3233','56789-01'),(36,36,'Bairro do Associado 36','3435','67890-12'),(37,37,'Bairro do Associado 37','3637','78901-23'),(38,38,'Bairro do Associado 38','3839','89012-34'),(39,39,'Bairro do Associado 39','4041','90123-45'),(40,40,'Bairro do Associado 40','4243','01234-56');
/*!40000 ALTER TABLE `endereco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entrega`
--

DROP TABLE IF EXISTS `entrega`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entrega` (
  `id_entrega` int NOT NULL AUTO_INCREMENT,
  `tipo` varchar(255) DEFAULT NULL,
  `id_endereco` int DEFAULT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_entrega`),
  KEY `id_endereco` (`id_endereco`),
  CONSTRAINT `entrega_ibfk_1` FOREIGN KEY (`id_endereco`) REFERENCES `endereco` (`id_endereco`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entrega`
--

LOCK TABLES `entrega` WRITE;
/*!40000 ALTER TABLE `entrega` DISABLE KEYS */;
INSERT INTO `entrega` VALUES (7,'Entrega Padrão',21,'Entrega residencial no horário comercial'),(8,'Entrega Rápida',22,'Entrega expressa em 2 horas'),(9,'Retirada na Loja',23,'Retire o pedido na loja em horário comercial'),(10,'Entrega Noturna',24,'Entrega agendada durante a noite'),(11,'Entrega Internacional',25,'Entrega fora do país, tempo de entrega variável'),(12,'Entrega Econômica',26,'Entrega econômica com prazo estendido'),(13,'Entrega Padrão',27,'Entrega residencial no horário comercial'),(14,'Entrega Rápida',28,'Entrega expressa em 2 horas'),(15,'Retirada na Loja',29,'Retire o pedido na loja em horário comercial'),(16,'Entrega Noturna',30,'Entrega agendada durante a noite'),(17,'Entrega Internacional',31,'Entrega fora do país, tempo de entrega variável'),(18,'Entrega Econômica',32,'Entrega econômica com prazo estendido'),(19,'Entrega Padrão',33,'Entrega residencial no horário comercial'),(20,'Entrega Rápida',34,'Entrega expressa em 2 horas'),(21,'Retirada na Loja',35,'Retire o pedido na loja em horário comercial'),(22,'Entrega Noturna',36,'Entrega agendada durante a noite'),(23,'Entrega Internacional',37,'Entrega fora do país, tempo de entrega variável'),(24,'Entrega Econômica',38,'Entrega econômica com prazo estendido'),(25,'Entrega Padrão',39,'Entrega residencial no horário comercial'),(26,'Entrega Rápida',40,'Entrega expressa em 2 horas');
/*!40000 ALTER TABLE `entrega` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estoque`
--

DROP TABLE IF EXISTS `estoque`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estoque` (
  `id_estoque` int NOT NULL AUTO_INCREMENT,
  `id_filial` int DEFAULT NULL,
  PRIMARY KEY (`id_estoque`),
  KEY `id_filial` (`id_filial`),
  CONSTRAINT `estoque_ibfk_1` FOREIGN KEY (`id_filial`) REFERENCES `filial` (`id_filial`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estoque`
--

LOCK TABLES `estoque` WRITE;
/*!40000 ALTER TABLE `estoque` DISABLE KEYS */;
INSERT INTO `estoque` VALUES (1,1),(2,2),(3,3),(4,4),(5,5);
/*!40000 ALTER TABLE `estoque` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filial`
--

DROP TABLE IF EXISTS `filial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `filial` (
  `id_filial` int NOT NULL AUTO_INCREMENT,
  `endereco_filial` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_filial`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filial`
--

LOCK TABLES `filial` WRITE;
/*!40000 ALTER TABLE `filial` DISABLE KEYS */;
INSERT INTO `filial` VALUES (1,'Rua A, 123'),(2,'Avenida B, 456'),(3,'Rua C, 789'),(4,'Avenida D, 1011'),(5,'Endereço Filial 1'),(6,'Endereço Filial 2'),(7,'Endereço Filial 3'),(8,'Endereço Filial 4');
/*!40000 ALTER TABLE `filial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funcionario`
--

DROP TABLE IF EXISTS `funcionario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `funcionario` (
  `id_funcionario` int NOT NULL AUTO_INCREMENT,
  `profissao` varchar(255) DEFAULT NULL,
  `salario` decimal(10,2) DEFAULT NULL,
  `id_associado` int DEFAULT NULL,
  PRIMARY KEY (`id_funcionario`),
  KEY `id_associado` (`id_associado`),
  CONSTRAINT `funcionario_ibfk_1` FOREIGN KEY (`id_associado`) REFERENCES `associado` (`id_associado`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funcionario`
--

LOCK TABLES `funcionario` WRITE;
/*!40000 ALTER TABLE `funcionario` DISABLE KEYS */;
INSERT INTO `funcionario` VALUES (1,'Cargo do Funcionário',2000.00,23),(2,'Cargo do Funcionário',2000.00,26),(3,'Cargo do Funcionário',2000.00,29),(4,'Cargo do Funcionário',2000.00,32),(5,'Cargo do Funcionário',2000.00,35),(6,'Cargo do Funcionário',2000.00,38);
/*!40000 ALTER TABLE `funcionario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagamento`
--

DROP TABLE IF EXISTS `pagamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pagamento` (
  `id_pagamento` int NOT NULL AUTO_INCREMENT,
  `id_cobranca` int DEFAULT NULL,
  PRIMARY KEY (`id_pagamento`),
  KEY `id_cobranca` (`id_cobranca`),
  CONSTRAINT `pagamento_ibfk_1` FOREIGN KEY (`id_cobranca`) REFERENCES `cobranca` (`id_cobranca`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagamento`
--

LOCK TABLES `pagamento` WRITE;
/*!40000 ALTER TABLE `pagamento` DISABLE KEYS */;
INSERT INTO `pagamento` VALUES (11,1),(16,1),(12,2),(13,3),(14,3),(15,4),(17,5),(18,6);
/*!40000 ALTER TABLE `pagamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido`
--

DROP TABLE IF EXISTS `pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido` (
  `id_pedido` int NOT NULL AUTO_INCREMENT,
  `id_funcionario` int DEFAULT NULL,
  `id_cliente` int DEFAULT NULL,
  `id_cobranca` int DEFAULT NULL,
  `id_pagamento` int DEFAULT NULL,
  `id_filial` int DEFAULT NULL,
  `id_entrega` int DEFAULT NULL,
  `status_pedido` int DEFAULT NULL,
  `valorTotal` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id_pedido`),
  KEY `id_funcionario` (`id_funcionario`),
  KEY `id_cliente` (`id_cliente`),
  KEY `id_cobranca` (`id_cobranca`),
  KEY `id_pagamento` (`id_pagamento`),
  KEY `id_filial` (`id_filial`),
  KEY `id_entrega` (`id_entrega`),
  CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`id_funcionario`) REFERENCES `funcionario` (`id_funcionario`),
  CONSTRAINT `pedido_ibfk_2` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`),
  CONSTRAINT `pedido_ibfk_3` FOREIGN KEY (`id_cobranca`) REFERENCES `cobranca` (`id_cobranca`),
  CONSTRAINT `pedido_ibfk_4` FOREIGN KEY (`id_pagamento`) REFERENCES `pagamento` (`id_pagamento`),
  CONSTRAINT `pedido_ibfk_5` FOREIGN KEY (`id_filial`) REFERENCES `filial` (`id_filial`),
  CONSTRAINT `pedido_ibfk_6` FOREIGN KEY (`id_entrega`) REFERENCES `entrega` (`id_entrega`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido`
--

LOCK TABLES `pedido` WRITE;
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perfil`
--

DROP TABLE IF EXISTS `perfil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `perfil` (
  `id_perfil` int NOT NULL AUTO_INCREMENT,
  `descricao` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_perfil`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perfil`
--

LOCK TABLES `perfil` WRITE;
/*!40000 ALTER TABLE `perfil` DISABLE KEYS */;
INSERT INTO `perfil` VALUES (1,'ADM'),(2,'Gerente'),(3,'Funcionário'),(4,'Cliente');
/*!40000 ALTER TABLE `perfil` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto`
--

DROP TABLE IF EXISTS `produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produto` (
  `id_produto` int NOT NULL AUTO_INCREMENT,
  `id_estoque` int DEFAULT NULL,
  `id_categoria` int DEFAULT NULL,
  `id_disponibilidade` int DEFAULT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `descricao` text,
  `preco` decimal(10,2) DEFAULT NULL,
  `quantidadeestoque` int DEFAULT NULL,
  `datafabricacao` date DEFAULT NULL,
  `caminhoimagem` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_produto`),
  KEY `id_estoque` (`id_estoque`),
  KEY `id_categoria` (`id_categoria`),
  KEY `id_disponibilidade` (`id_disponibilidade`),
  CONSTRAINT `produto_ibfk_1` FOREIGN KEY (`id_estoque`) REFERENCES `estoque` (`id_estoque`),
  CONSTRAINT `produto_ibfk_2` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id_categoria`),
  CONSTRAINT `produto_ibfk_3` FOREIGN KEY (`id_disponibilidade`) REFERENCES `disponibilidade` (`id_disponibilidade`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto`
--

LOCK TABLES `produto` WRITE;
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
INSERT INTO `produto` VALUES (1,1,1,1,'Produto 1','Descrição do Produto 1',49.99,100,'2023-11-01','caminho/imagem1.jpg'),(2,1,2,2,'Produto 2','Descrição do Produto 2',29.99,150,'2023-11-02','caminho/imagem2.jpg'),(3,1,3,3,'Produto 3','Descrição do Produto 3',19.99,200,'2023-11-03','caminho/imagem3.jpg'),(4,1,1,1,'Produto 4','Descrição do Produto 4',39.99,120,'2023-11-04','caminho/imagem4.jpg'),(5,2,2,2,'Produto 5','Descrição do Produto 5',34.99,180,'2023-11-05','caminho/imagem5.jpg'),(6,2,3,3,'Produto 6','Descrição do Produto 6',24.99,220,'2023-11-06','caminho/imagem6.jpg'),(7,2,1,1,'Produto 7','Descrição do Produto 7',59.99,90,'2023-11-07','caminho/imagem7.jpg'),(8,2,2,2,'Produto 8','Descrição do Produto 8',44.99,130,'2023-11-08','caminho/imagem8.jpg'),(9,3,3,3,'Produto 9','Descrição do Produto 9',54.99,170,'2023-11-09','caminho/imagem9.jpg'),(10,3,1,1,'Produto 10','Descrição do Produto 10',69.99,80,'2023-11-10','caminho/imagem10.jpg'),(11,3,2,2,'Produto 11','Descrição do Produto 11',39.99,110,'2023-11-11','caminho/imagem11.jpg'),(12,3,3,3,'Produto 12','Descrição do Produto 12',29.99,160,'2023-11-12','caminho/imagem12.jpg'),(13,4,1,1,'Produto 13','Descrição do Produto 13',49.99,70,'2023-11-13','caminho/imagem13.jpg'),(14,4,2,2,'Produto 14','Descrição do Produto 14',34.99,100,'2023-11-14','caminho/imagem14.jpg'),(15,4,3,3,'Produto 15','Descrição do Produto 15',59.99,140,'2023-11-15','caminho/imagem15.jpg'),(16,4,1,1,'Produto 16','Descrição do Produto 16',39.99,60,'2023-11-16','caminho/imagem16.jpg'),(17,5,2,2,'Produto 17','Descrição do Produto 17',29.99,90,'2023-11-17','caminho/imagem17.jpg'),(18,5,3,3,'Produto 18','Descrição do Produto 18',44.99,120,'2023-11-18','caminho/imagem18.jpg'),(19,5,1,1,'Produto 19','Descrição do Produto 19',59.99,50,'2023-11-19','caminho/imagem19.jpg'),(20,5,2,2,'Produto 20','Descrição do Produto 20',54.99,80,'2023-11-20','caminho/imagem20.jpg');
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reuse`
--

DROP TABLE IF EXISTS `reuse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reuse` (
  `cnpj` char(14) NOT NULL,
  `endereco` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`cnpj`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reuse`
--

LOCK TABLES `reuse` WRITE;
/*!40000 ALTER TABLE `reuse` DISABLE KEYS */;
/*!40000 ALTER TABLE `reuse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `telefone`
--

DROP TABLE IF EXISTS `telefone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `telefone` (
  `id_telefone` int NOT NULL AUTO_INCREMENT,
  `id_associado` int DEFAULT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_telefone`),
  KEY `id_associado` (`id_associado`),
  CONSTRAINT `telefone_ibfk_1` FOREIGN KEY (`id_associado`) REFERENCES `associado` (`id_associado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telefone`
--

LOCK TABLES `telefone` WRITE;
/*!40000 ALTER TABLE `telefone` DISABLE KEYS */;
/*!40000 ALTER TABLE `telefone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_cobranca`
--

DROP TABLE IF EXISTS `tipo_cobranca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_cobranca` (
  `id_tipoCobranca` int NOT NULL AUTO_INCREMENT,
  `tipo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_tipoCobranca`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_cobranca`
--

LOCK TABLES `tipo_cobranca` WRITE;
/*!40000 ALTER TABLE `tipo_cobranca` DISABLE KEYS */;
INSERT INTO `tipo_cobranca` VALUES (1,'Boleto Bancário'),(2,'Cartão de Crédito'),(3,'Transferência Bancária'),(4,'Dinheiro'),(5,'Cheque'),(6,'pix');
/*!40000 ALTER TABLE `tipo_cobranca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `id_perfil` int DEFAULT NULL,
  `nome_usuario` varchar(255) DEFAULT NULL,
  `email_usuario` varchar(255) DEFAULT NULL,
  `senha_usuario` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_usuario`),
  KEY `id_perfil` (`id_perfil`),
  CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`id_perfil`) REFERENCES `perfil` (`id_perfil`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,2,'JohnDoe','john.doe@example.com','senha123'),(2,3,'AliceSmith','alice.smith@example.com','senha456'),(3,4,'MichaelJohnson','michael.johnson@example.com','senha789'),(4,2,'EmilyBrown','emily.brown@example.com','senha101112'),(5,3,'WilliamWilson','william.wilson@example.com','senha131415'),(6,4,'OliviaLee','olivia.lee@example.com','senha161718'),(7,2,'JamesEvans','james.evans@example.com','senha192021'),(8,3,'SophiaTaylor','sophia.taylor@example.com','senha222324'),(9,4,'BenjaminHarris','benjamin.harris@example.com','senha252627'),(10,2,'EmmaClark','emma.clark@example.com','senha282930'),(11,3,'AlexanderLewis','alexander.lewis@example.com','senha313233'),(12,4,'MiaHall','mia.hall@example.com','senha343536'),(13,2,'EthanScott','ethan.scott@example.com','senha373839'),(14,3,'AvaGreen','ava.green@example.com','senha404142'),(15,4,'DanielAdams','daniel.adams@example.com','senha434445'),(16,2,'SophieMitchell','sophie.mitchell@example.com','senha464748'),(17,3,'MatthewYoung','matthew.young@example.com','senha495051'),(18,4,'ChloeWalker','chloe.walker@example.com','senha525354'),(19,2,'LiamHall','liam.hall@example.com','senha555657'),(20,3,'AmeliaBaker','amelia.baker@example.com','senha585960');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-08 19:56:35
