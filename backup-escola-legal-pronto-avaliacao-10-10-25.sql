-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 10-Out-2025 às 13:40
-- Versão do servidor: 10.4.32-MariaDB
-- versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `escolalegal`
--
CREATE DATABASE IF NOT EXISTS `escolalegal` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `escolalegal`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `alunos`
--

CREATE TABLE `alunos` (
  `id` tinyint(4) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `dataDeNascimento` date NOT NULL,
  `primeiraNota` decimal(4,2) NOT NULL,
  `segundaNota` decimal(4,2) NOT NULL,
  `cursos_id` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `alunos`
--

INSERT INTO `alunos` (`id`, `nome`, `dataDeNascimento`, `primeiraNota`, `segundaNota`, `cursos_id`) VALUES
(3, 'Maria Silva', '1982-03-15', 8.00, 4.00, 4),
(4, 'João Santos', '1990-07-05', 7.00, 9.00, 5),
(6, 'Pedro Oliveira', '2001-01-10', 6.00, 8.45, 2),
(7, 'Sofia Pereira', '1988-04-30', 10.00, 7.80, 1),
(8, 'Luis Mendes', '1967-08-12', 5.05, 6.95, 1),
(9, 'Carolina Almeida', '1995-10-25', 8.00, 9.00, 2),
(10, 'Miguel Ferreira', '1984-12-07', 9.00, 8.20, 3),
(11, 'Ines Costa', '2000-06-18', 5.00, 8.00, 4);

-- --------------------------------------------------------

--
-- Estrutura da tabela `cursos`
--

CREATE TABLE `cursos` (
  `id` tinyint(4) NOT NULL,
  `titulo` varchar(30) NOT NULL,
  `cargaHoraria` tinyint(4) NOT NULL,
  `professores_id` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `cursos`
--

INSERT INTO `cursos` (`id`, `titulo`, `cargaHoraria`, `professores_id`) VALUES
(1, 'Front-End', 40, 5),
(2, 'Back-End', 80, 4),
(3, 'UX/UI Design', 30, 3),
(4, 'Adobe XD', 15, 2),
(5, 'Redes de Computadores', 100, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `disciplinas`
--

CREATE TABLE `disciplinas` (
  `id` int(11) NOT NULL,
  `disciplina` varchar(40) NOT NULL,
  `sigla` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `matriculas`
--

CREATE TABLE `matriculas` (
  `id_professor` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  `id_aluno` int(11) NOT NULL,
  `id_curso` int(11) NOT NULL,
  `id_disciplina` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `professores`
--

CREATE TABLE `professores` (
  `id` tinyint(4) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `areaAtuacao` enum('design','desenvolvimento','infra') NOT NULL,
  `cursos_id` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `professores`
--

INSERT INTO `professores` (`id`, `nome`, `areaAtuacao`, `cursos_id`) VALUES
(1, 'Jon Oliva', 'infra', 5),
(2, 'Lemmy Kilmister', 'design', 4),
(3, 'Neil Peart', 'design', 3),
(4, 'Ozzy Osbourne', 'desenvolvimento', 2),
(5, 'David Gilmour', 'desenvolvimento', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `role` varchar(15) NOT NULL,
  `active` bit(1) DEFAULT b'1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `roles`
--

INSERT INTO `roles` (`id`, `role`, `active`) VALUES
(1, 'SUPER-ADMIN', b'1'),
(2, 'ADMIN', b'1'),
(3, 'SUPERVISOR', b'1'),
(4, 'ATENTENDE', b'1'),
(5, 'MEDICO', b'1'),
(6, 'CLIENT', b'1');

-- --------------------------------------------------------

--
-- Estrutura da tabela `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `login` varchar(60) NOT NULL,
  `password` varchar(250) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `active` bit(1) DEFAULT b'1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `users`
--

INSERT INTO `users` (`id`, `login`, `password`, `name`, `active`) VALUES
(1, 'teste@teste', '123456', 'teste inclusão via sql', b'1'),
(2, 'teste1@teste', '123456', 'teste inclusão via sql', b'1'),
(3, 'teste2@teste', '123456', 'teste inclusão via sql', b'1'),
(4, 'teste3@teste', '123456', 'teste inclusão via sql', b'1'),
(5, 'teste4@teste', '123456', 'teste inclusão via sql', b'1'),
(6, 'teste5@teste', '123456', 'teste inclusão via sql', b'1'),
(7, 'teste6@teste', '123456', 'teste inclusão via sql', b'1'),
(8, 'teste7@teste', '123456', 'teste inclusão via sql', b'1'),
(9, 'teste8@teste', '123456', 'teste inclusão via sql', b'1'),
(10, 'teste9@teste', '123456', 'teste inclusão via sql', b'1');

-- --------------------------------------------------------

--
-- Estrutura da tabela `users_roles`
--

CREATE TABLE `users_roles` (
  `idrole` int(11) NOT NULL,
  `iduser` int(11) NOT NULL,
  `active` bit(1) DEFAULT b'1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `users_roles`
--

INSERT INTO `users_roles` (`idrole`, `iduser`, `active`) VALUES
(1, 1, b'1'),
(2, 2, b'1'),
(3, 3, b'1'),
(4, 4, b'1'),
(4, 5, b'1'),
(5, 6, b'1'),
(5, 7, b'1'),
(5, 8, b'1'),
(5, 9, b'1');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `alunos`
--
ALTER TABLE `alunos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_alunos_cursos` (`cursos_id`);

--
-- Índices para tabela `cursos`
--
ALTER TABLE `cursos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_cursos_professores1` (`professores_id`);

--
-- Índices para tabela `disciplinas`
--
ALTER TABLE `disciplinas`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `matriculas`
--
ALTER TABLE `matriculas`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `professores`
--
ALTER TABLE `professores`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `role` (`role`);

--
-- Índices para tabela `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `login` (`login`);

--
-- Índices para tabela `users_roles`
--
ALTER TABLE `users_roles`
  ADD PRIMARY KEY (`idrole`,`iduser`),
  ADD KEY `fk_users_role_iduser` (`iduser`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `alunos`
--
ALTER TABLE `alunos`
  MODIFY `id` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de tabela `cursos`
--
ALTER TABLE `cursos`
  MODIFY `id` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `disciplinas`
--
ALTER TABLE `disciplinas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `matriculas`
--
ALTER TABLE `matriculas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `professores`
--
ALTER TABLE `professores`
  MODIFY `id` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `users_roles`
--
ALTER TABLE `users_roles`
  ADD CONSTRAINT `fk_users_role_idrole` FOREIGN KEY (`idrole`) REFERENCES `roles` (`id`),
  ADD CONSTRAINT `fk_users_role_iduser` FOREIGN KEY (`iduser`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
