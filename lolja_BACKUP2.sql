-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           10.4.32-MariaDB - mariadb.org binary distribution
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              12.21.0.7344
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Copiando estrutura do banco de dados para lolja
CREATE DATABASE IF NOT EXISTS `lolja` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `lolja`;

-- Copiando estrutura para tabela lolja.categoria
CREATE TABLE IF NOT EXISTS `categoria` (
  `Id_categoria` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`Id_categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela lolja.categoria: ~7 rows (aproximadamente)
INSERT INTO `categoria` (`Id_categoria`, `nome`) VALUES
	(1, 'Masculino'),
	(2, 'Feminino'),
	(3, 'Unisex'),
	(4, 'Infantil'),
	(5, 'Verão'),
	(6, 'Inverno'),
	(7, 'Style');

-- Copiando estrutura para tabela lolja.estoque
CREATE TABLE IF NOT EXISTS `estoque` (
  `id_estoque` int(11) NOT NULL AUTO_INCREMENT,
  `id_produtos` int(11) NOT NULL,
  `quantidade` int(100) NOT NULL,
  PRIMARY KEY (`id_estoque`),
  KEY `id_produtos` (`id_produtos`),
  CONSTRAINT `fk_estoque_produtos` FOREIGN KEY (`id_produtos`) REFERENCES `produtos` (`id_produtos`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela lolja.estoque: ~9 rows (aproximadamente)
INSERT INTO `estoque` (`id_estoque`, `id_produtos`, `quantidade`) VALUES
	(1, 1, 15),
	(2, 5, 30),
	(3, 8, 70),
	(4, 2, 49),
	(5, 9, 12),
	(6, 6, 27),
	(7, 7, 34),
	(8, 3, 22),
	(9, 4, 55);

-- Copiando estrutura para tabela lolja.produtos
CREATE TABLE IF NOT EXISTS `produtos` (
  `id_produtos` int(11) NOT NULL,
  `tipo` varchar(50) NOT NULL DEFAULT '',
  `preco` decimal(65,6) NOT NULL DEFAULT 0.000000,
  `Id_categoria` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_produtos`),
  KEY `Id_categoria` (`Id_categoria`),
  CONSTRAINT `FK_produtos_categoria` FOREIGN KEY (`Id_categoria`) REFERENCES `categoria` (`Id_categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela lolja.produtos: ~9 rows (aproximadamente)
INSERT INTO `produtos` (`id_produtos`, `tipo`, `preco`, `Id_categoria`) VALUES
	(1, 'Camiseta Neutra Azul', 70.000000, 1),
	(2, 'Vestido', 98.000000, 2),
	(3, 'Blusa corta vento', 100.000000, 6),
	(4, 'Look Completo', 180.000000, 7),
	(5, 'Camiseta Tunder Cats', 80.000000, 1),
	(6, 'Kit infantil de Homem Aranha', 40.000000, 5),
	(7, 'Maiô Neutro ', 60.000000, 5),
	(8, 'Regata Verão', 70.000000, 1),
	(9, 'Kit verão completo', 200.000000, 3);

-- Copiando estrutura para tabela lolja.vendas
CREATE TABLE IF NOT EXISTS `vendas` (
  `id_venda` int(11) NOT NULL AUTO_INCREMENT,
  `id_produto` int(11) NOT NULL,
  `data_venda` datetime NOT NULL DEFAULT current_timestamp(),
  `quantidade_vendida` int(11) NOT NULL,
  PRIMARY KEY (`id_venda`),
  KEY `id_produto` (`id_produto`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela lolja.vendas: ~9 rows (aproximadamente)
INSERT INTO `vendas` (`id_venda`, `id_produto`, `data_venda`, `quantidade_vendida`) VALUES
	(1, 1, '2026-10-30 19:06:41', 50),
	(2, 5, '2026-10-30 19:06:41', 14),
	(3, 6, '2026-10-30 19:06:41', 23),
	(4, 3, '2026-10-30 19:06:41', 89),
	(5, 2, '2026-10-30 19:06:41', 38),
	(6, 7, '2026-10-30 19:06:41', 60),
	(7, 8, '2026-10-30 19:06:41', 68),
	(8, 4, '2026-10-30 19:06:41', 100),
	(9, 9, '2026-10-30 19:06:41', 95);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
