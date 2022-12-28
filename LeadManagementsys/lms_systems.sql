-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 28, 2022 at 01:39 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lms_systems`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins_manager`
--

CREATE TABLE `admins_manager` (
  `id` char(32) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(200) NOT NULL,
  `password` varchar(30) NOT NULL,
  `created_by_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admins_manager`
--

INSERT INTO `admins_manager` (`id`, `first_name`, `last_name`, `username`, `email`, `password`, `created_by_id`) VALUES
('560065c52cd3401da485eb31ab297f45', 'Pragati', 'Sharma', 'pragati@123', 'pragatisharma270@gmail.com', '12345', 2),
('7b8b8a4e3a7049f5b1536054a522c2cb', 'Deepak', 'verma', 'Deepak@123', 'deepak@gmail.com', '12345', 2);

-- --------------------------------------------------------

--
-- Table structure for table `admins_taskassigntomanager`
--

CREATE TABLE `admins_taskassigntomanager` (
  `id` bigint(20) NOT NULL,
  `assign_by_id` char(32) NOT NULL,
  `created_by_id` int(11) NOT NULL,
  `lead_id_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admins_taskassigntomanager`
--

INSERT INTO `admins_taskassigntomanager` (`id`, `assign_by_id`, `created_by_id`, `lead_id_id`) VALUES
(8, '560065c52cd3401da485eb31ab297f45', 2, 10),
(9, '560065c52cd3401da485eb31ab297f45', 2, 11),
(10, '560065c52cd3401da485eb31ab297f45', 2, 15),
(11, '560065c52cd3401da485eb31ab297f45', 2, 18),
(12, '560065c52cd3401da485eb31ab297f45', 2, 9),
(13, '560065c52cd3401da485eb31ab297f45', 2, 17),
(14, '560065c52cd3401da485eb31ab297f45', 2, 17);

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add team lead_ register', 7, 'add_teamlead_register'),
(26, 'Can change team lead_ register', 7, 'change_teamlead_register'),
(27, 'Can delete team lead_ register', 7, 'delete_teamlead_register'),
(28, 'Can view team lead_ register', 7, 'view_teamlead_register'),
(29, 'Can add task assign', 8, 'add_taskassign'),
(30, 'Can change task assign', 8, 'change_taskassign'),
(31, 'Can delete task assign', 8, 'delete_taskassign'),
(32, 'Can view task assign', 8, 'view_taskassign'),
(33, 'Can add lead create by staff manager', 9, 'add_leadcreatebystaffmanager'),
(34, 'Can change lead create by staff manager', 9, 'change_leadcreatebystaffmanager'),
(35, 'Can delete lead create by staff manager', 9, 'delete_leadcreatebystaffmanager'),
(36, 'Can view lead create by staff manager', 9, 'view_leadcreatebystaffmanager'),
(37, 'Can add manager', 10, 'add_manager'),
(38, 'Can change manager', 10, 'change_manager'),
(39, 'Can delete manager', 10, 'delete_manager'),
(40, 'Can view manager', 10, 'view_manager'),
(41, 'Can add task assign to manager', 11, 'add_taskassigntomanager'),
(42, 'Can change task assign to manager', 11, 'change_taskassigntomanager'),
(43, 'Can delete task assign to manager', 11, 'delete_taskassigntomanager'),
(44, 'Can view task assign to manager', 11, 'view_taskassigntomanager'),
(45, 'Can add employee_ register', 12, 'add_employee_register'),
(46, 'Can change employee_ register', 12, 'change_employee_register'),
(47, 'Can delete employee_ register', 12, 'delete_employee_register'),
(48, 'Can view employee_ register', 12, 'view_employee_register'),
(49, 'Can add task to employees', 13, 'add_tasktoemployees'),
(50, 'Can change task to employees', 13, 'change_tasktoemployees'),
(51, 'Can delete task to employees', 13, 'delete_tasktoemployees'),
(52, 'Can view task to employees', 13, 'view_tasktoemployees'),
(53, 'Can add lead create', 14, 'add_leadcreate'),
(54, 'Can change lead create', 14, 'change_leadcreate'),
(55, 'Can delete lead create', 14, 'delete_leadcreate'),
(56, 'Can view lead create', 14, 'view_leadcreate'),
(57, 'Can add lead source', 15, 'add_leadsource'),
(58, 'Can change lead source', 15, 'change_leadsource'),
(59, 'Can delete lead source', 15, 'delete_leadsource'),
(60, 'Can view lead source', 15, 'view_leadsource'),
(61, 'Can add notes_ details', 16, 'add_notes_details'),
(62, 'Can change notes_ details', 16, 'change_notes_details'),
(63, 'Can delete notes_ details', 16, 'delete_notes_details'),
(64, 'Can view notes_ details', 16, 'view_notes_details'),
(65, 'Can add call_ details', 17, 'add_call_details'),
(66, 'Can change call_ details', 17, 'change_call_details'),
(67, 'Can delete call_ details', 17, 'delete_call_details'),
(68, 'Can view call_ details', 17, 'view_call_details');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$390000$jd39B6vJtWP9NcZzkamMHT$jvKz/BB5AXTRVpatuO2Y8IU2CSYZ1rAD9VRxY2MAnUg=', '2022-12-28 12:59:53.288613', 1, 'mr@shubham123', 'Shubham', 'Raikwar', 'techpanda.sr@gmail.com', 0, 1, '2022-12-27 16:10:56.627620'),
(2, 'pbkdf2_sha256$390000$lXiItoC4XrUr4aLJJi9AYQ$somr8WOV2bu0dF2zKmoYU2LNCccwzOaCI8MHLjnIWaQ=', '2022-12-28 17:47:58.314846', 0, 'rolf@321', 'Rolf', 'smith', 'rolf@gmail.com', 1, 1, '2022-12-27 16:14:07.831539'),
(3, 'pbkdf2_sha256$390000$enovBMJlKZ5A3yLTZwpPjb$EUCtwtEiJLaBFRK4kRAfcBVGQIqBlI0NafHfN+riwi8=', NULL, 0, 'rohit@321', 'Rohit', 'Lowansi', 'rohit@gmail.com', 1, 1, '2022-12-27 16:18:11.152448');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(10, 'Admins', 'manager'),
(11, 'Admins', 'taskassigntomanager'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session'),
(9, 'StaffManager', 'leadcreatebystaffmanager'),
(8, 'StaffManager', 'taskassign'),
(7, 'StaffManager', 'teamlead_register'),
(17, 'SuperAdmin', 'call_details'),
(14, 'SuperAdmin', 'leadcreate'),
(15, 'SuperAdmin', 'leadsource'),
(16, 'SuperAdmin', 'notes_details'),
(12, 'Teamleader', 'employee_register'),
(13, 'Teamleader', 'tasktoemployees');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2022-12-27 16:06:34.794664'),
(2, 'auth', '0001_initial', '2022-12-27 16:06:55.332089'),
(3, 'SuperAdmin', '0001_initial', '2022-12-27 16:07:10.260804'),
(4, 'Admins', '0001_initial', '2022-12-27 16:07:24.434351'),
(5, 'StaffManager', '0001_initial', '2022-12-27 16:07:44.256740'),
(6, 'Teamleader', '0001_initial', '2022-12-27 16:07:57.580268'),
(7, 'admin', '0001_initial', '2022-12-27 16:08:08.929672'),
(8, 'admin', '0002_logentry_remove_auto_add', '2022-12-27 16:08:09.586655'),
(9, 'admin', '0003_logentry_add_action_flag_choices', '2022-12-27 16:08:09.769481'),
(10, 'contenttypes', '0002_remove_content_type_name', '2022-12-27 16:08:14.747341'),
(11, 'auth', '0002_alter_permission_name_max_length', '2022-12-27 16:08:17.337858'),
(12, 'auth', '0003_alter_user_email_max_length', '2022-12-27 16:08:17.691055'),
(13, 'auth', '0004_alter_user_username_opts', '2022-12-27 16:08:17.827504'),
(14, 'auth', '0005_alter_user_last_login_null', '2022-12-27 16:08:20.373474'),
(15, 'auth', '0006_require_contenttypes_0002', '2022-12-27 16:08:20.430646'),
(16, 'auth', '0007_alter_validators_add_error_messages', '2022-12-27 16:08:20.596491'),
(17, 'auth', '0008_alter_user_username_max_length', '2022-12-27 16:08:21.223906'),
(18, 'auth', '0009_alter_user_last_name_max_length', '2022-12-27 16:08:21.797720'),
(19, 'auth', '0010_alter_group_name_max_length', '2022-12-27 16:08:22.530300'),
(20, 'auth', '0011_update_proxy_permissions', '2022-12-27 16:08:22.725506'),
(21, 'auth', '0012_alter_user_first_name_max_length', '2022-12-27 16:08:23.295632'),
(22, 'sessions', '0001_initial', '2022-12-27 16:08:24.495328');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('dklk23e3tgzibxb61twbntvl20b8yrsg', '.eJxVjjsOwjAQRO_iGlmxnY2zlPScIdr1B4eALcVJhbg7sUQB7byZp3mJifYtTXsN6zR7cRZanH4zJreE3IC_U74V6Ure1pllq8gvrfJafHhcvt0_QaKajjUB9mwUaR7c2DsDjNZ2hhkjRCCIAdCjVUqx1sbqzgAqDUMMmrrQx0PadJmeodlqKgvieKTttHp_AJ2vP_U:1pAVfj:cog5Hxashemc8PkqRFRbJvqacfVj22Hn9jcFAcsZN4U', '2023-01-11 18:06:39.011977');

-- --------------------------------------------------------

--
-- Table structure for table `staffmanager_taskassign`
--

CREATE TABLE `staffmanager_taskassign` (
  `id` bigint(20) NOT NULL,
  `assign_by_id` bigint(20) NOT NULL,
  `created_by_id` char(32) NOT NULL,
  `lead_id_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `staffmanager_taskassign`
--

INSERT INTO `staffmanager_taskassign` (`id`, `assign_by_id`, `created_by_id`, `lead_id_id`) VALUES
(9, 1, '560065c52cd3401da485eb31ab297f45', 10),
(10, 1, '560065c52cd3401da485eb31ab297f45', 10),
(11, 1, '560065c52cd3401da485eb31ab297f45', 9),
(12, 1, '560065c52cd3401da485eb31ab297f45', 12);

-- --------------------------------------------------------

--
-- Table structure for table `staffmanager_teamlead_register`
--

CREATE TABLE `staffmanager_teamlead_register` (
  `id` bigint(20) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(200) NOT NULL,
  `password` varchar(30) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `created_by_id` char(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `staffmanager_teamlead_register`
--

INSERT INTO `staffmanager_teamlead_register` (`id`, `first_name`, `last_name`, `username`, `email`, `password`, `date_joined`, `created_by_id`) VALUES
(1, 'Ganesh', 'ji', 'ganesh12', 'ganesh@gmail.com', '12345', '2022-12-27 16:30:07.491353', '560065c52cd3401da485eb31ab297f45'),
(2, 'demo', 'test', 'demo@111', 'demo@gmail.com', '12345', '2022-12-27 16:30:36.161310', '560065c52cd3401da485eb31ab297f45');

-- --------------------------------------------------------

--
-- Table structure for table `superadmin_call_details`
--

CREATE TABLE `superadmin_call_details` (
  `id` bigint(20) NOT NULL,
  `cls` varchar(50) NOT NULL,
  `rem` varchar(250) NOT NULL,
  `str_dt` varchar(50) NOT NULL,
  `end_dt` datetime(6) NOT NULL,
  `created_by_id` int(11) NOT NULL,
  `led_id_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `superadmin_call_details`
--

INSERT INTO `superadmin_call_details` (`id`, `cls`, `rem`, `str_dt`, `end_dt`, `created_by_id`, `led_id_id`) VALUES
(1, 'inbound', 'Google Ads', '06:56:05', '2022-12-27 18:56:28.592431', 2, 4);

-- --------------------------------------------------------

--
-- Table structure for table `superadmin_leadcreate`
--

CREATE TABLE `superadmin_leadcreate` (
  `id` bigint(20) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `middle_name` varchar(150) DEFAULT NULL,
  `last_name` varchar(150) NOT NULL,
  `gender` varchar(150) NOT NULL,
  `birthday` date NOT NULL,
  `email` varchar(150) NOT NULL,
  `contact` varchar(12) NOT NULL,
  `alternat_no` varchar(12) NOT NULL,
  `address` varchar(300) NOT NULL,
  `permanent_address` varchar(500) NOT NULL,
  `intrested` varchar(150) NOT NULL,
  `lead_sources` varchar(150) NOT NULL,
  `remarks` longtext NOT NULL,
  `status` varchar(150) NOT NULL,
  `date_create` date NOT NULL,
  `created_by_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `superadmin_leadcreate`
--

INSERT INTO `superadmin_leadcreate` (`id`, `first_name`, `middle_name`, `last_name`, `gender`, `birthday`, `email`, `contact`, `alternat_no`, `address`, `permanent_address`, `intrested`, `lead_sources`, `remarks`, `status`, `date_create`, `created_by_id`) VALUES
(9, 'Narendraa', 'None', 'Taneja', 'male', '2000-04-20', 'kathlyn23@gmail.com', '3902972735', '3902972735', 'Pune', 'Pune', 'Android', 'Links from other websites', 'Facebook Ads only', 'Not a Target', '2022-12-28', 2),
(10, 'Gayatri', 'C.', 'Kaul', 'female', '1999-04-21', 'hbernhard@hotmail.com', '5817600269', '5817600269', '2087 Radford Street', '2087 Radford Street', 'python', 'Links from other websites', 'Facebook Ads only', 'Working', '2022-12-12', 2),
(11, 'Baldev', 'R.', 'Khosla', 'male', '2000-04-22', 'olin32@ebert.com', '5149540349', '5149540349', 'Louisville, KY 40202', 'Louisville, KY 40202', 'Java', 'Links from other websites', 'Google Ad', 'Not a Target', '2022-12-13', 2),
(12, 'Lalita', NULL, 'Dixit', 'female', '1999-04-21', 'gbotsford@gmail.com', '9959267902', '9959267902', '3894 Morningview Lane\nKillduff, IA 50137', '3894 Morningview Lane\nKillduff, IA 50137', '.Net', 'Links from other websites', 'Facebook Ads only', 'Working', '2022-12-14', 2),
(13, 'Daanish', 'j.', 'Zachariah', 'male', '2000-05-01', 'crist.lina@gutkowski.com', '8986907947', '8986907947', '1003 Pine Street', '1003 Pine Street', 'Php', 'Links from other websites', 'Google Ad', 'Not a Target', '2022-12-15', 2),
(14, 'Akshay', NULL, 'More', 'male', '2000-04-26', 'iwolff@nienow.com', '5293031698', '5293031698', 'Pittsburgh, PA 15212', 'Pittsburgh, PA 15212', 'Django', 'Links from other websites', 'Facebook Ads only', 'Working', '2022-12-16', 2),
(15, 'Manjariwqw', 'None', 'Upadhyay', 'female', '2000-04-26', 'lgrimes@carter.com', '4727721300', '4727721300', '2803 Bagwell Avenue\r\nUmatilla, FL 32784', '2803 Bagwell Avenue', 'Android', 'Links from other websites', 'Google Ad', 'Not a Target', '2022-12-28', 2),
(16, 'Kartik', NULL, 'Kothari', 'male', '1999-04-22', 'mullrich@daugherty.net', '2059079079', '2059079079', '4406 Doctors Drive', 'Umatilla, FL 32784', 'Django', 'Links from other websites', 'Facebook Ads only', 'Working', '2022-12-18', 2),
(17, 'Neerendra', NULL, 'Taneja', 'female', '2000-04-20', 'kathlyn23@gmail.com', '3902972735', '3902972735', 'Pune', 'Pune', 'Android', 'Links from other websites', 'Facebook Ads only', 'Not a Target', '2022-12-11', 2),
(18, 'Gayatri', 'C.', 'Kaul', 'female', '1999-04-21', 'hbernhard@hotmail.com', '5817600269', '5817600269', '2087 Radford Street', '2087 Radford Street', 'python', 'Links from other websites', 'Facebook Ads only', 'Working', '2022-12-12', 2),
(19, 'Baldev', 'R.', 'Khosla', 'male', '2000-04-22', 'olin32@ebert.com', '5149540349', '5149540349', 'Louisville, KY 40202', 'Louisville, KY 40202', 'Java', 'Links from other websites', 'Google Ad', 'Not a Target', '2022-12-13', 2),
(20, 'Lalita', NULL, 'Dixit', 'female', '1999-04-21', 'gbotsford@gmail.com', '9959267902', '9959267902', '3894 Morningview Lane\nKillduff, IA 50137', '3894 Morningview Lane\nKillduff, IA 50137', '.Net', 'Links from other websites', 'Facebook Ads only', 'Working', '2022-12-14', 2),
(21, 'Daanish', 'j.', 'Zachariah', 'male', '2000-05-01', 'crist.lina@gutkowski.com', '8986907947', '8986907947', '1003 Pine Street', '1003 Pine Street', 'Php', 'Links from other websites', 'Google Ad', 'Not a Target', '2022-12-15', 2),
(22, 'Akshay', NULL, 'More', 'male', '1999-04-23', 'iwolff@nienow.com', '5293031698', '5293031698', 'Pittsburgh, PA 15212', 'Pittsburgh, PA 15212', 'Django', 'Links from other websites', 'Facebook Ads only', 'Working', '2022-12-16', 2),
(23, 'Manjari', NULL, 'Upadhyay', 'female', '2000-04-26', 'lgrimes@carter.com', '4727721300', '4727721300', '2803 Bagwell Avenue\nUmatilla, FL 32784', '2803 Bagwell Avenue', 'Android', 'Links from other websites', 'Google Ad', 'Not a Target', '2022-12-17', 2),
(24, 'Kartik', NULL, 'Kothari', 'male', '1999-04-22', 'mullrich@daugherty.net', '2059079079', '2059079079', '4406 Doctors Drive', 'Umatilla, FL 32784', 'Django', 'Links from other websites', 'Facebook Ads only', 'Working', '2022-12-18', 2);

-- --------------------------------------------------------

--
-- Table structure for table `superadmin_leadsource`
--

CREATE TABLE `superadmin_leadsource` (
  `id` bigint(20) NOT NULL,
  `source` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `superadmin_leadsource`
--

INSERT INTO `superadmin_leadsource` (`id`, `source`) VALUES
(1, 'Search engines'),
(2, 'Links from other websites'),
(3, 'Listing websites'),
(4, 'Cold calls'),
(5, 'Direct mail'),
(6, 'Traditional advertisements'),
(7, 'Events'),
(8, 'Referrals'),
(9, 'Social media'),
(10, 'Email newsletters'),
(11, 'Pay-per-click (PPC) advertising');

-- --------------------------------------------------------

--
-- Table structure for table `superadmin_notes_details`
--

CREATE TABLE `superadmin_notes_details` (
  `id` bigint(20) NOT NULL,
  `msg` varchar(500) NOT NULL,
  `date` datetime(6) NOT NULL,
  `created_by_id` int(11) NOT NULL,
  `led_id_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `teamleader_employee_register`
--

CREATE TABLE `teamleader_employee_register` (
  `id` bigint(20) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(200) NOT NULL,
  `password` varchar(30) NOT NULL,
  `date` datetime(6) NOT NULL,
  `created_by_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `teamleader_employee_register`
--

INSERT INTO `teamleader_employee_register` (`id`, `first_name`, `last_name`, `username`, `email`, `password`, `date`, `created_by_id`) VALUES
(1, 'Ashok', 'verma', 'ashok998', 'ashok@gmail.com', '12345', '2022-12-27 16:51:09.602267', 1),
(2, 'Neelesh', 'sen', 'neelesh@222', 'neelesh@gmail.com', '12345', '2022-12-27 16:51:44.841590', 1);

-- --------------------------------------------------------

--
-- Table structure for table `teamleader_tasktoemployees`
--

CREATE TABLE `teamleader_tasktoemployees` (
  `id` bigint(20) NOT NULL,
  `assign_by_id` bigint(20) NOT NULL,
  `created_by_id` bigint(20) NOT NULL,
  `lead_id_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `teamleader_tasktoemployees`
--

INSERT INTO `teamleader_tasktoemployees` (`id`, `assign_by_id`, `created_by_id`, `lead_id_id`) VALUES
(15, 1, 1, 9),
(16, 1, 1, 10);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins_manager`
--
ALTER TABLE `admins_manager`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Admins_manager_created_by_id_8af2f161_fk_auth_user_id` (`created_by_id`);

--
-- Indexes for table `admins_taskassigntomanager`
--
ALTER TABLE `admins_taskassigntomanager`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Admins_taskassigntom_assign_by_id_b6dee9d7_fk_Admins_ma` (`assign_by_id`),
  ADD KEY `Admins_taskassigntom_created_by_id_9ad1dc42_fk_auth_user` (`created_by_id`),
  ADD KEY `Admins_taskassigntom_lead_id_id_8aa15bed_fk_SuperAdmi` (`lead_id_id`);

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `staffmanager_taskassign`
--
ALTER TABLE `staffmanager_taskassign`
  ADD PRIMARY KEY (`id`),
  ADD KEY `StaffManager_taskass_assign_by_id_70b7d87e_fk_StaffMana` (`assign_by_id`),
  ADD KEY `StaffManager_taskass_created_by_id_930f929d_fk_Admins_ma` (`created_by_id`),
  ADD KEY `StaffManager_taskass_lead_id_id_d80bf101_fk_SuperAdmi` (`lead_id_id`);

--
-- Indexes for table `staffmanager_teamlead_register`
--
ALTER TABLE `staffmanager_teamlead_register`
  ADD PRIMARY KEY (`id`),
  ADD KEY `StaffManager_teamlea_created_by_id_11658114_fk_Admins_ma` (`created_by_id`);

--
-- Indexes for table `superadmin_call_details`
--
ALTER TABLE `superadmin_call_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `SuperAdmin_call_details_created_by_id_44e58112_fk_auth_user_id` (`created_by_id`),
  ADD KEY `SuperAdmin_call_deta_led_id_id_cb0e08cc_fk_SuperAdmi` (`led_id_id`);

--
-- Indexes for table `superadmin_leadcreate`
--
ALTER TABLE `superadmin_leadcreate`
  ADD PRIMARY KEY (`id`),
  ADD KEY `SuperAdmin_leadcreate_created_by_id_e94ac789_fk_auth_user_id` (`created_by_id`);

--
-- Indexes for table `superadmin_leadsource`
--
ALTER TABLE `superadmin_leadsource`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `superadmin_notes_details`
--
ALTER TABLE `superadmin_notes_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `SuperAdmin_notes_details_created_by_id_50816556_fk_auth_user_id` (`created_by_id`),
  ADD KEY `SuperAdmin_notes_det_led_id_id_ce606a7c_fk_SuperAdmi` (`led_id_id`);

--
-- Indexes for table `teamleader_employee_register`
--
ALTER TABLE `teamleader_employee_register`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Teamleader_employee__created_by_id_a82860e4_fk_StaffMana` (`created_by_id`);

--
-- Indexes for table `teamleader_tasktoemployees`
--
ALTER TABLE `teamleader_tasktoemployees`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Teamleader_tasktoemp_assign_by_id_8221bde4_fk_Teamleade` (`assign_by_id`),
  ADD KEY `Teamleader_tasktoemp_created_by_id_65f61f72_fk_StaffMana` (`created_by_id`),
  ADD KEY `Teamleader_tasktoemp_lead_id_id_3ac6114d_fk_SuperAdmi` (`lead_id_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins_taskassigntomanager`
--
ALTER TABLE `admins_taskassigntomanager`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `staffmanager_taskassign`
--
ALTER TABLE `staffmanager_taskassign`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `staffmanager_teamlead_register`
--
ALTER TABLE `staffmanager_teamlead_register`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `superadmin_call_details`
--
ALTER TABLE `superadmin_call_details`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `superadmin_leadcreate`
--
ALTER TABLE `superadmin_leadcreate`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `superadmin_leadsource`
--
ALTER TABLE `superadmin_leadsource`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `superadmin_notes_details`
--
ALTER TABLE `superadmin_notes_details`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `teamleader_employee_register`
--
ALTER TABLE `teamleader_employee_register`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `teamleader_tasktoemployees`
--
ALTER TABLE `teamleader_tasktoemployees`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admins_manager`
--
ALTER TABLE `admins_manager`
  ADD CONSTRAINT `Admins_manager_created_by_id_8af2f161_fk_auth_user_id` FOREIGN KEY (`created_by_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `admins_taskassigntomanager`
--
ALTER TABLE `admins_taskassigntomanager`
  ADD CONSTRAINT `Admins_taskassigntom_assign_by_id_b6dee9d7_fk_Admins_ma` FOREIGN KEY (`assign_by_id`) REFERENCES `admins_manager` (`id`),
  ADD CONSTRAINT `Admins_taskassigntom_created_by_id_9ad1dc42_fk_auth_user` FOREIGN KEY (`created_by_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `Admins_taskassigntom_lead_id_id_8aa15bed_fk_SuperAdmi` FOREIGN KEY (`lead_id_id`) REFERENCES `superadmin_leadcreate` (`id`);

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `staffmanager_taskassign`
--
ALTER TABLE `staffmanager_taskassign`
  ADD CONSTRAINT `StaffManager_taskass_assign_by_id_70b7d87e_fk_StaffMana` FOREIGN KEY (`assign_by_id`) REFERENCES `staffmanager_teamlead_register` (`id`),
  ADD CONSTRAINT `StaffManager_taskass_created_by_id_930f929d_fk_Admins_ma` FOREIGN KEY (`created_by_id`) REFERENCES `admins_manager` (`id`),
  ADD CONSTRAINT `StaffManager_taskass_lead_id_id_d80bf101_fk_SuperAdmi` FOREIGN KEY (`lead_id_id`) REFERENCES `superadmin_leadcreate` (`id`);

--
-- Constraints for table `staffmanager_teamlead_register`
--
ALTER TABLE `staffmanager_teamlead_register`
  ADD CONSTRAINT `StaffManager_teamlea_created_by_id_11658114_fk_Admins_ma` FOREIGN KEY (`created_by_id`) REFERENCES `admins_manager` (`id`);

--
-- Constraints for table `superadmin_call_details`
--
ALTER TABLE `superadmin_call_details`
  ADD CONSTRAINT `SuperAdmin_call_deta_led_id_id_cb0e08cc_fk_SuperAdmi` FOREIGN KEY (`led_id_id`) REFERENCES `superadmin_leadcreate` (`id`),
  ADD CONSTRAINT `SuperAdmin_call_details_created_by_id_44e58112_fk_auth_user_id` FOREIGN KEY (`created_by_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `superadmin_leadcreate`
--
ALTER TABLE `superadmin_leadcreate`
  ADD CONSTRAINT `SuperAdmin_leadcreate_created_by_id_e94ac789_fk_auth_user_id` FOREIGN KEY (`created_by_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `superadmin_notes_details`
--
ALTER TABLE `superadmin_notes_details`
  ADD CONSTRAINT `SuperAdmin_notes_det_led_id_id_ce606a7c_fk_SuperAdmi` FOREIGN KEY (`led_id_id`) REFERENCES `superadmin_leadcreate` (`id`),
  ADD CONSTRAINT `SuperAdmin_notes_details_created_by_id_50816556_fk_auth_user_id` FOREIGN KEY (`created_by_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `teamleader_employee_register`
--
ALTER TABLE `teamleader_employee_register`
  ADD CONSTRAINT `Teamleader_employee__created_by_id_a82860e4_fk_StaffMana` FOREIGN KEY (`created_by_id`) REFERENCES `staffmanager_teamlead_register` (`id`);

--
-- Constraints for table `teamleader_tasktoemployees`
--
ALTER TABLE `teamleader_tasktoemployees`
  ADD CONSTRAINT `Teamleader_tasktoemp_assign_by_id_8221bde4_fk_Teamleade` FOREIGN KEY (`assign_by_id`) REFERENCES `teamleader_employee_register` (`id`),
  ADD CONSTRAINT `Teamleader_tasktoemp_created_by_id_65f61f72_fk_StaffMana` FOREIGN KEY (`created_by_id`) REFERENCES `staffmanager_teamlead_register` (`id`),
  ADD CONSTRAINT `Teamleader_tasktoemp_lead_id_id_3ac6114d_fk_SuperAdmi` FOREIGN KEY (`lead_id_id`) REFERENCES `superadmin_leadcreate` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
