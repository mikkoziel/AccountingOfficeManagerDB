-- phpMyAdmin SQL Dump
-- version 4.6.6deb4+deb9u2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Czas generowania: 05 Wrz 2021, 15:40
-- Wersja serwera: 10.1.48-MariaDB-0+deb9u2
-- Wersja PHP: 7.0.33-0+deb9u10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `mkoziel2`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `accounting_office`
--

CREATE TABLE `accounting_office` (
  `company_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `accounting_office`
--

INSERT INTO `accounting_office` (`company_id`) VALUES
(1),
(14);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `calendar`
--

CREATE TABLE `calendar` (
  `calendar_id` int(11) NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime DEFAULT NULL,
  `title` varchar(250) NOT NULL,
  `all_day` bit(1) NOT NULL DEFAULT b'0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `calendar`
--

INSERT INTO `calendar` (`calendar_id`, `start_date`, `end_date`, `title`, `all_day`) VALUES
(28, '2021-09-05 12:15:00', '2021-09-05 13:15:00', 'aaa', b'0');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `calendar_user`
--

CREATE TABLE `calendar_user` (
  `calendar_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `calendar_user`
--

INSERT INTO `calendar_user` (`calendar_id`, `user_id`) VALUES
(28, 20);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `client`
--

CREATE TABLE `client` (
  `user_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `client`
--

INSERT INTO `client` (`user_id`, `employee_id`) VALUES
(7, 16),
(17, 3),
(23, 20);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `client_company`
--

CREATE TABLE `client_company` (
  `company_id` int(11) NOT NULL,
  `ao_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `client_company`
--

INSERT INTO `client_company` (`company_id`, `ao_id`) VALUES
(3, 1),
(4, 1),
(15, 14);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `company`
--

CREATE TABLE `company` (
  `company_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `company`
--

INSERT INTO `company` (`company_id`, `name`) VALUES
(1, 'AOL'),
(3, 'Google'),
(4, 'Facebook'),
(14, 'BEN'),
(15, 'MultiCulti');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `documents`
--

CREATE TABLE `documents` (
  `document_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `path` varchar(250) CHARACTER SET utf16 COLLATE utf16_polish_ci NOT NULL,
  `description` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `employee`
--

CREATE TABLE `employee` (
  `user_id` int(11) NOT NULL,
  `admin_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `employee`
--

INSERT INTO `employee` (`user_id`, `admin_id`) VALUES
(3, 16),
(4, 3),
(5, 3),
(6, 3),
(16, NULL),
(20, NULL),
(24, 20);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `roles`
--

CREATE TABLE `roles` (
  `role_id` int(11) NOT NULL,
  `name` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `roles`
--

INSERT INTO `roles` (`role_id`, `name`) VALUES
(1, 'ADMIN'),
(2, 'USER'),
(3, 'CLIENT'),
(4, 'AO_ADMIN');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `company_id` int(11) NOT NULL,
  `password` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `user`
--

INSERT INTO `user` (`user_id`, `first_name`, `last_name`, `username`, `company_id`, `password`) VALUES
(3, 'Lucjan', 'Wor', 'lucjan.wor@aol.com', 1, ''),
(4, 'Piotr', 'Krawiec', 'piotr.krawiec@aol.com', 1, ''),
(5, 'Jacek', 'Bor', 'jacek.bor@aol.com', 1, ''),
(6, 'Marek', 'Klin', 'marek.klin@aol.com', 1, ''),
(7, 'Grzegorz', 'Wrzeszcz', 'grzegorz.wrzeszcz@google.com', 3, ''),
(16, 'Marek', 'Klin', 'marek.klin4@aol.com', 1, '$2a$10$hdaHtawL4DfZFgh/R9Gb.eeKjYx4zpM8vQ78dnQs5.EjzoUsY52Di'),
(17, 'Anna', 'Jakubiak', 'anna.jakubiak@facebook.com', 4, ''),
(20, 'Anna', 'Bator', 'anna.bator@ben.com', 14, '$2a$10$Wo/YnxVM4j1iDz82L3p9pOn8fZJlONUrc3GbQlZch6WNcUO7d7a8i'),
(23, 'Marta', 'Ach', 'marta.ach@multi.com', 15, '$2a$10$9yBR0GXfUv9Ar7zFaS6e4.Ildx3aL/P/HPJoALSXh.Oii1G0sAeKK'),
(24, 'Piotr', 'Omg', 'piotr.omg@ben.com', 14, '$2a$10$4L59AN8EwAjiBU.Q1hE3Q.5EibyHaERYP3wIq3f3ZKEALpo9zLKVi');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `user_role`
--

CREATE TABLE `user_role` (
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `user_role`
--

INSERT INTO `user_role` (`user_id`, `role_id`) VALUES
(16, 1),
(3, 1),
(7, 3),
(17, 3),
(20, 4),
(23, 3),
(24, 2);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `work_log`
--

CREATE TABLE `work_log` (
  `worklog_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `duration` bigint(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `work_log`
--

INSERT INTO `work_log` (`worklog_id`, `user_id`, `date`, `duration`) VALUES
(1, 16, '2021-07-16 08:00:00', 28800),
(2, 16, '2021-07-15 08:00:00', 19800),
(3, 16, '2021-07-17 23:13:28', 3603);

--
-- Indeksy dla zrzutów tabel
--

--
-- Indexes for table `accounting_office`
--
ALTER TABLE `accounting_office`
  ADD PRIMARY KEY (`company_id`);

--
-- Indexes for table `calendar`
--
ALTER TABLE `calendar`
  ADD PRIMARY KEY (`calendar_id`);

--
-- Indexes for table `calendar_user`
--
ALTER TABLE `calendar_user`
  ADD KEY `CU_FK1` (`calendar_id`),
  ADD KEY `CU_FK2` (`user_id`);

--
-- Indexes for table `client`
--
ALTER TABLE `client`
  ADD KEY `Client_FK1` (`user_id`),
  ADD KEY `Client_FK3` (`employee_id`);

--
-- Indexes for table `client_company`
--
ALTER TABLE `client_company`
  ADD PRIMARY KEY (`company_id`),
  ADD KEY `CC_FK2` (`ao_id`);

--
-- Indexes for table `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`company_id`);

--
-- Indexes for table `documents`
--
ALTER TABLE `documents`
  ADD PRIMARY KEY (`document_id`),
  ADD KEY `Documents_FK1` (`company_id`),
  ADD KEY `Documents_FK2` (`client_id`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD KEY `Employee_FK1` (`user_id`),
  ADD KEY `Employee_FK3` (`admin_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`role_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `User_FK1` (`company_id`);

--
-- Indexes for table `user_role`
--
ALTER TABLE `user_role`
  ADD KEY `Role_FK1` (`user_id`),
  ADD KEY `Role_FK2` (`role_id`);

--
-- Indexes for table `work_log`
--
ALTER TABLE `work_log`
  ADD PRIMARY KEY (`worklog_id`),
  ADD KEY `WorkLog_FK1` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT dla tabeli `accounting_office`
--
ALTER TABLE `accounting_office`
  MODIFY `company_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT dla tabeli `calendar`
--
ALTER TABLE `calendar`
  MODIFY `calendar_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
--
-- AUTO_INCREMENT dla tabeli `client_company`
--
ALTER TABLE `client_company`
  MODIFY `company_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT dla tabeli `company`
--
ALTER TABLE `company`
  MODIFY `company_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT dla tabeli `documents`
--
ALTER TABLE `documents`
  MODIFY `document_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT dla tabeli `roles`
--
ALTER TABLE `roles`
  MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT dla tabeli `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT dla tabeli `work_log`
--
ALTER TABLE `work_log`
  MODIFY `worklog_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `accounting_office`
--
ALTER TABLE `accounting_office`
  ADD CONSTRAINT `AO_FK1` FOREIGN KEY (`company_id`) REFERENCES `company` (`company_id`) ON DELETE CASCADE;

--
-- Ograniczenia dla tabeli `calendar_user`
--
ALTER TABLE `calendar_user`
  ADD CONSTRAINT `CU_FK1` FOREIGN KEY (`calendar_id`) REFERENCES `calendar` (`calendar_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `CU_FK2` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ograniczenia dla tabeli `client`
--
ALTER TABLE `client`
  ADD CONSTRAINT `Client_FK1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `Client_FK3` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`user_id`) ON UPDATE CASCADE;

--
-- Ograniczenia dla tabeli `client_company`
--
ALTER TABLE `client_company`
  ADD CONSTRAINT `CC_FK1` FOREIGN KEY (`company_id`) REFERENCES `company` (`company_id`),
  ADD CONSTRAINT `CC_FK2` FOREIGN KEY (`ao_id`) REFERENCES `accounting_office` (`company_id`);

--
-- Ograniczenia dla tabeli `documents`
--
ALTER TABLE `documents`
  ADD CONSTRAINT `Documents_FK1` FOREIGN KEY (`company_id`) REFERENCES `client_company` (`company_id`),
  ADD CONSTRAINT `Documents_FK2` FOREIGN KEY (`client_id`) REFERENCES `client` (`user_id`);

--
-- Ograniczenia dla tabeli `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `Employee_FK1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Employee_FK3` FOREIGN KEY (`admin_id`) REFERENCES `employee` (`user_id`) ON UPDATE CASCADE;

--
-- Ograniczenia dla tabeli `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `User_FK1` FOREIGN KEY (`company_id`) REFERENCES `company` (`company_id`);

--
-- Ograniczenia dla tabeli `user_role`
--
ALTER TABLE `user_role`
  ADD CONSTRAINT `Role_FK1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `Role_FK2` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`) ON DELETE CASCADE;

--
-- Ograniczenia dla tabeli `work_log`
--
ALTER TABLE `work_log`
  ADD CONSTRAINT `WorkLog_FK1` FOREIGN KEY (`user_id`) REFERENCES `employee` (`user_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
