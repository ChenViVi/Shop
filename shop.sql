-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 2018-05-04 08:22:29
-- 服务器版本： 5.7.14
-- PHP Version: 5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `keeper`
--

-- --------------------------------------------------------

--
-- 表的结构 `article`
--

CREATE TABLE `article` (
  `id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `title` varchar(20) NOT NULL,
  `content` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `article`
--

INSERT INTO `article` (`id`, `type_id`, `title`, `content`) VALUES
(1, 1, '笑话', '某日刘虹宏涛遇到外宾，就上前搭话曰：＂ｉam hongtao liu .”外宾曰：＂我还他妈的是方块七呢．＂'),
(2, 1, '陈叶倩', '要好好调养身体哟，以后吸取教训不要老熬夜了'),
(3, 1, '陈叶倩', '希望你能快点好起来');

-- --------------------------------------------------------

--
-- 表的结构 `article_type`
--

CREATE TABLE `article_type` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `article_type`
--

INSERT INTO `article_type` (`id`, `name`) VALUES
(1, '闲谈');

-- --------------------------------------------------------

--
-- 表的结构 `music`
--

CREATE TABLE `music` (
  `id` int(11) NOT NULL,
  `comment` varchar(225) NOT NULL,
  `cover` varchar(225) NOT NULL,
  `link` varchar(225) NOT NULL,
  `name` varchar(30) NOT NULL,
  `score` varchar(10) NOT NULL,
  `type_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `music`
--

INSERT INTO `music` (`id`, `comment`, `cover`, `link`, `name`, `score`, `type_id`) VALUES
(1, '哈法', 'http://p1.music.126.net/uGIauNZovCCtlaKqL_DLfw==/109951163131910492.jpg?param=130y130', 'http://www.materializecss.cn/images/showcase/mezwsousou.png', 'Rave', '7.8', 1),
(0, '阿萨德a', '使得是', '35345 ', '水电费', '5', 1);

-- --------------------------------------------------------

--
-- 表的结构 `music_type`
--

CREATE TABLE `music_type` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `music_type`
--

INSERT INTO `music_type` (`id`, `name`) VALUES
(1, '电子');

-- --------------------------------------------------------

--
-- 表的结构 `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `video`
--

CREATE TABLE `video` (
  `id` int(11) NOT NULL,
  `comment` varchar(225) NOT NULL,
  `cover` varchar(225) NOT NULL,
  `link` varchar(225) NOT NULL,
  `name` varchar(20) NOT NULL,
  `score` varchar(20) NOT NULL,
  `type_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `video`
--

INSERT INTO `video` (`id`, `comment`, `cover`, `link`, `name`, `score`, `type_id`) VALUES
(1, '和小樱一起，release！', 'https://i0.hdslb.com/bfs/bangumi/07245c4bf4acb03a5819762fea3210c656aba66c.jpg_225x300.jpg', 'https://bangumi.bilibili.com/anime/21421', '魔卡少女樱 CLEAR CARD篇', '8.1', 1);

-- --------------------------------------------------------

--
-- 表的结构 `video_type`
--

CREATE TABLE `video_type` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `video_type`
--

INSERT INTO `video_type` (`id`, `name`) VALUES
(1, '番剧');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKafxv6hc5lce4r0s98kjbdc9b` (`type_id`);

--
-- Indexes for table `article_type`
--
ALTER TABLE `article_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `music`
--
ALTER TABLE `music`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK98dv7rh7nj77si3u79ub67ue0` (`type_id`);

--
-- Indexes for table `music_type`
--
ALTER TABLE `music_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `video`
--
ALTER TABLE `video`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKkkuvx6654ty2s5y7buvau85s6` (`type_id`);

--
-- Indexes for table `video_type`
--
ALTER TABLE `video_type`
  ADD PRIMARY KEY (`id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `article`
--
ALTER TABLE `article`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
