-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jan 22, 2021 at 01:00 AM
-- Server version: 8.0.17
-- PHP Version: 7.3.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `copy_laravel_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `photo` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'brand_default.png',
  `product_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `name`, `photo`, `product_id`) VALUES
(1, 'isis', 'brand_photo.jpg', 1),
(2, 'emtnan', 'brand_photo.jpg', 2);

-- --------------------------------------------------------

--
-- Table structure for table `categorys`
--

CREATE TABLE `categorys` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `photo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'category_default.png'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `categorys`
--

INSERT INTO `categorys` (`id`, `name`, `photo`) VALUES
(1, 'Herbs', 'Cat_1.jpg'),
(2, 'Drinks', 'Cat_2.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `deliverys`
--

CREATE TABLE `deliverys` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `license` varchar(50) NOT NULL,
  `license_endDate` date NOT NULL,
  `status` int(1) NOT NULL COMMENT '0->ready 1->on its way 2->delivered',
  `supplier_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `deliverys`
--

INSERT INTO `deliverys` (`id`, `name`, `license`, `license_endDate`, `status`, `supplier_id`) VALUES
(1, 'D/ Sherief Gamal', '12345678912345', '2030-08-13', 0, 11),
(2, 'D/ Ehab Ahmed', '89123412345675', '2028-09-13', 0, 12),
(3, 'D/ Said Mohamed', '12323454567891', '2024-08-20', 0, 10);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('mennah555@gmail.com', '$2y$10$iNz7hihQnDvxQvxDJJsBWO0IQISErPT18LslYtkgW3G.P2g/wVEuq', '2021-01-19 00:56:26');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) UNSIGNED NOT NULL,
  `name_en` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name_ar` varchar(255) DEFAULT NULL,
  `details_ar` text,
  `details_en` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `photo` varchar(255) NOT NULL DEFAULT 'product-1.jpg',
  `price` float(8,2) DEFAULT NULL,
  `code` int(10) DEFAULT NULL,
  `views` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `brand_id` int(11) UNSIGNED DEFAULT NULL,
  `subcategory_id` int(10) UNSIGNED DEFAULT NULL,
  `order_id` int(10) UNSIGNED DEFAULT NULL,
  `supplier_id` int(10) UNSIGNED DEFAULT NULL,
  `offer_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name_en`, `name_ar`, `details_ar`, `details_en`, `photo`, `price`, `code`, `views`, `created_at`, `user_id`, `brand_id`, `subcategory_id`, `order_id`, `supplier_id`, `offer_id`) VALUES
(1, 'Oregano8', 'tbrvfcd', 'وريم ايبسوم دولار سيت أميت ,كونسيكتيتور أدايبا يسكينج أليايت,سيت دو أيوسمود تيمبور\r\n\r\nأنكايديديونتيوت لابوري ات دولار ماجنا أليكيوا . يوت انيم أد مينيم فينايم,كيواس نوستريد\r\n\r\nأكسير سيتاشن يللأمكو لابورأس نيسي يت أليكيوب أكس أيا كوممودو كونسيكيوات . ديواس\r\n\r\nأيوتي أريري دولار إن ريبريهينديرأيت فوليوبتاتي فيلايت أيسسي كايلليوم دولار أيو فيجايت\r\n\r\nنيولا باراياتيور. أيكسسيبتيور ساينت أوككايكات كيوبايداتات نون بروايدينت ,سيونت ان كيولبا\r\n\r\nكيو أوفيسيا ديسيريونتموليت انيم أيدي ايست لابوريوم.سيت يتبيرسبايكياتيس يوندي أومنيس أستي ناتيس أيررور سيت فوليبتاتيم أكيسأنتييوم\r\n\r\nدولاريمكيو لايودانتيوم,توتام ريم أبيرأم,أيكيو أبسا كيواي أب أللو أنفينتوري فيرأتاتيس ايت\r\n\r\nكياسي أرشيتيكتو بيتاي فيتاي ديكاتا سيونت أكسبليكابو. نيمو أنيم أبسام فوليوباتاتيم كيواي', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsa mollitia quae obcaecati molestias non consequatur excepturi temporibus quibusdam ad hic doloremque optio voluptatem, possimus eum porro nemo, distinctio corporis odit totam libero, eligendi recusandae eius consectetur! Perspiciatis ullam hic adipisci ad? Eveniet iure eligendi ex dolorem. Repudiandae sapiente quibusdam doloribus.', '1611005381.jpg', 500.00, 123, 1, '2021-01-14 14:08:23', 118, 1, 4, NULL, 11, NULL),
(2, 'Kale', 'خس', 'لوريم ايبسوم دولار سيت أميت ,كونسيكتيتور أدايبا يسكينج أليايت,سيت دو أيوسمود تيمبور\r\n\r\nأنكايديديونتيوت لابوري ات دولار ماجنا أليكيوا . يوت انيم أد مينيم فينايم,كيواس نوستريد\r\n\r\nأكسير سيتاشن يللأمكو لابورأس نيسي يت أليكيوب أكس أيا كوممودو كونسيكيوات . ديواس\r\n\r\nأيوتي أريري دولار إن ريبريهينديرأيت فوليوبتاتي فيلايت أيسسي كايلليوم دولار أيو فيجايت\r\n\r\nنيولا باراياتيور. أيكسسيبتيور ساينت أوككايكات كيوبايداتات نون بروايدينت ,سيونت ان كيولبا\r\n\r\nكيو أوفيسيا ديسيريونتموليت انيم أيدي ايست لابوريوم.سيت يتبيرسبايكياتيس يوندي أومنيس أستي ناتيس أيررور سيت فوليبتاتيم أكيسأنتييوم\r\n\r\nدولاريمكيو لايودانتيوم,توتام ريم أبيرأم,أيكيو أبسا كيواي أب أللو أنفينتوري فيرأتاتيس ايت\r\n\r\nكياسي أرشيتيكتو بيتاي فيتاي ديكاتا سيونت أكسبليكابو. نيمو أنيم أبسام فوليوباتاتيم كيواي\r\n\r\nفوليوبتاس سايت أسبيرناتشر أيوت أودايت أيوت فيوجايت, سيد كيواي كونسيكيونتشر ماجناي\r\n\r\nدولارس أيوس كيواي راتاشن فوليوبتاتيم سيكيواي نيسكايونت. نيكيو بوررو كيوايسكيوم\r\n\r\nايست,كيواي دولوريم ايبسيوم كيوا دولار سايت أميت, كونسيكتيتيور,أديبايسكاي فيلايت, سيد\r\n\r\nكيواي نون نيومكيوام ايايوس موداي تيمبورا انكايديونت يوت لابوري أيت دولار ماجنام\r\n\r\nألايكيوام كيوايرات فوليوبتاتيم. يوت اينايم أد مينيما فينيام, كيواس نوستريوم أكسيركايتاشيم\r\n\r\nيلامكوربوريس سيوسكايبيت لابورايوسام, نايساي يوت ألايكيوايد أكس أيا كوموداي', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsa mollitia quae obcaecati molestias non consequatur excepturi temporibus quibusdam ad hic doloremque optio voluptatem, possimus eum porro nemo, distinctio corporis odit totam libero, eligendi recusandae eius consectetur! Perspiciatis ullam hic adipisci ad? Eveniet iure eligendi ex dolorem. Repudiandae sapiente quibusdam doloribus.', '1611090205.png', 500.00, 321, 1, '2021-01-14 14:08:23', 129, 1, 5, NULL, 12, NULL),
(4, 'Green Tea', 'شاى أخضر', 'لوريم ايبسوم دولار سيت أميت ,كونسيكتيتور أدايبا يسكينج أليايت,سيت دو أيوسمود تيمبور\r\n\r\nأنكايديديونتيوت لابوري ات دولار ماجنا أليكيوا . يوت انيم أد مينيم فينايم,كيواس نوستريد\r\n\r\nأكسير سيتاشن يللأمكو لابورأس نيسي يت أليكيوب أكس أيا كوممودو كونسيكيوات . ديواس\r\n\r\nأيوتي أريري دولار إن ريبريهينديرأيت فوليوبتاتي فيلايت أيسسي كايلليوم دولار أيو فيجايت\r\n\r\nنيولا باراياتيور. أيكسسيبتيور ساينت أوككايكات كيوبايداتات نون بروايدينت ,سيونت ان كيولبا\r\n\r\nكيو أوفيسيا ديسيريونتموليت انيم أيدي ايست لابوريوم.سيت يتبيرسبايكياتيس يوندي أومنيس أستي ناتيس أيررور سيت فوليبتاتيم أكيسأنتييوم\r\n\r\nدولاريمكيو لايودانتيوم,توتام ريم أبيرأم,أيكيو أبسا كيواي أب أللو أنفينتوري فيرأتاتيس ايت\r\n\r\nكياسي أرشيتيكتو بيتاي فيتاي ديكاتا سيونت أكسبليكابو. نيمو أنيم أبسام فوليوباتاتيم كيواي\r\n\r\nفوليوبتاس سايت أسبيرناتشر أيوت أودايت أيوت فيوجايت, سيد كيواي كونسيكيونتشر ماجناي\r\n\r\nدولارس أيوس كيواي راتاشن فوليوبتاتيم سيكيواي نيسكايونت. نيكيو بوررو كيوايسكيوم\r\n\r\nايست,كيواي دولوريم ايبسيوم كيوا دولار سايت أميت, كونسيكتيتيور,أديبايسكاي فيلايت, سيد\r\n\r\nكيواي نون نيومكيوام ايايوس موداي تيمبورا انكايديونت يوت لابوري أيت دولار ماجنام\r\n\r\nألايكيوام كيوايرات فوليوبتاتيم. يوت اينايم أد مينيما فينيام, كيواس نوستريوم أكسيركايتاشيم\r\n\r\nيلامكوربوريس سيوسكايبيت لابورايوسام, نايساي يوت ألايكيوايد أكس أيا كوموداي', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsa mollitia quae obcaecati molestias non consequatur excepturi temporibus quibusdam ad hic doloremque optio voluptatem, possimus eum porro nemo, distinctio corporis odit totam libero, eligendi recusandae eius consectetur! Perspiciatis ullam hic adipisci ad? Eveniet iure eligendi ex dolorem. Repudiandae sapiente quibusdam doloribus.', '1611090674.png', 90.00, 1111111, 16, '2021-01-15 10:28:27', 129, 1, 1, NULL, 10, NULL),
(5, 'Hibiscus', 'كركديه', 'لوريم ايبسوم دولار سيت أميت ,كونسيكتيتور أدايبا يسكينج أليايت,سيت دو أيوسمود تيمبور\r\n\r\nأنكايديديونتيوت لابوري ات دولار ماجنا أليكيوا . يوت انيم أد مينيم فينايم,كيواس نوستريد\r\n\r\nأكسير سيتاشن يللأمكو لابورأس نيسي يت أليكيوب أكس أيا كوممودو كونسيكيوات . ديواس\r\n\r\nأيوتي أريري دولار إن ريبريهينديرأيت فوليوبتاتي فيلايت أيسسي كايلليوم دولار أيو فيجايت\r\n\r\nنيولا باراياتيور. أيكسسيبتيور ساينت أوككايكات كيوبايداتات نون بروايدينت ,سيونت ان كيولبا\r\n\r\nكيو أوفيسيا ديسيريونتموليت انيم أيدي ايست لابوريوم.سيت يتبيرسبايكياتيس يوندي أومنيس أستي ناتيس أيررور سيت فوليبتاتيم أكيسأنتييوم\r\n\r\nدولاريمكيو لايودانتيوم,توتام ريم أبيرأم,أيكيو أبسا كيواي أب أللو أنفينتوري فيرأتاتيس ايت\r\n\r\nكياسي أرشيتيكتو بيتاي فيتاي ديكاتا سيونت أكسبليكابو. نيمو أنيم أبسام فوليوباتاتيم كيواي\r\n\r\nفوليوبتاس سايت أسبيرناتشر أيوت أودايت أيوت فيوجايت, سيد كيواي كونسيكيونتشر ماجناي\r\n\r\nدولارس أيوس كيواي راتاشن فوليوبتاتيم سيكيواي نيسكايونت. نيكيو بوررو كيوايسكيوم\r\n\r\nايست,كيواي دولوريم ايبسيوم كيوا دولار سايت أميت, كونسيكتيتيور,أديبايسكاي فيلايت, سيد\r\n\r\nكيواي نون نيومكيوام ايايوس موداي تيمبورا انكايديونت يوت لابوري أيت دولار ماجنام\r\n\r\nألايكيوام كيوايرات فوليوبتاتيم. يوت اينايم أد مينيما فينيام, كيواس نوستريوم أكسيركايتاشيم\r\n\r\nيلامكوربوريس سيوسكايبيت لابورايوسام, نايساي يوت ألايكيوايد أكس أيا كوموداي', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsa mollitia quae obcaecati molestias non consequatur excepturi temporibus quibusdam ad hic doloremque optio voluptatem, possimus eum porro nemo, distinctio corporis odit totam libero, eligendi recusandae eius consectetur! Perspiciatis ullam hic adipisci ad? Eveniet iure eligendi ex dolorem. Repudiandae sapiente quibusdam doloribus.', 'product-4.jpg', 100.00, 88888, NULL, '2021-01-15 10:28:27', 118, 1, 2, NULL, 12, NULL),
(6, 'Anise', 'ينسون', 'لوريم ايبسوم دولار سيت أميت ,كونسيكتيتور أدايبا يسكينج أليايت,سيت دو أيوسمود تيمبور\r\n\r\nأنكايديديونتيوت لابوري ات دولار ماجنا أليكيوا . يوت انيم أد مينيم فينايم,كيواس نوستريد\r\n\r\nأكسير سيتاشن يللأمكو لابورأس نيسي يت أليكيوب أكس أيا كوممودو كونسيكيوات . ديواس\r\n\r\nأيوتي أريري دولار إن ريبريهينديرأيت فوليوبتاتي فيلايت أيسسي كايلليوم دولار أيو فيجايت\r\n\r\nنيولا باراياتيور. أيكسسيبتيور ساينت أوككايكات كيوبايداتات نون بروايدينت ,سيونت ان كيولبا\r\n\r\nكيو أوفيسيا ديسيريونتموليت انيم أيدي ايست لابوريوم.سيت يتبيرسبايكياتيس يوندي أومنيس أستي ناتيس أيررور سيت فوليبتاتيم أكيسأنتييوم\r\n\r\nدولاريمكيو لايودانتيوم,توتام ريم أبيرأم,أيكيو أبسا كيواي أب أللو أنفينتوري فيرأتاتيس ايت\r\n\r\nكياسي أرشيتيكتو بيتاي فيتاي ديكاتا سيونت أكسبليكابو. نيمو أنيم أبسام فوليوباتاتيم كيواي\r\n\r\nفوليوبتاس سايت أسبيرناتشر أيوت أودايت أيوت فيوجايت, سيد كيواي كونسيكيونتشر ماجناي\r\n\r\nدولارس أيوس كيواي راتاشن فوليوبتاتيم سيكيواي نيسكايونت. نيكيو بوررو كيوايسكيوم\r\n\r\nايست,كيواي دولوريم ايبسيوم كيوا دولار سايت أميت, كونسيكتيتيور,أديبايسكاي فيلايت, سيد\r\n\r\nكيواي نون نيومكيوام ايايوس موداي تيمبورا انكايديونت يوت لابوري أيت دولار ماجنام\r\n\r\nألايكيوام كيوايرات فوليوبتاتيم. يوت اينايم أد مينيما فينيام, كيواس نوستريوم أكسيركايتاشيم\r\n\r\nيلامكوربوريس سيوسكايبيت لابورايوسام, نايساي يوت ألايكيوايد أكس أيا كوموداي', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsa mollitia quae obcaecati molestias non consequatur excepturi temporibus quibusdam ad hic doloremque optio voluptatem, possimus eum porro nemo, distinctio corporis odit totam libero, eligendi recusandae eius consectetur! Perspiciatis ullam hic adipisci ad? Eveniet iure eligendi ex dolorem. Repudiandae sapiente quibusdam doloribus.', 'product-5.jpg', 200.00, 88899, NULL, '2021-01-15 10:31:11', 118, 2, 2, NULL, 11, NULL),
(7, 'Thyme', 'زعتر', 'لوريم ايبسوم دولار سيت أميت ,كونسيكتيتور أدايبا يسكينج أليايت,سيت دو أيوسمود تيمبور\r\n\r\nأنكايديديونتيوت لابوري ات دولار ماجنا أليكيوا . يوت انيم أد مينيم فينايم,كيواس نوستريد\r\n\r\nأكسير سيتاشن يللأمكو لابورأس نيسي يت أليكيوب أكس أيا كوممودو كونسيكيوات . ديواس\r\n\r\nأيوتي أريري دولار إن ريبريهينديرأيت فوليوبتاتي فيلايت أيسسي كايلليوم دولار أيو فيجايت\r\n\r\nنيولا باراياتيور. أيكسسيبتيور ساينت أوككايكات كيوبايداتات نون بروايدينت ,سيونت ان كيولبا\r\n\r\nكيو أوفيسيا ديسيريونتموليت انيم أيدي ايست لابوريوم.سيت يتبيرسبايكياتيس يوندي أومنيس أستي ناتيس أيررور سيت فوليبتاتيم أكيسأنتييوم\r\n\r\nدولاريمكيو لايودانتيوم,توتام ريم أبيرأم,أيكيو أبسا كيواي أب أللو أنفينتوري فيرأتاتيس ايت\r\n\r\nكياسي أرشيتيكتو بيتاي فيتاي ديكاتا سيونت أكسبليكابو. نيمو أنيم أبسام فوليوباتاتيم كيواي\r\n\r\nفوليوبتاس سايت أسبيرناتشر أيوت أودايت أيوت فيوجايت, سيد كيواي كونسيكيونتشر ماجناي\r\n\r\nدولارس أيوس كيواي راتاشن فوليوبتاتيم سيكيواي نيسكايونت. نيكيو بوررو كيوايسكيوم\r\n\r\nايست,كيواي دولوريم ايبسيوم كيوا دولار سايت أميت, كونسيكتيتيور,أديبايسكاي فيلايت, سيد\r\n\r\nكيواي نون نيومكيوام ايايوس موداي تيمبورا انكايديونت يوت لابوري أيت دولار ماجنام\r\n\r\nألايكيوام كيوايرات فوليوبتاتيم. يوت اينايم أد مينيما فينيام, كيواس نوستريوم أكسيركايتاشيم\r\n\r\nيلامكوربوريس سيوسكايبيت لابورايوسام, نايساي يوت ألايكيوايد أكس أيا كوموداي', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsa mollitia quae obcaecati molestias non consequatur excepturi temporibus quibusdam ad hic doloremque optio voluptatem, possimus eum porro nemo, distinctio corporis odit totam libero, eligendi recusandae eius consectetur! Perspiciatis ullam hic adipisci ad? Eveniet iure eligendi ex dolorem. Repudiandae sapiente quibusdam doloribus.', 'product-6.jpg', 300.00, 1114477, NULL, '2021-01-15 10:31:11', 129, 2, 4, NULL, 10, NULL),
(8, 'Tea', 'شاى', 'لوريم ايبسوم دولار سيت أميت ,كونسيكتيتور أدايبا يسكينج أليايت,سيت دو أيوسمود تيمبور\r\n\r\nأنكايديديونتيوت لابوري ات دولار ماجنا أليكيوا . يوت انيم أد مينيم فينايم,كيواس نوستريد\r\n\r\nأكسير سيتاشن يللأمكو لابورأس نيسي يت أليكيوب أكس أيا كوممودو كونسيكيوات . ديواس\r\n\r\nأيوتي أريري دولار إن ريبريهينديرأيت فوليوبتاتي فيلايت أيسسي كايلليوم دولار أيو فيجايت\r\n\r\nنيولا باراياتيور. أيكسسيبتيور ساينت أوككايكات كيوبايداتات نون بروايدينت ,سيونت ان كيولبا\r\n\r\nكيو أوفيسيا ديسيريونتموليت انيم أيدي ايست لابوريوم.سيت يتبيرسبايكياتيس يوندي أومنيس أستي ناتيس أيررور سيت فوليبتاتيم أكيسأنتييوم\r\n\r\nدولاريمكيو لايودانتيوم,توتام ريم أبيرأم,أيكيو أبسا كيواي أب أللو أنفينتوري فيرأتاتيس ايت\r\n\r\nكياسي أرشيتيكتو بيتاي فيتاي ديكاتا سيونت أكسبليكابو. نيمو أنيم أبسام فوليوباتاتيم كيواي\r\n\r\nفوليوبتاس سايت أسبيرناتشر أيوت أودايت أيوت فيوجايت, سيد كيواي كونسيكيونتشر ماجناي\r\n\r\nدولارس أيوس كيواي راتاشن فوليوبتاتيم سيكيواي نيسكايونت. نيكيو بوررو كيوايسكيوم\r\n\r\nايست,كيواي دولوريم ايبسيوم كيوا دولار سايت أميت, كونسيكتيتيور,أديبايسكاي فيلايت, سيد\r\n\r\nكيواي نون نيومكيوام ايايوس موداي تيمبورا انكايديونت يوت لابوري أيت دولار ماجنام\r\n\r\nألايكيوام كيوايرات فوليوبتاتيم. يوت اينايم أد مينيما فينيام, كيواس نوستريوم أكسيركايتاشيم\r\n\r\nيلامكوربوريس سيوسكايبيت لابورايوسام, نايساي يوت ألايكيوايد أكس أيا كوموداي', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsa mollitia quae obcaecati molestias non consequatur excepturi temporibus quibusdam ad hic doloremque optio voluptatem, possimus eum porro nemo, distinctio corporis odit totam libero, eligendi recusandae eius consectetur! Perspiciatis ullam hic adipisci ad? Eveniet iure eligendi ex dolorem. Repudiandae sapiente quibusdam doloribus.', 'product-7.jpg', 190.00, 3546, NULL, '2021-01-15 10:32:35', 129, 2, 1, NULL, 11, NULL),
(9, 'Rosemary', 'روزمارى', 'لوريم ايبسوم دولار سيت أميت ,كونسيكتيتور أدايبا يسكينج أليايت,سيت دو أيوسمود تيمبور\r\n\r\nأنكايديديونتيوت لابوري ات دولار ماجنا أليكيوا . يوت انيم أد مينيم فينايم,كيواس نوستريد\r\n\r\nأكسير سيتاشن يللأمكو لابورأس نيسي يت أليكيوب أكس أيا كوممودو كونسيكيوات . ديواس\r\n\r\nأيوتي أريري دولار إن ريبريهينديرأيت فوليوبتاتي فيلايت أيسسي كايلليوم دولار أيو فيجايت\r\n\r\nنيولا باراياتيور. أيكسسيبتيور ساينت أوككايكات كيوبايداتات نون بروايدينت ,سيونت ان كيولبا\r\n\r\nكيو أوفيسيا ديسيريونتموليت انيم أيدي ايست لابوريوم.سيت يتبيرسبايكياتيس يوندي أومنيس أستي ناتيس أيررور سيت فوليبتاتيم أكيسأنتييوم\r\n\r\nدولاريمكيو لايودانتيوم,توتام ريم أبيرأم,أيكيو أبسا كيواي أب أللو أنفينتوري فيرأتاتيس ايت\r\n\r\nكياسي أرشيتيكتو بيتاي فيتاي ديكاتا سيونت أكسبليكابو. نيمو أنيم أبسام فوليوباتاتيم كيواي\r\n\r\nفوليوبتاس سايت أسبيرناتشر أيوت أودايت أيوت فيوجايت, سيد كيواي كونسيكيونتشر ماجناي\r\n\r\nدولارس أيوس كيواي راتاشن فوليوبتاتيم سيكيواي نيسكايونت. نيكيو بوررو كيوايسكيوم\r\n\r\nايست,كيواي دولوريم ايبسيوم كيوا دولار سايت أميت, كونسيكتيتيور,أديبايسكاي فيلايت, سيد\r\n\r\nكيواي نون نيومكيوام ايايوس موداي تيمبورا انكايديونت يوت لابوري أيت دولار ماجنام\r\n\r\nألايكيوام كيوايرات فوليوبتاتيم. يوت اينايم أد مينيما فينيام, كيواس نوستريوم أكسيركايتاشيم\r\n\r\nيلامكوربوريس سيوسكايبيت لابورايوسام, نايساي يوت ألايكيوايد أكس أيا كوموداي', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsa mollitia quae obcaecati molestias non consequatur excepturi temporibus quibusdam ad hic doloremque optio voluptatem, possimus eum porro nemo, distinctio corporis odit totam libero, eligendi recusandae eius consectetur! Perspiciatis ullam hic adipisci ad? Eveniet iure eligendi ex dolorem. Repudiandae sapiente quibusdam doloribus.', 'product-8.jpg', 400.00, 46379, 0, '2021-01-15 10:32:35', 118, 1, 5, NULL, 11, NULL),
(23, 'popopopopopo', 'ايايتيتلبيتلببيفيفيفيفيفيفيف', 'نعثلنثضلثضخلخهضاثصخل', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsa mollitia quae obcaecati molestias non consequatur excepturi temporibus quibusdam ad hic doloremque optio voluptatem, possimus eum porro nemo, distinctio corporis odit totam libero, eligendi recusandae eius consectetur! Perspiciatis ullam hic adipisci ad? Eveniet iure eligendi ex dolorem. Repudiandae sapiente quibusdam doloribus.', '1611152492.png', 4854.00, NULL, NULL, '2021-01-20 14:21:32', NULL, 2, 5, NULL, 11, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `subcategorys`
--

CREATE TABLE `subcategorys` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `photo` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'subcategory_default.png',
  `category_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `subcategorys`
--

INSERT INTO `subcategorys` (`id`, `name`, `photo`, `category_id`) VALUES
(1, 'Hot', 'subcategory_default.png', 2),
(2, 'Cold', 'subcategory_default.png', 2),
(4, 'Dried', 'subcategory_default.png', 1),
(5, 'Fresh', 'subcategory_default.png', 1);

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `nationalId` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `photo` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'supplier_default.png',
  `delivery_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`id`, `name`, `nationalId`, `email`, `phone`, `photo`, `delivery_id`) VALUES
(10, 'speedfx', '12345687912234', 'speedfx@speedfx.com', '1009865764', 'speedfx.jpg', 1),
(11, 'express', '12342234568791', 'express@express.com', '1379568420', 'express.jpg', 2),
(12, 'presto', '79122341234568', 'presto@presto.com', '1237649822', 'presto.jpg', 3);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '2',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `phone`, `code`, `status`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Menna Mokhtar', 'mennah5515@gmail.com', '01006196566', NULL, 2, NULL, '$2y$10$xSqESKwCHVf0R1Vog6gqcu9VY4XQq6YbKGeqQ2vT5nWMP4amrCzmO', NULL, '2021-01-18 23:54:06', '2021-01-18 23:54:06'),
(8, 'Menna Helal', 'hmennatullah@gmail.com', NULL, NULL, 2, NULL, '$2y$10$n7Huz5xIFl2f5KDgK4vo0uDM8Xbwworbc3bBAAz4F1xDwqZDCUDOy', NULL, '2021-01-19 02:14:11', '2021-01-19 02:14:11'),
(9, 'mmmm', 'hmennatullah1@gmail.com', NULL, NULL, 2, NULL, '$2y$10$j8pWzmbXv5/KHtIS/F0Oee39iMQQ1xT.8XPG8RczA1AmMy1.MftMq', NULL, '2021-01-19 11:34:29', '2021-01-19 11:34:29'),
(10, 'mmmm', 'hmennatullah2@gmail.com', NULL, 54321, 2, NULL, '$2y$10$YrNUFJacjpzR/t0MlY2ACO7RVHYS83gnymhMl/HSoOZwPEniMG0Gy', NULL, '2021-01-19 11:35:06', '2021-01-19 11:35:06'),
(11, 'Memma Helal', 'menna_allah_helal@hotmail.com', NULL, 24135, 2, NULL, '$2y$10$hHsA.J9GIz/EL8cjLHS1l.xVJp00zcuk7BFsA5U/nuN41ZTbNiite', NULL, '2021-01-19 19:13:29', '2021-01-19 19:13:29'),
(29, 'mmmmm', 'mlpppppplll@m.c', '00000000000', 50078, 1, NULL, '$2y$10$wnc3Fc4RvNprOohw.H1XmORPEUMbz1dNu/oxsjxfMY0TY9Yd6EDU6', NULL, NULL, '2021-01-20 20:19:56'),
(30, 'mkmkmkmkm', 'mkmkmkm@mkmkm.com', '11111111111', NULL, 2, NULL, '$2y$10$wUQglQ0UKSEiBedIFqsv/eNg3X23U39EYL19nXHYIsV6GT/8j7Oci', NULL, NULL, NULL),
(31, 'mannooooonnnnnnnnnnn', 'ooooooo@pppppp.com', '55555555555', 45694, 1, NULL, '$2y$10$w3Qhk36SUGiWptPF99Kxse1KGk93YMBY.0LrfpGnNHll.bjTTPneK', NULL, NULL, '2021-01-21 13:20:26'),
(32, 'Mennnnnnn', 'hihihihih@nn.com', NULL, NULL, 2, NULL, '$2y$10$VQYoC6SusBSB/DqBSpbG0.lNhuRIgjlgh5Q/tUIx7m69uajqJv1Ly', NULL, '2021-01-21 17:51:09', '2021-01-21 17:51:09'),
(33, 'klklklklklkl', 'ninin@nono.com', '9871130651616', NULL, 2, NULL, '$2y$10$TTAn7P56TfrQYAmTmqSFGOKsBeJ4FE7CsT.rnd77CWtqsEg.A6nO2', NULL, '2021-01-21 17:54:19', '2021-01-21 17:54:19'),
(38, 'mkmkmkmkmkmk', 'm@m.com', '9898409984984', NULL, 2, NULL, '$2y$10$fXHRvK4JaMmU05nqnLW.I.x5WUcGv0BfPTMu5fSCCE57/S6IoxajK', NULL, '2021-01-21 19:44:05', '2021-01-21 19:44:05'),
(39, 'yyy1y1y1y1y1y', 'mmmmyyy@yyy.com', '1684929849', NULL, 2, NULL, '$2y$10$O57poXK/OUrgubwgtjdwL.3OdGBXAvosleHxaGPx7erCU1y1pZ/Tu', NULL, '2021-01-21 20:40:47', '2021-01-21 20:40:47'),
(55, 'Meeeeeennnnaaaa', 'mennah555@gmail.com', NULL, NULL, 2, '2021-01-21 22:16:57', '$2y$10$iQavZA4arzrp0CzN03PIY.dRa9hDUwCtdnToILEFnsoeyhpETuioy', NULL, '2021-01-21 22:16:41', '2021-01-21 22:16:57'),
(56, 'mannooooonnnnnnnnn', 'ooooooo@pppppp.co', '88888888888', 84651, 1, NULL, '$2y$10$I8XlwjIBaw1Ak8iHJh27XeYFbayydVHuilZxr7MrdH5IxN2tpWW6i', NULL, NULL, '2021-01-21 22:58:57');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bproduct_id` (`product_id`) USING BTREE;

--
-- Indexes for table `categorys`
--
ALTER TABLE `categorys`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deliverys`
--
ALTER TABLE `deliverys`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dsupplier_id` (`supplier_id`) USING BTREE;

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subcategory_id` (`subcategory_id`),
  ADD KEY `supplier_id` (`supplier_id`),
  ADD KEY `brand_id` (`brand_id`);

--
-- Indexes for table `subcategorys`
--
ALTER TABLE `subcategorys`
  ADD PRIMARY KEY (`id`),
  ADD KEY `scategory_id` (`category_id`) USING BTREE;

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sudelivery_id` (`delivery_id`) USING BTREE;

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_phone_unique` (`phone`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `categorys`
--
ALTER TABLE `categorys`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `deliverys`
--
ALTER TABLE `deliverys`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `subcategorys`
--
ALTER TABLE `subcategorys`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `brands`
--
ALTER TABLE `brands`
  ADD CONSTRAINT `bproduct_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `deliverys`
--
ALTER TABLE `deliverys`
  ADD CONSTRAINT `dsupplier_id` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `brand_id` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `subcategory_id` FOREIGN KEY (`subcategory_id`) REFERENCES `subcategorys` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `supplier_id` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
