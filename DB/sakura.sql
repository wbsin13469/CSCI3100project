-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- 主機: 127.0.0.1
-- 產生時間： 
-- 伺服器版本: 10.1.30-MariaDB
-- PHP 版本： 7.2.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫： `sakura`
--

-- --------------------------------------------------------

--
-- 資料表結構 `chatbox`
--

CREATE TABLE `chatbox` (
  `chatboxID` int(10) NOT NULL,
  `userID` int(10) NOT NULL,
  `validation` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 資料表結構 `conversation`
--

CREATE TABLE `conversation` (
  `conversationID` int(10) NOT NULL,
  `chatboxID` int(10) NOT NULL,
  `userID` int(10) NOT NULL,
  `content` varchar(250) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `validation` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 資料表結構 `matching`
--

CREATE TABLE `matching` (
  `matchingID` int(10) NOT NULL,
  `preferenceID` int(10) NOT NULL,
  `status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 資料表結構 `preference`
--

CREATE TABLE `preference` (
  `preferenceID` int(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 資料表結構 `user`
--

CREATE TABLE `user` (
  `userID` int(10) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(15) NOT NULL,
  `email` varchar(50) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `validation` tinyint(1) NOT NULL,
  `preferenceID` int(10) NOT NULL,
  `targetList` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 已匯出資料表的索引
--

--
-- 資料表索引 `chatbox`
--
ALTER TABLE `chatbox`
  ADD PRIMARY KEY (`chatboxID`),
  ADD KEY `userID` (`userID`);

--
-- 資料表索引 `conversation`
--
ALTER TABLE `conversation`
  ADD PRIMARY KEY (`conversationID`),
  ADD KEY `chatboxID` (`chatboxID`),
  ADD KEY `userID` (`userID`);

--
-- 資料表索引 `matching`
--
ALTER TABLE `matching`
  ADD PRIMARY KEY (`matchingID`),
  ADD KEY `preferenceID` (`preferenceID`);

--
-- 資料表索引 `preference`
--
ALTER TABLE `preference`
  ADD PRIMARY KEY (`preferenceID`);

--
-- 資料表索引 `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`userID`),
  ADD KEY `preferenceID` (`preferenceID`);

--
-- 已匯出資料表的限制(Constraint)
--

--
-- 資料表的 Constraints `chatbox`
--
ALTER TABLE `chatbox`
  ADD CONSTRAINT `chatbox_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`);

--
-- 資料表的 Constraints `conversation`
--
ALTER TABLE `conversation`
  ADD CONSTRAINT `conversation_ibfk_1` FOREIGN KEY (`chatboxID`) REFERENCES `chatbox` (`chatboxID`),
  ADD CONSTRAINT `conversation_ibfk_2` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`);

--
-- 資料表的 Constraints `matching`
--
ALTER TABLE `matching`
  ADD CONSTRAINT `matching_ibfk_1` FOREIGN KEY (`preferenceID`) REFERENCES `preference` (`preferenceID`);

--
-- 資料表的 Constraints `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`preferenceID`) REFERENCES `preference` (`preferenceID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
