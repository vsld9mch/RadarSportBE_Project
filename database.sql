-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Хост: sql308.infinityfree.com
-- Время создания: Мар 29 2026 г., 07:21
-- Версия сервера: 11.4.10-MariaDB
-- Версия PHP: 7.2.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `if0_41499849_dataofmatches`
--

-- --------------------------------------------------------

--
-- Структура таблицы `events`
--

CREATE TABLE `events` (
  `id` int(11) NOT NULL,
  `season` int(11) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `date_venue` date NOT NULL,
  `time_venue_utc` time NOT NULL,
  `home_goals` int(11) DEFAULT 0,
  `away_goals` int(11) DEFAULT 0,
  `stage_name` varchar(50) DEFAULT NULL,
  `_sport_id` int(11) DEFAULT NULL,
  `_home_team_id` int(11) DEFAULT NULL,
  `_away_team_id` int(11) DEFAULT NULL,
  `_venue_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Дамп данных таблицы `events`
--

INSERT INTO `events` (`id`, `season`, `status`, `date_venue`, `time_venue_utc`, `home_goals`, `away_goals`, `stage_name`, `_sport_id`, `_home_team_id`, `_away_team_id`, `_venue_id`) VALUES
(1, 2024, 'played', '2024-01-03', '00:00:00', 1, 2, 'ROUND OF 16', 1, 1, 2, 1),
(2, 2024, 'scheduled', '2024-01-03', '16:00:00', 0, 0, 'ROUND OF 16', 1, 3, 4, 1),
(3, 2024, 'scheduled', '2024-01-04', '15:25:00', 0, 0, 'ROUND OF 16', 1, 5, 6, 1),
(4, 2024, 'scheduled', '2024-01-04', '08:00:00', 0, 0, 'ROUND OF 16', 1, 7, 8, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `sports`
--

CREATE TABLE `sports` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Дамп данных таблицы `sports`
--

INSERT INTO `sports` (`id`, `name`) VALUES
(1, 'Football');

-- --------------------------------------------------------

--
-- Структура таблицы `teams`
--

CREATE TABLE `teams` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `official_name` varchar(100) DEFAULT NULL,
  `country_code` varchar(3) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Дамп данных таблицы `teams`
--

INSERT INTO `teams` (`id`, `name`, `official_name`, `country_code`) VALUES
(1, 'Al Shabab', 'Al Shabab FC', 'KSA'),
(2, 'Nasaf', 'FC Nasaf', 'UZB'),
(3, 'Al Hilal', 'Al Hilal Saudi FC', 'KSA'),
(4, 'Shabab Al Ahli', 'SHABAB AL AHLI DUBAI', 'UAE'),
(5, 'Al Duhail', 'AL DUHAIL SC', 'QAT'),
(6, 'Al Rayyan', 'AL RAYYAN SC', 'QAT'),
(7, 'Al Faisaly', 'Al Faisaly FC', 'KSA'),
(8, 'Foolad', 'FOOLAD KHOUZESTAN FC', 'IRN');

-- --------------------------------------------------------

--
-- Структура таблицы `venues`
--

CREATE TABLE `venues` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `city` varchar(100) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Дамп данных таблицы `venues`
--

INSERT INTO `venues` (`id`, `name`, `city`) VALUES
(1, 'King Fahd Stadium', 'Riyadh');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`),
  ADD KEY `_sport_id` (`_sport_id`),
  ADD KEY `_home_team_id` (`_home_team_id`),
  ADD KEY `_away_team_id` (`_away_team_id`),
  ADD KEY `_venue_id` (`_venue_id`);

--
-- Индексы таблицы `sports`
--
ALTER TABLE `sports`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `teams`
--
ALTER TABLE `teams`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `venues`
--
ALTER TABLE `venues`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `events`
--
ALTER TABLE `events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `sports`
--
ALTER TABLE `sports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `teams`
--
ALTER TABLE `teams`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `venues`
--
ALTER TABLE `venues`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
