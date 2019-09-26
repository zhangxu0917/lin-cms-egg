/*
 Navicat Premium Data Transfer

 Source Server         : 本地数据库
 Source Server Type    : MySQL
 Source Server Version : 50725
 Source Host           : localhost:3306
 Source Schema         : lin-cms-egg

 Target Server Type    : MySQL
 Target Server Version : 50725
 File Encoding         : 65001

 Date: 26/09/2019 18:50:59
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for SequelizeMeta
-- ----------------------------
DROP TABLE IF EXISTS `SequelizeMeta`;
CREATE TABLE `SequelizeMeta` (
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`name`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of SequelizeMeta
-- ----------------------------
BEGIN;
INSERT INTO `SequelizeMeta` VALUES ('20190828101913-init-lin_article.js');
INSERT INTO `SequelizeMeta` VALUES ('20190830014311-init-lin_columns.js');
INSERT INTO `SequelizeMeta` VALUES ('20190831134851-init-jobs.js');
INSERT INTO `SequelizeMeta` VALUES ('20190903003641-init-lin_join.js');
COMMIT;

-- ----------------------------
-- Table structure for lin_admin
-- ----------------------------
DROP TABLE IF EXISTS `lin_admin`;
CREATE TABLE `lin_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nickname` varchar(24) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '昵称',
  `avatar` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '头像url',
  `admin` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否是管理员',
  `active` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否活动',
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Email地址',
  `group_id` int(11) DEFAULT NULL COMMENT '用户组id',
  `password` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '密码',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `nickname` (`nickname`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of lin_admin
-- ----------------------------
BEGIN;
INSERT INTO `lin_admin` VALUES (1, 'super', 'http://7n.webgo.vip/avatar.png', 1, 1, NULL, 2, 'sha1$2a00b748$1$1fef3d3297477b2c9c0f26a5496d3dc64e08bf5a', '2019-08-07 08:48:32', '2019-08-29 10:43:56', NULL);
INSERT INTO `lin_admin` VALUES (2, 'admin01', 'https://s2.ax1x.com/2019/08/05/e29sl8.jpg', 2, 1, NULL, 1, '9db06bcff9248837f86d1a6bcf41c9e7', '2019-08-20 09:06:56', '2019-09-10 08:41:55', NULL);
INSERT INTO `lin_admin` VALUES (3, 'admin02', 'http://7n.webgo.vip/1.jpg', 2, 1, 'ceshi@qq.com', 3, 'e10adc3949ba59abbe56e057f20f883e', '2019-08-26 09:46:39', '2019-08-29 10:25:59', NULL);
COMMIT;

-- ----------------------------
-- Table structure for lin_article
-- ----------------------------
DROP TABLE IF EXISTS `lin_article`;
CREATE TABLE `lin_article` (
  `id` int(8) NOT NULL AUTO_INCREMENT COMMENT '文章ID',
  `cid` int(2) NOT NULL COMMENT '栏目ID',
  `title` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '标题',
  `author` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '管理员' COMMENT '作者',
  `url` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '链接地址',
  `pageviews` int(10) NOT NULL DEFAULT '0' COMMENT '浏览量',
  `description` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '描述',
  `cover` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'http://7n.webgo.vip/no-image.jpg' COMMENT '封面图片',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态(0-隐藏,1-正常)',
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '文章内容',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除(0-否,1-是)',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of lin_article
-- ----------------------------
BEGIN;
INSERT INTO `lin_article` VALUES (1, 109, '我是文章标题1', '管理员1', 'http://www.webgo.vip/eggcms/article?id=1', 1, '文章描述1', 'http://7n.webgo.vip/banner1.jpg', 0, '我是文章的内容1我是文章的内容1我是文章的内容1', 0, '2019-08-28 17:52:05', '2019-09-18 18:49:00');
INSERT INTO `lin_article` VALUES (2, 101, '我是文章标题', '管理员', 'http://www.webgo.vip/eggcms/article?id=2', 0, NULL, 'http://7n.webgo.vip/banner2.jpg', 1, '我是文章的内容我是文章的内容我是文章的内容', 0, '2019-08-28 20:13:15', '2019-08-30 09:02:25');
INSERT INTO `lin_article` VALUES (3, 101, '我是文章标题3', '管理员3', 'http://www.webgo.vip/eggcms/article?id=3', 0, NULL, 'http://7n.webgo.vip/banner3.jpg', 1, '我是文章的内容3我是文章的内容3我是文章的内容3', 0, '2019-08-28 20:15:16', '2019-08-30 09:02:26');
INSERT INTO `lin_article` VALUES (4, 102, '我是文章标题4', '管理员4', 'http://www.webgo.vip/eggcms/article?id=4', 0, NULL, 'http://7n.webgo.vip/banner4.jpg', 1, '我是文章的内容3我是文章的内容3我是文章的内容4', 0, '2019-08-29 08:36:33', '2019-08-30 09:03:09');
INSERT INTO `lin_article` VALUES (6, 102, '我是文章标题5', '管理员5', 'http://www.webgo.vip/eggcms/article?id=5', 0, NULL, 'http://7n.webgo.vip/banner5.jpg', 1, '我是文章的内容3我是文章的内容3我是文章的内容5', 0, '2019-08-29 15:19:21', '2019-08-30 09:03:13');
INSERT INTO `lin_article` VALUES (7, 101, 'React中富文本编辑器的技术选型调研', '大天狗子11', '#', 0, '描述111', 'http://7n.webgo.vip/1568857726362.jpg', 1, '<h2 style=\"text-align:start;text-indent:2em;\"><strong>前言11</strong></h2><p style=\"text-align:start;text-indent:2em;\">富文本编辑器是项目中不可或缺的部分，目前市面上可以选择的富文本编辑器种类繁多，如何在项目中选择一款集轻量，美观，稳定，坑少，满足需求的富文本编辑器变成了团队中一个重要的问题。</p><p style=\"text-align:start;text-indent:2em;\">现在项目中使用的是 WangEditor，为了寻找到更好的替代品，我针对 Ant Design 官方推荐的两款的富文本编辑器做了调研。Ant Design 称它们为“社区精选组件”，在心理层面上觉得应该会比较稳定，尤其是结合 Ant Design 使用。</p><p style=\"text-align:start;text-indent:2em;\">我对这两款富文本编辑器都进行了使用，并结合目前的项目需求进行了比较。下面是我的使用体验。</p><h2 style=\"text-align:start;text-indent:2em;\"><strong>react-quill</strong></h2><p style=\"text-align:start;text-indent:2em;\">第一款富文本编辑器叫作 react-quill，是国外一个社区维护的，贡献者有二三十人。quill 在英文中是鹅毛笔的意思，听起来还是很有美感的。<a href=\"https://zenoamaro.github.io/react-quill/\" rel=\"nofollow noreferrer\">点击这里查看 demo</a></p><h3 style=\"text-align:start;text-indent:2em;\"><strong>基本使用</strong></h3><p style=\"text-align:start;text-indent:2em;\">下面是 react-quill 的最基本的用法，非常简单。</p><p></p>', 0, '2019-09-19 09:49:11', '2019-09-20 09:11:56');
COMMIT;

-- ----------------------------
-- Table structure for lin_banner
-- ----------------------------
DROP TABLE IF EXISTS `lin_banner`;
CREATE TABLE `lin_banner` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `sort` int(11) NOT NULL COMMENT '排序位置',
  `title` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '图片标题',
  `desc` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '图片描述',
  `img_url` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '图片地址',
  `link` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '链接地址',
  `is_show` tinyint(4) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示(0-隐藏,1-显示)',
  `is_delete` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '软删除(0-正常,1-删除)',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of lin_banner
-- ----------------------------
BEGIN;
INSERT INTO `lin_banner` VALUES (1, 1, 'banner1的标题', 'banner1的描述', 'http://7n.webgo.vip/banner1.jpg', '#', 1, 1, '2019-08-27 12:02:35', '2019-08-27 16:46:06', NULL);
INSERT INTO `lin_banner` VALUES (2, 2, '', '', 'http://7n.webgo.vip/banner2.jpg', '', 1, 0, '2019-08-27 12:03:32', '2019-08-27 18:05:40', NULL);
INSERT INTO `lin_banner` VALUES (3, 3, 'banenr3', '', 'http://7n.webgo.vip/banner3.jpg', '#', 1, 0, '2019-08-27 16:57:05', '2019-09-17 08:54:27', NULL);
INSERT INTO `lin_banner` VALUES (4, 4, 'banenr4', '', 'http://7n.webgo.vip/banner4.jpg', '#', 0, 0, '2019-08-27 16:57:16', '2019-08-27 18:23:37', NULL);
INSERT INTO `lin_banner` VALUES (5, 5, 'banenr5', '', 'http://7n.webgo.vip/banner5.jpg', '#', 1, 0, '2019-08-27 16:57:24', '2019-08-27 18:05:37', NULL);
INSERT INTO `lin_banner` VALUES (6, 6, 'banenr6', '', 'http://7n.webgo.vip/banner6.jpg', '#', 1, 0, '2019-08-27 16:57:37', '2019-08-27 16:57:37', NULL);
INSERT INTO `lin_banner` VALUES (7, 7, 'banner7', NULL, 'http://7n.webgo.vip/banner1.jpg', '#', 0, 1, '2019-09-12 08:42:53', '2019-09-12 09:42:08', NULL);
COMMIT;

-- ----------------------------
-- Table structure for lin_columns
-- ----------------------------
DROP TABLE IF EXISTS `lin_columns`;
CREATE TABLE `lin_columns` (
  `cid` int(4) NOT NULL AUTO_INCREMENT,
  `type` tinyint(2) NOT NULL,
  `cname` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '1',
  `is_delete` tinyint(2) NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of lin_columns
-- ----------------------------
BEGIN;
INSERT INTO `lin_columns` VALUES (101, 1, '公司新闻', NULL, 1, 0, '2019-08-30 09:51:12', '2019-09-16 09:11:43');
INSERT INTO `lin_columns` VALUES (102, 1, '行业新闻', NULL, 1, 0, '2019-08-30 12:23:07', '2019-09-16 09:11:44');
INSERT INTO `lin_columns` VALUES (103, 1, '内部通知', NULL, 0, 1, '2019-08-30 18:40:38', '2019-09-16 09:11:45');
INSERT INTO `lin_columns` VALUES (104, 2, '运营类', '#', 1, 0, '2019-09-16 09:22:14', '2019-09-17 09:39:37');
INSERT INTO `lin_columns` VALUES (105, 1, '技术新闻', '#', 1, 1, '2019-09-17 08:57:24', '2019-09-17 08:57:31');
INSERT INTO `lin_columns` VALUES (106, 2, '市场类', '#', 1, 0, '2019-09-17 09:40:25', '2019-09-17 09:40:40');
COMMIT;

-- ----------------------------
-- Table structure for lin_jobs
-- ----------------------------
DROP TABLE IF EXISTS `lin_jobs`;
CREATE TABLE `lin_jobs` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `cid` int(8) NOT NULL,
  `title` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `num` int(8) NOT NULL DEFAULT '1',
  `status` tinyint(2) NOT NULL DEFAULT '1',
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_delete` tinyint(2) NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of lin_jobs
-- ----------------------------
BEGIN;
INSERT INTO `lin_jobs` VALUES (1, 201, 'web前端', 1, 1, 'web前端招聘要求', 0, '2019-08-31 22:11:53', '2019-09-02 22:21:28');
INSERT INTO `lin_jobs` VALUES (22, 201, '中级web前端', 2, 1, '中级web前端找人了', 0, '2019-09-02 22:22:13', '2019-09-02 22:22:17');
COMMIT;

-- ----------------------------
-- Table structure for lin_join
-- ----------------------------
DROP TABLE IF EXISTS `lin_join`;
CREATE TABLE `lin_join` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '0',
  `type` tinyint(2) NOT NULL DEFAULT '0',
  `note` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_delete` tinyint(2) NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of lin_join
-- ----------------------------
BEGIN;
INSERT INTO `lin_join` VALUES (1, '张三', '15858888888', '浙江省杭州市江干区火车东站', '暂无', 0, 0, '暂无', 0, '2019-09-03 09:39:37', '2019-09-04 09:04:56');
INSERT INTO `lin_join` VALUES (2, '李四', '15111111111', '浙江省杭州市余杭区未来科技城', '暂无', 0, 0, '暂无', 1, '2019-09-04 08:36:48', '2019-09-24 19:28:38');
INSERT INTO `lin_join` VALUES (4, '王五', '15522222222', '浙江省杭州市余杭区未来科技城', '暂无', 0, 0, '暂无', 0, '2019-09-04 08:53:00', '2019-09-04 08:53:00');
INSERT INTO `lin_join` VALUES (5, '李六', '15566666666', '浙江省杭州市余杭区未来科技城', '暂无', 0, 0, '暂无', 0, '2019-09-04 09:03:15', '2019-09-04 09:03:15');
INSERT INTO `lin_join` VALUES (6, '张七', '15577777777', '浙江省杭州市余杭区未来科技城', '暂无', 2, 0, '暂无', 0, '2019-09-04 09:03:30', '2019-09-25 18:44:31');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
