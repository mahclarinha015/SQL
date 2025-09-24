-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 24/09/2025 às 19:06
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
-- Banco de dados: `techsolutio`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `departamento`
--

CREATE TABLE `departamento` (
  `id_departamento` int(11) NOT NULL,
  `NomeDepartameno` varchar(70) DEFAULT NULL,
  `Localizacao` varchar(100) DEFAULT NULL,
  `Equipes` varchar(100) DEFAULT NULL,
  `Treinamentos` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `departamento`
--

INSERT INTO `departamento` (`id_departamento`, `NomeDepartameno`, `Localizacao`, `Equipes`, `Treinamentos`) VALUES
(1, 'Departamento 1', 'São Paulo', 'Equipes de Chefs', 'Treinamentos para Chefe'),
(2, 'Departamento 2', 'Campinas', 'Equipes de Assistente', 'Treinamento para Assistentes'),
(3, 'Departamento 3', 'Sorocaba', 'Equipes de Gerentes', 'Treinamento para Gerentes'),
(4, 'Departamento 4', 'Votorantim', 'Equipes de Cordenador', 'Treinamento para Cordenador'),
(5, 'Departamento 5', 'Piedade', 'Equipes de Cozinheiro', 'Treinamento para Cozinheiro');

-- --------------------------------------------------------

--
-- Estrutura para tabela `funcionario`
--

CREATE TABLE `funcionario` (
  `id_funcionario` int(11) NOT NULL,
  `id_departamento` int(11) DEFAULT NULL,
  `Nome` varchar(70) DEFAULT NULL,
  `CPF` int(11) DEFAULT NULL,
  `Cargo` varchar(100) DEFAULT NULL,
  `DataAdimissao` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `funcionario`
--

INSERT INTO `funcionario` (`id_funcionario`, `id_departamento`, `Nome`, `CPF`, `Cargo`, `DataAdimissao`) VALUES
(1, 1, 'Roberto', 2147483647, 'Chef', '2007/04/02'),
(2, 2, 'Juliano', 2147483647, 'Assistente', '2016/11/24'),
(3, 3, 'Gabriela', 2147483647, 'Gerente', '2018/10/15'),
(4, 4, 'Alexandre', 2147483647, 'Cordenador', '2021/07/23'),
(5, 5, 'Rodrigo', 2147483647, 'Cozinheiro', '2023/03/12');

-- --------------------------------------------------------

--
-- Estrutura para tabela `treinamento`
--

CREATE TABLE `treinamento` (
  `id_treinamento` int(11) NOT NULL,
  `id_funcionario` int(11) DEFAULT NULL,
  `id_departamento` int(11) DEFAULT NULL,
  `Titulo` varchar(70) DEFAULT NULL,
  `DataTreinamento` date DEFAULT NULL,
  `CargaHoraria` int(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `treinamento`
--

INSERT INTO `treinamento` (`id_treinamento`, `id_funcionario`, `id_departamento`, `Titulo`, `DataTreinamento`, `CargaHoraria`) VALUES
(1, 1, 1, 'Chefs', '2025-02-03', 12),
(2, 2, 2, 'Assistentes', '2025-06-04', 14),
(3, 3, 3, 'Gerentes', '2025-05-08', 17),
(4, 4, 4, 'Cordenadores', '2025-04-09', 13),
(5, 5, 5, 'Cozinheiros', '2025-03-10', 12);

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `departamento`
--
ALTER TABLE `departamento`
  ADD PRIMARY KEY (`id_departamento`);

--
-- Índices de tabela `funcionario`
--
ALTER TABLE `funcionario`
  ADD PRIMARY KEY (`id_funcionario`),
  ADD KEY `id_departamento` (`id_departamento`);

--
-- Índices de tabela `treinamento`
--
ALTER TABLE `treinamento`
  ADD PRIMARY KEY (`id_treinamento`),
  ADD KEY `id_funcionario` (`id_funcionario`),
  ADD KEY `id_departamento` (`id_departamento`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `departamento`
--
ALTER TABLE `departamento`
  MODIFY `id_departamento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `funcionario`
--
ALTER TABLE `funcionario`
  MODIFY `id_funcionario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `treinamento`
--
ALTER TABLE `treinamento`
  MODIFY `id_treinamento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `funcionario`
--
ALTER TABLE `funcionario`
  ADD CONSTRAINT `funcionario_ibfk_1` FOREIGN KEY (`id_departamento`) REFERENCES `departamento` (`id_departamento`);

--
-- Restrições para tabelas `treinamento`
--
ALTER TABLE `treinamento`
  ADD CONSTRAINT `treinamento_ibfk_1` FOREIGN KEY (`id_funcionario`) REFERENCES `funcionario` (`id_funcionario`),
  ADD CONSTRAINT `treinamento_ibfk_2` FOREIGN KEY (`id_departamento`) REFERENCES `departamento` (`id_departamento`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
