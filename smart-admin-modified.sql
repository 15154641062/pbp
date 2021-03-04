-- --------------------------------------------------------
-- 主机:                           127.0.0.1
-- 服务器版本:                        8.0.20 - MySQL Community Server - GPL
-- 服务器操作系统:                      Win64
-- HeidiSQL 版本:                  11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- 导出 smart-admin-dev 的数据库结构
DROP DATABASE IF EXISTS `smart-admin-dev`;
CREATE DATABASE IF NOT EXISTS `smart-admin-dev` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `smart-admin-dev`;

-- 导出  表 smart-admin-dev.t_department 结构
DROP TABLE IF EXISTS `t_department`;
CREATE TABLE IF NOT EXISTS `t_department` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '部门主键id',
  `name` varchar(50) NOT NULL COMMENT '部门名称',
  `short_name` varchar(50) DEFAULT NULL COMMENT '部门简称',
  `manager_id` int unsigned DEFAULT NULL COMMENT '部门负责人id',
  `parent_id` int unsigned DEFAULT NULL COMMENT '部门的父级id',
  `sort` int NOT NULL COMMENT '部门排序',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='部门表';

-- 正在导出表  smart-admin-dev.t_department 的数据：~4 rows (大约)
DELETE FROM `t_department`;
/*!40000 ALTER TABLE `t_department` DISABLE KEYS */;
INSERT INTO `t_department` (`id`, `name`, `short_name`, `manager_id`, `parent_id`, `sort`, `update_time`, `create_time`) VALUES
	(1, '1024创新实验室', 'ZWGWL', 16, 0, 1, '2019-04-03 10:41:25', '2019-04-03 10:41:25'),
	(2, '二级部门-2', NULL, 15, 1, 17, '2019-04-15 16:45:10', '2019-04-15 16:45:10'),
	(4, '二级部门-1', '管理', 14, 1, 20, '2019-04-17 16:14:55', '2019-04-17 16:14:55'),
	(8, '三级部门-1', NULL, NULL, 4, 8, '2019-04-25 12:25:52', '2019-04-25 12:25:52'),
	(9, '四级部门-1', NULL, NULL, 8, 9, '2019-04-25 12:26:36', '2019-04-25 12:26:36'),
	(10, '五级部门-1', NULL, NULL, 9, 10, '2019-04-25 12:26:49', '2019-04-25 12:26:49'),
	(11, '六级部门-1', NULL, NULL, 10, 11, '2019-04-25 12:26:59', '2019-04-25 12:26:59'),
	(12, '七级部门-1', NULL, NULL, 11, 12, '2019-04-25 12:27:18', '2019-04-25 12:27:18'),
	(13, '八级部门-1', NULL, NULL, 12, 13, '2019-04-25 12:27:34', '2019-04-25 12:27:34'),
	(14, '九级部门-1', NULL, NULL, 13, 14, '2019-04-25 12:27:47', '2019-04-25 12:27:47'),
	(15, '十级部门-1', NULL, NULL, 14, 15, '2019-04-25 12:28:16', '2019-04-25 12:28:16'),
	(16, '十一级部门部门部部门门嘻嘻哈哈-1', NULL, 13, 15, 16, '2019-04-25 14:56:40', '2019-04-25 14:56:40'),
	(17, '信息中心', NULL, 16, 1, 4, '2019-04-26 11:53:50', '2019-04-26 11:53:50'),
	(18, '测试部门', NULL, 16, 17, 18, '2019-04-26 11:54:06', '2019-04-26 11:54:06'),
	(19, '张娇测试', NULL, NULL, 2, 22, '2019-04-26 14:36:18', '2019-04-26 14:36:18'),
	(20, '子部门', NULL, NULL, 2, 23, '2019-04-26 14:36:28', '2019-04-26 14:36:28'),
	(22, '张静如', NULL, 16, 1, 2, '2019-04-28 14:21:44', '2019-04-28 14:21:44'),
	(23, '张静如2', NULL, 22, 4, 19, '2019-04-28 14:22:48', '2019-04-28 14:22:48'),
	(24, '测试', NULL, 18, 23, 24, '2019-04-29 10:12:42', '2019-04-29 10:12:42'),
	(25, '测试', NULL, 18, 23, 25, '2019-04-29 10:12:42', '2019-04-29 10:12:42');
/*!40000 ALTER TABLE `t_department` ENABLE KEYS */;

-- 导出  表 smart-admin-dev.t_email 结构
DROP TABLE IF EXISTS `t_email`;
CREATE TABLE IF NOT EXISTS `t_email` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '标题',
  `to_emails` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '收件人',
  `send_status` tinyint NOT NULL DEFAULT '0' COMMENT '发送状态 0未发送 1已发送',
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '邮件内容',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 正在导出表  smart-admin-dev.t_email 的数据：~56 rows (大约)
DELETE FROM `t_email`;
/*!40000 ALTER TABLE `t_email` DISABLE KEYS */;
INSERT INTO `t_email` (`id`, `title`, `to_emails`, `send_status`, `content`, `create_time`, `update_time`) VALUES
	(20, '新增测试12345', '新增测试@11.com', 1, '<p>这是内容</p>', '2019-08-30 15:35:12', '2019-08-30 15:35:12'),
	(21, 'b', 'asdf@33.com', 1, '<p>c</p>', '2019-09-06 14:25:33', '2019-09-06 14:25:33'),
	(23, 'string', 'string', 0, 'string', '2019-09-06 06:55:01', '2019-09-06 06:55:01'),
	(24, 'string', 'string', 0, 'string', '2019-09-06 06:55:01', '2019-09-06 06:55:01'),
	(26, 'string', 'string', 0, 'string', '2019-09-06 07:01:32', '2019-09-06 07:01:32'),
	(27, 'string', 'string', 0, 'string', '2019-09-06 07:01:32', '2019-09-06 07:01:32'),
	(37, 'ewqwe', '适者生存@22.cc', 1, '<p>qweqwe</p>', '2019-11-09 10:00:46', '2019-11-09 10:00:46'),
	(38, 'ewqwe', '适者生存@22.cc', 1, '<p>qweqwe</p>', '2019-11-09 10:00:49', '2019-11-09 10:00:49'),
	(39, 'dsfds', 'dsfsd@qq.ccc', 1, '<p>fsdfs</p>', '2019-11-09 10:04:54', '2019-11-09 10:04:54'),
	(40, 'dsfds', 'dsfsd@qq.ccc', 1, '<p>fsdfs</p>', '2019-11-09 10:04:57', '2019-11-09 10:04:57'),
	(41, 'dsfds', 'dsfsd@qq.ccc', 1, '<p>fsdfs</p>', '2019-11-09 10:04:57', '2019-11-09 10:04:57'),
	(42, 'dsfds', 'dsfsd@qq.ccc', 1, '<p>fsdfs</p>', '2019-11-09 10:04:58', '2019-11-09 10:04:58'),
	(43, 'dsfds', 'dsfsd@qq.ccc', 1, '<p>fsdfs</p>', '2019-11-09 10:04:59', '2019-11-09 10:04:59'),
	(44, 'dsfds', 'dsfsd@qq.ccc', 1, '<p>fsdfs</p>', '2019-11-09 10:04:59', '2019-11-09 10:04:59'),
	(45, 'dsfds', 'dsfsd@qq.ccc', 1, '<p>fsdfs</p>', '2019-11-09 10:05:16', '2019-11-09 10:05:16'),
	(46, 'dsfds', 'dsfsd@qq.ccc', 1, '<p>fsdfs</p>', '2019-11-09 10:06:29', '2019-11-09 10:06:29'),
	(47, 'dsfds', 'dsfsd@qq.ccc', 1, '<p>fsdfs</p>', '2019-11-09 10:07:02', '2019-11-09 10:07:02'),
	(48, 'dsfds', 'dsfsd@qq.ccc', 1, '<p>fsdfs</p>', '2019-11-09 10:07:16', '2019-11-09 10:07:16'),
	(49, '2342', '11@ss.cc', 1, '<p>234234</p>', '2019-11-09 10:08:13', '2019-11-09 10:08:13'),
	(50, '2342', '11@ss.cc', 1, '<p>234234</p>', '2019-11-09 10:08:30', '2019-11-09 10:08:30'),
	(51, '2342', '11@ss.cc', 1, '<p>234234</p>', '2019-11-09 10:08:50', '2019-11-09 10:08:50'),
	(52, '2342', '11@ss.cc', 1, '<p>234234</p>', '2019-11-09 10:09:09', '2019-11-09 10:09:09'),
	(53, '2342', '11@ss.cc', 1, '<p>234234</p>', '2019-11-09 10:09:31', '2019-11-09 10:09:31'),
	(54, '2342', '11@ss.cc', 1, '<p>234234</p>', '2019-11-09 10:12:24', '2019-11-09 10:12:24'),
	(55, '2342', '11@ss.cc', 1, '<p>234234</p>', '2019-11-09 10:13:13', '2019-11-09 10:13:13'),
	(56, 'asdasd', '3423@aqq.cc', 0, '<p>asdasd</p>', '2019-11-09 10:20:42', '2019-11-09 10:20:42'),
	(57, 'asdasd', '3423@aqq.cc', 0, '<p>asdasd</p>', '2019-11-09 10:20:52', '2019-11-09 10:20:52'),
	(58, 'asdasd', '3423@aqq.cc', 0, '<p>asdasd</p>', '2019-11-09 10:21:16', '2019-11-09 10:21:16'),
	(59, 'asdasd', '3423@aqq.cc', 0, '<p>asdasd</p>', '2019-11-09 10:21:24', '2019-11-09 10:21:24'),
	(60, 'asdasd', '3423@aqq.cc', 0, '<p>asdasd</p>', '2019-11-09 10:21:30', '2019-11-09 10:21:30'),
	(61, 'asdasd', '3423@aqq.cc', 0, '<p>asdasd</p>', '2019-11-09 10:21:53', '2019-11-09 10:21:53'),
	(62, 'a21312', '23423@qq.cc', 0, '<p>asdasdas</p>', '2019-11-09 10:23:40', '2019-11-09 10:23:40'),
	(63, '11', '1234@qq.com', 0, '<p>23</p>', '2019-11-15 15:35:12', '2019-11-15 15:35:12'),
	(64, '11', '1234@qq.com', 0, '<p>23</p>', '2019-11-15 15:35:15', '2019-11-15 15:35:15'),
	(65, '11', '1234@qq.com', 0, '<p>23</p>', '2019-11-15 15:35:16', '2019-11-15 15:35:16'),
	(66, 'eeee', '1234@qq.com', 0, '<p>&nbsp; &nbsp; eee2233<br></p>', '2019-11-15 17:00:00', '2019-11-15 17:00:00'),
	(67, 'eeee', '1234@qq.com', 0, '<p>&nbsp; &nbsp; eee2233<br></p>', '2019-11-15 17:00:03', '2019-11-15 17:00:03'),
	(68, 'eeee', '1234@qq.com', 0, '<p>&nbsp; &nbsp; eee2233<br></p>', '2019-11-15 17:00:04', '2019-11-15 17:00:04'),
	(69, '22223', '1017146812@qq.com', 0, '<p>&nbsp; &nbsp; e34233<br></p>', '2019-11-15 17:00:33', '2019-11-15 17:00:33'),
	(70, '22223', '1017146812@qq.com', 0, '<p>&nbsp; &nbsp; e34233<br></p>', '2019-11-15 17:00:34', '2019-11-15 17:00:34'),
	(71, '22223', '1017146812@qq.com', 0, '<p>&nbsp; &nbsp; e34233<br></p>', '2019-11-15 17:00:34', '2019-11-15 17:00:34'),
	(72, '22223', '12232', 0, '<p>&nbsp; &nbsp; e34233<br></p>', '2019-11-15 17:00:49', '2019-11-15 17:00:49'),
	(73, '22223', '12232@qq.com', 0, '<p>&nbsp; &nbsp; e34233<br></p>', '2019-11-15 17:00:56', '2019-11-15 17:00:56'),
	(74, 'dsasdasd', 'asdas@qq.com', 0, '<p>asdasd</p>', '2019-11-16 08:51:44', '2019-11-16 08:51:44'),
	(75, 'dsasdasd', 'asdas@qq.com', 0, '<p>asdasd</p>', '2019-11-16 09:05:10', '2019-11-16 09:05:10'),
	(76, 'dsasdasd', 'asdas@qq.com', 0, '<p>asdasd</p>', '2019-11-16 09:05:14', '2019-11-16 09:05:14'),
	(77, 'dsasdasd', 'asdas@qq.com', 0, '<p>asdasd</p>', '2019-11-16 09:06:34', '2019-11-16 09:06:34'),
	(78, 'dsasdasd', 'asdas@qq.com', 0, '<p>asdasd</p>', '2019-11-16 09:07:09', '2019-11-16 09:07:09'),
	(79, 'dsasdasd', 'asdas@qq.com', 0, '<p>asdasd</p>', '2019-11-16 09:07:30', '2019-11-16 09:07:30'),
	(80, 'dsasdasd', 'asdas@qq.com', 0, '<p>asdasd</p>', '2019-11-16 09:07:32', '2019-11-16 09:07:32'),
	(81, 'dsasdasd', 'asdas@qq.com', 0, '<p>asdasd</p>', '2019-11-16 09:08:29', '2019-11-16 09:08:29'),
	(82, 'sdfs', 'ss@ss.cc', 0, '<p>dsdsf</p>', '2019-11-16 09:08:46', '2019-11-16 09:08:46'),
	(83, 'asdasd', 'asd@qq.vv', 0, '<p>asdas</p>', '2019-11-16 09:09:18', '2019-11-16 09:09:18'),
	(84, 'asdasd', 'asd@qq.vv', 0, '<p>asdas</p>', '2019-11-16 09:09:42', '2019-11-16 09:09:42'),
	(85, 'asdasd', 'asd@qq.vv', 0, '<p>asdas</p>', '2019-11-16 09:09:46', '2019-11-16 09:09:46'),
	(86, 'dasdad', 'dasda@ss.cc', 1, '<p>dasasdas</p>', '2019-11-16 09:10:05', '2019-11-16 09:10:05');
/*!40000 ALTER TABLE `t_email` ENABLE KEYS */;

-- 导出  表 smart-admin-dev.t_employee 结构
DROP TABLE IF EXISTS `t_employee`;
CREATE TABLE IF NOT EXISTS `t_employee` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `login_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '登录帐号',
  `login_pwd` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '登录密码',
  `actual_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '员工名称',
  `nick_name` varchar(30) DEFAULT '' COMMENT '别名',
  `phone` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '手机号码',
  `id_card` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '身份证',
  `birthday` date DEFAULT NULL COMMENT '出生日期',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `department_id` int unsigned NOT NULL COMMENT '部门id',
  `is_leave` int NOT NULL DEFAULT '0' COMMENT '是否离职1是',
  `is_disabled` int NOT NULL DEFAULT '0' COMMENT '是否被禁用 0否1是',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `create_user` int unsigned NOT NULL COMMENT '创建者id',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `is_delete` int NOT NULL DEFAULT '0' COMMENT '是否删除0否 1是',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='员工表';

-- 正在导出表  smart-admin-dev.t_employee 的数据：~28 rows (大约)
DELETE FROM `t_employee`;
/*!40000 ALTER TABLE `t_employee` DISABLE KEYS */;

-- 导出  表 smart-admin-dev.t_file 结构
DROP TABLE IF EXISTS `t_file`;
CREATE TABLE IF NOT EXISTS `t_file` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `module_id` varchar(50) NOT NULL COMMENT '相关业务id',
  `module_type` varchar(50) NOT NULL COMMENT '相关业务类型',
  `file_name` varchar(255) DEFAULT NULL COMMENT '文件名称',
  `file_size` varchar(255) DEFAULT NULL COMMENT '文件大小',
  `file_type` varchar(50) DEFAULT NULL COMMENT '文件类型，程序中枚举控制，文件类型：如身份证正面，三证合一等等',
  `file_path` varchar(255) NOT NULL COMMENT '文件key，用于文件下载',
  `file_location_type` int NOT NULL COMMENT '文件位置类型',
  `creater_user` int NOT NULL COMMENT '创建人，即上传人',
  `update_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '上次更新时间',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `module_id_module_type` (`module_id`,`module_type`) USING BTREE,
  KEY `module_type` (`module_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- 正在导出表  smart-admin-dev.t_file 的数据：~23 rows (大约)
DELETE FROM `t_file`;
/*!40000 ALTER TABLE `t_file` DISABLE KEYS */;
INSERT INTO `t_file` (`id`, `module_id`, `module_type`, `file_name`, `file_size`, `file_type`, `file_path`, `file_location_type`, `creater_user`, `update_time`, `create_time`) VALUES
	(1, '1', '1', '阿里云1.jpg', NULL, NULL, 'backUser/config/d1788b717be24f14ba526f25397b936f', 2, 1, NULL, '2019-07-05 10:38:15'),
	(2, '2', '1', '1.jpg', NULL, NULL, 'backUser/config/8895ec770c4e4e558c6d9b54eb00dffc', 2, 1, '2019-07-18 09:20:59', '2019-07-18 09:20:25'),
	(3, '3', '1', '随笔.txt', NULL, NULL, 'backUser/config/f5cbc4c9a56f4fa7ad0ba58b0aa5d169', 2, 1, NULL, '2019-07-18 09:22:47'),
	(4, '3', '1', '1.jpg', NULL, NULL, 'backUser/config/2019071809245603e0a4e449a4bf3aa28ee731c309040.jpg', 1, 1, NULL, '2019-07-18 09:24:51'),
	(6, '4', '1', '1.jpg', NULL, NULL, 'backUser/config/ddcb8214ba274dec9bb2c33e0e246391', 3, 1, NULL, '2019-07-19 16:19:43'),
	(7, '5', '1', 'sql.txt', NULL, NULL, 'backUser/config/cfbdf9562c894405b5b6f64f71fa812a', 3, 1, NULL, '2019-07-19 17:41:55'),
	(9, '1', '1', '20190912023241a6132f5713b54e1fb490f4ea88115747.md', NULL, NULL, 'backUser/config/20190912023241a6132f5713b54e1fb490f4ea88115747.md', 1, 1, '2019-09-12 15:25:35', '2019-09-12 14:32:42'),
	(10, '1', '1', '201909120232499804998573f643ff8e58189d23485629.mjs', NULL, NULL, 'backUser/config/201909120232499804998573f643ff8e58189d23485629.mjs', 1, 1, '2019-09-12 15:25:19', '2019-09-12 14:32:50'),
	(11, '1', '1', '201909120326564cdc8df7b8cc49cfb273926877f047f5.json', NULL, NULL, 'backUser/config/201909120326564cdc8df7b8cc49cfb273926877f047f5.json', 1, 1, NULL, '2019-09-12 15:26:56'),
	(12, '1', '1', '201909120343357104b7f1cc684f5797ada35c06aba770.json', NULL, NULL, 'backUser/config/201909120343357104b7f1cc684f5797ada35c06aba770.json', 1, 1, NULL, '2019-09-12 15:43:36'),
	(13, '1', '1', '201909120343427e408141a0ea467ea2e012f7086a6265.json', NULL, NULL, 'backUser/config/201909120343427e408141a0ea467ea2e012f7086a6265.json', 1, 1, NULL, '2019-09-12 15:43:42'),
	(14, '1', '1', '20190912034543b4d3a061fb2e416c899fe2ff6b9327e0.ts', NULL, NULL, 'backUser/config/20190912034543b4d3a061fb2e416c899fe2ff6b9327e0.ts', 1, 1, NULL, '2019-09-12 15:45:43'),
	(15, '1', '1', '20190912034550a5dc04ce79b14a1cb2bb76545c909aa8.md', NULL, NULL, 'backUser/config/20190912034550a5dc04ce79b14a1cb2bb76545c909aa8.md', 1, 1, NULL, '2019-09-12 15:45:51'),
	(16, '1', '1', 'LICENCE', NULL, NULL, 'backUser/config/cc02b99c0ec548f1a2231b70b7d569b8', 2, 1, NULL, '2019-09-12 15:47:22'),
	(17, '1', '1', 'bignumber.min.js', NULL, NULL, 'backUser/config/bda49e8ad6d242fe8735b2023dfbf125', 2, 1, NULL, '2019-09-12 15:47:29'),
	(18, '1', '1', '20190912034880a881fa8fbc841bfb7194ff312bd1058.json', NULL, NULL, 'backUser/config/20190912034880a881fa8fbc841bfb7194ff312bd1058.json', 1, 1, NULL, '2019-09-12 15:48:08'),
	(19, '1', '1', '20190912034816ece14084acf345a79396a0f4347c4e44.md', NULL, NULL, 'backUser/config/20190912034816ece14084acf345a79396a0f4347c4e44.md', 1, 1, NULL, '2019-09-12 15:48:16'),
	(20, '1', '1', '20191024054412fac4b4e04c574c6eab71f91e13a8a0b6.jpg', NULL, NULL, 'backUser/config/20191024054412fac4b4e04c574c6eab71f91e13a8a0b6.jpg', 1, 1, NULL, '2019-10-24 17:44:13'),
	(21, '1', '1', '20191106042073f7ef01bde3046bd8e01928f397230bd.jpg', NULL, NULL, 'backUser/config/20191106042073f7ef01bde3046bd8e01928f397230bd.jpg', 1, 1, NULL, '2019-11-06 02:20:13'),
	(22, '1', '1', '201911130802024b8a2ebf80543a98241bb464682650d.jpg', NULL, NULL, 'backUser/config/201911130802024b8a2ebf80543a98241bb464682650d.jpg', 1, 1, NULL, '2019-11-13 06:02:01'),
	(23, '1', '1', '20191113080210d1d98eea46364d268b2a03fa03f7a446.jpg', NULL, NULL, 'backUser/config/20191113080210d1d98eea46364d268b2a03fa03f7a446.jpg', 1, 1, NULL, '2019-11-13 06:02:14'),
	(24, '1', '1', '20191115043844e92b25e70fb140a1885614b978469ca9.jpg', NULL, NULL, 'backUser/config/20191115043844e92b25e70fb140a1885614b978469ca9.jpg', 1, 38, NULL, '2019-11-15 02:38:45'),
	(25, '1', '1', '20191116060546d3a2c703cb5546b3851612907cc3786f.png', NULL, NULL, 'backUser/config/20191116060546d3a2c703cb5546b3851612907cc3786f.png', 1, 1, NULL, '2019-11-16 10:05:47');
/*!40000 ALTER TABLE `t_file` ENABLE KEYS */;

-- 导出  表 smart-admin-dev.t_heart_beat_record 结构
DROP TABLE IF EXISTS `t_heart_beat_record`;
CREATE TABLE IF NOT EXISTS `t_heart_beat_record` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `project_path` varchar(100) DEFAULT NULL COMMENT '项目名称',
  `server_ip` varchar(200) DEFAULT NULL COMMENT '服务器ip',
  `process_no` int DEFAULT NULL COMMENT '进程号',
  `process_start_time` datetime DEFAULT NULL COMMENT '进程开启时间',
  `heart_beat_time` datetime DEFAULT NULL COMMENT '心跳时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- 正在导出表  smart-admin-dev.t_heart_beat_record 的数据：~2 rows (大约)
DELETE FROM `t_heart_beat_record`;
/*!40000 ALTER TABLE `t_heart_beat_record` DISABLE KEYS */;
INSERT INTO `t_heart_beat_record` (`id`, `project_path`, `server_ip`, `process_no`, `process_start_time`, `heart_beat_time`) VALUES
	(1, '/home/server/smart-admin/dev', '192.168.122.1;172.16.0.145', 14843, '2019-11-16 03:11:50', '2019-11-16 03:58:01'),
	(2, 'F:\\codespace\\idea\\gangquan360\\foundation', '172.16.1.188;192.168.56.1', 227992, '2019-11-16 10:02:39', '2019-11-16 10:06:50'),
	(3, 'E:\\codespace\\zhuoda', '192.168.8.188', 17564, '2020-12-14 07:11:12', '2020-12-14 07:13:34'),
	(4, 'E:\\codespace\\zhuoda', '192.168.8.188', 15568, '2020-12-14 07:13:53', '2020-12-14 07:15:00'),
	(5, 'E:\\codespace\\zhuoda', '192.168.8.188', 16548, '2020-12-14 07:16:07', '2020-12-14 07:17:14');
/*!40000 ALTER TABLE `t_heart_beat_record` ENABLE KEYS */;

-- 导出  表 smart-admin-dev.t_id_generator 结构
DROP TABLE IF EXISTS `t_id_generator`;
CREATE TABLE IF NOT EXISTS `t_id_generator` (
  `id` int DEFAULT NULL,
  `key_name` varchar(50) NOT NULL COMMENT '英文key',
  `rule_format` varchar(500) NOT NULL COMMENT '规则格式。no_cycle没有周期, year_cycle 年周期, month_cycle月周期, day_cycle 日周期',
  `rule_type` varchar(50) NOT NULL COMMENT '格式[yyyy]表示年,[mm]标识月,[dd]表示日,[nnn]表示三位数字',
  `init_number` int NOT NULL DEFAULT '1' COMMENT '初始值',
  `last_number` int DEFAULT NULL COMMENT '上次产生的id, 默认为空',
  `remark` varchar(1000) NOT NULL COMMENT '备注',
  `update_time` datetime DEFAULT NULL,
  `create_time` datetime NOT NULL,
  UNIQUE KEY `key_name` (`key_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='id生成器定义表';

-- 正在导出表  smart-admin-dev.t_id_generator 的数据：~2 rows (大约)
DELETE FROM `t_id_generator`;
/*!40000 ALTER TABLE `t_id_generator` DISABLE KEYS */;
INSERT INTO `t_id_generator` (`id`, `key_name`, `rule_format`, `rule_type`, `init_number`, `last_number`, `remark`, `update_time`, `create_time`) VALUES
	(2, 'goods_num', '[nnnnnnn]', 'NO_CYCLE', 1, NULL, '商品编号', '2019-04-09 09:48:04', '2019-03-29 14:14:12'),
	(1, 'order', '[yyyy][mm][dd][nnnnn]', 'DAY_CYCLE', 1, 1, '订单编号', '2019-03-30 11:25:42', '2019-03-29 14:14:12');
/*!40000 ALTER TABLE `t_id_generator` ENABLE KEYS */;

-- 导出  表 smart-admin-dev.t_id_generator_record 结构
DROP TABLE IF EXISTS `t_id_generator_record`;
CREATE TABLE IF NOT EXISTS `t_id_generator_record` (
  `generator_id` int NOT NULL,
  `year` int NOT NULL,
  `month` int NOT NULL,
  `day` int NOT NULL,
  `last_number` int NOT NULL,
  PRIMARY KEY (`generator_id`,`year`,`month`,`day`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='id_generator记录表';

-- 正在导出表  smart-admin-dev.t_id_generator_record 的数据：~5 rows (大约)
DELETE FROM `t_id_generator_record`;
/*!40000 ALTER TABLE `t_id_generator_record` DISABLE KEYS */;
INSERT INTO `t_id_generator_record` (`generator_id`, `year`, `month`, `day`, `last_number`) VALUES
	(1, 2019, 3, 30, 1),
	(2, 2019, 3, 30, 1),
	(2, 2019, 4, 3, 2),
	(2, 2019, 4, 8, 2),
	(2, 2019, 4, 9, 1);
/*!40000 ALTER TABLE `t_id_generator_record` ENABLE KEYS */;

-- 导出  表 smart-admin-dev.t_notice 结构
DROP TABLE IF EXISTS `t_notice`;
CREATE TABLE IF NOT EXISTS `t_notice` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '消息标题',
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '消息内容',
  `deleted` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '删除状态：0未删除 0删除 ',
  `send_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '发送状态 0未发送 1发送',
  `create_user` bigint NOT NULL COMMENT '消息创建人',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 正在导出表  smart-admin-dev.t_notice 的数据：~14 rows (大约)
DELETE FROM `t_notice`;
/*!40000 ALTER TABLE `t_notice` DISABLE KEYS */;
INSERT INTO `t_notice` (`id`, `title`, `content`, `deleted`, `send_status`, `create_user`, `create_time`, `update_time`) VALUES
	(93, '大扫把', '晓冬吃大便', 1, 1, 1, '2019-07-13 17:54:13', '2019-07-13 17:54:21'),
	(95, '4444444', '444444444444', 1, 1, 1, '2019-07-13 17:54:53', '2019-09-04 09:42:02'),
	(96, '3434', '444444', 1, 1, 1, '2019-07-13 17:58:42', '2019-11-08 09:05:24'),
	(97, '44444', '555555555555', 1, 1, 1, '2019-07-13 17:58:54', '2019-09-03 16:19:50'),
	(98, '《青花瓷》', '素胚勾勒出青花笔锋浓转淡\n瓶身描绘的牡丹一如你初妆\n冉冉檀香透过窗心事我了然\n周杰伦 青花瓷\n周杰伦 青花瓷\n宣纸上走笔至此搁一半\n釉色渲染仕女图韵味被私藏\n而你嫣然的一笑如含苞待放\n你的美一缕飘散\n去到我去不了的地方\n天青色等烟雨 而我在等你\n炊烟袅袅升起 隔江千万里\n在瓶底书刻隶仿前朝的飘逸\n就当我为遇见你伏笔\n天青色等烟雨 而我在等你\n月色被打捞起 晕开了结局\n如传世的青花瓷自顾自美丽\n你眼带笑意\n色白花青的锦鲤跃然于碗底\n临摹宋体落款时却惦记着你\n你隐藏在窑烧里千年的秘密\n极细腻犹如绣花针落地\n篱外芭蕉惹骤雨门环惹铜绿\n而我路过那江南小镇惹了你\n在泼墨山水画里\n你从墨色深处被隐去\n天青色等烟雨 而我在等你\n炊烟袅袅升起 隔江千万里\n在瓶底书刻隶仿前朝的飘逸\n就当我为遇见你伏笔\n天青色等烟雨 而我在等你\n月色被打捞起 晕开了结局\n如传世的青花瓷自顾自美丽\n你眼带笑意\n天青色等烟雨 而我在等你\n炊烟袅袅升起 隔江千万里\n在瓶底书刻隶仿前朝的飘逸\n就当我为遇见你伏笔\n天青色等烟雨 而我在等你\n月色被打捞起 晕开了结局\n如传世的青花瓷自顾自美丽\n你眼带笑意 ', 1, 1, 1, '2019-08-05 16:36:44', '2019-09-02 17:53:12'),
	(99, '1', '2', 1, 1, 30, '2019-08-08 14:53:58', '2019-08-08 14:54:07'),
	(100, '呵呵', '呵呵', 1, 1, 1, '2019-08-20 16:52:53', '2019-09-02 17:46:59'),
	(101, 'aa', 'bbcc', 1, 1, 30, '2019-08-23 09:51:01', '2019-08-23 09:51:28'),
	(102, '1', '2', 0, 1, 1, '2019-09-05 14:28:10', '2019-09-05 14:28:10'),
	(103, '12', '22', 0, 1, 1, '2019-09-05 14:29:30', '2019-09-05 14:29:30'),
	(104, 'a', 'b', 1, 1, 30, '2019-09-06 14:21:18', '2019-09-06 14:24:07'),
	(105, '22222222222', '1111', 0, 0, 1, '2019-11-07 19:05:56', '2019-11-07 19:05:56'),
	(106, '423', '234', 0, 0, 37, '2019-11-08 21:48:19', '2019-11-08 21:48:19'),
	(107, 'AAS', 's\'da\'ssdas', 1, 1, 1, '2019-11-13 19:06:55', '2019-11-14 09:07:06');
/*!40000 ALTER TABLE `t_notice` ENABLE KEYS */;

-- 导出  表 smart-admin-dev.t_notice_receive_record 结构
DROP TABLE IF EXISTS `t_notice_receive_record`;
CREATE TABLE IF NOT EXISTS `t_notice_receive_record` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `notice_id` bigint NOT NULL COMMENT '消息id',
  `employee_id` bigint NOT NULL COMMENT '用户id',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=141 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 正在导出表  smart-admin-dev.t_notice_receive_record 的数据：~27 rows (大约)
DELETE FROM `t_notice_receive_record`;
/*!40000 ALTER TABLE `t_notice_receive_record` DISABLE KEYS */;
INSERT INTO `t_notice_receive_record` (`id`, `notice_id`, `employee_id`, `create_time`, `update_time`) VALUES
	(114, 93, 1, '2019-07-13 17:54:16', '2019-07-13 17:54:16'),
	(115, 95, 1, '2019-07-13 17:54:55', '2019-07-13 17:54:55'),
	(116, 95, 22, '2019-07-13 17:58:03', '2019-07-13 17:58:03'),
	(117, 93, 22, '2019-07-13 17:58:05', '2019-07-13 17:58:05'),
	(118, 96, 1, '2019-07-13 17:58:44', '2019-07-13 17:58:44'),
	(119, 97, 1, '2019-07-13 17:58:58', '2019-07-13 17:58:58'),
	(120, 98, 1, '2019-08-05 16:37:01', '2019-08-05 16:37:01'),
	(121, 99, 30, '2019-08-08 14:54:05', '2019-08-08 14:54:05'),
	(122, 99, 1, '2019-08-08 15:15:44', '2019-08-08 15:15:44'),
	(123, 100, 1, '2019-08-20 16:53:29', '2019-08-20 16:53:29'),
	(124, 101, 30, '2019-08-23 09:51:11', '2019-08-23 09:51:11'),
	(125, 101, 1, '2019-08-23 12:46:27', '2019-08-23 12:46:27'),
	(126, 102, 1, '2019-09-05 14:28:32', '2019-09-05 14:28:32'),
	(127, 104, 30, '2019-09-06 14:23:58', '2019-09-06 14:23:58'),
	(128, 104, 1, '2019-09-06 15:25:13', '2019-09-06 15:25:13'),
	(129, 101, 14, '2019-11-02 21:46:13', '2019-11-02 21:46:13'),
	(130, 102, 14, '2019-11-02 21:46:14', '2019-11-02 21:46:14'),
	(131, 104, 14, '2019-11-02 21:46:15', '2019-11-02 21:46:15'),
	(132, 98, 14, '2019-11-02 21:46:18', '2019-11-02 21:46:18'),
	(133, 103, 37, '2019-11-07 19:58:06', '2019-11-07 19:58:06'),
	(134, 103, 1, '2019-11-07 20:03:54', '2019-11-07 20:03:54'),
	(135, 107, 1, '2019-11-13 19:07:02', '2019-11-13 19:07:02'),
	(136, 107, 38, '2019-11-15 02:11:04', '2019-11-15 02:11:04'),
	(137, 104, 38, '2019-11-15 02:11:17', '2019-11-15 02:11:17'),
	(138, 101, 38, '2019-11-15 02:26:33', '2019-11-15 02:26:33'),
	(139, 98, 38, '2019-11-15 02:29:32', '2019-11-15 02:29:32'),
	(140, 100, 38, '2019-11-15 03:19:18', '2019-11-15 03:19:18');
/*!40000 ALTER TABLE `t_notice_receive_record` ENABLE KEYS */;

-- 导出  表 smart-admin-dev.t_order_operate_log 结构
DROP TABLE IF EXISTS `t_order_operate_log`;
CREATE TABLE IF NOT EXISTS `t_order_operate_log` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL COMMENT '各种单据的id',
  `order_type` int NOT NULL COMMENT '单据类型',
  `operate_type` int NOT NULL COMMENT '操作类型',
  `operate_content` text NOT NULL COMMENT '操作类型 对应的中文',
  `operate_remark` text COMMENT '操作备注',
  `employee_id` int NOT NULL COMMENT '员工id',
  `employee_name` varchar(1000) NOT NULL COMMENT '员工名称',
  `ext_data` text COMMENT '额外信息',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `order_id_order_type` (`order_id`,`order_type`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='各种单据操作记录\r\n';

-- 正在导出表  smart-admin-dev.t_order_operate_log 的数据：~0 rows (大约)
DELETE FROM `t_order_operate_log`;
/*!40000 ALTER TABLE `t_order_operate_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_order_operate_log` ENABLE KEYS */;

-- 导出  表 smart-admin-dev.t_peony 结构
DROP TABLE IF EXISTS `t_peony`;
CREATE TABLE IF NOT EXISTS `t_peony` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `kind` varchar(500) DEFAULT NULL COMMENT '品种',
  `name` varchar(500) DEFAULT NULL COMMENT '名字',
  `color` varchar(500) DEFAULT NULL COMMENT '颜色',
  `image_url` text COMMENT '图片链接',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='牡丹花';

-- 正在导出表  smart-admin-dev.t_peony 的数据：~3 rows (大约)
DELETE FROM `t_peony`;
/*!40000 ALTER TABLE `t_peony` DISABLE KEYS */;
INSERT INTO `t_peony` (`id`, `kind`, `name`, `color`, `image_url`, `create_time`, `update_time`) VALUES
	(5, '复色类', '什样锦', '红色', 'https://bkimg.cdn.bcebos.com/pic/3c6d55fbb2fb43160ee185da2aa4462308f7d390?x-bce-process=image/watermark,g_7,image_d2F0ZXIvYmFpa2UxNTA=,xp_5,yp_5', '2020-04-06 22:02:32', '2020-04-06 22:03:30'),
	(6, '绿色', '绿香球', '绿色', '11', '2020-04-06 22:14:35', '2020-04-06 22:17:51'),
	(7, '墨紫色类', '冠世墨玉', '紫色', '34534534534', '2020-04-06 22:15:19', '2020-04-06 22:18:21');
/*!40000 ALTER TABLE `t_peony` ENABLE KEYS */;

-- 导出  表 smart-admin-dev.t_position 结构
DROP TABLE IF EXISTS `t_position`;
CREATE TABLE IF NOT EXISTS `t_position` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `position_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '岗位名称',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '岗位描述',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='岗位表';

-- 正在导出表  smart-admin-dev.t_position 的数据：~13 rows (大约)
DELETE FROM `t_position`;
/*!40000 ALTER TABLE `t_position` DISABLE KEYS */;
INSERT INTO `t_position` (`id`, `position_name`, `remark`, `update_time`, `create_time`) VALUES
	(1, 'java develop', 'java develop is good job', '2019-07-03 15:18:45', '2019-07-03 15:18:45'),
	(2, 'android develop', 'android develop is good job', '2019-07-04 16:11:11', '2019-07-04 16:11:00'),
	(3, '测试岗位1', '这是内容11', '2019-09-02 16:39:33', '2019-07-10 14:03:50'),
	(8, '测试岗位2', '测试岗位2.。', '2019-09-04 10:19:40', '2019-09-04 10:19:32'),
	(9, '测试岗位3', '测试岗位3', '2019-09-05 14:39:43', '2019-09-05 14:39:43'),
	(10, '测试岗位4', '测试岗位4', '2019-09-05 14:39:48', '2019-09-05 14:39:48'),
	(11, '测试岗位5', '测试岗位5', '2019-09-05 14:39:53', '2019-09-05 14:39:53'),
	(12, '测试岗位6', '测试岗位6', '2019-09-05 14:39:58', '2019-09-05 14:39:58'),
	(13, '测试岗位7', '测试岗位7', '2019-09-05 14:40:03', '2019-09-05 14:40:03'),
	(14, '测试岗位8', '测试岗位8', '2019-09-05 14:40:09', '2019-09-05 14:40:09'),
	(15, '测试岗位9', '测试岗位9', '2019-09-05 14:40:19', '2019-09-05 14:40:19'),
	(16, 'aaa22222', 'ddddddddddd', '2019-11-15 17:04:29', '2019-11-06 15:58:37'),
	(17, 'ddd', 'fsdef', '2019-11-15 17:04:40', '2019-11-15 17:04:40');
/*!40000 ALTER TABLE `t_position` ENABLE KEYS */;

-- 导出  表 smart-admin-dev.t_position_relation 结构
DROP TABLE IF EXISTS `t_position_relation`;
CREATE TABLE IF NOT EXISTS `t_position_relation` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `position_id` int DEFAULT NULL COMMENT '岗位ID',
  `employee_id` int DEFAULT NULL COMMENT '员工ID',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `job_id` (`position_id`) USING BTREE,
  KEY `employee_id` (`employee_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='岗位关联表';

-- 正在导出表  smart-admin-dev.t_position_relation 的数据：~27 rows (大约)
DELETE FROM `t_position_relation`;
/*!40000 ALTER TABLE `t_position_relation` DISABLE KEYS */;


-- 导出  表 smart-admin-dev.t_privilege 结构
DROP TABLE IF EXISTS `t_privilege`;
CREATE TABLE IF NOT EXISTS `t_privilege` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '功能权限表主键id',
  `type` tinyint NOT NULL COMMENT '1.菜单 2.功能点',
  `name` varchar(50) NOT NULL COMMENT '菜单名称',
  `key` varchar(1000) NOT NULL COMMENT '路由name 英文关键字',
  `url` text COMMENT '路由path/type=3为API接口',
  `sort` int NOT NULL DEFAULT '0' COMMENT '排序',
  `parent_key` varchar(1000) DEFAULT NULL COMMENT '父级key',
  `update_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`) USING BTREE,
  KEY `type` (`type`) USING BTREE,
  KEY `parent_key` (`parent_key`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=127 DEFAULT CHARSET=utf8 COMMENT='权限功能表';

-- 正在导出表  smart-admin-dev.t_privilege 的数据：~103 rows (大约)
DELETE FROM `t_privilege`;


-- 导出  表 smart-admin-dev.t_quartz_task 结构
DROP TABLE IF EXISTS `t_quartz_task`;
CREATE TABLE IF NOT EXISTS `t_quartz_task` (
  `id` int NOT NULL AUTO_INCREMENT,
  `task_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '任务名称',
  `task_bean` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'spring bean名称',
  `task_params` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '任务参数',
  `task_cron` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '运行cron表达式',
  `task_status` tinyint NOT NULL DEFAULT '0' COMMENT '任务状态0:正常，1:暂停',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 正在导出表  smart-admin-dev.t_quartz_task 的数据：~5 rows (大约)
DELETE FROM `t_quartz_task`;
/*!40000 ALTER TABLE `t_quartz_task` DISABLE KEYS */;

-- 导出  表 smart-admin-dev.t_quartz_task_log 结构
DROP TABLE IF EXISTS `t_quartz_task_log`;
CREATE TABLE IF NOT EXISTS `t_quartz_task_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `task_id` int NOT NULL COMMENT '任务id',
  `task_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '任务名称',
  `task_params` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '任务参数',
  `process_status` tinyint NOT NULL COMMENT '任务处理状态0:成功，1:失败',
  `process_duration` bigint NOT NULL DEFAULT '0' COMMENT '运行时长',
  `process_log` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '日志',
  `ip_address` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '运行主机ip',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=732881 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 正在导出表  smart-admin-dev.t_quartz_task_log 的数据：~11 rows (大约)
DELETE FROM `t_quartz_task_log`;


-- 导出  表 smart-admin-dev.t_reload_item 结构
DROP TABLE IF EXISTS `t_reload_item`;
CREATE TABLE IF NOT EXISTS `t_reload_item` (
  `tag` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '项名称',
  `args` varchar(255) DEFAULT NULL COMMENT '参数 可选',
  `identification` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '运行标识',
  `update_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`tag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 正在导出表  smart-admin-dev.t_reload_item 的数据：~0 rows (大约)
DELETE FROM `t_reload_item`;
/*!40000 ALTER TABLE `t_reload_item` DISABLE KEYS */;
INSERT INTO `t_reload_item` (`tag`, `args`, `identification`, `update_time`, `create_time`) VALUES
	('system_config', '234', 'xxxx', '2019-11-14 16:46:21', '2019-04-18 11:48:27');
/*!40000 ALTER TABLE `t_reload_item` ENABLE KEYS */;

-- 导出  表 smart-admin-dev.t_reload_result 结构
DROP TABLE IF EXISTS `t_reload_result`;
CREATE TABLE IF NOT EXISTS `t_reload_result` (
  `tag` varchar(255) NOT NULL,
  `identification` varchar(255) NOT NULL COMMENT '运行标识',
  `args` varchar(255) DEFAULT NULL,
  `result` tinyint unsigned NOT NULL COMMENT '是否成功 ',
  `exception` text,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 正在导出表  smart-admin-dev.t_reload_result 的数据：~127 rows (大约)
DELETE FROM `t_reload_result`;
/*!40000 ALTER TABLE `t_reload_result` DISABLE KEYS */;

-- 导出  表 smart-admin-dev.t_role 结构
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE IF NOT EXISTS `t_role` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `role_name` varchar(20) NOT NULL COMMENT '角色名称',
  `remark` varchar(255) DEFAULT NULL COMMENT '角色描述',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8 COMMENT='角色表';

-- 正在导出表  smart-admin-dev.t_role 的数据：~14 rows (大约)
DELETE FROM `t_role`;

-- 导出  表 smart-admin-dev.t_role_data_scope 结构
DROP TABLE IF EXISTS `t_role_data_scope`;
CREATE TABLE IF NOT EXISTS `t_role_data_scope` (
  `id` int NOT NULL AUTO_INCREMENT,
  `data_scope_type` int NOT NULL COMMENT '数据范围id',
  `view_type` int NOT NULL COMMENT '数据范围类型',
  `role_id` int NOT NULL COMMENT '角色id',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 正在导出表  smart-admin-dev.t_role_data_scope 的数据：~4 rows (大约)
DELETE FROM `t_role_data_scope`;

-- 导出  表 smart-admin-dev.t_role_employee 结构
DROP TABLE IF EXISTS `t_role_employee`;
CREATE TABLE IF NOT EXISTS `t_role_employee` (
  `id` int NOT NULL AUTO_INCREMENT,
  `role_id` int NOT NULL COMMENT '角色id',
  `employee_id` int NOT NULL COMMENT '员工id',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=214 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='角色员工功能表';

-- 正在导出表  smart-admin-dev.t_role_employee 的数据：~25 rows (大约)
DELETE FROM `t_role_employee`;
/*!40000 ALTER TABLE `t_role_employee` DISABLE KEYS */;

-- 导出  表 smart-admin-dev.t_role_privilege 结构
DROP TABLE IF EXISTS `t_role_privilege`;
CREATE TABLE IF NOT EXISTS `t_role_privilege` (
  `id` int NOT NULL AUTO_INCREMENT,
  `role_id` int NOT NULL COMMENT '角色id',
  `privilege_key` varchar(1000) NOT NULL COMMENT '权限key',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10835 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='角色权限功能表';

-- 正在导出表  smart-admin-dev.t_role_privilege 的数据：~322 rows (大约)
DELETE FROM `t_role_privilege`;
/*!40000 ALTER TABLE `t_role_privilege` DISABLE KEYS */;

-- 导出  表 smart-admin-dev.t_system_config 结构
DROP TABLE IF EXISTS `t_system_config`;
CREATE TABLE IF NOT EXISTS `t_system_config` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `config_name` varchar(255) NOT NULL COMMENT '参数名字',
  `config_key` varchar(255) NOT NULL COMMENT '参数key',
  `config_value` text NOT NULL,
  `config_group` varchar(255) NOT NULL COMMENT '参数类别',
  `is_using` int NOT NULL COMMENT '是否使用0 否 1 是',
  `remark` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '上次修改时间',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- 正在导出表  smart-admin-dev.t_system_config 的数据：~8 rows (大约)
DELETE FROM `t_system_config`;
/*!40000 ALTER TABLE `t_system_config` DISABLE KEYS */;

-- 导出  表 smart-admin-dev.t_user_login_log 结构
DROP TABLE IF EXISTS `t_user_login_log`;
CREATE TABLE IF NOT EXISTS `t_user_login_log` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int NOT NULL COMMENT '员工id',
  `user_name` varchar(50) NOT NULL COMMENT '用户名',
  `remote_ip` varchar(50) DEFAULT NULL COMMENT '用户ip',
  `remote_port` int DEFAULT NULL COMMENT '用户端口',
  `remote_browser` varchar(100) DEFAULT NULL COMMENT '浏览器',
  `remote_os` varchar(50) DEFAULT NULL COMMENT '操作系统',
  `login_status` tinyint NOT NULL COMMENT '登录状态 0 失败  1成功',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `customer_id` (`user_id`) USING BTREE,
  KEY `auditor_id` (`remote_browser`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1743 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户登录日志';

-- 正在导出表  smart-admin-dev.t_user_login_log 的数据：~122 rows (大约)
DELETE FROM `t_user_login_log`;
/*!40000 ALTER TABLE `t_user_login_log` DISABLE KEYS */;

-- 导出  表 smart-admin-dev.t_user_operate_log 结构
DROP TABLE IF EXISTS `t_user_operate_log`;
CREATE TABLE IF NOT EXISTS `t_user_operate_log` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int NOT NULL COMMENT '用户id',
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户名称',
  `module` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '操作模块',
  `content` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '操作内容',
  `url` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '请求路径',
  `method` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '请求方法',
  `param` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '请求参数',
  `result` tinyint DEFAULT NULL COMMENT '请求结果 0失败 1成功',
  `fail_reason` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '失败原因',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 正在导出表  smart-admin-dev.t_user_operate_log 的数据：~32 rows (大约)
DELETE FROM `t_user_operate_log`;
/*!40000 ALTER TABLE `t_user_operate_log` DISABLE KEYS */;
