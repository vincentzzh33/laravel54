/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : blog

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2020-06-23 15:13:19
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin_permissions
-- ----------------------------
DROP TABLE IF EXISTS `admin_permissions`;
CREATE TABLE `admin_permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_permissions
-- ----------------------------
INSERT INTO `admin_permissions` VALUES ('1', 'system', '系统管理', '2020-06-22 14:22:58', '2020-06-22 14:22:58');
INSERT INTO `admin_permissions` VALUES ('2', 'post', '文章管理', '2020-06-22 14:23:16', '2020-06-22 14:23:16');
INSERT INTO `admin_permissions` VALUES ('3', 'topic', '专题管理', '2020-06-22 14:23:24', '2020-06-22 14:23:24');
INSERT INTO `admin_permissions` VALUES ('4', 'notice', '通知管理', '2020-06-22 14:23:35', '2020-06-22 14:23:35');

-- ----------------------------
-- Table structure for admin_permission_role
-- ----------------------------
DROP TABLE IF EXISTS `admin_permission_role`;
CREATE TABLE `admin_permission_role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_permission_role
-- ----------------------------
INSERT INTO `admin_permission_role` VALUES ('1', '1', '1', null, null);
INSERT INTO `admin_permission_role` VALUES ('2', '1', '2', null, null);
INSERT INTO `admin_permission_role` VALUES ('3', '1', '3', null, null);
INSERT INTO `admin_permission_role` VALUES ('4', '1', '4', null, null);
INSERT INTO `admin_permission_role` VALUES ('5', '2', '2', null, null);

-- ----------------------------
-- Table structure for admin_roles
-- ----------------------------
DROP TABLE IF EXISTS `admin_roles`;
CREATE TABLE `admin_roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_roles
-- ----------------------------
INSERT INTO `admin_roles` VALUES ('1', 'sys-manager', '系统管理员', '2020-06-22 13:09:19', '2020-06-22 13:09:22');
INSERT INTO `admin_roles` VALUES ('2', 'post-manager', '文章管理员', '2020-06-22 14:59:22', '2020-06-22 14:59:22');

-- ----------------------------
-- Table structure for admin_role_user
-- ----------------------------
DROP TABLE IF EXISTS `admin_role_user`;
CREATE TABLE `admin_role_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_role_user
-- ----------------------------
INSERT INTO `admin_role_user` VALUES ('1', '1', '2', null, null);
INSERT INTO `admin_role_user` VALUES ('2', '2', '1', null, null);

-- ----------------------------
-- Table structure for admin_users
-- ----------------------------
DROP TABLE IF EXISTS `admin_users`;
CREATE TABLE `admin_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_users
-- ----------------------------
INSERT INTO `admin_users` VALUES ('1', 'test', '$2y$10$V3LnvE5uAjtPLld5KU4Zh.6G4tTcYL9peTDlGnaY6N8KsSkb2RMZ2', '2020-06-19 16:20:47', '2020-06-19 16:20:47');
INSERT INTO `admin_users` VALUES ('2', 'admin', '$2y$10$Mykm6G.K.hESJ/6pEd4rtemyL1tQ1dft.g9gsxdVB6pow4T.c0wQy', '2020-06-19 19:35:42', '2020-06-19 19:35:42');

-- ----------------------------
-- Table structure for comments
-- ----------------------------
DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `post_id` int(11) NOT NULL DEFAULT '0',
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of comments
-- ----------------------------
INSERT INTO `comments` VALUES ('1', '1', '26', '左左工', '2020-06-16 13:45:29', '2020-06-16 13:45:29');
INSERT INTO `comments` VALUES ('2', '1', '26', '大工z', '2020-06-16 13:47:50', '2020-06-16 13:47:50');
INSERT INTO `comments` VALUES ('3', '1', '49', 'dfa', '2020-06-16 13:48:16', '2020-06-16 13:48:16');
INSERT INTO `comments` VALUES ('4', '1', '50', 'fadaaff', '2020-06-16 14:17:00', '2020-06-16 14:17:00');
INSERT INTO `comments` VALUES ('5', '1', '50', '左基式', '2020-06-17 09:27:00', '2020-06-17 09:27:00');
INSERT INTO `comments` VALUES ('6', '3', '50', 'dafa', '2020-06-17 09:27:49', '2020-06-17 09:27:49');

-- ----------------------------
-- Table structure for fans
-- ----------------------------
DROP TABLE IF EXISTS `fans`;
CREATE TABLE `fans` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fan_id` int(11) NOT NULL DEFAULT '0',
  `star_id` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of fans
-- ----------------------------
INSERT INTO `fans` VALUES ('4', '5', '1', '2020-06-18 13:19:20', '2020-06-18 13:19:23');
INSERT INTO `fans` VALUES ('6', '3', '1', '2020-06-18 13:21:42', '2020-06-18 13:21:45');
INSERT INTO `fans` VALUES ('12', '5', '2', '2020-06-18 13:19:20', '2020-06-18 13:19:23');
INSERT INTO `fans` VALUES ('13', '5', '3', '2020-06-18 13:19:20', '2020-06-18 13:19:23');
INSERT INTO `fans` VALUES ('16', '3', '2', '2020-06-18 13:21:42', '2020-06-18 13:21:45');
INSERT INTO `fans` VALUES ('25', '1', '5', '2020-06-18 13:21:42', '2020-06-18 13:21:45');
INSERT INTO `fans` VALUES ('28', '1', '3', '2020-06-19 08:48:37', '2020-06-19 08:48:37');
INSERT INTO `fans` VALUES ('29', '1', '2', '2020-06-19 11:05:44', '2020-06-19 11:05:44');

-- ----------------------------
-- Table structure for favors
-- ----------------------------
DROP TABLE IF EXISTS `favors`;
CREATE TABLE `favors` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `post_id` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of favors
-- ----------------------------
INSERT INTO `favors` VALUES ('4', '3', '50', '2020-06-17 12:17:32', '2020-06-17 12:17:32');
INSERT INTO `favors` VALUES ('5', '3', '51', '2020-06-17 12:17:52', '2020-06-17 12:17:52');
INSERT INTO `favors` VALUES ('6', '3', '49', '2020-06-17 12:19:41', '2020-06-17 12:19:41');
INSERT INTO `favors` VALUES ('7', '1', '52', '2020-06-17 15:00:52', '2020-06-17 15:00:52');
INSERT INTO `favors` VALUES ('8', '1', '53', '2020-06-18 14:22:53', '2020-06-18 14:22:53');

-- ----------------------------
-- Table structure for jobs
-- ----------------------------
DROP TABLE IF EXISTS `jobs`;
CREATE TABLE `jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) unsigned NOT NULL,
  `reserved_at` int(10) unsigned DEFAULT NULL,
  `available_at` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_reserved_at_index` (`queue`,`reserved_at`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of jobs
-- ----------------------------

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES ('13', '2014_10_12_000000_create_users_table', '1');
INSERT INTO `migrations` VALUES ('14', '2014_10_12_100000_create_password_resets_table', '1');
INSERT INTO `migrations` VALUES ('15', '2020_06_07_084639_create_posts_table', '1');
INSERT INTO `migrations` VALUES ('17', '2020_06_16_131151_create_comments_table', '2');
INSERT INTO `migrations` VALUES ('18', '2020_06_17_091215_create_favors_table', '3');
INSERT INTO `migrations` VALUES ('19', '2020_06_17_161432_create_fans_table', '4');
INSERT INTO `migrations` VALUES ('20', '2020_06_18_151305_create_topics_table', '5');
INSERT INTO `migrations` VALUES ('21', '2020_06_18_163604_create_post_topic', '5');
INSERT INTO `migrations` VALUES ('22', '2020_06_19_150245_create_admin_users_table', '6');
INSERT INTO `migrations` VALUES ('23', '2020_06_20_094731_alter_posts_table', '7');
INSERT INTO `migrations` VALUES ('24', '2020_06_21_210451_create_permission_roles_table', '8');
INSERT INTO `migrations` VALUES ('25', '2020_06_22_170038_create_notices_table', '9');
INSERT INTO `migrations` VALUES ('26', '2020_06_22_182034_create_jobs_table', '10');

-- ----------------------------
-- Table structure for notices
-- ----------------------------
DROP TABLE IF EXISTS `notices`;
CREATE TABLE `notices` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `content` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of notices
-- ----------------------------
INSERT INTO `notices` VALUES ('1', '知识', '你好测试', '2020-06-22 17:57:40', '2020-06-22 17:57:40');
INSERT INTO `notices` VALUES ('2', '你好我是中国人', '大家快乐哈', '2020-06-22 18:27:19', '2020-06-22 18:27:19');
INSERT INTO `notices` VALUES ('3', '知识', '就是力量', '2020-06-22 18:30:08', '2020-06-22 18:30:08');

-- ----------------------------
-- Table structure for password_resets
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of password_resets
-- ----------------------------

-- ----------------------------
-- Table structure for posts
-- ----------------------------
DROP TABLE IF EXISTS `posts`;
CREATE TABLE `posts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of posts
-- ----------------------------
INSERT INTO `posts` VALUES ('1', 'Sunt aut dolorem sed corporis dolor a ad.', 'Dolore maxime quo nostrum ab et totam. In praesentium temporibus hic distinctio vel quia aut. Reprehenderit modi voluptatibus perferendis et ut in suscipit. Qui et pariatur expedita adipisci. Eligendi numquam incidunt quis nihil id tenetur vel. Iure aut possimus est aut. Non minima dolorum cumque in quidem optio magni. Neque vero asperiores porro enim quo.', '2', '2020-06-07 21:13:51', '2020-06-07 21:13:51', '0');
INSERT INTO `posts` VALUES ('2', 'Et excepturi tempore et et voluptatem qui.', 'Eum reprehenderit voluptate repellat praesentium omnis fugit vel id. Itaque in exercitationem quo quidem quas aspernatur. Voluptates expedita ut ratione autem dolore rerum. Repellendus est molestias enim animi in odio. Temporibus quo ducimus eaque in accusantium. Qui odit aperiam quis repellat ut iste deleniti. Provident non assumenda dolor explicabo.', '2', '2020-06-07 21:13:51', '2020-06-07 21:13:51', '0');
INSERT INTO `posts` VALUES ('3', 'Delectus voluptatem aspernatur et voluptatibus voluptatem.', 'Dolor aut voluptas odio in dolor impedit. Fugiat est nesciunt id qui veniam quibusdam. Saepe incidunt ut officiis facilis. Quasi molestias doloremque voluptas sapiente perferendis corporis. Corrupti voluptatem dolore doloribus est in ad. Vel est iste tempora aspernatur nesciunt quidem voluptatem. Debitis commodi consequatur placeat quo. Est voluptatum et sint laboriosam dolorem molestias. Dolor omnis porro provident accusantium excepturi. Modi praesentium voluptatem molestiae dolor. Quisquam est veritatis et vel nihil consequatur.', '2', '2020-06-07 21:13:51', '2020-06-07 21:13:51', '0');
INSERT INTO `posts` VALUES ('4', 'Eum voluptatem qui facilis.', 'Aspernatur doloribus molestias debitis quia accusantium illo. Reiciendis aut autem at voluptatem voluptatem quasi distinctio. Ut ipsa consequatur illo fugiat dolor. Earum et quo aperiam et reiciendis. Iure velit harum ipsam repellat amet non corrupti. Magnam id assumenda eligendi et vel inventore soluta. Atque recusandae fugit neque veniam impedit esse quis atque. Quod ut sit culpa voluptatibus. Velit soluta et et rerum reiciendis. Ducimus quia asperiores vel cupiditate. Laudantium ad tenetur voluptatem eligendi. Officiis qui aut molestiae vel inventore.', '2', '2020-06-07 21:13:51', '2020-06-07 21:13:51', '0');
INSERT INTO `posts` VALUES ('5', 'Minus iusto enim tenetur optio aliquam.', 'Debitis distinctio sint rem cupiditate voluptate. Possimus ut enim odio. Quos nemo quam commodi voluptas sapiente. Recusandae nihil et non eum cupiditate. Ab eveniet maxime suscipit magni nisi iusto. Sit et molestiae blanditiis explicabo culpa. Nulla facilis eos ut consequatur quae repellat debitis. Ab quod possimus quas sit.', '2', '2020-06-07 21:13:51', '2020-06-07 21:13:51', '0');
INSERT INTO `posts` VALUES ('6', 'Dolores voluptates eos et sunt sequi.', 'Reiciendis aut quas esse sit et. Tempore molestiae voluptatibus quasi esse qui dolores dolorum. Iure consequatur earum magni dolorem consequatur ipsa qui corporis. Voluptas possimus error voluptatum quisquam. Maxime voluptatem explicabo mollitia ad vel explicabo corporis. Necessitatibus inventore illum culpa alias consectetur omnis ex. Laboriosam saepe labore amet dolore.', '2', '2020-06-07 21:13:51', '2020-06-07 21:13:51', '0');
INSERT INTO `posts` VALUES ('7', 'Animi quae est sint voluptate.', 'Illo nisi vel aperiam cupiditate est doloremque deserunt. Excepturi unde aut consequatur velit magni non consequatur. Sit blanditiis aut architecto perspiciatis. Nihil accusantium sapiente molestiae ratione totam itaque. Aut laudantium et non adipisci amet modi illum. Nisi molestiae voluptatem reiciendis quis dolor. Sint facilis vero provident eos. Aut et quia porro ducimus reiciendis quas saepe. Quam porro laboriosam iure praesentium non. Nostrum qui nam suscipit ut.', '2', '2020-06-07 21:13:51', '2020-06-07 21:13:51', '0');
INSERT INTO `posts` VALUES ('8', 'Et tempora iure nisi excepturi consequatur commodi corrupti minima.', 'Eligendi corrupti deserunt fuga nisi velit ab. Eos sint consequatur repellendus et aut amet possimus. Ab voluptatem rerum et voluptas. Cupiditate unde quibusdam quasi voluptate totam quo atque. Accusantium cum mollitia quisquam sed. Est quia animi quia. Ut voluptatem expedita molestiae dignissimos.', '2', '2020-06-07 21:13:51', '2020-06-07 21:13:51', '0');
INSERT INTO `posts` VALUES ('9', 'Sit quod totam et eius veniam consequatur aut maxime.', 'Veniam et fugit assumenda pariatur repudiandae. Dolores ut blanditiis corporis ut iste facere. Vel quibusdam non et aut. Laboriosam recusandae porro dolores cupiditate necessitatibus. Suscipit sit id illo. Qui ratione facilis autem sint eos eum et. Dolorem delectus nulla deserunt laborum. Neque dolores et soluta sunt atque. Magni labore placeat nisi sint. Aut molestiae nam reiciendis provident commodi id cum. Quisquam natus nobis ad id. Vel nostrum et sunt necessitatibus quaerat. Sit eos aut iste reprehenderit ad quas porro magnam. Alias et id quaerat magni.', '1', '2020-06-07 21:13:51', '2020-06-07 21:13:51', '0');
INSERT INTO `posts` VALUES ('10', 'Cupiditate qui dolorum occaecati qui facilis assumenda.', 'Aut qui porro omnis. Sed accusamus non explicabo et perferendis numquam dolorum. Dolorem magni et rem vel commodi ullam consequatur quae. In voluptas est quia molestiae. Ducimus similique nam culpa in eos voluptatem. Non modi nobis non impedit et facere dolores. Unde in eum a.', '1', '2020-06-07 21:13:51', '2020-06-07 21:13:51', '0');
INSERT INTO `posts` VALUES ('11', 'Numquam quam facere quo recusandae sit quo pariatur.', 'Amet placeat quae velit saepe. Ipsum est totam perspiciatis numquam dolor. Assumenda aperiam qui beatae. Ab minus commodi doloremque exercitationem amet consequuntur quo. Ut modi vitae dolorem ex voluptatum sit. Sint maiores deleniti optio. Voluptates saepe ea modi vero id ipsum. Quos et sed tempora quaerat qui occaecati voluptas. Voluptatem est et commodi qui sint omnis enim. Minus in quos molestiae non. Minus et quae molestias nulla laudantium labore voluptas. Enim ut inventore quidem omnis qui quae. Sint libero culpa soluta. Est accusantium nostrum sit maxime dolores fugiat praesentium dolore.', '1', '2020-06-07 21:13:51', '2020-06-07 21:13:51', '0');
INSERT INTO `posts` VALUES ('12', 'Quam nobis nam quo laudantium atque.', 'Et sequi id nostrum consequatur hic. Iusto eum dolorum velit. Quia vel velit ut vero. Ut laborum quia itaque dolores architecto cupiditate. Aut ea vel fuga quaerat eveniet voluptas. Delectus quibusdam rerum qui fugiat enim sed. Reprehenderit consectetur quis delectus consequatur. Voluptatem enim ratione tempora impedit.', '1', '2020-06-07 21:13:51', '2020-06-07 21:13:51', '0');
INSERT INTO `posts` VALUES ('13', 'Impedit adipisci quia fugit non.', 'Nihil quia suscipit ipsum id adipisci quidem temporibus. Voluptatem ipsa ducimus adipisci sint. Possimus consequatur earum et expedita nostrum ipsum. Sapiente laborum in quia provident molestiae in rerum sequi. Repellendus quasi minus omnis est est qui rem optio. Alias inventore eum accusamus est impedit accusamus quaerat. Possimus explicabo ea eligendi porro vitae.', '1', '2020-06-07 21:13:51', '2020-06-07 21:13:51', '0');
INSERT INTO `posts` VALUES ('14', 'Accusantium error dolor molestias id eius vitae aperiam.', 'Voluptates delectus modi commodi magni dicta. Enim repellat et occaecati ea ullam animi iusto. Sed quae et voluptatum quaerat ex laudantium consequatur. Ut consectetur eum cupiditate facilis. Fugiat molestiae sed et possimus quae perspiciatis qui. Itaque recusandae quidem doloribus perferendis. Eligendi non vero dicta enim. Tempore laudantium voluptatem sit repellendus eum. Eligendi quia quas explicabo dolorem et harum. Dolorem quibusdam excepturi commodi nostrum. Quisquam aperiam perferendis aliquam velit illum rerum sit necessitatibus. Et doloribus et aperiam sit. Quod voluptas consequuntur est natus dicta nostrum.', '1', '2020-06-07 21:13:51', '2020-06-07 21:13:51', '0');
INSERT INTO `posts` VALUES ('15', 'Ipsam non distinctio est sed ut velit.', 'Assumenda id est mollitia quas natus voluptatem. Pariatur voluptas quam nihil. Totam qui eum quidem. Mollitia veritatis ut rem temporibus ut commodi quibusdam. Et vitae est distinctio culpa iure occaecati ut. Ipsa necessitatibus in earum harum beatae libero. Et voluptas omnis sit nemo facere praesentium. Veritatis excepturi at dolore corporis enim officiis. Qui quo aut quisquam dicta labore dolores corrupti. Officia tenetur eum blanditiis quam sit in minima minus. Adipisci fuga dignissimos nam quia. Nihil numquam incidunt atque rerum est. Ab vero aut exercitationem eos rerum esse dolor. Beatae minima reprehenderit voluptas et voluptas doloribus voluptate.', '1', '2020-06-07 21:13:51', '2020-06-07 21:13:51', '0');
INSERT INTO `posts` VALUES ('16', 'Et aperiam dolorem illum qui consequatur reiciendis soluta.', 'Reprehenderit impedit sint soluta pariatur qui quo modi et. Quaerat deserunt omnis amet blanditiis voluptatem sed. Voluptatibus nihil iusto enim beatae natus voluptas et. Omnis quibusdam omnis mollitia quis. Alias voluptatem architecto repellat aut adipisci saepe velit. Quod et amet iure aut totam eos aut. Nostrum nemo consectetur et qui aspernatur fugit ratione. Et perferendis et ea rerum. Nemo quo harum veritatis nisi iste fuga eveniet ut.', '3', '2020-06-07 21:13:51', '2020-06-07 21:13:51', '0');
INSERT INTO `posts` VALUES ('17', 'Quis iusto molestias voluptatem quibusdam qui quos omnis.', 'Quibusdam earum eos dolores est reiciendis consequatur omnis. Est nostrum mollitia esse odio. Aspernatur sapiente ut aut recusandae minima. Dolorem voluptas laudantium voluptas aut alias et. Praesentium alias nam explicabo quidem quia pariatur voluptatem aut. Atque laboriosam quae incidunt explicabo porro voluptates autem. Aspernatur nostrum voluptatibus rerum molestias libero vitae. Eos magni earum praesentium rerum soluta laudantium ipsam. Qui quis aspernatur voluptas itaque id atque. Quo excepturi asperiores temporibus dicta. Id debitis consequatur quis amet. Facilis voluptas delectus voluptatem.', '3', '2020-06-07 21:13:51', '2020-06-07 21:13:51', '0');
INSERT INTO `posts` VALUES ('18', 'Est facere ratione qui unde.', 'Accusantium perspiciatis optio deleniti dicta debitis rerum rerum. Et molestias reprehenderit voluptatum est sed delectus. Voluptate ipsam id sint ipsa praesentium ab illum et. Sit temporibus tempora velit ducimus eum. Suscipit architecto id ullam fuga cum amet. Sequi esse repudiandae velit expedita asperiores quisquam beatae. Cupiditate rerum fugit quidem alias quia odio. Non esse consectetur perferendis esse. Ea omnis odit aperiam.', '3', '2020-06-07 21:13:51', '2020-06-07 21:13:51', '0');
INSERT INTO `posts` VALUES ('19', 'Commodi velit asperiores consequatur porro culpa accusamus vitae tempore.', 'Inventore et veniam quaerat iste ut quam eum. Voluptatem ut commodi vel dolorem. Est et repellendus non recusandae qui dolore quo. Accusamus eos ut dolor dicta explicabo ipsam autem. Sunt id error dicta dolore autem temporibus atque. Iste at ipsa a occaecati temporibus. Et laborum aut praesentium non numquam. Architecto sunt dolores in rerum omnis porro voluptatem. Accusamus natus adipisci voluptate.', '3', '2020-06-07 21:13:51', '2020-06-07 21:13:51', '0');
INSERT INTO `posts` VALUES ('20', 'Qui pariatur recusandae eum porro.', 'Iusto minus aut harum repellat similique odit. Sed nam cum quia in consequuntur perferendis consequatur. Dolorum libero eum saepe excepturi non necessitatibus eum et. Facere quo perferendis repellendus illo fugiat et nam consectetur. Omnis non id veritatis est in exercitationem. Voluptatem ex architecto beatae magnam et. Aut voluptatem tenetur quibusdam repudiandae dolores dolorem. Aperiam qui laboriosam ad dignissimos est culpa est recusandae. Iure et optio voluptas blanditiis corporis recusandae praesentium suscipit. Mollitia unde ut fuga repudiandae qui dolorem dolorem. Omnis aut quibusdam molestiae vero quia. Ut saepe ipsa quos iure voluptatum voluptatibus aut. Aut fugiat est in quidem odio fugit. Pariatur ut molestiae ex.', '3', '2020-06-07 21:13:51', '2020-06-07 21:13:51', '0');
INSERT INTO `posts` VALUES ('21', 'ss', '<p>aaad</p>', '3', '2020-06-07 21:49:51', '2020-06-07 21:49:51', '0');
INSERT INTO `posts` VALUES ('22', 'ss', '<p>aaad</p>', '3', '2020-06-07 21:51:23', '2020-06-07 21:51:23', '0');
INSERT INTO `posts` VALUES ('24', 'aa', '<p>dd</p>', '3', '2020-06-14 09:29:41', '2020-06-14 09:29:41', '0');
INSERT INTO `posts` VALUES ('25', 'aadddd', '<p>ddddddaaa</p>', '3', '2020-06-14 10:56:31', '2020-06-14 10:56:31', '0');
INSERT INTO `posts` VALUES ('26', 'Quasi est et ea.', 'Veritatis ipsum suscipit molestiae magni corporis. Voluptatem accusamus quisquam quam vero et. Soluta quaerat eos et consectetur eius illum. Est non et incidunt ut corrupti veritatis nihil. Doloribus placeat illo unde nesciunt et. Aliquam velit ipsum qui. Dolor est quasi dolorum debitis. Voluptatem ea qui consequatur officiis corporis sunt eaque. Molestiae labore quisquam quae qui. Voluptatem sit fuga velit quos nostrum. Dolor quaerat nostrum consequuntur et. Libero sit maiores quae voluptatum quia placeat nam repellat. Quisquam incidunt ut rerum accusantium est occaecati sed eum. Aut aspernatur veritatis perspiciatis culpa voluptatem quod aut.', '3', '2020-06-14 11:08:33', '2020-06-20 20:46:20', '1');
INSERT INTO `posts` VALUES ('27', 'Ab iste magni officiis reprehenderit sit est.', 'Ut numquam repellat nemo deleniti ut. Blanditiis itaque laudantium atque corrupti distinctio et. Id dolorem quia et qui rerum. Accusantium quaerat totam voluptates nemo reiciendis enim. Fugiat hic natus illo id temporibus corrupti aut. Sed soluta sit commodi aliquam molestiae. Enim voluptatibus illo vel nihil non. Vel natus quasi rerum laborum rerum non. Aperiam aspernatur sunt qui nihil dolorem pariatur adipisci. Id dignissimos pariatur vel sequi laudantium quidem vel. Eaque sunt unde nobis et neque illum illo. Laborum incidunt corrupti quia at facilis ut molestiae.', '3', '2020-06-14 11:08:33', '2020-06-20 20:46:21', '1');
INSERT INTO `posts` VALUES ('28', 'Quis eum modi est fuga culpa.', 'Explicabo dignissimos quia explicabo et suscipit possimus. Eos aperiam nesciunt qui quam deserunt accusantium sapiente. Assumenda corrupti eius temporibus voluptas voluptatibus. Nihil vel magni molestiae quo quae. Enim illo deleniti veniam eum doloribus et fuga. Rerum ut est possimus provident quas aut. Laborum laboriosam temporibus tempore animi molestiae laudantium dolores. Itaque doloribus aspernatur error ut. Officia iusto cupiditate et illum temporibus. Corrupti consequatur ut aspernatur animi. Molestiae doloremque aut porro quam. Voluptatibus consectetur aspernatur consequuntur vel. Saepe et dolor nihil pariatur ut autem qui. Aut cum odio ullam eos et.', '3', '2020-06-14 11:08:33', '2020-06-20 20:46:22', '1');
INSERT INTO `posts` VALUES ('29', 'Voluptatem incidunt delectus id totam autem id laboriosam.', 'Delectus sapiente dolores explicabo iusto qui accusantium sunt. Ratione ratione voluptas vero amet ad praesentium consequatur. Quae vitae minus dolorem dolores. Eligendi minima beatae non quod autem dolores. Excepturi aperiam ducimus quasi autem voluptatem et. Non illo neque eveniet numquam. Eligendi non vero perspiciatis ut soluta in consectetur. Aperiam qui et voluptatem. Voluptatibus molestias et quod itaque earum rerum. Nobis reprehenderit illo molestias et voluptatibus nisi veritatis enim.', '3', '2020-06-14 11:08:33', '2020-06-20 20:46:22', '1');
INSERT INTO `posts` VALUES ('30', 'At harum consequuntur harum animi est reiciendis consectetur sit.', 'Sed consectetur sapiente optio aut rerum. Et blanditiis cupiditate doloribus blanditiis et dicta sit facere. Non reprehenderit saepe nobis qui quis repellendus fugit sunt. Aut similique in omnis possimus ut. Deserunt expedita sequi sequi rerum impedit harum. Nostrum sint ea sit dicta fugiat adipisci. Quo ipsam iste ea placeat nam voluptatem amet. Et in ex rerum quo est consequatur. Voluptatem voluptatibus libero quisquam et expedita voluptatibus impedit. Vero ex illum qui doloribus non asperiores. Vitae delectus hic ab aperiam. Quos inventore excepturi voluptatem sed dolorum.', '3', '2020-06-14 11:08:33', '2020-06-20 20:46:49', '1');
INSERT INTO `posts` VALUES ('31', 'Placeat ab optio incidunt officiis.', 'Dolorum quis et expedita eius iusto eos voluptas. Dolores illum nulla omnis soluta veritatis aut officiis sit. Neque velit sed natus dolore maxime. Et aliquam est consequatur eum placeat. Voluptates et minima assumenda. Nihil libero quis aut dolor. Fugiat quos nostrum temporibus maiores iste expedita. Et quia illum dolor aliquam labore magni placeat excepturi. Nihil repellendus nostrum beatae ipsa quibusdam quia et sed. Vel ut vitae aperiam illo distinctio.', '1', '2020-06-14 11:08:33', '2020-06-20 20:46:51', '1');
INSERT INTO `posts` VALUES ('32', 'Expedita et incidunt voluptatem soluta est illo eveniet.', 'Amet ipsam natus sequi deleniti similique. Illum cupiditate praesentium facilis quibusdam incidunt. Corrupti non et voluptatem ut. Recusandae adipisci adipisci id ea. Perspiciatis libero quo ut cupiditate assumenda sit quaerat. Quia consequatur rerum exercitationem dicta. Odit est nobis voluptatum quis neque qui est. Dolorum adipisci eos sit. Ut sint doloribus voluptatem dolores est id nam. Amet numquam eos ratione dolorem ratione. Ut qui quasi nisi.', '1', '2020-06-14 11:08:33', '2020-06-20 20:46:51', '1');
INSERT INTO `posts` VALUES ('33', 'Quae quia cum et et voluptatem.', 'Quae quidem voluptatem nobis quam ut excepturi. Nemo ea aut iste iusto repellendus. Et est omnis sapiente ut provident sequi recusandae. Et molestiae assumenda occaecati et quia cumque. Ullam iste ut ut qui. Qui inventore optio et maxime voluptates ipsa. Eos provident voluptas possimus tempora non maiores nemo. Suscipit aut non sunt perspiciatis velit qui. Molestiae aliquid et rem explicabo est in.', '1', '2020-06-14 11:08:33', '2020-06-20 20:46:52', '-1');
INSERT INTO `posts` VALUES ('34', 'Numquam quam deserunt sed placeat hic.', 'Sequi sint consequuntur ducimus iste voluptatum. Aut quo qui consequatur pariatur. Aut ut consectetur optio dolores inventore excepturi in et. Commodi laudantium molestiae quis fuga quod velit sint. Aut quis minima tempore suscipit consectetur neque. Illum exercitationem aut qui aut saepe quisquam aspernatur. Quia ipsa perferendis aut veritatis deleniti consequatur adipisci. Exercitationem consequatur adipisci in illo aut qui. Quas consequuntur sed et consequatur atque ullam eos.', '5', '2020-06-14 11:08:33', '2020-06-20 20:46:53', '-1');
INSERT INTO `posts` VALUES ('35', 'Molestias eum commodi corporis eligendi et.', 'Est quo ab voluptatem dolorem est laboriosam. Atque quia fugiat minima. Esse consequatur quae tempore nihil sunt. Totam quibusdam iusto natus rerum est culpa. Rerum est voluptas vitae vel. Placeat aut quo quia tempora quaerat magni quo. Sint tenetur enim accusamus laudantium et ea rem. Et est sit ipsa autem. Excepturi blanditiis deserunt porro. Asperiores amet ea aut magni aut magnam. Vero fuga dolor qui voluptatem placeat quis. Tempore illum atque error quidem repellat enim.', '5', '2020-06-14 11:08:33', '2020-06-20 20:46:53', '-1');
INSERT INTO `posts` VALUES ('36', 'Et facere incidunt consequatur optio recusandae.', 'Asperiores autem occaecati in consequuntur. Quibusdam quisquam est voluptas sunt natus. Deleniti commodi voluptatem reiciendis eius tenetur quia. Excepturi at id ullam neque id sed tempore autem. Quia et deleniti voluptatem quis rerum quaerat iure. Corrupti doloremque rerum ab ut. Ut maiores magni voluptatem velit doloribus corporis qui. Facilis recusandae et numquam mollitia aliquid quia. Laudantium sapiente voluptatem vero molestias magnam possimus. Minima quod quis qui eum quae expedita quod. Iste sapiente nam saepe ullam illum facilis non.', '5', '2020-06-14 11:08:33', '2020-06-20 20:46:54', '-1');
INSERT INTO `posts` VALUES ('37', 'Sapiente ea ea voluptatem atque.', 'Soluta illo iusto labore veritatis rerum magni excepturi. Occaecati doloribus sequi beatae est quasi numquam autem. Necessitatibus qui dignissimos quisquam eveniet inventore. Voluptatem atque maiores sunt rerum sit similique error rem. Architecto delectus enim pariatur ut consequuntur dolore. Reprehenderit voluptatem dolorum saepe alias autem. Voluptatem aut nihil minima. Sapiente eos nostrum est itaque saepe quia sunt culpa.', '5', '2020-06-14 11:08:33', '2020-06-20 20:46:54', '-1');
INSERT INTO `posts` VALUES ('38', 'Sint enim velit voluptatibus dolorem.', 'Incidunt consequatur et eum recusandae voluptatem velit. Nesciunt qui nihil nesciunt. Culpa voluptatibus incidunt et. Eos et tempore est aut voluptates eveniet. Odit cum sed qui consequuntur eos non. Molestiae expedita non fugiat repudiandae et aut. Similique iusto vel quia dolore. Id molestiae qui vel quis error. Quia fuga perspiciatis aut ullam earum libero. Repellendus nam expedita et consequatur error est. Quod doloribus voluptate ut minima sit sed beatae. Non dolor eius optio pariatur possimus praesentium rerum.', '5', '2020-06-14 11:08:33', '2020-06-20 20:46:55', '-1');
INSERT INTO `posts` VALUES ('39', 'Molestiae occaecati maiores molestiae porro.', 'Exercitationem fugiat voluptatem aliquid sunt optio. Et laborum aut qui beatae qui aut. Quisquam ut incidunt non provident dolorem quisquam tempore magni. Omnis dolorem id eum aliquam. Et expedita aut quasi alias. Est cupiditate ipsum illum illo. Et incidunt architecto nemo eius pariatur. Asperiores optio et qui totam possimus.', '5', '2020-06-14 11:08:33', '2020-06-20 20:46:56', '-1');
INSERT INTO `posts` VALUES ('40', 'Facilis quis et reiciendis non fuga.', 'Nihil officiis deserunt nostrum earum quae iusto. Quo et quos consequatur voluptatum aliquam reiciendis non. Officiis labore consequatur dolore dolore at et rem aut. Nulla quis quisquam voluptate dignissimos. Quam similique et tempore inventore voluptatem praesentium vel. Id id laborum praesentium qui. Molestiae et velit ducimus. Laborum et odio molestiae beatae. Aliquid excepturi consequuntur voluptates. Eligendi placeat est nobis id quis. Ut qui non excepturi consectetur qui optio. Architecto ea voluptas sint consectetur blanditiis aut atque.', '1', '2020-06-14 11:08:33', '2020-06-14 11:08:33', '0');
INSERT INTO `posts` VALUES ('41', 'Assumenda officia incidunt vel dolorum quae eum temporibus.', 'Laboriosam ut et laudantium et omnis velit ut. Quod dolor tempore eaque corrupti. Sit beatae voluptas iusto amet pariatur. Officiis cum deserunt illum aperiam voluptas ut eligendi. Dolor eaque quo dolor exercitationem voluptatibus et. Consequatur sit voluptatem animi. Incidunt quia voluptate doloremque autem. Quam neque repellendus non veritatis et voluptatem vel. Qui dolore iusto ut officia dolor nesciunt eligendi. Ea est voluptatem ea et sit. At voluptate eveniet est recusandae. Sit distinctio facilis dolores aperiam. Cupiditate repellat asperiores laudantium autem et.', '1', '2020-06-14 11:08:33', '2020-06-14 11:08:33', '0');
INSERT INTO `posts` VALUES ('42', 'Praesentium ut nobis nihil dolore rem a error.', 'Est et quos nihil dolore rerum id qui non. Autem et quae aut laudantium quis est. Quo commodi quasi et fugiat sunt aut. Voluptatibus qui aut quo sit. Debitis est minus ex quibusdam. Magnam facilis assumenda non quia fugiat eius. Aliquid exercitationem eaque quo laborum fugit maiores.', '1', '2020-06-14 11:08:33', '2020-06-14 11:08:33', '0');
INSERT INTO `posts` VALUES ('43', 'Ad debitis cumque animi voluptatem possimus.', 'Ut enim consectetur facilis quia non quia ea sed. Quisquam temporibus dolor exercitationem quia et. Architecto tenetur voluptatem ut deleniti quas tempora. Et et et assumenda et corrupti consequuntur rerum. Est et optio totam odit consequatur dolore. In iure dolorem minima facere ut dolores. Harum saepe sed molestiae nesciunt illum. Sunt praesentium aut error assumenda veritatis officia.', '1', '2020-06-14 11:08:33', '2020-06-14 11:08:33', '0');
INSERT INTO `posts` VALUES ('44', 'Iure rem corrupti qui dolores modi.', 'Neque assumenda eos nemo ab ipsum ullam. Quae omnis quam nihil inventore odio qui nisi. Perferendis facere voluptatum totam. Atque veritatis ab et temporibus eos laudantium. Fuga nisi fugiat ad eos possimus. Sunt est magni est excepturi. Aut non dignissimos est. Iusto et repellendus dolor dolor natus consequatur quos. Neque doloremque beatae natus facilis voluptas vel. Similique itaque repellat et quaerat non dolores dolor. Quos quod facilis ut. Eveniet quia non autem eos ut et doloremque.', '1', '2020-06-14 11:08:33', '2020-06-14 11:08:33', '0');
INSERT INTO `posts` VALUES ('45', 'Veniam voluptates nesciunt aut qui enim fugiat.', 'Vero quas voluptas ipsa. Ut fugit quisquam eligendi magni enim debitis. Dolore magni alias placeat facere. Qui earum sed porro ratione. Esse sint ullam qui reiciendis non. Iste temporibus aut rem iure unde quasi officiis. Magnam placeat saepe in rerum. Velit voluptatem quam adipisci fuga autem quis atque. Nihil maxime voluptas deserunt aut. Est reiciendis et et sit nisi. Aliquam optio modi asperiores consequatur pariatur perferendis. Iusto nisi maxime non fugiat laudantium et qui.', '1', '2020-06-14 11:08:33', '2020-06-14 11:08:33', '0');
INSERT INTO `posts` VALUES ('47', 'aaaaa', '<p><img src=\"http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/c9/geili_thumb.gif\"><br></p><p><img src=\"http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/6e/panda_thumb.gif\">aaaa<br></p><p><br></p>', '1', '2020-06-14 15:29:31', '2020-06-20 20:46:19', '-1');
INSERT INTO `posts` VALUES ('48', 'dadddd', '<p><img src=\"http://laravel54.test/storage/5bf17376d5c0adc90b706418bc4c8e42/2whWzDg0N3biOGyxvGE049SDuGaJAcdPHfhijScW.jpeg\" alt=\"20丨 文件的常用操作\" style=\"max-width:100%;\"><br></p><p>daadada</p>', '1', '2020-06-14 16:08:46', '2020-06-20 20:46:19', '-1');
INSERT INTO `posts` VALUES ('49', 'eeeeeeeeeeee', '<p><img src=\"http://laravel54.test/storage/4ba56f153b74f20c30b8c063657c53b9/gwdJkkaA3z9WWov33g9NaGexNvWTBYjFCujyCubV.jpeg\" alt=\"哥斯拉2：怪兽之王-2019_BD中英双字\" style=\"max-width:100%;\" data-bd-imgshare-binded=\"1\"><br></p><p><font size=\"7\">d<span style=\"background-color: rgb(255, 0, 0);\"><font color=\"#808000\">dddddddddd</font></span></font></p><table><tbody><tr><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr><tr><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr><tr><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr><tr><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr><tr><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td><ol><li>&nbsp;</li></ol></td></tr></tbody></table><p><br></p>', '1', '2020-06-14 16:20:06', '2020-06-20 20:46:18', '-1');
INSERT INTO `posts` VALUES ('50', 'dadddd', '<p>dadaa</p>', '2', '2020-06-15 13:33:18', '2020-06-20 20:46:17', '-1');
INSERT INTO `posts` VALUES ('51', 'dafdafd', '<p>adafadf</p>', '3', '2020-06-17 09:28:05', '2020-06-20 20:46:15', '-1');
INSERT INTO `posts` VALUES ('52', '你好我是中国人', '<p>是JVM在检测到两个类型间转换不兼容时引发的运行时异常。此类错误通常会终止用户请求。在执行任何子系统的应用程序代码时都有可能发生ClassCastException异常。通过转换，可以指示Java编译器将给定类型的变量作为另一种变量来处理。对基础类型和用户定义类型都可以转换。Java语言规范定义了允许的转换，其中大多数可在编译时进行验证。不过，某些转换还需要运行时验证。如果在此运行时验证过程中检测到不兼容，JVM就会引发ClassCastException异常。</p><p>出现这个异常的原因如下：</p><p>1.一个类是数字类，而由于误操作，错误的将数字类向数字类转换改写成了数字类向字符串类的转换，从而产生了异常。</p><p>2.大部分原因是因为强制转换或者是SQL映射时发生了这个异常。\r\n</p><p>————————————————\r\n</p><p>版权声明：本文为CSDN博主「-停泊」的原创文章，遵循CC&nbsp;4.0&nbsp;BY-SA版权协议，转载请附上原文出处链接及本声明。\r\n</p><p>原文链接：https://blog.csdn.net/zgz15515397650/java/article/details/81068723</p><p><br></p>', '1', '2020-06-17 15:00:41', '2020-06-20 20:46:08', '1');
INSERT INTO `posts` VALUES ('53', '知识产权-专家问答-20200102-1', '<p>是JVM在检测到两个类型间转换不兼容时引发的运行时异常。此类错误通常会终止用户请求。在执行任何子系统的应用程序代码时都有可能发生ClassCastException异常。通过转换，可以指示Java编译器将给定类型的变量作为另一种变量来处理。对基础类型和用户定义类型都可以转换。Java语言规范定义了允许的转换，其中大多数可在编译时进行验证。不过，某些转换还需要运行时验证。如果在此运行时验证过程中检测到不兼容，JVM就会引发ClassCastException异常。</p><p>出现这个异常的原因如下：</p><p>1.一个类是数字类，而由于误操作，错误的将数字类向数字类转换改写成了数字类向字符串类的转换，从而产生了异常。</p><p>2.大部分原因是因为强制转换或者是SQL映射时发生了这个异常。\r\n</p><p>————————————————\r\n</p><p>版权声明：本文为CSDN博主「-停泊」的原创文章，遵循CC&nbsp;4.0&nbsp;BY-SA版权协议，转载请附上原文出处链接及本声明。\r\n</p><p>原文链接：https://blog.csdn.net/zgz15515397650/java/article/details/81068723</p><p><br></p>', '1', '2020-06-17 15:05:53', '2020-06-17 15:05:53', '1');

-- ----------------------------
-- Table structure for post_topics
-- ----------------------------
DROP TABLE IF EXISTS `post_topics`;
CREATE TABLE `post_topics` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` int(11) NOT NULL DEFAULT '0',
  `topic_id` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of post_topics
-- ----------------------------
INSERT INTO `post_topics` VALUES ('1', '1', '1', '2020-06-19 10:22:51', '2020-06-19 10:22:54');
INSERT INTO `post_topics` VALUES ('2', '2', '1', '2020-06-19 10:22:51', '2020-06-19 10:22:54');
INSERT INTO `post_topics` VALUES ('3', '3', '2', '2020-06-19 10:22:51', '2020-06-19 10:22:54');
INSERT INTO `post_topics` VALUES ('4', '1', '2', '2020-06-19 10:22:51', '2020-06-19 10:22:54');
INSERT INTO `post_topics` VALUES ('5', '5', '1', '2020-06-19 10:22:51', '2020-06-19 10:22:54');
INSERT INTO `post_topics` VALUES ('6', '12', '3', '2020-06-19 10:22:51', '2020-06-19 10:22:54');
INSERT INTO `post_topics` VALUES ('7', '22', '1', '2020-06-19 10:22:51', '2020-06-19 10:22:54');
INSERT INTO `post_topics` VALUES ('8', '11', '1', '2020-06-19 10:22:51', '2020-06-19 10:22:54');
INSERT INTO `post_topics` VALUES ('9', '13', '1', '2020-06-19 10:22:51', '2020-06-19 10:22:54');
INSERT INTO `post_topics` VALUES ('10', '14', '1', '2020-06-19 10:22:51', '2020-06-19 10:22:54');
INSERT INTO `post_topics` VALUES ('11', '15', '1', '2020-06-19 10:22:51', '2020-06-19 10:22:54');
INSERT INTO `post_topics` VALUES ('12', '42', '1', '2020-06-19 10:22:51', '2020-06-19 10:22:54');
INSERT INTO `post_topics` VALUES ('13', '44', '1', '2020-06-19 11:11:55', '2020-06-19 11:11:55');
INSERT INTO `post_topics` VALUES ('14', '48', '1', '2020-06-19 11:11:55', '2020-06-19 11:11:55');
INSERT INTO `post_topics` VALUES ('15', '52', '1', '2020-06-19 11:11:55', '2020-06-19 11:11:55');
INSERT INTO `post_topics` VALUES ('16', '24', '2', '2020-06-19 12:08:19', '2020-06-19 12:08:19');
INSERT INTO `post_topics` VALUES ('17', '25', '2', '2020-06-19 12:08:19', '2020-06-19 12:08:19');
INSERT INTO `post_topics` VALUES ('18', '26', '2', '2020-06-19 12:08:19', '2020-06-19 12:08:19');
INSERT INTO `post_topics` VALUES ('19', '20', '2', '2020-06-19 12:08:26', '2020-06-19 12:08:26');
INSERT INTO `post_topics` VALUES ('20', '22', '2', '2020-06-19 12:08:26', '2020-06-19 12:08:26');

-- ----------------------------
-- Table structure for topics
-- ----------------------------
DROP TABLE IF EXISTS `topics`;
CREATE TABLE `topics` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '专题',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of topics
-- ----------------------------
INSERT INTO `topics` VALUES ('1', 'PHP', '2020-06-18 18:13:21', '2020-06-18 18:13:24');
INSERT INTO `topics` VALUES ('2', 'JAVA', '2020-06-19 10:03:44', '2020-06-19 10:03:47');
INSERT INTO `topics` VALUES ('11', 'PYTHON', '2020-06-20 21:37:02', '2020-06-20 21:37:02');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'vincent', '1254828234@qq.com', '$2y$10$2Fu2AtieJlv2/i9ObicvEu5qTlMjiWg.gVd/mC0JEJ1sY4/v3QcJG', 'fYKGUJCmw97wNLfLTlY1aalmh87PgdCvUuT8kOZWINKXzBsLMss4ahBpZvwG', '2020-06-15 12:57:52', '2020-06-15 12:57:52');
INSERT INTO `users` VALUES ('2', 'test', 'huiliang.zhang@lexisnexis.com', '$2y$10$VBIVCC3HpU5lyHJM6YJIRex9jBuz54VtX/ZO.BAYIGuV5ORdkwzES', '6OCybw7LZUeUt37JgnSt9MrWjMATAWxZTIoebwCzSCd516DNdEoRgYYmwJc5', '2020-06-15 13:00:27', '2020-06-15 13:00:27');
INSERT INTO `users` VALUES ('3', 'abc', 'abc@123.com', '$2y$10$w0ZcVnL2ECQgCPE2YESrO.vmiF6RJjv7QmZnZAmufeA.Cw./1dsie', 'RiE6iH1DIukl28b4oWQJLY5jYtwkpL6IohpRATdRvKrs2XE0s9RXl2FFnfOo', '2020-06-17 09:27:27', '2020-06-17 09:27:27');
INSERT INTO `users` VALUES ('5', 'xyz', 'xyz@123.com', '$2y$10$w0ZcVnL2ECQgCPE2YESrO.vmiF6RJjv7QmZnZAmufeA.Cw./1dsie', 'RiE6iH1DIukl28b4oWQJLY5jYtwkpL6IohpRATdRvKrs2XE0s9RXl2FFnfOo', '2020-06-17 09:27:27', '2020-06-17 09:27:27');

-- ----------------------------
-- Table structure for user_notice
-- ----------------------------
DROP TABLE IF EXISTS `user_notice`;
CREATE TABLE `user_notice` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `notice_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of user_notice
-- ----------------------------
INSERT INTO `user_notice` VALUES ('1', '1', '2');
INSERT INTO `user_notice` VALUES ('2', '2', '2');
INSERT INTO `user_notice` VALUES ('3', '3', '2');
INSERT INTO `user_notice` VALUES ('4', '5', '2');
INSERT INTO `user_notice` VALUES ('5', '1', '3');
INSERT INTO `user_notice` VALUES ('6', '2', '3');
INSERT INTO `user_notice` VALUES ('7', '3', '3');
INSERT INTO `user_notice` VALUES ('8', '5', '3');
