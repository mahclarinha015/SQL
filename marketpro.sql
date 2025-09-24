-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 24/09/2025 às 18:46
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `marketpro`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `campanha`
--

CREATE TABLE `campanha` (
  `id_campanha` int(11) NOT NULL,
  `nome_campanha` varchar(100) DEFAULT NULL,
  `data_inicio` date DEFAULT NULL,
  `data_fim` date DEFAULT NULL,
  `orcamento` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `campanha`
--

INSERT INTO `campanha` (`id_campanha`, `nome_campanha`, `data_inicio`, `data_fim`, `orcamento`) VALUES
(1, 'FORTINITE, o poder do despertar', '2024-09-23', '2025-09-23', 2000),
(2, 'TANG', '2023-10-23', '2025-10-23', 5000),
(3, 'SONIC THE HEDGEHOG', '2022-12-25', '2025-12-25', 10000),
(4, 'YOUTUBE', '2022-09-23', '2025-09-23', 5000),
(5, 'GUCCI', '2021-09-23', '2025-09-23', 5000);

-- --------------------------------------------------------

--
-- Estrutura para tabela `cliente`
--

CREATE TABLE `cliente` (
  `id_cliente` int(11) NOT NULL,
  `nome_cliente` varchar(100) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `segmento` varchar(100) DEFAULT NULL,
  `midia_escolhida` varchar(100) DEFAULT NULL,
  `id_midia` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `cliente`
--

INSERT INTO `cliente` (`id_cliente`, `nome_cliente`, `email`, `segmento`, `midia_escolhida`, `id_midia`) VALUES
(1, 'Maria da Silva', 'Maria@gmail.com', 'Mecanica', 'Propaganda de TV', 1),
(2, 'Gabriel Martins', 'Gabriel@gmail.com', 'TI', 'Musicas', 2),
(3, 'Gustavo Pereira', 'Gustavo@gmail.com', 'QA', 'Anuncios em jogos', 3),
(4, 'Brenda Lisboa', 'Brenda@gmail.com', 'Mecanica', 'Outdors', 4),
(5, 'Ana Bertoleza', 'Maria@gmail.com', 'Mecanica', 'Propaganda Streaming', 5);

-- --------------------------------------------------------

--
-- Estrutura para tabela `midia`
--

CREATE TABLE `midia` (
  `id_midia` int(11) NOT NULL,
  `tipo_midia` varchar(100) DEFAULT NULL,
  `custo_unitario` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `midia`
--

INSERT INTO `midia` (`id_midia`, `tipo_midia`, `custo_unitario`) VALUES
(1, 'Propagandas na TV', 999.99),
(2, 'Musicas', 499.99),
(3, 'Anuncios em jogos', 699.99),
(4, 'Outdors', 899.99),
(5, 'Propaganda Streaming', 1299.99);

-- --------------------------------------------------------

--
-- Estrutura para tabela `relacao`
--

CREATE TABLE `relacao` (
  `id_relacao` int(11) NOT NULL,
  `id_midia` int(11) DEFAULT NULL,
  `id_campanha` int(11) DEFAULT NULL,
  `nome_relacao` varchar(100) DEFAULT NULL,
  `descricao_relacao` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `relacao`
--

INSERT INTO `relacao` (`id_relacao`, `id_midia`, `id_campanha`, `nome_relacao`, `descricao_relacao`) VALUES
(1, 1, 1, 'parceria 1', 'Pagou propagandas na TV'),
(2, 2, 2, 'parceria 2', 'Pagou anúncios em músicas'),
(3, 3, 3, 'parceria 3', 'Pagou anuncios em jogos'),
(4, 4, 4, 'parceria 4', 'Pagou outdors para propaganda'),
(5, 5, 5, 'parceria 5', 'Pagou propaganda em Streaming');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `campanha`
--
ALTER TABLE `campanha`
  ADD PRIMARY KEY (`id_campanha`);

--
-- Índices de tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id_cliente`),
  ADD KEY `id_midia` (`id_midia`);

--
-- Índices de tabela `midia`
--
ALTER TABLE `midia`
  ADD PRIMARY KEY (`id_midia`);

--
-- Índices de tabela `relacao`
--
ALTER TABLE `relacao`
  ADD PRIMARY KEY (`id_relacao`),
  ADD KEY `id_midia` (`id_midia`),
  ADD KEY `id_campanha` (`id_campanha`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `campanha`
--
ALTER TABLE `campanha`
  MODIFY `id_campanha` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `midia`
--
ALTER TABLE `midia`
  MODIFY `id_midia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `relacao`
--
ALTER TABLE `relacao`
  MODIFY `id_relacao` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `cliente_ibfk_1` FOREIGN KEY (`id_midia`) REFERENCES `midia` (`id_midia`);

--
-- Restrições para tabelas `relacao`
--
ALTER TABLE `relacao`
  ADD CONSTRAINT `relacao_ibfk_1` FOREIGN KEY (`id_midia`) REFERENCES `midia` (`id_midia`),
  ADD CONSTRAINT `relacao_ibfk_2` FOREIGN KEY (`id_campanha`) REFERENCES `campanha` (`id_campanha`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
