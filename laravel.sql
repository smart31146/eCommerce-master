/*
SQLyog Community v13.1.6 (64 bit)
MySQL - 10.4.24-MariaDB : Database - laravel
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`laravel` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `laravel`;

/*Table structure for table `categories` */

DROP TABLE IF EXISTS `categories`;

CREATE TABLE `categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories_slug_unique` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `categories` */

/*Table structure for table `category_product` */

DROP TABLE IF EXISTS `category_product`;

CREATE TABLE `category_product` (
  `category_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `category_product` */

/*Table structure for table `failed_jobs` */

DROP TABLE IF EXISTS `failed_jobs`;

CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `failed_jobs` */

/*Table structure for table `migrations` */

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `migrations` */

insert  into `migrations`(`id`,`migration`,`batch`) values 
(1,'2014_10_12_000000_create_users_table',1),
(2,'2014_10_12_100000_create_password_resets_table',1),
(3,'2019_05_03_000001_create_customer_columns',1),
(4,'2019_05_03_000002_create_subscriptions_table',1),
(5,'2019_05_03_000003_create_subscription_items_table',1),
(6,'2019_08_19_000000_create_failed_jobs_table',1),
(7,'2019_12_14_000001_create_personal_access_tokens_table',1),
(8,'2021_01_13_170812_create_products_table',1),
(9,'2021_01_13_201345_create_categories_table',1),
(10,'2021_01_13_201433_create_orders_table',1),
(11,'2021_01_14_014653_create_category_product_table',1),
(12,'2021_01_14_014759_create_order_product_table',1);

/*Table structure for table `order_product` */

DROP TABLE IF EXISTS `order_product`;

CREATE TABLE `order_product` (
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `order_product` */

/*Table structure for table `orders` */

DROP TABLE IF EXISTS `orders`;

CREATE TABLE `orders` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `transaction_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `orders` */

/*Table structure for table `password_resets` */

DROP TABLE IF EXISTS `password_resets`;

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `password_resets` */

/*Table structure for table `personal_access_tokens` */

DROP TABLE IF EXISTS `personal_access_tokens`;

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `personal_access_tokens` */

/*Table structure for table `products` */

DROP TABLE IF EXISTS `products`;

CREATE TABLE `products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `imageUrl` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `products_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `products` */

insert  into `products`(`id`,`name`,`slug`,`description`,`imageUrl`,`price`,`created_at`,`updated_at`) values 
(2,'Example Product','example-product','Example product description','url to image',99,'2022-08-25 08:01:57','2022-08-25 08:01:57');

/*Table structure for table `subscription_items` */

DROP TABLE IF EXISTS `subscription_items`;

CREATE TABLE `subscription_items` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `subscription_id` bigint(20) unsigned NOT NULL,
  `stripe_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripe_product` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripe_price` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `subscription_items_subscription_id_stripe_price_unique` (`subscription_id`,`stripe_price`),
  UNIQUE KEY `subscription_items_stripe_id_unique` (`stripe_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `subscription_items` */

/*Table structure for table `subscriptions` */

DROP TABLE IF EXISTS `subscriptions`;

CREATE TABLE `subscriptions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripe_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripe_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripe_price` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `trial_ends_at` timestamp NULL DEFAULT NULL,
  `ends_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `subscriptions_stripe_id_unique` (`stripe_id`),
  KEY `subscriptions_user_id_stripe_status_index` (`user_id`,`stripe_status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `subscriptions` */

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `zipcode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `stripe_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pm_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pm_last_four` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trial_ends_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_stripe_id_index` (`stripe_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `users` */

insert  into `users`(`id`,`name`,`email`,`address`,`city`,`state`,`zipcode`,`password`,`remember_token`,`created_at`,`updated_at`,`stripe_id`,`pm_type`,`pm_last_four`,`trial_ends_at`) values 
(1,'Prof. Filiberto Bailey','hallie80@example.com','2081 Karli Well\nAnibalville, AL 09825','Creolabury','Montana','83081','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','6s4nCSLCVH','2022-08-25 07:57:42','2022-08-25 07:57:42',NULL,NULL,NULL,NULL),
(2,'Lucious Metz','wcummerata@example.net','956 Dach Lights Suite 609\nWest Dallas, HI 76399','Lake Breanne','Rhode Island','08234','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','NTb64p3LP5','2022-08-25 07:57:42','2022-08-25 07:57:42',NULL,NULL,NULL,NULL),
(3,'Annetta Zieme','brandt80@example.net','8434 Ferry Plains Apt. 843\nSouth Leorafurt, SD 27795-6061','Amayatown','North Dakota','46506','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','H3bK9dvqg5','2022-08-25 07:57:42','2022-08-25 07:57:42',NULL,NULL,NULL,NULL),
(4,'Dr. Camylle Johnson I','ashlee59@example.org','16536 Botsford Crescent\nHackettfort, IA 76645','West Tiffany','New Hampshire','66081','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','chlq51R6Sj','2022-08-25 07:57:42','2022-08-25 07:57:42',NULL,NULL,NULL,NULL),
(5,'Emelie Hilpert','smitham.lucile@example.com','9366 Martin Camp Suite 527\nHannaville, IL 97982-9466','Soledadtown','North Dakota','30701','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','frabuiaGcL','2022-08-25 07:57:42','2022-08-25 07:57:42',NULL,NULL,NULL,NULL),
(6,'Nedra Mayert III','narciso09@example.org','987 Ervin Burgs\nEast Israel, GA 07131','Durgantown','Wyoming','44660-5381','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','huhJnsLClW','2022-08-25 07:57:42','2022-08-25 07:57:42',NULL,NULL,NULL,NULL),
(7,'Horace Johnson','florian73@example.org','7404 Pacocha Stream Apt. 302\nNew Edwardbury, DC 14458','Nicklausland','Indiana','28776','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','lW8w4bnRA6','2022-08-25 07:57:42','2022-08-25 07:57:42',NULL,NULL,NULL,NULL),
(8,'Linnie Waelchi','xwatsica@example.net','429 Yvette Ways Apt. 204\nStevieberg, OR 75071-8499','Dwightberg','Delaware','84871','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','u9EHU44vM5','2022-08-25 07:57:42','2022-08-25 07:57:42',NULL,NULL,NULL,NULL),
(9,'Mr. Jensen Fisher','marks.moshe@example.com','905 Blick Branch\nNew Cierra, CT 25630-4664','South Jaime','New Hampshire','61013-0509','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','jgrtyAWbuc','2022-08-25 07:57:42','2022-08-25 07:57:42',NULL,NULL,NULL,NULL),
(10,'Mikel Prohaska','brennon89@example.com','638 Rolfson Throughway\nNorth Gretaland, OR 78484-2499','Jamarview','California','95858-8937','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','PNrprMYhQP','2022-08-25 07:57:42','2022-08-25 07:57:42',NULL,NULL,NULL,NULL),
(11,'Mariela Hegmann','stella17@example.net','55100 Rutherford Brook Suite 693\nLake Erwinport, TX 50334-2732','North Jackiechester','Tennessee','36915','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','0uYh5uFweT','2022-08-25 07:58:58','2022-08-25 07:58:58',NULL,NULL,NULL,NULL),
(12,'Johann Bradtke','kayden.schowalter@example.com','993 Mario Place Apt. 753\nEast Hollisfurt, OK 79452-0304','Doyleville','Kansas','98997-7100','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','7drGbpnOI9','2022-08-25 07:58:58','2022-08-25 07:58:58',NULL,NULL,NULL,NULL),
(13,'Dr. Clifton Gerlach III','noble.braun@example.com','2702 Hane Lights\nNorth Dominique, SD 71289-7760','Aidafort','Louisiana','84423-8465','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','3Viysw30cE','2022-08-25 07:58:58','2022-08-25 07:58:58',NULL,NULL,NULL,NULL),
(14,'Kade Bradtke DDS','wilbert66@example.com','5123 Danyka Islands Suite 474\nLouisaport, MI 75255-8181','West Hayleytown','Kansas','05103','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','fMXBMi6Krc','2022-08-25 07:58:58','2022-08-25 07:58:58',NULL,NULL,NULL,NULL),
(15,'Mr. Jaleel Braun DVM','nbahringer@example.net','84641 Lempi Roads Apt. 765\nSouth Emmittfort, AK 79158','Ratkefurt','Alaska','69909','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','XJNXd3lPf6','2022-08-25 07:58:58','2022-08-25 07:58:58',NULL,NULL,NULL,NULL),
(16,'Davon Klocko','braden.bergstrom@example.net','69920 Ava Rapids Suite 812\nNorth Virgilburgh, ID 58840','South Jaylenfurt','Virginia','80503','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','PsGvYr84me','2022-08-25 07:58:59','2022-08-25 07:58:59',NULL,NULL,NULL,NULL),
(17,'Yadira Hoeger','jed.streich@example.net','4936 Jerald Ford\nLehnermouth, PA 12794','Lake Carole','New York','67841-5249','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','rmOHsOowvS','2022-08-25 07:58:59','2022-08-25 07:58:59',NULL,NULL,NULL,NULL),
(18,'Prof. Esteban Mertz II','emily.towne@example.org','2683 Domenick Well Apt. 371\nPort Osvaldo, MO 54425-1563','North Charlene','Oregon','98697-6666','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','SncpwD3fJB','2022-08-25 07:58:59','2022-08-25 07:58:59',NULL,NULL,NULL,NULL),
(19,'Beulah McClure','hahn.queenie@example.com','9529 Hauck Prairie Suite 134\nSchowalterland, UT 63981-5814','Paucekstad','North Dakota','25690-7119','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','LRmNhRJ8yl','2022-08-25 07:58:59','2022-08-25 07:58:59',NULL,NULL,NULL,NULL),
(20,'Aliya Schaden','boehm.hyman@example.com','56259 Pamela Throughway\nEast Mina, NC 89088','Legrosmouth','Wisconsin','20344-8079','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','tzM1BuBTSP','2022-08-25 07:58:59','2022-08-25 07:58:59',NULL,NULL,NULL,NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
