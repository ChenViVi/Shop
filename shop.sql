-- phpMyAdmin SQL Dump
-- version 4.0.10.20
-- https://www.phpmyadmin.net
--
-- 主机: 127.0.0.1
-- 生成日期: 2018-05-05 15:38:20
-- 服务器版本: 5.7.21
-- PHP 版本: 5.6.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `shop`
--

-- --------------------------------------------------------

--
-- 表的结构 `about`
--

CREATE TABLE IF NOT EXISTS `about` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text NOT NULL COMMENT '关于页面的内容',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `about`
--

INSERT INTO `about` (`id`, `content`) VALUES
(1, '我是一个很简单的卡片。我很擅长于包含少量的信息。我很方便，因为我只需要一个小标记就可以有效地使用。在其他框架中我叫做面板。');

-- --------------------------------------------------------

--
-- 表的结构 `admin`
--

CREATE TABLE IF NOT EXISTS `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account` varchar(20) NOT NULL COMMENT '管理员账号',
  `password` varchar(20) NOT NULL COMMENT '管理员密码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `admin`
--

INSERT INTO `admin` (`id`, `account`, `password`) VALUES
(1, 'admin', 'admin');

-- --------------------------------------------------------

--
-- 表的结构 `article`
--

CREATE TABLE IF NOT EXISTS `article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(20) NOT NULL COMMENT '资讯标题',
  `content` text NOT NULL COMMENT '资讯内容',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `article`
--

INSERT INTO `article` (`id`, `title`, `content`) VALUES
(1, '笑话', '某日刘虹宏涛遇到外宾，就上前搭话曰：＂ｉam hongtao liu .”外宾曰：＂我还他妈的是方块七呢．＂'),
(2, '陈叶倩', '要好好调养身体哟，以后吸取教训不要老熬夜了'),
(3, '陈叶倩', '希望你能快点好起来');

-- --------------------------------------------------------

--
-- 表的结构 `item`
--

CREATE TABLE IF NOT EXISTS `item` (
  `id` int(11) NOT NULL,
  `detail` text NOT NULL COMMENT '纪念品信息',
  `cover` varchar(225) NOT NULL COMMENT '封面',
  `name` varchar(20) NOT NULL COMMENT '纪念品名称',
  `price` double NOT NULL COMMENT '纪念品价格',
  `type_id` int(11) NOT NULL COMMENT '纪念品种类id',
  PRIMARY KEY (`id`),
  KEY `FKkkuvx6654ty2s5y7buvau85s6` (`type_id`)
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

CREATE TABLE IF NOT EXISTS `item_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL COMMENT '纪念品类型名称',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `item_type`
--

INSERT INTO `item_type` (`id`, `name`) VALUES
(1, '默认');

-- --------------------------------------------------------

--
-- 表的结构 `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account` varchar(20) NOT NULL COMMENT '用户账号',
  `password` varchar(20) NOT NULL COMMENT '用户密码',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `user`
--

INSERT INTO `user` (`id`, `account`, `password`) VALUES
(1, 'user1', 'testtest');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
