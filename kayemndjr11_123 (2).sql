-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 16, 2025 at 04:56 PM
-- Server version: 10.5.22-MariaDB-log
-- PHP Version: 8.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kayemndjr11_123`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_users`
--

CREATE TABLE `admin_users` (
  `admin_id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `admin_users`
--

INSERT INTO `admin_users` (`admin_id`, `username`, `email`, `password`) VALUES
(1, 'kayegm', 'kayegm@gmail.com', '$2y$10$Mzsuk4R.ichKNSH70v4xlON01rPuxI/niJPgP.oXpCQsCwDtIKUgK'),
(2, 'kaye', 'k@gmail.com', '$2y$10$ww6C2t9aVl5WcJC0ZXulxONdgtzTsUVwazGvpuF8lIonCuNOdUoya'),
(3, 'kirby', 'armor@gmail.com', '$2y$10$QXMU5chMWcBt4wibrPKw1u.6ONb6cTkPhVaU196b1dTewgJeEGem.'),
(4, 'PART', 'part@gmail.com', '$2y$10$H.zc.DWAk92SQidqJYOIkucVBXqd.cq4fe3dHEN4HfMNvjrzthvIq'),
(5, 'Jillian', 'jillian@email.com', '$2y$10$2pkHLO1Zz1eZuHEw7S/dZOFNoifsoNuMnLklOTCkxvQ2XbHFjubaG'),
(6, 'admin', 'admin@gmail.com', '$2y$10$qlzmuIPgw5Xnrk1vlvODCuHlMEEJbnWFcMmG62goRIYR81PagDk2y'),
(8, 'Kaye Mondejar', 'cali@gmail.com', '$2y$10$sADqYrP3YGIZO1C/7iPWU.ps88CGtgh57HUL8ehLGmgmerQ.TkRh6'),
(9, 'mitch sumariba', 'mitch@gmail.com', '$2y$10$R6UX0gLlN9rdtnNxkzrtZujtmqhz8oz2aML6xX0woAGvCo7nShoHa'),
(10, 'louie canete', 'lou@gmail.com', '$2y$10$Syg3gTYANXwKyxkWmxAv3ez8jbQh8m5QjvIj2nVUZuU9Ik3CMP7Ve'),
(11, 'von', 'von@gmail.com', '$2y$10$ZbdgbfACnSNAyLyTk0cPlOGzGhvqqBHKZZMJNh8OkxMufR2ITgAZK'),
(13, 'rico', 'rico@gmail.com', '$2y$10$d7e7V8LiXyb9yHf/K6UqiOwXR6IHZsN176Zu5I1L6A1VOmYKsLKRe'),
(14, 'dero', 'dero@gmail.com', '$2y$10$izcp2DsQC7dQUcYyEJEJReAEaJYmzLe4HuPkpo4/JUvQGIg6TfLdC'),
(15, 'potatochips', 'pot@gmail.com', '$2y$10$VBXGVjajH8jJRGtKEl6ZMuFSDYkD/j0PNOfy3950bAPXyn7YU4h8O'),
(16, 'donya', 'donya@gmail.com', '$2y$10$jOGMJteHBHn1B40LifLpY.hjiPaSs1Fvac.yYQwCNgbfGTIVV0F/6'),
(17, 'Admin1', 'Admin1@gmail.com', '$2y$10$DaikR35xxsC6HAYvu4b0ce.mtzCDEGlWyFPoXR1z0GiJyk.Pu6yZi'),
(18, 'nile', 'nile@gmail.com', '$2y$10$8QFtGlu3zXrKb1iwQ/3UGeF.r/jBTht0d6zrWObpjXeaTOGLGBMD.'),
(19, 'lorna', 'lorna@gmail.com', '$2y$10$nxvZcfQnTv.FdGFccB4xw.chbWs54bV8cvNPVmtup191EHLJRlhAe'),
(20, 'Lex', 'Lex@gmail.com', '$2y$10$LVUXRVC9cfw3U4O4vRdoJ.jRD9hwaDSYh7gUfqws73p49kMwXh8Di'),
(21, 'feyne romero', 'feyne@gmail.com', '$2y$10$BublXB7slzerNILc/ZdpWeDuKHP1SJOBqf2H5LsC2Gzbc.QD1.euG');

-- --------------------------------------------------------

--
-- Table structure for table `collectors`
--

CREATE TABLE `collectors` (
  `collector_id` int(11) UNSIGNED NOT NULL,
  `fullname` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `address` varchar(255) NOT NULL,
  `police_clearance` varchar(255) DEFAULT NULL,
  `valid_id` varchar(255) DEFAULT NULL,
  `registration_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` varchar(20) NOT NULL DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `collectors`
--

INSERT INTO `collectors` (`collector_id`, `fullname`, `email`, `password`, `phone`, `address`, `police_clearance`, `valid_id`, `registration_date`, `status`) VALUES
(68, 'Patrick Star', 'PT@gmail.com', '$2y$10$vn7hsnZ2iICKPu.OQEzwIe0bgvXg8hdi0zj/dz0.Pu06EvEdDmnhG', '91134567', 'Bikini Bottom', 'uploads/police_clearance.jpg', 'uploads/valid_id.jpg', '2024-11-10 07:13:17', 'Approved'),
(71, 'Jack Black', 'jb@email.com', '$2y$10$LRT3odMKsMaKZ1iPjGdUCug3H22RUGUe9vqK2waJpS0pERHNOZ08a', '2147483647', 'Sipaway', 'uploads/police_clearance.jpg', 'uploads/valid_id.jpg', '2024-11-10 09:05:57', 'Approved'),
(72, 'Lexxy Villa', 'lek@gmail.com', '$2y$10$9.eCk4zg/UpE3Yhwqx3N6e.wFpgrRA.pqkwRr6dpL99/T2W4BOkny', '2147483647', 'Murcia', 'uploads/police_clearance.jpg', 'uploads/valid_id.jpg', '2024-11-10 14:18:00', 'Approved'),
(73, 'Theodore Bayalas', 'tb@email.com', '$2y$10$yTwTZR26J3ktLVZsf2eH/.mh.cKoU3x4VslVJU7sreZUCZj7V4HWq', '2147483647', 'San Carlos', 'uploads/police_clearance.jpg', 'uploads/valid_id.jpg', '2024-11-10 14:20:16', 'Approved'),
(75, 'Shem Rei', 's@email.com', '$2y$10$E6OrqHUVR543fdOtKVm6sOTmXiVrtj0hcMxcq3yY74ORFzGCrFVoS', '90900909', 'San Carlos', 'uploads/police_clearance.jpg', 'uploads/valid_id.jpg', '2024-11-10 14:30:10', 'Approved'),
(76, 'Me Meme', 'me@email.com', '$2y$10$LUfjJwvcSl4SkdnYIk7YJOpKTB6nnuagJWGsOqWdyEa2AC.b6uE7a', '2147483647', 'Hinigaran', 'uploads/police_clearance.jpg', 'uploads/valid_id.jpg', '2024-11-10 14:34:39', 'Approved'),
(77, 'Yuri Calunsag', 'y@email.com', '$2y$10$MJmUTQ1c53C7CrjuS3I2ieXSfCgtnKPkRmpXVjRZj5zHJ2Byl3SUi', '90090909', 'Mandalagan', 'uploads/police_clearance.jpg', 'uploads/valid_id.jpg', '2024-11-10 14:38:51', 'Rejected'),
(78, 'Anya Villa', 'anya@gmail.com', '$2y$10$FibiX7SKMpuKG5xji/utzulDFFW/G1dzdO9/6/bkx9CG4Ed4Z4QfW', '2147483647', 'Murcia', 'uploads/police_clearance.jpg', 'uploads/valid_id.jpg', '2024-11-10 14:39:14', 'Approved'),
(81, 'Jimuel Gavaran', 'jimuel@email.com', '$2y$10$1UNPnYOWOS.9w24eNhT0o.ImJBEPlfVfFtVQ1V5yrbgDC8NJeL9WO', '9009090', 'Bin', 'uploads/police_clearance.jpg', 'uploads/valid_id.jpg', '2024-11-10 14:43:26', 'Approved'),
(82, 'yup yummy', 'tommy@gmail.com', '$2y$10$9gVqruBd5tUqxwuk3RD8.egRjN46YEIFcAsG0etmcqovn7U/5jt2e', '2147483647', 'Murcia', 'uploads/police_clearance.jpg', 'uploads/valid_id.jpg', '2024-11-10 14:49:17', 'Approved'),
(83, 'Lorenz Gavaran', 'lg@email.com', '$2y$10$SF3e0rqowZF1K5Qmgp4hcOkZwnE6.3jVcDRlNxpyk4gGFnHL7uac6', '909090909', 'Phase 2', 'uploads/police_clearance.jpg', 'uploads/valid_id.jpg', '2024-11-10 15:51:52', 'Approved'),
(84, 'my  tommy', 'hotdog@gmail.com', '$2y$10$eB9gm7yuycHLtJTzqNNS2ejt9wi18JyR/3mYQXpjgAYpUA81/22LS', '2147483647', 'Bacolod City', 'uploads/police_clearance.jpg', 'uploads/valid_id.jpg', '2024-11-10 15:54:53', 'pending'),
(85, 'Isaac Sabandal', 'Ic@12345', '$2y$10$tfRMAPCjbXmeD5stop2wDOLf/jIAQKtJ/wLgGmHhtLt5ciwqVdso.', '2147483647', 'Mansilingan', 'uploads/police_clearance.jpg', 'uploads/valid_id.jpg', '2024-11-11 12:27:41', 'Approved'),
(86, 'Alaynna Villa', 'Av@gmail.com', '$2y$10$C/hiCN10bOGTvJq7M.aZeesLJ6c1Rwa1pa4/CtU0knIEjkZXK/0gO', '2147483647', 'Bacolod City', 'uploads/police_clearance.jpg', 'uploads/valid_id.jpg', '2024-11-11 12:40:21', 'Approved'),
(87, 'Lex Magsipoc', 'Lm@gmail.com', '$2y$10$kk8Vo3IQGyFfZrw611ABJOwZqL/sG46r4GNQHFRnxwZVuvjh6kZWO', '2147483647', 'Murcia', 'uploads/police_clearance.jpg', 'uploads/valid_id.jpg', '2024-11-11 12:45:44', 'pending'),
(88, 'Kaye  Mondejar', 'Km@gmail.com', '$2y$10$Bj1AUbkoakkFJYzVmFEdEO/NGPK9TqJ3h5jLQho4GGXlMxERDwcUi', '2147483647', 'Sipalay', 'uploads/police_clearance.jpg', 'uploads/valid_id.jpg', '2024-11-11 12:48:42', 'Approved'),
(89, 'Lex Villa', 'Lex@gmail.com', '$2y$10$Yh6B5WHOhv78eHbdHAkggeTVzrxW83jM7k3nPDaRHkL1EVdWvVcLK', '2147483647', 'Murcia', 'uploads/67338c5a61f69_police_clearance.jpg', 'uploads/67338c5a61f6e_valid_id.jpg', '2024-11-12 17:11:54', 'pending'),
(90, 'Kaye Ayap', 'ayap01@gmail.com', '$2y$10$Alxt4PcPgUXIqvDmh3OWauLGl5lx7BwHtxi7qWIhc4k/ym.K52HNa', '997812567', 'Binalbagan', 'uploads/67338f626c02a_police_clearance.jpg', 'uploads/67338f626c02f_valid_id.jpg', '2024-11-12 17:24:50', 'Approved'),
(91, 'kkk lll', 'eme@gmail.com', '$2y$10$7oar.F8rVkL3Vpyj756wuulH4Zbn4P7z6EJBztZwcn0YhJ6MAKdgK', '2147483647', 'Murcia', 'uploads/673390d1ae408_police_clearance.jpg', 'uploads/673390d1ae40d_valid_id.jpg', '2024-11-12 17:30:57', 'Approved'),
(92, 'lexxy villa', 'lex@email.com', '$2y$10$LtYEjO3hjmxMc0VDT2hGL.gFXCbNj5E/4gOhuUjdWiolaRxlMQbZe', '2147483647', 'Murcia', 'uploads/673399401e93d_police_clearance.jpg', 'uploads/673399401e942_valid_id.jpg', '2024-11-12 18:06:56', 'Approved'),
(93, 'Therese Marie', 'tm@email.com', '$2y$10$LuEL3fWu93Ln3.DI5TQKi.7XEdr0oCEbN7lht6RKV0Gz0iLyq.GF6', '99999999', 'Enclaro. Binalbagan', 'uploads/67347daa2a2ed_police_clearance.jpg', 'uploads/67347daa2a2f2_valid_id.jpg', '2024-11-13 10:21:30', 'Approved'),
(95, 'Anya May Villa', 'Am@gmail.com', '$2y$10$pubLDcboSG/lpc.e71XNi.NLBfwhG9sMWdH9a.86fvapRVsbATKhW', '2147483647', 'Murcia, Negros Occidental', 'uploads/6734e7c0e4b4b_police_clearance.jpg', 'uploads/6734e7c0e4b51_valid_id.jpg', '2024-11-13 17:54:08', 'Approved'),
(96, 'Kaye Villa', 'Kv@gmail.com', '$2y$10$A10AzAhKER7RxIQWtOS6leW4iKx3SprD3LwIALWodoGJKnpO1kTG.', '2147483647', 'Bacolod City', 'uploads/673630f40c69c_police_clearance.jpg', 'uploads/673630f40c6a1_valid_id.jpg', '2024-11-14 17:18:44', 'Approved'),
(98, 'Lex Villa', 'lex22@gmail.com', '$2y$10$iJHuvPOH5HDUL/QwFkbCweh5AIo/p4Vlq8GdmDi.G.aEwWsmT8Kpy', '2147483647', 'Bacolod City', 'uploads/673633ae38865_police_clearance.jpg', 'uploads/673633ae3886a_valid_id.jpg', '2024-11-14 17:30:22', 'Approved'),
(100, 'Lexxy Magsipoc', 'kp@gmail.com', '$2y$10$4.0mSqEF4QvmIrgxFlmW3eaRnx1P6gEBH/ra/cIb2ZpOJr0IzrQ.G', '2147483647', 'Bcd City', 'uploads/67363f9fe3d3d_police_clearance.jpg', 'uploads/67363f9fe3d41_valid_id.jpg', '2024-11-14 18:21:19', 'Approved'),
(101, 'kaye  mondejar', 'efg@gmail.com', '$2y$10$pgtUaZBB14B8n6PHxTg8QutgU9SWRoIBZnRG5JBg8frm2YydbV/Oa', '2147483647', 'Bacolod City', 'uploads/673781b79d0ac_police_clearance.jpg', 'uploads/673781b79d0b1_valid_id.jpg', '2024-11-15 17:15:35', 'Approved'),
(102, 'kakakkaka', 'kakaka@gmail.com', '123', '09752328330', 'af sfecrer', NULL, NULL, '2024-11-15 17:23:13', 'Approved'),
(103, 'sukp', 'suk@gmail.com', '123', '639752328330', 'kilid la salle', NULL, NULL, '2024-11-15 17:30:03', 'Approved'),
(104, 'Theodeore Bayalas', 'tb@gmail.com', '$2y$10$I6QfNeKwFQHEsdIZQkVaNuuElNbpDSdSiN0xlduYNQLEx.Tz4Ynoa', '09952713627', 'San Carlos City', 'uploads/6737860c6c925_police_clearance.jpg', 'uploads/6737860c6c92a_valid_id.jpg', '2024-11-15 17:34:04', 'pending'),
(105, 'Jarrey May Villa', 'jmv@gmail.com', '$2y$10$/mo1oGwoDJ.RnYx3gaCPs.4/.RCeNE.im7Sx8OllUySXtn3/5FpVq', '09952713627', 'Bacolod City', 'uploads/673786db9af15_police_clearance.jpg', 'uploads/673786db9af19_valid_id.jpg', '2024-11-15 17:37:31', 'Approved'),
(106, 'plante', 'p@gmail.com', '123', '+639752328330', 'favadvdav', NULL, NULL, '2024-11-15 17:45:36', 'Approved'),
(107, 'doreen', 'dor@mail.com', '123', '+639752328330', 'gdgergwg', NULL, NULL, '2024-11-15 17:51:05', 'Approved'),
(108, 'Kaye Magsipoc', 'shutup@email.com', '$2y$10$FvgUud2JePat9FZdIQ1Xku4dTVQWzt0xEj5.OMpGt/fbcmiZo0mOS', '+639952713627', 'Bacolod City', 'uploads/6737a01d1053e_police_clearance.jpg', 'uploads/6737a01d10543_valid_id.jpg', '2024-11-15 19:25:17', 'Approved'),
(111, 'mami kaye', 'mk@gmail.com', '$2y$10$OndoBQ9XWMqN.9XuM68T9.Fbo4mkFolO2OROsw.M2.xr5OYzbo8Yu', '09952713627', 'Sipalay Bacolod', 'uploads/6738b15f352f5_police_clearance.jpg', 'uploads/6738b15f352fa_valid_id.jpg', '2024-11-16 14:51:11', 'Approved'),
(113, 'Lorenz Jillian Montinola', 'ljm@email.com', '$2y$10$EFf/1EoK03UI0XKMetZgPu7ES/ATRrMpBqe6huJt1lf.DBR.v9bhe', '+639950726466', 'Phase 2, Binalbagan', 'uploads/6738b8597653a_police_clearance.jpg', 'uploads/6738b8597653f_valid_id.jpg', '2024-11-16 15:20:57', 'Approved'),
(114, 'asdfg hjklk', 'asdf@email.com', '$2y$10$/g5kn1ai5Upol8qsVhDUuO9HnXx6Odk.G.TFpLRcmxfcaTywEv02a', '09999999', 'asdff', 'uploads/6738bb03db20d_police_clearance.jpg', 'uploads/6738bb03db211_valid_id.jpg', '2024-11-16 15:32:19', 'Approved'),
(115, 'kaye', 'k@gmail.com', '123', '+639752328330', 'dgsg', NULL, NULL, '2024-11-16 16:06:59', 'Approved'),
(116, 'nile', 'nile@gmail.com', '123', '+639171825690', 'rolis', NULL, NULL, '2024-11-16 16:14:03', 'Approved'),
(117, 'yna', 'yan@gmail.com', '123', '+639690741001', 'sfgsg', NULL, NULL, '2024-11-19 06:22:59', 'Approved'),
(118, 'Louie Canete', 'lou@gmail.com', '123', '+639398366854', 'fgsgsg', NULL, NULL, '2024-11-19 14:53:11', 'Approved'),
(119, 'oliver', 'oli@gmail.com', '123', '+639613937710', 'rgsgsfg', NULL, NULL, '2024-11-19 16:50:15', 'Approved'),
(120, 'von silawan', 'von@gmail.com', '123', '+639266888817', 'kdsjfbsifa', NULL, NULL, '2024-11-20 04:17:45', 'Approved'),
(121, 'jung jihoon', 's2201046@usls.edu.ph', '$2y$10$E/ZoVIsNh6SiN/TqyLzHXuWktXH9qxTgERO39jHUZYXS7b6cmsG0.', '+63945516015', 'silay', 'uploads/673e9ad35d460_police_clearance.jpg', 'uploads/673e9ad35d465_valid_id.jpg', '2024-11-21 02:28:35', 'Approved'),
(123, 'javellana jul leo', 's2300335@usls.edu.ph', '$2y$10$vpINSNB6Nz9mB23Yn4q9h.cUv5Vgegh1oXoldAtABh5cfjm8lIk9m', '+639201347784', 'bago city', 'uploads/673e9ccacfbae_police_clearance.jpg', 'uploads/673e9ccacfbb4_valid_id.jpg', '2024-11-21 02:36:58', 'Approved'),
(124, 'Lyn Lorilla', 's1920357@usls.edu.ph', '$2y$10$uCXlEfuZwSPXZ/M0V2.9auqhXbz3/spOUNRf7LkloE9jopZgmha2G', '+639064871832', 'Brgy. Tangub', 'uploads/673e9e32347d6_police_clearance.jpg', 'uploads/673e9e32347db_valid_id.jpg', '2024-11-21 02:42:58', 'Approved'),
(127, 'Joana Donesa', 'joanadonesa7@gmail', '$2y$10$jbMjc6JslTn2/OwmymHnveph3fd.MOiKMiMAv2ndvQtSjl4vUFYUW', '+639668664433', 'Talisay City', 'uploads/673e9fc1846ea_police_clearance.jpg', 'uploads/673e9fc1846ef_valid_id.jpg', '2024-11-21 02:49:37', 'Approved'),
(128, 'Annika Hermoso', 's2400474@usls.edu.ph', '$2y$10$zSeXOutPKYqoMLkxEM7JbOcdrMAQHUUikrWz3teXgeIsw9eOBT03G', '+639152417016', 'binalbagan', 'uploads/673ea27e4d4f3_police_clearance.jpg', 'uploads/673ea27e4d4f9_valid_id.jpg', '2024-11-21 03:01:18', 'Approved'),
(129, 'Reign Kelly  Cabales', 's2120942@usls.edu.ph', '$2y$10$Y783NSAqndIB8qC8/m/h4.200xlzUQ38E5QgJUg3k3VOkXjhZ1u5a', '+639386387390', 'Bgy. Mandalagan', 'uploads/673ea96e189d7_police_clearance.jpg', 'uploads/673ea96e189dd_valid_id.jpg', '2024-11-21 03:30:54', 'Approved'),
(130, 'Chelsea Ciriaco', 's2201463@usls.edu.ph', '$2y$10$zv9tfnsuUGqBPnqz.zYigOb3tgn2MC0MFvUAiK9QZzUvfcSGiSUkq', '+639271618919', 'Krusty Krab', 'uploads/673eab5b5e8ea_police_clearance.jpg', 'uploads/673eab5b5e8ef_valid_id.jpg', '2024-11-21 03:39:07', 'Approved'),
(131, 'John Michael Sevilla', 'Jmgwapo@gmail.com', '$2y$10$yn31A6lcsyHucmggJom1teru8X.J/Y9doJizdEzWgdfspwpU5HE5i', '+639305507856', 'Binalbagan', 'uploads/673eb13964bae_police_clearance.jpg', 'uploads/673eb13964bb3_valid_id.jpg', '2024-11-21 04:04:09', 'Approved'),
(133, 'Jan Vic Xavier Castillo', '@xavierbrtbrt@gmail.com', '$2y$10$BWwdnliA.R3TgNn5ixUJA.PkYjtBnvSP01LpgwDA5Bm2XwiOxBxAC', '+639054949629', 'Talisay city', 'uploads/673eb6797bc97_police_clearance.jpg', 'uploads/673eb6797bc9d_valid_id.jpg', '2024-11-21 04:26:33', 'Approved'),
(134, 'kaye apasan garcia mondejar', 'kaye@gmail.com', '12345', '+639752328330', 'Ayala, Alabang', NULL, NULL, '2024-12-02 15:35:31', 'Approved'),
(135, 'Gerwin Flores', 'gflores@email.com', '$2y$10$6IVi3/lOs6cB22Qyv34Mu.z7btKfDvrZO5H2M2XdWaHhewFd/4yxG', '09126567877', 'Paglaum Village 2', 'uploads/67506d6fceeec_police_clearance.jpg', 'uploads/67506d6fceef2_valid_id.jpg', '2024-12-04 14:55:43', 'Pending'),
(136, 'RJ Bardollo', 'rj@email.com', '$2y$10$bGLvwikqaRtUg2NABq70eO1l.0NUYDrcJ.rbSuSY3PX6J5.71GOrO', '09989897655', 'Aguisan', 'uploads/6751a69933300_police_clearance.jpg', 'uploads/6751a69933305_valid_id.jpg', '2024-12-05 13:11:53', 'pending'),
(137, 'rocky garcia', 'rock@gmail.com', '123', '+639752328330', 'dfbfgsfg', NULL, NULL, '2024-12-05 18:50:26', 'Approved'),
(138, 'isaac nicolo sabandal', 'nicolo@gmail.com', '123', '+639668914577', 'bgry. mansilingan', NULL, NULL, '2024-12-06 04:13:50', 'Approved'),
(139, 'james dean', 'lnf1225800@gmail.com', '$2y$10$MHpe2NV.neUz96NbMHuLHO3pnDhrAlXQIRKbGqWajqW4vn6yv3MMG', '+639673148615', 'blk. 5 lot 17 dona juliana subd', 'uploads/6752bbdc6c420_police_clearance.jpg', 'uploads/6752bbdc6c425_valid_id.jpg', '2024-12-06 08:54:52', 'Approved'),
(140, 'noel raymund lacson', '2lnf1225800@gmail.com', '$2y$10$rCaeKvjBem2gXNoFI8jtfu/SMgUmESgRbl78crjKkRPIZGR9ASP4i', '+639673148615', 'dona juliana', 'uploads/6752bc813740d_police_clearance.jpg', 'uploads/6752bc8137410_valid_id.jpg', '2024-12-06 08:57:37', 'Approved'),
(141, 'kyle', 'kyle@gmail.com', '123', '+639950588413', 'sdfsf', NULL, NULL, '2024-12-20 12:24:56', 'Approved');

-- --------------------------------------------------------

--
-- Table structure for table `collector_registration`
--

CREATE TABLE `collector_registration` (
  `id` int(11) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `address` varchar(255) NOT NULL,
  `police_clearance` blob NOT NULL,
  `status` enum('Pending','Approved','Rejected') DEFAULT 'Pending',
  `valid_id` blob DEFAULT NULL,
  `password` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `collector_registration`
--

INSERT INTO `collector_registration` (`id`, `full_name`, `email`, `phone`, `address`, `police_clearance`, `status`, `valid_id`, `password`) VALUES
(1, 'saviel james', 'savj@gmail.com', '09752328330', 'Ayala Subdivision', '', 'Pending', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

CREATE TABLE `locations` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `timestamp` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `locations`
--

INSERT INTO `locations` (`id`, `user_id`, `latitude`, `longitude`, `timestamp`) VALUES
(1, 5, 10.189314556127695, 122.86315984967618, '2024-12-03 10:48:26'),
(2, 5, 10.19420388061354, 122.8635525071498, '2024-12-03 11:08:56'),
(3, 5, 10.189699984473561, 122.86221126637263, '2024-12-03 11:21:01'),
(4, 5, 10.18975164190958, 122.8631975397349, '2024-12-03 12:58:26'),
(5, 5, 10.649262887612224, 122.93867011024763, '2024-12-03 13:21:11'),
(6, 5, 10.677974148071577, 122.96039280898009, '2024-12-03 13:30:19'),
(7, 5, 10.6699904, 122.94360078832074, '2024-12-03 13:46:17'),
(8, 5, 10.67180445, 122.94430414921763, '2024-12-04 14:48:07'),
(9, 5, 10.675181001018325, 122.95103745703017, '2024-12-04 14:49:07'),
(10, 5, 10.669919607333476, 122.94362780863749, '2024-12-04 15:12:35'),
(11, 5, 10.666891468328505, 122.94731316435616, '2024-12-05 14:00:54'),
(12, 5, 10.6699904, 122.94360078832074, '2024-12-05 16:22:03'),
(13, 5, 10.678658929553588, 122.96231204389873, '2024-12-05 16:38:53'),
(14, 30, 10.666846671429107, 122.95865268744477, '2024-12-06 05:43:46'),
(15, 36, 31.4676687, -97.1147226, '2024-12-06 08:54:20'),
(16, 36, 53.298255, -2.0970702, '2024-12-06 08:54:48'),
(17, 36, 10.6699904, 122.94360078832074, '2024-12-06 09:00:42');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `sender_id` int(11) NOT NULL,
  `sender_type` enum('user','collector') NOT NULL,
  `receiver_id` int(11) NOT NULL,
  `receiver_type` enum('user','collector') NOT NULL,
  `message_text` text NOT NULL,
  `timestamp` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pickups`
--

CREATE TABLE `pickups` (
  `pickup_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `collector_id` int(11) UNSIGNED DEFAULT NULL,
  `address` varchar(225) NOT NULL,
  `phone_number` varchar(11) NOT NULL,
  `weight_kg` enum('Small','Medium','Large','XL','') NOT NULL,
  `status` enum('Pending','Approved','Disapproved','Completed','Cancelled') DEFAULT 'Pending',
  `pickup_time` time NOT NULL,
  `pickup_date` date NOT NULL DEFAULT current_timestamp(),
  `e_waste_type` enum('Type 1','Type 2','Type 3','Type 4') NOT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `pickups`
--

INSERT INTO `pickups` (`pickup_id`, `user_id`, `collector_id`, `address`, `phone_number`, `weight_kg`, `status`, `pickup_time`, `pickup_date`, `e_waste_type`, `reason`, `created_at`) VALUES
(16, 9, 68, '', '', '', 'Completed', '00:00:00', '2024-11-13', 'Type 1', NULL, '2024-11-17 14:44:41'),
(26, 5, 101, 'Bagan', '09876543211', '', 'Completed', '02:10:00', '2024-11-16', 'Type 1', NULL, '2024-11-17 14:44:41'),
(27, 10, 101, 'BInalbagan', '09950726466', '', 'Completed', '02:30:00', '2024-11-15', 'Type 3', NULL, '2024-11-17 14:44:41'),
(28, 5, 101, 'Phase 2', '0999999', '', 'Completed', '08:40:00', '2024-11-15', 'Type 3', NULL, '2024-11-17 14:44:41'),
(30, 5, 101, 'Enclaro', '09999999999', '', 'Completed', '06:30:00', '2024-11-15', 'Type 3', NULL, '2024-11-17 14:44:41'),
(31, 10, 101, 'Paco', '09999999999', '', 'Completed', '02:30:00', '2024-11-15', '', NULL, '2024-11-17 14:44:41'),
(32, 5, 101, 'San Theodoro', '09999999999', '', 'Disapproved', '03:30:00', '2024-11-17', '', NULL, '2024-11-17 14:44:41'),
(33, 5, 101, 'Enclaro', '09988776654', '', 'Disapproved', '07:30:00', '2024-11-15', '', NULL, '2024-11-17 14:44:41'),
(34, 5, NULL, 'Phase', '09876543211', '', 'Completed', '06:30:00', '2024-11-16', 'Type 3', NULL, '2024-11-17 14:44:41'),
(35, 5, 101, 'Enclaro', '09876543211', '', 'Completed', '01:00:00', '2024-11-18', 'Type 3', NULL, '2024-11-17 14:44:41'),
(36, 5, NULL, 'PHASE 1', '09876543211', '', 'Completed', '12:30:00', '2024-11-26', 'Type 2', 'wrong address', '2024-11-17 14:44:41'),
(37, 17, 101, 'Bacolod City', '09952713627', '', 'Completed', '12:00:00', '2024-11-16', 'Type 2', NULL, '2024-11-17 14:44:41'),
(38, 5, 101, 'Enclaro', '09987655655', '', 'Completed', '01:30:00', '2024-11-18', 'Type 2', NULL, '2024-11-17 14:44:41'),
(39, 5, NULL, 'Iron', '09950726466', '', 'Cancelled', '01:30:00', '2024-11-26', 'Type 2', 'wrong number', '2024-11-17 14:44:41'),
(40, 5, 101, 'Refrigirator', '0996765556', '', 'Completed', '02:30:00', '2024-11-18', 'Type 1', NULL, '2024-11-17 14:52:33'),
(41, 10, 95, 'sgsgsg', '9798798', '', 'Completed', '00:00:00', '2024-11-17', 'Type 1', NULL, '2024-11-17 15:31:53'),
(43, 17, 101, 'Bacolod City', '09951762534', '', 'Completed', '12:00:00', '2024-11-18', 'Type 3', NULL, '2024-11-17 16:32:16'),
(44, 17, 101, 'Bacolod City', '09952713627', '', 'Completed', '12:00:00', '2024-11-18', 'Type 2', NULL, '2024-11-17 16:42:20'),
(45, 5, 93, 'Monitor', '09989877787', '', 'Completed', '06:30:00', '2024-11-19', 'Type 3', NULL, '2024-11-17 17:04:53'),
(46, 5, NULL, 'Mouse', '0998776556', '', 'Cancelled', '12:30:00', '2024-11-19', 'Type 3', 'wrong address', '2024-11-17 17:15:28'),
(47, 5, NULL, 'Phase 2', '09978789889', '', 'Cancelled', '06:30:00', '2024-11-19', 'Type 2', 'kijoih', '2024-11-17 17:22:52'),
(48, 5, NULL, 'qrw3g', '34345435435', '', 'Cancelled', '06:30:00', '2024-11-19', 'Type 1', 'wrong number', '2024-11-17 17:39:23'),
(49, 17, 101, 'Bacolod City', '09952713627', '', 'Completed', '03:00:00', '2024-11-18', 'Type 2', NULL, '2024-11-17 19:58:40'),
(50, 5, NULL, 'Phase 2', '09950726466', '', 'Cancelled', '12:30:00', '2024-11-19', 'Type 1', 'Wrong time', '2024-11-18 13:20:34'),
(51, 17, 101, 'Bacolod City', '09952713627', '', 'Completed', '09:32:00', '2024-11-18', 'Type 2', NULL, '2024-11-18 13:33:14'),
(52, 10, NULL, 'Phase 1 Sta. Maria', '09987876566', '', 'Cancelled', '12:30:00', '2024-11-20', 'Type 2', 'wrong address', '2024-11-18 13:42:30'),
(53, 17, 101, 'Bacolod City', '09952712627', '', 'Completed', '09:00:00', '2024-11-19', 'Type 2', NULL, '2024-11-18 13:55:42'),
(54, 17, 101, 'Bacolod City', '2101261', '', 'Cancelled', '09:59:00', '2024-11-20', 'Type 2', 'Incorrect Address', '2024-11-18 13:59:10'),
(55, 5, 101, 'Phase 2', '09987675455', '', 'Completed', '01:30:00', '2024-11-20', 'Type 2', NULL, '2024-11-18 16:55:10'),
(56, 5, 101, 'Phase 1', '09950726455', '', 'Completed', '12:30:00', '2024-11-20', 'Type 3', NULL, '2024-11-18 17:06:37'),
(57, 5, 101, 'BGC', '09987655655', '', 'Completed', '02:30:00', '2024-11-20', 'Type 2', NULL, '2024-11-18 17:10:04'),
(58, 17, 101, 'Bacolod City', '09952713627', '', 'Completed', '01:19:00', '2024-11-19', 'Type 2', NULL, '2024-11-18 17:19:07'),
(59, 5, 101, 'Enclaro', '09978786566', '', 'Completed', '03:30:00', '2024-11-22', 'Type 3', NULL, '2024-11-18 17:19:25'),
(60, 17, NULL, 'Bacolod City', '09952713627', '', 'Cancelled', '01:00:00', '2024-11-19', 'Type 2', 'wrong', '2024-11-18 17:23:50'),
(61, 10, 86, 'stfs', '9798798', 'Small', 'Completed', '00:00:00', '2024-11-18', 'Type 2', NULL, '2024-11-18 17:25:13'),
(62, 9, 101, 'dhdhd', '9798798', 'Small', 'Completed', '00:00:00', '2024-11-18', 'Type 1', NULL, '2024-11-18 17:27:52'),
(63, 5, 101, 'CPU', '09950725455', 'XL', 'Completed', '04:30:00', '2024-11-20', 'Type 3', NULL, '2024-11-18 17:28:09'),
(64, 9, 85, 'sfgsgs', '9798798', 'Medium', 'Completed', '00:00:00', '2024-11-18', 'Type 2', NULL, '2024-11-18 17:29:21'),
(65, 9, 85, 'etres', '9798798', 'Large', 'Approved', '00:00:00', '2024-11-18', 'Type 1', NULL, '2024-11-18 17:39:07'),
(66, 17, 101, 'Bacolod City', '09952713627', 'Large', 'Completed', '02:00:00', '2024-11-28', 'Type 3', NULL, '2024-11-18 17:59:20'),
(67, 4, 107, 'rgsgrgrs', '9798798', 'Medium', 'Completed', '00:00:00', '2024-11-18', 'Type 1', NULL, '2024-11-18 18:48:29'),
(68, 5, 101, 'Phase 2', '09950726466', 'Large', 'Completed', '12:30:00', '2024-11-20', 'Type 3', NULL, '2024-11-19 13:10:18'),
(69, 5, 101, 'Binalbagan', '09976564344', 'Small', 'Completed', '04:30:00', '2024-11-30', 'Type 3', NULL, '2024-11-19 13:33:40'),
(70, 9, 95, 'dfgdg', '9798798', 'Medium', 'Completed', '00:00:00', '2024-11-19', 'Type 1', NULL, '2024-11-19 13:38:38'),
(71, 9, 86, 'Purok Kalabasa, Brgy. Gil Montilla, Sipalay City', '09752328330', 'Small', 'Completed', '00:00:00', '2024-11-19', 'Type 2', NULL, '2024-11-19 13:41:23'),
(72, 10, 86, 'Purok Kalabas, Brgy Gil Montilla, Sipalay City', '9798798', 'Small', 'Completed', '00:00:00', '2024-11-19', 'Type 1', NULL, '2024-11-19 21:40:06'),
(73, 10, 107, 'cebu IT park', '9798798', 'Small', 'Approved', '00:00:00', '2024-11-19', 'Type 2', NULL, '2024-11-19 13:44:35'),
(74, 5, 93, 'Crossing Bag o', '09976564344', 'XL', 'Completed', '06:30:00', '2024-11-20', 'Type 3', NULL, '2024-11-19 13:45:43'),
(75, 9, 78, 'brgy taculing, bacolod city', '+6397523283', 'Medium', 'Completed', '00:00:00', '2024-11-21', 'Type 1', NULL, '2024-11-21 10:09:47'),
(76, 20, 101, 'Bacolod City', '09952713627', 'Medium', 'Cancelled', '11:00:00', '2024-11-20', 'Type 2', 'No answer from User', '2024-11-20 03:24:07'),
(77, 17, 101, 'Bacolod City', '09952713627', 'Medium', 'Completed', '11:00:00', '2024-11-20', 'Type 1', NULL, '2024-11-20 03:48:56'),
(78, 17, 101, 'cbhff', '09957789087', 'XL', 'Cancelled', '11:50:00', '2024-11-20', 'Type 2', 'zgvfg', '2024-11-20 03:50:28'),
(79, 21, 101, 'Bacolod City', '09952713627', 'Medium', 'Completed', '03:00:00', '2024-11-20', 'Type 1', NULL, '2024-11-20 07:48:24'),
(80, 17, 101, 'Bacolod City', '09952713627', 'Medium', 'Completed', '07:00:00', '2024-11-20', 'Type 1', NULL, '2024-11-20 11:48:32'),
(81, 23, 101, 'Mansilingan', '09952713627', 'Large', 'Completed', '11:00:00', '2024-12-02', 'Type 1', NULL, '2024-11-21 02:02:48'),
(82, 17, 101, 'Bcd', '091937839', 'Large', 'Completed', '01:08:00', '2024-12-02', 'Type 3', NULL, '2024-11-21 02:09:01'),
(83, 5, 101, 'ed', '4445', 'Medium', 'Completed', '09:20:00', '2024-11-22', 'Type 3', NULL, '2024-11-21 02:21:06'),
(84, 25, 101, 'hshshsh', '09993018157', 'Large', 'Completed', '07:32:00', '2024-11-22', 'Type 1', NULL, '2024-11-21 02:32:11'),
(85, 26, 123, 'Bacolod City', '09123456789', 'Medium', 'Completed', '12:00:00', '2024-11-22', 'Type 3', NULL, '2024-11-21 02:38:44'),
(86, 5, 124, 'Binalbagab', '09986688989', 'XL', 'Completed', '12:30:00', '2024-11-23', 'Type 1', NULL, '2024-11-21 02:44:57'),
(87, 5, 127, 'Bikini Bottom', '09777977553', 'Large', 'Cancelled', '10:51:00', '2024-11-21', 'Type 2', 'Change of Mind and heart', '2024-11-21 02:51:56'),
(88, 17, 101, 'brgy nabukog', '09092234154', 'Large', 'Completed', '10:56:00', '2024-11-22', 'Type 1', NULL, '2024-11-21 02:56:26'),
(89, 5, 128, 'Binalbagan', '09957353531', 'Large', 'Completed', '11:00:00', '2024-11-22', 'Type 3', NULL, '2024-11-21 03:00:37'),
(90, 17, NULL, 'JP227 Residences', '09999999999', 'Large', 'Cancelled', '12:30:00', '2024-11-22', 'Type 2', 'wrong number', '2024-11-21 03:09:07'),
(91, 17, 93, 'JP227 RESIDENCES', '09999999999', 'Medium', 'Cancelled', '01:30:00', '2024-11-22', 'Type 1', 'lazy', '2024-11-21 03:12:05'),
(92, 5, 101, 'psjsh', '0293i484844', 'Medium', 'Completed', '12:26:00', '2024-11-22', 'Type 1', NULL, '2024-11-21 03:26:32'),
(93, 5, 129, 'Brgy. Mandalagan', '09386387390', 'Large', 'Completed', '10:00:00', '2024-11-30', 'Type 1', NULL, '2024-11-21 03:33:32'),
(94, 27, 101, 'binalbagan', '09369040046', 'Medium', 'Cancelled', '03:30:00', '2024-11-22', 'Type 3', 'zjsjs', '2024-11-21 03:38:08'),
(95, 17, 130, 'Binalbagan Neg. Occ ', '09952475096', 'Large', 'Approved', '04:30:00', '2024-11-26', 'Type 1', NULL, '2024-11-21 03:41:05'),
(96, 5, 130, 'purok maabiabihon', '111111', 'XL', 'Approved', '11:47:00', '2024-11-22', 'Type 3', NULL, '2024-11-21 03:47:49'),
(97, 5, 130, 'purok paghidaet', '11111111111', 'XL', 'Completed', '11:48:00', '2024-11-22', 'Type 3', NULL, '2024-11-21 03:48:36'),
(98, 5, 131, 'Crossing Bag o', '09950726466', 'Medium', 'Cancelled', '06:30:00', '2024-11-30', 'Type 3', 'scammer', '2024-11-21 04:05:35'),
(99, 5, 133, 'talisay city', '09054949629', 'Small', 'Completed', '01:20:00', '2024-11-01', 'Type 3', NULL, '2024-11-21 04:23:58'),
(100, 17, 101, 'Bacolod City', '09952713627', 'Large', 'Completed', '01:00:00', '2024-11-30', 'Type 2', NULL, '2024-11-21 05:57:18'),
(101, 17, 101, 'test', '123123', 'Small', 'Completed', '04:03:00', '2024-11-14', 'Type 2', NULL, '2024-11-21 06:04:06'),
(102, 17, 101, 'Brgy. Mansilingan', '09952713627', 'Medium', 'Completed', '03:00:00', '2024-11-21', 'Type 2', NULL, '2024-11-21 07:33:07'),
(103, 5, 101, 'Binalbagan', '09950726466', 'Large', 'Completed', '06:30:00', '2024-11-22', 'Type 1', NULL, '2024-11-21 09:30:19'),
(104, 5, 93, 'Paglaum2', '09950724344', 'Medium', 'Completed', '12:30:00', '2024-12-19', 'Type 3', NULL, '2024-12-04 15:17:22'),
(105, 5, 93, 'Aguisan', '09950736466', 'Medium', 'Completed', '04:30:00', '2024-12-12', 'Type 3', NULL, '2024-12-05 14:00:29'),
(106, 5, 93, 'Phase 2', '09950726466', 'XL', 'Completed', '03:00:00', '2024-12-27', 'Type 3', NULL, '2024-12-05 14:09:54'),
(107, 5, 93, 'Aguisan', '09950726466', 'Small', 'Completed', '02:30:00', '2024-12-07', 'Type 3', NULL, '2024-12-05 16:04:23'),
(108, 5, 93, 'Phase 2 Binalbagan', '09950726466', 'Medium', 'Completed', '01:30:00', '2024-12-07', 'Type 2', NULL, '2024-12-05 16:20:01'),
(109, 9, 86, 'brgy, mansilingan', '09752328330', 'Small', 'Completed', '00:00:00', '2024-12-28', 'Type 1', NULL, '2024-12-05 18:16:22'),
(110, 36, 140, 'talisay city', '09999999999', 'Large', 'Approved', '07:30:00', '2024-12-10', 'Type 1', NULL, '2024-12-06 08:52:43'),
(111, 36, 140, 'brgy 2', '0999999', 'Medium', 'Cancelled', '11:59:00', '2024-12-17', 'Type 3', 'Wrong number', '2024-12-06 08:55:41'),
(112, 5, 93, 'Bagan', '09987654544', 'Medium', 'Approved', '01:30:00', '2025-01-30', 'Type 3', NULL, '2025-01-14 12:45:01'),
(113, 5, 93, 'Aguisan', '09987876566', 'Large', 'Approved', '02:30:00', '2025-01-22', 'Type 3', NULL, '2025-01-14 12:46:29'),
(114, 5, 93, 'Kabankalan', '09987675455', 'XL', 'Approved', '03:30:00', '2025-01-22', 'Type 3', NULL, '2025-01-14 12:47:31');

-- --------------------------------------------------------

--
-- Table structure for table `transaction_history`
--

CREATE TABLE `transaction_history` (
  `transaction_id` int(10) NOT NULL,
  `pickup_id` int(11) NOT NULL,
  `user_id` int(10) NOT NULL,
  `collector_id` int(10) NOT NULL,
  `pickup_date` date NOT NULL DEFAULT current_timestamp(),
  `status` varchar(100) NOT NULL,
  `created_date` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `transaction_history`
--

INSERT INTO `transaction_history` (`transaction_id`, `pickup_id`, `user_id`, `collector_id`, `pickup_date`, `status`, `created_date`) VALUES
(1, 0, 1, 68, '2024-12-02', '', '2024-12-02'),
(2, 1000000, 100000, 10000, '2024-12-02', '', '2024-12-02');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `full_name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone` int(11) DEFAULT NULL,
  `address` varchar(100) NOT NULL,
  `registration_date` datetime DEFAULT current_timestamp(),
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `full_name`, `email`, `phone`, `address`, `registration_date`, `password`) VALUES
(2, 'louie', 'lou@gmail.com', 2147483647, 'Brgy Alijis, Bacolod City', '2024-11-08 16:39:52', '123'),
(3, 'Jillian Ayap', 'lj@email.com', 909080809, 'Binalbagan', '2024-11-09 14:40:51', '$2y$10$VjrtuYJlqvbfjwb9Lde8NeFJnMfAsO0vnws9F43dBA2xkaDrL53/a'),
(4, 'Kaye Mondejar', 'k@email.com', 12345, 'Sipalay', '2024-11-09 14:53:14', '$2y$10$X5kfg84c/LH.7tSydQSWFerLp1/P7xWmneJ3If/cWXnvQmHY40cTS'),
(5, 'Jillian Montinola', 'jm@email.com', 1232133, 'Binalbagan', '2024-11-09 15:02:25', '$2y$10$nyESRtKin.gq8G.v70qjm.E9jlQ2MtQQ4keCSYqsGmrCi2iUcgsT2'),
(7, 'lek lek', 'lek2@gmail.com', 12345, 'murcia', '2024-11-09 17:40:34', '$2y$10$CJZxKHX2r.RBjbpuKB.3neZzIsFxteaYpIc2Cuu9kum3625X2cm2i'),
(8, 'Lex Ayap', 'ayap@gmail.com', 2147483647, 'Murcia', '2024-11-10 14:16:22', '$2y$10$.gMmGA5qYgMCfWS.ysJaBeDMUtilRE637fevgQ54bndlt10F0D89S'),
(9, 'Isaac Sabandal', 'lexi@gmail.com', 2147483647, 'Bacolod City', '2024-11-11 12:30:07', '$2y$10$3RZ2DJxMyEjh1QU9/.5Sg.lhAUHL46K.w3.YedVGw/uThZGvfFKn2'),
(10, 'Ashley Montinola', 'am@email.com', 999999999, 'Phase 1', '2024-11-11 12:45:19', '$2y$10$lJ1q82wHdjWcmelENl.j1eE/.cp1vt6bA.ZkWVBUlonc8VrlEElau'),
(11, 'Leksie Lain', 'Leksie@gmail.com', 2147483647, 'Murcia', '2024-11-11 12:47:45', '$2y$10$8BN4xuCE.t7u3dAM4gzpB.iq1.1WyCGfNfqZbrUCxDEdLMsEvDCUK'),
(12, 'kaye kaye', 'kaye@gmail.com', 0, 'kdiebis', '2024-11-12 10:23:12', '$2y$10$sbFreixSpQnLUeGuV9C6sOr.JF2LhtSMtC7SvS6tvDt6/Cn1AhQzq'),
(13, 'Lex Villa', 'lek@gmail.com', 99987678, 'La Salle', '2024-11-12 14:52:16', '$2y$10$JoF79Te/ecq.BQ2DoundMeJOt5rTrlLMnAEKODXLdvYN19iROdh6S'),
(14, 'Raye Vincent', 'rv@email.com', 999999999, 'Progreso', '2024-11-12 15:34:12', '$2y$10$h5B/QCtCPbp/hqBa2brKLOq6dysJbV.VCouK.Rw4j0VXOG8RnwgwK'),
(15, 'okie okie', 'okie@gmail.com', 2147483647, 'Secret', '2024-11-12 16:32:54', '$2y$10$b1AuXusjFORRYOoh3pZtY.FhXBgseLp8aqmHL.mraGKQ7BOMnUPem'),
(16, 'Leks Villa', 'lainv@email.com', 2147483647, 'Murcia', '2024-11-12 18:09:33', '$2y$10$DGohUH71otdNWZd5dtyi5O6NF16.Q5FnLZ.ED2TRg0LOV/JJDQAIC'),
(17, 'Lexxy Lain', 'abc@gmail.com', 2147483647, 'Bacolod City', '2024-11-15 16:56:38', '$2y$10$SaoqujjW7l8CQ64M1mVgFOolxk.zVpmuFAuZmyLyPldViZZkDeFeu'),
(18, 'Lex Bjklol', 'lek@gmail.com', 2147483647, 'Bacolod City', '2024-11-15 18:09:12', '$2y$10$dHw9L4zRHU3WuMmW6RzUWeTeeDJ5yiSNH.yUlnhV162WGJ49C8Rde'),
(19, 'mother father', 'mf@gmail.com', 2147483647, 'Bacolod City', '2024-11-16 14:52:06', '$2y$10$q3oRJw802DSw26BqV78dRuO8by/DMbP3dklfMsKvDAOYyQfhtBoBC'),
(20, 'Hij Klm', 'abc@email', 2147483647, 'outwork', '2024-11-20 03:20:59', '$2y$10$YF4EVEw33tCK4MbHhwAmAeGMxWw8dXJkRa5IPE1KAjg6cKJGuIlIu'),
(21, 'Lexxy Lain Villa', 'llmv@gmail.com', 2147483647, 'Bacolod City', '2024-11-20 07:46:15', '$2y$10$56Odbp5iyUOn7syxuuUb0.xT8325lKyKpKY0sYFZAXE1L3ih978Fm'),
(22, 'Joni Jap', 'jo@email.com', 2147483647, 'Sipalay', '2024-11-20 08:16:56', '$2y$10$Srq7t7J/Ir7a4Dc0ds4lveZoWZlFmx24Mvx8Zwq0f64Q7GnOHCAlC'),
(23, 'rally geocadin', 's2121019@usls.com', 2147483647, 'mansilingan', '2024-11-21 02:01:17', '$2y$10$GUjIN7gByy53Fm9glwp6WO9mCH6uHvitQuUrKJHNvhf1WCc76PZpK'),
(24, 'rally geocadin', 's2121019@usls.com', 2147483647, 'mansilingan', '2024-11-21 02:01:18', '$2y$10$.ebF7cnHW.wukl51fRns8u4K.6vKRR0QBKFRs.UDIXHY44kVsxmIG'),
(25, 'niki chong', 'nicoleachong@gmail.com', 2147483647, 'Natalia St, Sum-ag, Bacolod City', '2024-11-21 02:28:59', '$2y$10$lEr8Rz9juCiefNe7m7Q15uQzGjjtgnvFW7Gp.OldH5ujRzSVbFgTa'),
(26, 'john doe', 'johndoe@gmail.com', 2147483647, 'bacolod', '2024-11-21 02:36:59', '$2y$10$ErGXpfSQuZzVofnpF5MoN.mQAoXIqjM.ecpNlEjBablxeMWXk.WKi'),
(27, 'kamille morales', 'moraleskamille29@gmail.com', 939040046, 'binalbagan', '2024-11-21 03:37:11', '$2y$10$pM1lVIkynrUiiISIGZtWr.3LyLlQBRGAU6KcVfQIOCBffTPlVMb8m'),
(28, 'Gerwin Flores', 'gflores@gmail.com', 2147483647, 'Paglaum 2', '2024-12-04 14:59:30', '$2y$10$tKLNLwy2YbXLcUlBzihGUOxIdEIP5qGFfgXpNiw/YnwMr4M/99Rd2'),
(29, 'Robert Jay Bardollo', 'rj@email.com', 2147483647, 'Aguisan', '2024-12-05 13:09:33', '$2y$10$pd7qw7iDBzPh4c73Vl2sF.i4db9b96MtfI3hW3Sc4Ct6NfM9oqo1e'),
(30, 'Gerwin John Flores', 'gj@email.com', 2147483647, 'Aguisan', '2024-12-06 05:41:30', '$2y$10$fmcU9y3Bnyvk.nTrjla6p.7.yYhuz8lHZxO54ps9vT/K15lt2153i'),
(31, 'Gerwin John Flores', 'gj@email.com', 2147483647, 'Aguisan', '2024-12-06 05:41:31', '$2y$10$gsoy6qfZRq4ftCmEzjjPSOnG47webxbMtkTiSoXEvBAr9DkiYlGJS'),
(32, 'Gerwin John Flores', 'gj@email.com', 2147483647, 'Aguisan', '2024-12-06 05:41:31', '$2y$10$.CX88UiXvaVxtYvIU8YJUulqfBCo0SvWCmdZGZRVUpvRV5qm5SE96'),
(33, 'Gerwin John Flores', 'gj@email.com', 2147483647, 'Aguisan', '2024-12-06 05:41:31', '$2y$10$1DcWb4uQFW0RSZo3jz4b2uH7hsaqOWAI6upShKpL7Jmw2J.eAaE4O'),
(34, 'Gerwin John Flores', 'gj@email.com', 2147483647, 'Aguisan', '2024-12-06 05:41:32', '$2y$10$rTYh0w3oV8afGb4dkEYXNOF6eqTPkls7PO3AssbM1D73uUUG7StX6'),
(35, 'Gerwin John Flores', 'gj@email.com', 2147483647, 'Aguisan', '2024-12-06 05:41:32', '$2y$10$qPten2I47NFAJ4am37lH1OSQP4UP02lDHUz1YStFlupWfIDwzLq2i'),
(36, 'Dairin Janagap', 'dj@gmail.com', 123456799, 'Bacolod City', '2024-12-06 08:50:58', '$2y$10$0qLLaPDQJtZoC91iwP1ypu0hupUs9ghl49LlkonZhm2rXOXuW4Nya');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_users`
--
ALTER TABLE `admin_users`
  ADD PRIMARY KEY (`admin_id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `collectors`
--
ALTER TABLE `collectors`
  ADD PRIMARY KEY (`collector_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `collector_registration`
--
ALTER TABLE `collector_registration`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_sender_user` (`sender_id`),
  ADD KEY `fk_receiver_user` (`receiver_id`);

--
-- Indexes for table `pickups`
--
ALTER TABLE `pickups`
  ADD PRIMARY KEY (`pickup_id`),
  ADD KEY `collector_id` (`collector_id`),
  ADD KEY `fk_pickups_user` (`user_id`);

--
-- Indexes for table `transaction_history`
--
ALTER TABLE `transaction_history`
  ADD PRIMARY KEY (`transaction_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_users`
--
ALTER TABLE `admin_users`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `collectors`
--
ALTER TABLE `collectors`
  MODIFY `collector_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=142;

--
-- AUTO_INCREMENT for table `collector_registration`
--
ALTER TABLE `collector_registration`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `locations`
--
ALTER TABLE `locations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pickups`
--
ALTER TABLE `pickups`
  MODIFY `pickup_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=115;

--
-- AUTO_INCREMENT for table `transaction_history`
--
ALTER TABLE `transaction_history`
  MODIFY `transaction_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `fk_receiver_user` FOREIGN KEY (`receiver_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_sender_user` FOREIGN KEY (`sender_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pickups`
--
ALTER TABLE `pickups`
  ADD CONSTRAINT `fk_pickups_collector` FOREIGN KEY (`collector_id`) REFERENCES `collectors` (`collector_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_pickups_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
