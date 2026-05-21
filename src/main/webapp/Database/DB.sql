-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 21, 2026 at 09:18 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `nepalreads`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `admin_id` int(11) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `profile_image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`admin_id`, `full_name`, `email`, `password`, `phone`, `profile_image`, `created_at`) VALUES
(2, 'Admin User', 'admin@nepalreads.com', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lh3y', '9800000000', NULL, '2026-05-19 05:09:30');

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `book_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `author` varchar(150) NOT NULL,
  `isbn` varchar(20) DEFAULT NULL,
  `genre` varchar(80) NOT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(10,2) NOT NULL DEFAULT 0.00,
  `stock` int(11) NOT NULL DEFAULT 0,
  `cover_image` varchar(255) DEFAULT NULL,
  `published_date` varchar(20) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`book_id`, `title`, `author`, `isbn`, `genre`, `description`, `price`, `stock`, `cover_image`, `published_date`, `created_at`, `updated_at`) VALUES
(1, 'IT', 'Stephen King', '978-0670813028', 'Horror', 'A terrifying clown haunts the town of Derry.', 1100.00, 24, 'uploads/books/book_1_1779272246708.jpg', '1986-09-15', '2026-05-17 05:53:59', '2026-05-21 06:44:01'),
(2, 'The Shining', 'Stephen King', '978-0385121675', 'Horror', 'A family heads to an isolated hotel for the winter.', 950.00, 29, 'uploads/books/book_2_1779272462636.jpg', '1977-01-28', '2026-05-17 05:53:59', '2026-05-20 16:00:09'),
(3, 'Dracula', 'Bram Stoker', '978-0486411095', 'Horror', 'The classic vampire tale by Bram Stoker.', 800.00, 40, 'uploads/books/book_3_1779272475336.jpg', '1897-05-26', '2026-05-17 05:53:59', '2026-05-20 10:21:15'),
(4, 'The Exorcist', 'William Peter Blatty', '978-0061007224', 'Horror', 'A mother watches her daughter\'s terrifying possession.', 1050.00, 20, 'uploads/books/book_4_1779272563127.jpg', '1971-06-01', '2026-05-17 05:53:59', '2026-05-20 10:22:43'),
(5, 'Bird Box', 'Josh Malerman', '978-0062259653', 'Horror', 'If you see them, you die. A mother risks everything.', 920.00, 35, 'uploads/books/book_5_1779272601626.jpg', '2014-05-13', '2026-05-17 05:53:59', '2026-05-20 10:23:21'),
(6, 'Mexican Gothic', 'Silvia Moreno-Garcia', '978-0525620785', 'Horror', 'A glamorous socialite investigates a mysterious gothic manor.', 1200.00, 27, 'uploads/books/book_6_1779272642326.jpg', '2020-06-30', '2026-05-17 05:53:59', '2026-05-20 10:24:02'),
(7, 'Summer Love', 'Subin Bhattarai', '978-1416955016', 'Romance', 'A summer that changes everything.', 900.00, 50, 'uploads/books/book_7_1779272742826.jpg', '2009-05-05', '2026-05-17 05:53:59', '2026-05-20 10:25:42'),
(8, 'Saaya', 'Subin Bhattarai', '978-9937020000', 'Romance', 'A beautiful Nepali romance novel.', 850.00, 45, 'uploads/books/book_8_1779272780631.webp', '2015-01-01', '2026-05-17 05:53:59', '2026-05-20 10:26:36'),
(9, 'The Love Hypothesis', 'Ali Hazelwood', '978-0593336823', 'Romance', 'A fake-dating romance in the world of academia.', 750.00, 60, 'uploads/books/book_9_1779272843486.jpg', '2021-09-14', '2026-05-17 05:53:59', '2026-05-20 10:27:23'),
(10, 'It Ends With Us', 'Colleen Hoover', '978-1501110368', 'Romance', 'A heart-wrenching love story about strength and survival.', 920.00, 55, 'uploads/books/book_10_1779272853905.jpg', '2016-08-02', '2026-05-17 05:53:59', '2026-05-20 10:27:33'),
(11, 'Me Before You', 'Jojo Moyes', '978-0143124542', 'Romance', 'A quirky girl. A man who\'s given up. A love that changes both.', 1100.00, 42, 'uploads/books/book_11_1779272898299.jpg', '2012-01-05', '2026-05-17 05:53:59', '2026-05-20 10:28:18'),
(12, 'The Fault in Our Stars', 'John Green', '978-0525478812', 'Romance', 'Two teenagers navigate love and illness.', 990.00, 65, 'uploads/books/book_12_1779272950788.jpg', '2012-01-10', '2026-05-17 05:53:59', '2026-05-20 10:29:10'),
(13, 'Funny Story', 'Emily Henry', '978-0593441282', 'Comedy', 'A hilarious tale of unexpected roommates and romance.', 850.00, 38, 'uploads/books/book_13_1779273071975.jpg', '2024-04-23', '2026-05-17 05:53:59', '2026-05-20 10:31:11'),
(15, 'Me Talk Pretty One Day', 'David Sedaris', '978-0316776967', 'Comedy', 'Sidesplitting essays on language, family and Paris.', 700.00, 35, 'uploads/books/book_15_1779273358010.jpg', '2000-05-01', '2026-05-17 05:53:59', '2026-05-20 10:35:58'),
(16, 'Is Everyone Hanging Out Without Me?', 'Mindy Kaling', '978-0307886279', 'Comedy', 'Mindy Kaling\'s candid and hilarious memoir.', 1100.00, 30, 'uploads/books/book_16_1779273404738.jpg', '2011-11-01', '2026-05-17 05:53:59', '2026-05-20 10:36:44'),
(17, 'The Hitchhiker\'s Guide to the Galaxy', 'Douglas Adams', '978-0345391803', 'Comedy', 'Don\'t panic! The definitive guide to the universe.', 1200.00, 40, 'uploads/books/book_17_1779273527294.jpg', '1979-10-12', '2026-05-17 05:53:59', '2026-05-20 10:38:47'),
(18, 'Bossypants', 'Tina Fey', '978-0316056878', 'Comedy', 'Tina Fey\'s hilarious memoir from comedy writer to 30 Rock.', 900.00, 33, 'uploads/books/book_18_1779273558727.jpg', '2011-04-05', '2026-05-17 05:53:59', '2026-05-20 10:39:18'),
(19, 'Muna Madan', 'Laxmi Prasad Devkota', '978-9937060000', 'Nepali Literature', 'The most beloved Nepali poem, a tragic love story.', 450.00, 80, 'uploads/books/book_19_1779273578498.jpg', '1936-01-01', '2026-05-17 05:53:59', '2026-05-20 10:39:38'),
(20, 'Palpasa Cafe', 'Narayan Wagle', '978-9937020010', 'Nepali Literature', 'A novel set during Nepal\'s civil conflict.', 650.00, 70, 'uploads/books/book_20_1779273593753.jpg', '2005-01-01', '2026-05-17 05:53:59', '2026-05-20 10:39:53'),
(21, 'Seto Dharti', 'Amar Neupane', '978-9937020020', 'Nepali Literature', 'Award-winning Nepali novel about land and identity.', 550.00, 60, 'uploads/books/book_21_1779273609406.jpg', '2010-01-01', '2026-05-17 05:53:59', '2026-05-20 10:40:09'),
(22, 'Karnali Blues', 'Buddhi Sagar', '978-9937020030', 'Nepali Literature', 'A coming-of-age story from western Nepal.', 600.00, 65, 'uploads/books/book_22_1779273625476.jpg', '2011-01-01', '2026-05-17 05:53:59', '2026-05-20 10:40:25'),
(23, 'Sumnima', 'B.P. Koirala', '978-9937020040', 'Nepali Literature', 'A classic Nepali novel blending myth and realism.', 400.00, 75, 'uploads/books/book_23_1779273673932.jpg', '1971-01-01', '2026-05-17 05:53:59', '2026-05-20 10:41:13'),
(24, 'Sirish Ko Phool', 'Parijat', '978-9937020050', 'Nepali Literature', 'The most celebrated Nepali novel by a female author.', 500.00, 70, 'uploads/books/book_24_1779273708962.jpg', '1965-01-01', '2026-05-17 05:53:59', '2026-05-20 10:41:48'),
(165, 'The Love Hypothesis', 'Ali Hazelwood', '978-0593336823', 'Romance', 'A fake-dating romance in the world of academia.', 750.00, 60, NULL, '2021-09-14', '2026-05-19 06:41:05', '2026-05-19 06:41:05'),
(166, 'It Ends With Us', 'Colleen Hoover', '978-1501110368', 'Romance', 'A heart-wrenching love story about strength and survival.', 920.00, 55, NULL, '2016-08-02', '2026-05-19 06:41:05', '2026-05-19 06:41:05'),
(167, 'Me Before You', 'Jojo Moyes', '978-0143124542', 'Romance', 'A quirky girl. A man who\'s given up. A love that changes both.', 1100.00, 42, NULL, '2012-01-05', '2026-05-19 06:41:05', '2026-05-19 06:41:05'),
(168, 'The Fault in Our Stars', 'John Green', '978-0525478812', 'Romance', 'Two teenagers navigate love and illness.', 990.00, 65, NULL, '2012-01-10', '2026-05-19 06:41:05', '2026-05-19 06:41:05'),
(169, 'Funny Story', 'Emily Henry', '978-0593441282', 'Comedy', 'A hilarious tale of unexpected roommates and romance.', 850.00, 38, NULL, '2024-04-23', '2026-05-19 06:41:05', '2026-05-19 06:41:05'),
(170, 'Born a Crime', 'Trevor Noah', '978-0399588174', 'Comedy', 'Stories from a South African childhood – funny and moving.', 950.00, 48, NULL, '2016-11-15', '2026-05-19 06:41:05', '2026-05-19 06:41:05'),
(171, 'Me Talk Pretty One Day', 'David Sedaris', '978-0316776967', 'Comedy', 'Sidesplitting essays on language, family and Paris.', 700.00, 35, NULL, '2000-05-01', '2026-05-19 06:41:05', '2026-05-19 06:41:05'),
(172, 'Is Everyone Hanging Out Without Me?', 'Mindy Kaling', '978-0307886279', 'Comedy', 'Mindy Kaling\'s candid and hilarious memoir.', 1100.00, 30, NULL, '2011-11-01', '2026-05-19 06:41:05', '2026-05-19 06:41:05'),
(173, 'The Hitchhiker\'s Guide to the Galaxy', 'Douglas Adams', '978-0345391803', 'Comedy', 'Don\'t panic! The definitive guide to the universe.', 1200.00, 40, NULL, '1979-10-12', '2026-05-19 06:41:05', '2026-05-19 06:41:05'),
(174, 'Bossypants', 'Tina Fey', '978-0316056878', 'Comedy', 'Tina Fey\'s hilarious memoir from comedy writer to 30 Rock.', 900.00, 33, NULL, '2011-04-05', '2026-05-19 06:41:05', '2026-05-19 06:41:05'),
(175, 'Muna Madan', 'Laxmi Prasad Devkota', '978-9937060000', 'Nepali Literature', 'The most beloved Nepali poem, a tragic love story.', 450.00, 80, NULL, '1936-01-01', '2026-05-19 06:41:05', '2026-05-19 06:41:05'),
(176, 'Palpasa Cafe', 'Narayan Wagle', '978-9937020010', 'Nepali Literature', 'A novel set during Nepal\'s civil conflict.', 650.00, 70, NULL, '2005-01-01', '2026-05-19 06:41:05', '2026-05-19 06:41:05'),
(177, 'Seto Dharti', 'Amar Neupane', '978-9937020020', 'Nepali Literature', 'Award-winning Nepali novel about land and identity.', 550.00, 60, NULL, '2010-01-01', '2026-05-19 06:41:05', '2026-05-19 06:41:05'),
(178, 'Karnali Blues', 'Buddhi Sagar', '978-9937020030', 'Nepali Literature', 'A coming-of-age story from western Nepal.', 600.00, 65, NULL, '2011-01-01', '2026-05-19 06:41:05', '2026-05-19 06:41:05'),
(179, 'Sumnima', 'B.P. Koirala', '978-9937020040', 'Nepali Literature', 'A classic Nepali novel blending myth and realism.', 400.00, 75, NULL, '1971-01-01', '2026-05-19 06:41:05', '2026-05-19 06:41:05'),
(180, 'Sirish Ko Phool', 'Parijat', '978-9937020050', 'Nepali Literature', 'The most celebrated Nepali novel by a female author.', 500.00, 70, NULL, '1965-01-01', '2026-05-19 06:41:05', '2026-05-19 06:41:05'),
(181, 'The Alchemist', 'Paulo Coelho', '978-0062315007', 'Fiction', 'A shepherd\'s magical journey of self-discovery.', 850.00, 90, NULL, '1988-01-01', '2026-05-19 06:41:05', '2026-05-19 06:41:05'),
(182, 'Hari Bahadur', 'Madan Krishna Shrestha', '978-9937020060', 'Fiction', 'A beloved Nepali fictional story.', 650.00, 55, NULL, '2010-01-01', '2026-05-19 06:41:05', '2026-05-19 06:41:05'),
(183, 'A Little Life', 'Hanya Yanagihara', '978-0385539258', 'Fiction', 'Four friends navigate life, trauma and friendship.', 1150.00, 35, NULL, '2015-03-10', '2026-05-19 06:41:05', '2026-05-19 06:41:05'),
(184, 'The Summer I Turned Pretty', 'Jenny Han', '978-1416968290', 'Fiction', 'Belly chooses between two brothers over one unforgettable summer.', 880.00, 50, NULL, '2009-05-05', '2026-05-19 06:41:05', '2026-05-19 06:41:05'),
(185, 'Better Than The Movies', 'Lynn Painter', '978-1534467835', 'Fiction', 'A girl with a romantic view of life finally finds her person.', 750.00, 45, NULL, '2021-05-04', '2026-05-19 06:41:05', '2026-05-19 06:41:05'),
(186, 'Karnali Blues 2', 'Buddhi Sagar', '978-9937020031', 'Fiction', 'A sequel to the beloved Nepali coming-of-age story.', 990.00, 40, NULL, '2016-01-01', '2026-05-19 06:41:05', '2026-05-19 06:41:05'),
(187, 'Palpasa Cafe 2', 'Narayan Wagle', '978-9937020011', 'Fiction', 'The eagerly awaited follow-up to Palpasa Cafe.', 1250.00, 30, NULL, '2018-01-01', '2026-05-19 06:41:05', '2026-05-19 06:41:05'),
(188, 'IT', 'Stephen King', '978-0670813028', 'Horror', 'A terrifying clown haunts the town of Derry.', 1100.00, 25, NULL, '1986-09-15', '2026-05-19 06:43:59', '2026-05-19 06:43:59'),
(189, 'The Shining', 'Stephen King', '978-0385121675', 'Horror', 'A family heads to an isolated hotel for the winter.', 950.00, 30, NULL, '1977-01-28', '2026-05-19 06:43:59', '2026-05-19 06:43:59'),
(190, 'Dracula', 'Bram Stoker', '978-0486411095', 'Horror', 'The classic vampire tale by Bram Stoker.', 800.00, 40, NULL, '1897-05-26', '2026-05-19 06:43:59', '2026-05-19 06:43:59'),
(191, 'The Exorcist', 'William Peter Blatty', '978-0061007224', 'Horror', 'A mother watches her daughter\'s terrifying possession.', 1050.00, 20, NULL, '1971-06-01', '2026-05-19 06:43:59', '2026-05-19 06:43:59'),
(192, 'Bird Box', 'Josh Malerman', '978-0062259653', 'Horror', 'If you see them, you die. A mother risks everything.', 920.00, 35, NULL, '2014-05-13', '2026-05-19 06:43:59', '2026-05-19 06:43:59'),
(193, 'Mexican Gothic', 'Silvia Moreno-Garcia', '978-0525620785', 'Horror', 'A glamorous socialite investigates a mysterious gothic manor.', 1200.00, 28, NULL, '2020-06-30', '2026-05-19 06:43:59', '2026-05-19 06:43:59'),
(194, 'Summer Love', 'Jenny Han', '978-1416955016', 'Romance', 'A summer that changes everything.', 900.00, 50, NULL, '2009-05-05', '2026-05-19 06:43:59', '2026-05-19 06:43:59'),
(195, 'Saaya', 'Rupa Subba', '978-9937020000', 'Romance', 'A beautiful Nepali romance novel.', 850.00, 45, NULL, '2015-01-01', '2026-05-19 06:43:59', '2026-05-19 06:43:59'),
(196, 'The Love Hypothesis', 'Ali Hazelwood', '978-0593336823', 'Romance', 'A fake-dating romance in the world of academia.', 750.00, 60, NULL, '2021-09-14', '2026-05-19 06:43:59', '2026-05-19 06:43:59'),
(197, 'It Ends With Us', 'Colleen Hoover', '978-1501110368', 'Romance', 'A heart-wrenching love story about strength and survival.', 920.00, 55, NULL, '2016-08-02', '2026-05-19 06:43:59', '2026-05-19 06:43:59'),
(198, 'Me Before You', 'Jojo Moyes', '978-0143124542', 'Romance', 'A quirky girl. A man who\'s given up. A love that changes both.', 1100.00, 42, NULL, '2012-01-05', '2026-05-19 06:43:59', '2026-05-19 06:43:59'),
(199, 'The Fault in Our Stars', 'John Green', '978-0525478812', 'Romance', 'Two teenagers navigate love and illness.', 990.00, 65, NULL, '2012-01-10', '2026-05-19 06:43:59', '2026-05-19 06:43:59'),
(200, 'Funny Story', 'Emily Henry', '978-0593441282', 'Comedy', 'A hilarious tale of unexpected roommates and romance.', 850.00, 38, NULL, '2024-04-23', '2026-05-19 06:43:59', '2026-05-19 06:43:59'),
(201, 'Born a Crime', 'Trevor Noah', '978-0399588174', 'Comedy', 'Stories from a South African childhood – funny and moving.', 950.00, 48, NULL, '2016-11-15', '2026-05-19 06:43:59', '2026-05-19 06:43:59'),
(202, 'Me Talk Pretty One Day', 'David Sedaris', '978-0316776967', 'Comedy', 'Sidesplitting essays on language, family and Paris.', 700.00, 35, NULL, '2000-05-01', '2026-05-19 06:43:59', '2026-05-19 06:43:59'),
(203, 'Is Everyone Hanging Out Without Me?', 'Mindy Kaling', '978-0307886279', 'Comedy', 'Mindy Kaling\'s candid and hilarious memoir.', 1100.00, 30, NULL, '2011-11-01', '2026-05-19 06:43:59', '2026-05-19 06:43:59'),
(204, 'The Hitchhiker\'s Guide to the Galaxy', 'Douglas Adams', '978-0345391803', 'Comedy', 'Don\'t panic! The definitive guide to the universe.', 1200.00, 40, NULL, '1979-10-12', '2026-05-19 06:43:59', '2026-05-19 06:43:59'),
(205, 'Bossypants', 'Tina Fey', '978-0316056878', 'Comedy', 'Tina Fey\'s hilarious memoir from comedy writer to 30 Rock.', 900.00, 33, NULL, '2011-04-05', '2026-05-19 06:43:59', '2026-05-19 06:43:59'),
(206, 'Muna Madan', 'Laxmi Prasad Devkota', '978-9937060000', 'Nepali Literature', 'The most beloved Nepali poem, a tragic love story.', 450.00, 80, NULL, '1936-01-01', '2026-05-19 06:43:59', '2026-05-19 06:43:59'),
(207, 'Palpasa Cafe', 'Narayan Wagle', '978-9937020010', 'Nepali Literature', 'A novel set during Nepal\'s civil conflict.', 650.00, 70, NULL, '2005-01-01', '2026-05-19 06:43:59', '2026-05-19 06:43:59'),
(208, 'Seto Dharti', 'Amar Neupane', '978-9937020020', 'Nepali Literature', 'Award-winning Nepali novel about land and identity.', 550.00, 60, NULL, '2010-01-01', '2026-05-19 06:43:59', '2026-05-19 06:43:59'),
(209, 'Karnali Blues', 'Buddhi Sagar', '978-9937020030', 'Nepali Literature', 'A coming-of-age story from western Nepal.', 600.00, 65, NULL, '2011-01-01', '2026-05-19 06:43:59', '2026-05-19 06:43:59'),
(210, 'Sumnima', 'B.P. Koirala', '978-9937020040', 'Nepali Literature', 'A classic Nepali novel blending myth and realism.', 400.00, 75, NULL, '1971-01-01', '2026-05-19 06:43:59', '2026-05-19 06:43:59'),
(211, 'Sirish Ko Phool', 'Parijat', '978-9937020050', 'Nepali Literature', 'The most celebrated Nepali novel by a female author.', 500.00, 70, NULL, '1965-01-01', '2026-05-19 06:43:59', '2026-05-19 06:43:59'),
(212, 'The Alchemist', 'Paulo Coelho', '978-0062315007', 'Fiction', 'A shepherd\'s magical journey of self-discovery.', 850.00, 90, NULL, '1988-01-01', '2026-05-19 06:43:59', '2026-05-19 06:43:59'),
(213, 'Hari Bahadur', 'Madan Krishna Shrestha', '978-9937020060', 'Fiction', 'A beloved Nepali fictional story.', 650.00, 55, NULL, '2010-01-01', '2026-05-19 06:43:59', '2026-05-19 06:43:59'),
(214, 'A Little Life', 'Hanya Yanagihara', '978-0385539258', 'Fiction', 'Four friends navigate life, trauma and friendship.', 1150.00, 35, NULL, '2015-03-10', '2026-05-19 06:43:59', '2026-05-19 06:43:59'),
(215, 'The Summer I Turned Pretty', 'Jenny Han', '978-1416968290', 'Fiction', 'Belly chooses between two brothers over one unforgettable summer.', 880.00, 50, NULL, '2009-05-05', '2026-05-19 06:43:59', '2026-05-19 06:43:59'),
(216, 'Better Than The Movies', 'Lynn Painter', '978-1534467835', 'Fiction', 'A girl with a romantic view of life finally finds her person.', 750.00, 45, NULL, '2021-05-04', '2026-05-19 06:43:59', '2026-05-19 06:43:59'),
(217, 'Karnali Blues 2', 'Buddhi Sagar', '978-9937020031', 'Fiction', 'A sequel to the beloved Nepali coming-of-age story.', 990.00, 40, NULL, '2016-01-01', '2026-05-19 06:43:59', '2026-05-19 06:43:59'),
(218, 'Palpasa Cafe 2', 'Narayan Wagle', '978-9937020011', 'Fiction', 'The eagerly awaited follow-up to Palpasa Cafe.', 1250.00, 30, NULL, '2018-01-01', '2026-05-19 06:43:59', '2026-05-19 06:43:59'),
(220, 'The Shining', 'Stephen King', '978-0385121675', 'Horror', 'A family heads to an isolated hotel for the winter.', 950.00, 30, NULL, '1977-01-28', '2026-05-19 06:45:35', '2026-05-19 06:45:35'),
(221, 'Dracula', 'Bram Stoker', '978-0486411095', 'Horror', 'The classic vampire tale by Bram Stoker.', 800.00, 40, NULL, '1897-05-26', '2026-05-19 06:45:35', '2026-05-19 06:45:35'),
(222, 'The Exorcist', 'William Peter Blatty', '978-0061007224', 'Horror', 'A mother watches her daughter\'s terrifying possession.', 1050.00, 20, NULL, '1971-06-01', '2026-05-19 06:45:35', '2026-05-19 06:45:35'),
(223, 'Bird Box', 'Josh Malerman', '978-0062259653', 'Horror', 'If you see them, you die. A mother risks everything.', 920.00, 35, NULL, '2014-05-13', '2026-05-19 06:45:35', '2026-05-19 06:45:35'),
(224, 'Mexican Gothic', 'Silvia Moreno-Garcia', '978-0525620785', 'Horror', 'A glamorous socialite investigates a mysterious gothic manor.', 1200.00, 28, NULL, '2020-06-30', '2026-05-19 06:45:35', '2026-05-19 06:45:35'),
(225, 'Summer Love', 'Jenny Han', '978-1416955016', 'Romance', 'A summer that changes everything.', 900.00, 50, NULL, '2009-05-05', '2026-05-19 06:45:35', '2026-05-19 06:45:35'),
(226, 'Saaya', 'Rupa Subba', '978-9937020000', 'Romance', 'A beautiful Nepali romance novel.', 850.00, 45, NULL, '2015-01-01', '2026-05-19 06:45:35', '2026-05-19 06:45:35'),
(227, 'The Love Hypothesis', 'Ali Hazelwood', '978-0593336823', 'Romance', 'A fake-dating romance in the world of academia.', 750.00, 60, NULL, '2021-09-14', '2026-05-19 06:45:35', '2026-05-19 06:45:35'),
(228, 'It Ends With Us', 'Colleen Hoover', '978-1501110368', 'Romance', 'A heart-wrenching love story about strength and survival.', 920.00, 55, NULL, '2016-08-02', '2026-05-19 06:45:35', '2026-05-19 06:45:35'),
(229, 'Me Before You', 'Jojo Moyes', '978-0143124542', 'Romance', 'A quirky girl. A man who\'s given up. A love that changes both.', 1100.00, 42, NULL, '2012-01-05', '2026-05-19 06:45:35', '2026-05-19 06:45:35'),
(230, 'The Fault in Our Stars', 'John Green', '978-0525478812', 'Romance', 'Two teenagers navigate love and illness.', 990.00, 65, NULL, '2012-01-10', '2026-05-19 06:45:35', '2026-05-19 06:45:35'),
(231, 'Funny Story', 'Emily Henry', '978-0593441282', 'Comedy', 'A hilarious tale of unexpected roommates and romance.', 850.00, 38, NULL, '2024-04-23', '2026-05-19 06:45:35', '2026-05-19 06:45:35'),
(232, 'Born a Crime', 'Trevor Noah', '978-0399588174', 'Comedy', 'Stories from a South African childhood – funny and moving.', 950.00, 48, NULL, '2016-11-15', '2026-05-19 06:45:35', '2026-05-19 06:45:35'),
(233, 'Me Talk Pretty One Day', 'David Sedaris', '978-0316776967', 'Comedy', 'Sidesplitting essays on language, family and Paris.', 700.00, 35, NULL, '2000-05-01', '2026-05-19 06:45:35', '2026-05-19 06:45:35'),
(234, 'Is Everyone Hanging Out Without Me?', 'Mindy Kaling', '978-0307886279', 'Comedy', 'Mindy Kaling\'s candid and hilarious memoir.', 1100.00, 30, NULL, '2011-11-01', '2026-05-19 06:45:35', '2026-05-19 06:45:35'),
(235, 'The Hitchhiker\'s Guide to the Galaxy', 'Douglas Adams', '978-0345391803', 'Comedy', 'Don\'t panic! The definitive guide to the universe.', 1200.00, 40, NULL, '1979-10-12', '2026-05-19 06:45:35', '2026-05-19 06:45:35'),
(236, 'Bossypants', 'Tina Fey', '978-0316056878', 'Comedy', 'Tina Fey\'s hilarious memoir from comedy writer to 30 Rock.', 900.00, 33, NULL, '2011-04-05', '2026-05-19 06:45:35', '2026-05-19 06:45:35'),
(237, 'Muna Madan', 'Laxmi Prasad Devkota', '978-9937060000', 'Nepali Literature', 'The most beloved Nepali poem, a tragic love story.', 450.00, 80, NULL, '1936-01-01', '2026-05-19 06:45:35', '2026-05-19 06:45:35'),
(238, 'Palpasa Cafe', 'Narayan Wagle', '978-9937020010', 'Nepali Literature', 'A novel set during Nepal\'s civil conflict.', 650.00, 70, NULL, '2005-01-01', '2026-05-19 06:45:35', '2026-05-19 06:45:35'),
(239, 'Seto Dharti', 'Amar Neupane', '978-9937020020', 'Nepali Literature', 'Award-winning Nepali novel about land and identity.', 550.00, 60, NULL, '2010-01-01', '2026-05-19 06:45:35', '2026-05-19 06:45:35'),
(240, 'Karnali Blues', 'Buddhi Sagar', '978-9937020030', 'Nepali Literature', 'A coming-of-age story from western Nepal.', 600.00, 65, NULL, '2011-01-01', '2026-05-19 06:45:35', '2026-05-19 06:45:35'),
(241, 'Sumnima', 'B.P. Koirala', '978-9937020040', 'Nepali Literature', 'A classic Nepali novel blending myth and realism.', 400.00, 75, NULL, '1971-01-01', '2026-05-19 06:45:35', '2026-05-19 06:45:35'),
(242, 'Sirish Ko Phool', 'Parijat', '978-9937020050', 'Nepali Literature', 'The most celebrated Nepali novel by a female author.', 500.00, 70, NULL, '1965-01-01', '2026-05-19 06:45:35', '2026-05-19 06:45:35'),
(243, 'The Alchemist', 'Paulo Coelho', '978-0062315007', 'Fiction', 'A shepherd\'s magical journey of self-discovery.', 850.00, 90, NULL, '1988-01-01', '2026-05-19 06:45:35', '2026-05-19 06:45:35'),
(244, 'Hari Bahadur', 'Madan Krishna Shrestha', '978-9937020060', 'Fiction', 'A beloved Nepali fictional story.', 650.00, 55, NULL, '2010-01-01', '2026-05-19 06:45:35', '2026-05-19 06:45:35'),
(245, 'A Little Life', 'Hanya Yanagihara', '978-0385539258', 'Fiction', 'Four friends navigate life, trauma and friendship.', 1150.00, 35, NULL, '2015-03-10', '2026-05-19 06:45:35', '2026-05-19 06:45:35'),
(246, 'The Summer I Turned Pretty', 'Jenny Han', '978-1416968290', 'Fiction', 'Belly chooses between two brothers over one unforgettable summer.', 880.00, 50, NULL, '2009-05-05', '2026-05-19 06:45:35', '2026-05-19 06:45:35'),
(247, 'Better Than The Movies', 'Lynn Painter', '978-1534467835', 'Fiction', 'A girl with a romantic view of life finally finds her person.', 750.00, 45, NULL, '2021-05-04', '2026-05-19 06:45:35', '2026-05-19 06:45:35'),
(248, 'Karnali Blues 2', 'Buddhi Sagar', '978-9937020031', 'Fiction', 'A sequel to the beloved Nepali coming-of-age story.', 990.00, 40, NULL, '2016-01-01', '2026-05-19 06:45:35', '2026-05-19 06:45:35'),
(249, 'Palpasa Cafe 2', 'Narayan Wagle', '978-9937020011', 'Fiction', 'The eagerly awaited follow-up to Palpasa Cafe.', 1250.00, 30, NULL, '2018-01-01', '2026-05-19 06:45:35', '2026-05-19 06:45:35'),
(250, 'IT', 'Stephen King', '978-0670813028', 'Horror', 'A terrifying clown haunts the town of Derry.', 1100.00, 25, NULL, '1986-09-15', '2026-05-20 10:15:01', '2026-05-20 10:15:01'),
(251, 'The Shining', 'Stephen King', '978-0385121675', 'Horror', 'A family heads to an isolated hotel for the winter.', 950.00, 30, NULL, '1977-01-28', '2026-05-20 10:15:01', '2026-05-20 10:15:01'),
(252, 'Dracula', 'Bram Stoker', '978-0486411095', 'Horror', 'The classic vampire tale by Bram Stoker.', 800.00, 40, NULL, '1897-05-26', '2026-05-20 10:15:01', '2026-05-20 10:15:01'),
(253, 'The Exorcist', 'William Peter Blatty', '978-0061007224', 'Horror', 'A mother watches her daughter\'s terrifying possession.', 1050.00, 20, NULL, '1971-06-01', '2026-05-20 10:15:01', '2026-05-20 10:15:01'),
(254, 'Bird Box', 'Josh Malerman', '978-0062259653', 'Horror', 'If you see them, you die. A mother risks everything.', 920.00, 35, NULL, '2014-05-13', '2026-05-20 10:15:01', '2026-05-20 10:15:01'),
(255, 'Mexican Gothic', 'Silvia Moreno-Garcia', '978-0525620785', 'Horror', 'A glamorous socialite investigates a mysterious gothic manor.', 1200.00, 28, NULL, '2020-06-30', '2026-05-20 10:15:01', '2026-05-20 10:15:01'),
(256, 'Summer Love', 'Jenny Han', '978-1416955016', 'Romance', 'A summer that changes everything.', 900.00, 50, NULL, '2009-05-05', '2026-05-20 10:15:01', '2026-05-20 10:15:01'),
(257, 'Saaya', 'Rupa Subba', '978-9937020000', 'Romance', 'A beautiful Nepali romance novel.', 850.00, 45, NULL, '2015-01-01', '2026-05-20 10:15:01', '2026-05-20 10:15:01'),
(258, 'The Love Hypothesis', 'Ali Hazelwood', '978-0593336823', 'Romance', 'A fake-dating romance in the world of academia.', 750.00, 60, NULL, '2021-09-14', '2026-05-20 10:15:01', '2026-05-20 10:15:01'),
(259, 'It Ends With Us', 'Colleen Hoover', '978-1501110368', 'Romance', 'A heart-wrenching love story about strength and survival.', 920.00, 55, NULL, '2016-08-02', '2026-05-20 10:15:01', '2026-05-20 10:15:01'),
(260, 'Me Before You', 'Jojo Moyes', '978-0143124542', 'Romance', 'A quirky girl. A man who\'s given up. A love that changes both.', 1100.00, 42, NULL, '2012-01-05', '2026-05-20 10:15:01', '2026-05-20 10:15:01'),
(261, 'The Fault in Our Stars', 'John Green', '978-0525478812', 'Romance', 'Two teenagers navigate love and illness.', 990.00, 65, NULL, '2012-01-10', '2026-05-20 10:15:01', '2026-05-20 10:15:01'),
(262, 'Funny Story', 'Emily Henry', '978-0593441282', 'Comedy', 'A hilarious tale of unexpected roommates and romance.', 850.00, 38, NULL, '2024-04-23', '2026-05-20 10:15:01', '2026-05-20 10:15:01'),
(263, 'Born a Crime', 'Trevor Noah', '978-0399588174', 'Comedy', 'Stories from a South African childhood – funny and moving.', 950.00, 48, NULL, '2016-11-15', '2026-05-20 10:15:01', '2026-05-20 10:15:01'),
(264, 'Me Talk Pretty One Day', 'David Sedaris', '978-0316776967', 'Comedy', 'Sidesplitting essays on language, family and Paris.', 700.00, 35, NULL, '2000-05-01', '2026-05-20 10:15:01', '2026-05-20 10:15:01'),
(265, 'Is Everyone Hanging Out Without Me?', 'Mindy Kaling', '978-0307886279', 'Comedy', 'Mindy Kaling\'s candid and hilarious memoir.', 1100.00, 30, NULL, '2011-11-01', '2026-05-20 10:15:01', '2026-05-20 10:15:01'),
(266, 'The Hitchhiker\'s Guide to the Galaxy', 'Douglas Adams', '978-0345391803', 'Comedy', 'Don\'t panic! The definitive guide to the universe.', 1200.00, 40, NULL, '1979-10-12', '2026-05-20 10:15:01', '2026-05-20 10:15:01'),
(267, 'Bossypants', 'Tina Fey', '978-0316056878', 'Comedy', 'Tina Fey\'s hilarious memoir from comedy writer to 30 Rock.', 900.00, 33, NULL, '2011-04-05', '2026-05-20 10:15:01', '2026-05-20 10:15:01'),
(268, 'Muna Madan', 'Laxmi Prasad Devkota', '978-9937060000', 'Nepali Literature', 'The most beloved Nepali poem, a tragic love story.', 450.00, 80, NULL, '1936-01-01', '2026-05-20 10:15:01', '2026-05-20 10:15:01'),
(269, 'Palpasa Cafe', 'Narayan Wagle', '978-9937020010', 'Nepali Literature', 'A novel set during Nepal\'s civil conflict.', 650.00, 70, NULL, '2005-01-01', '2026-05-20 10:15:01', '2026-05-20 10:15:01'),
(270, 'Seto Dharti', 'Amar Neupane', '978-9937020020', 'Nepali Literature', 'Award-winning Nepali novel about land and identity.', 550.00, 60, NULL, '2010-01-01', '2026-05-20 10:15:01', '2026-05-20 10:15:01'),
(271, 'Karnali Blues', 'Buddhi Sagar', '978-9937020030', 'Nepali Literature', 'A coming-of-age story from western Nepal.', 600.00, 65, NULL, '2011-01-01', '2026-05-20 10:15:01', '2026-05-20 10:15:01'),
(272, 'Sumnima', 'B.P. Koirala', '978-9937020040', 'Nepali Literature', 'A classic Nepali novel blending myth and realism.', 400.00, 75, NULL, '1971-01-01', '2026-05-20 10:15:01', '2026-05-20 10:15:01'),
(273, 'Sirish Ko Phool', 'Parijat', '978-9937020050', 'Nepali Literature', 'The most celebrated Nepali novel by a female author.', 500.00, 70, NULL, '1965-01-01', '2026-05-20 10:15:01', '2026-05-20 10:15:01'),
(274, 'The Alchemist', 'Paulo Coelho', '978-0062315007', 'Fiction', 'A shepherd\'s magical journey of self-discovery.', 850.00, 90, NULL, '1988-01-01', '2026-05-20 10:15:01', '2026-05-20 10:15:01'),
(275, 'Hari Bahadur', 'Madan Krishna Shrestha', '978-9937020060', 'Fiction', 'A beloved Nepali fictional story.', 650.00, 55, NULL, '2010-01-01', '2026-05-20 10:15:01', '2026-05-20 10:15:01'),
(276, 'A Little Life', 'Hanya Yanagihara', '978-0385539258', 'Fiction', 'Four friends navigate life, trauma and friendship.', 1150.00, 35, NULL, '2015-03-10', '2026-05-20 10:15:01', '2026-05-20 10:15:01'),
(277, 'The Summer I Turned Pretty', 'Jenny Han', '978-1416968290', 'Fiction', 'Belly chooses between two brothers over one unforgettable summer.', 880.00, 50, NULL, '2009-05-05', '2026-05-20 10:15:01', '2026-05-20 10:15:01'),
(278, 'Better Than The Movies', 'Lynn Painter', '978-1534467835', 'Fiction', 'A girl with a romantic view of life finally finds her person.', 750.00, 45, NULL, '2021-05-04', '2026-05-20 10:15:01', '2026-05-20 10:15:01'),
(282, 'A Little Life', 'Hanya Yanagihara', NULL, 'Romance', 'A Little Life follows four college classmates broke, adrift, and buoyed only by their friendship and ambition as they move to New York in search of fame and fortune.', 950.00, 19, 'images/uploads/book_fccea0e6-c7c6-4ced-a842-d790c4953364.jpg', NULL, '2026-05-20 15:38:26', '2026-05-20 15:38:26'),
(283, 'November 9', 'Colleen Hoover', NULL, 'Romance', 'A SPECIAL COLLECTOR\'S EDITION for the gripping tale of love, secrets and betrayal from the beloved #1 Sunday Times bestselling author.', 1000.00, 30, 'images/uploads/book_d637313f-b996-465c-a81c-22916dd4d0d4.jpg', NULL, '2026-05-21 04:36:33', '2026-05-21 04:36:33'),
(284, 'Nyaya', 'Sushila Karki', NULL, 'Nepali Literature', '', 800.00, 10, 'images/uploads/book_6d4a6af4-0794-48c2-bccd-2b74bac63014.webp', NULL, '2026-05-21 05:19:25', '2026-05-21 05:19:25');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `cart_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `added_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `total_amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `status` varchar(30) NOT NULL DEFAULT 'Pending',
  `shipping_address` text DEFAULT NULL,
  `order_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `user_id`, `total_amount`, `status`, `shipping_address`, `order_date`) VALUES
(1, 12, 1200.00, 'pending', 'Kathmandu', '2026-05-19 05:51:32'),
(2, 12, 500.00, 'pending', 'Kathmandu', '2026-05-19 05:54:11'),
(3, 12, 500.00, 'pending', 'Kathmandu', '2026-05-19 05:57:18'),
(4, 12, 500.00, 'pending', 'Kapan', '2026-05-19 06:09:41'),
(1002, 12, 950.00, 'pending', 'Kathmandu', '2026-05-20 16:00:09'),
(1003, 12, 1100.00, 'pending', 'ktm', '2026-05-21 06:44:01');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `item_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `unit_price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`item_id`, `order_id`, `book_id`, `quantity`, `unit_price`) VALUES
(1, 1, 6, 1, 1200.00),
(5, 1002, 2, 1, 950.00),
(6, 1003, 1, 1, 1100.00);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `username` varchar(50) NOT NULL,
  `dob` date DEFAULT NULL,
  `gender` enum('Male','Female','Other') DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `number` varchar(20) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `status` varchar(20) DEFAULT 'Active',
  `registration_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `role` varchar(20) DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `first_name`, `last_name`, `username`, `dob`, `gender`, `email`, `number`, `password`, `status`, `registration_date`, `role`) VALUES
(2, 'Prashna', 'Karki', 'prashnaa', '2026-05-04', 'Female', 'prashna@gmail.com', '980766555', '$2a$10$cN09ARfObf26UU6gifr8quiRrSAPem3W/xPM6jPUOko3NUnDuuxXS', 'Active', '2026-05-11 04:22:35', 'user'),
(11, 'Admin', 'Karki', 'admin', '2026-05-13', 'Female', 'admin@gmail.com', '980766555', '$2a$10$6BTDvfI59tRZnFN4YVPX1..R0s3Th.0sp4xCHhVXd9j5h9nDm1L9m', 'Active', '2026-05-18 13:50:56', 'user'),
(12, 'Prashnana', 'Karkee', 'prashna', '2026-05-13', 'Female', 'p@gmail.com', '980766555', '$2a$10$LTN0iweUW9FQJkgG7DJ8LeGGjR1/OBpmaiicPzKHD4XluFgf1j5ua', 'Active', '2026-05-19 04:48:37', 'user'),
(15, 'prashna', 'karki', 'prashnana', '2008-06-10', 'Female', 'pk@gmail.com', '9810356781', '$2a$10$CbwT.wIT5DhbU0MkEX7c4e6zDFENfpt2ikyCV.khYl.4p8b14gX2u', 'Active', '2026-05-20 15:10:48', 'user');

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `wishlist_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL,
  `added_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`admin_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`book_id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cart_id`),
  ADD UNIQUE KEY `uq_user_book` (`user_id`,`book_id`),
  ADD KEY `book_id` (`book_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`item_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `book_id` (`book_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`wishlist_id`),
  ADD UNIQUE KEY `uq_wish_user_book` (`user_id`,`book_id`),
  ADD KEY `book_id` (`book_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `book_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=285;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `cart_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1004;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `wishlist_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`book_id`) REFERENCES `books` (`book_id`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`book_id`) REFERENCES `books` (`book_id`) ON DELETE CASCADE;

--
-- Constraints for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD CONSTRAINT `wishlist_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `wishlist_ibfk_2` FOREIGN KEY (`book_id`) REFERENCES `books` (`book_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
