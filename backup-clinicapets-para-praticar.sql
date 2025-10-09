-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 08-Out-2025 às 00:21
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
-- Banco de dados: `clinicapets`
--
CREATE DATABASE IF NOT EXISTS `clinicapets` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `clinicapets`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `animais`
--

CREATE TABLE `animais` (
  `id` int(11) NOT NULL,
  `animal` varchar(30) NOT NULL,
  `idade` int(11) NOT NULL DEFAULT 0,
  `id_dono` int(11) NOT NULL,
  `id_raca` int(11) NOT NULL,
  `id_especie` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `animais`
--

INSERT INTO `animais` (`id`, `animal`, `idade`, `id_dono`, `id_raca`, `id_especie`) VALUES
(1, 'lukinha', 4, 1, 1, 1),
(2, 'paquita', 2, 2, 2, 2),
(3, 'xuxa', 3, 3, 3, 3),
(4, 'pipoca', 1, 4, 4, 4),
(5, 'latinha', 4, 5, 1, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `atendimentos`
--

CREATE TABLE `atendimentos` (
  `id` int(11) NOT NULL,
  `data_atendimento` datetime NOT NULL,
  `id_animal` int(11) NOT NULL,
  `id_veterinario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `atendimentos`
--

INSERT INTO `atendimentos` (`id`, `data_atendimento`, `id_animal`, `id_veterinario`) VALUES
(1, '2025-10-07 19:00:00', 1, 1),
(2, '2025-10-07 19:00:00', 2, 1),
(3, '2025-10-07 17:00:00', 2, 2),
(4, '2025-10-07 18:00:00', 3, 3),
(5, '2025-10-07 12:00:00', 4, 2),
(6, '2025-10-07 11:00:00', 5, 3),
(7, '2025-10-07 10:00:00', 2, 1),
(8, '2025-10-07 13:00:00', 3, 3),
(9, '2025-10-07 14:00:00', 4, 4),
(10, '2025-10-07 15:00:00', 5, 4);

-- --------------------------------------------------------

--
-- Estrutura da tabela `atendimentos_tratamentos`
--

CREATE TABLE `atendimentos_tratamentos` (
  `id` int(11) NOT NULL,
  `dose` varchar(10) NOT NULL DEFAULT '1',
  `inicio` varchar(20) DEFAULT NULL,
  `fim` varchar(20) DEFAULT NULL,
  `id_remedio` int(11) NOT NULL,
  `id_atendimento` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `atendimentos_tratamentos`
--

INSERT INTO `atendimentos_tratamentos` (`id`, `dose`, `inicio`, `fim`, `id_remedio`, `id_atendimento`) VALUES
(1, '200mlx4dd', '07/10/2025', '15/10/2025', 1, 1),
(2, '200mlx4dd', '07/10/2025', '15/10/2025', 3, 1),
(3, '200mlx4dd', '07/10/2025', '15/10/2025', 2, 2),
(4, '200mlx4dd', '07/10/2025', '15/10/2025', 5, 2),
(5, '200mlx4dd', '07/10/2025', '15/10/2025', 1, 3),
(6, '200mlx4dd', '07/10/2025', '15/10/2025', 2, 3),
(7, '200mlx4dd', '07/10/2025', '15/10/2025', 3, 3),
(8, '200mlx4dd', '07/10/2025', '15/10/2025', 1, 4),
(9, '200mlx4dd', '07/10/2025', '15/10/2025', 4, 4),
(10, '200mlx4dd', '07/10/2025', '15/10/2025', 5, 4),
(11, '200mlx4dd', '07/10/2025', '15/10/2025', 3, 4),
(12, '200mlx4dd', '07/10/2025', '15/10/2025', 1, 5),
(13, '200mlx4dd', '07/10/2025', '15/10/2025', 3, 5),
(14, '200mlx4dd', '07/10/2025', '15/10/2025', 2, 6),
(15, '200mlx4dd', '07/10/2025', '15/10/2025', 5, 6),
(16, '200mlx4dd', '07/10/2025', '15/10/2025', 1, 7),
(17, '200mlx4dd', '07/10/2025', '15/10/2025', 2, 7),
(18, '200mlx4dd', '07/10/2025', '15/10/2025', 3, 7),
(19, '200mlx4dd', '07/10/2025', '15/10/2025', 1, 8),
(20, '200mlx4dd', '07/10/2025', '15/10/2025', 4, 8),
(21, '200mlx4dd', '07/10/2025', '15/10/2025', 5, 8),
(22, '200mlx4dd', '07/10/2025', '15/10/2025', 1, 9),
(23, '200mlx4dd', '07/10/2025', '15/10/2025', 3, 9),
(24, '200mlx4dd', '07/10/2025', '15/10/2025', 2, 9),
(25, '200mlx4dd', '07/10/2025', '15/10/2025', 5, 9),
(26, '200mlx4dd', '07/10/2025', '15/10/2025', 1, 10),
(27, '200mlx4dd', '07/10/2025', '15/10/2025', 2, 10),
(28, '200mlx4dd', '07/10/2025', '15/10/2025', 3, 10),
(29, '200mlx4dd', '07/10/2025', '15/10/2025', 2, 1),
(30, '200mlx4dd', '07/10/2025', '15/10/2025', 4, 2),
(31, '200mlx4dd', '07/10/2025', '15/10/2025', 5, 3);

-- --------------------------------------------------------

--
-- Estrutura da tabela `donos`
--

CREATE TABLE `donos` (
  `id` int(11) NOT NULL,
  `nome` varchar(60) NOT NULL,
  `telefone` varchar(15) DEFAULT NULL,
  `email` varchar(80) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `donos`
--

INSERT INTO `donos` (`id`, `nome`, `telefone`, `email`) VALUES
(1, 'José Marcos Silva', '(16) 9.9999-111', 'josemsilva@teste.com'),
(2, 'Marcos Rodrigues Oliveira', '(16) 9.9998-111', 'marcosroliveira@teste.com'),
(3, 'Maria Aparecida Silva', '(16) 9.9199-111', 'mariaapsilvateste.com'),
(4, 'Mario Marcos Alencar', '(16) 9.9999-311', 'mariamarcosalencar@teste.com'),
(5, 'Fatima Silva Jaguar', '(16) 9.9992-222', 'fatimasilvajaguar@teste.com');

-- --------------------------------------------------------

--
-- Estrutura da tabela `especialidades`
--

CREATE TABLE `especialidades` (
  `id` int(11) NOT NULL,
  `especilidade` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `especialidades`
--

INSERT INTO `especialidades` (`id`, `especilidade`) VALUES
(1, 'cardiologia'),
(2, 'dermatologia'),
(3, 'oncologia'),
(4, 'oftalmologia'),
(5, 'cirúrgicas'),
(6, 'anestesiologia');

-- --------------------------------------------------------

--
-- Estrutura da tabela `especies`
--

CREATE TABLE `especies` (
  `id` int(11) NOT NULL,
  `especie` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `especies`
--

INSERT INTO `especies` (`id`, `especie`) VALUES
(1, 'chiuao'),
(2, 'ciames'),
(3, 'caranguegeira'),
(4, 'papagaio'),
(5, 'ratão do Rio');

-- --------------------------------------------------------

--
-- Estrutura da tabela `laboratorios`
--

CREATE TABLE `laboratorios` (
  `id` int(11) NOT NULL,
  `laboratorio` varchar(60) NOT NULL,
  `telefone` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `laboratorios`
--

INSERT INTO `laboratorios` (`id`, `laboratorio`, `telefone`) VALUES
(1, 'EMS', '(11) 3578-5885'),
(2, 'Hypera Pharma', '(31) 3578-3185'),
(3, 'Eurofarma', '(49) 3578-5849'),
(4, 'Aché', '(11) 3278-2285'),
(5, 'Cimed', '(21) 3378-1455'),
(6, 'Libbs', '(21) 3578-4881');

-- --------------------------------------------------------

--
-- Estrutura da tabela `racas`
--

CREATE TABLE `racas` (
  `id` int(11) NOT NULL,
  `raca` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `racas`
--

INSERT INTO `racas` (`id`, `raca`) VALUES
(1, 'cães'),
(2, 'gatos'),
(3, 'aranhas'),
(4, 'aves'),
(5, 'ratos');

-- --------------------------------------------------------

--
-- Estrutura da tabela `remedios`
--

CREATE TABLE `remedios` (
  `id` int(11) NOT NULL,
  `remedio` varchar(80) NOT NULL,
  `id_laboratorio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `remedios`
--

INSERT INTO `remedios` (`id`, `remedio`, `id_laboratorio`) VALUES
(1, 'Capstar', 1),
(2, 'Bravecto', 2),
(3, 'Drontal', 3),
(4, 'Chemital', 4),
(5, 'Doxiciclina', 1),
(6, 'Firocoxib', 5),
(7, 'Ampicilina', 6);

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

-- --------------------------------------------------------

--
-- Estrutura da tabela `veterinarios`
--

CREATE TABLE `veterinarios` (
  `id` int(11) NOT NULL,
  `nome` varchar(60) NOT NULL,
  `telefone` varchar(15) DEFAULT NULL,
  `email` varchar(80) DEFAULT NULL,
  `crm` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `veterinarios`
--

INSERT INTO `veterinarios` (`id`, `nome`, `telefone`, `email`, `crm`) VALUES
(1, 'Miguel Junior', '(14) 9.9999-145', 'migueljunior@teste.com', '794949'),
(2, 'Juliana Maria', '(14) 9.9914-198', 'julianamaria8890@teste.com', '163466'),
(3, 'Fatima Rosalina', '(14) 9.9998-178', 'fatimaroalinhas863@teste.com', '47844'),
(4, 'João Plasmingo', '(14) 9.9933-178', 'joaoplasmingo32@teste.com', '1476521'),
(5, 'Murilo Rosa', '(14) 9.9949-145', 'murilorosadr@teste.com', '14747885');

-- --------------------------------------------------------

--
-- Estrutura da tabela `veterinarios_especialidades`
--

CREATE TABLE `veterinarios_especialidades` (
  `id_veterinario` int(11) NOT NULL,
  `id_especialidade` int(11) NOT NULL,
  `principal` bit(1) NOT NULL DEFAULT b'1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `veterinarios_especialidades`
--

INSERT INTO `veterinarios_especialidades` (`id_veterinario`, `id_especialidade`, `principal`) VALUES
(1, 1, b'1'),
(1, 2, b'0'),
(1, 3, b'0'),
(2, 1, b'1'),
(3, 1, b'1'),
(3, 4, b'0'),
(4, 1, b'1'),
(4, 4, b'0'),
(5, 1, b'0'),
(5, 2, b'1');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `animais`
--
ALTER TABLE `animais`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_animais_dono` (`id_dono`),
  ADD KEY `fk_animais_raca` (`id_raca`),
  ADD KEY `fk_animais_especies` (`id_especie`);

--
-- Índices para tabela `atendimentos`
--
ALTER TABLE `atendimentos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_atendimentos_animal` (`id_animal`),
  ADD KEY `fk_atendimentos_veterinario` (`id_veterinario`);

--
-- Índices para tabela `atendimentos_tratamentos`
--
ALTER TABLE `atendimentos_tratamentos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_atendimentos_trata_remedio_id_remedio` (`id_remedio`),
  ADD KEY `fk_atendimentos_trata_atendi_id_atendimento` (`id_atendimento`);

--
-- Índices para tabela `donos`
--
ALTER TABLE `donos`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `especialidades`
--
ALTER TABLE `especialidades`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `especies`
--
ALTER TABLE `especies`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `laboratorios`
--
ALTER TABLE `laboratorios`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `racas`
--
ALTER TABLE `racas`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `remedios`
--
ALTER TABLE `remedios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_remedios_laboratorios_id_laboratorio` (`id_laboratorio`);

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
-- Índices para tabela `veterinarios`
--
ALTER TABLE `veterinarios`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `veterinarios_especialidades`
--
ALTER TABLE `veterinarios_especialidades`
  ADD PRIMARY KEY (`id_veterinario`,`id_especialidade`),
  ADD KEY `fk_veterinarios_especialidades_id_especialidade` (`id_especialidade`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `animais`
--
ALTER TABLE `animais`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `atendimentos`
--
ALTER TABLE `atendimentos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `atendimentos_tratamentos`
--
ALTER TABLE `atendimentos_tratamentos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT de tabela `donos`
--
ALTER TABLE `donos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `especialidades`
--
ALTER TABLE `especialidades`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `especies`
--
ALTER TABLE `especies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `laboratorios`
--
ALTER TABLE `laboratorios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `racas`
--
ALTER TABLE `racas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `remedios`
--
ALTER TABLE `remedios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

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
-- AUTO_INCREMENT de tabela `veterinarios`
--
ALTER TABLE `veterinarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `animais`
--
ALTER TABLE `animais`
  ADD CONSTRAINT `fk_animais_dono` FOREIGN KEY (`id_dono`) REFERENCES `donos` (`id`),
  ADD CONSTRAINT `fk_animais_especies` FOREIGN KEY (`id_especie`) REFERENCES `especies` (`id`),
  ADD CONSTRAINT `fk_animais_raca` FOREIGN KEY (`id_raca`) REFERENCES `racas` (`id`);

--
-- Limitadores para a tabela `atendimentos`
--
ALTER TABLE `atendimentos`
  ADD CONSTRAINT `fk_atendimentos_animal` FOREIGN KEY (`id_animal`) REFERENCES `animais` (`id`),
  ADD CONSTRAINT `fk_atendimentos_veterinario` FOREIGN KEY (`id_veterinario`) REFERENCES `veterinarios` (`id`);

--
-- Limitadores para a tabela `atendimentos_tratamentos`
--
ALTER TABLE `atendimentos_tratamentos`
  ADD CONSTRAINT `fk_atendimentos_trata_atendi_id_atendimento` FOREIGN KEY (`id_atendimento`) REFERENCES `atendimentos` (`id`),
  ADD CONSTRAINT `fk_atendimentos_trata_remedio_id_remedio` FOREIGN KEY (`id_remedio`) REFERENCES `remedios` (`id`);

--
-- Limitadores para a tabela `remedios`
--
ALTER TABLE `remedios`
  ADD CONSTRAINT `fk_remedios_laboratorios_id_laboratorio` FOREIGN KEY (`id_laboratorio`) REFERENCES `laboratorios` (`id`);

--
-- Limitadores para a tabela `users_roles`
--
ALTER TABLE `users_roles`
  ADD CONSTRAINT `fk_users_role_idrole` FOREIGN KEY (`idrole`) REFERENCES `roles` (`id`),
  ADD CONSTRAINT `fk_users_role_iduser` FOREIGN KEY (`iduser`) REFERENCES `users` (`id`);

--
-- Limitadores para a tabela `veterinarios_especialidades`
--
ALTER TABLE `veterinarios_especialidades`
  ADD CONSTRAINT `fk_veterinarios_especialidades_id_especialidade` FOREIGN KEY (`id_especialidade`) REFERENCES `especialidades` (`id`),
  ADD CONSTRAINT `fk_veterinarios_especialidades_id_veterinario` FOREIGN KEY (`id_veterinario`) REFERENCES `veterinarios` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
