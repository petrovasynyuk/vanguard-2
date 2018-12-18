-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Creato il: Ott 27, 2018 alle 12:25
-- Versione del server: 10.1.36-MariaDB-cll-lve
-- Versione PHP: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ideezeur_reportify`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `analysis`
--

CREATE TABLE `analysis` (
  `idAnalysis` int(11) NOT NULL,
  `AnalysisName` varchar(45) DEFAULT NULL,
  `Method` varchar(45) DEFAULT NULL,
  `Comment` varchar(45) DEFAULT NULL,
  `Createdby` varchar(45) DEFAULT NULL,
  `idCompany` int(11) NOT NULL DEFAULT '0',
  `Category_Analysis` varchar(255) DEFAULT NULL,
  `score_analysis_value` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `analysis`
--

INSERT INTO `analysis` (`idAnalysis`, `AnalysisName`, `Method`, `Comment`, `Createdby`, `idCompany`, `Category_Analysis`, `score_analysis_value`) VALUES
(1, 'Lead and Cadmium', 'CPSC CH 01-2003', 'Try', '1', 1, NULL, NULL),
(2, 'Phthalates', 'ISO 8124-5', NULL, '1', 1, NULL, NULL),
(3, 'Fiber Identification', 'GB', NULL, '1', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Struttura della tabella `company`
--

CREATE TABLE `company` (
  `idCompany` int(11) NOT NULL,
  `CompanyName` varchar(45) NOT NULL,
  `CompanyAddress` varchar(250) NOT NULL,
  `CompanyCity` varchar(250) NOT NULL,
  `ZipCode` varchar(45) NOT NULL,
  `Country` varchar(45) NOT NULL,
  `TaxNumber` varchar(45) NOT NULL,
  `InvoiceEmailAddress` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `company`
--

INSERT INTO `company` (`idCompany`, `CompanyName`, `CompanyAddress`, `CompanyCity`, `ZipCode`, `Country`, `TaxNumber`, `InvoiceEmailAddress`) VALUES
(1, 'UL Cabiate', 'via Europa 28', 'Cabiate', '22060', 'Italy', '2233445566', 'info@claudiosironi.com');

-- --------------------------------------------------------

--
-- Struttura della tabella `department`
--

CREATE TABLE `department` (
  `idDepartment` int(11) NOT NULL,
  `DepartmentName` varchar(250) NOT NULL,
  `DepartmentLocation` varchar(250) DEFAULT NULL,
  `DepartmentComment` longtext,
  `Departmentcol` varchar(45) DEFAULT NULL,
  `idCompany` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `department`
--

INSERT INTO `department` (`idDepartment`, `DepartmentName`, `DepartmentLocation`, `DepartmentComment`, `Departmentcol`, `idCompany`) VALUES
(1, 'Lab Chimico', 'Cabiate', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `details_analysis`
--

CREATE TABLE `details_analysis` (
  `IdDetails_Analysis` int(11) NOT NULL,
  `Name_component` varchar(255) DEFAULT NULL,
  `UM_component` varchar(50) DEFAULT NULL,
  `comment_component` varchar(255) DEFAULT NULL,
  `additional_info_component` varchar(255) DEFAULT NULL,
  `idAnalysis` int(11) DEFAULT NULL,
  `score_value` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `details_analysis`
--

INSERT INTO `details_analysis` (`IdDetails_Analysis`, `Name_component`, `UM_component`, `comment_component`, `additional_info_component`, `idAnalysis`, `score_value`) VALUES
(1, 'Pb', 'mg/kg', 'Lead', NULL, 1, NULL),
(5, 'Cd', 'mg/kg', 'Cadmium', NULL, 1, NULL),
(6, 'DBP', '%', 'Dibutylphthalate', NULL, 2, NULL),
(7, 'BBP', '%', 'BenzylButylPhthalate', NULL, 2, NULL),
(8, 'Stated Composition', '%', NULL, NULL, 3, NULL),
(9, 'Lab Composition', NULL, NULL, NULL, 3, NULL);

-- --------------------------------------------------------

--
-- Struttura della tabella `metadata`
--

CREATE TABLE `metadata` (
  `idMetadata` int(11) NOT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `idcompany` int(11) DEFAULT NULL,
  `iddepartment` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `metadata`
--

INSERT INTO `metadata` (`idMetadata`, `Name`, `idcompany`, `iddepartment`) VALUES
(1, 'Trial1', 1, 1),
(2, 'Trial 2', 1, 1),
(3, 'Trial3', 1, 1),
(4, 'Trial4', 1, 1),
(5, 'Trial5', 1, 1),
(6, 'Ricami', 1, 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `metadata_fill`
--

CREATE TABLE `metadata_fill` (
  `idMetadata_fill` int(11) NOT NULL,
  `idMetadata` int(11) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `idproject` int(11) DEFAULT NULL,
  `projectNumber` varchar(255) DEFAULT NULL,
  `metadataName` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `metadata_fill`
--

INSERT INTO `metadata_fill` (`idMetadata_fill`, `idMetadata`, `value`, `idproject`, `projectNumber`, `metadataName`) VALUES
(8, 2, '10', 1, '18.1', 'Trial'),
(9, 1, '8', 1, '18.1', 'Color'),
(10, 3, '3', 1, '18.1', 'SKU'),
(11, 6, 'cubi', 1, '18.1', NULL);

-- --------------------------------------------------------

--
-- Struttura della tabella `option`
--

CREATE TABLE `option` (
  `idoption` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `parts_project`
--

CREATE TABLE `parts_project` (
  `idparts_project` int(11) NOT NULL,
  `name_part` varchar(255) DEFAULT NULL,
  `material` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `idProject` int(11) DEFAULT NULL,
  `projectNumber` varchar(255) DEFAULT NULL,
  `partNumber` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `parts_project`
--

INSERT INTO `parts_project` (`idparts_project`, `name_part`, `material`, `color`, `idProject`, `projectNumber`, `partNumber`) VALUES
(1, 'Blue Textile', 'Cotton', 'Blue', 1, '18.1', '112'),
(2, 'Red Textile', 'Polyester', 'Red', 1, '18.1', '113'),
(3, 'Yellow Textile', 'Cotton', 'Yellow', 1, '18.1', '114'),
(4, 'Leather Blue', 'Leather', 'Blue', 1, '18.1', '115');

-- --------------------------------------------------------

--
-- Struttura della tabella `project`
--

CREATE TABLE `project` (
  `idProject` int(11) NOT NULL,
  `projectNumber` varchar(255) DEFAULT NULL,
  `projectLabNumber` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `sku` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `style` varchar(255) DEFAULT NULL,
  `season` varchar(255) DEFAULT NULL,
  `idCompany` int(11) DEFAULT NULL,
  `idusers` int(11) DEFAULT NULL,
  `idDepartment` int(11) DEFAULT NULL,
  `idRSL` int(11) DEFAULT NULL,
  `idRSLCategory` varchar(255) DEFAULT NULL,
  `inorder` varchar(255) DEFAULT NULL,
  `inlab` varchar(255) DEFAULT NULL,
  `outlab` varchar(255) DEFAULT NULL,
  `idsupplier` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `project`
--

INSERT INTO `project` (`idProject`, `projectNumber`, `projectLabNumber`, `description`, `sku`, `color`, `style`, `season`, `idCompany`, `idusers`, `idDepartment`, `idRSL`, `idRSLCategory`, `inorder`, `inlab`, `outlab`, `idsupplier`) VALUES
(1, '18.1', '18-12345', 'Trial', '8888', 'Blue', 'Nav', 'Winter', 1, 1, 1, 1, '1', '02-04-2018', '02-04-2018', '10-04-2018', '1'),
(2, '18.2345', '1234', 'Blue TShirt', '12354', 'Blue', 'aajjaj', 'Summer', 1, 0, 1, 1, '1', '132', '12323', '1232313', '1'),
(3, '18.5', '18.23456', 'Trials2', '9999', 'Red', 'Out', 'Summer', 1, 1, 1, 1, '1', '30-03-201', '30-03-201', '15-04-2018', '2');

-- --------------------------------------------------------

--
-- Struttura della tabella `result_project`
--

CREATE TABLE `result_project` (
  `idResult_Project` int(11) NOT NULL,
  `idPart` int(11) DEFAULT NULL,
  `idAnalysis` int(11) DEFAULT NULL,
  `iddetails` int(11) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `Rating` varchar(50) DEFAULT NULL,
  `projectNumber` varchar(255) DEFAULT NULL,
  `partNumber` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `result_project`
--

INSERT INTO `result_project` (`idResult_Project`, `idPart`, `idAnalysis`, `iddetails`, `value`, `comment`, `Rating`, `projectNumber`, `partNumber`) VALUES
(4, 1, 2, 6, '0.009', 'Pass', 'PASS', '18.1', '112'),
(5, 1, 1, 1, '8', 'Pass', 'PASS', '18.1', '112'),
(6, 1, 2, 7, '0.12', 'Pass', 'PASS', '18.1', '112'),
(7, 1, 1, 5, '10', 'Pass', 'PASS', '18.1', '112'),
(8, 4, 2, 6, '12', 'Pass', 'PASS', '18.1', '115'),
(9, 3, 2, 6, '90', NULL, NULL, '18.1', NULL),
(10, 3, 2, 7, NULL, '3', NULL, '18.1', NULL),
(11, 3, 1, 1, 'ciao', 'popo', NULL, '18.1', NULL);

-- --------------------------------------------------------

--
-- Struttura della tabella `roles`
--

CREATE TABLE `roles` (
  `idRoles` int(11) NOT NULL,
  `RolesName` varchar(45) NOT NULL,
  `Comment` longtext,
  `Rolescol` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `roles`
--

INSERT INTO `roles` (`idRoles`, `RolesName`, `Comment`, `Rolescol`) VALUES
(1, 'Admin', NULL, NULL);

-- --------------------------------------------------------

--
-- Struttura della tabella `rsl`
--

CREATE TABLE `rsl` (
  `idRSL` int(11) NOT NULL,
  `RSLName` varchar(45) NOT NULL,
  `Version` varchar(45) DEFAULT NULL,
  `Active From` varchar(45) DEFAULT NULL,
  `Active To` varchar(45) DEFAULT NULL,
  `Createdby` varchar(45) NOT NULL,
  `idCompany` varchar(45) NOT NULL DEFAULT '',
  `idDepartment` int(11) NOT NULL,
  `idCategory` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `rsl`
--

INSERT INTO `rsl` (`idRSL`, `RSLName`, `Version`, `Active From`, `Active To`, `Createdby`, `idCompany`, `idDepartment`, `idCategory`) VALUES
(1, 'RSL 2018', '1', '12-12-2012', NULL, 'Claudio', '1', 0, '1'),
(2, 'RSL 2018', '6', '209', '90909', '1', '1', 1, '2');

-- --------------------------------------------------------

--
-- Struttura della tabella `rslcategory`
--

CREATE TABLE `rslcategory` (
  `idRSLCategory` int(11) NOT NULL,
  `CategoryName` varchar(45) DEFAULT NULL,
  `CategoryComment` varchar(45) DEFAULT NULL,
  `CreatedBy` varchar(45) DEFAULT NULL,
  `idCompany` int(11) DEFAULT NULL,
  `idDepartment` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `rslcategory`
--

INSERT INTO `rslcategory` (`idRSLCategory`, `CategoryName`, `CategoryComment`, `CreatedBy`, `idCompany`, `idDepartment`) VALUES
(1, 'Baby <36', 'Baby < 36 Months', '1', 1, 1),
(2, 'Baby >36', 'Baby >36 Months', '1', 1, 1),
(3, 'Trial 2', 'Hi', '1', 1, 1),
(4, 'Baby', 'bambino sopra 36 mesi', '1', 1, 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `rsl_analysis`
--

CREATE TABLE `rsl_analysis` (
  `Idrsl_analysis` int(11) NOT NULL,
  `idrsl` int(11) DEFAULT NULL,
  `idcategory` int(11) DEFAULT NULL,
  `idanalysis` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `rsl_analysis`
--

INSERT INTO `rsl_analysis` (`Idrsl_analysis`, `idrsl`, `idcategory`, `idanalysis`) VALUES
(2, 1, 1, 2),
(3, 1, 1, 1),
(4, 1, 1, 3);

-- --------------------------------------------------------

--
-- Struttura della tabella `rsl_limits`
--

CREATE TABLE `rsl_limits` (
  `idrsl_limits` int(11) NOT NULL,
  `idrsl` int(11) DEFAULT NULL,
  `idrsl_analysis` int(11) DEFAULT NULL,
  `iddetails_analysis` int(11) DEFAULT NULL,
  `LOQ` varchar(100) DEFAULT NULL,
  `limit` varchar(255) DEFAULT NULL,
  `upperlimit` varchar(255) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `score_value` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `rsl_limits`
--

INSERT INTO `rsl_limits` (`idrsl_limits`, `idrsl`, `idrsl_analysis`, `iddetails_analysis`, `LOQ`, `limit`, `upperlimit`, `comment`, `score_value`) VALUES
(14, 1, 1, 1, '5', '40', '12', NULL, NULL),
(15, 1, 1, 5, '5', '100', NULL, NULL, NULL),
(16, 1, 2, 6, '100', '1000', '10', NULL, NULL),
(17, 1, 2, 7, NULL, NULL, NULL, NULL, '50');

-- --------------------------------------------------------

--
-- Struttura della tabella `scoreclass`
--

CREATE TABLE `scoreclass` (
  `idscoreclass` int(11) NOT NULL,
  `name_class` varchar(255) DEFAULT NULL,
  `description_class` varchar(255) DEFAULT NULL,
  `scoreTarget` varchar(255) DEFAULT NULL,
  `idcompany` int(11) DEFAULT NULL,
  `iddepartment` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `scoreclass`
--

INSERT INTO `scoreclass` (`idscoreclass`, `name_class`, `description_class`, `scoreTarget`, `idcompany`, `iddepartment`) VALUES
(1, 'Gold', 'Gold Class', '100', 1, 1),
(2, 'Silver', 'Silver Class', '200', 1, 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `supplier`
--

CREATE TABLE `supplier` (
  `idsupplier` int(11) NOT NULL,
  `name_supplier` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `idcompany` int(11) DEFAULT NULL,
  `iddepartment` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `supplier`
--

INSERT INTO `supplier` (`idsupplier`, `name_supplier`, `address`, `city`, `phone`, `email`, `idcompany`, `iddepartment`) VALUES
(1, 'Supplier Test', 'vai ADD', 'Milano', '7879787979', 'info@ckklk.it', 1, 1),
(2, 'Dolce Gabbana', 'bla', 'Rome', '7979879', 'info@jkjk.com', 1, 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `templates`
--

CREATE TABLE `templates` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_company` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_department` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_users` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `map` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dump dei dati per la tabella `templates`
--

INSERT INTO `templates` (`id`, `name`, `id_company`, `id_department`, `id_users`, `map`, `created_at`, `updated_at`) VALUES
(3, 'DIMA', '1', '1', '1', '{\"metadata_fill\":{\"idMetadata_fill\":\"idMetadata_fill\",\"idMetadata\":\"idMetadata\",\"value\":\"value\",\"idproject\":\"idproject\",\"projectNumber\":\"projectNumber\",\"metadataName\":\"metadataName\"},\"project\":{\"idProject\":\"idProject\",\"projectNumber\":\"projectNumber\",\"projectLabNumber\":\"projectLabNumber\",\"description\":\"description\",\"sku\":\"sku\",\"color\":\"color\",\"style\":\"style\",\"season\":\"season\",\"idCompany\":\"idCompany\",\"idusers\":\"idusers\",\"idDepartment\":\"idDepartment\",\"idRSL\":\"idRSL\",\"idRSLCategory\":\"idRSLCategory\",\"inorder\":\"inorder\",\"inlab\":\"inlab\",\"outlab\":\"outlab\",\"idsupplier\":\"idsupplier\"},\"parts_project\":{\"idparts_project\":\"idparts_project\",\"name_part\":\"name_part\",\"material\":\"material\",\"color\":\"color\",\"idProject\":\"idProject\",\"projectNumber\":\"projectNumber\",\"partNumber\":\"partNumber\"},\"result_project\":{\"idResult_Project\":\"idResult_Project\",\"idPart\":\"idPart\",\"idAnalysis\":\"idAnalysis\",\"iddetails\":\"iddetails\",\"value\":\"value\",\"comment\":\"comment\",\"Rating\":\"Rating\",\"projectNumber\":\"projectNumber\",\"partNumber\":\"partNumber\"}}', '2018-05-06 16:54:45', '2018-05-06 16:54:45'),
(4, 'Test template', '1', '1', '1', '{\"metadata_fill\":{\"idMetadata_fill\":\"idMetadata_fill\",\"idMetadata\":\"idMetadata_fill\",\"value\":\"value\",\"idproject\":\"idproject\",\"projectNumber\":\"projectNumber\",\"metadataName\":\"metadataName\"},\"project\":{\"idProject\":\"idProject\",\"projectNumber\":\"projectNumber\",\"projectLabNumber\":\"projectLabNumber\",\"description\":\"description\",\"sku\":\"sku\",\"color\":\"color\",\"style\":\"style\",\"season\":\"season\",\"idCompany\":\"idCompany\",\"idusers\":\"idusers\",\"idDepartment\":\"idDepartment\",\"idRSL\":\"idDepartment\",\"idRSLCategory\":\"idRSLCategory\",\"inorder\":\"inorder\",\"inlab\":\"inorder\",\"outlab\":\"outlab\",\"idsupplier\":\"idsupplier\"},\"parts_project\":{\"idparts_project\":\"idparts_project\",\"name_part\":\"name_part\",\"material\":\"material\",\"color\":\"color\",\"idProject\":\"idProject\",\"projectNumber\":\"projectNumber\",\"partNumber\":\"partNumber\"},\"result_project\":{\"idResult_Project\":\"idResult_Project\",\"idPart\":\"idPart\",\"idAnalysis\":\"idAnalysis\",\"iddetails\":\"iddetails\",\"value\":\"value\",\"comment\":\"comment\",\"Rating\":\"Rating\",\"projectNumber\":\"projectNumber\",\"partNumber\":\"partNumber\"}}', '2018-05-06 20:21:33', '2018-05-06 20:21:33');

-- --------------------------------------------------------

--
-- Struttura della tabella `users`
--

CREATE TABLE `users` (
  `idUsers` int(11) NOT NULL,
  `Usersname` varchar(250) NOT NULL,
  `UsersSurname` varchar(250) NOT NULL,
  `Salutation` varchar(45) DEFAULT NULL,
  `emailUser` varchar(255) DEFAULT NULL,
  `JobTitle` varchar(150) DEFAULT NULL,
  `Privacy` char(1) DEFAULT NULL,
  `Userscol` varchar(45) DEFAULT NULL,
  `idCompany` int(11) NOT NULL DEFAULT '0',
  `idDepartment` int(11) DEFAULT NULL,
  `idRole` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `users`
--

INSERT INTO `users` (`idUsers`, `Usersname`, `UsersSurname`, `Salutation`, `emailUser`, `JobTitle`, `Privacy`, `Userscol`, `idCompany`, `idDepartment`, `idRole`) VALUES
(1, 'Claudio', 'Sironi', 'Mr', 'info@claudiosironi.com', 'Lab Manager', 'Y', NULL, 1, 1, 1);

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `analysis`
--
ALTER TABLE `analysis`
  ADD PRIMARY KEY (`idAnalysis`);

--
-- Indici per le tabelle `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`idCompany`);

--
-- Indici per le tabelle `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`idDepartment`);

--
-- Indici per le tabelle `details_analysis`
--
ALTER TABLE `details_analysis`
  ADD PRIMARY KEY (`IdDetails_Analysis`);

--
-- Indici per le tabelle `metadata`
--
ALTER TABLE `metadata`
  ADD PRIMARY KEY (`idMetadata`);

--
-- Indici per le tabelle `metadata_fill`
--
ALTER TABLE `metadata_fill`
  ADD PRIMARY KEY (`idMetadata_fill`);

--
-- Indici per le tabelle `option`
--
ALTER TABLE `option`
  ADD PRIMARY KEY (`idoption`);

--
-- Indici per le tabelle `parts_project`
--
ALTER TABLE `parts_project`
  ADD PRIMARY KEY (`idparts_project`);

--
-- Indici per le tabelle `project`
--
ALTER TABLE `project`
  ADD PRIMARY KEY (`idProject`);

--
-- Indici per le tabelle `result_project`
--
ALTER TABLE `result_project`
  ADD PRIMARY KEY (`idResult_Project`);

--
-- Indici per le tabelle `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`idRoles`);

--
-- Indici per le tabelle `rsl`
--
ALTER TABLE `rsl`
  ADD PRIMARY KEY (`idRSL`);

--
-- Indici per le tabelle `rslcategory`
--
ALTER TABLE `rslcategory`
  ADD PRIMARY KEY (`idRSLCategory`);

--
-- Indici per le tabelle `rsl_analysis`
--
ALTER TABLE `rsl_analysis`
  ADD PRIMARY KEY (`Idrsl_analysis`);

--
-- Indici per le tabelle `rsl_limits`
--
ALTER TABLE `rsl_limits`
  ADD PRIMARY KEY (`idrsl_limits`);

--
-- Indici per le tabelle `scoreclass`
--
ALTER TABLE `scoreclass`
  ADD PRIMARY KEY (`idscoreclass`);

--
-- Indici per le tabelle `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`idsupplier`);

--
-- Indici per le tabelle `templates`
--
ALTER TABLE `templates`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`idUsers`,`idCompany`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `analysis`
--
ALTER TABLE `analysis`
  MODIFY `idAnalysis` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT per la tabella `company`
--
ALTER TABLE `company`
  MODIFY `idCompany` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT per la tabella `department`
--
ALTER TABLE `department`
  MODIFY `idDepartment` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT per la tabella `details_analysis`
--
ALTER TABLE `details_analysis`
  MODIFY `IdDetails_Analysis` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT per la tabella `metadata`
--
ALTER TABLE `metadata`
  MODIFY `idMetadata` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT per la tabella `metadata_fill`
--
ALTER TABLE `metadata_fill`
  MODIFY `idMetadata_fill` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT per la tabella `option`
--
ALTER TABLE `option`
  MODIFY `idoption` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `parts_project`
--
ALTER TABLE `parts_project`
  MODIFY `idparts_project` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT per la tabella `project`
--
ALTER TABLE `project`
  MODIFY `idProject` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT per la tabella `result_project`
--
ALTER TABLE `result_project`
  MODIFY `idResult_Project` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT per la tabella `roles`
--
ALTER TABLE `roles`
  MODIFY `idRoles` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT per la tabella `rsl`
--
ALTER TABLE `rsl`
  MODIFY `idRSL` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT per la tabella `rslcategory`
--
ALTER TABLE `rslcategory`
  MODIFY `idRSLCategory` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT per la tabella `rsl_analysis`
--
ALTER TABLE `rsl_analysis`
  MODIFY `Idrsl_analysis` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT per la tabella `rsl_limits`
--
ALTER TABLE `rsl_limits`
  MODIFY `idrsl_limits` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT per la tabella `scoreclass`
--
ALTER TABLE `scoreclass`
  MODIFY `idscoreclass` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT per la tabella `supplier`
--
ALTER TABLE `supplier`
  MODIFY `idsupplier` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT per la tabella `templates`
--
ALTER TABLE `templates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT per la tabella `users`
--
ALTER TABLE `users`
  MODIFY `idUsers` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
