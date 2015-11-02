-- phpMyAdmin SQL Dump
-- version 4.4.11
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Nov 02, 2015 at 01:43 PM
-- Server version: 5.5.46-0ubuntu0.14.04.2
-- PHP Version: 5.5.9-1ubuntu4.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `trackit_prod`
--

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE IF NOT EXISTS `comments` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `review_id` int(11) NOT NULL,
  `text` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE IF NOT EXISTS `reviews` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `rating_up` int(11) NOT NULL,
  `rating_down` int(11) NOT NULL,
  `rating_speed` int(1) NOT NULL,
  `rating_responsibility` int(1) NOT NULL,
  `rating_quality` int(1) NOT NULL,
  `rating_summary` int(1) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `parent_id`, `user_id`, `rating_up`, `rating_down`, `rating_speed`, `rating_responsibility`, `rating_quality`, `rating_summary`) VALUES
(1, 1, 2, 22, 3, 5, 4, 3, 4),
(2, 0, 1, 0, 0, 0, 0, 0, 0),
(3, 0, 1, 0, 0, 0, 0, 0, 0),
(4, 0, 1, 0, 0, 5, 5, 5, 5),
(5, 0, 1, 0, 0, 5, 5, 5, 5),
(6, 0, 1, 0, 0, 0, 0, 0, 0),
(7, 0, 1, 0, 0, 0, 0, 0, 0),
(8, 69, 1, 0, 0, 3, 3, 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `reviews_rating`
--

CREATE TABLE IF NOT EXISTS `reviews_rating` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `rating_up` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `reviews_text`
--

CREATE TABLE IF NOT EXISTS `reviews_text` (
  `id` int(11) NOT NULL,
  `review_id` int(11) NOT NULL,
  `text` longtext NOT NULL,
  `language_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='Тексты обзоров и комментариев';

--
-- Dumping data for table `reviews_text`
--

INSERT INTO `reviews_text` (`id`, `review_id`, `text`, `language_id`) VALUES
(1, 1, 'Заказ был выполнени идеально, товар хороший, пригодный для эксплуатации по назначению.', 1),
(2, 1, 'English review', 2),
(3, 5, 'eryery', 1),
(4, 6, 'eryery', 1),
(5, 7, 'eryery', 1),
(6, 8, 'ghk', 1);

-- --------------------------------------------------------

--
-- Table structure for table `shoplist_tag`
--

CREATE TABLE IF NOT EXISTS `shoplist_tag` (
  `id` int(10) NOT NULL,
  `shop_id` int(10) DEFAULT NULL,
  `tag` int(10) DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=203 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `shoplist_tag`
--

INSERT INTO `shoplist_tag` (`id`, `shop_id`, `tag`) VALUES
(1, 23, 1),
(2, 23, 2),
(3, 23, 3),
(4, 23, 4),
(5, 4, 1),
(6, 4, 5),
(7, 4, 6),
(8, 4, 7),
(9, 4, 8),
(10, 4, 3),
(11, 26, 9),
(12, 17, 1),
(13, 17, 5),
(14, 17, 6),
(15, 17, 7),
(16, 17, 3),
(17, 17, 2),
(18, 17, 8),
(19, 17, 4),
(20, 17, 9),
(21, 17, 10),
(22, 17, 11),
(23, 3, 1),
(24, 3, 4),
(25, 3, 5),
(26, 3, 6),
(27, 3, 7),
(28, 3, 8),
(29, 3, 11),
(30, 3, 12),
(31, 3, 13),
(32, 3, 14),
(33, 3, 15),
(34, 3, 16),
(35, 3, 17),
(36, 3, 18),
(37, 3, 19),
(38, 2, 15),
(39, 2, 12),
(40, 2, 13),
(41, 2, 18),
(42, 2, 19),
(43, 2, 17),
(44, 2, 5),
(45, 2, 6),
(46, 2, 11),
(47, 2, 4),
(48, 2, 16),
(49, 2, 7),
(50, 2, 8),
(51, 2, 20),
(52, 5, 15),
(53, 5, 12),
(54, 5, 18),
(56, 5, 16),
(57, 5, 1),
(58, 5, 6),
(59, 5, 5),
(60, 5, 8),
(61, 5, 11),
(62, 5, 17),
(63, 5, 19),
(64, 5, 7),
(65, 5, 2),
(66, 5, 3),
(67, 6, 21),
(68, 6, 12),
(69, 6, 15),
(70, 6, 14),
(71, 6, 18),
(72, 6, 13),
(73, 6, 16),
(74, 6, 17),
(75, 6, 11),
(76, 6, 19),
(77, 6, 22),
(78, 7, 21),
(79, 8, 15),
(81, 8, 16),
(82, 8, 13),
(83, 8, 12),
(84, 8, 7),
(85, 8, 8),
(86, 8, 11),
(87, 8, 18),
(88, 8, 17),
(89, 8, 19),
(90, 9, 15),
(91, 9, 12),
(92, 9, 8),
(93, 9, 17),
(94, 9, 13),
(95, 9, 16),
(96, 9, 18),
(97, 9, 11),
(98, 9, 19),
(99, 9, 6),
(100, 10, 21),
(101, 11, 25),
(102, 11, 24),
(103, 11, 23),
(104, 11, 26),
(105, 11, 27),
(106, 11, 4),
(107, 12, 1),
(108, 12, 10),
(109, 12, 11),
(110, 12, 15),
(111, 12, 13),
(112, 12, 12),
(113, 12, 14),
(114, 12, 19),
(115, 12, 7),
(116, 12, 8),
(117, 12, 2),
(118, 12, 16),
(119, 12, 22),
(120, 12, 5),
(121, 12, 6),
(122, 13, 12),
(123, 13, 13),
(124, 13, 14),
(125, 13, 15),
(126, 13, 16),
(127, 13, 7),
(128, 13, 8),
(129, 13, 18),
(130, 13, 19),
(131, 13, 11),
(132, 13, 1),
(133, 13, 5),
(134, 13, 6),
(135, 13, 28),
(136, 14, 1),
(137, 14, 5),
(138, 14, 6),
(139, 14, 3),
(140, 14, 8),
(141, 14, 2),
(142, 15, 15),
(143, 15, 12),
(144, 15, 8),
(145, 15, 11),
(146, 15, 16),
(147, 15, 17),
(148, 15, 19),
(149, 18, 4),
(150, 19, 15),
(151, 19, 12),
(152, 19, 13),
(153, 19, 16),
(154, 19, 1),
(155, 19, 5),
(156, 19, 6),
(157, 19, 3),
(158, 19, 20),
(159, 19, 8),
(160, 19, 7),
(161, 19, 4),
(162, 19, 11),
(163, 19, 17),
(164, 19, 19),
(165, 19, 28),
(166, 20, 12),
(167, 20, 15),
(168, 20, 11),
(169, 20, 18),
(170, 20, 4),
(171, 20, 1),
(172, 20, 5),
(173, 20, 6),
(174, 20, 13),
(175, 20, 16),
(176, 20, 22),
(177, 20, 17),
(178, 20, 7),
(179, 20, 29),
(180, 24, 11),
(181, 24, 17),
(182, 24, 28),
(183, 24, 4),
(184, 24, 9),
(185, 24, 7),
(186, 24, 25),
(187, 25, 19),
(188, 25, 30),
(189, NULL, NULL),
(190, 28, 19),
(191, 28, 1),
(192, 31, 21),
(193, 242, 32),
(194, 242, 33),
(195, 242, 34),
(196, 242, 35),
(197, 242, 36),
(198, 242, 37),
(199, 242, 11),
(200, 242, 28),
(201, 242, 14),
(202, 242, 4);

-- --------------------------------------------------------

--
-- Table structure for table `shoplist_tag_list`
--

CREATE TABLE IF NOT EXISTS `shoplist_tag_list` (
  `id` int(10) NOT NULL,
  `category` int(10) DEFAULT NULL,
  `RU` text COLLATE utf8_unicode_ci NOT NULL,
  `EN` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `shoplist_tag_list`
--

INSERT INTO `shoplist_tag_list` (`id`, `category`, `RU`, `EN`) VALUES
(1, NULL, 'Одежда', 'Clothes'),
(2, NULL, 'Обувь', 'Shoes'),
(3, NULL, 'Сумки', 'Bags'),
(4, NULL, 'Красота и уход', 'Beauty and care'),
(5, NULL, 'Женская одежда', 'Women''s clothes'),
(6, NULL, 'Мужская одежда', 'Men''s clothes'),
(7, NULL, 'Украшения', 'Jewelry'),
(8, NULL, 'Часы', 'Watches'),
(9, NULL, 'Детская одежда', 'Kids clothes'),
(10, NULL, 'Свадьбы и праздники', 'Wedding & Events'),
(11, NULL, 'Домашние принадлежности', 'Housekeeping accessories'),
(12, NULL, 'Компьютерная техника', 'Computer electronics'),
(13, NULL, 'Бытовая электроника', 'Consumer electronics'),
(14, NULL, 'Электрические приборы', 'Electrical tools'),
(15, NULL, 'Мобильные телефоны и гаджеты', 'Mobile phones & gadgets'),
(16, NULL, 'Автомобильные гаджеты', 'Car gadgets'),
(17, NULL, 'Хобби и игрушки', 'Hobby & toys'),
(18, NULL, 'Свет и освещение', 'Light and lighting'),
(19, NULL, 'Спортивные товары', 'Sporting goods'),
(20, NULL, 'Товары для взрослых', 'Adult goods'),
(21, NULL, 'Электронные сигареты', 'E-cigarettes and accessories'),
(22, NULL, 'Фотоаппараты и аксессуары', 'Photography'),
(23, NULL, 'БАДы', 'Supplements'),
(24, NULL, 'Травы и не традиционная медицина', 'Herbs & alternative medicine'),
(25, NULL, 'Продукты питания', 'Foodstuff'),
(26, NULL, 'Витамины и медицинские препараты', 'Vitamin & drugs'),
(27, NULL, 'Товары для животных', 'Products for pets'),
(28, NULL, 'Подарочные товары', 'Gifts'),
(29, NULL, 'Музыкальные инструменты', 'Musical instruments'),
(30, NULL, 'Велосипеды и аксессуары', 'Cycles & accessory'),
(31, NULL, 'Unsorted', 'Unsorted'),
(0, NULL, 'Неотсортированные', 'Unsorted'),
(32, NULL, 'Книги', 'Books'),
(33, NULL, 'Товары для детей', 'Kids goods'),
(34, NULL, 'Игры', 'Games'),
(35, NULL, 'Видеоигры и программы', 'Videogames and soft'),
(36, NULL, 'Канцелярские товары', 'Stationery\r\n	\r\n'),
(37, NULL, 'Видео', 'Video'),
(38, NULL, 'Туризм и отдых', 'Tourism and rest');

-- --------------------------------------------------------

--
-- Table structure for table `shop_names`
--

CREATE TABLE IF NOT EXISTS `shop_names` (
  `id` int(10) NOT NULL,
  `title` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `link` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `country` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` int(2) NOT NULL,
  `affiliate` tinyint(1) DEFAULT NULL,
  `additional` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contacts` longtext COLLATE utf8_unicode_ci,
  `text` longtext COLLATE utf8_unicode_ci,
  `adress` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `productlist` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EN` longtext COLLATE utf8_unicode_ci,
  `RU` longtext COLLATE utf8_unicode_ci,
  `shipping` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  `payment_accepted` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=275 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `shop_names`
--

INSERT INTO `shop_names` (`id`, `title`, `link`, `country`, `type`, `affiliate`, `additional`, `contacts`, `text`, `adress`, `productlist`, `EN`, `RU`, `shipping`, `payment_accepted`) VALUES
(1, 'Aliexpress', 'http://www.aliexpress.com/', 'CN', 0, 1, '', '', NULL, '', '', '<p> <b> Aliexpress </b> - One of the biggest and most developed Chinese marketplaces which selling goods for export. At <b> Aliexpress </b> present mostly Chinese sellers, and all the goods are exported. Usually all good are new. <b> Aliexpress </b> serves only as marketplace and does not sell anything itself, so all responsibility for the goods is on particular dealer. </p>\r\n<p>\r\nThe main feature of this marketplace is that the marketplace is trying to minimize risk of the buyer, speaking arbiter of each transaction. The seller receives his funds earned only if the transaction is completed successfully, and the buyer does not claim (as a rule, this is expressed in buyers feedback ot after expiration of transactions time). </p>\r\n<p> The range of goods is extensive, but the main prducts are household goods: clothing and electronics. </p> ', '<p><b>Aliexpress</b> - Одна из главных и наиболее развитых китайских торговых площадок, продающих товары на экспорт. На <b>Aliexpress</b>  присутствуют в основном китайские продавцы, а весь товар идет на экспорт. Как правило весь товар новый. <b>Aliexpress</b> выступает только площадкой и сам товаров не продает, поэтому ответственность за товар несет конкретный продавец.</p>\r\n<p>\r\nГлавная особенность этой площадки заключается в том, что площадка старается минимизировать риски покупателя, выступая арбитром в каждой сделке. Продавец получает заработанные средства только в том случае, если сделка завершилась удачно и у покупателя нет претензий (как правило это выражается в виде отзыва или в истечении времени сделки).</p>\r\n<p>Ассортимент товаров обширный, но основу составляют бытовые товары: одежда и электроника.</p>', '{"INC":["SOR"]}', 'Credit Card [Visa,Mastercard,Maestro], Western Union, Wire Transfer, Qiwi Wallet , Yandex Money, Webmoney, Boleto Bancário, Debito Online, Mercado Pago, Doku'),
(2, 'Banggood.com', 'http://www.banggood.com/', 'CN', 1, 1, '', '', NULL, '', '', '<p><b>Banggood</b> - Chinese mall specializing on products across a wide range of categories including: apple accessories, cell phones, electronics, RC toys, LED lights, clothing, beauty, jewelry, and watches.</p>', '<p><b>Banggood</b> - Китайский магазин специализирующийся на товарах личного потребления, видео играх, компьтерных аксессуарах, мобильных телефонах, одежде, товароах длядома и сада, ювелирных изделиях, электронике, авто аксессуарах, радиоуправляемых моделях.</p>\r\n\r\n<p><b>Banggood</b> работает с 2004 года и имеет 4 офиса в Китае и Гонконге с более чем 1000 сотрудников от службы. Вся команда магазина настроенане предоставление самых низких цен, товаров высочайшего качества и профессионального сервиса для своих покупателей.</p>\r\n\r\n<p><b>Banggood</b> предлагает более 70 тысяч товаров в категориях: аксессуары Apple, сотовые теоефоны, электроника, радиоуправляемые модели, освещение, одежда, юведирные изделия, часы.</p>', '{"INC":["WW"]}', 'Credit Card [Visa, Mastercard, JCB], Wire Transfer, Paypal, Western Union, Boleto Bancário, Webmoney, Qiwi Wallet, '),
(3, 'Dealextreme / DX', 'http://www.dx.com/', 'CN', 1, 1, '', '', NULL, '', '', '', '', '{"INC":["WW"]}', 'Credit Card [Visa, Mastercard, AmEx], Webmoney, Paypal, Diners, Discover, Ebanx, iDeal, Boleto'),
(4, 'Dresslily', 'http://www.dresslily.com/', 'CN', 1, 1, '', '', NULL, '', '', '', '<p><b>Dresslily</b> - ведущий Китайский международный магазин модной одежды и аксессуаров, сосредоточенный на  самых последних веяниях модных стилей. </p>\r\n\r\n<p><b>Dresslily</b> предлагает тысячи новейших  продуктовых линий с максимальным выбором товара начиная с женской одежды, интимного белья, сумок, женской обуви, париков и заканчивая можной бижутерией и многими другими фантастическими вещами по доступным ценам.</p>', '{"INC":["WW"]}', 'Credit Card [via Paypal], Paypal'),
(5, 'Everbuying', 'http://www.everbuying.net/', 'CN', 1, 1, '', '', NULL, '', '', '', '', '{"INC":["WW"]}', 'Credit Card [via Paypal], Paypal, Wire Transfer, Western Union'),
(6, 'Fasttech', 'http://www.fasttech.com/', 'CN', 1, 1, '', '', NULL, '', '', '', '', 'WW', 'Credit Card [via Paypal], Paypal'),
(7, 'Focalecig', 'http://www.focalecig.com/', 'CN', 1, 1, '', '', NULL, '', '', '', '', 'WW', 'Credit Card [via Paypal], Paypal'),
(8, 'Focalprice', 'http://www.focalprice.com/', 'CN', 1, 1, '', '', NULL, '', '', '', '', 'WW', 'Credit Card [via Paypal], Paypal, Webmoney, Boleto'),
(9, 'Gearbest', 'http://www.gearbest.com/', 'CN', 1, 1, '', '', NULL, '', '', '', '', 'WW', NULL),
(10, 'Healthcabin', 'http://www.healthcabin.net/', 'CN', 1, 1, '', '', NULL, '', '', 'E-cigarette supplier', '', 'WW', NULL),
(11, 'Iherb', 'http://www.iherb.com/', 'US', 1, 1, '', '', NULL, '', '', '', '', 'WW', 'Credit Card'),
(12, 'Light in the box', 'http://www.lightinthebox.com/', 'CN', 1, 1, '', '', NULL, '', '', '', '', 'WW', 'Credit Card [Visa, Mastercard, AmEx, Solo], Yandex money, Paypal, Qiwi Wallet , Webmoney, Wire transfer'),
(13, 'Mini in the box', 'http://www.miniinthebox.com/', 'CN', 1, 1, '', '', NULL, '', '', '', '', 'WW', 'Credit Card [Visa, Mastercard, AmEx, Solo], Yandex money, Paypal, Qiwi Wallet , Webmoney, Wire transfer'),
(14, 'Minitake', 'http://www.minitake.com/', 'CN', 1, 1, '', '', NULL, '', '', '', '', 'WW', 'Credit Card [Visa, Mastercard, JCB], Yandex money, Paypal, Qiwi Wallet , Webmoney'),
(15, 'Pandawill', 'http://www.pandawill.com', 'CN', 1, 1, '', '', NULL, '', '', '', '', '{"INC":["WW"]}', 'Credit Card [via Paypal], Paypal'),
(16, 'Priceangels', 'http://www.priceangels.com', 'CN', 1, 1, '', '', NULL, '', '', '', '', 'WW', 'Credit Card [via Paypal], Paypal, PayAnyWay, Ebanx, Webmoney, Western Union, Wire Transfer'),
(17, 'Sammydress', 'http://www.sammydress.com', 'HK', 1, 1, '', '', NULL, '', '', '', '', 'WW', 'Credit Card [via Paypal], Paypal, Western Union, Wire Transfer'),
(18, 'Strawberrynet', 'http://www.strawberrynet.com', 'HK', 1, 1, '', '', NULL, '', '', '', '', 'WW', 'Credit Card [Visa, Mastercard, AmEx, Discover, JCB, Diners], Paypal, '),
(19, 'Tinydeal', 'http://www.tinydeal.com', 'HK', 1, 1, '', '', NULL, '', '', '', '', 'WW', 'Credit Card [via Paypal], Paypal, Yandex money, Webmoney'),
(20, 'Tomtop', 'http://www.tomtop.com', 'CN', 1, 1, '', '', NULL, '', '', '', '<p><b>Tomtop</b> - надежный Китайский оптово-розничный магазин с различными продуктами высокого качества по лучшим ценам и купонам. Tomtop продает в основном товары личного потребления и специализируется на видео играх, компьтерных аксессуарах, мобильных телефонах, одежде, товароах длядома и сада, ювелирных изделиях, электронике, авто аксессуарах, радиоуправляемых моделях.</p>\r\n\r\n<p><b>Tomtop</b> - является рекомендованнымпродавцом Aliexpress и предлагает 1 год гарантии на всю продукцию представленную в магазине.</p>', '{"INC":["WW"]}', 'Credit Card [via Paypal], Paypal, Wite Transfer'),
(21, 'Tmart', 'http://www.tmart.com', 'HK', 1, 1, '', '', NULL, '', '', '', '', 'WW', 'Credit Card [via Paypal], Paypal, Qiwi Wallet, Webmoney, Skrill'),
(22, 'Bestbuy', 'http://www.bestbuy.com/', 'US', 2, NULL, '', '', NULL, '', '', '', '', '{"INC":["US"]}', 'Credit Card [BestBuy, Visa, Mastercard, Discover, JCB, Diners], Paypal'),
(23, 'Asos', 'http://www.asos.com/', 'GB', 1, 1, '', '', NULL, '', '', '', '<p><b>Asos</b> -  Английский магазин, специализирующийся на продаже брендовой одежды, обуви и аксессуаров.</p>\r\n\r\n<p><b>Asos</b> работает c 2000 года и предлагает более 50000 наименований товаров, которые включают в себя мужскую и женскую одежду, обувь, аксессуары, украшения и косметики. Товары ориентированы на молодых людей разбирающихся в моде.</p>', '{"INC":["WW"]}', 'Credit Card [Visa, Mastercard, AmEx, Laser, Maestro, Delta, Solo, Ideal], Paypal'),
(24, 'PerpetualKid', 'http://www.perpetualkid.com', 'US', 1, 1, '', '', NULL, '', '', '', '', '{"INC":["US","WW:Globalshipex"]}', 'Credit Card [Visa, Mastercard, AmEx, Discover], Paypal'),
(25, 'Wiggle', 'http://www.wiggle.co.uk', 'GB', 1, 1, '', '', NULL, '', '', '', '', 'WW', NULL),
(26, 'Babyleggings', 'http://www.babyleggings.com/', 'US', 1, 1, '', '', NULL, '', '', '', '', NULL, NULL),
(27, 'Computeruniverse', 'http://www.computeruniverse.net/', 'DE', 1, 0, '', '', NULL, '', '', '', '<p><b>Computeruniverse</b> -  Немецкий магазин, специализирующийся на продаже компьютерной электроники и программного обеспечения.</p>\r\n\r\n<p><b>Computeruniverse</b> работает на компьютерном рынке более 12 лет и предлагает более 130000 товаров, включая ноутбуки,компьютеры, программное обеспечение, фото и видеокамеры, телевизоры и высококачественные акустические системы (хай фай), телефоны, навигационные системы, офисная техника, электроприборы, память, a так же фильмы и видеоигры.</p>\r\n\r\n<p>Воспользуйтесь нашим кодом FWHKTVG и получите 5EUR скидку на свою первую покпку.</p>', 'WW', 'Credit Card, Paypal, Wire Transfer, Giro Card:DE'),
(28, 'Canterbury', 'http://www.canterbury.com/', 'GB', 2, NULL, '', '', NULL, '', '', '', '', 'WW', ''),
(29, 'Topshop', 'http://www.topshop.com/', 'GB', 1, 1, '', '', NULL, '', '', '', '', '', ''),
(30, 'Flipcart', 'http://www.flipkart.com/', 'IN', 0, NULL, '', '', NULL, '', '', '', '', 'IN', 'Credit Card'),
(31, 'UK Ecig Store', 'http://www.ukecigstore.com/', 'GB', 1, NULL, '', '', NULL, '', '', 'UK e-cigarette supplier. In stock over 300 products from leading internationally certified manufacturers.', '', 'WW', ''),
(32, '6pm', 'http://www.6pm.com/', 'US', 1, NULL, '', '', NULL, '', '', '', '', '', ''),
(33, 'Alibaba', 'http://www.alibaba.com/', 'CN', 0, NULL, '', '', NULL, '', '', '', '', '', ''),
(34, 'Allegro', 'http://www.allegro.pl/', 'PL', 0, NULL, '', '', NULL, '', '', '', '', '', ''),
(35, 'Aukro', 'http://www.aukro.ua/', 'UA', 0, NULL, '', '', NULL, '', '', '', '', '', ''),
(36, 'Ay', 'http://www.ay.by/', 'BY', 0, NULL, '', '', NULL, '', '', '', '', '', ''),
(37, 'Bodybuilding.com', 'http://www.bodybuilding.com/', 'US', 1, 1, '', '', NULL, '', '', '', '', '', ''),
(38, 'Byttdekk', 'http://www.byttdekk.com/', 'NO', 1, NULL, '', '', NULL, '', '', '', '', '', ''),
(39, 'Chain Reaction Cycles', 'http://www.chainreactioncycles.com/', 'IE', 1, 1, '', '', NULL, '', '', '', '', 'WW', ''),
(40, 'Cigabuy', 'http://www.cigabuy.com/', 'CN', 1, NULL, '', '', NULL, '', '', '', '', 'WW', ''),
(41, 'Coolicool', 'http://www.coolicool.com/', 'CN', 1, 1, '', '', NULL, '', '', '', '', 'WW', ''),
(42, 'Coverlab', 'http://www.coverlab.ru', 'RU', 2, NULL, '', '', NULL, '', '', '', '', 'WW', ''),
(43, 'Cycling-monton', 'http://www.cycling-monton.com/', 'CN', 1, 1, '', '', NULL, '', '', '', '', 'WW', ''),
(44, 'dd4.com', 'http://www.dd4.com/', 'CN', 1, 1, '', '', NULL, '', '', '', '', 'WW', ''),
(45, 'Deal.by', 'http://deal.by/', 'BY', 0, NULL, '', '', NULL, '', '', '', '', '', ''),
(46, 'Dealsmachine', 'http://www.dealsmachine.com/', 'CN', 1, 1, '', '', NULL, '', '', '', '', '', ''),
(47, 'DHgate.com', 'http://www.dhgate.com/', 'CN', 0, 0, '', '', NULL, '', '', '', '', 'WW', ''),
(48, 'Dracula clothing', 'http://www.draculaclothing.com/', 'CZ', 0, 0, '', '', NULL, '', '', '', '', 'WW', ''),
(49, 'Easy Shopping Home', 'http://www.easyshoppinghome.com/', 'CN', 1, NULL, '', '', NULL, '', '', '', '', '', ''),
(50, 'Ebay Germany', 'http://www.ebay.de/', 'DE', 0, 1, '', '', NULL, '', '', '', '', '', ''),
(51, 'Ebay France', 'http://www.ebay.fr/', 'FR', 0, 1, '', '', NULL, '', '', '', '', '', ''),
(52, 'Ebay UK', 'http://www.ebay.co.uk/', 'GB', 0, 1, '', '', NULL, '', '', '', '', '', ''),
(53, 'Amazon Germany', 'http://www.amazon.de/', 'DE', 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(54, 'Молоток', 'http://www.molotok.ru/', 'RU', 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(55, 'Etsy', 'http://www.etsy.com', 'US', 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(56, 'Exduct', 'http://www.exduct.com/', 'CN', 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(57, 'EyeCandy''s', 'http://www.eyecandys.com/', 'HK', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'WW', NULL),
(58, 'FragranceX', 'http://www.fragrancex.com/', 'US', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(59, 'Gmarket', 'http://www.gmarket.co.kr/', 'KR', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(60, 'Hobbyking', 'http://www.hobbyking.com/', 'HK', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(61, 'iOffer', 'http://www.ioffer.com', 'US', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(62, 'Mercado Libre', 'http://www.mercadolibre.com.mx/', 'MX', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(63, 'Mercado Livre', 'http://www.mercadolivre.com.br/', 'BR', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(64, 'Minideal', 'http://www.minideal.net/', 'CN', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(65, 'Next Direct', 'http://www.nextdirect.com/', 'GB', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(66, 'Officielmania', 'http://officielmania.com/', 'FR', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(67, 'Rakuten USA', 'http://www.rakuten.com/', 'US', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(68, 'Slanet', 'http://www.slanet.by/', 'BY', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(69, 'Souq.com', 'http://www.souq.com/', 'AE', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(70, 'Sun-gold', 'http://sun-gold.org/', 'RU', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(71, 'Sunsky', 'http://www.sunsky-online.com/', 'CN', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(72, 'Taobao', 'http://www.taobao.com/', 'CN', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(73, 'Tarot', 'http://www.tarot-rc.com/', 'CN', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(74, 'Товары и Услуги', 'http://www.tiu.ru/', 'RU', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(75, 'to2c', 'http://www.to2c.com/', 'CN', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(76, 'Vickmall', 'http://www.vickmall.com/', 'CN', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(77, 'Wish', 'http://www.wish.com/', 'US', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(78, 'Yoox', 'http://www.yoox.com/', 'IT', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(79, 'Bondi Sands', 'http://www.bondisands.co.uk/', 'AU', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(80, 'Expert', 'http://www.expert.no/', 'NO', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(81, 'Ibuygou', 'http://www.ibuygou.com/', 'CN', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(82, 'Adore Me', 'http://www.adoreme.com/', 'US', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(83, 'Victoria''s Secret', 'http://www.victoriassecret.com/', 'US', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(84, 'Ghostbikes', 'http://www.ghostbikes.com/', 'GB', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(85, 'Jinx', 'http://www.jinx.com/', 'US', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(86, 'My Habit', 'http://www.myhabit.com', 'US', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(87, '011 Shop', 'http://www.011shop.rs/', 'RS', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(88, '1800 Contacts', 'http://www.1800contacts.com/', 'US', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(89, 'Zenni Optical', 'http://www.zennioptical.com/', 'US', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(90, 'ZebraLight', 'http://www.zebralight.com/', 'US', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(91, 'Guess', 'http://www.guess.eu/', 'CH', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(92, 'Yogamatters', 'http://www.yogamatters.com/', 'GB', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(93, 'Lazada', 'http://www.lazada.co.th/', 'TH', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(94, '409shop', 'http://www.409shop.com/', 'HK', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(95, '4noggins', 'http://www.4noggins.com/', 'US', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(96, '6dollarshirts', 'http://www.6dollarshirts.com/', 'US', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(97, 'East Dane', 'http://www.eastdane.com/', 'US', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(98, 'Childrensalon', 'http://www.childrensalon.com/', 'GB', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(99, 'AlexandAlexa', 'http://www.alexandalexa.com/', 'GB', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(100, 'Anyc Online', 'http://www.anyconline.com/', 'US', 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(101, 'Art.com', 'http://www.art.com/', 'US', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(102, 'American Eagle Outfitter', 'http://www.ae.com/', 'US', 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(103, '8 ball webstore', 'http://www.8ballwebstore.com/', 'US', 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(104, '80s Tees', 'http://www.80stees.com/', 'US', 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(105, '8 Seasons', 'http://www.8seasons.com/', 'CN', 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(106, 'Herring Shoes', 'http://www.herringshoes.co.uk/', 'GB', 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(107, 'A Main.com', 'http://www.amain.com/', 'US', 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(108, 'A Quarter Of', 'http://www.aquarterof.co.uk/', 'GB', 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(109, 'Zest Essentials', 'http://www.zestessentials.com/', 'GB', 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(110, 'Chatham Marine', 'http://www.chatham.co.uk/', 'GB', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(111, 'Chemist Direct', 'http://www.chemistdirect.co.uk/', 'GB', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(112, 'AbeBooks', 'http://www.abebooks.com/', 'US', 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(113, 'AC Lens', 'http://www.aclens.com/', 'US', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(114, 'Active Instinct', 'http://www.activinstinct.com/', 'GB', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(115, 'Adams Kids', 'http://adams.co.uk/', 'GB', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(116, 'Surfdome', 'http://www.surfdome.com/', 'GB', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(117, 'End', 'http://www.endclothing.co.uk/', 'GB', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(118, 'H&H Shop', 'http://www.h-h-shop.com/', 'IT', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(119, 'Adorama', 'http://www.adorama.com/', 'US', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(120, 'Aeropostale', 'http://www.aeropostale.com/', 'US', 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(121, 'Teavivre', 'http://www.teavivre.com/', 'CN', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(122, 'Amoralia', 'http://www.amoralia.com/', 'GB', 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(123, 'All Battery', 'http://www.all-battery.com/', 'US', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(124, 'All Sole', 'http://www.allsole.com/', 'GB', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(125, 'Allike Mailorder', 'http://www.allikestore.com/', 'DE', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(126, 'Alpaca Mall', 'http://www.alpacamall.com/', 'BO', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(127, 'Panama Hat Mall', 'http://www.panamahatmall.com/', 'EC', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(128, 'Brazilian Bikini Mall', 'http://www.brazilianbikinimall.com/', 'BR', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(129, 'Belk', 'http://www.belk.com/', 'US', 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'US', NULL),
(130, 'Suara Music', 'http://www.suara-store.com/', 'ES', 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(131, 'eBags', 'http://www.ebags.com/', 'US', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(132, 'Zappos', 'http://www.zappos.com/', 'US', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(133, 'Nordstrom', 'http://www.nordstrom.com/', 'US', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(134, 'Bon-Ton', 'http://www.bonton.com/', 'US', 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(135, 'Lord & Taylor', 'http://www.lordandtaylor.com/', 'US', 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(136, 'Apotheke', 'http://www.apotheke.de/', 'DE', 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(137, 'Amazon', 'http://www.amazon.com/', 'US', 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(138, 'Amazon France', 'http://www.amazon.fr/', 'FR', 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(139, 'Amazon UK', 'http://www.amazon.co.uk/', 'GB', 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(140, 'Amazon Japan', 'http://www.amazon.co.jp/', 'JP', 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(141, 'Amazon Australia', 'http://www.amazon.com.au/', 'AU', 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(142, 'Amazon Brazil', 'http://www.amazon.com.br/', 'BR', 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(143, 'Amazon China', 'http://www.amazon.cn', 'CN', 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(144, 'Amazon India', 'http://www.amazon.in', 'IN', 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(145, 'Amazon Italy', 'http://www.amazon.it', 'IT', 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(146, 'Amazon Canada', 'http://www.amazon.ca', 'CA', 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(147, 'Amazon Mexico', 'http://www.amazon.mx', 'MX', 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(148, 'Amazon Netherlands', 'http://www.amazon.nl', 'NL', 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(149, 'Amazon Austria', 'http://www.amazon.at', 'AT', 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(150, 'Amazon Spain', 'http://www.amazon.es', 'ES', 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(151, 'Aquaristic.net', 'http://www.aquaristic.net/', 'DE', 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(152, 'Aquaristik Shop', 'http://www.aquaristikshop.com/', 'DE', 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(153, 'Gear-source', 'http://www.gearsource.com/', 'US', 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(154, 'Gear-Source Europe', 'http://www.gearsourceeurope.com/', 'GB', 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(155, 'Goggles 4u ', 'http://www.goggles4u.com/', 'US', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(156, 'Argento', 'http://www.argento.co.uk/', 'GB', 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(157, 'The Great Divide', 'http://thegreat-divide.com/', 'GB', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(158, 'Shoe Metro', 'http://www.shoemetro.com/', 'US', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(159, 'Revolve Russia', 'http://www.revolveclothing.ru/', 'RU', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(160, 'Revolve', 'http://www.revolveclothing.com/', 'US', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(161, 'Bike 24', 'http://www.bike24.de/', 'DE', 1, 0, NULL, '{"address":[{"value":"Bike24 Store, Kesselsdorfer Stra\\u00dfe 11, 01159 Dresden, Germany","title":"Store","worktime":"Mon-Fri: 10:00 am - 08:00 pm, Sat: 09:00 am - 04:00 pm"},{"value":"Bike24 GmbH, Retourenabteilung, Breitscheidstr. 40, 01237 Dresden, Germany","title":"Return address"}],"phone":[{"value":"+49 (0) 351 \\/ 417 497 - 50"}],"fax":[{"value":"+49 (0) 351 \\/ 417 497 - 79"}],"email":[{"value":"info@bike24.net"}],"worktime":"Mon-Fri: 09:00 am - 08:00 pm, Sat: 09:00 am - 04:00 pm"}', '{"text":{"RU":"<p>\\u041d\\u0435\\u043c\\u0435\\u0446\\u043a\\u0438\\u0439 \\u043e\\u043d\\u043b\\u0430\\u0439\\u043d \\u043c\\u0430\\u0433\\u0430\\u0437\\u0438\\u043d Bike24.de, \\u0441\\u043f\\u0435\\u0446\\u0438\\u0430\\u043b\\u0438\\u0437\\u0438\\u0440\\u0443\\u0435\\u0442\\u0441\\u044f \\u043d\\u0430 \\u043f\\u0440\\u043e\\u0434\\u0430\\u0436\\u0435 \\u0441\\u043f\\u043e\\u0440\\u0442\\u0438\\u0432\\u043d\\u044b\\u0445 \\u0442\\u043e\\u0432\\u0430\\u0440\\u043e\\u0432. \\u041d\\u0435 \\u0441\\u043c\\u043e\\u0442\\u0440\\u044f \\u043d\\u0430 \\u043d\\u0430\\u0437\\u0432\\u0430\\u043d\\u0438\\u0435, \\u0432 \\u043a\\u0430\\u0442\\u0430\\u043b\\u043e\\u0433\\u0430\\u0445 Bike24.de\\n\\u043f\\u0440\\u0438\\u0441\\u0443\\u0442\\u0441\\u0442\\u0432\\u0443\\u044e\\u0442 \\u043d\\u0435 \\u0442\\u043e\\u043b\\u044c\\u043a\\u043e \\u0432\\u0435\\u043b\\u043e\\u0442\\u043e\\u0432\\u0430\\u0440\\u044b, \\u043d\\u043e \\u0442\\u0430\\u043a\\u0436\\u0435 \\u0442\\u043e\\u0432\\u0430\\u0440\\u044b \\u0434\\u043b\\u044f \\u0431\\u0435\\u0433\\u0430, \\u043f\\u043b\\u0430\\u0432\\u0430\\u043d\\u0438\\u044f, \\u0442\\u0440\\u0438\\u0430\\u0442\\u043b\\u043e\\u043d\\u0430, \\u0444\\u0438\\u0442\\u043d\\u0435\\u0441\\u0430, \\u0438 \\u0438\\u043d\\u0430\\u044f \\u0441\\u043f\\u043e\\u0440\\u0442\\u0438\\u0432\\u043d\\u0430\\u044f \\u0430\\u0442\\u0440\\u0438\\u0431\\u0443\\u0442\\u0438\\u043a\\u0430.<\\/p><p> \\u041c\\u0430\\u0433\\u0430\\u0437\\u0438\\u043d Bik24.de \\u0432\\u044b\\u0441\\u044b\\u043b\\u0430\\u0435\\u0442 \\u0441\\u0432\\u043e\\u0438 \\u0442\\u043e\\u0432\\u0430\\u0440\\u044b:<\\/p><p> \\u041c\\u0430\\u0433\\u0430\\u0437\\u0438\\u043d Bik24.de \\u043f\\u0440\\u0438\\u043d\\u0438\\u043c\\u0430\\u0435\\u0442 \\u043a \\u043e\\u043f\\u043b\\u0430\\u0442\\u0435:<\\/p>","EN":"About Shop"},"creationdate":"1994"}', NULL, NULL, NULL, NULL, NULL, NULL),
(162, 'Astroshop.de', 'http://www.astroshop.de/', 'DE', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(163, 'Look.com', 'http://www.look.com/', 'US', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(164, 'Australian Ugg Boots', 'http://www.australianuggboots.com.au/', 'AU', 3, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(165, 'Design By Humans', 'http://www.designbyhumans.com/', 'US', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(166, 'Australian Native  T-shirts', 'http://www.australian-native.com.au/', 'AU', 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(167, 'Authentic Watches', 'http://www.authenticwatches.com/', 'US', 1, 0, 'http://www.ebay.com/usr/authenticwatches', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(168, 'B&H Foto & Electronics', 'http://www.bhphotovideo.com/', 'US', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(169, 'Ярмарка Мастеров', 'http://www.livemaster.ru/', 'RU', 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(170, 'Baby Curls', 'http://www.babycurls.co.uk/', 'GB', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(171, 'Beauty Bridge', 'http://www.beautybridge.com/', 'US', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(172, 'Beauty Encounter', 'http://www.beautyencounter.com/', 'US', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(173, 'Belgian Chocs', 'http://www.belgianchocs.com/', 'BE', 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(174, 'Beauty Bay', 'http://www.beautybay.com/', 'GB', 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(175, 'Roses & Belts', 'http://www.belts.gr/', 'GR', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(176, 'Ben Sherman', 'http://www.bensherman.com/', 'GB', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(177, 'Moss Bros.', 'http://www.moss.co.uk/', 'GB', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(178, 'The Hut', 'http://www.thehut.com/', 'GB', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(179, 'Need Supply', 'http://www.needsupply.com/', 'US', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(180, 'Royal Cheese', 'http://www.royalcheese.com/', 'FR', 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(181, 'Atom Retro', 'http://www.atomretro.com/', 'GB', 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(182, 'Mode Freund', 'http://www.modefreund.de/', 'DE', 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(183, 'Frontline Shop', 'http://www.frontlineshop.com/', 'DE', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(184, 'Big Shoes', 'http://www.bigshoes.com/', 'GB', 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(185, 'Bigtex', 'http://www.bigtex.de/', 'DE', 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(186, 'Bike-components', 'http://www.bike-components.de/', 'DE', 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(187, 'Bike-discount', 'http://www.bike-discount.de/', 'DE', 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(188, 'Bike Mailorder', 'http://www.bike-mailorder.com/', 'DE', 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(189, 'eChemist', 'http://www.echemist.co.uk/', 'GB', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(190, 'Blue Tomato', 'http://www.blue-tomato.com/', 'DE', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(191, 'Boden', 'http://www.boden.co.uk/', 'GB', 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(192, 'Bodfeld Apotheke', 'http://www.bodfeld-apotheke.de/', 'DE', 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(193, 'Boobox', 'http://www.boobox.co.uk/', 'GB', 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(194, 'Brace shop', 'http://www.braceshop.com/', 'US', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(195, 'Brastop', 'http://www.brastop.com/', 'GB', 1, 1, NULL, '{"address":[{"value":"Unit 1 The Hawthorn Centre, Elmgrove Road, Harrow, United Kingdom, HA1 2RF"}],"phone":[{"value":"+44 (0) 208 861 1945"}],"email":[{"value":"support@brastop.com"}]}', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(196, 'Breffo', 'http://www.breffo.com/', 'US', 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(197, 'Matchesfashion', 'http://www.matchesfashion.com/', 'GB', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(198, 'Brook Taverner', 'http://www.brooktaverner.co.uk/', 'GB', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(199, 'Brooks Brothers', 'http://www.brooksbrothers.com/', 'US', 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(200, 'Bulk Powders', 'http://www.bulkpowders.co.uk/', 'GB', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(201, 'Burbach+Goetz Healthcare Shop', 'http://www.burbach-goetz.com/', 'DE', 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(202, 'Tie Deals', 'http://www.tiedeals.com/', 'US', 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(203, 'Como Milano', 'http://www.comomilano.com/', 'US', 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(204, 'Busted Tees', 'http://www.bustedtees.com/', 'US', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(205, 'Cabela''s', 'http://www.cabelas.com/', 'US', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(206, 'Camping World', 'http://www.campingworld.co.uk/', 'GB', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(207, 'Mr. Porter', 'http://www.mrporter.com/', 'US', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(208, 'OMC Gear', 'http://www.omcgear.com/', 'US', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(209, 'Candy Hero', 'http://www.candyhero.com/', 'GB', 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(210, 'Circle', 'http://www.circle-fashion.com/', 'GB', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(211, 'Canterbury Sheepskin', 'http://www.canterburyleather.com/', 'NZ', 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(212, 'Streetcasuals', 'http://www.streetcasuals.com/', 'GB', 1, 1, 'webgains', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(213, 'Standout.net', 'http://www.stand-out.net/', 'GB', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(214, 'Savile Row Company', 'http://www.savilerowco.com/', 'GB', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(215, 'Carter''s', 'http://www.carters.com/', 'US', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(216, 'Oshkosh', 'http://www.oshkosh.com/', 'US', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(217, 'Casecrown', 'http://www.casecrown.com/', 'US', 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(218, 'Hockey Monkey', 'http://www.hockeymonkey.com/', 'US', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(219, 'Thor Steinar Outler', 'http://www.thorsteinar-outlet.de/', 'DE', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(220, 'Startfitness', 'http://www.startfitness.co.uk/', 'GB', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(221, 'Norse Store', 'http://www.norsestore.com/', 'DK', 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(222, 'Room 29', 'http://www.room29.ca/', 'CA', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(223, 'Johnston & Murphy', 'http://www.johnstonmurphy.com/', 'US', 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(224, 'Hapari', 'http://www.hapari.com/', 'US', 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(225, 'Desio', 'http://www.desiolens.com/', 'IT', 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(226, 'Sjcam', 'http://www.sjcam.com/', 'CN', 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(227, 'Digi-key Electronics', 'http://www.digikey.com/', 'US', 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(228, 'Bonprix', 'http://www.bonprix.ua/', 'UA', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(229, 'Otto', 'http://www.otto.ru/', 'RU', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(230, 'Quelle', 'http://www.quelle.ru/', 'RU', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(231, 'Mvideo', 'http://www.mvideo.ru/', 'RU', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(232, 'Tom Tailor Russia', 'http://www.tom-tailor-online.ru/', 'RU', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(233, 'Voltoff', 'http://www.voltoff.ru/', 'RU', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(234, 'Grandstock', 'http://www.grandstock.ru/', 'RU', 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(235, 'Astia', 'http://astia.ru/', 'RU', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(236, 'Dragon Tea House', 'http://www.dragonteahouse.biz/', 'CN', 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(237, 'Toy.ru', 'http://www.toy.ru/', 'RU', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(238, 'Lamoda', 'http://www.lamoda.ru/', 'RU', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(239, 'Wildberries', 'http://www.wildberries.ru/', 'RU', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(240, 'The Tool Academy', 'http://www.thetoolacademy.com/', 'GB', 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(241, 'Rose We', 'http://www.rosewe.com/', 'CN', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(242, 'Oz', 'http://www.oz.by/', 'BY', 1, 1, NULL, '{"address":[{"value":"OZ Knigi shop, 223012, Minsk, Russiyanova str. 4, Belarus"},{"value":"223012, Minskaya obl, Minskiy r-n, Machulischi city, Aerodromnaya str. 15a, apt. 45, Belarus","title":"Business adress","worktime":"Mon-Fri: 09:00 - 17:30"}],"phone":[{"value":"695-25-25"}]}', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(243, 'Sheinside', 'http://www.sheinside.com/', 'GB', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(244, 'Windeln.de', 'http://www.windeln.de/', 'DE', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(245, 'Meranom', 'http://www.meranom.com/', 'RU', 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(246, 'Maxis Babywelt', 'http://www.maxis-babywelt.de/', 'DE', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(247, 'Igogo', 'http://www.igogo.es/', 'ES', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(248, 'Klekt', 'http://www.klekt.in/', 'DE', 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(249, 'Asklepios Seeds', 'http://www.asklepios-seeds.de/', 'DE', 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(250, 'Chess Bazaar', 'http://www.chessbazaar.com/', 'IN', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(251, 'TVC Mall', 'http://www.tvc-mall.com/', 'CN', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(252, 'My Led', 'http://www.myled.com/', 'HK', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(253, 'T.M. Lewin', 'http://www.tmlewin.co.uk/', 'GB', 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(254, 'Charles Tyrwhitt', 'http://www.ctshirts.co.uk/', 'GB', 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(255, 'Sorepmodels Secrets', 'http://www.supermodel2u.com/store/', 'MY', 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(256, 'Oasap', 'http://www.oasap.com/', 'HK', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(257, 'Childishness', 'http://childishness.co.uk/', 'PL', 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(258, 'Astratex.cz', 'http://www.astratex.cz/', 'CZ', 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(259, 'Hyper Zboží', 'http://www.hyperzbozi.cz/', 'CZ', 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(260, 'Mall.cz', 'http://www.mall.cz/', 'CZ', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(261, 'Mall.sk', 'http://www.mall.sk/', 'SK', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(262, 'Mall.hu', 'http://www.mall.hu/', 'HU', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(265, 'Mall.pl', 'http://www.mall.pl/', 'PL', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(266, 'Mimovrste', 'http://www.mimovrste.com/', 'SI', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(267, '123shop.cz', 'http://www.123shop.cz/', 'CZ', 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(268, 'Kasa.cz', 'http://www.kasa.cz/', 'CZ', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(269, 'Vivantis', 'http://www.vivantis.cz/', 'CZ', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(270, 'Botas Sport', 'http://www.botaska.cz/', 'CZ', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(271, 'Destroy', 'http://www.destroystores.cz/', 'CZ', 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(272, 'Deichmann', 'http://www.deichmann.com/', 'CZ', 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(273, 'Jeans Machine', 'http://www.jeansmachine.cz/', 'CZ', 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(274, 'Podlaski Gabinet Numizmatyczny', 'http://www.pgnum.pl/', 'PL', 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reviews_text`
--
ALTER TABLE `reviews_text`
  ADD PRIMARY KEY (`id`),
  ADD KEY `review_id` (`review_id`);

--
-- Indexes for table `shoplist_tag`
--
ALTER TABLE `shoplist_tag`
  ADD UNIQUE KEY `shop_id` (`shop_id`,`tag`),
  ADD KEY `id` (`id`),
  ADD KEY `tag` (`tag`);

--
-- Indexes for table `shoplist_tag_list`
--
ALTER TABLE `shoplist_tag_list`
  ADD KEY `id` (`id`),
  ADD KEY `category` (`category`);

--
-- Indexes for table `shop_names`
--
ALTER TABLE `shop_names`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `link` (`link`),
  ADD KEY `type` (`type`),
  ADD KEY `shipping` (`shipping`(255)),
  ADD FULLTEXT KEY `country` (`country`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `reviews_text`
--
ALTER TABLE `reviews_text`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `shoplist_tag`
--
ALTER TABLE `shoplist_tag`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=203;
--
-- AUTO_INCREMENT for table `shoplist_tag_list`
--
ALTER TABLE `shoplist_tag_list`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=39;
--
-- AUTO_INCREMENT for table `shop_names`
--
ALTER TABLE `shop_names`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=275;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `reviews_text`
--
ALTER TABLE `reviews_text`
  ADD CONSTRAINT `reviews_text_ibfk_1` FOREIGN KEY (`review_id`) REFERENCES `reviews` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
