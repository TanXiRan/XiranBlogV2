-- MySQL dump 10.13  Distrib 8.0.28, for macos11.6 (arm64)
--
-- Host: localhost    Database: blog_v2
-- ------------------------------------------------------
-- Server version	8.0.28

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add user info',6,'add_userinfo'),(22,'Can change user info',6,'change_userinfo'),(23,'Can delete user info',6,'delete_userinfo'),(24,'Can view user info',6,'view_userinfo'),(25,'Can add article',7,'add_article'),(26,'Can change article',7,'change_article'),(27,'Can delete article',7,'delete_article'),(28,'Can view article',7,'view_article'),(29,'Can add avatar',8,'add_avatar'),(30,'Can change avatar',8,'change_avatar'),(31,'Can delete avatar',8,'delete_avatar'),(32,'Can view avatar',8,'view_avatar'),(33,'Can add banner',9,'add_banner'),(34,'Can change banner',9,'change_banner'),(35,'Can delete banner',9,'delete_banner'),(36,'Can view banner',9,'view_banner'),(37,'Can add feedback',10,'add_feedback'),(38,'Can change feedback',10,'change_feedback'),(39,'Can delete feedback',10,'delete_feedback'),(40,'Can view feedback',10,'view_feedback'),(41,'Can add notice',11,'add_notice'),(42,'Can change notice',11,'change_notice'),(43,'Can delete notice',11,'delete_notice'),(44,'Can view notice',11,'view_notice'),(45,'Can add owner',12,'add_owner'),(46,'Can change owner',12,'change_owner'),(47,'Can delete owner',12,'delete_owner'),(48,'Can view owner',12,'view_owner'),(49,'Can add sentence',13,'add_sentence'),(50,'Can change sentence',13,'change_sentence'),(51,'Can delete sentence',13,'delete_sentence'),(52,'Can view sentence',13,'view_sentence'),(53,'Can add tag',14,'add_tag'),(54,'Can change tag',14,'change_tag'),(55,'Can delete tag',14,'delete_tag'),(56,'Can view tag',14,'view_tag'),(57,'Can add site',15,'add_site'),(58,'Can change site',15,'change_site'),(59,'Can delete site',15,'delete_site'),(60,'Can view site',15,'view_site'),(61,'Can add comment',16,'add_comment'),(62,'Can change comment',16,'change_comment'),(63,'Can delete comment',16,'delete_comment'),(64,'Can view comment',16,'view_comment');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_article`
--

DROP TABLE IF EXISTS `blog_article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blog_article` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(32) NOT NULL,
  `content` longtext,
  `release_date` datetime(6) DEFAULT NULL,
  `alter_date` datetime(6) DEFAULT NULL,
  `like_num` int NOT NULL,
  `comm_num` int NOT NULL,
  `share_num` int NOT NULL,
  `scan_num` int NOT NULL,
  `category` int NOT NULL,
  `recommend` tinyint(1) NOT NULL,
  `cover` varchar(100) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_article`
--

LOCK TABLES `blog_article` WRITE;
/*!40000 ALTER TABLE `blog_article` DISABLE KEYS */;
INSERT INTO `blog_article` VALUES (37,'测试文章1','这是测试文章','2022-07-01 05:16:22.692493','2022-07-01 05:16:22.712414',0,0,0,0,2,1,'Article_cover/IMG_1402.jpg',1),(38,'测试文章2','都是对的大','2022-07-01 05:23:02.368672','2022-07-01 05:23:02.381752',0,0,0,0,1,1,'Article_cover/森图壁纸-12.jpg',1),(39,'插入排序','# 这时测试文章3\r\n插入排序（Insertion-Sort）的算法描述是一种简单直观的排序算法。它的工作原理是通过构建有序序列，对于未排序数据，在已排序序列中从后向前扫描，找到相应位置并插入。\r\n\r\n以从小到大排序为例，元素0为第一个元素，插入排序是从元素1开始，尽可能插到前面。插入时分插入位置和试探位置，元素i的初始插入位置为i，试探位置为i-1，在插入元素i时，依次与i-1,i-2······元素比较，如果被试探位置的元素比插入元素大，那么被试探元素后移一位，元素i插入位置前移1位，直到被试探元素小于插入元素或者插入元素位于第一位。\r\n\r\n类似于：[2,3,4,1] ，当插入元素1时候，需要与前面（已排序）的元素进行比较。\r\n\r\n## 3.1 算法描述\r\n\r\n一般来说，插入排序都采用in-place在数组上实现。具体算法描述如下：\r\n\r\n1. 从第一个元素开始，该元素可以认为已经被排序；\r\n2. 取出下一个元素，在已经排序的元素序列中从后向前扫描；\r\n3. 如果该元素（已排序）大于新元素，将该元素移到下一位置；\r\n4. 重复步骤3，直到找到已排序的元素小于或者等于新元素的位置；\r\n5. 将新元素插入到该位置后；\r\n6. 重复步骤2~5。\r\n## 3.2 动图演示\r\n![](https://pic3.zhimg.com/v2-91b76e8e4dab9b0cad9a017d7dd431e2_b.webp)','2022-07-01 06:22:58.280572','2022-07-01 06:22:58.297792',0,0,0,0,1,1,'Article_cover/森图壁纸-04.jpg',1),(40,'快速排序','# 大标题\r\n呵呵哈哈哈\r\n## 1.2算法简介\r\n冒泡排序是一种简单的排序算法。它重复地走访过要排序的数列，一次比较两个元素，如果它们的顺序错误就把它们交换过来。走访数列的工作是重复地进行直到没有再需要交换，也就是说该数列已经排序完成。就像最小的泡泡冒到顶端。\r\n## 1.1 算法描述\r\n比较相邻的元素。如果第一个比第二个大，就交换它们两个；\r\n对每一对相邻元素作同样的工作，从开始第一对到结尾的最后一对，这样在最后的元素应该会是最大的数；\r\n针对所有的元素重复以上的步骤，除了最后一个；\r\n重复步骤1~3，直到排序完成。\r\n## 1.2 动图演示\r\n![](https://pic4.zhimg.com/v2-33a947c71ad62b254cab62e5364d2813_b.jpg)\r\n### 1.21测试H3','2022-07-01 06:33:24.195439','2022-07-01 06:33:24.207702',0,0,0,0,1,1,'Article_cover/森图壁纸-01.jpg',1),(41,'测试代码块','# 测试代码块\r\n```python\r\ndef add_article(request):\r\n    if not request.user.is_superuser:\r\n        return HttpResponseRedirect(\'/blog/\')\r\n    tags = Tag.objects.all()\r\n    categories = (\r\n        (1, \'学习分享\'),\r\n        (2, \'生活日常\'),\r\n        (3, \'好物推荐\'),\r\n    )\r\n    return render(request, \'add_article.html\', locals())\r\n```\r\n## 1测试\r\n好几十个几点睡的改哈撒的谎\r\ncjksbck\r\n圣诞节是肯定会开始\r\n### ## 1.2这是测试这是测试','2022-07-02 02:25:55.202651','2022-07-02 02:25:55.225321',57,6,0,0,1,1,'Article_cover/森图壁纸-08.jpg',1),(44,'测试代码块这个标题特别的长长长长','# 测试代码块这个标题特别的长\r\n```python\r\ndef add_article(request):\r\n    if not request.user.is_superuser:\r\n        return HttpResponseRedirect(\'/blog/\')\r\n    tags = Tag.objects.all()\r\n    categories = (\r\n        (1, \'学习分享\'),\r\n        (2, \'生活日常\'),\r\n        (3, \'好物推荐\'),\r\n    )\r\n    return render(request, \'add_article.html\', locals())\r\n```\r\n## 1测试\r\n好几十个几点睡的改哈撒的谎\r\ncjksbck\r\n圣诞节是肯定会开始\r\n### ## 1.2这是测试这是测试\r\n\r\n![](https://i0.hdslb.com/bfs/new_dyn/f4fe9ea5ff6921e093034dbf4e7a70da30502823.jpg@2072w.webp)','2022-08-09 07:36:11.686597','2022-08-09 07:36:11.718267',3,1,0,0,1,1,'Article_cover/森图壁纸-08_Bkq8hJ7.jpg',1),(49,'关于博客','# 关于网站\r\n# 网站所有人：谭洪\r\n## 备案号：暂无\r\n## 特别感谢；枫枫知道\r\n## 建建站日期：2022-8-11\r\n巴拉巴拉','2022-08-11 08:44:19.234307','2022-08-11 13:37:47.295939',0,0,0,0,1,1,'Article_cover/森图壁纸-02.jpg',1);
/*!40000 ALTER TABLE `blog_article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_article_tags`
--

DROP TABLE IF EXISTS `blog_article_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blog_article_tags` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `article_id` int NOT NULL,
  `tag_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `blog_article_tags_article_id_tag_id_b78a22e9_uniq` (`article_id`,`tag_id`),
  KEY `blog_article_tags_tag_id_88eb3ed9_fk_blog_tag_id` (`tag_id`),
  CONSTRAINT `blog_article_tags_article_id_82c02dd6_fk_blog_article_id` FOREIGN KEY (`article_id`) REFERENCES `blog_article` (`id`),
  CONSTRAINT `blog_article_tags_tag_id_88eb3ed9_fk_blog_tag_id` FOREIGN KEY (`tag_id`) REFERENCES `blog_tag` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_article_tags`
--

LOCK TABLES `blog_article_tags` WRITE;
/*!40000 ALTER TABLE `blog_article_tags` DISABLE KEYS */;
INSERT INTO `blog_article_tags` VALUES (22,37,2),(23,37,4),(24,38,3),(25,39,1),(26,40,1),(27,41,1),(31,44,1),(50,49,1);
/*!40000 ALTER TABLE `blog_article_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_avatar`
--

DROP TABLE IF EXISTS `blog_avatar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blog_avatar` (
  `id` int NOT NULL AUTO_INCREMENT,
  `path` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_avatar`
--

LOCK TABLES `blog_avatar` WRITE;
/*!40000 ALTER TABLE `blog_avatar` DISABLE KEYS */;
INSERT INTO `blog_avatar` VALUES (1,'user_avatar/005Qg1G9ly1h0ghpjzy2sj30u00u07gu.jpg'),(2,'user_avatar/005Qg1G9ly1h0ghpm4qhej30oc0ocwnd.jpg');
/*!40000 ALTER TABLE `blog_avatar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_banner`
--

DROP TABLE IF EXISTS `blog_banner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blog_banner` (
  `id` int NOT NULL AUTO_INCREMENT,
  `path` varchar(100) NOT NULL,
  `category` varchar(32) NOT NULL,
  `rotation` tinyint(1) NOT NULL,
  `interval` int NOT NULL,
  `sentence` varchar(128) NOT NULL,
  `st_source` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_banner`
--

LOCK TABLES `blog_banner` WRITE;
/*!40000 ALTER TABLE `blog_banner` DISABLE KEYS */;
INSERT INTO `blog_banner` VALUES (1,'banner/wallhaven-nm2ogy.jpeg','index',1,5,'邪王真眼是最强的！','中二病也要谈恋爱'),(2,'banner/森图壁纸-04.jpg','index',1,5,'好喜欢','不知道'),(3,'banner/截屏2022-07-19_22.30.09.png','learning',1,5,'青鸟的出现吸引了利兹，利兹从动物们的环绕中看向青鸟，青鸟飞到利兹的手中，然而仅停留了片刻便飞向蓝天。','利兹与青鸟'),(4,'banner/截屏2022-07-28_15.55.15.png','life',1,5,'seize the day','摇曳露营'),(5,'banner/截屏2022-03-18_下午9.59.05.png','recommendation',1,5,'想当纸灯笼','花开伊吕波');
/*!40000 ALTER TABLE `blog_banner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_comment`
--

DROP TABLE IF EXISTS `blog_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blog_comment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `like_num` int NOT NULL,
  `content` longtext NOT NULL,
  `drawing` varchar(100) DEFAULT NULL,
  `emoji` varchar(32) DEFAULT NULL,
  `create_time` datetime(6) NOT NULL,
  `article_id` int NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `blog_comment_article_id_3d58bca6_fk_blog_article_id` (`article_id`),
  KEY `blog_comment_user_id_59a54155_fk_blog_userinfo_id` (`user_id`),
  CONSTRAINT `blog_comment_article_id_3d58bca6_fk_blog_article_id` FOREIGN KEY (`article_id`) REFERENCES `blog_article` (`id`),
  CONSTRAINT `blog_comment_user_id_59a54155_fk_blog_userinfo_id` FOREIGN KEY (`user_id`) REFERENCES `blog_userinfo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_comment`
--

LOCK TABLES `blog_comment` WRITE;
/*!40000 ALTER TABLE `blog_comment` DISABLE KEYS */;
INSERT INTO `blog_comment` VALUES (15,2,'dffdsf','',NULL,'2022-07-02 08:48:38.033886',41,1),(16,0,'rgret','',NULL,'2022-07-03 02:32:48.133343',41,1),(17,0,'shdjs,gdksA','',NULL,'2022-08-01 15:09:46.584364',41,1),(18,0,'DSDDA','',NULL,'2022-08-01 15:10:00.493564',41,1),(19,0,'呵呵哈哈哈','',NULL,'2022-08-09 10:10:34.080110',41,4),(20,5,'写的真不错啊','',NULL,'2022-08-09 14:44:15.197200',44,1);
/*!40000 ALTER TABLE `blog_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_feedback`
--

DROP TABLE IF EXISTS `blog_feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blog_feedback` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(254) NOT NULL,
  `content` longtext NOT NULL,
  `status` tinyint(1) NOT NULL,
  `response_content` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_feedback`
--

LOCK TABLES `blog_feedback` WRITE;
/*!40000 ALTER TABLE `blog_feedback` DISABLE KEYS */;
INSERT INTO `blog_feedback` VALUES (15,'tanhong@stu.cdu.edu.cn','测试',1,'xcdvdfdsf'),(16,'tanhong@stu.cdu.edu.cn','vvvv',1,'aferewrer'),(17,'tanhong@stu.cdu.edu.cn','bbbbbbb',0,NULL),(18,'tanhong@stu.cdu.edu.cn','vvvv',0,NULL),(19,'tanhong@stu.cdu.edu.cn','aaaaa',0,NULL),(20,'tanhong@stu.cdu.edu.cn','rrrrr',0,NULL);
/*!40000 ALTER TABLE `blog_feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_notice`
--

DROP TABLE IF EXISTS `blog_notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blog_notice` (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` varchar(255) NOT NULL,
  `release_date` datetime(6) NOT NULL,
  `level` int NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_notice`
--

LOCK TABLES `blog_notice` WRITE;
/*!40000 ALTER TABLE `blog_notice` DISABLE KEYS */;
/*!40000 ALTER TABLE `blog_notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_owner`
--

DROP TABLE IF EXISTS `blog_owner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blog_owner` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `avatar` varchar(100) NOT NULL,
  `abstract` varchar(128) NOT NULL,
  `region` varchar(32) NOT NULL,
  `school` varchar(32) NOT NULL,
  `mail` varchar(254) NOT NULL,
  `tel` varchar(11) NOT NULL,
  `qq_svg` varchar(100) NOT NULL,
  `bili_svg` varchar(100) NOT NULL,
  `weixin_svg` varchar(100) NOT NULL,
  `bili_href` varchar(200) NOT NULL,
  `qq_qr` varchar(100) NOT NULL,
  `weixin_qr` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_owner`
--

LOCK TABLES `blog_owner` WRITE;
/*!40000 ALTER TABLE `blog_owner` DISABLE KEYS */;
/*!40000 ALTER TABLE `blog_owner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_site`
--

DROP TABLE IF EXISTS `blog_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blog_site` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `abstract` varchar(128) NOT NULL,
  `key_words` varchar(128) NOT NULL,
  `filing` varchar(32) NOT NULL,
  `create_date` datetime(6) NOT NULL,
  `version` varchar(16) NOT NULL,
  `icon` varchar(100) NOT NULL,
  `owner_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `blog_site_owner_id_4762f247_fk_blog_owner_id` (`owner_id`),
  CONSTRAINT `blog_site_owner_id_4762f247_fk_blog_owner_id` FOREIGN KEY (`owner_id`) REFERENCES `blog_owner` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_site`
--

LOCK TABLES `blog_site` WRITE;
/*!40000 ALTER TABLE `blog_site` DISABLE KEYS */;
/*!40000 ALTER TABLE `blog_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_tag`
--

DROP TABLE IF EXISTS `blog_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blog_tag` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `category` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_tag`
--

LOCK TABLES `blog_tag` WRITE;
/*!40000 ALTER TABLE `blog_tag` DISABLE KEYS */;
INSERT INTO `blog_tag` VALUES (1,'python',1),(2,'java',1),(3,'go',1),(4,'料理',2),(5,'美食',2),(6,'运动',2),(7,'c++',1),(8,'MacBook Air',1);
/*!40000 ALTER TABLE `blog_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_userinfo`
--

DROP TABLE IF EXISTS `blog_userinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blog_userinfo` (
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  `tel` varchar(11) DEFAULT NULL,
  `account_status` int NOT NULL,
  `like_num` int NOT NULL,
  `comm_num` int NOT NULL,
  `share_num` int NOT NULL,
  `scan_num` int NOT NULL,
  `avatar_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  KEY `blog_userinfo_avatar_id_483d5d0d_fk_blog_avatar_id` (`avatar_id`),
  CONSTRAINT `blog_userinfo_avatar_id_483d5d0d_fk_blog_avatar_id` FOREIGN KEY (`avatar_id`) REFERENCES `blog_avatar` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_userinfo`
--

LOCK TABLES `blog_userinfo` WRITE;
/*!40000 ALTER TABLE `blog_userinfo` DISABLE KEYS */;
INSERT INTO `blog_userinfo` VALUES ('pbkdf2_sha256$320000$IjJBn00r2hTPc3rHiwE7wC$8S/og6pqT4atKSDmrtARkJYcSnMA0/PfRkgh83GXVys=','2022-08-11 13:35:50.244015',1,'谭西然','','','2499067452@qq.com',1,1,'2022-06-21 06:19:00.000000',1,NULL,1,0,0,0,0,2),('pbkdf2_sha256$320000$L7B4f5TsKtfakfNcXpmyQV$nA8mReGGlYsAcLamgOH/IKHtRYAoFrkps4AgrOizj5c=','2022-06-27 06:35:00.000000',0,'小可爱','','','DreamerTan@outlook.com',0,1,'2022-06-23 23:56:00.000000',3,NULL,1,0,0,0,0,2),('pbkdf2_sha256$320000$0ptikbk3OzB9nUi6fsYAiy$R7CjS2CwRjGaxz/Q4h89JYT1v1X/ug7ZsDsFPdw7W+Y=','2022-08-09 10:10:00.000000',0,'小笨蛋','','','',0,1,'2022-06-23 23:59:00.000000',4,NULL,1,0,0,0,0,1);
/*!40000 ALTER TABLE `blog_userinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_userinfo_groups`
--

DROP TABLE IF EXISTS `blog_userinfo_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blog_userinfo_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `userinfo_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `blog_userinfo_groups_userinfo_id_group_id_5f60ecec_uniq` (`userinfo_id`,`group_id`),
  KEY `blog_userinfo_groups_group_id_1fb5e93a_fk_auth_group_id` (`group_id`),
  CONSTRAINT `blog_userinfo_groups_group_id_1fb5e93a_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `blog_userinfo_groups_userinfo_id_f6f0498b_fk_blog_userinfo_id` FOREIGN KEY (`userinfo_id`) REFERENCES `blog_userinfo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_userinfo_groups`
--

LOCK TABLES `blog_userinfo_groups` WRITE;
/*!40000 ALTER TABLE `blog_userinfo_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `blog_userinfo_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_userinfo_liked_article`
--

DROP TABLE IF EXISTS `blog_userinfo_liked_article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blog_userinfo_liked_article` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `userinfo_id` int NOT NULL,
  `article_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `blog_userinfo_liked_article_userinfo_id_article_id_2ab95a73_uniq` (`userinfo_id`,`article_id`),
  KEY `blog_userinfo_liked__article_id_84620e02_fk_blog_arti` (`article_id`),
  CONSTRAINT `blog_userinfo_liked__article_id_84620e02_fk_blog_arti` FOREIGN KEY (`article_id`) REFERENCES `blog_article` (`id`),
  CONSTRAINT `blog_userinfo_liked__userinfo_id_0a03ef61_fk_blog_user` FOREIGN KEY (`userinfo_id`) REFERENCES `blog_userinfo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_userinfo_liked_article`
--

LOCK TABLES `blog_userinfo_liked_article` WRITE;
/*!40000 ALTER TABLE `blog_userinfo_liked_article` DISABLE KEYS */;
INSERT INTO `blog_userinfo_liked_article` VALUES (4,1,41),(72,1,44),(71,4,41);
/*!40000 ALTER TABLE `blog_userinfo_liked_article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_userinfo_user_permissions`
--

DROP TABLE IF EXISTS `blog_userinfo_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blog_userinfo_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `userinfo_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `blog_userinfo_user_permi_userinfo_id_permission_i_7d343093_uniq` (`userinfo_id`,`permission_id`),
  KEY `blog_userinfo_user_p_permission_id_ace80f7e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `blog_userinfo_user_p_permission_id_ace80f7e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `blog_userinfo_user_p_userinfo_id_57e76697_fk_blog_user` FOREIGN KEY (`userinfo_id`) REFERENCES `blog_userinfo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_userinfo_user_permissions`
--

LOCK TABLES `blog_userinfo_user_permissions` WRITE;
/*!40000 ALTER TABLE `blog_userinfo_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `blog_userinfo_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_blog_userinfo_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_blog_userinfo_id` FOREIGN KEY (`user_id`) REFERENCES `blog_userinfo` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2022-06-21 06:28:09.718563','1','/media/banner/wallhaven-nm2ogy.jpeg',1,'[{\"added\": {}}]',9,1),(2,'2022-06-21 06:35:19.021429','1','/media/banner/wallhaven-nm2ogy.jpeg',2,'[]',9,1),(3,'2022-06-21 06:35:57.416127','2','/media/banner/%E6%A3%AE%E5%9B%BE%E5%A3%81%E7%BA%B8-04.jpg',1,'[{\"added\": {}}]',9,1),(4,'2022-06-22 10:41:54.628559','1','hhhhh',1,'[{\"added\": {}}]',7,1),(5,'2022-06-22 10:42:26.662009','2','sddde',1,'[{\"added\": {}}]',7,1),(6,'2022-06-22 10:44:47.315802','3','fvfgf',1,'[{\"added\": {}}]',7,1),(7,'2022-06-22 10:48:41.196802','1','python',1,'[{\"added\": {}}]',14,1),(8,'2022-06-22 10:48:46.332996','2','java',1,'[{\"added\": {}}]',14,1),(9,'2022-06-22 10:48:50.313938','3','go',1,'[{\"added\": {}}]',14,1),(10,'2022-06-22 10:49:07.889863','4','料理',1,'[{\"added\": {}}]',14,1),(11,'2022-06-22 10:49:30.090387','5','美食',1,'[{\"added\": {}}]',14,1),(12,'2022-06-22 10:49:33.459709','5','美食',2,'[]',14,1),(13,'2022-06-22 10:49:43.617630','6','运动',1,'[{\"added\": {}}]',14,1),(14,'2022-06-22 10:50:11.901996','3','fvfgf',2,'[{\"changed\": {\"fields\": [\"\\u70b9\\u8d5e\\u6570\", \"\\u8bc4\\u8bba\\u6570\", \"\\u6d4f\\u89c8\\u91cf\", \"\\u6587\\u7ae0\\u6807\\u7b7e\"]}}]',7,1),(15,'2022-06-22 10:50:17.473822','2','sddde',2,'[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u6807\\u7b7e\"]}}]',7,1),(16,'2022-06-22 10:50:45.814921','1','hhhhh',2,'[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u5206\\u7c7b\", \"\\u6587\\u7ae0\\u6807\\u7b7e\"]}}]',7,1),(17,'2022-06-22 10:50:51.464110','1','hhhhh',2,'[]',7,1),(18,'2022-06-25 06:35:24.645692','1','测试评论',1,'[{\"added\": {}}]',16,1),(19,'2022-06-25 06:36:59.703336','1','/media/user_avatar/005Qg1G9ly1h0ghpjzy2sj30u00u07gu.jpg',1,'[{\"added\": {}}]',8,1),(20,'2022-06-25 06:37:20.326731','2','/media/user_avatar/005Qg1G9ly1h0ghpm4qhej30oc0ocwnd.jpg',1,'[{\"added\": {}}]',8,1),(21,'2022-06-25 06:37:45.116284','3','小可爱',2,'[{\"changed\": {\"fields\": [\"\\u7528\\u6237\\u5934\\u50cf\", \"\\u559c\\u6b22\\u7684\\u6587\\u7ae0\"]}}]',6,1),(22,'2022-06-26 15:24:02.257814','1','xiran',2,'[{\"changed\": {\"fields\": [\"Last login\", \"\\u7528\\u6237\\u5934\\u50cf\", \"\\u559c\\u6b22\\u7684\\u6587\\u7ae0\"]}}]',6,1),(23,'2022-08-06 03:32:49.314880','11','mmmmmm',2,'[]',10,1),(24,'2022-08-06 03:34:11.051623','11','mmmmmm',2,'[{\"changed\": {\"fields\": [\"\\u56de\\u590d\\u5185\\u5bb9\"]}}]',10,1),(25,'2022-08-06 03:35:01.718936','11','mmmmmm',2,'[{\"changed\": {\"fields\": [\"\\u56de\\u590d\\u5185\\u5bb9\"]}}]',10,1),(26,'2022-08-06 03:53:06.198174','12','测试',2,'[{\"changed\": {\"fields\": [\"\\u56de\\u590d\\u5185\\u5bb9\"]}}]',10,1),(27,'2022-08-06 03:55:43.382227','13','测试',2,'[{\"changed\": {\"fields\": [\"\\u56de\\u590d\\u5185\\u5bb9\"]}}]',10,1),(28,'2022-08-06 03:58:04.060879','14','测试',2,'[{\"changed\": {\"fields\": [\"\\u56de\\u590d\\u5185\\u5bb9\"]}}]',10,1),(29,'2022-08-06 03:58:46.041288','14','测试',3,'',10,1),(30,'2022-08-06 03:58:46.046263','13','测试',3,'',10,1),(31,'2022-08-06 03:58:46.048312','12','测试',3,'',10,1),(32,'2022-08-06 03:58:46.050120','11','mmmmmm',3,'',10,1),(33,'2022-08-06 03:58:46.051780','10','dddd',3,'',10,1),(34,'2022-08-06 03:58:46.052977','9','vvvv',3,'',10,1),(35,'2022-08-06 03:58:46.054504','8','zzzz',3,'',10,1),(36,'2022-08-06 03:58:46.056077','7','bbbb',3,'',10,1),(37,'2022-08-06 03:58:46.057518','6','sdadwddzda',3,'',10,1),(38,'2022-08-06 03:58:46.059086','5','cdvdsfdfes',3,'',10,1),(39,'2022-08-06 03:58:46.061236','4','sdda',3,'',10,1),(40,'2022-08-06 03:58:46.063268','3','bbb',3,'',10,1),(41,'2022-08-06 03:58:46.065193','2','hhh',3,'',10,1),(42,'2022-08-06 03:58:46.067430','1','这是测试测试',3,'',10,1),(43,'2022-08-06 04:00:35.069663','15','测试',2,'[{\"changed\": {\"fields\": [\"\\u56de\\u590d\\u5185\\u5bb9\"]}}]',10,1),(44,'2022-08-08 03:44:09.754582','43','测试代码块这个标题特别的长长长长',2,'[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u6807\\u9898\"]}}]',7,1),(45,'2022-08-09 09:55:17.565070','46','嘿嘿嘿',3,'',7,1),(46,'2022-08-09 09:57:34.034613','48','dffdgda',3,'',7,1),(47,'2022-08-09 09:57:34.038655','47','sfsdfa',3,'',7,1),(48,'2022-08-09 09:57:34.040438','45','测试添加文章的文件流',3,'',7,1),(49,'2022-08-09 09:57:34.042752','43','测试代码块这个标题特别的长长长长',3,'',7,1),(50,'2022-08-09 09:57:34.044792','42','ceshi',3,'',7,1),(51,'2022-08-09 09:57:34.046283','3','fvfgf',3,'',7,1),(52,'2022-08-09 09:57:34.047781','2','sddde',3,'',7,1),(53,'2022-08-09 09:57:34.049394','1','hhhhh',3,'',7,1),(54,'2022-08-09 09:59:05.692385','16','vvvv',2,'[{\"changed\": {\"fields\": [\"\\u56de\\u590d\\u5185\\u5bb9\"]}}]',10,1),(55,'2022-08-09 10:12:12.501467','4','小笨蛋',2,'[{\"changed\": {\"fields\": [\"Last login\", \"\\u7528\\u6237\\u5934\\u50cf\", \"\\u559c\\u6b22\\u7684\\u6587\\u7ae0\"]}}]',6,1),(56,'2022-08-09 10:26:59.175405','2','小可爱fffsddcedfdsffesfewfwfewrfecdfferfewdsfefewsfdsfewfewfewfdsfdfewfewfwe',3,'',6,1),(57,'2022-08-09 10:35:30.247424','3','小可爱',2,'[{\"changed\": {\"fields\": [\"Last login\", \"\\u7528\\u6237\\u5934\\u50cf\"]}}]',6,1),(58,'2022-08-09 13:18:05.378395','3','/media/banner/%E6%88%AA%E5%B1%8F2022-07-19_22.30.09.png',1,'[{\"added\": {}}]',9,1),(59,'2022-08-09 13:19:55.110341','4','/media/banner/%E6%88%AA%E5%B1%8F2022-07-28_15.55.15.png',1,'[{\"added\": {}}]',9,1),(60,'2022-08-09 13:20:33.953802','5','/media/banner/%E6%88%AA%E5%B1%8F2022-03-18_%E4%B8%8B%E5%8D%889.59.05.png',1,'[{\"added\": {}}]',9,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(7,'blog','article'),(8,'blog','avatar'),(9,'blog','banner'),(16,'blog','comment'),(10,'blog','feedback'),(11,'blog','notice'),(12,'blog','owner'),(13,'blog','sentence'),(15,'blog','site'),(14,'blog','tag'),(6,'blog','userinfo'),(4,'contenttypes','contenttype'),(5,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2022-06-19 12:42:26.604134'),(2,'contenttypes','0002_remove_content_type_name','2022-06-19 12:42:26.632525'),(3,'auth','0001_initial','2022-06-19 12:42:26.713938'),(4,'auth','0002_alter_permission_name_max_length','2022-06-19 12:42:26.729208'),(5,'auth','0003_alter_user_email_max_length','2022-06-19 12:42:26.733063'),(6,'auth','0004_alter_user_username_opts','2022-06-19 12:42:26.737170'),(7,'auth','0005_alter_user_last_login_null','2022-06-19 12:42:26.741072'),(8,'auth','0006_require_contenttypes_0002','2022-06-19 12:42:26.742252'),(9,'auth','0007_alter_validators_add_error_messages','2022-06-19 12:42:26.745644'),(10,'auth','0008_alter_user_username_max_length','2022-06-19 12:42:26.749021'),(11,'auth','0009_alter_user_last_name_max_length','2022-06-19 12:42:26.752355'),(12,'auth','0010_alter_group_name_max_length','2022-06-19 12:42:26.760927'),(13,'auth','0011_update_proxy_permissions','2022-06-19 12:42:26.765545'),(14,'auth','0012_alter_user_first_name_max_length','2022-06-19 12:42:26.770501'),(15,'blog','0001_initial','2022-06-19 12:42:27.020199'),(16,'admin','0001_initial','2022-06-19 12:42:27.059654'),(17,'admin','0002_logentry_remove_auto_add','2022-06-19 12:42:27.067450'),(18,'admin','0003_logentry_add_action_flag_choices','2022-06-19 12:42:27.075171'),(19,'sessions','0001_initial','2022-06-19 12:42:27.084859'),(20,'blog','0002_delete_banner_delete_sentence','2022-06-21 05:51:35.148730'),(21,'blog','0003_banner','2022-06-21 05:51:56.585230'),(22,'blog','0004_alter_userinfo_liked_article','2022-08-09 10:35:10.121291');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('4fgmuel3rg683wscxj56p6510cmrwje0','.eJxVi8sOwiAQRf9l1qaBFgbGpX4IGRgQ46OJlJXx39WmC13ec-55QuC-1NBbfoSzwB407H5Z5HTJ96-I1_k0rGJjbV3Dsbdlvh22319cudVP6ZNhq8uYxWmciDxhylY8s7HKEVIUVZTgJKkkUdG7YsjJiJoVoQi83vuaNss:1oM8Lm:Dz-ExIJOdXFJn629QaXsFhoOtncvwuh9YfpVeS9H0Pk','2022-08-25 13:35:50.245992'),('9a5uuiji7d93nbtgzrasbgdo73fnfsak','.eJxVjDsOwjAQBe_iGll24t9S0nMGa71r4wBypDipEHeHSCmgfTPzXiLitta49bzEicVZaHH63RLSI7cd8B3bbZY0t3WZktwVedAurzPn5-Vw_w4q9vqtAxm0ugyZvXYjQABH2XJANFZ5cJBYFcVuZCrEKgVfDHgenEYFjlm8P-T9OB4:1o5hh8:9_wrfBb_IDfNUsTg_O6Wnwkiu3mBvQT7U_CfkvafR18','2022-07-11 05:53:58.241622'),('dfh8ts69802nqh6ydbbuhx7pv3gvun3o','.eJxVjMsOwiAQRf-FtSGd8hhw6d5vIMNApWogKe3K-O_apAvd3nPOfYlA21rC1vMS5iTOAsTpd4vEj1x3kO5Ub01yq-syR7kr8qBdXlvKz8vh_h0U6uVbI0IiPSVvgB25rJ3x0QzRO7BoVRwVOmA1oc-akJh9zGDsOCgCx4zi_QHUGTeF:1o3XEV:lISb0V5HBFhEgaKQQBWQXz1mXMpAXmWBk_6rlyKK81k','2022-07-05 06:19:27.523048'),('fhuzfwkznghzh3s1b0jobmtvxq179qvk','.eJy9lktzmzAQx7-Kh7MdxEMPckw_QE49lYxn0cPWFEQjwD1k_N0rgdOJCS2EiXMSq_1rpf2tWHgJTtJqpTm0ujb7prXaHJrgPng8_X4OtsEeuva47xpp91q46eh6rgD-UxrvKMr6cNc7LnNNb91965q2rh4uuqvFR2iObiXjKeBIxVLQiCRZxjLCJRYMIMWIZiQrBFJIkERwxQUqGFVpRkVMIkAZEX3QSprOn_rHSx4YqGQe3G_y4MGdKQ-27knz2gxzCuxGwY5ry0s5OKtayLLx7uvled6ROIrcQAlLvYUZ9RZItCBsZ8vBF4KotAk9oRBsq50iHCQgxPf_qZz_oiysBMFtVxUTB12Q53m7-azczk_eLbXw3giheCr2m2jOYqi3CirXcmvhMMPMK27La2VOY17JRGyKY9aXJKFrCflXShtVz2D6K7spq-X5jOmkM9HyDidcuME1CraWlZJS-Db1jpXpyvILkHwkiTEgPB87S_wbjRFX3id5urpbnaAFO9esBtGX3acVCY4ZkoktWMHTfihgLS5eV-5D1M7welXdFNjybMZs6FQ0RaTHn4K_tJio1X28AGPk3I26iG4L6KMpjTmx8UQ0WQYYysD9pxanjPs9E9ZfZpom7_ds_J7NUctS7KBsZ_9Qpm9_H8W3-mbHX-mM6-F_xMKDrbtf_y7HG83CanxO0lMtYFGio6JEaFyl7PwUnP8AxRpo0Q:1oLP3P:JUbhp61DEShdGB9k_o3KViyDqjwsfQWNLgI91TmtfxI','2022-08-23 13:13:51.138848'),('qqbn2k6qxqk62xl78pe23twy835at8es','.eJxVjDsOwjAQBe_iGll24t9S0nMGa71r4wBypDipEHeHSCmgfTPzXiLitta49bzEicVZaHH63RLSI7cd8B3bbZY0t3WZktwVedAurzPn5-Vw_w4q9vqtAxm0ugyZvXYjQABH2XJANFZ5cJBYFcVuZCrEKgVfDHgenEYFjlm8P-T9OB4:1o5j0N:KmcR_4qkUI6W0x84brc7UCKzMCuKjTnXbKx6TUkwCpc','2022-07-11 07:17:55.286057'),('ttcmh0faqls7i4cucuv6uin9lflut7r0','.eJxVi8sOwiAQRf9l1qaBFgbGpX4IGRgQ46OJlJXx39WmC13ec-55QuC-1NBbfoSzwB407H5Z5HTJ96-I1_k0rGJjbV3Dsbdlvh22319cudVP6ZNhq8uYxWmciDxhylY8s7HKEVIUVZTgJKkkUdG7YsjJiJoVoQi83vuaNss:1oLcKD:BIEOFaTx_-RBnX1yoJbsLO7GOyFINS2ehhKxdGkTaHk','2022-08-24 03:24:05.813954'),('upo19m8jvol97kntadk48he0g7aa54vs','.eJxVjDsOwjAQBe_iGll24t9S0nMGa71r4wBypDipEHeHSCmgfTPzXiLitta49bzEicVZaHH63RLSI7cd8B3bbZY0t3WZktwVedAurzPn5-Vw_w4q9vqtAxm0ugyZvXYjQABH2XJANFZ5cJBYFcVuZCrEKgVfDHgenEYFjlm8P-T9OB4:1o7B6b:DAjIRumzN5QmEScyPIhUvfQKK0PfV2Oev_y5vOpHDF0','2022-07-15 07:30:21.319543'),('v1pytrw9kdy17uv3wginwktj4cu0rjp0','.eJxVjDsOwjAQBe_iGll24t9S0nMGa71r4wBypDipEHeHSCmgfTPzXiLitta49bzEicVZaHH63RLSI7cd8B3bbZY0t3WZktwVedAurzPn5-Vw_w4q9vqtAxm0ugyZvXYjQABH2XJANFZ5cJBYFcVuZCrEKgVfDHgenEYFjlm8P-T9OB4:1o7A0B:JN0NzR_w7_R5IVAuAM13lssq-NxBMO7mGybrvW2RJYo','2022-07-15 06:19:39.073040'),('yurtw7qvm1d040t3lercwijcnh79z3de','.eJy9lttymzAQhl_Fw7UdBOhELtNn6FXJeFYnmymHDqDeZPzulcDpOAothIlzJaT9tWK_XVa8REeww_loe90dSxU9Rkm0v10TIH_qxhtE1Z4eRsN1rR9nD99sP7T101X3ZvMZ-rPbySUGkphUK5bQLM95TqUmigNgglhOc6GQQYpmShqpkODM4JyplCaAcqpGp7VubO98_XgpogZqXUSPuyJ6cu9URHv3VMq2mdYMdDsDB1l2stKTsW6Vrnpvfru9KCxNk8QNjHLsZ4QzPwONVri1XTXZYlB12cSeUAzdUDpFPElAqe__Uzn7VSk6DUp2thYzL7oizst-91mxXZ69WZfKWxOE0jnfN97cjKNxJpjeym2A0wIzr7gvr40xhbyyGd-MpHxMSca2EvKfVNmYdgHTX9ldWa2PJ6SDF7wVlmRSucE1Cr6VldFa-Tb1jlVjq-oLkHwkiBAQWfadZ_6LJkgab9MSb-5Wv2GAbqlZTaIvq6cNAYYM6cwRXEg8DgK24pJt7S6iYYHXq-quwNZHE7Jhc94M1R4_Bl-0hJrNfVxA0-ilirqK7gvooyGFnHi4kMymAaY0SH_VEsylPzPjYzEznL0_s_dn9udSV-oA1bD4hzJf_aMX3-r7g3ylE-bD_4jFp661v_6djhvNymx8TtBzLWBVoEFSEhRmKb88R5c_czNdyg:1oLMh6:kKG6H3ONr1RujBec6tDeHBZRIBqUcMcWEzj26MMZaPw','2022-08-23 10:42:40.205092'),('yzm1bqeneie30lhdjok4bbbalp184fau','.eJxVj7tuwyAUht-FuULhDp6qqmu37OgAx7UTYyqMs0R59-IoQ7t-_-Wc_0487G3y-4bVz4kMRJC3vyxAvOJ6COkC63ehsaytzoEeFvpSN_pVEi4fL--_ggm2qaeVS6A0WpfQOBdDkoqLxIJOKMV4MoKHkY9CSR4D1zZKLU1gaGxi3HA4SjPMi4_9kC_hQob7E_Tqz4qQsZ5hfS97W0q59idzD9ygPv3HKqksO3XW5ox-a5B_yMC00oIJrjh1VmjHH49fpMxXdQ:1o5ijs:7sb1vO0NbajNxFFU42anqUN5oDL50rbWG-0uE-XYOiY','2022-07-11 07:00:52.986680'),('zeigyzzet2cxe2kouw16eecqv3kmqquz','.eJxVjMEOwiAQRP-Fs2mWUha2R_2QZmHBGrUk0saD8d-1TQ96nDfz5qUGXuZxWGp6DBdRvdLq8MsCx2ua1iLcyrnZip3VLTWnpc7lftx3f_LIdfyaPnZsdW6TOI2GyBPGZMUzdxYcIQWBDIJGYo4CwbvckZMWNQOhrKdTeapeI4IGMBbfH8GOOsU:1oLbwC:XqParu66MXRo0V8rNmhCYrbrLlLbEvh7BC0f-Hedcj0','2022-08-24 02:59:16.537599');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-08-12 17:23:38
