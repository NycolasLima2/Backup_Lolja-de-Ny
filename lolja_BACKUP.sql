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
  PRIMARY KEY (`Id_categoria`),
  CONSTRAINT `FK_categoria_produtos` FOREIGN KEY (`Id_categoria`) REFERENCES `produtos` (`Id_categoria`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela lolja.categoria: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela lolja.estoque
CREATE TABLE IF NOT EXISTS `estoque` (
  `id_estoque` int(11) NOT NULL,
  `id_produtos` int(11) NOT NULL,
  `quantidade` int(100) NOT NULL,
  PRIMARY KEY (`id_estoque`),
  KEY `id_produtos` (`id_produtos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela lolja.estoque: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela lolja.produtos
CREATE TABLE IF NOT EXISTS `produtos` (
  `id_produtos` int(11) NOT NULL,
  `tipo` varchar(50) NOT NULL DEFAULT '',
  `preco` decimal(65,6) NOT NULL DEFAULT 0.000000,
  `Id_categoria` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_produtos`),
  KEY `Id_categoria` (`Id_categoria`),
  CONSTRAINT `fk_id_produtos` FOREIGN KEY (`id_produtos`) REFERENCES `estoque` (`id_produtos`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela lolja.produtos: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela lolja.vendas
CREATE TABLE IF NOT EXISTS `vendas` (
  `id_venda` int(11) NOT NULL,
  `id_produto` int(11) NOT NULL,
  `data_venda` datetime NOT NULL DEFAULT current_timestamp(),
  `quantidade_vendida` int(11) NOT NULL,
  PRIMARY KEY (`id_venda`),
  KEY `id_produto` (`id_produto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela lolja.vendas: ~0 rows (aproximadamente)

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
