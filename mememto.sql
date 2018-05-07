-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 2018-05-07 14:40:49
-- 服务器版本： 5.7.14
-- PHP Version: 7.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mememto`
--

-- --------------------------------------------------------

--
-- 表的结构 `about`
--

CREATE TABLE `about` (
  `id` int(11) NOT NULL,
  `content` text NOT NULL COMMENT '关于页面的内容'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `about`
--

INSERT INTO `about` (`id`, `content`) VALUES
(1, '我是一个很简单的卡片。我很擅长于包含少量的信息。我很方便，因为我只需要一个小标记就可以有效地使用。在其他框架中我叫做面板。');

-- --------------------------------------------------------

--
-- 表的结构 `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `account` varchar(20) NOT NULL COMMENT '管理员账号',
  `password` varchar(20) NOT NULL COMMENT '管理员密码'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `admin`
--

INSERT INTO `admin` (`id`, `account`, `password`) VALUES
(1, 'admin', 'admin');

-- --------------------------------------------------------

--
-- 表的结构 `article`
--

CREATE TABLE `article` (
  `id` int(11) NOT NULL,
  `title` varchar(20) NOT NULL COMMENT '资讯标题',
  `content` text NOT NULL COMMENT '资讯内容'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `article`
--

INSERT INTO `article` (`id`, `title`, `content`) VALUES
(1, '笑话', '某日刘虹宏涛遇到外宾，就上前搭话曰：＂ｉam hongtao liu .”外宾曰：＂我还他妈的是方块七呢．＂'),
(2, '陈叶倩', '要好好调养身体哟，以后吸取教训不要老熬夜了'),
(3, '陈叶倩', '希望你能快点好起来');

-- --------------------------------------------------------

--
-- 表的结构 `banner`
--

CREATE TABLE `banner` (
  `id` int(11) NOT NULL,
  `url` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `banner`
--

INSERT INTO `banner` (`id`, `url`) VALUES
(1, 'https://images.unsplash.com/photo-1507126667738-8b2421be55c5?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=0726affb96127bf30d8efda3d2234e11&auto=format&fit=crop&w=500&q=60'),
(2, 'https://images.unsplash.com/photo-1507126667738-8b2421be55c5?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=0726affb96127bf30d8efda3d2234e11&auto=format&fit=crop&w=500&q=60'),
(3, 'https://images.unsplash.com/photo-1507126667738-8b2421be55c5?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=0726affb96127bf30d8efda3d2234e11&auto=format&fit=crop&w=500&q=60'),
(4, 'https://images.unsplash.com/photo-1507126667738-8b2421be55c5?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=0726affb96127bf30d8efda3d2234e11&auto=format&fit=crop&w=500&q=60');

-- --------------------------------------------------------

--
-- 表的结构 `item`
--

CREATE TABLE `item` (
  `id` int(11) NOT NULL,
  `detail` text NOT NULL COMMENT '纪念品信息',
  `cover` varchar(225) NOT NULL COMMENT '封面',
  `name` varchar(20) NOT NULL COMMENT '纪念品名称',
  `price` double NOT NULL COMMENT '纪念品价格',
  `type_id` int(11) NOT NULL COMMENT '纪念品种类id'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `item`
--

INSERT INTO `item` (`id`, `detail`, `cover`, `name`, `price`, `type_id`) VALUES
(1, '好看好看好看好看好看好看好看好看好看好看好看好看好看好看好看好看好看好看好看好看好看好看好看好看好看好看好看好看好看好看好看好看好看好看好看好看好看好看好看', 'http://p3.music.126.net/FP0T3QTqbosVHKI3Vxse-A==/6620159511857506.jpg?param=200y200', '土家族头饰', 8.1, 1);

-- --------------------------------------------------------

--
-- 表的结构 `item_type`
--

CREATE TABLE `item_type` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL COMMENT '纪念品类型名称'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `item_type`
--

INSERT INTO `item_type` (`id`, `name`) VALUES
(1, '默认');

-- --------------------------------------------------------

--
-- 表的结构 `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `account` varchar(20) NOT NULL COMMENT '用户账号',
  `password` varchar(20) NOT NULL COMMENT '用户密码'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `user`
--

INSERT INTO `user` (`id`, `account`, `password`) VALUES
(1, 'user1', 'testtest'),
(2, 'test', 'qqqqqq'),
(3, '111', '111111'),
(4, '1', 'admin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `about`
--
ALTER TABLE `about`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `banner`
--
ALTER TABLE `banner`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKkkuvx6654ty2s5y7buvau85s6` (`type_id`);

--
-- Indexes for table `item_type`
--
ALTER TABLE `item_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `about`
--
ALTER TABLE `about`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- 使用表AUTO_INCREMENT `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- 使用表AUTO_INCREMENT `article`
--
ALTER TABLE `article`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- 使用表AUTO_INCREMENT `banner`
--
ALTER TABLE `banner`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- 使用表AUTO_INCREMENT `item_type`
--
ALTER TABLE `item_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- 使用表AUTO_INCREMENT `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
