/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50525
Source Host           : localhost:3336
Source Database       : niiar

Target Server Type    : MYSQL
Target Server Version : 50525
File Encoding         : 65001

Date: 2013-04-05 11:48:55
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `db_migration`
-- ----------------------------
DROP TABLE IF EXISTS `db_migration`;
CREATE TABLE `db_migration` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `version` int(10) unsigned NOT NULL DEFAULT '0',
  `comment` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=68 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of db_migration
-- ----------------------------
INSERT INTO `db_migration` VALUES ('1', '0', null, '2013-02-26 14:18:51');
INSERT INTO `db_migration` VALUES ('2', '1', '1 log and sef tables.sql', '2013-02-26 14:18:51');
INSERT INTO `db_migration` VALUES ('3', '2', '2 user tables.sql', '2013-02-26 14:18:52');
INSERT INTO `db_migration` VALUES ('4', '3', '3 blog tables.sql', '2013-02-26 14:18:52');
INSERT INTO `db_migration` VALUES ('5', '4', '4 add username.sql', '2013-02-26 14:18:52');
INSERT INTO `db_migration` VALUES ('6', '5', '5 add category alias.sql', '2013-02-26 14:18:52');
INSERT INTO `db_migration` VALUES ('7', '6', '6 add post fields.sql', '2013-02-26 14:18:52');
INSERT INTO `db_migration` VALUES ('8', '7', '7 tags table.sql', '2013-02-26 14:18:52');
INSERT INTO `db_migration` VALUES ('9', '8', '8 new post taxonomy.sql', '2013-02-26 14:18:52');
INSERT INTO `db_migration` VALUES ('10', '9', '9 files table.sql', '2013-02-26 14:18:52');
INSERT INTO `db_migration` VALUES ('11', '10', '10 get posts.sql', '2013-02-26 14:18:52');
INSERT INTO `db_migration` VALUES ('12', '11', '11 get post by id.sql', '2013-02-26 14:18:52');
INSERT INTO `db_migration` VALUES ('13', '12', '12 get posts by tags.sql', '2013-02-26 14:18:52');
INSERT INTO `db_migration` VALUES ('14', '13', '13 gallery tables.sql', '2013-02-26 14:18:52');
INSERT INTO `db_migration` VALUES ('15', '14', '14 get gallery.sql', '2013-02-26 14:18:52');
INSERT INTO `db_migration` VALUES ('16', '15', '15 get gallery by tags.sql', '2013-02-26 14:18:52');
INSERT INTO `db_migration` VALUES ('17', '16', '16 get gallery by id.sql', '2013-02-26 14:18:52');
INSERT INTO `db_migration` VALUES ('18', '17', '17 change filetype.sql', '2013-02-26 14:18:53');
INSERT INTO `db_migration` VALUES ('19', '18', '18 get files.sql', '2013-02-26 14:18:53');
INSERT INTO `db_migration` VALUES ('20', '19', '19 post relations.sql', '2013-02-26 14:18:53');
INSERT INTO `db_migration` VALUES ('21', '20', '20 upsert files.sql', '2013-02-26 14:18:53');
INSERT INTO `db_migration` VALUES ('22', '21', '21 remove files.sql', '2013-02-26 14:18:53');
INSERT INTO `db_migration` VALUES ('23', '22', '22 add music fields.sql', '2013-02-26 14:18:53');
INSERT INTO `db_migration` VALUES ('24', '23', '23 user check cookie.sql', '2013-02-26 14:18:53');
INSERT INTO `db_migration` VALUES ('25', '24', '24 user check email.sql', '2013-02-26 14:18:53');
INSERT INTO `db_migration` VALUES ('26', '25', '25 user check login.sql', '2013-02-26 14:18:53');
INSERT INTO `db_migration` VALUES ('27', '26', '26 user check username.sql', '2013-02-26 14:18:53');
INSERT INTO `db_migration` VALUES ('28', '27', '27 user get by id.sql', '2013-02-26 14:18:53');
INSERT INTO `db_migration` VALUES ('29', '28', '28 user update password.sql', '2013-02-26 14:18:53');
INSERT INTO `db_migration` VALUES ('30', '29', '29 user upsert.sql', '2013-02-26 14:18:53');
INSERT INTO `db_migration` VALUES ('31', '30', '30 get sef.sql', '2013-02-26 14:18:53');
INSERT INTO `db_migration` VALUES ('32', '31', '31 get sef map alias.sql', '2013-02-26 14:18:53');
INSERT INTO `db_migration` VALUES ('33', '32', '32 sef upsert.sql', '2013-02-26 14:18:53');
INSERT INTO `db_migration` VALUES ('34', '33', '33 update sef counter.sql', '2013-02-26 14:18:53');
INSERT INTO `db_migration` VALUES ('35', '34', '34 create file relations.sql', '2013-02-26 14:18:53');
INSERT INTO `db_migration` VALUES ('36', '35', '35 create post relations.sql', '2013-02-26 14:18:53');
INSERT INTO `db_migration` VALUES ('37', '36', '36 create tags relations.sql', '2013-02-26 14:18:53');
INSERT INTO `db_migration` VALUES ('38', '37', '37 upsert post.sql', '2013-02-26 14:18:53');
INSERT INTO `db_migration` VALUES ('39', '38', '38 upsert tags.sql', '2013-02-26 14:18:53');
INSERT INTO `db_migration` VALUES ('40', '39', '39 split str.sql', '2013-02-26 14:18:53');
INSERT INTO `db_migration` VALUES ('41', '40', '40 get tags by ids.sql', '2013-02-26 14:18:53');
INSERT INTO `db_migration` VALUES ('42', '41', '41 search tags.sql', '2013-02-26 14:18:53');
INSERT INTO `db_migration` VALUES ('43', '42', '42 get posts by tag id.sql', '2013-02-26 14:18:53');
INSERT INTO `db_migration` VALUES ('44', '43', '43 get tags.sql', '2013-02-26 14:18:53');
INSERT INTO `db_migration` VALUES ('45', '44', '44 all posts.sql', '2013-02-26 14:18:53');
INSERT INTO `db_migration` VALUES ('46', '45', '45 add date to post.sql', '2013-02-26 14:18:53');
INSERT INTO `db_migration` VALUES ('47', '46', '46 add dates to tags.sql', '2013-02-26 14:18:53');
INSERT INTO `db_migration` VALUES ('48', '47', '47 add aliases.sql', '2013-02-26 14:18:53');
INSERT INTO `db_migration` VALUES ('49', '48', '48 add upsert gallery.sql', '2013-02-26 14:18:53');
INSERT INTO `db_migration` VALUES ('50', '49', '49 add view counter for posts.sql', '2013-02-26 14:18:53');
INSERT INTO `db_migration` VALUES ('51', '50', '50 track post by id.sql', '2013-02-26 14:18:53');
INSERT INTO `db_migration` VALUES ('52', '51', '51 get posts by view count.sql', '2013-02-26 14:18:53');
INSERT INTO `db_migration` VALUES ('53', '52', '52 get gallery items.sql', '2013-02-26 14:18:53');
INSERT INTO `db_migration` VALUES ('54', '53', '53 add view counter for files.sql', '2013-02-26 14:18:53');
INSERT INTO `db_migration` VALUES ('55', '54', '54 track file by id.sql', '2013-02-26 14:18:53');
INSERT INTO `db_migration` VALUES ('56', '55', '55 fix get gallery by id.sql', '2013-02-26 14:18:53');
INSERT INTO `db_migration` VALUES ('57', '56', '56 add view counter for gallery.sql', '2013-02-26 14:18:53');
INSERT INTO `db_migration` VALUES ('58', '57', '57 track gallery by id.sql', '2013-02-26 14:18:53');
INSERT INTO `db_migration` VALUES ('59', '58', '58 delete post by id.sql', '2013-02-26 14:18:53');
INSERT INTO `db_migration` VALUES ('60', '59', '59 add gallery to files link.sql', '2013-02-26 14:18:53');
INSERT INTO `db_migration` VALUES ('61', '60', '60 add uk for post files.sql', '2013-02-26 14:18:54');
INSERT INTO `db_migration` VALUES ('62', '61', '61 add uk for gallery files.sql', '2013-02-26 14:18:54');
INSERT INTO `db_migration` VALUES ('63', '62', '62 add upsert gallery files.sql', '2013-02-26 14:18:54');
INSERT INTO `db_migration` VALUES ('64', '63', '63 fix dublicates on upsert gallery.sql', '2013-02-26 14:18:54');
INSERT INTO `db_migration` VALUES ('65', '64', '64 change get gallery items.sql', '2013-02-26 14:18:54');
INSERT INTO `db_migration` VALUES ('66', '65', '65 get next image by id.sql', '2013-02-26 14:18:54');
INSERT INTO `db_migration` VALUES ('67', '66', '66 get prev image by id.sql', '2013-02-26 14:18:54');

-- ----------------------------
-- Table structure for `files`
-- ----------------------------
DROP TABLE IF EXISTS `files`;
CREATE TABLE `files` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(32) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `source` text NOT NULL,
  `size` int(11) unsigned DEFAULT NULL,
  `md5` varchar(32) DEFAULT NULL,
  `viewed` int(11) unsigned DEFAULT '0',
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=575 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of files
-- ----------------------------
INSERT INTO `files` VALUES ('193', 'release', '', '', './content/release/M01_Manti_Insomnia_mix.mp3', '114481152', '5dc954df86f769876052bcdb2a717455', '0', '2005-08-08 00:00:00');
INSERT INTO `files` VALUES ('194', 'covers', '', '', './content/covers/insomnia.jpg', '107175', '507fe6936b82e41ec302d1b4b4b5824d', '0', '2001-01-01 00:00:00');
INSERT INTO `files` VALUES ('195', 'release', '', '', './content/release/M07_Manti_Synthetic_mix.mp3', '85915648', '6c5abc5ca9fdce6b9d1b0ab5209356a7', '0', '2007-09-16 00:00:00');
INSERT INTO `files` VALUES ('196', 'release', '', '', './content/release/M17_Manti_Plastic_toy_mix.mp3', '117665684', '2d0d2031fcbaba75a0879e6405925ccc', '0', '2009-05-07 00:00:00');
INSERT INTO `files` VALUES ('197', 'covers', '', '', './content/covers/plastic-toy.jpg', '24750', '76ddfb432e206da38cee9dde962cba36', '0', '2001-01-01 00:00:00');
INSERT INTO `files` VALUES ('198', 'release', '', '', './content/release/M21_Manti_Solaris_mix.mp3', '126572776', 'b59b2965d476f50dd1988426e6b8174e', '0', '2010-04-18 00:00:00');
INSERT INTO `files` VALUES ('199', 'covers', '', '', './content/covers/synthetic.jpg', '65559', '68b58539fe751b76d652b157506b615c', '0', '2001-01-01 00:00:00');
INSERT INTO `files` VALUES ('200', 'covers', '', '', './content/covers/solaris.jpg', '69365', '29f09d6a61f977477f2ad8d575bf2301', '0', '2001-01-01 00:00:00');
INSERT INTO `files` VALUES ('201', 'preview', '', '', './content/preview/iris.mp3', '23879996', '4878bd46a24e0cb9bc9b673580bb471c', '0', '2001-01-01 00:00:00');
INSERT INTO `files` VALUES ('202', 'preview', '', '', './content/preview/plastictoy.mp3', '35300542', '37379c22a1bcc79bba6c9d53894db9bc', '0', '2001-01-01 00:00:00');
INSERT INTO `files` VALUES ('203', 'preview', '', '', './content/preview/solaris.mp3', '37973952', '570f8e8ea3d4da863ec451f7e6808053', '0', '2001-01-01 00:00:00');
INSERT INTO `files` VALUES ('204', 'preview', '', '', './content/preview/synthetic.mp3', '23008551', 'abb156025561b6d344363c465665f9fc', '0', '2001-01-01 00:00:00');
INSERT INTO `files` VALUES ('205', 'preview', '', '', './content/preview/insomnia.mp3', '21998553', 'db989a1bc8a8d9c23fe4dbd9faff542a', '0', '2001-01-01 00:00:00');
INSERT INTO `files` VALUES ('216', 'release', '', '', './content/release/M31_Manti_Stockholm_syndrome_mix.mp3', '188572842', 'e7078c2c2c36f57904ed83889c4204bb', '0', '2012-09-09 00:00:00');
INSERT INTO `files` VALUES ('217', 'covers', '', '', './content/covers/stockholm-syndrome.jpg', '165182', 'f3e02af36b5ffabc11924c15a3e4d3f3', '0', '2001-01-01 00:00:00');
INSERT INTO `files` VALUES ('218', 'release', '', '', './content/release/M27_Manti_Autoreply_mix_(Spring-Summer-12_promo).mp3', '141385250', 'a9d9c8c099fa33cf4dd3a97aff5917bf', '0', '2012-05-02 00:00:00');
INSERT INTO `files` VALUES ('219', 'covers', '', '', './content/covers/autoreply.jpg', '255607', 'd3f169cb92f66e0b2af622120643628b', '0', '2001-01-01 00:00:00');
INSERT INTO `files` VALUES ('220', 'preview', '', '', './content/preview/autoreply.mp3', '23349333', '96950c8911e8e3ed306ac12fcd17c08c', '0', '2001-01-01 00:00:00');
INSERT INTO `files` VALUES ('221', 'preview', '', '', './content/preview/stockholm.mp3', '36213281', '87324a5de4f52b0306cce025307e6e7d', '0', '2001-01-01 00:00:00');
INSERT INTO `files` VALUES ('222', 'release', '', '', './content/release/M25_Manti_Katana_mix.mp3', '138091732', '744e439805608d58c6ca7f54f8f45e76', '0', '2011-12-05 00:00:00');
INSERT INTO `files` VALUES ('223', 'preview', '', '', './content/preview/katana.mp3', '17285164', 'd6352d661acce89447af00ac0a2422da', '0', '2001-01-01 00:00:00');
INSERT INTO `files` VALUES ('224', 'covers', '', '', './content/covers/katana.jpg', '82244', 'a773ebdc52c9c1a901e4f4e1b9840d8f', '0', '2001-01-01 00:00:00');
INSERT INTO `files` VALUES ('225', 'release', '', '', './content/release/M02_Manti_All_she_wants_is_mix_(SCSI_device).mp3', '172061445', '59ec5fdd0d1f1f2a43c75e92dfe18cb4', '1', '2005-10-12 00:00:00');
INSERT INTO `files` VALUES ('226', 'preview', '', '', './content/preview/hobh.mp3', '22671258', 'a4eed9dbc1e5b779dda64ffa57174767', '0', '2001-01-01 00:00:00');
INSERT INTO `files` VALUES ('227', 'preview', '', '', './content/preview/hobh2.mp3', '22495402', '79ff1af7d6aaff0868a38874b6d01aa2', '0', '2001-01-01 00:00:00');
INSERT INTO `files` VALUES ('228', 'preview', '', '', './content/preview/hobh3.mp3', '42063973', '41e59114bf85073ca086b7fccf9fe8a8', '0', '2001-01-01 00:00:00');
INSERT INTO `files` VALUES ('229', 'preview', '', '', './content/preview/hobh4.mp3', '18893952', '40734836feee8de9294f0bc89cc367af', '0', '2001-01-01 00:00:00');
INSERT INTO `files` VALUES ('230', 'release', '', '', './content/release/M03_Manti_HOBH_01_Nachalo.mp3', '155856276', 'd5b0a6167dc912c70fb2a1dbc76d64af', '0', '2006-12-11 00:00:00');
INSERT INTO `files` VALUES ('231', 'release', '', '', './content/release/M15_Manti_HOBH_02_Pepel.mp3', '145315118', 'b592ebd6aab1fd3f7b231a0fe45bb688', '0', '2009-02-23 00:00:00');
INSERT INTO `files` VALUES ('232', 'release', '', '', './content/release/M19_Manti_HOBH_03_So_lite.mp3', '140210403', '0bbcdafefac5f1d177323e4d0698016b', '0', '2009-10-14 00:00:00');
INSERT INTO `files` VALUES ('233', 'release', '', '', './content/release/M22_Manti_HOBH_04_Yuzhnye_sny.mp3', '103692264', '6b091f42f77b95cf9201a4f35854dfe3', '0', '2010-05-18 00:00:00');
INSERT INTO `files` VALUES ('234', 'covers', '', '', './content/covers/hobh-1.jpg', '123239', '9fbba62a39b877e333bb14039d5e3c82', '0', '2001-01-01 00:00:00');
INSERT INTO `files` VALUES ('235', 'covers', '', '', './content/covers/hobh-2.jpg', '160060', '601e973f1a0e5d8cb020f6f4eafd8441', '0', '2001-01-01 00:00:00');
INSERT INTO `files` VALUES ('236', 'covers', '', '', './content/covers/hobh-3.jpg', '96099', '72ae2b0bbb84fa266ed6303f07bb1928', '0', '2001-01-01 00:00:00');
INSERT INTO `files` VALUES ('237', 'covers', '', '', './content/covers/hobh-4.jpg', '71978', 'be7654c58c535cad25916be70c10cb7b', '0', '2001-01-01 00:00:00');
INSERT INTO `files` VALUES ('238', 'release', '', '', './content/release/M05_Manti_Hi-Pass_live.mp3', '63979520', '5cdeca964ddaaf28ad1b058a3c3d62aa', '0', '2007-06-05 00:00:00');
INSERT INTO `files` VALUES ('239', 'release', '', '', './content/release/M06_Manti_Janaca_express_mix_01.mp3', '87334912', '803bf1cfa825db601418a312ce62138d', '0', '2007-09-10 00:00:00');
INSERT INTO `files` VALUES ('247', 'gallery', '', '', './content/gallery/originals/autumn-12/DSC00011.JPG', '348041', 'e9c309a999be4d98d9de97f831175d28', '0', '2012-09-18 14:52:00');
INSERT INTO `files` VALUES ('248', 'gallery', '', '', './content/gallery/originals/autumn-12/DSC00109.JPG', '731314', '7b3c45d2b322202d63ff1511de66ef57', '0', '2012-09-19 00:00:00');
INSERT INTO `files` VALUES ('249', 'gallery', '', '', './content/gallery/originals/autumn-12/DSC00117.JPG', '395327', '39ad04d463a89dac26f3728797ea6741', '0', '2012-09-19 00:00:00');
INSERT INTO `files` VALUES ('250', 'gallery', '', '', './content/gallery/originals/autumn-12/DSC00123.JPG', '430606', 'afa6ecb1ce183b3512dc567d3255df0e', '0', '2012-09-19 00:00:00');
INSERT INTO `files` VALUES ('251', 'gallery', '', '', './content/gallery/originals/autumn-12/DSC00272.JPG', '589037', 'fd61fc3c49b7b9ae0fea77db0f535eee', '0', '2012-09-19 00:00:00');
INSERT INTO `files` VALUES ('252', 'gallery', '', '', './content/gallery/originals/autumn-12/DSC00283.JPG', '732195', '8d512b406cafdce4f8e461d42fbf041b', '0', '2012-09-20 00:00:00');
INSERT INTO `files` VALUES ('253', 'gallery', '', '', './content/gallery/originals/autumn-12/DSC00421.JPG', '776864', '27b84e38f36e76fabd8200eb6b460486', '0', '2012-09-20 00:00:00');
INSERT INTO `files` VALUES ('254', 'gallery', '', '', './content/gallery/originals/autumn-12/DSC00483.JPG', '868701', '5b0562a9568bb27c98ea9b9c23efd6c3', '0', '2012-09-21 00:00:00');
INSERT INTO `files` VALUES ('255', 'gallery', '', '', './content/gallery/originals/autumn-12/DSC00556.JPG', '523391', '12023a4db9a3e53293695cffee7b98c1', '0', '2012-09-21 00:00:00');
INSERT INTO `files` VALUES ('256', 'gallery', '', '', './content/gallery/originals/autumn-12/DSC00572.JPG', '614338', 'c027600eb354e6e59835f43c9e09c9cb', '0', '2012-09-21 00:00:00');
INSERT INTO `files` VALUES ('257', 'gallery', '', '', './content/gallery/originals/autumn-12/DSC00592.JPG', '670579', '464a8d58df5210ec46f3a0e8d4379327', '0', '2012-09-22 00:00:00');
INSERT INTO `files` VALUES ('258', 'gallery', '', '', './content/gallery/originals/autumn-12/DSC00655.JPG', '526075', '83a875246feb3f409de66087095afb73', '0', '2012-09-22 00:00:00');
INSERT INTO `files` VALUES ('259', 'gallery', '', '', './content/gallery/originals/autumn-12/DSC00687.JPG', '735129', '295d286fff9a8600357bbfb2c2449a74', '0', '2012-09-22 00:00:00');
INSERT INTO `files` VALUES ('260', 'gallery', '', '', './content/gallery/originals/autumn-12/DSC00814.JPG', '710568', '7d7a9be492db271188342c034e92bbcb', '0', '2012-09-22 00:00:00');
INSERT INTO `files` VALUES ('261', 'gallery', '', '', './content/gallery/originals/autumn-12/DSC00873.JPG', '792501', '33dfc2241dabebedb945d3e4f4a74ed6', '0', '2012-09-22 00:00:00');
INSERT INTO `files` VALUES ('262', 'gallery', '', '', './content/gallery/originals/autumn-12/DSC00936.JPG', '724659', 'be11f9bae80f4a42d85d6d0d1868ac62', '0', '2012-09-23 00:00:00');
INSERT INTO `files` VALUES ('263', 'gallery', '', '', './content/gallery/originals/autumn-12/DSC01064.JPG', '614320', '482d87b1f6efb5550ef0a78b52f276ba', '0', '2012-09-23 00:00:00');
INSERT INTO `files` VALUES ('264', 'gallery', '', '', './content/gallery/originals/autumn-12/DSC01222.JPG', '563158', '9d7db6123f1b75e6061f0521105eb43b', '0', '2012-09-23 00:00:00');
INSERT INTO `files` VALUES ('265', 'gallery', '', '', './content/gallery/originals/autumn-12/DSC01526.JPG', '680693', '41eb3597e931f98779f408bfec9439ae', '0', '2012-09-24 00:00:00');
INSERT INTO `files` VALUES ('266', 'gallery', '', '', './content/gallery/originals/autumn-12/DSC01674.JPG', '575352', 'dff4b06751ff0cc63588e4b2be8a9af8', '0', '2012-09-29 00:00:00');
INSERT INTO `files` VALUES ('267', 'gallery', '', '', './content/gallery/originals/autumn-12/DSC01778.JPG', '797310', 'ef30dc468c19dfc9eebcf99c7de53d5f', '0', '2012-09-29 00:00:00');
INSERT INTO `files` VALUES ('268', 'gallery', '', '', './content/gallery/originals/autumn-12/DSC01794.JPG', '861083', '308dc93a817f331c7aed3d992ae269b6', '0', '2012-09-29 00:00:00');
INSERT INTO `files` VALUES ('269', 'gallery', '', '', './content/gallery/originals/autumn-12/DSC01820.JPG', '709007', 'a1fe59e77ff0e7785bc7ced9fb8931c2', '0', '2012-09-29 00:00:00');
INSERT INTO `files` VALUES ('270', 'gallery', '', '', './content/gallery/originals/autumn-12/DSC01878.JPG', '679775', 'ebd8be156c58dbcc4586cb8987795949', '0', '2012-09-29 00:00:00');
INSERT INTO `files` VALUES ('271', 'gallery', '', '', './content/gallery/originals/autumn-12/DSC01992.JPG', '797886', 'e63dcb654796c10b3fdef061c42dde88', '0', '2012-09-30 00:00:00');
INSERT INTO `files` VALUES ('272', 'gallery', '', '', './content/gallery/originals/autumn-12/DSC02116.JPG', '630489', 'd45941616f4391a38c8482f30ea63a3b', '0', '2012-09-30 00:00:00');
INSERT INTO `files` VALUES ('273', 'gallery', '', '', './content/gallery/originals/autumn-12/DSC02322.JPG', '1321239', 'd8e82e3720c1c21cc8d2496c070e1846', '0', '2012-09-30 00:00:00');
INSERT INTO `files` VALUES ('274', 'gallery', '', '', './content/gallery/originals/autumn-12/DSC02418.JPG', '758770', '2a7f1647c55480e06ada9cda69096eba', '0', '2012-09-30 00:00:00');
INSERT INTO `files` VALUES ('275', 'gallery', '', '', './content/gallery/originals/autumn-12/DSC02604.JPG', '780132', 'ccc292f87b08f093060e15d8be6e28f7', '0', '2012-09-30 00:00:00');
INSERT INTO `files` VALUES ('276', 'gallery', '', '', './content/gallery/originals/autumn-12/DSC03803.JPG', '3538944', '4f9871b1099277ace95666859f670aad', '1', '2012-10-26 00:00:00');
INSERT INTO `files` VALUES ('277', 'gallery', '', '', './content/gallery/originals/autumn-12/DSC03995.JPG', '267978', 'db65025b5e97da21140987ebbe7d2039', '1', '2012-12-11 00:00:00');
INSERT INTO `files` VALUES ('278', 'gallery', '', '', './content/gallery/originals/autumn-12/DSC04353.JPG', '3473408', 'c6e2cfe6177dc0d7fc7340524839e822', '0', '2012-11-02 00:00:00');
INSERT INTO `files` VALUES ('279', 'gallery', '', '', './content/gallery/originals/autumn-12/DSC05415.JPG', '3276800', '9be74c26b892f78a9e810b06537696da', '0', '2012-11-17 00:00:00');
INSERT INTO `files` VALUES ('280', 'gallery', '', '', './content/gallery/originals/autumn-12/DSC05432.JPG', '624504', '9feab471aca940a7e447217481093a44', '0', '2012-11-17 00:00:00');
INSERT INTO `files` VALUES ('281', 'gallery', '', '', './content/gallery/originals/autumn-12/DSC05612.JPG', '626665', '1e23f6da03bb62c895502f680cd9ad8e', '0', '2012-11-17 00:00:00');
INSERT INTO `files` VALUES ('282', 'gallery', '', '', './content/gallery/originals/autumn-12/DSC05764.JPG', '569113', 'c48494dca825a30c0ba006826d54d05b', '0', '2012-11-17 00:00:00');
INSERT INTO `files` VALUES ('283', 'gallery', '', '', './content/gallery/originals/autumn-12/DSC06286.JPG', '724883', '6ce8f4c236f73b2948b17a84f9eafff7', '0', '2012-11-18 00:00:00');
INSERT INTO `files` VALUES ('284', 'gallery', '', '', './content/gallery/originals/autumn-12/DSC07901.jpg', '710535', '1995465450f1125ad29c241dd3fb2958', '1', '2012-11-24 00:00:00');
INSERT INTO `files` VALUES ('285', 'gallery', '', '', './content/gallery/originals/autumn-12/DSC07956.JPG', '637915', '1abb60eb587e519a449b8ec596977557', '0', '2012-11-24 00:00:00');
INSERT INTO `files` VALUES ('286', 'gallery', '', '', './content/gallery/originals/autumn-12/DSC08037.JPG', '637811', '54d88924fbf3eea71140b43193766b30', '0', '2012-11-24 00:00:00');
INSERT INTO `files` VALUES ('287', 'gallery', '', '', './content/gallery/originals/autumn-12/DSC08156.JPG', '599222', '1e1d3c8dd9882f0e9209f3f77c037a7c', '0', '2012-11-30 00:00:00');
INSERT INTO `files` VALUES ('288', 'gallery', '', '', './content/gallery/originals/autumn-12/DSC08190.JPG', '557415', 'e1cc62f23d3ffc516a8328f113d23a4d', '0', '2012-11-30 00:00:00');
INSERT INTO `files` VALUES ('289', 'gallery', '', '', './content/gallery/originals/autumn-12/DSC08836.JPG', '822264', 'd1f7c31d7001c42e4596fe995681abe6', '1', '2012-12-03 00:00:00');
INSERT INTO `files` VALUES ('290', 'gallery', '', '', './content/gallery/originals/autumn-12/DSC08868.JPG', '673543', '2e4b47eb0827140a97a69e7def4b3085', '0', '2012-12-05 00:00:00');
INSERT INTO `files` VALUES ('291', 'gallery', '', '', './content/gallery/originals/autumn-12/DSC08942.JPG', '978775', 'e116143931c2fd0845a8a64a313a51e3', '0', '2012-12-05 00:00:00');
INSERT INTO `files` VALUES ('292', 'gallery', '', '', './content/gallery/originals/autumn-12/DSC09163.jpg', '527638', 'b58162db2a12dad7e3deb53c79daf255', '0', '2012-12-19 00:00:00');
INSERT INTO `files` VALUES ('293', 'gallery', '', '', './content/gallery/originals/holland/2012-12-27_11-18-16.jpg', '817477', '2d207de83ee908a98585c4b78f3426c6', '0', '2012-12-27 00:00:00');
INSERT INTO `files` VALUES ('294', 'gallery', '', '', './content/gallery/originals/holland/2012-12-27_11-23-48.jpg', '1063081', 'e9b110728836928ed0ca05a9485e97b2', '0', '2012-12-27 00:00:00');
INSERT INTO `files` VALUES ('295', 'gallery', '', '', './content/gallery/originals/holland/2012-12-27_11-25-32.jpg', '986350', '9bf2e3c0f6e92ba52de1b4cc4dc08203', '0', '2012-12-27 00:00:00');
INSERT INTO `files` VALUES ('296', 'gallery', '', '', './content/gallery/originals/holland/2012-12-27_11-29-24.jpg', '1088078', '9d08466f29a3a23cbb74cda763cd3524', '0', '2012-12-27 00:00:00');
INSERT INTO `files` VALUES ('297', 'gallery', '', '', './content/gallery/originals/holland/2012-12-27_11-34-13.jpg', '2274590', '17eb1e76cd4a87f4b5c3f8e410ed0efb', '0', '2012-12-27 00:00:00');
INSERT INTO `files` VALUES ('298', 'gallery', '', '', './content/gallery/originals/holland/2012-12-27_12-14-40.jpg', '1072216', '625b60080d3107de73850fc740da0752', '0', '2012-12-27 00:00:00');
INSERT INTO `files` VALUES ('299', 'gallery', '', '', './content/gallery/originals/holland/2012-12-27_12-15-07.jpg', '1275258', '0e3bf4dac81ef982344d6ebef96187cc', '0', '2012-12-27 00:00:00');
INSERT INTO `files` VALUES ('300', 'gallery', '', '', './content/gallery/originals/holland/2012-12-27_17-05-23.jpg', '869720', '6ea717d88b097c38f5fb044240e46347', '0', '2012-12-27 00:00:00');
INSERT INTO `files` VALUES ('301', 'gallery', '', '', './content/gallery/originals/holland/2012-12-27_17-08-27.jpg', '969115', '5e8357daafc6caed50a2b27ae4459582', '0', '2012-12-27 00:00:00');
INSERT INTO `files` VALUES ('302', 'gallery', '', '', './content/gallery/originals/holland/2012-12-27_17-09-55.jpg', '1296689', 'e2024cf27b18b68650b7f261f7dff5f8', '0', '2012-12-27 00:00:00');
INSERT INTO `files` VALUES ('303', 'gallery', '', '', './content/gallery/originals/holland/2012-12-27_17-11-37.jpg', '1040390', '3f79f38979abbf6e6f688385506d43cc', '0', '2012-12-27 00:00:00');
INSERT INTO `files` VALUES ('304', 'gallery', '', '', './content/gallery/originals/holland/2012-12-27_17-21-50.jpg', '1075901', 'd2d7b8122c603b0d29253a3a9d1cea18', '0', '2012-12-27 00:00:00');
INSERT INTO `files` VALUES ('305', 'gallery', '', '', './content/gallery/originals/holland/2012-12-27_17-40-07.jpg', '1148571', '1d5c17c399921d9ef86ce02a45bf23e7', '0', '2012-12-27 00:00:00');
INSERT INTO `files` VALUES ('306', 'gallery', '', '', './content/gallery/originals/holland/2012-12-27_17-48-33.jpg', '786628', '4d95b5c2116a61847bbc6267b91b68e3', '0', '2012-12-27 00:00:00');
INSERT INTO `files` VALUES ('307', 'gallery', '', '', './content/gallery/originals/holland/2012-12-27_17-50-25.jpg', '1041585', '42653a1daac2d5b2b76061c6116b018f', '0', '2012-12-27 00:00:00');
INSERT INTO `files` VALUES ('308', 'gallery', '', '', './content/gallery/originals/holland/2012-12-27_21-04-39.jpg', '1184441', 'c8e4489ceb8df9d21f4d7f793917600e', '0', '2012-12-27 00:00:00');
INSERT INTO `files` VALUES ('309', 'gallery', '', '', './content/gallery/originals/holland/2012-12-28_14-14-45.jpg', '696259', 'f3c54d22a46240dfb655571b0c8d2393', '0', '2012-12-28 00:00:00');
INSERT INTO `files` VALUES ('310', 'gallery', '', '', './content/gallery/originals/holland/2012-12-29_11-08-21.jpg', '843820', 'bd8c8466a7d976723fd91f13a44a6ace', '0', '2012-12-29 00:00:00');
INSERT INTO `files` VALUES ('311', 'gallery', '', '', './content/gallery/originals/holland/2012-12-29_11-15-13.jpg', '1056814', 'a7085d3cb6a9df96b7f4a834c7981cf2', '0', '2012-12-29 00:00:00');
INSERT INTO `files` VALUES ('312', 'gallery', '', '', './content/gallery/originals/holland/2012-12-29_11-28-04.jpg', '1085400', 'bef405e93d1338eb7f2c6f7f6ea5b84f', '0', '2012-12-29 00:00:00');
INSERT INTO `files` VALUES ('313', 'gallery', '', '', './content/gallery/originals/holland/2012-12-29_11-28-13.jpg', '1095800', 'b8dfa834e7d945b1a6d616d9d09f262e', '0', '2012-12-29 00:00:00');
INSERT INTO `files` VALUES ('314', 'gallery', '', '', './content/gallery/originals/holland/2012-12-29_11-28-23.jpg', '1065508', '2669cf8640b06a0a118e14e397429a1b', '0', '2012-12-29 00:00:00');
INSERT INTO `files` VALUES ('315', 'gallery', '', '', './content/gallery/originals/holland/2012-12-29_11-43-55.jpg', '789179', '1012251856f1f05a57a8bb61c00b6f2a', '0', '2012-12-29 00:00:00');
INSERT INTO `files` VALUES ('316', 'gallery', '', '', './content/gallery/originals/holland/2012-12-29_11-44-13.jpg', '942271', 'fe5ba4b0699849bb5870439f48e87463', '0', '2012-12-29 00:00:00');
INSERT INTO `files` VALUES ('317', 'gallery', '', '', './content/gallery/originals/holland/2012-12-29_11-50-28.jpg', '791816', 'b2dc94b4193a7e6cf37b84062a288274', '0', '2012-12-29 00:00:00');
INSERT INTO `files` VALUES ('318', 'gallery', '', '', './content/gallery/originals/holland/2012-12-29_11-52-10.jpg', '811948', '1a0d2eec84b26633f12cacff9258fed1', '0', '2012-12-29 00:00:00');
INSERT INTO `files` VALUES ('319', 'gallery', '', '', './content/gallery/originals/holland/2012-12-29_11-52-22.jpg', '742881', '285be8effa188568689efaa3ba67a514', '0', '2012-12-29 00:00:00');
INSERT INTO `files` VALUES ('320', 'gallery', '', '', './content/gallery/originals/holland/2012-12-29_11-57-55.jpg', '1486628', '5ba1b1e35ee37d81015fcd2b2b490970', '0', '2012-12-29 00:00:00');
INSERT INTO `files` VALUES ('321', 'gallery', '', '', './content/gallery/originals/holland/2012-12-29_11-58-22.jpg', '1130217', '484b00e7bb7209e7ca66f353cbdd5d1d', '0', '2012-12-29 00:00:00');
INSERT INTO `files` VALUES ('322', 'gallery', '', '', './content/gallery/originals/holland/2012-12-29_12-01-42.jpg', '836079', '749d45ea6b1fc8f598922068020531c8', '0', '2012-12-29 00:00:00');
INSERT INTO `files` VALUES ('323', 'gallery', '', '', './content/gallery/originals/holland/2012-12-29_12-03-21.jpg', '1353746', '6a2827a2dede18e73fee811a473437e4', '0', '2012-12-29 00:00:00');
INSERT INTO `files` VALUES ('324', 'gallery', '', '', './content/gallery/originals/holland/2012-12-29_12-05-41.jpg', '698882', '483b708b91f7ecb6f2d7ef80e00e34b5', '0', '2012-12-29 00:00:00');
INSERT INTO `files` VALUES ('325', 'gallery', '', '', './content/gallery/originals/holland/2012-12-29_12-13-09.jpg', '995257', '22b83285cfdbeba7a9b6737d461d608e', '0', '2012-12-29 00:00:00');
INSERT INTO `files` VALUES ('326', 'gallery', '', '', './content/gallery/originals/holland/2012-12-29_12-13-48.jpg', '1158044', '21c2198feafb6348992b2f2d2ae76a52', '0', '2012-12-29 00:00:00');
INSERT INTO `files` VALUES ('327', 'gallery', '', '', './content/gallery/originals/holland/2012-12-29_12-13-50.jpg', '1082066', '72f175fd1ed93cfaf8fa821b4de77036', '0', '2012-12-29 00:00:00');
INSERT INTO `files` VALUES ('328', 'gallery', '', '', './content/gallery/originals/holland/2012-12-29_12-14-49.jpg', '829005', '8d742821472807aa28c6da09afb8be28', '0', '2012-12-29 00:00:00');
INSERT INTO `files` VALUES ('329', 'gallery', '', '', './content/gallery/originals/holland/2012-12-29_12-15-06.jpg', '1042526', '7dce83d75315adda5235690dde37d2c9', '0', '2012-12-29 00:00:00');
INSERT INTO `files` VALUES ('330', 'gallery', '', '', './content/gallery/originals/holland/2012-12-29_12-15-15.jpg', '802773', '053445ded386ddd4617a0667ec2c868e', '0', '2012-12-29 00:00:00');
INSERT INTO `files` VALUES ('331', 'gallery', '', '', './content/gallery/originals/holland/2012-12-29_12-24-59.jpg', '1126476', '34d36c0d22b21d3255e49f4986033ff6', '0', '2012-12-29 00:00:00');
INSERT INTO `files` VALUES ('332', 'gallery', '', '', './content/gallery/originals/holland/2012-12-29_12-25-06.jpg', '1220488', '4cf4ebe152b56b6df91dfbe4a3b5b64c', '0', '2012-12-29 00:00:00');
INSERT INTO `files` VALUES ('333', 'gallery', '', '', './content/gallery/originals/holland/2012-12-29_13-31-18.jpg', '1085400', 'ce0a6394efd10debc0a10c1e95604bef', '0', '2012-12-29 00:00:00');
INSERT INTO `files` VALUES ('334', 'gallery', '', '', './content/gallery/originals/holland/2012-12-29_13-34-14.jpg', '1339065', '7c79d2b040fc110e78d14a1e7f9fbf19', '0', '2012-12-29 00:00:00');
INSERT INTO `files` VALUES ('335', 'gallery', '', '', './content/gallery/originals/holland/2012-12-29_13-36-49.jpg', '1017728', '6604a72904e4a32be3eeff343d704943', '0', '2012-12-29 00:00:00');
INSERT INTO `files` VALUES ('336', 'gallery', '', '', './content/gallery/originals/holland/2012-12-29_13-37-49.jpg', '1020377', '4ede0985697d618396a213f8ea790de0', '0', '2012-12-29 00:00:00');
INSERT INTO `files` VALUES ('337', 'gallery', '', '', './content/gallery/originals/holland/2012-12-29_13-39-44.jpg', '1355237', '79e0219f948eb388aadc5c0b657a4f95', '0', '2012-12-29 00:00:00');
INSERT INTO `files` VALUES ('338', 'gallery', '', '', './content/gallery/originals/holland/2012-12-29_13-39-52.jpg', '1398485', 'b335597331fa09b077d8fc8d98d1f708', '0', '2012-12-29 00:00:00');
INSERT INTO `files` VALUES ('339', 'gallery', '', '', './content/gallery/originals/holland/2012-12-29_13-40-24.jpg', '1179418', '5d77577bff1b32d7a69654d0776662f7', '0', '2012-12-29 00:00:00');
INSERT INTO `files` VALUES ('340', 'gallery', '', '', './content/gallery/originals/holland/2012-12-29_13-48-45.jpg', '879790', '6cef8eaf3cb22c76d79fa0c1f0e6beb9', '0', '2012-12-29 00:00:00');
INSERT INTO `files` VALUES ('341', 'gallery', '', '', './content/gallery/originals/holland/2012-12-29_13-50-53.jpg', '905266', '135311b5bd57d646c2e69ac89f5902fb', '0', '2012-12-29 00:00:00');
INSERT INTO `files` VALUES ('342', 'gallery', '', '', './content/gallery/originals/holland/2012-12-29_13-52-55.jpg', '900463', '0c2d5055fab0103f35490190c366037a', '0', '2012-12-29 00:00:00');
INSERT INTO `files` VALUES ('343', 'gallery', '', '', './content/gallery/originals/holland/2012-12-29_13-57-58.jpg', '1022634', '28e3e9b2e02a45a28b526db46afae83f', '0', '2012-12-29 00:00:00');
INSERT INTO `files` VALUES ('344', 'gallery', '', '', './content/gallery/originals/holland/2012-12-29_13-58-19.jpg', '1201715', 'aa127f25bfbffed0c9e7a412bb1b7f33', '0', '2012-12-29 00:00:00');
INSERT INTO `files` VALUES ('345', 'gallery', '', '', './content/gallery/originals/holland/2012-12-29_14-34-42.jpg', '978788', '2a8bbed752bff1b7e358c8ea5d09c216', '0', '2012-12-29 00:00:00');
INSERT INTO `files` VALUES ('346', 'gallery', '', '', './content/gallery/originals/holland/2012-12-29_14-44-10.jpg', '1483636', 'f1ece34a283d7baaa0109d670397b812', '0', '2012-12-29 00:00:00');
INSERT INTO `files` VALUES ('347', 'gallery', '', '', './content/gallery/originals/holland/2012-12-29_15-29-12.jpg', '1288624', 'f6918fb6dbbd0324f1f61f8b72b73d7b', '0', '2012-12-29 00:00:00');
INSERT INTO `files` VALUES ('348', 'gallery', '', '', './content/gallery/originals/holland/2012-12-29_15-29-50.jpg', '1217620', '213d449c4966c6e6dbec56a205175561', '0', '2012-12-29 00:00:00');
INSERT INTO `files` VALUES ('349', 'gallery', '', '', './content/gallery/originals/holland/2012-12-29_15-30-49.jpg', '1172073', 'f86b7518c8d69e4c9e19d0a067585938', '0', '2012-12-29 00:00:00');
INSERT INTO `files` VALUES ('350', 'gallery', '', '', './content/gallery/originals/holland/2012-12-29_18-10-36.jpg', '845510', '46206ebdc49466320b5750367ca0f3d2', '0', '2012-12-29 00:00:00');
INSERT INTO `files` VALUES ('351', 'gallery', '', '', './content/gallery/originals/holland/2012-12-29_18-11-04.jpg', '916403', '1e883430bcc85920b2e70888338568ad', '0', '2012-12-29 00:00:00');
INSERT INTO `files` VALUES ('352', 'gallery', '', '', './content/gallery/originals/holland/2012-12-29_19-30-18.jpg', '821698', 'e81de8691d762eb106ed37d273f501c6', '0', '2012-12-29 00:00:00');
INSERT INTO `files` VALUES ('353', 'gallery', '', '', './content/gallery/originals/holland/2012-12-30_12-01-22.jpg', '804377', 'b3ff3aa6900b7166daaa759a93b5ae2c', '0', '2012-12-30 00:00:00');
INSERT INTO `files` VALUES ('354', 'gallery', '', '', './content/gallery/originals/holland/2012-12-30_13-12-44.jpg', '1190596', '624dda260f5e8e0558f088659dc971b6', '0', '2012-12-30 00:00:00');
INSERT INTO `files` VALUES ('355', 'gallery', '', '', './content/gallery/originals/holland/2012-12-30_13-17-22.jpg', '862982', '2d0c7799f6ccc7b3ddddb4b8c3eb071f', '0', '2012-12-30 00:00:00');
INSERT INTO `files` VALUES ('356', 'gallery', '', '', './content/gallery/originals/holland/2012-12-30_17-19-09.jpg', '1021823', '537555ac76ed89d0c1dcccd20da89288', '0', '2012-12-30 00:00:00');
INSERT INTO `files` VALUES ('357', 'gallery', '', '', './content/gallery/originals/holland/2012-12-30_17-19-45.jpg', '946532', 'b3ef1c501604ddf68842a3776098b8aa', '0', '2012-12-30 00:00:00');
INSERT INTO `files` VALUES ('358', 'gallery', '', '', './content/gallery/originals/holland/2012-12-30_17-20-30.jpg', '1052754', '6c31f6f27ff1fa505bff45f471e8ba34', '0', '2012-12-30 00:00:00');
INSERT INTO `files` VALUES ('359', 'gallery', '', '', './content/gallery/originals/holland/2012-12-30_17-23-13.jpg', '1015426', '53fe8ea4069ee653159b11aa58857cf0', '0', '2012-12-30 00:00:00');
INSERT INTO `files` VALUES ('360', 'gallery', '', '', './content/gallery/originals/holland/2012-12-30_17-24-44.jpg', '1136240', '808c3f2376dedd1194c4b209b1e124a5', '0', '2012-12-30 00:00:00');
INSERT INTO `files` VALUES ('361', 'gallery', '', '', './content/gallery/originals/holland/2012-12-30_17-50-54.jpg', '829710', '3d604ddfb5fcc06f94ade034a897de40', '0', '2012-12-30 00:00:00');
INSERT INTO `files` VALUES ('362', 'gallery', '', '', './content/gallery/originals/holland/2012-12-30_17-51-16.jpg', '613291', '388fa7f9b802463a5e00c9853644728f', '0', '2012-12-30 00:00:00');
INSERT INTO `files` VALUES ('363', 'gallery', '', '', './content/gallery/originals/holland/2012-12-30_17-52-05.jpg', '1176459', 'cad8fca0cc2fbe6db25adfe707c5e9ab', '0', '2012-12-30 00:00:00');
INSERT INTO `files` VALUES ('364', 'gallery', '', '', './content/gallery/originals/holland/2012-12-31_15-31-22.jpg', '1247440', 'f8d8c03066eef4e47c9837b288ea7914', '0', '2012-12-31 00:00:00');
INSERT INTO `files` VALUES ('365', 'gallery', '', '', './content/gallery/originals/holland/2012-12-31_15-42-23.jpg', '1095037', '094c9de37ec5646aaf40f07fd361120d', '0', '2012-12-31 00:00:00');
INSERT INTO `files` VALUES ('366', 'gallery', '', '', './content/gallery/originals/holland/2012-12-31_15-42-33.jpg', '1135136', '52a08290679b54252b0f44c804c942ed', '0', '2012-12-31 00:00:00');
INSERT INTO `files` VALUES ('367', 'gallery', '', '', './content/gallery/originals/holland/2012-12-31_15-42-49.jpg', '1145333', '4a6e481566d4bb3d0e1aee884f53b65b', '0', '2012-12-31 00:00:00');
INSERT INTO `files` VALUES ('368', 'gallery', '', '', './content/gallery/originals/holland/2012-12-31_15-44-26.jpg', '1053026', 'ccf2c50d3196e46ccf1eda4b974c2e7c', '0', '2012-12-31 00:00:00');
INSERT INTO `files` VALUES ('369', 'gallery', '', '', './content/gallery/originals/holland/2012-12-31_16-57-59.jpg', '1119849', '724a4540f0146dcfc0f5dc88e2155610', '0', '2012-12-31 00:00:00');
INSERT INTO `files` VALUES ('370', 'gallery', '', '', './content/gallery/originals/holland/2012-12-31_16-58-06.jpg', '920942', '08f0156fadc19f00ea972a7268ee3ae4', '0', '2012-12-31 00:00:00');
INSERT INTO `files` VALUES ('371', 'gallery', '', '', './content/gallery/originals/holland/2012-12-31_16-58-55.jpg', '794931', '0f81cf931cd0f349c662162677060439', '0', '2012-12-31 00:00:00');
INSERT INTO `files` VALUES ('372', 'gallery', '', '', './content/gallery/originals/holland/2012-12-31_16-59-01.jpg', '1068296', '9aa2163c5b2422f0bb8c86bf30723f2f', '0', '2012-12-31 00:00:00');
INSERT INTO `files` VALUES ('373', 'gallery', '', '', './content/gallery/originals/holland/2012-12-31_16-59-18.jpg', '1122900', '0f5b3b1bd683ae5783cd4a49a662f2cd', '0', '2012-12-31 00:00:00');
INSERT INTO `files` VALUES ('374', 'gallery', '', '', './content/gallery/originals/holland/2012-12-31_17-00-04.jpg', '975467', '54ae9fe4140fac2298b02a86bebb9b35', '0', '2012-12-31 00:00:00');
INSERT INTO `files` VALUES ('375', 'gallery', '', '', './content/gallery/originals/holland/2012-12-31_17-02-10.jpg', '1119900', 'bbed3d62454804199374baad4a4249c8', '0', '2012-12-31 00:00:00');
INSERT INTO `files` VALUES ('376', 'gallery', '', '', './content/gallery/originals/holland/2012-12-31_17-06-37.jpg', '1200947', 'bf30079fcdd55c8bea55029e3c1b47ef', '0', '2012-12-31 00:00:00');
INSERT INTO `files` VALUES ('377', 'gallery', '', '', './content/gallery/originals/holland/2012-12-31_17-07-24.jpg', '1011138', '55e03c4a59a60da7ba25045d77fc7e98', '0', '2012-12-31 00:00:00');
INSERT INTO `files` VALUES ('378', 'gallery', '', '', './content/gallery/originals/holland/2012-12-31_17-12-53.jpg', '1025109', '081710ca9956900ba6a8230b91a31bb0', '0', '2012-12-31 00:00:00');
INSERT INTO `files` VALUES ('379', 'gallery', '', '', './content/gallery/originals/holland/2012-12-31_17-13-26.jpg', '1094457', '94eaceaeca91567486dba50806da21d4', '0', '2012-12-31 00:00:00');
INSERT INTO `files` VALUES ('380', 'gallery', '', '', './content/gallery/originals/holland/2012-12-31_17-13-33.jpg', '1313786', '54ec3ff807489bba28641d418289f884', '0', '2012-12-31 00:00:00');
INSERT INTO `files` VALUES ('381', 'gallery', '', '', './content/gallery/originals/holland/2012-12-31_17-15-29.jpg', '1097386', '0990a33e78d5349b381344f5f57c9dac', '0', '2012-12-31 00:00:00');
INSERT INTO `files` VALUES ('382', 'gallery', '', '', './content/gallery/originals/holland/2012-12-31_17-17-52.jpg', '1150991', 'b1d192454c2bfa570537573942269ce3', '0', '2012-12-31 00:00:00');
INSERT INTO `files` VALUES ('383', 'gallery', '', '', './content/gallery/originals/holland/2013-01-02_14-45-43.jpg', '1201994', '26a7bc03d4338598c1b463df357e04dc', '0', '2013-01-02 00:00:00');
INSERT INTO `files` VALUES ('384', 'gallery', '', '', './content/gallery/originals/holland/2013-01-02_14-45-45.jpg', '1160311', '0776ede3c1a5921726b8581ee4f6b88b', '0', '2013-01-02 00:00:00');
INSERT INTO `files` VALUES ('385', 'gallery', '', '', './content/gallery/originals/holland/2013-01-02_15-10-20.jpg', '936697', '68926c91776db77a796df255eb5a23bd', '0', '2013-01-02 00:00:00');
INSERT INTO `files` VALUES ('386', 'gallery', '', '', './content/gallery/originals/holland/2013-01-02_15-11-57.jpg', '1057187', '1f6b63ffb3ab924e74ab65bab15bc719', '0', '2013-01-02 00:00:00');
INSERT INTO `files` VALUES ('387', 'gallery', '', '', './content/gallery/originals/holland/2013-01-02_15-39-24.jpg', '1072342', 'a8af4a1a14f765893be66bf7fdf69595', '0', '2013-01-02 00:00:00');
INSERT INTO `files` VALUES ('388', 'gallery', '', '', './content/gallery/originals/holland/2013-01-02_15-40-34.jpg', '1215229', 'e6b2c99ea77f3b37d2114b451137a6be', '0', '2013-01-02 00:00:00');
INSERT INTO `files` VALUES ('389', 'gallery', '', '', './content/gallery/originals/holland/2013-01-02_15-40-40.jpg', '1071748', 'f4ca524c8768927610e4a4068b998fc7', '0', '2013-01-02 00:00:00');
INSERT INTO `files` VALUES ('390', 'gallery', '', '', './content/gallery/originals/holland/2013-01-02_15-40-49.jpg', '1092081', '6f504afd008c2b8a19c37476d1bd6e21', '0', '2013-01-02 00:00:00');
INSERT INTO `files` VALUES ('391', 'gallery', '', '', './content/gallery/originals/holland/2013-01-02_15-42-30.jpg', '1010112', 'c03e7a8f7b8fc233a406db9fffae1890', '0', '2013-01-02 00:00:00');
INSERT INTO `files` VALUES ('392', 'gallery', '', '', './content/gallery/originals/holland/2013-01-02_15-43-15.jpg', '1323492', '8ac898eb54d7386d1442ab36a7d63991', '0', '2013-01-02 00:00:00');
INSERT INTO `files` VALUES ('393', 'gallery', '', '', './content/gallery/originals/holland/2013-01-02_15-43-22.jpg', '1417995', 'ea20b23a2ad934436dcc3c03d76e9235', '0', '2013-01-02 00:00:00');
INSERT INTO `files` VALUES ('394', 'gallery', '', '', './content/gallery/originals/holland/2013-01-02_15-43-31.jpg', '1411888', '1c3adde69003d4aa61990892f644fe33', '0', '2013-01-02 00:00:00');
INSERT INTO `files` VALUES ('395', 'gallery', '', '', './content/gallery/originals/holland/2013-01-02_15-43-52.jpg', '1094891', '4fb40a5e182632e844c16df9e99571db', '0', '2013-01-02 00:00:00');
INSERT INTO `files` VALUES ('396', 'gallery', '', '', './content/gallery/originals/holland/2013-01-02_15-46-11.jpg', '1222777', '4b3e8b524d914913cfedcbaf3b6eebde', '0', '2013-01-02 00:00:00');
INSERT INTO `files` VALUES ('397', 'gallery', '', '', './content/gallery/originals/holland/2013-01-02_15-49-27.jpg', '954386', '2340c589edb7593636e1902f37668efb', '0', '2013-01-02 00:00:00');
INSERT INTO `files` VALUES ('398', 'gallery', '', '', './content/gallery/originals/holland/2013-01-02_15-54-38.jpg', '1295318', '636c74ffde98643a7078b9e09cb31bdd', '0', '2013-01-02 00:00:00');
INSERT INTO `files` VALUES ('399', 'gallery', '', '', './content/gallery/originals/holland/2013-01-02_15-56-23.jpg', '1192514', 'ed6159ec26c4418154727f969ee8c241', '0', '2013-01-02 00:00:00');
INSERT INTO `files` VALUES ('400', 'gallery', '', '', './content/gallery/originals/holland/2013-01-02_16-04-01.jpg', '1192786', '02bdfc3089700ee8f486f4de17ef8ecc', '0', '2013-01-02 00:00:00');
INSERT INTO `files` VALUES ('401', 'gallery', '', '', './content/gallery/originals/holland/2013-01-02_16-08-37.jpg', '937246', 'd8e5318994091eb89d80fddd72160901', '0', '2013-01-02 00:00:00');
INSERT INTO `files` VALUES ('402', 'gallery', '', '', './content/gallery/originals/holland/2013-01-02_16-10-51.jpg', '774568', '00d1842f5294593fe5d032c61e6d9475', '0', '2013-01-02 00:00:00');
INSERT INTO `files` VALUES ('403', 'gallery', '', '', './content/gallery/originals/holland/2013-01-02_16-35-34.jpg', '1291371', '2cb287a692aa141f187ea835c6f9c47c', '0', '2013-01-02 00:00:00');
INSERT INTO `files` VALUES ('404', 'gallery', '', '', './content/gallery/originals/holland/2013-01-02_16-36-29.jpg', '1140819', '929c5f5b8117d9dc46bd201c23451ec2', '0', '2013-01-02 00:00:00');
INSERT INTO `files` VALUES ('405', 'gallery', '', '', './content/gallery/originals/holland/2013-01-02_16-36-45.jpg', '1052979', '6b58313ccb5c2cde4631821277e66b56', '0', '2013-01-02 00:00:00');
INSERT INTO `files` VALUES ('406', 'gallery', '', '', './content/gallery/originals/holland/2013-01-02_16-36-59.jpg', '1093282', '9ba528e9856f046416b79a5eb5d0a298', '0', '2013-01-02 00:00:00');
INSERT INTO `files` VALUES ('407', 'gallery', '', '', './content/gallery/originals/holland/2013-01-02_16-38-39.jpg', '924465', '378b80411a7d909265870f0fbe0353ee', '0', '2013-01-02 00:00:00');
INSERT INTO `files` VALUES ('408', 'gallery', '', '', './content/gallery/originals/holland/2013-01-02_16-39-03.jpg', '1001375', '857690d3447549239cf440479db203b8', '0', '2013-01-02 00:00:00');
INSERT INTO `files` VALUES ('409', 'gallery', '', '', './content/gallery/originals/holland/2013-01-02_16-41-11.jpg', '1317017', 'e36ebce4329421333b78fe9230ff68fb', '0', '2013-01-02 00:00:00');
INSERT INTO `files` VALUES ('410', 'gallery', '', '', './content/gallery/originals/holland/2013-01-02_16-41-15.jpg', '1298723', '38d0df0e13e7ca2301e026a6f80a9206', '0', '2013-01-02 00:00:00');
INSERT INTO `files` VALUES ('411', 'gallery', '', '', './content/gallery/originals/holland/2013-01-02_16-41-19.jpg', '1296513', 'e42aa569f2df2d90d549524722483980', '0', '2013-01-02 00:00:00');
INSERT INTO `files` VALUES ('412', 'gallery', '', '', './content/gallery/originals/holland/2013-01-02_17-20-17.jpg', '1095422', '8cfe7f79abc78dd077b13f85a5c7c7b9', '0', '2013-01-02 00:00:00');
INSERT INTO `files` VALUES ('413', 'gallery', '', '', './content/gallery/originals/holland/2013-01-02_17-20-45.jpg', '987675', '0ab0998f9622580c2476633114c6d0fe', '0', '2013-01-02 00:00:00');
INSERT INTO `files` VALUES ('414', 'gallery', '', '', './content/gallery/originals/holland/2013-01-03_02-56-35.jpg', '913575', '810315ea0ac50815a9b19e907dbf9d37', '0', '2013-01-03 00:00:00');
INSERT INTO `files` VALUES ('415', 'gallery', '', '', './content/gallery/originals/holland/2013-01-03_19-23-14.jpg', '901783', '907da5d625b28a05e01284b4196599ed', '0', '2013-01-03 00:00:00');
INSERT INTO `files` VALUES ('416', 'gallery', '', '', './content/gallery/originals/holland/2013-01-04_14-13-57.jpg', '867741', 'c76f8261324e891321549476c615f326', '0', '2013-01-04 00:00:00');
INSERT INTO `files` VALUES ('417', 'gallery', '', '', './content/gallery/originals/holland/2013-01-04_14-16-58.jpg', '978313', '12c94039b40403eb920c451781375011', '0', '2013-01-04 00:00:00');
INSERT INTO `files` VALUES ('418', 'gallery', '', '', './content/gallery/originals/holland/2013-01-04_14-23-13.jpg', '1073917', '4b777a9c0afa9f3cb23969e6f24713cd', '0', '2013-01-04 00:00:00');
INSERT INTO `files` VALUES ('419', 'gallery', '', '', './content/gallery/originals/holland/2013-01-04_14-25-16.jpg', '1209050', 'a63d69e78f01c3990d059127f4e2ba9b', '0', '2013-01-04 00:00:00');
INSERT INTO `files` VALUES ('420', 'gallery', '', '', './content/gallery/originals/holland/2013-01-04_14-27-43.jpg', '1182564', 'd940db19bd6e1983ce38067953cfea73', '0', '2013-01-04 00:00:00');
INSERT INTO `files` VALUES ('421', 'gallery', '', '', './content/gallery/originals/holland/2013-01-04_14-29-10.jpg', '988297', '54fa402fed0105ce64a6366f6e51a925', '0', '2013-01-04 00:00:00');
INSERT INTO `files` VALUES ('422', 'gallery', '', '', './content/gallery/originals/holland/2013-01-04_14-29-55.jpg', '1216995', '7373f489ad006322ccdd1b2485e126b6', '0', '2013-01-04 00:00:00');
INSERT INTO `files` VALUES ('423', 'gallery', '', '', './content/gallery/originals/holland/2013-01-04_14-30-23.jpg', '1063359', '215bf3085ef8cede86d45bf8f5330a82', '0', '2013-01-04 00:00:00');
INSERT INTO `files` VALUES ('424', 'gallery', '', '', './content/gallery/originals/holland/2013-01-04_14-34-40.jpg', '1130292', '4dd896503872b709d841399fecef1521', '0', '2013-01-04 00:00:00');
INSERT INTO `files` VALUES ('425', 'gallery', '', '', './content/gallery/originals/holland/2013-01-04_14-36-33.jpg', '724067', 'edf6d626692950c75aaa32fb1a3861bf', '0', '2013-01-04 00:00:00');
INSERT INTO `files` VALUES ('426', 'gallery', '', '', './content/gallery/originals/holland/2013-01-04_14-37-46.jpg', '807690', '2e124043021723ea8d5186ef077dd5e9', '0', '2013-01-04 00:00:00');
INSERT INTO `files` VALUES ('427', 'gallery', '', '', './content/gallery/originals/holland/2013-01-04_14-38-06.jpg', '1125940', 'e34b86780ac2647520a78ab29d221732', '0', '2013-01-04 00:00:00');
INSERT INTO `files` VALUES ('428', 'gallery', '', '', './content/gallery/originals/holland/2013-01-04_14-39-01.jpg', '957182', 'e01d8005b5db4e983e1d3e093d6be9b0', '0', '2013-01-04 00:00:00');
INSERT INTO `files` VALUES ('429', 'gallery', '', '', './content/gallery/originals/holland/2013-01-04_14-40-34.jpg', '1047847', '82e02bd79871811d997b22229f705852', '0', '2013-01-04 00:00:00');
INSERT INTO `files` VALUES ('430', 'gallery', '', '', './content/gallery/originals/holland/2013-01-04_14-42-24.jpg', '796519', '240a73cd776e7721f6602abd3dd44d5c', '0', '2013-01-04 00:00:00');
INSERT INTO `files` VALUES ('431', 'gallery', '', '', './content/gallery/originals/holland/2013-01-04_14-45-51.jpg', '1058343', 'ea98e1118332ff8b469f62c74291c300', '0', '2013-01-04 00:00:00');
INSERT INTO `files` VALUES ('432', 'gallery', '', '', './content/gallery/originals/holland/2013-01-04_15-15-05.jpg', '1178930', '4bda8395c9b0290a8670472b7e024ba9', '0', '2013-01-04 00:00:00');
INSERT INTO `files` VALUES ('433', 'gallery', '', '', './content/gallery/originals/spring-13/_DSC2157.jpg', '714407', '291e8f6c3227181c1ab624ed5019a3ef', '0', '2013-02-11 00:00:00');
INSERT INTO `files` VALUES ('434', 'gallery', '', '', './content/gallery/originals/spring-13/_DSC2809.jpg', '728134', '074e4c6b00c9b04a6bd0c7bc26804985', '0', '2013-02-24 00:00:00');
INSERT INTO `files` VALUES ('435', 'gallery', '', '', './content/gallery/originals/spring-13/_DSC3173.JPG', '686888', '19646728feba521f14662d353e963566', '0', '2013-03-02 00:00:00');
INSERT INTO `files` VALUES ('436', 'gallery', '', '', './content/gallery/originals/spring-13/_DSC3362.jpg', '914876', '1219ed74e9382521a636622892aacb23', '0', '2013-03-11 00:00:00');
INSERT INTO `files` VALUES ('437', 'gallery', '', '', './content/gallery/originals/spring-13/_DSC3397.jpg', '612435', 'a5d160b3c9a651922319731cd5571a16', '0', '2013-03-11 00:00:00');
INSERT INTO `files` VALUES ('438', 'gallery', '', '', './content/gallery/originals/spring-13/_DSC3429.jpg', '521560', '89ba5ed74e8fa2c40f25f66cd8c62deb', '0', '2013-03-11 00:00:00');
INSERT INTO `files` VALUES ('439', 'gallery', '', '', './content/gallery/originals/spring-13/_DSC3533.jpg', '563152', '041e6313edeb9d1e82555d1ddb76b261', '0', '2013-03-11 00:00:00');
INSERT INTO `files` VALUES ('440', 'gallery', '', '', './content/gallery/originals/spring-13/_DSC3578.jpg', '503072', '23d8e90539a0973c6fcd3b07a51c7236', '0', '2013-03-11 00:00:00');
INSERT INTO `files` VALUES ('441', 'gallery', '', '', './content/gallery/originals/spring-13/_DSC3706.jpg', '980253', 'd5ae8ec46fb25eb11b4ce73f8784dc2c', '1', '2013-03-14 00:00:00');
INSERT INTO `files` VALUES ('442', 'gallery', '', '', './content/gallery/originals/spring-13/_DSC3767.JPG', '499831', '087555cc7bbafd0c11f5e1fe8fe9c425', '2', '2013-03-14 00:00:00');
INSERT INTO `files` VALUES ('443', 'gallery', '', '', './content/gallery/originals/spring-13/_DSC3916.JPG', '475548', '54cf7330495c6bb067504617f47fb444', '0', '2013-03-16 00:00:00');
INSERT INTO `files` VALUES ('444', 'gallery', '', '', './content/gallery/originals/spring-13/_DSC4025.jpg', '758003', '6f3deb6385ec2b850caf1367bf31069c', '0', '2013-03-25 00:00:00');
INSERT INTO `files` VALUES ('445', 'gallery', '', '', './content/gallery/originals/winter-13/DSC04343.jpg', '669646', '0c62d06a9eed49e44ad4b76db889547e', '0', '2012-12-04 00:00:00');
INSERT INTO `files` VALUES ('446', 'gallery', '', '', './content/gallery/originals/winter-13/DSC05187.JPG', '624109', '0c54efdab4a76a6ae1467fe0f6444e91', '0', '2012-12-04 00:00:00');
INSERT INTO `files` VALUES ('447', 'gallery', '', '', './content/gallery/originals/winter-13/DSC05442.JPG', '647578', 'ab5f54d75bc170b495f796beab38767c', '0', '2012-11-17 00:00:00');
INSERT INTO `files` VALUES ('448', 'gallery', '', '', './content/gallery/originals/winter-13/DSC06631.jpg', '621399', 'b14d9e89cec981c28f08060e5490e608', '0', '2012-11-18 00:00:00');
INSERT INTO `files` VALUES ('449', 'gallery', '', '', './content/gallery/originals/winter-13/DSC07946.JPG', '970658', 'aa994492d3dfe16fe590bbc04f4ffbf9', '0', '2012-11-24 00:00:00');
INSERT INTO `files` VALUES ('450', 'gallery', '', '', './content/gallery/originals/winter-13/DSC09013.JPG', '779764', '59a0f867c5fdbb2529b60877ca56479d', '0', '2012-12-08 00:00:00');
INSERT INTO `files` VALUES ('451', 'gallery', '', '', './content/gallery/originals/winter-13/DSC09028.JPG', '709585', 'db74c8dc1abc7acf3108cf474f0f4e93', '0', '2012-12-08 00:00:00');
INSERT INTO `files` VALUES ('452', 'gallery', '', '', './content/gallery/originals/winter-13/_DSC1594.jpg', '691932', 'a465f3dd273c9ef2f6ca78d621be674f', '0', '2013-01-27 00:00:00');
INSERT INTO `files` VALUES ('453', 'gallery', '', '', './content/gallery/originals/winter-13/_DSC1661.jpg', '913937', '7061f1d7c9b8be4f2c90816f0a950a8c', '0', '2013-01-27 00:00:00');
INSERT INTO `files` VALUES ('454', 'gallery', '', '', './content/gallery/originals/winter-13/_DSC1738.jpg', '649422', 'ddd971fc6146430ddc2f479463dbb2cb', '0', '2013-01-27 00:00:00');
INSERT INTO `files` VALUES ('455', 'gallery', '', '', './content/gallery/originals/winter-13/_DSC1810.jpg', '582186', '3f7a60d78e39e4e9960ff01a68e6640a', '0', '2013-02-02 00:00:00');
INSERT INTO `files` VALUES ('456', 'gallery', '', '', './content/gallery/originals/winter-13/_DSC2611.jpg', '901806', '37a0bb54422ff7c9cf5ef53eeee3ceb8', '0', '2013-02-18 00:00:00');
INSERT INTO `files` VALUES ('457', 'gallery', '', '', './content/gallery/originals/winter-13/_DSC2646.JPG', '594528', '9a0077cf58b22f84edf838d43a8de0fa', '0', '2013-02-23 00:00:00');
INSERT INTO `files` VALUES ('458', 'gallery', '', '', './content/gallery/originals/winter-13/_DSC2826.JPG', '800310', '4e023c9cb2b856bcad6ed510c3299de7', '0', '2013-02-24 00:00:00');
INSERT INTO `files` VALUES ('459', 'gallery', '', '', './content/gallery/originals/z-xx/DSC03719.JPG', '3142244', 'd4f6604c623f88c4036c649db99fa1d5', '0', '2012-08-14 00:00:00');
INSERT INTO `files` VALUES ('460', 'gallery', '', '', './content/gallery/originals/z-xx/DSC03732.JPG', '3168093', '2109f1533d5bf4eee88ab1691b5dac51', '0', '2012-08-14 00:00:00');
INSERT INTO `files` VALUES ('461', 'gallery', '', '', './content/gallery/originals/z-xx/DSC03738.JPG', '2831762', 'fbdae9277908323e6001b6a0cc9ec764', '0', '2012-08-14 00:00:00');
INSERT INTO `files` VALUES ('462', 'gallery', '', '', './content/gallery/originals/z-xx/DSC03744.JPG', '3381272', '7a198c76bb5728c9d45c79ba405cf567', '0', '2012-08-14 00:00:00');
INSERT INTO `files` VALUES ('463', 'gallery', '', '', './content/gallery/originals/z-xx/DSC03748.JPG', '3370819', '82977d4802d4194253b2a3ce379bc86a', '0', '2012-08-14 00:00:00');
INSERT INTO `files` VALUES ('464', 'gallery', '', '', './content/gallery/originals/z-xx/DSC03754.JPG', '3177483', '3bcb3e259118e41e1a5a54f929fd1fdb', '0', '2012-08-14 00:00:00');
INSERT INTO `files` VALUES ('465', 'gallery', '', '', './content/gallery/originals/z-xx/DSC03760.JPG', '3252204', '83566042c5df4e257e5f1ca30643c3f6', '0', '2012-08-14 00:00:00');
INSERT INTO `files` VALUES ('466', 'gallery', '', '', './content/gallery/originals/z-xx/DSC03774.JPG', '3446442', '2262fd60563fbbaf734c416e19231dd2', '0', '2012-08-14 00:00:00');
INSERT INTO `files` VALUES ('467', 'gallery', '', '', './content/gallery/originals/z-xx/DSC03780.JPG', '2780405', '192c5f8b1f1a4cd0187c2b0ee774b188', '0', '2012-08-14 00:00:00');
INSERT INTO `files` VALUES ('468', 'gallery', '', '', './content/gallery/originals/z-xx/DSC03785.JPG', '3125602', 'b9f18c14f694324083ad12a3b760f6cc', '0', '2012-08-14 00:00:00');
INSERT INTO `files` VALUES ('469', 'gallery', '', '', './content/gallery/originals/z-xx/DSC03790.JPG', '3159787', '5f8651d339b4af96662abd235a87336a', '0', '2012-08-14 00:00:00');
INSERT INTO `files` VALUES ('470', 'gallery', '', '', './content/gallery/originals/z-xx/DSC03806.JPG', '3230606', '6a2d93b4454022e4d31be942e2431521', '0', '2012-08-14 00:00:00');
INSERT INTO `files` VALUES ('471', 'gallery', '', '', './content/gallery/originals/z-xx/DSC03827.JPG', '2941175', 'eaefca01be03e123f940c9b00498b644', '0', '2012-08-15 00:00:00');
INSERT INTO `files` VALUES ('472', 'gallery', '', '', './content/gallery/originals/z-xx/DSC03879.JPG', '2720286', '8aa2d740c127f7fd2d99ad0cd61733b4', '0', '2012-08-15 00:00:00');
INSERT INTO `files` VALUES ('473', 'gallery', '', '', './content/gallery/originals/z-xx/DSC03880.JPG', '2832996', '80e54c328e0c51c76f29d187518a8577', '0', '2012-08-15 00:00:00');
INSERT INTO `files` VALUES ('474', 'gallery', '', '', './content/gallery/originals/z-xx/DSC03890.JPG', '3215599', '73cc94b954a107ba4eecaa9219057724', '0', '2012-08-15 00:00:00');
INSERT INTO `files` VALUES ('475', 'gallery', '', '', './content/gallery/originals/z-xx/DSC03892.JPG', '3144687', 'f7c3f0bcf6ab345b8b94f70c73d69546', '0', '2012-08-15 00:00:00');
INSERT INTO `files` VALUES ('476', 'gallery', '', '', './content/gallery/originals/z-xx/DSC03895.JPG', '3069261', '270eeb3b7c928b382d94c73d9bfc622a', '0', '2012-08-15 00:00:00');
INSERT INTO `files` VALUES ('477', 'gallery', '', '', './content/gallery/originals/z-xx/DSC03896.JPG', '3275374', 'b6fc3a314cf2e98e62ffd16b9b8559e2', '0', '2012-08-15 00:00:00');
INSERT INTO `files` VALUES ('478', 'gallery', '', '', './content/gallery/originals/z-xx/DSC03898.JPG', '3020470', 'c192dfc0f5e3c51dc05fc8dff5991a23', '0', '2012-08-15 00:00:00');
INSERT INTO `files` VALUES ('479', 'gallery', '', '', './content/gallery/originals/z-xx/DSC03899.JPG', '3119916', '36e36253385d2361bf5d49110d074058', '0', '2012-08-15 00:00:00');
INSERT INTO `files` VALUES ('480', 'gallery', '', '', './content/gallery/originals/z-xx/DSC03903.JPG', '3097378', '1132f652efbc6f41376815c0a12c6217', '0', '2012-08-15 00:00:00');
INSERT INTO `files` VALUES ('481', 'gallery', '', '', './content/gallery/originals/z-xx/DSC03909.JPG', '2991437', '1afc53c62fa5e5a078d22cfe9d7bb430', '0', '2012-08-15 00:00:00');
INSERT INTO `files` VALUES ('482', 'gallery', '', '', './content/gallery/originals/z-xx/DSC03916.JPG', '2846431', '5167ba90e217b754673749d7375753f9', '0', '2012-08-15 00:00:00');
INSERT INTO `files` VALUES ('483', 'gallery', '', '', './content/gallery/originals/z-xx/DSC03928.JPG', '2981659', 'b9674ec30f5a883bfc74a0fce1d5bc60', '0', '2012-08-15 00:00:00');
INSERT INTO `files` VALUES ('484', 'gallery', '', '', './content/gallery/originals/z-xx/DSC03960.JPG', '2868342', '4cf152a6decd615b4f49431301add51f', '0', '2012-08-15 00:00:00');
INSERT INTO `files` VALUES ('485', 'gallery', '', '', './content/gallery/originals/z-xx/DSC03965.JPG', '3060029', '84092073025fa4f50e86836b6fa5a753', '0', '2012-08-15 00:00:00');
INSERT INTO `files` VALUES ('486', 'gallery', '', '', './content/gallery/originals/z-xx/DSC03967.JPG', '2988861', 'b3f5d416f6a1d61375f1d943a7078150', '0', '2012-08-15 00:00:00');
INSERT INTO `files` VALUES ('487', 'gallery', '', '', './content/gallery/originals/z-xx/DSC03970.JPG', '3135414', '3ec5edc7f2e97969620cef504e46036d', '0', '2012-08-15 00:00:00');
INSERT INTO `files` VALUES ('488', 'gallery', '', '', './content/gallery/originals/z-xx/DSC03985.JPG', '3262036', '0ce3e13806fdf95b27ff649ee82d159a', '0', '2012-08-15 00:00:00');
INSERT INTO `files` VALUES ('489', 'gallery', '', '', './content/gallery/originals/z-xx/DSC04005.JPG', '3179040', '7858f996f2a60b1660624c07245de64a', '0', '2012-08-15 00:00:00');
INSERT INTO `files` VALUES ('490', 'gallery', '', '', './content/gallery/originals/z-xx/DSC04009.JPG', '3091876', '429df022b0b6a372e38f7f06638190f9', '0', '2012-08-15 00:00:00');
INSERT INTO `files` VALUES ('491', 'gallery', '', '', './content/gallery/originals/z-xx/DSC04025.JPG', '3353640', '6c3c657d13d7df476997587279cdbe5b', '0', '2012-08-15 00:00:00');
INSERT INTO `files` VALUES ('492', 'gallery', '', '', './content/gallery/originals/z-xx/DSC04026.JPG', '3325034', 'e9aa124b6849bd37ed5a0441617004db', '0', '2012-08-15 00:00:00');
INSERT INTO `files` VALUES ('493', 'gallery', '', '', './content/gallery/originals/z-xx/DSC04041.JPG', '3284498', '3b916c6b67a00d13ff60372adddb27d9', '0', '2012-08-15 00:00:00');
INSERT INTO `files` VALUES ('494', 'gallery', '', '', './content/gallery/originals/z-xx/DSC04044.JPG', '3117174', 'fe7da26eb5bdbed8646c764e4377d082', '0', '2012-08-16 00:00:00');
INSERT INTO `files` VALUES ('495', 'gallery', '', '', './content/gallery/originals/z-xx/DSC04047.JPG', '3186960', 'e5537391a044c47a8f74f20bca75b67a', '0', '2012-08-16 00:00:00');
INSERT INTO `files` VALUES ('496', 'gallery', '', '', './content/gallery/originals/z-xx/DSC04051.JPG', '2828241', 'f3ccfab28b0aeb92d13e64ee9977c45c', '0', '2012-08-16 00:00:00');
INSERT INTO `files` VALUES ('497', 'gallery', '', '', './content/gallery/originals/z-xx/DSC04053.JPG', '3152451', 'd1d1839a5ff7aa90e004533a8ec44160', '0', '2012-08-16 00:00:00');
INSERT INTO `files` VALUES ('498', 'gallery', '', '', './content/gallery/originals/z-xx/DSC04058.JPG', '3176794', '15cbdf7fac198c6d6a872a4d680c2b69', '0', '2012-08-16 00:00:00');
INSERT INTO `files` VALUES ('499', 'preview', '', '', './content/preview/barlaunge.mp3', '20944355', 'c11f7887d4ea01cd4400d795abdfd51e', '0', '2001-01-01 00:00:00');
INSERT INTO `files` VALUES ('500', 'release', '', '', './content/release/M08_Manti_Bar_Launge_mix.mp3', '97293900', '552ae117657819173395e50885aa8a88', '0', '2007-10-27 00:00:00');
INSERT INTO `files` VALUES ('501', 'covers', '', '', './content/covers/bar-launge.jpg', '213833', 'f46d9c2b822fbbc85aeacc6692f525b5', '0', '2001-01-01 00:00:00');
INSERT INTO `files` VALUES ('502', 'preview', '', '', './content/preview/basstech.mp3', '42270406', '48a078e88c276fce93b7d32daf6c072b', '0', '2001-01-01 00:00:00');
INSERT INTO `files` VALUES ('503', 'release', '', '', './content/release/M18_Manti_Special_mix_for_Basstech_(novoeradio.by).mp3', '140904555', '0146ed6afcd6943f59799b96f1918cc4', '0', '2009-05-21 00:00:00');
INSERT INTO `files` VALUES ('504', 'covers', '', '', './content/covers/basstech.jpg', '53606', '3d047b90cae0ca05d0adf8336e9b76a3', '0', '2001-01-01 00:00:00');
INSERT INTO `files` VALUES ('505', 'preview', '', '', './content/preview/basstech2.mp3', '20483869', 'd042da1e58be52ec89455a6b93734039', '0', '2001-01-01 00:00:00');
INSERT INTO `files` VALUES ('506', 'release', '', '', './content/release/M20_Manti_Mix_for_Basstech_(novoeradio.by).mp3', '135120705', '232eb933fe13d836134053ea90f38e36', '0', '2010-02-04 00:00:00');
INSERT INTO `files` VALUES ('507', 'covers', '', '', './content/covers/basstech-2.jpg', '60008', '530beabd7317272ea81561ac4a2d13ef', '0', '2001-01-01 00:00:00');
INSERT INTO `files` VALUES ('508', 'preview', '', '', './content/preview/chillhouse.mp3', '20415846', 'f03967736d8d3b8ed7835f7b99ab032f', '0', '2001-01-01 00:00:00');
INSERT INTO `files` VALUES ('509', 'release', '', '', './content/release/M12_Manti_Chillhouse_live.mp3', '164956140', 'a1ce1e204a112e5c24e87410cef39c18', '1', '2008-11-08 00:00:00');
INSERT INTO `files` VALUES ('510', 'covers', '', '', './content/covers/chillhouse.jpg', '22754', '9aea1e9c399c551aea10a9e8e74a24a4', '0', '2001-01-01 00:00:00');
INSERT INTO `files` VALUES ('511', 'preview', '', '', './content/preview/christmasrave.mp3', '22635209', 'c65afa09b1ba457ce6204f66447a2316', '0', '2001-01-01 00:00:00');
INSERT INTO `files` VALUES ('512', 'release', '', '', './content/release/M14_Manti_Emofunk_live.mp3', '122866523', 'b7455e76ac1c076c0efa2a1271be2ed6', '0', '2008-12-27 00:00:00');
INSERT INTO `files` VALUES ('513', 'covers', '', '', './content/covers/christmas-rave.jpg', '144786', 'a511a8d2559c2c1e5c25f5ec9d2d912a', '0', '2001-01-01 00:00:00');
INSERT INTO `files` VALUES ('514', 'preview', '', '', './content/preview/cotedazur.mp3', '29607290', '8ef7ad19ebc6fd21e64872a09089d6b1', '0', '2001-01-01 00:00:00');
INSERT INTO `files` VALUES ('515', 'release', '', '', './content/release/M30_Manti_Cote_d-Azur_(Summer-Autumn-12_promo).mp3', '145518866', '7705b789f56c47e4b651cf01ee07e72e', '0', '2012-08-25 00:00:00');
INSERT INTO `files` VALUES ('516', 'covers', '', '', './content/covers/cote-d-azur.jpg', '452574', 'a3b0b69579d3cd5059df2346a68fcf0a', '0', '2001-01-01 00:00:00');
INSERT INTO `files` VALUES ('517', 'preview', '', '', './content/preview/enzo.mp3', '20897272', 'e316b841625d0bd9284599f90caa09c8', '0', '2001-01-01 00:00:00');
INSERT INTO `files` VALUES ('518', 'release', '', '', './content/release/M04_Manti_Iris_mix_(Spring-Summer-07_promo).mp3', '144702249', 'dbbc6be0bd82e8a4a01b463ce921be08', '0', '2007-02-18 00:00:00');
INSERT INTO `files` VALUES ('519', 'preview', '', '', './content/preview/exception.mp3', '27890314', '92459116a3b57445b600df080363b798', '0', '2001-01-01 00:00:00');
INSERT INTO `files` VALUES ('520', 'preview', '', '', './content/preview/helloween.mp3', '25940744', 'd891cceb1c825bd826fa0da81885f350', '0', '2001-01-01 00:00:00');
INSERT INTO `files` VALUES ('521', 'preview', '', '', './content/preview/hipass.mp3', '23313870', '84a8d6a01d7f13382bd79d29dbd1084b', '0', '2001-01-01 00:00:00');
INSERT INTO `files` VALUES ('522', 'preview', '', '', './content/preview/janaca01.mp3', '21281335', 'd8f03fa3cc72f60c6b653b7104d7153a', '0', '2001-01-01 00:00:00');
INSERT INTO `files` VALUES ('523', 'preview', '', '', './content/preview/janaca02.mp3', '22730817', '4bc146a8c3e5ce92b6689bfedd08e11e', '0', '2001-01-01 00:00:00');
INSERT INTO `files` VALUES ('524', 'preview', '', '', './content/preview/janacalive.mp3', '24281237', '6fad388fb154075a858f5ba2673369ab', '0', '2001-01-01 00:00:00');
INSERT INTO `files` VALUES ('525', 'preview', '', '', './content/preview/killingmachine.mp3', '22389136', '346e50ce3520454730420eb8c9b259d5', '0', '2001-01-01 00:00:00');
INSERT INTO `files` VALUES ('526', 'preview', '', '', './content/preview/marrakesh.mp3', '21696368', 'abf21e32deef3d6bfd1db8e08c478a78', '0', '2001-01-01 00:00:00');
INSERT INTO `files` VALUES ('527', 'preview', '', '', './content/preview/progress.mp3', '19548163', '432d320b029e22ad91354a80c664c178', '0', '2001-01-01 00:00:00');
INSERT INTO `files` VALUES ('528', 'preview', '', '', './content/preview/reach.mp3', '22524199', '22bdef9c2cc8881aba670db66bcb5e76', '0', '2001-01-01 00:00:00');
INSERT INTO `files` VALUES ('529', 'preview', '', '', './content/preview/renaissance.mp3', '21749282', '4b3d36f3694d94e36a87bd67dfd8f3d4', '0', '2001-01-01 00:00:00');
INSERT INTO `files` VALUES ('530', 'preview', '', '', './content/preview/stockholm-backset.mp3', '22498766', 'a9cc1c161bc8feacde6a0c8c5daa228a', '0', '2001-01-01 00:00:00');
INSERT INTO `files` VALUES ('531', 'preview', '', '', './content/preview/trauma.mp3', '19538132', 'e37b52b6a7a6c7ffc1b8ed64177f5317', '0', '2001-01-01 00:00:00');
INSERT INTO `files` VALUES ('532', 'release', '', '', './content/release/M09_Manti_Janaca_express_mix_02.mp3', '85878784', 'e7cbda68ae5de124008feb87bdbaf335', '1', '2007-10-27 00:00:00');
INSERT INTO `files` VALUES ('533', 'release', '', '', './content/release/M10_Manti_Marrakesh_mix.mp3', '81801216', 'dbab5b3b415693b10fcfd8ab7574d9c9', '0', '2008-01-07 00:00:00');
INSERT INTO `files` VALUES ('534', 'release', '', '', './content/release/M11_Manti_Helloween_party_live.mp3', '86467503', '3aebb91810faa120f9d814d7ca113eba', '0', '2008-10-31 00:00:00');
INSERT INTO `files` VALUES ('535', 'release', '', '', './content/release/M13_Manti_Janaca_express_live.mp3', '154648140', '0257c844984ec941ee2d1fffd4aa3b2f', '0', '2008-11-08 00:00:00');
INSERT INTO `files` VALUES ('536', 'release', '', '', './content/release/M16_Manti_Killing_machine_mix.mp3', '119806024', 'bcfbf45ff8574f7065be88604b9a391d', '0', '2009-03-15 00:00:00');
INSERT INTO `files` VALUES ('537', 'release', '', '', './content/release/M23_Manti_Trauma_mix.mp3', '128371046', 'b838c6f026014e92da82329f2362acc9', '0', '2011-03-03 00:00:00');
INSERT INTO `files` VALUES ('538', 'release', '', '', './content/release/M24_Manti_Renaissanse_(Winter-Spring-12_promo).mp3', '150953381', '9270eacc9990a596b816f58caf81424e', '0', '2011-05-30 00:00:00');
INSERT INTO `files` VALUES ('539', 'release', '', '', './content/release/M26_Manti_Exception_mix.mp3', '123814246', '6e54326ab1c4249d8fdc04b55001d4cf', '0', '2012-04-25 00:00:00');
INSERT INTO `files` VALUES ('540', 'release', '', '', './content/release/M28_Manti_Progress_R-7A_mix.mp3', '139864923', '092cfb6c2c7a60a0265245e53abaab06', '0', '2012-06-01 00:00:00');
INSERT INTO `files` VALUES ('541', 'release', '', '', './content/release/M29_Manti_Enzo_Cafe_live.mp3', '146933595', '451893efea5e3b2466d87d080560e073', '0', '2012-06-30 00:00:00');
INSERT INTO `files` VALUES ('542', 'release', '', '', './content/release/M32_Manti_Stockholm_syndrome_Backset.mp3', '144054003', '91a414db4d06bfe7d7cedfe43bc4da4b', '0', '2012-11-27 00:00:00');
INSERT INTO `files` VALUES ('543', 'release', '', '', './content/release/M33_Manti_Reach_out_to_the_sun.mp3', '157733317', '6777801fdb0a548278e55e98d9f1caa0', '0', '2013-03-05 00:00:00');
INSERT INTO `files` VALUES ('544', 'release', '', '', './content/release/ME01_Manti_NLP_compilation.mp3', '177514687', '36a0212d0e763a5c4f9e420330fa55f8', '0', '2011-10-12 00:00:00');
INSERT INTO `files` VALUES ('545', 'release', '', '', './content/release/ME02_Manti_My_Friend_Friday.mp3', '89743020', '56672681c5333c7ace5ea31cbde51cae', '0', '2013-01-18 00:00:00');
INSERT INTO `files` VALUES ('546', 'covers', '', '', './content/covers/all-she-wants.jpg', '89602', 'c3c72c64ea969c08287c47b10c49bb08', '0', '2001-01-01 00:00:00');
INSERT INTO `files` VALUES ('547', 'covers', '', '', './content/covers/concept.jpg', '368054', '3314fd09810ff58fcd20919c82724c40', '0', '2001-01-01 00:00:00');
INSERT INTO `files` VALUES ('548', 'covers', '', '', './content/covers/enzo.jpg', '312340', '3b2af04bde1e320b0d2b637e977fac1b', '0', '2001-01-01 00:00:00');
INSERT INTO `files` VALUES ('549', 'covers', '', '', './content/covers/exception.jpg', '327661', '3137171e51c963d87486e6018d2a9ffc', '0', '2001-01-01 00:00:00');
INSERT INTO `files` VALUES ('550', 'covers', '', '', './content/covers/helloween.jpg', '104897', '6fd456520b2941b399bfefb6fe91d3cb', '0', '2001-01-01 00:00:00');
INSERT INTO `files` VALUES ('551', 'covers', '', '', './content/covers/hi-pass.jpg', '154038', 'eb384e650567433f5b5703be83971de0', '0', '2001-01-01 00:00:00');
INSERT INTO `files` VALUES ('552', 'covers', '', '', './content/covers/hyper-jump.jpg', '214066', 'c93d1b944ad566e8f9f60554e53af1fc', '0', '2001-01-01 00:00:00');
INSERT INTO `files` VALUES ('553', 'covers', '', '', './content/covers/iris.jpg', '94259', '22be9241f1c1aaa57fd7db38aa6ee964', '0', '2001-01-01 00:00:00');
INSERT INTO `files` VALUES ('554', 'covers', '', '', './content/covers/janaca.jpg', '114933', 'e1a90c01a8bc4f4c63fd31b48ecfbebb', '0', '2001-01-01 00:00:00');
INSERT INTO `files` VALUES ('555', 'covers', '', '', './content/covers/killing-machine.jpg', '138090', '2ee73073ef2afca019acd2ebb7ca9634', '0', '2001-01-01 00:00:00');
INSERT INTO `files` VALUES ('556', 'covers', '', '', './content/covers/marrakesh.jpg', '90797', '77a95a51584719d12df276bf86e51d27', '0', '2001-01-01 00:00:00');
INSERT INTO `files` VALUES ('557', 'covers', '', '', './content/covers/monolith.jpg', '53094', '6e5f9870781ba95398349545e9aa4171', '0', '2001-01-01 00:00:00');
INSERT INTO `files` VALUES ('558', 'covers', '', '', './content/covers/progress_r-7a.jpg', '324836', 'd7ecd6b98bf86edb0a9f8a393840d80a', '0', '2001-01-01 00:00:00');
INSERT INTO `files` VALUES ('559', 'covers', '', '', './content/covers/renaissanse.jpg', '64559', '9119ff1b91329dabc98445b1012ff755', '0', '2001-01-01 00:00:00');
INSERT INTO `files` VALUES ('560', 'covers', '', '', './content/covers/shadow_of_chernobyl.jpg', '334122', 'd8194c3c240bc788967ad8e59d5271a4', '0', '2001-01-01 00:00:00');
INSERT INTO `files` VALUES ('561', 'covers', '', '', './content/covers/skittles-ernys_clouds.jpg', '291049', '390ed528be69ffff83ca6b18febee32f', '0', '2001-01-01 00:00:00');
INSERT INTO `files` VALUES ('562', 'covers', '', '', './content/covers/sturmgeschutz.jpg', '312202', '87db15405da14012db55ea81cffa4043', '0', '2001-01-01 00:00:00');
INSERT INTO `files` VALUES ('563', 'covers', '', '', './content/covers/trauma.jpg', '39702', '19ca74cc6b1fdb2c7d0c5b18865cd4fb', '0', '2001-01-01 00:00:00');
INSERT INTO `files` VALUES ('564', 'preview', '', '', './content/preview/all-she-wants.mp3', '23495515', '7b1af4206de3fc91dd8162804c792f65', '0', '2001-01-01 00:00:00');
INSERT INTO `files` VALUES ('565', 'gallery', '', '', './content/gallery/originals/spring-13/_DSC4019.jpg', '106446', '7f2eb67922aeb0ec7a40cd7b4110c481', '1', '2013-03-25 00:00:00');
INSERT INTO `files` VALUES ('566', 'gallery', '', '', './content/gallery/originals/spring-13/_DSC4348.jpg', '115911', 'c1101ce8c3a726cc766995f1620119e4', '0', '2013-03-25 00:00:00');
INSERT INTO `files` VALUES ('567', 'gallery', '', '', './content/gallery/originals/winter-13/_DSC2815.jpg', '142272', 'dded768909e34881ec47ff660b6b0ec4', '1', '2013-02-24 00:00:00');
INSERT INTO `files` VALUES ('568', 'covers', '', '', './content/covers/stockholm-syndrome-backset.jpg', '149737', '10575604bf4b3999bbab975cd0323ff5', '0', '2013-04-02 16:26:14');
INSERT INTO `files` VALUES ('569', 'covers', '', '', './content/covers/reach-out-of-the-sun.jpg', '374953', '552dc46b1b4fe8b3d52f0a73246974d1', '0', '2013-04-02 16:26:16');
INSERT INTO `files` VALUES ('570', 'source', '', '', '', '4096', '', '0', '2013-04-02 16:26:16');
INSERT INTO `files` VALUES ('571', 'covers', '', '', './content/covers/friday.jpg', '339961', 'd280f74c1b3c4b76657ef08469d07ce1', '0', '2013-04-02 16:41:52');
INSERT INTO `files` VALUES ('572', 'covers', '', '', './content/covers/nlp.jpg', '78363', 'eb2033c3fb60ef50000d1c90bf98aa7f', '0', '2013-04-02 16:41:56');
INSERT INTO `files` VALUES ('573', 'preview', '', '', './content/preview/nlp.mp3', '25642802', '6f3da8aa8ca9606f768e8d3fbe63d37a', '0', '2013-04-02 17:00:24');
INSERT INTO `files` VALUES ('574', 'preview', '', '', './content/preview/friday.mp3', '27163212', '9af6fa245a633fc11a5f9ec20aff51b1', '0', '2013-04-02 17:00:26');

-- ----------------------------
-- Table structure for `gallery`
-- ----------------------------
DROP TABLE IF EXISTS `gallery`;
CREATE TABLE `gallery` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `path` varchar(50) NOT NULL,
  `name` varchar(255) NOT NULL,
  `alias` varchar(64) DEFAULT NULL,
  `description` text NOT NULL,
  `metadesc` varchar(255) NOT NULL,
  `viewed` int(11) unsigned DEFAULT '0',
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_gallery_alias` (`alias`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of gallery
-- ----------------------------
INSERT INTO `gallery` VALUES ('1', './content/gallery/originals/autumn-12', 'Autumn 12 session (Closed)', 'autumn-12', '', '', '0', '2013-04-02 17:50:46');
INSERT INTO `gallery` VALUES ('2', './content/gallery/originals/holland', 'Trip to Holland (Vilnius/Frankfurt/Amsterdam/Kaunas)', 'holland', '', '', '0', '2013-04-02 17:50:46');
INSERT INTO `gallery` VALUES ('3', './content/gallery/originals/spring-13', 'Spring 13 session', 'spring-13', '', '', '0', '2013-04-02 17:50:46');
INSERT INTO `gallery` VALUES ('4', './content/gallery/originals/winter-13', 'Winter 13 session', 'winter-13', '', '', '0', '2013-04-02 17:50:46');
INSERT INTO `gallery` VALUES ('5', './content/gallery/originals/z-xx', 'Trip to KaZantip XX', 'z-xx', '', '', '0', '2013-04-02 17:50:46');

-- ----------------------------
-- Table structure for `gallery_files`
-- ----------------------------
DROP TABLE IF EXISTS `gallery_files`;
CREATE TABLE `gallery_files` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `gallery_id` int(10) unsigned NOT NULL,
  `file_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_gallery_file` (`gallery_id`,`file_id`) USING BTREE,
  KEY `fk_gallery_files_file_id` (`file_id`) USING BTREE,
  KEY `fk_gallery_files_gallery_id` (`gallery_id`) USING BTREE,
  CONSTRAINT `gallery_files_ibfk_1` FOREIGN KEY (`file_id`) REFERENCES `files` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `gallery_files_ibfk_2` FOREIGN KEY (`gallery_id`) REFERENCES `gallery` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=467 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of gallery_files
-- ----------------------------
INSERT INTO `gallery_files` VALUES ('1', '1', '247');
INSERT INTO `gallery_files` VALUES ('2', '1', '248');
INSERT INTO `gallery_files` VALUES ('3', '1', '249');
INSERT INTO `gallery_files` VALUES ('4', '1', '250');
INSERT INTO `gallery_files` VALUES ('5', '1', '251');
INSERT INTO `gallery_files` VALUES ('6', '1', '252');
INSERT INTO `gallery_files` VALUES ('7', '1', '253');
INSERT INTO `gallery_files` VALUES ('8', '1', '254');
INSERT INTO `gallery_files` VALUES ('9', '1', '255');
INSERT INTO `gallery_files` VALUES ('10', '1', '256');
INSERT INTO `gallery_files` VALUES ('11', '1', '257');
INSERT INTO `gallery_files` VALUES ('12', '1', '258');
INSERT INTO `gallery_files` VALUES ('13', '1', '259');
INSERT INTO `gallery_files` VALUES ('14', '1', '260');
INSERT INTO `gallery_files` VALUES ('15', '1', '261');
INSERT INTO `gallery_files` VALUES ('16', '1', '262');
INSERT INTO `gallery_files` VALUES ('17', '1', '263');
INSERT INTO `gallery_files` VALUES ('18', '1', '264');
INSERT INTO `gallery_files` VALUES ('19', '1', '265');
INSERT INTO `gallery_files` VALUES ('20', '1', '266');
INSERT INTO `gallery_files` VALUES ('21', '1', '267');
INSERT INTO `gallery_files` VALUES ('22', '1', '268');
INSERT INTO `gallery_files` VALUES ('23', '1', '269');
INSERT INTO `gallery_files` VALUES ('24', '1', '270');
INSERT INTO `gallery_files` VALUES ('25', '1', '271');
INSERT INTO `gallery_files` VALUES ('26', '1', '272');
INSERT INTO `gallery_files` VALUES ('27', '1', '273');
INSERT INTO `gallery_files` VALUES ('28', '1', '274');
INSERT INTO `gallery_files` VALUES ('29', '1', '275');
INSERT INTO `gallery_files` VALUES ('30', '1', '276');
INSERT INTO `gallery_files` VALUES ('31', '1', '277');
INSERT INTO `gallery_files` VALUES ('32', '1', '278');
INSERT INTO `gallery_files` VALUES ('33', '1', '279');
INSERT INTO `gallery_files` VALUES ('34', '1', '280');
INSERT INTO `gallery_files` VALUES ('35', '1', '281');
INSERT INTO `gallery_files` VALUES ('36', '1', '282');
INSERT INTO `gallery_files` VALUES ('37', '1', '283');
INSERT INTO `gallery_files` VALUES ('38', '1', '284');
INSERT INTO `gallery_files` VALUES ('39', '1', '285');
INSERT INTO `gallery_files` VALUES ('40', '1', '286');
INSERT INTO `gallery_files` VALUES ('41', '1', '287');
INSERT INTO `gallery_files` VALUES ('42', '1', '288');
INSERT INTO `gallery_files` VALUES ('43', '1', '289');
INSERT INTO `gallery_files` VALUES ('44', '1', '290');
INSERT INTO `gallery_files` VALUES ('45', '1', '291');
INSERT INTO `gallery_files` VALUES ('46', '1', '292');
INSERT INTO `gallery_files` VALUES ('47', '2', '293');
INSERT INTO `gallery_files` VALUES ('48', '2', '294');
INSERT INTO `gallery_files` VALUES ('49', '2', '295');
INSERT INTO `gallery_files` VALUES ('50', '2', '296');
INSERT INTO `gallery_files` VALUES ('51', '2', '297');
INSERT INTO `gallery_files` VALUES ('52', '2', '298');
INSERT INTO `gallery_files` VALUES ('53', '2', '299');
INSERT INTO `gallery_files` VALUES ('54', '2', '300');
INSERT INTO `gallery_files` VALUES ('55', '2', '301');
INSERT INTO `gallery_files` VALUES ('56', '2', '302');
INSERT INTO `gallery_files` VALUES ('57', '2', '303');
INSERT INTO `gallery_files` VALUES ('58', '2', '304');
INSERT INTO `gallery_files` VALUES ('59', '2', '305');
INSERT INTO `gallery_files` VALUES ('60', '2', '306');
INSERT INTO `gallery_files` VALUES ('61', '2', '307');
INSERT INTO `gallery_files` VALUES ('62', '2', '308');
INSERT INTO `gallery_files` VALUES ('63', '2', '309');
INSERT INTO `gallery_files` VALUES ('64', '2', '310');
INSERT INTO `gallery_files` VALUES ('65', '2', '311');
INSERT INTO `gallery_files` VALUES ('66', '2', '312');
INSERT INTO `gallery_files` VALUES ('67', '2', '313');
INSERT INTO `gallery_files` VALUES ('68', '2', '314');
INSERT INTO `gallery_files` VALUES ('69', '2', '315');
INSERT INTO `gallery_files` VALUES ('70', '2', '316');
INSERT INTO `gallery_files` VALUES ('71', '2', '317');
INSERT INTO `gallery_files` VALUES ('72', '2', '318');
INSERT INTO `gallery_files` VALUES ('73', '2', '319');
INSERT INTO `gallery_files` VALUES ('74', '2', '320');
INSERT INTO `gallery_files` VALUES ('75', '2', '321');
INSERT INTO `gallery_files` VALUES ('76', '2', '322');
INSERT INTO `gallery_files` VALUES ('77', '2', '323');
INSERT INTO `gallery_files` VALUES ('78', '2', '324');
INSERT INTO `gallery_files` VALUES ('79', '2', '325');
INSERT INTO `gallery_files` VALUES ('80', '2', '326');
INSERT INTO `gallery_files` VALUES ('81', '2', '327');
INSERT INTO `gallery_files` VALUES ('82', '2', '328');
INSERT INTO `gallery_files` VALUES ('83', '2', '329');
INSERT INTO `gallery_files` VALUES ('84', '2', '330');
INSERT INTO `gallery_files` VALUES ('85', '2', '331');
INSERT INTO `gallery_files` VALUES ('86', '2', '332');
INSERT INTO `gallery_files` VALUES ('87', '2', '333');
INSERT INTO `gallery_files` VALUES ('88', '2', '334');
INSERT INTO `gallery_files` VALUES ('89', '2', '335');
INSERT INTO `gallery_files` VALUES ('90', '2', '336');
INSERT INTO `gallery_files` VALUES ('91', '2', '337');
INSERT INTO `gallery_files` VALUES ('92', '2', '338');
INSERT INTO `gallery_files` VALUES ('93', '2', '339');
INSERT INTO `gallery_files` VALUES ('94', '2', '340');
INSERT INTO `gallery_files` VALUES ('95', '2', '341');
INSERT INTO `gallery_files` VALUES ('96', '2', '342');
INSERT INTO `gallery_files` VALUES ('97', '2', '343');
INSERT INTO `gallery_files` VALUES ('98', '2', '344');
INSERT INTO `gallery_files` VALUES ('99', '2', '345');
INSERT INTO `gallery_files` VALUES ('100', '2', '346');
INSERT INTO `gallery_files` VALUES ('101', '2', '347');
INSERT INTO `gallery_files` VALUES ('102', '2', '348');
INSERT INTO `gallery_files` VALUES ('103', '2', '349');
INSERT INTO `gallery_files` VALUES ('104', '2', '350');
INSERT INTO `gallery_files` VALUES ('105', '2', '351');
INSERT INTO `gallery_files` VALUES ('106', '2', '352');
INSERT INTO `gallery_files` VALUES ('107', '2', '353');
INSERT INTO `gallery_files` VALUES ('108', '2', '354');
INSERT INTO `gallery_files` VALUES ('109', '2', '355');
INSERT INTO `gallery_files` VALUES ('110', '2', '356');
INSERT INTO `gallery_files` VALUES ('111', '2', '357');
INSERT INTO `gallery_files` VALUES ('112', '2', '358');
INSERT INTO `gallery_files` VALUES ('113', '2', '359');
INSERT INTO `gallery_files` VALUES ('114', '2', '360');
INSERT INTO `gallery_files` VALUES ('115', '2', '361');
INSERT INTO `gallery_files` VALUES ('116', '2', '362');
INSERT INTO `gallery_files` VALUES ('117', '2', '363');
INSERT INTO `gallery_files` VALUES ('118', '2', '364');
INSERT INTO `gallery_files` VALUES ('119', '2', '365');
INSERT INTO `gallery_files` VALUES ('120', '2', '366');
INSERT INTO `gallery_files` VALUES ('121', '2', '367');
INSERT INTO `gallery_files` VALUES ('122', '2', '368');
INSERT INTO `gallery_files` VALUES ('123', '2', '369');
INSERT INTO `gallery_files` VALUES ('124', '2', '370');
INSERT INTO `gallery_files` VALUES ('125', '2', '371');
INSERT INTO `gallery_files` VALUES ('126', '2', '372');
INSERT INTO `gallery_files` VALUES ('127', '2', '373');
INSERT INTO `gallery_files` VALUES ('128', '2', '374');
INSERT INTO `gallery_files` VALUES ('129', '2', '375');
INSERT INTO `gallery_files` VALUES ('130', '2', '376');
INSERT INTO `gallery_files` VALUES ('131', '2', '377');
INSERT INTO `gallery_files` VALUES ('132', '2', '378');
INSERT INTO `gallery_files` VALUES ('133', '2', '379');
INSERT INTO `gallery_files` VALUES ('134', '2', '380');
INSERT INTO `gallery_files` VALUES ('135', '2', '381');
INSERT INTO `gallery_files` VALUES ('136', '2', '382');
INSERT INTO `gallery_files` VALUES ('137', '2', '383');
INSERT INTO `gallery_files` VALUES ('138', '2', '384');
INSERT INTO `gallery_files` VALUES ('139', '2', '385');
INSERT INTO `gallery_files` VALUES ('140', '2', '386');
INSERT INTO `gallery_files` VALUES ('141', '2', '387');
INSERT INTO `gallery_files` VALUES ('142', '2', '388');
INSERT INTO `gallery_files` VALUES ('143', '2', '389');
INSERT INTO `gallery_files` VALUES ('144', '2', '390');
INSERT INTO `gallery_files` VALUES ('145', '2', '391');
INSERT INTO `gallery_files` VALUES ('146', '2', '392');
INSERT INTO `gallery_files` VALUES ('147', '2', '393');
INSERT INTO `gallery_files` VALUES ('148', '2', '394');
INSERT INTO `gallery_files` VALUES ('149', '2', '395');
INSERT INTO `gallery_files` VALUES ('150', '2', '396');
INSERT INTO `gallery_files` VALUES ('151', '2', '397');
INSERT INTO `gallery_files` VALUES ('152', '2', '398');
INSERT INTO `gallery_files` VALUES ('153', '2', '399');
INSERT INTO `gallery_files` VALUES ('154', '2', '400');
INSERT INTO `gallery_files` VALUES ('155', '2', '401');
INSERT INTO `gallery_files` VALUES ('156', '2', '402');
INSERT INTO `gallery_files` VALUES ('157', '2', '403');
INSERT INTO `gallery_files` VALUES ('158', '2', '404');
INSERT INTO `gallery_files` VALUES ('159', '2', '405');
INSERT INTO `gallery_files` VALUES ('160', '2', '406');
INSERT INTO `gallery_files` VALUES ('161', '2', '407');
INSERT INTO `gallery_files` VALUES ('162', '2', '408');
INSERT INTO `gallery_files` VALUES ('163', '2', '409');
INSERT INTO `gallery_files` VALUES ('164', '2', '410');
INSERT INTO `gallery_files` VALUES ('165', '2', '411');
INSERT INTO `gallery_files` VALUES ('166', '2', '412');
INSERT INTO `gallery_files` VALUES ('167', '2', '413');
INSERT INTO `gallery_files` VALUES ('168', '2', '414');
INSERT INTO `gallery_files` VALUES ('169', '2', '415');
INSERT INTO `gallery_files` VALUES ('170', '2', '416');
INSERT INTO `gallery_files` VALUES ('171', '2', '417');
INSERT INTO `gallery_files` VALUES ('172', '2', '418');
INSERT INTO `gallery_files` VALUES ('173', '2', '419');
INSERT INTO `gallery_files` VALUES ('174', '2', '420');
INSERT INTO `gallery_files` VALUES ('175', '2', '421');
INSERT INTO `gallery_files` VALUES ('176', '2', '422');
INSERT INTO `gallery_files` VALUES ('177', '2', '423');
INSERT INTO `gallery_files` VALUES ('178', '2', '424');
INSERT INTO `gallery_files` VALUES ('179', '2', '425');
INSERT INTO `gallery_files` VALUES ('180', '2', '426');
INSERT INTO `gallery_files` VALUES ('181', '2', '427');
INSERT INTO `gallery_files` VALUES ('182', '2', '428');
INSERT INTO `gallery_files` VALUES ('183', '2', '429');
INSERT INTO `gallery_files` VALUES ('184', '2', '430');
INSERT INTO `gallery_files` VALUES ('185', '2', '431');
INSERT INTO `gallery_files` VALUES ('186', '2', '432');
INSERT INTO `gallery_files` VALUES ('187', '3', '433');
INSERT INTO `gallery_files` VALUES ('188', '3', '434');
INSERT INTO `gallery_files` VALUES ('189', '3', '435');
INSERT INTO `gallery_files` VALUES ('190', '3', '436');
INSERT INTO `gallery_files` VALUES ('191', '3', '437');
INSERT INTO `gallery_files` VALUES ('192', '3', '438');
INSERT INTO `gallery_files` VALUES ('193', '3', '439');
INSERT INTO `gallery_files` VALUES ('194', '3', '440');
INSERT INTO `gallery_files` VALUES ('195', '3', '441');
INSERT INTO `gallery_files` VALUES ('196', '3', '442');
INSERT INTO `gallery_files` VALUES ('197', '3', '443');
INSERT INTO `gallery_files` VALUES ('198', '3', '444');
INSERT INTO `gallery_files` VALUES ('450', '3', '565');
INSERT INTO `gallery_files` VALUES ('452', '3', '566');
INSERT INTO `gallery_files` VALUES ('199', '4', '445');
INSERT INTO `gallery_files` VALUES ('200', '4', '446');
INSERT INTO `gallery_files` VALUES ('201', '4', '447');
INSERT INTO `gallery_files` VALUES ('202', '4', '448');
INSERT INTO `gallery_files` VALUES ('203', '4', '449');
INSERT INTO `gallery_files` VALUES ('204', '4', '450');
INSERT INTO `gallery_files` VALUES ('205', '4', '451');
INSERT INTO `gallery_files` VALUES ('206', '4', '452');
INSERT INTO `gallery_files` VALUES ('207', '4', '453');
INSERT INTO `gallery_files` VALUES ('208', '4', '454');
INSERT INTO `gallery_files` VALUES ('209', '4', '455');
INSERT INTO `gallery_files` VALUES ('210', '4', '456');
INSERT INTO `gallery_files` VALUES ('211', '4', '457');
INSERT INTO `gallery_files` VALUES ('212', '4', '458');
INSERT INTO `gallery_files` VALUES ('466', '4', '567');
INSERT INTO `gallery_files` VALUES ('213', '5', '459');
INSERT INTO `gallery_files` VALUES ('214', '5', '460');
INSERT INTO `gallery_files` VALUES ('215', '5', '461');
INSERT INTO `gallery_files` VALUES ('216', '5', '462');
INSERT INTO `gallery_files` VALUES ('217', '5', '463');
INSERT INTO `gallery_files` VALUES ('218', '5', '464');
INSERT INTO `gallery_files` VALUES ('219', '5', '465');
INSERT INTO `gallery_files` VALUES ('220', '5', '466');
INSERT INTO `gallery_files` VALUES ('221', '5', '467');
INSERT INTO `gallery_files` VALUES ('222', '5', '468');
INSERT INTO `gallery_files` VALUES ('223', '5', '469');
INSERT INTO `gallery_files` VALUES ('224', '5', '470');
INSERT INTO `gallery_files` VALUES ('225', '5', '471');
INSERT INTO `gallery_files` VALUES ('226', '5', '472');
INSERT INTO `gallery_files` VALUES ('227', '5', '473');
INSERT INTO `gallery_files` VALUES ('228', '5', '474');
INSERT INTO `gallery_files` VALUES ('229', '5', '475');
INSERT INTO `gallery_files` VALUES ('230', '5', '476');
INSERT INTO `gallery_files` VALUES ('231', '5', '477');
INSERT INTO `gallery_files` VALUES ('232', '5', '478');
INSERT INTO `gallery_files` VALUES ('233', '5', '479');
INSERT INTO `gallery_files` VALUES ('234', '5', '480');
INSERT INTO `gallery_files` VALUES ('235', '5', '481');
INSERT INTO `gallery_files` VALUES ('236', '5', '482');
INSERT INTO `gallery_files` VALUES ('237', '5', '483');
INSERT INTO `gallery_files` VALUES ('238', '5', '484');
INSERT INTO `gallery_files` VALUES ('239', '5', '485');
INSERT INTO `gallery_files` VALUES ('240', '5', '486');
INSERT INTO `gallery_files` VALUES ('241', '5', '487');
INSERT INTO `gallery_files` VALUES ('242', '5', '488');
INSERT INTO `gallery_files` VALUES ('243', '5', '489');
INSERT INTO `gallery_files` VALUES ('244', '5', '490');
INSERT INTO `gallery_files` VALUES ('245', '5', '491');
INSERT INTO `gallery_files` VALUES ('246', '5', '492');
INSERT INTO `gallery_files` VALUES ('247', '5', '493');
INSERT INTO `gallery_files` VALUES ('248', '5', '494');
INSERT INTO `gallery_files` VALUES ('249', '5', '495');
INSERT INTO `gallery_files` VALUES ('250', '5', '496');
INSERT INTO `gallery_files` VALUES ('251', '5', '497');
INSERT INTO `gallery_files` VALUES ('252', '5', '498');

-- ----------------------------
-- Table structure for `gallery_tags`
-- ----------------------------
DROP TABLE IF EXISTS `gallery_tags`;
CREATE TABLE `gallery_tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `gallery_id` int(10) unsigned NOT NULL,
  `tag_id` int(10) unsigned NOT NULL,
  `type` enum('taxonomy','meta') DEFAULT 'meta',
  PRIMARY KEY (`id`),
  KEY `fk_gallery_tags_gallery_id` (`gallery_id`) USING BTREE,
  KEY `fk_gallery_tags_tag_id` (`tag_id`) USING BTREE,
  CONSTRAINT `gallery_tags_ibfk_1` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `gallery_tags_ibfk_2` FOREIGN KEY (`gallery_id`) REFERENCES `gallery` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of gallery_tags
-- ----------------------------

-- ----------------------------
-- Table structure for `group`
-- ----------------------------
DROP TABLE IF EXISTS `group`;
CREATE TABLE `group` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1001 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of group
-- ----------------------------
INSERT INTO `group` VALUES ('1', 'Root');
INSERT INTO `group` VALUES ('10', 'Admin');
INSERT INTO `group` VALUES ('100', 'Moderator');
INSERT INTO `group` VALUES ('1000', 'Registered');

-- ----------------------------
-- Table structure for `post`
-- ----------------------------
DROP TABLE IF EXISTS `post`;
CREATE TABLE `post` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `alias` varchar(64) DEFAULT NULL,
  `teaser` varchar(512) DEFAULT NULL,
  `description` text NOT NULL,
  `metadesc` varchar(255) DEFAULT NULL,
  `is_music` tinyint(1) DEFAULT '0',
  `catnum` varchar(16) DEFAULT NULL,
  `genre` varchar(32) DEFAULT NULL,
  `quality` varchar(255) DEFAULT NULL,
  `length` varchar(16) DEFAULT NULL,
  `tracklist` text,
  `created` datetime DEFAULT NULL,
  `viewed` int(11) unsigned DEFAULT '0',
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_post_alias` (`alias`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of post
-- ----------------------------
INSERT INTO `post` VALUES ('1', 'Insomnia', 'insomnia', 'Сет с которого все и началось, впервые был записан в 2004 году, с тех пор собственно ничего не изменилось, кроме качества звука - сет был переигран в 2007 только ради этой цели...', 'Сет с которого все и началось, впервые был записан в 2004 году, с тех пор собственно ничего не изменилось, кроме качества звука - сет был переигран в 2007 только ради этой цели...', 'Сет с которого все и началось, впервые был записан в 2004 году, с тех пор собственно ничего не изменилось, кроме качества звука - сет был переигран в 2007 только ради этой цели...', '1', 'MNT001', 'Noise, ambient', 'LAME 192kbps 44100Hz', '79:31', '1. Http - Звезды небесные\r\n2. I/dex - Zeel\r\n3. Pole 3 - Silbefisch\r\n4. Deep-z - Returning (Dedicated to Fula)\r\n5. I/dex - Ksren\r\n6. Plastikman - Disconnect    \r\n7. Akvalangist - Adpcm\r\n8. Fax - 20w\r\n9. David Alvarado - Aire  \r\n10. Fax - Aslip\r\n11. Deluge - Departure\r\n12. Pole 3 - Uberfahrt\r\n13. Taylor Deupree - Snow-Sand', '2005-08-08 00:00:00', '1', '2013-04-05 11:48:11');
INSERT INTO `post` VALUES ('2', 'Для IT HRs и разработчиков', 'for-it', 'Кратко о себе, основные сведения, профессиональные знания и навыки.', '<img src=\"/content/images/exec.jpg\" style=\"margin: 0 0 10px 10px\" class=\"fr\" /><p><strong>Кратко о себе</strong>:</p><p>Высшее техническое образование по специальности инженер-программист со специализацией информационные и интернет технологии.</p><p>Коммуникабельность, умение работать в команде, технический английский, грамотная речь, эмоциональная выдержка, большой опыт общения с клиентами (от пенсионеров до высоких должностных лиц), крепкое здоровье, без вредных превычек.</p><p>Без проблем работаю как на windows платформе, так и на linux/debian платформах. Высокие знания пакета Adobe Photoshop.</p><p><strong>Основные сведения</strong>:</p><ul><li>Более чем 6-летний практический (3-летний коммерческий) опыт разработки web-приложений от стадии постановки задачи до запуска работающего проекта.</li><li>Высоконагруженные приложения со сложной архитектурой и пропускной способностью более чем 5000rps. Горизонтальное и вертикальное масштабирование.</li><li>Знание, понимание и практическое использование ООП. Шаблоны проектирования.</li><li>Грамотное оформление кода (иерархия, описание, комментарии), умение читать и понимать чужой код, в т.ч. и \"плохой\".</li><li>Оптимизация существующего кода: PHP, MySQL (Join / Union / Proc), кеширование (Memcached, FileCache), поиск по большим БД (Sphinx / Solr), HTML / CSS (replace table layout on the block). Возможно составление технической документации по проекту.</li><li>Администрирование и запуск серверов: XAMPP (WinServer, WinXP/Seven), LAMP (Red Hat, Ubuntu) on Apache / Nginx + PHP (Mod, FCGI, CLI) + Memcached + MySQL / MongoDB + IspManager / Munin; высокий уровень использования Ubuntu shell / bash, опыт работы с AWS.</li><li>Отладка и профилирование кода - xDebug; системы контроля версий - SVN / GIT, ветвление, слияние, откаты и т.п.</li></ul><p> <strong>Профессиональные знания и навыки</strong>:</p><ul><li>Языки программирования: PHP 5+ лет, JS (Native / jQuery) 7+ лет , MySQL 3+ лет, NoSQL / MongoDB 1+ лет, Python / Django 1+ лет, Ruby / Rails 6+ месяцев, HTML / DHTML / XHTML / HTML5 / CSS 7+ лет.</li><li>Технологии: SOAP, OAuth, RESTful, FB Graph API, XML / XSLT / JSON / AJAX / Protobuf, Google API / Yandex API / 5+ RTB APIs.</li><li>CMS, FW и ORM: Zend, Doctrine, Magento, Joomla, Wordpress, Drupal, jQuery, Cargo, Elgg, Tomato, ZenCart, OpenCart, Mantis, LiveStreet. </li><li>Участие в проектах: Blismobile.com, Clubautomation.com, OnlineAHA.org, AHALife.com, LYF.com, DealOn.com, 2buckfreight.com, 3Key.com, CrowdCloud.com, Vinatic.nl, VitaminGangster.com, NOICentral.com, Kronenbourg, PalUp, AWReminders, SaikoTeam.com, GISA.by, Srochnov.ru, Agrotour.by, NPK.of.by, NiiAR.com, Lib.PSU.by, Anastasia.travel, Kurtochka.by, Gihon.by, Damco.by и другие.</li></ul><p>Образцы исходного кода можно посмотреть здесь: <a href=\"https://github.com/marco-manti/M2_micro\" target=\"_blank\">https://github.com/marco-manti/M2_micro</a></p>', 'Кратко о себе, основные сведения, профессиональные знания и навыки.', '0', '', '', '', '', '', '2013-01-01 15:32:50', '1', '2013-04-04 16:44:38');
INSERT INTO `post` VALUES ('3', 'Synthetic', 'synthetic', 'На мой взгляд, самая сложная, но и самая интересная моя амбиент работа. Интеллектуальный и качественный саунд в дополнении к немецким и чешским военным разработкам )))', 'На мой взгляд, самая сложная, но и самая интересная моя амбиент работа. Интеллектуальный и качественный саунд в дополнении к немецким и чешским военным разработкам )))', 'На мой взгляд, самая сложная, но и самая интересная моя амбиент работа. Интеллектуальный и качественный саунд в дополнении к немецким и чешским военным разработкам )))', '1', 'MNT007', 'Ambient, Chillout', 'LAME 192kbps 44100Hz', '59:40', '1. Falter - Nachtflug\r\n2. H.u.v.a - Distances\r\n3. H.u.v.a. - Acces to the long fields\r\n4. Biosphere (Hia) - Gas street basin  \r\n5. Fax - Deja vu\r\n6. Telefon Tel Aviv - TTV\r\n7. Lator - B-4 talk (Promo version)\r\n8. Shuttle 358 - Floops\r\n9. Solarise speek\r\n10. Vladislav Delay - He lived deeply  \r\n11. Monolake - Indigo    ', '2007-09-16 00:00:00', '1', '2013-04-05 11:46:44');
INSERT INTO `post` VALUES ('4', 'Plastic toy', 'plastic-toy', 'Третий микс из серии \"light synthetic compilation\". Смесь амбиента, нойза и даб техно!!! Многие из треков связаны \"по-три\", тем самым усложняя и украшая \"шумовую\" картину. Сет для любителей ненапряжных битов и шумов, все медлено и запутанно.', 'Третий микс из серии \"light synthetic compilation\". Смесь амбиента, нойза и даб техно!!! Многие из треков связаны \"по-три\", тем самым усложняя и украшая \"шумовую\" картину. Сет для любителей ненапряжных битов и шумов, все медлено и запутанно.', 'Третий микс из серии \"light synthetic compilation\". Смесь амбиента, нойза и даб техно!!! Многие из треков связаны \"по-три\", тем самым усложняя и украшая \"шумовую\" картину. Сет для любителей ненапряжных битов и шумов, все медлено и запутанно.', '1', 'MNT017', 'Ambient, Chillout', 'LAME 320kbps 44100Hz', '49:01', '1. Biosphere - Kobresia\r\n2. Lowtec - A2 untitled\r\n3. I/dex - Drafts\r\n4. Pole-3 - Rondell zwei\r\n5. Minilogue - Stations II\r\n6. Ike - Cluster funk\r\n7. Intrusion - Tswana dub (Brendon Moeller vs Beat Pharmacy dub)\r\n8. Harmash - Hibernatoria08\r\n9. Apparat - Wooden (Anders Ilar remix)\r\n10. Minilogue - City lights\r\n11. Dolby - He0r\r\n12. Harmash - Hibernatoria05\r\n13. Minilogue - Cow, crickets and clay', '2009-05-07 00:00:00', '1', '2013-04-05 11:43:40');
INSERT INTO `post` VALUES ('5', 'Solaris', 'solaris', 'Четвертый микс из серии \"light synthetic compilation\". Почти год я собирал и отфильтровывал материал с \"исключительным\" звучанием. По традиции сет построен по любимой схеме \"два+три\" (одновременно звучит более двух треков), тем самым усложняя и украшая \"шумовую\" картину.', 'Четвертый микс из серии \"light synthetic compilation\". Почти год я собирал и отфильтровывал материал с \"исключительным\" звучанием. По традиции сет построен по любимой схеме \"два+три\" (одновременно звучит более двух треков), тем самым усложняя и украшая \"шумовую\" картину.\r\nСет так назван не случайно, интро  - саундтрек к голливудской версии фильма \"Солярис\". Я очень долго его искал, но все-таки нашел. \r\nСлушайте, медитируйте, наслаждайтесь... ', 'Четвертый микс из серии \"light synthetic compilation\". Почти год я собирал и отфильтровывал материал с \"исключительным\" звучанием. ', '1', 'MNT021', 'Ambient, Chillout', 'LAME 320kbps 44100Hz', '52:44', '1. Cliff Martinez - We don\'t have to think like that anymore\r\n2. Cliff Martinez - First sleep\r\n3. Alva Noto - Xerrox monophaser 1\r\n4. Indo - Pneuma\r\n5. Avec.Berre - Stepdrop\r\n6. Ilpo Vaisanen - Autioitu 1\r\n7. Kassian Troyer - Plant shift\r\n8. Valliam – In samsara\r\n9. Clint Mansell - Stay with me\r\n10. Astrum - Saturn\r\n11. Pinch meets Pavel Ambiont - Poison/Remedy\r\n12. Alva Noto - Xerrox phaser acat 1', '2010-04-18 00:00:00', '3', '2013-04-05 11:42:51');
INSERT INTO `post` VALUES ('6', 'Stockholm syndrome', 'stockholm-syndrome', 'Очень не стандартный для меня микс, как по компиляции, так и по технике. Специально не затачивался по мое ДР, но так уж получилось, что микс был закончен именно в этот день, знаменательно.', 'Очень не стандартный для меня микс, как по компиляции, так и по технике. Специально не затачивался по мое ДР, но так уж получилось, что микс был закончен именно в этот день, знаменательно.\r\nВоодушевила меня на создание такого микса команда GusGus, так что любителям их творчества посвящается...', 'Очень не стандартный для меня микс, как по компиляции, так и по технике', '1', 'MNT031', 'Tech House, Deep House', 'LAME 320kbps 44100Hz', '1:18:34', '0. Intro - Crimea\r\n1. Tube & Berger - Come Together (Original Mix)\r\n2. Markus Fix - I\'ll House You (Original Mix)\r\n3. Tiefschwarz feat. Cassy - Find me\r\n4. Oxia - Housewife (feat. Miss Kittin)\r\n5. Royksopp - Tricky Tricky (Beyond Deep remix)\r\n6. Aki Bergen - Dont call me artist\r\n7. Sian - East of eden (Original mix)\r\n8. Popsled and Magit Cacoon - Higher point (Original mix)\r\n9. Oxia, Simon Mattson - Harmonie (Simon Mattson Remix)\r\n10. Dusty Kid - Cowboys\r\n11. Swayzak - Make up your mind\r\n12. Terry Lee Brown Junior - Bohemian life\r\n13. Agoria, Carl Craig and La Scalars - Speechless (Radio Slave remix)', '2012-09-09 00:00:00', '2', '2013-04-05 11:35:50');
INSERT INTO `post` VALUES ('8', 'Autoreply promo', 'autoreply', 'Весенний промо микс на тему дип хауза. Очень долгожданный микс для меня, после длительного драмового запоя, хотя и записался довольно спонтанно.', 'Весенний промо микс на тему дип хауза. Очень долгожданный микс для меня, после длительного драмового запоя, хотя и записался довольно спонтанно.', 'Весенний промо микс на тему дип хауза. Очень долгожданный микс для меня, после длительного драмового запоя.', '1', 'MNT027', 'Deep House', 'LAME 320kbps 44100Hz', '58:54', '0. Intro - Tokyo\r\n1. Fish Go Deep - Deep like\r\n2. Brawther - Spaceman funk (Deep club mix)\r\n3. Ion Ludwig - L\'Sable\r\n4. Dublee - Touch (Sweetbutter mix)\r\n5. Oscar Barila and Maiki - Above the clouds\r\n6. Ben Rourke - Tahiti\r\n7. Nikola Gala - I don\'t stop\r\n8. The Timewriter - Superschall (M.In remix)\r\n9. Oscar Barila - Tampa\r\n10. Jussi Pekka - Stream horse (Motorcitysoul remix)\r\n11. Thomas Bjerring - Republique', '2012-05-02 00:00:00', '2', '2013-04-05 11:40:09');
INSERT INTO `post` VALUES ('9', 'Katana', 'katana', 'Этот сет является очень чистой эссенцией техничного драма. Компилился долго и упорно, в итоге получилось довольно качественно.', 'Этот сет является очень чистой эссенцией техничного драма. Компилился долго и упорно, в итоге получилось довольно качественно.', 'Этот сет является очень чистой эссенцией техничного драма.', '1', 'MNT025', 'Techstep, Neurostep', 'LAME 320kbps 44100Hz', '57:32', '0. Sunchase - Asphalt\r\n1. Amoss - Flex\r\n2. Alix Perez - Behind time\r\n3. Trinity - Harvester\r\n4. Paperclip - Blueprints\r\n5. Enei - No Fear (feat. Riya)\r\n6 Need for mirrors - Skip rope\r\n7. Enei - Cracker (Jubei remix)\r\n8. Optiv & BTK - Inception\r\n9. Ulterior Motive - Seven Segments\r\n10. Dub Phizix - Four (feat. Skeptical)\r\n11. Nickbee - Carpe diem\r\n12. Malk - My crazy baby\r\n13. Parhelia - Spaceship named Andromeda', '2011-12-05 00:00:00', '6', '2013-04-05 11:40:11');
INSERT INTO `post` VALUES ('10', 'Дом разбитых сердец, начало', 'hobh-one', 'Для всех тех, кто страдает...', 'Для всех тех, кто страдает...', 'Для всех тех, кто страдает...', '1', 'MNT003', 'Ambient, Lounge', 'LAME 192kbps 44100Hz', '64:54', '1. Telepopmusik - 6p_6q_=h_4n\r\n2. Amon Tobin - Mighty micro people\r\n3. Manmademan - Breeze\r\n4. Nuclear Ramjet - Near earth project\r\n5. Telefon Tel Aviv - When it happens, it moves all by itself\r\n6. Imogen Heap - Hide & seek \r\n7. Halou - Ill carri you\r\n8. marco_manti - Music for Lilou \r\n9. Linkin Park - My December (Alter-Native mastering) \r\n10. switch (depeche mode)\r\n11. Junkie XL - We become one\r\n12. Planet Funk feat. Sally Doherty - Dusk\r\n13. 2Raumwohnung - Wir erinnern uns nicht\r\n14. Daft Punk - Something about us\r\n15. A-ha - Summer moved on', '2006-12-11 00:00:00', '2', '2013-04-05 11:48:10');
INSERT INTO `post` VALUES ('11', 'Дом разбитых сердец II, пепел', 'hobh-two', 'Вторая часть работы под общим названием \"Дом разбитых сердец\". Главная особенность данной компиляции в том, что абсолютно все треки - музыка \"наших\" исполнителей, это можно без труда заметить по треклисту. Вся музыка собиралась годами и тщательно фильтровалась. ', 'Вторая часть работы под общим названием \"Дом разбитых сердец\". Главная особенность данной компиляции в том, что абсолютно все треки - музыка \"наших\" исполнителей, это можно без труда заметить по треклисту. Вся музыка собиралась годами и тщательно фильтровалась. ', 'Вторая часть работы под общим названием \"Дом разбитых сердец\".', '1', 'MNT015', 'Indie, Lounge ', 'LAME 320kbps 44100Hz', '60:32', '1. Tokio - Когда ты плачешь \r\n2. Дельфин - Весна\r\n3. Без билета - Ромашка\r\n4. Земфира - Прости меня моя любовь\r\n5. Гришковец - Извини\r\n6. Ленинград - У меня есть все\r\n7. Грин грей - Осень\r\n8. 5\'nizza - Сюрная\r\n9. Океан ельзи - Вiдпусти\r\n10. Дельфин - Любовь\r\n11. T9 - Ода нашей любви\r\n12. Party makers - Новая любовь\r\n13. Нагано - Голос андеграунда\r\n14. Krec - Искра', '2009-02-23 00:00:00', '3', '2013-04-05 11:43:41');
INSERT INTO `post` VALUES ('12', 'Дом разбитых сердец III, такая Lite', 'hobh-three', 'Только тогда рождаются такие сеты, когда по-настоящему больно...', 'Только тогда рождаются такие сеты, когда по-настоящему больно...', 'Только тогда рождаются такие сеты, когда по-настоящему больно...', '1', 'MNT019', 'Rock, Alternative', 'LAME 320kbps 44100Hz', '58:25', '1. Radiohead - Street spirit\r\n2. Blink 182 - I miss you\r\n3. Khoiba - That reason\r\n4. Royksopp - Vision one \r\n5. Planet Funk - Ultraviolet days\r\n6. Depeche Mode - Freelove\r\n7. Red Hot Chili Peppers - Scar tissue\r\n8. Coldplay - Clocks\r\n9. Sum 41 - Pieces\r\n10. Three Days Grays - Home\r\n11. Linkin Park - In the end\r\n12. The Cardigans - Erase and rewind\r\n13. Air - How does it make you feel', '2009-10-14 00:00:00', '1', '2013-04-05 11:43:38');
INSERT INTO `post` VALUES ('13', 'Дом разбитых сердец 4, южные сны', 'hobh-four', 'Опять с разбитым сердцем, опять все болит, ноет и плачет… Не собирался компиляцию эту выпускать, по крайней мере так быстро, но так уж сошлись звезды.', 'Опять с разбитым сердцем, опять все болит, ноет и плачет… Не собирался компиляцию эту выпускать, по крайней мере так быстро, но так уж сошлись звезды, да и много чего накипело, поэтому высказался так, как смог. Многое мне очень близко в этих словах: «кое что между строк, кое что в кавычках». Спасибо парням, которые их пишут. Не относитесь серьезно к качеству, технике и другим бездушным параметрам, просто слушайте, если вам это близко.', 'Опять с разбитым сердцем, опять все болит, ноет и плачет… ', '1', 'MNT022', 'Hip-Hop', 'LAME 320kbps 44100Hz', '43:12', '1. Guf feat. Princip – Заходит луна\r\n2. Баста – Любовь без памяти\r\n3. Krec feat. Maestro A-Sid – Весна\r\n4. Каста – Встреча\r\n5. Смоки Мо – Герман и Патрик\r\n6. Дельфин – Надежда\r\n7. Guf feat. Ба – Дома\r\n8. Krec – Другие берега\r\n9. Лельфин – Любовь\r\n10. Михей и Джуманжи – Сука любовь\r\n11. Krec – Южные сны', '2010-05-18 00:00:00', '7', '2013-04-05 11:42:33');
INSERT INTO `post` VALUES ('14', 'Для клубных промоутеров', 'for-promouters', 'Родился и вырос в г.Новополоцке (Беларусь). Сейчас живу в Минске.\r\nЗакончил музыкальную школу по классу фортепиано (11 лет!!!). Из них 6 лет отбомбил в ударной группе духового оркестра.', '<img src=\"/content/images/cut.jpg\" style=\"margin: 0 0 10px 10px\" class=\"fr\" /><p><i>Я творю только тогда, когда приходит муза. Если сидеть и специально выдавливать из себя, то и результат получится соответствующий...</i></p><br /><p>Я родился и вырос в СССР, г.Новополоцк (Беларусь). Сейчас живу в Минске.</p><p>Закончил музыкальную школу по классу фортепиано (11 лет!!!). Из них 6 лет отбомбил в ударной группе духового оркестра.</p><p>Потом университет ПГУ, программное обеспечение информационных и интернет технологий, т.е. я - Программист, чем и зарабатываю себе на жизнь.</p><p>Интерес к музыке возник где-то в году \'98. Сначала это было как у большинства моих друзей - децл))), дельфин и земфира, а потом меня понесло в другую от всех сторону - freestylers, bonfunk mc\'s, потом the prodigy, scooter, chemical brothers и т.д.</p><p>По сути люблю deep, noise, drum, minimal и еще кучу других направлений и стилей, также и играю, почти все, что нравится.</p><p>Поворотные музыкальные моменты в жизни - Richie Hawtin, потом Lator, а с утра Слава Финист. Отсюда и началась эпопея с теч хаузом и минималом. Немаловажными в формировании вкуса были поездки на КаZАнтип в \'05 и \'06 годах. </p><p>Позже был лес, Olien, Goa Gil - так я познакомился и заинтересовался психоделикой. После чего и родился двойник Janaca Express, который в последствии был \"вживую\" сыгран в клубе ХХ век. </p><p>Долгое время очень интересовал драм, а точнее techstep, neurofunk и darkstep. Два основных фактора, повлиявших на это - первых 56 релизов лэйбла \"Subtitles\" и творчество монстра даркстепа - Current Value. На данный момент это направление не потеряно, а лишь развивается по своей тонкой линии.</p><p>Последние годы стал все больше возвращаться к хаузу и его техничному направлению вместе с исконным техно и минималом. Благодаря этому, собралась уже небольшая коллекция винила, также этому способствовало появление виниловых проигрывателей.</p><p>На новый 12-й год сделал себе подарок - собрал комплект трактора, чему был несказанно рад. Сейчас и использую преимущественно его.</p><p><strong>Люблю</strong>: Виниловые пластинки, рупорный аналоговый звук, полноформатные фотоаппараты, Sony и Adidas.</p><p><strong>Ненавижу</strong>: Телефон и беспорядок.</p><p><strong>Рекомендую</strong>: Стивен Содерберг, Трудности перевода.</p><p><strong>Интересуюсь</strong>: Музыка, акустика, фотография, космос, World of Tanks.</p><p><strong>Знаю</strong>: Несколько языков программирования, нотную грамоту и сольфеджио.</p><p><strong>Умею</strong>: Есть два понятия - хочу и мне лень, а про то что я не умею пока, мне расскажет гугл.</p>', 'Родился и вырос в г.Новополоцке (Беларусь). Сейчас живу в Минске.\r\nЗакончил музыкальную школу по классу фортепиано (11 лет!!!).', '0', '', '', '', '', '', '2013-01-01 15:32:50', '12', '2013-04-04 20:11:41');
INSERT INTO `post` VALUES ('16', 'Правила и Копирайт', 'copyrights', 'При использовании материалов с данного сайта, обязательна ссылка на сайт, автора и первоисточник!', '<p><strong>При использовании материалов с данного сайта, обязательна ссылка на сайт, автора и первоисточник!</strong></p><p>Информация для правообладателей</p><p>Если Вы являетесь правообладателем какого-либо материала, ссылка (либо ссылки) на который размещена на этом сайте, и не хотели бы чтобы данная информация распространялась пользователями без Вашего на то согласия, то мы будем рады оказать Вам содействие, удалив соответствующие ссылки.</p><p>Для этого необходимо, чтобы вы прислали нам письмо (в электронном виде) в котором указали нам следующую информацию:<ol><li>Документальное подтверждение ваших прав на материал, защищенный авторским правом:<ul><li>Отсканированный документ с печатью, либо</li><li>Email с официального почтового домена компании правообладателя, либо</li><li>Иная контактная информация, позволяющая однозначно идентифицировать вас, как правообладателя данного материала.<li></ul></li><li>Текст который Вы желаете разместить в сопровождении удаляемой информации. В нем вы можете указать где, и на каких условиях можно получить информацию, ссылки на которую были удалены, а так же ваши контактные данные, для того чтобы пользователи могли получить от вас всю интересующую их информацию относительно данного материала.</li><li>Прямые ссылки на страницы сайта, которые содержат ссылки на данные, которые необходимо удалить. Ссылки должны иметь вид http://manti.by/xxxx/xx/xx либо подобный.</li></ol><p>После этого, в течении 48 часов, мы удалим интересующие Вас ссылки с сайта.</p><p><strong>ВНИМАНИЕ!!!</strong></p><p>Мы оставляем за собой право публикации на сайте любой информации присланной нам по почте через форму обратной связи.</p><p>Мы не осуществляем контроль за действиями пользователей, которые могут повторно размещать ссылки на информацию, являющуюся объектом вашего авторского права. Любая информация на форуме, размещается автоматически, без какого либо контроля с чьей либо стороны, что соответствует общепринятой мировой практике размещения информации в сети интернет. Однако, мы в любом случае рассмотрим все Ваши запросы, относительно ссылок на информацию, нарушающую Ваши права.</p><p>Согласно закону об Авторском и Смежном правах, ссылка на любые данные (информационное сообщение), сама по себе, не является объектом авторского права. Таким образом, не стоит присылать письма содержащие угрозы либо требования, как не имеющие под собой реальных оснований.</p>', 'При использовании материалов с данного сайта, обязательна ссылка на сайт, автора и первоисточник!', '0', '', '', '', '', '', '2013-01-01 15:32:50', '1', '2013-04-04 18:39:50');
INSERT INTO `post` VALUES ('17', 'Bar La\'unge live', 'bar-launge', 'Приятное сочетание лаунжа, драма, айсид джаза.', 'Приятное сочетание лаунжа, драма, айсид джаза.', 'Приятное сочетание лаунжа, драма, айсид джаза.', '1', 'MNT008', 'Lounge, Acid Jazz', 'LAME 192kbps 44100Hz', '67:34', '1. Groove Armada - Suntoucher\r\n2. Lemon Jelly - 95 aka make things right  \r\n3. One Self - Unfamilar places\r\n4. Dj Dobry Chlopak - Waco (Pono pele)\r\n5. Bebel Gilberto - Aganju (John Beltram mix)    \r\n6. Copabossa - Mihna (Namorada mix)\r\n7. Jehro - All I want  \r\n8. Ohm G & Bruno - One  \r\n9. Linn & Freddie - Live 4 love  \r\n10. Aural Float - Still here  \r\n11. LTJ Bukem - Journey inward\r\n12. Nookie - Natural experience\r\n13. Macoto - Where are you going?\r\n14. Vice versa - Still don\'t it\r\n15. Telepopmusik - Yesterday was a lie', '2007-10-27 00:00:00', '2', '2013-04-05 11:47:09');
INSERT INTO `post` VALUES ('18', 'Special mix for Basstech', 'basstech', 'Сет записан специально для программы BASSTECH (novoeradio.by/basstech). Все треки сведены \"вживую\" в гостях у Ильи (Dj Hotei), за что ему большое спасибо.', 'Сет записан специально для программы BASSTECH (<a href=\"http://novoeradio.by/basstech\">novoeradio.by/basstech</a>). Все треки сведены \"вживую\" в гостях у Ильи (Dj Hotei), за что ему большое спасибо.\r\n\r\nПеределки: до – подправил трек \"Im gonna bite you\", заменил конец и перенес его в середину, и подправил трек \"GITS\", приклеив в начале и в конце ОРИГИНАЛЬНЫЙ саундтрек к аниме \"Ghost in the shell\"; после записи единственным усовершенствованием был мастеринг (Izotope Ozone, L2).\r\n\r\nПрактически все треки представляют собой классический нейрофанк, часть треков европейский (Noisia, Spor), часть российский (Marqus, Paperclip).', 'Сет записан специально для программы BASSTECH (novoeradio.by/basstech). Все треки сведены \"вживую\" в гостях у Ильи (Dj Hotei), за что ему большое спасибо.', '1', 'MNT018', 'Neurofunk, Technoid', 'LAME 320kbps 44100Hz', '58:42', '1. Engage - Im gonna bite you\r\n2. Marqus - Angel  \r\n3. Bes & Flame - Eurofunk  \r\n4. Noisia - Exorcism\r\n5. Skynet - Carbon shock (Noisia remix)      \r\n6. Noisia - Block control  \r\n7. Hightech - GITS  \r\n8. Marqus - Mirage  \r\n9. Paperclip - Shogun  \r\n10. Paperclip - Bearing death  \r\n11. Spor - Supernova  \r\n12. Noisia, Maldini and Vegas - Meditation\r\n13. Quadrant - Rage and rapture  ', '2009-05-21 00:00:00', '2', '2013-04-05 11:44:05');
INSERT INTO `post` VALUES ('19', 'Mix for Basstech part 2', 'basstech-2', 'Второй выход на программе BASSTECH (novoeradio.by/basstech). Все треки сведены \"вживую\", правда на скорую руку, поэтому немного пострадало качество, но тем не менее сет есть и его можно слушать. ', 'Второй выход на программе BASSTECH (<a href=\"http://novoeradio.by/basstech\">novoeradio.by/basstech</a>). Все треки сведены \"вживую\", правда на скорую руку, поэтому немного пострадало качество, но тем не менее сет есть и его можно слушать. \r\n\r\nБольшинство треков \"отечественного\" производителя, представляющие собой Русский нейрофанк, от диповых и лайтовых направлений, до самых жирных и безкомпромисных. Есть и немного техноида, для любителей прямой и сумашедшей бочки...', 'Второй выход на программе BASSTECH. Все треки сведены вживую, правда на скорую руку, поэтому немного пострадало качество, но тем не менее сет ', '1', 'MNT020', 'Neurofunk, Technoid', 'LAME 320kbps 44100Hz', '56:18', '1. Strauss - Also sprach Zarathustra op.30 (Introduction)\r\n2. Miditacia - Power station  \r\n3. Miditacia - Anomalies  \r\n4. Brainfuzz - Scope  \r\n5. Hedj & Proktah - Rhino    \r\n6. Receptor - Rhyno    \r\n7. Marqus - Paranoik  \r\n8. Rregula and Dementia - Fortress  \r\n9. Isotop feat Shots and Kaiza - Kartago\r\n10. Dereck - Apollo    \r\n11. Nickbee - Iodine  \r\n12. Paperclip - Infinite drift  \r\n13. Receptor - Kurchatov      \r\n14. Telefon tel aviv - Fahrenheit fair enough (Prefuse 73 bonus beats remix)', '2010-02-04 00:00:00', '2', '2013-04-05 11:43:32');
INSERT INTO `post` VALUES ('20', 'Chillhouse live', 'chillhouse-live', 'Практически классический хаус с некоторыми примесями дипа и теч ноток. Записан \"вживую\" в клубе ХХ век. ', 'Практически классический хаус с некоторыми примесями дипа и теч ноток. Записан \"вживую\" в клубе ХХ век. ', 'Практически классический хаус с некоторыми примесями дипа и теч ноток. Записан \"вживую\" в клубе ХХ век. ', '1', 'MNT012', 'Deep House, Tech House', 'LAME 320kbps 44100Hz', '68:44', '', '2008-11-08 00:00:00', '2', '2013-04-05 11:45:40');
INSERT INTO `post` VALUES ('21', 'Emofunk (Christmas rave) live', 'emofunk-', 'Предновогодний рэйв с участием: Boro&Moff, Izo, Ipomea, valCool, Enegy.\r\nБыло ТРИ литра водки и много-много трупов... ', 'Предновогодний рэйв с участием: Boro&Moff, Izo, Ipomea, valCool, Enegy.\r\nБыло ТРИ литра водки и много-много трупов... ', 'Предновогодний рэйв с участием: Boro&Moff, Izo, Ipomea, valCool, Enegy.\r\nБыло ТРИ литра водки и много-много трупов... ', '1', 'MNT014', 'Neurofunk, Technoid', 'LAME 320kbps 44100Hz', '51:11', '', '2008-12-27 00:00:00', '1', '2013-04-05 11:44:53');
INSERT INTO `post` VALUES ('22', 'Cote d\'Azur promo', 'cote-d-azur', 'Летний, летний микс, который лучше слушать стоя на песке и вдыхая запах соленого морского воздуха. Многое навеяно летней погодой, оупенами и людьми, которые меня окружали все это время.', 'Летний, летний микс, который лучше слушать стоя на песке и вдыхая запах соленого морского воздуха. Многое навеяно летней погодой, оупенами и людьми, которые меня окружали все это время.\r\n\r\nПо сути своей является сборкой лучших треков из двух моих различных компилов за летний период. Так что слушаем и наслаждаемся.', 'Летний, летний микс, который лучше слушать стоя на песке и вдыхая запах соленого морского воздуха.', '1', 'MNT030', 'Tech House', 'LAME 320kbps 44100Hz', '1:00:38', '1. Strict Border - Reboot Me (Hermanez remix) - Suara\r\n2. Danny Serrano & Westboy - Bubblegun - Suara\r\n3. Juliet Sikora, Tube & Berger - Jam Word Up (Original mix) - Kittball\r\n4. MSMS - Hold it (Original mix) - Plastic city\r\n5. Marco Bailey - Rubber band - Bedrock\r\n6. Piek - Burn Baby Burn (Siwell Remix) - Sphera\r\n7. Taster Peter, Phunx - Jack This Tune (Mario Ochoa remix) - Bitten\r\n8. Tiger Stripes - Give You Up - Toolroom\r\n9. Richard Grey - You are my high (Federico Scavo remix) - Tiger\r\n10. Marco Bailey - Jungle laps - Bedrock\r\n11. Oscar Barila and Maiki - Debbie white (Simone Tavazzi remix) - Kostbar\r\n12. Andrew Bayer - Gaff\'s Eulogy - Anjunadeep', '2012-08-25 00:00:00', '4', '2013-04-05 11:37:52');
INSERT INTO `post` VALUES ('23', 'All she wants is (SCSI device)', 'all-she-wants-is', 'Одна из первых и очень старых работ, сделанная под впечатлением и польско-немецких техно отцов...', 'Одна из первых и очень старых работ, сделанная под впечатлением и польско-немецких техно отцов...', 'Одна из первых и очень старых работ, сделанная под впечатлением и польско-немецких техно отцов...', '1', 'MNT002', 'Tech House, Deep House', 'LAME 320kbps 44100Hz', '1:11:39', '', '2005-10-12 00:00:00', '1', '2013-04-05 11:48:11');
INSERT INTO `post` VALUES ('24', 'IRIS, it\'s all about me promo', 'iris', 'Очень длительная и кропотливая работа, как технически, так и идейно. Выдержана в классическом стиле deep house, с привнесением ноток Tech House и Deep House.', 'Очень длительная и кропотливая работа, как технически, так и идейно. Выдержана в классическом стиле deep house, с привнесением ноток Tech House и Deep House.', 'Очень длительная и кропотливая работа, как технически, так и идейно. Выдержана в классическом стиле deep house, с привнесением ноток Tech House и De', '1', 'MNT004', 'Deep House, Tech House', 'LAME 320kbps 44100Hz', '1:00:15', '1. Lator - Rolling children  \r\n2. Acos CoolKAs feat. Metropoliz - Friends (Vocal mix)\r\n3. Brooks - Pink Sigarettes (Ajazz mix)\r\n4. Raz Ohara - This\'a beautiful day (Mathias Schaffhauser mix)  \r\n5. Jussipekka - Breeze\r\n6. Gamat 3000 - Whispering  \r\n7. Phunk Diggaz - Whispers  \r\n8. Terry Lee Brown Jr. - Bad house music (Dub\'98)  \r\n9. Plank 15 - Strings of life  \r\n10. Lator - Clown fish (kaZantip mix)  ', '2007-02-18 00:00:00', '1', '2013-04-05 11:48:09');
INSERT INTO `post` VALUES ('25', 'Hi-Pass live', 'hi-pass', 'Сладкий летний микс на популярные минимальные темы. \r\n', 'Сладкий летний микс на популярные минимальные темы. \r\n\r\nРассвет в июне: \"... у нас было два пакета травы, 75 таблеток мискалина, 5 упаковок кислоты, пол солонки кокаина и бесконечное множество транквилизаторов всех сортов и расцветок, а также текила, ром, ящик пива, пинта чистого эфира и амил нитрат...\" Хантера С. Томпсон.', 'Сладкий летний микс на популярные минимальные темы. ', '1', 'MNT005', 'Tech House, Minimal Techno', 'LAME 160kbps 44100Hz', '53:22', null, '2007-06-05 00:00:00', '4', '2013-04-05 11:46:45');
INSERT INTO `post` VALUES ('26', 'Janaca express part 01', 'janaca-express', 'Микс, состоящий из двух частей, какждая из которых отличается как эмоционально, так технически и стилистически. В то же время весь материал поддерживает идею трансовой приходелической музыки, хотя и не так глубоко, как классический псай.', 'Микс, состоящий из двух частей, какждая из которых отличается как эмоционально, так технически и стилистически. В то же время весь материал поддерживает идею трансовой приходелической музыки, хотя и не так глубоко, как классический псай.\r\n\r\nБудет особенно интесно тем, кто не любит классический, довольно жестокий псай, но в то же время интересуется довольно быстрыми формами (около 145bpm).', 'Микс, состоящий из двух частей, какждая из которых отличается как эмоционально, так технически и стилистически. В то же время весь матери', '1', 'MNT006', 'Goa Trance, Psy Trance', 'LAME 192kbps 44100Hz', '1:00:39', '1. Silicon Sound feat. Psychotrop - Departure\r\n2. Silent Sphere - Violet visions  \r\n3. Electro Sun - High cue  \r\n4. Astrix - Tweaky  \r\n5. Psypsiq Jicuri - A rain of hope in the galaxy  \r\n6. Xerox & Illumination - Temporary insanity  \r\n7. Astrix - Techno widows  \r\n8. Delerious - Dynamic force\r\n9. Astrix feat. Michele Adamson - Closer to heaven  ', '2007-09-10 00:00:00', '3', '2013-04-05 11:47:52');
INSERT INTO `post` VALUES ('27', 'Janaca express part 02', 'janaca-express-01', 'Вторая часть моего трипа в зазеркалье...', 'Вторая часть моего трипа в зазеркалье...', 'Вторая часть моего трипа в зазеркалье...', '1', 'MNT009', 'Goa Trance, Psy Trance', 'LAME 192kbps 44100Hz', '59:38', '1. Intro - Tristan  \r\n2. Quantum feat. Keren Porat - Janaca express\r\n3. Rocky vs. Galactika - Global air (Monster edit)  \r\n4. Zen Mechanics - Vurt  \r\n5. Space Vision - Mascer jedi\r\n6. Lucy - Flash damage\r\n7. Insomnia - The real thing  \r\n8. Magoon - Future\r\n9. Sangeet - Distorted dream\r\n10. Vibe Tribe - Kick the bass  ', '2007-10-27 00:00:00', '3', '2013-04-05 11:47:29');
INSERT INTO `post` VALUES ('28', 'Marrakesh', 'marrakesh', 'Воcточное тепло, пряности и ритмы. Смесь индастриала и медитаций на вольные темы...', 'Воcточное тепло, пряности и ритмы. Смесь индастриала и медитаций на вольные темы...', 'Воcточное тепло, пряности и ритмы. Смесь индастриала и медитаций на вольные темы...', '1', 'MNT010', 'Chillout, Ambient', 'LAME 192kbps 44100Hz', '56:48', '1. Deepac Ram - Between thoughts\r\n2. Trianglesun - Budha\r\n3. Enamoured - Mooli\r\n4. Pete Vicary - D-maddix\r\n5. Monsoon Day - Spice trail\r\n6. Muslimgauze - Hussein Mahmood Jeeb Tehar Gass  \r\n7. Slack Baba - Drink more tea (Herbal mix)  \r\n8. Enrico Experience - Bine el barah quel liom\r\n9. Vibrasphere - San Pedro  ', '2008-01-07 00:00:00', '2', '2013-04-05 11:44:58');
INSERT INTO `post` VALUES ('29', 'Helloween live', 'helloween-live', 'Первый опыт работы с дрымдыбасом, с его довольно агрессивным и жестким направлением neurofunk. Технически не все так гладко, но, по-моему, компиляция сглаживает эти огрехи...', 'Первый опыт работы с дрымдыбасом, с его довольно агрессивным и жестким направлением neurofunk. Технически не все так гладко, но, по-моему, компиляция сглаживает эти огрехи...\r\n\r\nСподвигли меня на этот эксперимент с дрымдыбасом, \\\"случайно\\\" скачанные первые 56 релизов лэйбла SUBTITLES)))', 'Первый опыт работы с дрымдыбасом, с его довольно агрессивным и жестким направлением neurofunk. Технически не все так гладко, но, по-моему, ком', '1', 'MNT011', 'Neurofunk, Technoid', 'LAME 320kbps 44100Hz', '36:01', '', '2008-10-31 00:00:00', '3', '2013-04-05 11:46:30');
INSERT INTO `post` VALUES ('30', 'Janaca Express live', 'janaca-express-live', 'Живая версия двух частей гоа трипа Janaca Express, записанного в прошлом году...', 'Живая версия двух частей гоа трипа Janaca Express, записанного в прошлом году...', 'Живая версия двух частей гоа трипа Janaca Express, записанного в прошлом году...', '1', 'MNT013', 'Goa Trance, Psy Trance', 'LAME 320kbps 44100Hz', '1:04:26', '1. Silicon Sound feat. Psychotrop - Departure\r\n2. Silent Sphere - Violet visions \r\n3. Electro Sun - High cue \r\n4. Astrix - Tweaky \r\n5. Psypsiq Jicuri - A rain of hope in the galaxy \r\n6. Xerox & Illumination - Temporary insanity \r\n7. Astrix - Techno widows \r\n8. Delerious - Dynamic force\r\n9. Astrix feat. Michele Adamson - Closer to heaven', '2008-11-08 00:00:00', '3', '2013-04-05 11:46:06');
INSERT INTO `post` VALUES ('31', 'Killing machine', 'killing-machine', 'Мрачнейший микс в моей жизни, даже вся серия гоа и рядом не стояла по жестокости. Записан микс был после долгих экспериментов в клубах, над теми кому \\\"побарабану\\\".', 'Мрачнейший микс в моей жизни, даже вся серия гоа и рядом не стояла по жестокости. Записан микс был после долгих экспериментов в клубах, над теми кому \\\"побарабану\\\". Технически - лапата, пару мест просто захлебывались от количества звука.\r\n\r\nМикс был записан в домашних условиях, причем разные куски в разных программах. Использовал практически весь спектр своего софта:\r\nSamplitude: intro, duomix и конечный мастеринг.\r\nAbleton: darkstep\\\'овая часть.\r\nTracktor: technoid\\\'ная часть.', 'Мрачнейший микс в моей жизни, даже вся серия гоа и рядом не стояла по жестокости. Записан микс был после долгих экспериментов в клубах, на', '1', 'MNT016', 'Darkstep, Technoid', 'LAME 320kbps 44100Hz', '49:55', '1. Intro - Red or blue (Matrix)\r\n2. Current Value & Donny - Nightmare man  \r\n3. Limewax - One of them (Current Value remix)    \r\n4. Counterstrike - Stardurst\r\n5. Limewax - Cracking core (Technical Itch vip mix)\r\n6. Prozac & Ethex - The game\r\n7. Current Value - Stomache\r\n8. Dying Punks & Current Value - Love all the people    \r\n9. Paperclip - Simple access  \r\n10. Limewax vs. Phobos feat. SPL - He will find us (Duomix)\r\n11. Oceanlab - Clear blue water (Current Value remix)    ', '2009-03-15 00:00:00', '4', '2013-04-05 11:44:43');
INSERT INTO `post` VALUES ('32', 'Trauma ', 'trauma', 'Этот сет, как никакой другой выстрадан физически и придуман в травматологическом отделении больницы моего родного города, после жесткого падения на горных лыжах.', 'Этот сет, как никакой другой выстрадан физически и придуман в травматологическом отделении больницы моего родного города, после жесткого падения на горных лыжах.\r\n\r\nПрактически полностью сет скомпилен в больнице, позже собран одной (целой) рукой при помощи ACID Pro от компании Sony и пары стандартных примочек: Ozone, GCO, Elephant и т.п.\r\n\r\nСет передает всю ту широкую гамму ощущений, которые можно испытать в наших государственных больницах...', 'Этот сет, как никакой другой выстрадан физически и придуман в травматологическом отделении больницы моего родного города, после жестко', '1', 'MNT023', 'Neurofunk, Technoid', 'LAME 320kbps 44100Hz', '53:29', '1. Real - When the dream\\\'s done\r\n2. Cliffhanga - Centipede\r\n3. Paperclip & Malk - Detective  \r\n4. Paperclip & Flame - Bad illumination\r\n5. EBK - Soma\r\n6. Black Sun Empire - Kempi (feat. Nymfo)    \r\n7. Unknown Error - Dark wars  \r\n8. Receptor & Engage - Wi-fi waves  \r\n9. Black Sun Empire - Wasteland (feat. SPL)    \r\n10. Flame - Prehistoric (vip mix)  \r\n11. Katharsys & Gancher - Sky from beyond  \r\n12. Pyro - Restless (Katharsys remix)\r\n13. Nphonix & Enei - Quicksilver    \r\n13. Receptor - Princess  ', '2011-03-03 00:00:00', '5', '2013-04-05 11:42:16');
INSERT INTO `post` VALUES ('33', 'Renaissance promo', 'renaissance', 'Утром всегда встает солнце...\r\nСет - логическое продолжение предыдущей работы, под названием Trauma. В целом не стал перечить себе и нарушать свои традиции - все технично, хороший мастеринг, в начале пожирнее, в конце побыстрее... ', 'Утром всегда встает солнце...\r\nСет - логическое продолжение предыдущей работы, под названием trauma. В целом не стал перечить себе и нарушать свои традиции - все технично, хороший мастеринг, в начале пожирнее, в конце побыстрее... ', 'Утром всегда встает солнце...\r\nСет - логическое продолжение предыдущей работы, под названием Trauma. В целом не стал перечить себе и нарушат', '1', 'MNT024', 'Neurofunk, Technoid', 'LAME 320kbps 44100Hz', '1:02:53', '1. Gravediggazz - Trippin (intro)\r\n2. Allied - N-sphere  \r\n3. Asphexia - Profusion  \r\n4. Inside Info - Metronome\r\n5. Encode - None  \r\n6. Malk - Made in sikness\r\n7. Nphonix - False flag    \r\n8. Receptor - Lullaby  \r\n9. Int Company - Uppi    \r\n10. Redject - 7th sorrow\r\n11. Hector - Suddenly (tribute to E.Letov)  \r\n12. Sintax - Metro    \r\n13. Switch Technique - Metro\r\n14. Bop - As is', '2011-05-30 00:00:00', '6', '2013-04-05 11:41:15');
INSERT INTO `post` VALUES ('34', 'Exception', 'exception', 'Этот сет является продолжением серии минималистичных нейро миксов, продолжением работы под названием Katana.', 'Этот сет является продолжением серии минималистичных нейро миксов, продолжением работы под названием Katana.\r\nОдна из первых работ полностью записанная в живую на моем тракторе (Traktor Pro + X1 + TA6), немного была подмастерена, но в целом осталась довольно живой.\r\nПравда, часть свежих треков не вошла в микс, но они попадут в следующий, который уже понемногу собирается.', 'Этот сет является продолжением серии минималистичных нейро миксов, продолжением работы под названием Katana.', '1', 'MNT026', 'Techstep, Neurostep', 'LAME 320kbps 44100Hz', '51:35', '1. Mortem - Monoveler\r\n2. Icicle - Alien Groove\r\n3. Paimon - Hellraiser  \r\n4. Science Fiction - Abyss  \r\n5. Mortem - Get Close\r\n6. June Miller - Snapcase\r\n7. Alix Perez - Exemption\r\n8. Kabuki & Savine - Backup\r\n9. The Countamen & Alley Cat - Payload (Konflict remix)\r\n10. Science Fiction - Bystander effect  \r\n11. Nickbee & Malc - Cosmos\r\n12. Icicle, Distance - Exhale', '2012-04-25 00:00:00', '4', '2013-04-05 11:40:10');
INSERT INTO `post` VALUES ('35', 'Progress R-7A', 'progress', 'Я не особо люблю Брейкс, но когда эта музыка сопровождается прогрессив атмосферой - получаются просто бесподобные вещи.', 'Я не особо люблю Брейкс, но когда эта музыка сопровождается прогрессив атмосферой - получаются просто бесподобные вещи.', 'Я не особо люблю Брейкс, но когда эта музыка сопровождается прогрессив атмосферой - получаются просто бесподобные вещи.', '1', 'MNT028', 'Progressive breaks', 'LAME 320kbps 44100Hz', '56:18', '1. Abdomen Burst - Lullaby (Original Mix)\r\n2. Jamie Stevens - The Night Before (Momu Remix)\r\n3. Rhino Drum - Underground Sound (Fretwell Remix) \r\n4. Neo - Aura (Cosmonaut-Rework)\r\n5. Pilot - Dilema (Plastic Shell Remix)\r\n6. Pete Gawtry - It\\\'s Life (Wrecked Angle Remix)\r\n7. Plastic Shell - Hard Way (Original Mix) \r\n8. Cosmonaut feat. Мумий Троль - Иди, я буду\r\n9. Shiloh - Dream On (Original Mix)\r\n10. Pinkbox Special - Nice Guys Finish Last (Original Mix)', '2012-06-01 00:00:00', '4', '2013-04-05 11:40:08');
INSERT INTO `post` VALUES ('36', 'Enzo cafe live', 'enzo-cafe', 'Живой микс для Enzo cafe (Минск, Беларусь)', 'Живой микс для Enzo cafe (Минск, Беларусь)', 'Живой микс для Enzo cafe (Минск, Беларусь)', '1', 'MNT029', 'Tech House, Deep House', 'LAME 320kbps 44100Hz', '1:01:13', '1. La Fleur - Ten Fingers (Original Mix) \r\n2. Boss Axis - Cologne (Rodriguez Jr. remix)\r\n3. Tiefschwarz - I can\\\'t resist (feat. Dave Aju)\r\n4. Sebo K - Mr. Duke (Alternative version)\r\n5. Martin Landsky - Morning Caffeine (Organ Dub)\r\n6. Bambook feat. Arkanna - Off the system (Beat Factory remix)\r\n7. FCODE - Mixture (original mix)  \r\n8. Noir & Chris Minus - Sleep no more (vocal mix)\r\n9. Tojami Sessions - Tetra\r\n10. Strict Border - Pianist In The Zoo\r\n11. Strict Border - Rendevouz\r\n12. MSMS - Juice', '2012-06-30 00:00:00', '5', '2013-04-05 11:40:35');
INSERT INTO `post` VALUES ('37', 'Stockholm syndrome - Backset', 'stockholm-syndrome-backset', 'Продолжение работы над собой. Второй микс из серии \"Stockholm syndrome\".', 'Продолжение работы над собой. Второй микс из серии \"Stockholm syndrome\".', 'Продолжение работы над собой. Второй микс из серии \"Stockholm syndrome\".', '1', 'MNT032', 'Tech House, Deep House', 'LAME 320kbps 44100Hz', '1:00:01', '1. Tube & Berger & Milan Euringer - Lovebreak (Original mix)\r\n2. Shades Of Gray - Crazee\r\n3. Layo & Bushwaka feat. Kim Ann Foxman - Cant hurt you (Original mix)\r\n4. Marc Romboy - More Muzik (Original mix)\r\n5. Darling Farah - Body (Jimmy Edgar remix)\r\n6. Tom Novy - Walking On the Moog (caTekk Remix)\r\n7. Kink - E79\r\n8. Norm - Foco (Paul Jey remix)\r\n9. Takt Tick - Gloomy Dawn (Original mix)\r\n10. Danny Daze and Matches - If this\r\n11. Vas Floyd - Deep house soul (Vas Floyd & Mr Jones strings mix)\r\n12. Terry Lee Brown Junior - Delightful encounter', '2012-11-27 00:00:00', '6', '2013-04-05 11:48:26');
INSERT INTO `post` VALUES ('38', 'Reach out of the Sun', 'reach', 'Странные весенние настроения и куча различных событий в личной, и не только, жизни привели к созданию этой компиляции.', 'Странные весенние настроения и куча различных событий в личной, и не только, жизни привели к созданию этой компиляции.\r\nДанная работа, что-то среднее между сериями Дом разбитых сердец, пепел и Synthetic, с первым по-большей части эмоционально, а со вторым по звуку и общей атмосфере...', 'Странные весенние настроения и куча различных событий в личной, и не только, жизни привели к созданию этой компиляции.', '1', 'MNT033', 'Ambient, Chillout', 'LAME 320kbps 44100Hz', '1:05:37', '1. Idex - Arc 07\r\n2. Kriipis Tulo - The deep of the night\r\n3. Apparat - Black water\r\n4. June Miller - Coming Closer\r\n5. Ishome - Earth\r\n6. Digital Mystery Tour - The Blooming  \r\n7. Late - Dreams are    \r\n8. Monoceros - Monocrom    \r\n9. Oak - Otaku\r\n10. Monokle - Warm control\r\n11. Electrosoul system - Morning Forest\r\n12. Synkro - Spirals\r\n13. Nanobyte - Lost time\r\n14. Monolake - Television tower    ', '2013-03-05 00:00:00', '8', '2013-04-05 11:38:43');
INSERT INTO `post` VALUES ('39', 'Топливо для танка (НЛП)', 'nlp', 'Пожалуй единственная на данный момент Hip-Hop компиляция в чистом виде, сборник моих любимых треков.', 'Пожалуй единственная на данный момент Hip-Hop компиляция в чистом виде, сборник моих любимых треков.', 'Пожалуй единственная на данный момент Hip-Hop компиляция в чистом виде, сборник моих любимых треков.', '1', 'MNTE01', 'Rap, Hip-Hop', 'LAME 320kbps 44100Hz', '1:13:57', '1. Jahmal TGK - Моя Свобода\r\n2. Витя АК47 feat. Купэ - В тепле 2 яйца\r\n3. РоМД a.k.a. Рэм Дигга - Кто бы это мог быть\r\n4. РоМД a.k.a. Рэм Дигга - Виниловый Рома (Скит)\r\n5. NINTENDO - Криминал\r\n6. Jahmal TGK - Лада плывёт\r\n7. TRIAGRUTRIKA feat. АК47, Восточный Округ, Лёша Маэстро (WB) - Всем\r\n8. КРП a.k.a. Купэ feat. Гуф - Oрел или решка\r\n9. Баста и Guf - Если бы+ (Scratch DJ Mixoid)\r\n10. CENTR - Хип-хоп\r\n11. Guf - Metropolitan mail\r\n12. Кровосток - Сдавать говно\r\n13. Slim - Под пальмами\r\n14. РоМД a.k.a. Рэм Дигга - Мутки\r\n15. CENTR - Сосулька (скит)\r\n16. Витя АК & Tip & Зевс - Че такого\r\n17. TRIAGRUTRIKA feat. Витя АК - Чемодан лавэ\r\n18. Баста и Guf - Не всё потеряно пока (Scratch DJ Tactics)\r\n19. Guf feat. Ба - Дома\r\n20. TRIAGRUTRIKA feat. Лёша Маэстро (WB), Ramzes (ОДБР) - Мой город не спит', '2011-10-12 00:00:00', '6', '2013-04-05 11:41:14');
INSERT INTO `post` VALUES ('40', 'My friend Friday', 'my-friend-friday', 'Спонтанный пятничный микс...', 'Спонтанный пятничный микс...', 'Спонтанный пятничный микс...', '1', 'MNTE02', 'Tech House, Deep House', 'LAME 320kbps 44100Hz', '37:15', '1. Milton Jackson - Breathe (David Labeij remix)\r\n2. Lee Van Dowski - Not A Remix (Original mix)\r\n3. DJ Smilk, Juan Ddd - Dollar bills\r\n4. The Messenger - Preachin\\\' Out\r\n5. Luca M & Just2 - Peak Week (Original mix)\r\n6. Per Hammar, Frida Fralk - Get that\r\n7. Oscar Barila - Yoda (Original mix)\r\n8. Tube & Berger - Fog Head (Louis Osbourne & Jamie Anderson remix)', '2013-01-18 00:00:00', '4', '2013-04-05 11:35:49');

-- ----------------------------
-- Table structure for `post_files`
-- ----------------------------
DROP TABLE IF EXISTS `post_files`;
CREATE TABLE `post_files` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` int(10) unsigned NOT NULL,
  `file_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_post_file` (`post_id`,`file_id`) USING BTREE,
  KEY `fk_post_files_post_id` (`post_id`) USING BTREE,
  KEY `fk_post_files_file_id` (`file_id`) USING BTREE,
  CONSTRAINT `post_files_ibfk_1` FOREIGN KEY (`file_id`) REFERENCES `files` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `post_files_ibfk_2` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=194 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of post_files
-- ----------------------------
INSERT INTO `post_files` VALUES ('17', '1', '193');
INSERT INTO `post_files` VALUES ('18', '1', '194');
INSERT INTO `post_files` VALUES ('16', '1', '205');
INSERT INTO `post_files` VALUES ('8', '3', '195');
INSERT INTO `post_files` VALUES ('9', '3', '199');
INSERT INTO `post_files` VALUES ('7', '3', '204');
INSERT INTO `post_files` VALUES ('14', '4', '196');
INSERT INTO `post_files` VALUES ('15', '4', '197');
INSERT INTO `post_files` VALUES ('13', '4', '202');
INSERT INTO `post_files` VALUES ('26', '5', '198');
INSERT INTO `post_files` VALUES ('27', '5', '200');
INSERT INTO `post_files` VALUES ('25', '5', '203');
INSERT INTO `post_files` VALUES ('87', '6', '216');
INSERT INTO `post_files` VALUES ('88', '6', '217');
INSERT INTO `post_files` VALUES ('86', '6', '221');
INSERT INTO `post_files` VALUES ('90', '8', '218');
INSERT INTO `post_files` VALUES ('91', '8', '219');
INSERT INTO `post_files` VALUES ('89', '8', '220');
INSERT INTO `post_files` VALUES ('153', '9', '222');
INSERT INTO `post_files` VALUES ('152', '9', '223');
INSERT INTO `post_files` VALUES ('154', '9', '224');
INSERT INTO `post_files` VALUES ('37', '10', '226');
INSERT INTO `post_files` VALUES ('38', '10', '230');
INSERT INTO `post_files` VALUES ('39', '10', '234');
INSERT INTO `post_files` VALUES ('40', '11', '227');
INSERT INTO `post_files` VALUES ('41', '11', '231');
INSERT INTO `post_files` VALUES ('42', '11', '235');
INSERT INTO `post_files` VALUES ('43', '12', '228');
INSERT INTO `post_files` VALUES ('44', '12', '232');
INSERT INTO `post_files` VALUES ('45', '12', '236');
INSERT INTO `post_files` VALUES ('46', '13', '229');
INSERT INTO `post_files` VALUES ('47', '13', '233');
INSERT INTO `post_files` VALUES ('48', '13', '237');
INSERT INTO `post_files` VALUES ('185', '17', '499');
INSERT INTO `post_files` VALUES ('186', '17', '500');
INSERT INTO `post_files` VALUES ('187', '17', '501');
INSERT INTO `post_files` VALUES ('170', '18', '502');
INSERT INTO `post_files` VALUES ('171', '18', '503');
INSERT INTO `post_files` VALUES ('172', '18', '504');
INSERT INTO `post_files` VALUES ('167', '19', '505');
INSERT INTO `post_files` VALUES ('168', '19', '506');
INSERT INTO `post_files` VALUES ('169', '19', '507');
INSERT INTO `post_files` VALUES ('176', '20', '508');
INSERT INTO `post_files` VALUES ('177', '20', '509');
INSERT INTO `post_files` VALUES ('178', '20', '510');
INSERT INTO `post_files` VALUES ('64', '21', '511');
INSERT INTO `post_files` VALUES ('65', '21', '512');
INSERT INTO `post_files` VALUES ('66', '21', '513');
INSERT INTO `post_files` VALUES ('155', '22', '514');
INSERT INTO `post_files` VALUES ('156', '22', '515');
INSERT INTO `post_files` VALUES ('157', '22', '516');
INSERT INTO `post_files` VALUES ('75', '23', '225');
INSERT INTO `post_files` VALUES ('76', '23', '546');
INSERT INTO `post_files` VALUES ('74', '23', '564');
INSERT INTO `post_files` VALUES ('77', '24', '201');
INSERT INTO `post_files` VALUES ('78', '24', '518');
INSERT INTO `post_files` VALUES ('79', '24', '553');
INSERT INTO `post_files` VALUES ('84', '25', '238');
INSERT INTO `post_files` VALUES ('83', '25', '521');
INSERT INTO `post_files` VALUES ('85', '25', '551');
INSERT INTO `post_files` VALUES ('192', '26', '239');
INSERT INTO `post_files` VALUES ('191', '26', '522');
INSERT INTO `post_files` VALUES ('193', '26', '554');
INSERT INTO `post_files` VALUES ('188', '27', '523');
INSERT INTO `post_files` VALUES ('189', '27', '532');
INSERT INTO `post_files` VALUES ('190', '27', '554');
INSERT INTO `post_files` VALUES ('98', '28', '526');
INSERT INTO `post_files` VALUES ('99', '28', '533');
INSERT INTO `post_files` VALUES ('100', '28', '556');
INSERT INTO `post_files` VALUES ('182', '29', '520');
INSERT INTO `post_files` VALUES ('183', '29', '534');
INSERT INTO `post_files` VALUES ('184', '29', '550');
INSERT INTO `post_files` VALUES ('179', '30', '524');
INSERT INTO `post_files` VALUES ('180', '30', '535');
INSERT INTO `post_files` VALUES ('181', '30', '554');
INSERT INTO `post_files` VALUES ('173', '31', '525');
INSERT INTO `post_files` VALUES ('174', '31', '536');
INSERT INTO `post_files` VALUES ('175', '31', '555');
INSERT INTO `post_files` VALUES ('164', '32', '531');
INSERT INTO `post_files` VALUES ('165', '32', '537');
INSERT INTO `post_files` VALUES ('166', '32', '563');
INSERT INTO `post_files` VALUES ('113', '33', '529');
INSERT INTO `post_files` VALUES ('114', '33', '538');
INSERT INTO `post_files` VALUES ('115', '33', '559');
INSERT INTO `post_files` VALUES ('116', '34', '519');
INSERT INTO `post_files` VALUES ('117', '34', '539');
INSERT INTO `post_files` VALUES ('118', '34', '549');
INSERT INTO `post_files` VALUES ('119', '35', '527');
INSERT INTO `post_files` VALUES ('120', '35', '540');
INSERT INTO `post_files` VALUES ('121', '35', '558');
INSERT INTO `post_files` VALUES ('161', '36', '517');
INSERT INTO `post_files` VALUES ('162', '36', '541');
INSERT INTO `post_files` VALUES ('163', '36', '548');
INSERT INTO `post_files` VALUES ('131', '37', '530');
INSERT INTO `post_files` VALUES ('132', '37', '542');
INSERT INTO `post_files` VALUES ('133', '37', '568');
INSERT INTO `post_files` VALUES ('158', '38', '528');
INSERT INTO `post_files` VALUES ('159', '38', '543');
INSERT INTO `post_files` VALUES ('160', '38', '569');
INSERT INTO `post_files` VALUES ('138', '39', '544');
INSERT INTO `post_files` VALUES ('139', '39', '572');
INSERT INTO `post_files` VALUES ('137', '39', '573');
INSERT INTO `post_files` VALUES ('144', '40', '545');
INSERT INTO `post_files` VALUES ('145', '40', '571');
INSERT INTO `post_files` VALUES ('143', '40', '574');

-- ----------------------------
-- Table structure for `post_relations`
-- ----------------------------
DROP TABLE IF EXISTS `post_relations`;
CREATE TABLE `post_relations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `original_id` int(10) unsigned NOT NULL,
  `destination_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_original_to_destination` (`original_id`,`destination_id`) USING BTREE,
  KEY `fk_post_relations_destination_id` (`destination_id`) USING BTREE,
  CONSTRAINT `post_relations_ibfk_1` FOREIGN KEY (`destination_id`) REFERENCES `post` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `post_relations_ibfk_2` FOREIGN KEY (`original_id`) REFERENCES `post` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=153 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of post_relations
-- ----------------------------
INSERT INTO `post_relations` VALUES ('6', '1', '3');
INSERT INTO `post_relations` VALUES ('5', '1', '4');
INSERT INTO `post_relations` VALUES ('9', '1', '5');
INSERT INTO `post_relations` VALUES ('1', '3', '1');
INSERT INTO `post_relations` VALUES ('10', '3', '4');
INSERT INTO `post_relations` VALUES ('11', '3', '5');
INSERT INTO `post_relations` VALUES ('4', '4', '1');
INSERT INTO `post_relations` VALUES ('3', '4', '3');
INSERT INTO `post_relations` VALUES ('12', '4', '5');
INSERT INTO `post_relations` VALUES ('13', '5', '1');
INSERT INTO `post_relations` VALUES ('14', '5', '3');
INSERT INTO `post_relations` VALUES ('15', '5', '4');
INSERT INTO `post_relations` VALUES ('64', '6', '8');
INSERT INTO `post_relations` VALUES ('63', '6', '24');
INSERT INTO `post_relations` VALUES ('62', '6', '25');
INSERT INTO `post_relations` VALUES ('67', '8', '6');
INSERT INTO `post_relations` VALUES ('66', '8', '24');
INSERT INTO `post_relations` VALUES ('65', '8', '25');
INSERT INTO `post_relations` VALUES ('113', '9', '18');
INSERT INTO `post_relations` VALUES ('112', '9', '33');
INSERT INTO `post_relations` VALUES ('111', '9', '34');
INSERT INTO `post_relations` VALUES ('27', '10', '11');
INSERT INTO `post_relations` VALUES ('28', '10', '12');
INSERT INTO `post_relations` VALUES ('29', '10', '13');
INSERT INTO `post_relations` VALUES ('18', '11', '10');
INSERT INTO `post_relations` VALUES ('25', '11', '12');
INSERT INTO `post_relations` VALUES ('26', '11', '13');
INSERT INTO `post_relations` VALUES ('20', '12', '10');
INSERT INTO `post_relations` VALUES ('19', '12', '11');
INSERT INTO `post_relations` VALUES ('24', '12', '13');
INSERT INTO `post_relations` VALUES ('23', '13', '10');
INSERT INTO `post_relations` VALUES ('22', '13', '11');
INSERT INTO `post_relations` VALUES ('21', '13', '12');
INSERT INTO `post_relations` VALUES ('146', '17', '10');
INSERT INTO `post_relations` VALUES ('144', '17', '11');
INSERT INTO `post_relations` VALUES ('145', '17', '28');
INSERT INTO `post_relations` VALUES ('131', '18', '19');
INSERT INTO `post_relations` VALUES ('130', '18', '33');
INSERT INTO `post_relations` VALUES ('129', '18', '34');
INSERT INTO `post_relations` VALUES ('127', '19', '18');
INSERT INTO `post_relations` VALUES ('128', '19', '31');
INSERT INTO `post_relations` VALUES ('126', '19', '33');
INSERT INTO `post_relations` VALUES ('136', '20', '22');
INSERT INTO `post_relations` VALUES ('137', '20', '25');
INSERT INTO `post_relations` VALUES ('135', '20', '40');
INSERT INTO `post_relations` VALUES ('41', '21', '9');
INSERT INTO `post_relations` VALUES ('40', '21', '18');
INSERT INTO `post_relations` VALUES ('39', '21', '19');
INSERT INTO `post_relations` VALUES ('115', '22', '6');
INSERT INTO `post_relations` VALUES ('116', '22', '20');
INSERT INTO `post_relations` VALUES ('114', '22', '40');
INSERT INTO `post_relations` VALUES ('53', '23', '6');
INSERT INTO `post_relations` VALUES ('52', '23', '8');
INSERT INTO `post_relations` VALUES ('51', '23', '20');
INSERT INTO `post_relations` VALUES ('56', '24', '6');
INSERT INTO `post_relations` VALUES ('55', '24', '8');
INSERT INTO `post_relations` VALUES ('54', '24', '23');
INSERT INTO `post_relations` VALUES ('61', '25', '6');
INSERT INTO `post_relations` VALUES ('60', '25', '8');
INSERT INTO `post_relations` VALUES ('59', '25', '23');
INSERT INTO `post_relations` VALUES ('152', '26', '27');
INSERT INTO `post_relations` VALUES ('151', '26', '28');
INSERT INTO `post_relations` VALUES ('150', '26', '30');
INSERT INTO `post_relations` VALUES ('149', '27', '26');
INSERT INTO `post_relations` VALUES ('148', '27', '28');
INSERT INTO `post_relations` VALUES ('147', '27', '30');
INSERT INTO `post_relations` VALUES ('71', '28', '10');
INSERT INTO `post_relations` VALUES ('70', '28', '12');
INSERT INTO `post_relations` VALUES ('69', '28', '17');
INSERT INTO `post_relations` VALUES ('141', '29', '9');
INSERT INTO `post_relations` VALUES ('142', '29', '18');
INSERT INTO `post_relations` VALUES ('143', '29', '21');
INSERT INTO `post_relations` VALUES ('140', '30', '26');
INSERT INTO `post_relations` VALUES ('139', '30', '27');
INSERT INTO `post_relations` VALUES ('138', '30', '28');
INSERT INTO `post_relations` VALUES ('134', '31', '18');
INSERT INTO `post_relations` VALUES ('133', '31', '19');
INSERT INTO `post_relations` VALUES ('132', '31', '33');
INSERT INTO `post_relations` VALUES ('124', '32', '18');
INSERT INTO `post_relations` VALUES ('125', '32', '31');
INSERT INTO `post_relations` VALUES ('123', '32', '33');
INSERT INTO `post_relations` VALUES ('82', '33', '9');
INSERT INTO `post_relations` VALUES ('81', '33', '18');
INSERT INTO `post_relations` VALUES ('80', '33', '32');
INSERT INTO `post_relations` VALUES ('85', '34', '9');
INSERT INTO `post_relations` VALUES ('84', '34', '19');
INSERT INTO `post_relations` VALUES ('83', '34', '33');
INSERT INTO `post_relations` VALUES ('120', '36', '6');
INSERT INTO `post_relations` VALUES ('121', '36', '8');
INSERT INTO `post_relations` VALUES ('122', '36', '24');
INSERT INTO `post_relations` VALUES ('95', '37', '6');
INSERT INTO `post_relations` VALUES ('94', '37', '8');
INSERT INTO `post_relations` VALUES ('93', '37', '36');
INSERT INTO `post_relations` VALUES ('118', '38', '3');
INSERT INTO `post_relations` VALUES ('119', '38', '10');
INSERT INTO `post_relations` VALUES ('117', '38', '11');
INSERT INTO `post_relations` VALUES ('98', '39', '13');
INSERT INTO `post_relations` VALUES ('102', '40', '6');
INSERT INTO `post_relations` VALUES ('103', '40', '8');
INSERT INTO `post_relations` VALUES ('104', '40', '25');

-- ----------------------------
-- Table structure for `post_tags`
-- ----------------------------
DROP TABLE IF EXISTS `post_tags`;
CREATE TABLE `post_tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` int(10) unsigned NOT NULL,
  `tag_id` int(10) unsigned NOT NULL,
  `type` enum('taxonomy','meta') DEFAULT 'meta',
  PRIMARY KEY (`id`),
  KEY `fk_post_tags_post_id` (`post_id`) USING BTREE,
  KEY `fk_post_tags_tag_id` (`tag_id`) USING BTREE,
  CONSTRAINT `post_tags_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `post_tags_ibfk_2` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=308 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of post_tags
-- ----------------------------
INSERT INTO `post_tags` VALUES ('12', '3', '7', 'meta');
INSERT INTO `post_tags` VALUES ('13', '3', '3', 'meta');
INSERT INTO `post_tags` VALUES ('14', '3', '8', 'meta');
INSERT INTO `post_tags` VALUES ('15', '3', '5', 'meta');
INSERT INTO `post_tags` VALUES ('16', '3', '9', 'meta');
INSERT INTO `post_tags` VALUES ('23', '4', '10', 'meta');
INSERT INTO `post_tags` VALUES ('24', '4', '3', 'meta');
INSERT INTO `post_tags` VALUES ('25', '4', '8', 'meta');
INSERT INTO `post_tags` VALUES ('26', '4', '5', 'meta');
INSERT INTO `post_tags` VALUES ('27', '4', '11', 'meta');
INSERT INTO `post_tags` VALUES ('28', '1', '1', 'meta');
INSERT INTO `post_tags` VALUES ('29', '1', '2', 'meta');
INSERT INTO `post_tags` VALUES ('30', '1', '3', 'meta');
INSERT INTO `post_tags` VALUES ('31', '1', '4', 'meta');
INSERT INTO `post_tags` VALUES ('32', '1', '5', 'meta');
INSERT INTO `post_tags` VALUES ('33', '1', '6', 'meta');
INSERT INTO `post_tags` VALUES ('44', '5', '12', 'meta');
INSERT INTO `post_tags` VALUES ('45', '5', '3', 'meta');
INSERT INTO `post_tags` VALUES ('46', '5', '8', 'meta');
INSERT INTO `post_tags` VALUES ('47', '5', '5', 'meta');
INSERT INTO `post_tags` VALUES ('48', '5', '13', 'meta');
INSERT INTO `post_tags` VALUES ('63', '10', '25', 'meta');
INSERT INTO `post_tags` VALUES ('64', '11', '25', 'meta');
INSERT INTO `post_tags` VALUES ('65', '12', '25', 'meta');
INSERT INTO `post_tags` VALUES ('66', '13', '25', 'meta');
INSERT INTO `post_tags` VALUES ('67', '14', '26', 'meta');
INSERT INTO `post_tags` VALUES ('68', '14', '27', 'meta');
INSERT INTO `post_tags` VALUES ('69', '14', '28', 'meta');
INSERT INTO `post_tags` VALUES ('70', '2', '29', 'meta');
INSERT INTO `post_tags` VALUES ('71', '2', '27', 'meta');
INSERT INTO `post_tags` VALUES ('72', '16', '27', 'meta');
INSERT INTO `post_tags` VALUES ('73', '16', '30', 'meta');
INSERT INTO `post_tags` VALUES ('101', '21', '37', 'meta');
INSERT INTO `post_tags` VALUES ('102', '21', '38', 'meta');
INSERT INTO `post_tags` VALUES ('103', '21', '36', 'meta');
INSERT INTO `post_tags` VALUES ('104', '21', '43', 'meta');
INSERT INTO `post_tags` VALUES ('105', '21', '45', 'meta');
INSERT INTO `post_tags` VALUES ('119', '23', '16', 'meta');
INSERT INTO `post_tags` VALUES ('120', '23', '17', 'meta');
INSERT INTO `post_tags` VALUES ('121', '23', '50', 'meta');
INSERT INTO `post_tags` VALUES ('122', '23', '51', 'meta');
INSERT INTO `post_tags` VALUES ('123', '24', '17', 'meta');
INSERT INTO `post_tags` VALUES ('124', '24', '16', 'meta');
INSERT INTO `post_tags` VALUES ('125', '24', '52', 'meta');
INSERT INTO `post_tags` VALUES ('126', '24', '53', 'meta');
INSERT INTO `post_tags` VALUES ('127', '24', '54', 'meta');
INSERT INTO `post_tags` VALUES ('128', '24', '48', 'meta');
INSERT INTO `post_tags` VALUES ('134', '25', '16', 'meta');
INSERT INTO `post_tags` VALUES ('135', '25', '55', 'meta');
INSERT INTO `post_tags` VALUES ('136', '25', '56', 'meta');
INSERT INTO `post_tags` VALUES ('137', '25', '57', 'meta');
INSERT INTO `post_tags` VALUES ('138', '6', '14', 'meta');
INSERT INTO `post_tags` VALUES ('139', '6', '15', 'meta');
INSERT INTO `post_tags` VALUES ('140', '6', '16', 'meta');
INSERT INTO `post_tags` VALUES ('141', '6', '17', 'meta');
INSERT INTO `post_tags` VALUES ('142', '6', '18', 'meta');
INSERT INTO `post_tags` VALUES ('143', '8', '14', 'meta');
INSERT INTO `post_tags` VALUES ('144', '8', '17', 'meta');
INSERT INTO `post_tags` VALUES ('145', '8', '19', 'meta');
INSERT INTO `post_tags` VALUES ('146', '8', '20', 'meta');
INSERT INTO `post_tags` VALUES ('155', '28', '3', 'meta');
INSERT INTO `post_tags` VALUES ('156', '28', '8', 'meta');
INSERT INTO `post_tags` VALUES ('157', '28', '4', 'meta');
INSERT INTO `post_tags` VALUES ('158', '28', '63', 'meta');
INSERT INTO `post_tags` VALUES ('159', '28', '64', 'meta');
INSERT INTO `post_tags` VALUES ('179', '33', '37', 'meta');
INSERT INTO `post_tags` VALUES ('180', '33', '38', 'meta');
INSERT INTO `post_tags` VALUES ('181', '33', '36', 'meta');
INSERT INTO `post_tags` VALUES ('182', '33', '74', 'meta');
INSERT INTO `post_tags` VALUES ('183', '33', '48', 'meta');
INSERT INTO `post_tags` VALUES ('184', '33', '75', 'meta');
INSERT INTO `post_tags` VALUES ('185', '34', '22', 'meta');
INSERT INTO `post_tags` VALUES ('186', '34', '23', 'meta');
INSERT INTO `post_tags` VALUES ('187', '34', '36', 'meta');
INSERT INTO `post_tags` VALUES ('188', '34', '76', 'meta');
INSERT INTO `post_tags` VALUES ('189', '34', '77', 'meta');
INSERT INTO `post_tags` VALUES ('190', '35', '78', 'meta');
INSERT INTO `post_tags` VALUES ('191', '35', '79', 'meta');
INSERT INTO `post_tags` VALUES ('192', '35', '80', 'meta');
INSERT INTO `post_tags` VALUES ('193', '35', '81', 'meta');
INSERT INTO `post_tags` VALUES ('194', '35', '82', 'meta');
INSERT INTO `post_tags` VALUES ('208', '37', '16', 'meta');
INSERT INTO `post_tags` VALUES ('209', '37', '17', 'meta');
INSERT INTO `post_tags` VALUES ('210', '37', '15', 'meta');
INSERT INTO `post_tags` VALUES ('211', '37', '85', 'meta');
INSERT INTO `post_tags` VALUES ('216', '39', '87', 'meta');
INSERT INTO `post_tags` VALUES ('217', '39', '88', 'meta');
INSERT INTO `post_tags` VALUES ('218', '39', '89', 'meta');
INSERT INTO `post_tags` VALUES ('219', '39', '90', 'meta');
INSERT INTO `post_tags` VALUES ('220', '39', '91', 'meta');
INSERT INTO `post_tags` VALUES ('224', '40', '16', 'meta');
INSERT INTO `post_tags` VALUES ('225', '40', '17', 'meta');
INSERT INTO `post_tags` VALUES ('226', '40', '92', 'meta');
INSERT INTO `post_tags` VALUES ('227', '40', '90', 'meta');
INSERT INTO `post_tags` VALUES ('240', '9', '22', 'meta');
INSERT INTO `post_tags` VALUES ('241', '9', '36', 'meta');
INSERT INTO `post_tags` VALUES ('242', '9', '24', 'meta');
INSERT INTO `post_tags` VALUES ('243', '9', '14', 'meta');
INSERT INTO `post_tags` VALUES ('244', '9', '23', 'meta');
INSERT INTO `post_tags` VALUES ('245', '22', '16', 'meta');
INSERT INTO `post_tags` VALUES ('246', '22', '46', 'meta');
INSERT INTO `post_tags` VALUES ('247', '22', '47', 'meta');
INSERT INTO `post_tags` VALUES ('248', '22', '48', 'meta');
INSERT INTO `post_tags` VALUES ('249', '22', '49', 'meta');
INSERT INTO `post_tags` VALUES ('250', '38', '3', 'meta');
INSERT INTO `post_tags` VALUES ('251', '38', '8', 'meta');
INSERT INTO `post_tags` VALUES ('252', '38', '5', 'meta');
INSERT INTO `post_tags` VALUES ('253', '38', '86', 'meta');
INSERT INTO `post_tags` VALUES ('254', '36', '16', 'meta');
INSERT INTO `post_tags` VALUES ('255', '36', '17', 'meta');
INSERT INTO `post_tags` VALUES ('256', '36', '43', 'meta');
INSERT INTO `post_tags` VALUES ('257', '36', '83', 'meta');
INSERT INTO `post_tags` VALUES ('258', '36', '84', 'meta');
INSERT INTO `post_tags` VALUES ('259', '32', '37', 'meta');
INSERT INTO `post_tags` VALUES ('260', '32', '38', 'meta');
INSERT INTO `post_tags` VALUES ('261', '32', '36', 'meta');
INSERT INTO `post_tags` VALUES ('262', '32', '72', 'meta');
INSERT INTO `post_tags` VALUES ('263', '32', '73', 'meta');
INSERT INTO `post_tags` VALUES ('264', '19', '37', 'meta');
INSERT INTO `post_tags` VALUES ('265', '19', '38', 'meta');
INSERT INTO `post_tags` VALUES ('266', '19', '36', 'meta');
INSERT INTO `post_tags` VALUES ('267', '19', '39', 'meta');
INSERT INTO `post_tags` VALUES ('268', '19', '41', 'meta');
INSERT INTO `post_tags` VALUES ('269', '18', '37', 'meta');
INSERT INTO `post_tags` VALUES ('270', '18', '38', 'meta');
INSERT INTO `post_tags` VALUES ('271', '18', '36', 'meta');
INSERT INTO `post_tags` VALUES ('272', '18', '39', 'meta');
INSERT INTO `post_tags` VALUES ('273', '18', '40', 'meta');
INSERT INTO `post_tags` VALUES ('274', '31', '69', 'meta');
INSERT INTO `post_tags` VALUES ('275', '31', '38', 'meta');
INSERT INTO `post_tags` VALUES ('276', '31', '36', 'meta');
INSERT INTO `post_tags` VALUES ('277', '31', '70', 'meta');
INSERT INTO `post_tags` VALUES ('278', '31', '71', 'meta');
INSERT INTO `post_tags` VALUES ('279', '20', '17', 'meta');
INSERT INTO `post_tags` VALUES ('280', '20', '16', 'meta');
INSERT INTO `post_tags` VALUES ('281', '20', '42', 'meta');
INSERT INTO `post_tags` VALUES ('282', '20', '43', 'meta');
INSERT INTO `post_tags` VALUES ('283', '20', '44', 'meta');
INSERT INTO `post_tags` VALUES ('284', '30', '58', 'meta');
INSERT INTO `post_tags` VALUES ('285', '30', '59', 'meta');
INSERT INTO `post_tags` VALUES ('286', '30', '61', 'meta');
INSERT INTO `post_tags` VALUES ('287', '30', '43', 'meta');
INSERT INTO `post_tags` VALUES ('288', '30', '68', 'meta');
INSERT INTO `post_tags` VALUES ('289', '29', '37', 'meta');
INSERT INTO `post_tags` VALUES ('290', '29', '36', 'meta');
INSERT INTO `post_tags` VALUES ('291', '29', '66', 'meta');
INSERT INTO `post_tags` VALUES ('292', '29', '67', 'meta');
INSERT INTO `post_tags` VALUES ('293', '17', '32', 'meta');
INSERT INTO `post_tags` VALUES ('294', '17', '33', 'meta');
INSERT INTO `post_tags` VALUES ('295', '17', '3', 'meta');
INSERT INTO `post_tags` VALUES ('296', '17', '34', 'meta');
INSERT INTO `post_tags` VALUES ('297', '17', '8', 'meta');
INSERT INTO `post_tags` VALUES ('298', '17', '35', 'meta');
INSERT INTO `post_tags` VALUES ('299', '17', '36', 'meta');
INSERT INTO `post_tags` VALUES ('300', '27', '58', 'meta');
INSERT INTO `post_tags` VALUES ('301', '27', '59', 'meta');
INSERT INTO `post_tags` VALUES ('302', '27', '62', 'meta');
INSERT INTO `post_tags` VALUES ('303', '27', '61', 'meta');
INSERT INTO `post_tags` VALUES ('304', '26', '58', 'meta');
INSERT INTO `post_tags` VALUES ('305', '26', '59', 'meta');
INSERT INTO `post_tags` VALUES ('306', '26', '60', 'meta');
INSERT INTO `post_tags` VALUES ('307', '26', '61', 'meta');

-- ----------------------------
-- Table structure for `tags`
-- ----------------------------
DROP TABLE IF EXISTS `tags`;
CREATE TABLE `tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `alias` varchar(64) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_tags_alias` (`alias`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tags
-- ----------------------------
INSERT INTO `tags` VALUES ('1', 'Insomnia', 'insomnia', null, '2013-02-28 12:42:52');
INSERT INTO `tags` VALUES ('2', 'Noise', 'noise', null, '2013-02-28 12:42:56');
INSERT INTO `tags` VALUES ('3', 'Ambient', 'ambient', null, '2013-02-28 12:43:00');
INSERT INTO `tags` VALUES ('4', 'Easy Listening', 'easy-listening', null, '2013-02-28 12:43:07');
INSERT INTO `tags` VALUES ('5', 'Light Synthetic Compilation', 'lsc', null, '2013-02-28 12:43:12');
INSERT INTO `tags` VALUES ('6', 'MNT001', 'M01', null, '2013-02-28 12:43:29');
INSERT INTO `tags` VALUES ('7', 'Synthetic', 'synthetic', null, '2013-02-28 12:43:34');
INSERT INTO `tags` VALUES ('8', 'Chillout', 'chillout', null, '2013-02-28 12:43:38');
INSERT INTO `tags` VALUES ('9', 'MNT007', 'M07', null, '2013-02-28 12:43:42');
INSERT INTO `tags` VALUES ('10', 'Plastic toy', 'plastic-toy', null, '2013-02-28 12:43:48');
INSERT INTO `tags` VALUES ('11', 'MNT017', 'M17', null, '2013-02-28 12:43:53');
INSERT INTO `tags` VALUES ('12', 'Solaris', 'solaris', null, '2013-02-28 12:43:56');
INSERT INTO `tags` VALUES ('13', 'MNT021', 'M21', null, '2013-02-28 12:44:00');
INSERT INTO `tags` VALUES ('14', 'Featured', 'featured', null, '2013-03-27 15:15:29');
INSERT INTO `tags` VALUES ('15', 'Stockholm syndrome', 'stockholm', null, '2013-03-27 15:15:41');
INSERT INTO `tags` VALUES ('16', 'Tech House', 'tech-house', null, '2013-03-27 15:15:46');
INSERT INTO `tags` VALUES ('17', 'Deep House', 'deep-house', null, '2013-03-27 15:15:50');
INSERT INTO `tags` VALUES ('18', 'MNT031', 'M31', null, '2013-03-27 15:15:54');
INSERT INTO `tags` VALUES ('19', 'Autoreply', 'autoreply', null, '2013-03-27 15:15:59');
INSERT INTO `tags` VALUES ('20', 'MNT027', 'M27', null, '2013-03-27 15:16:02');
INSERT INTO `tags` VALUES ('21', 'Katana', 'katana', null, '2013-03-27 15:16:06');
INSERT INTO `tags` VALUES ('22', 'Techstep', 'techstep', null, '2013-03-27 15:16:11');
INSERT INTO `tags` VALUES ('23', 'Neurostep', 'neurostep', null, '2013-03-27 15:16:17');
INSERT INTO `tags` VALUES ('24', 'MNT025', 'M25', null, '2013-03-27 15:16:20');
INSERT INTO `tags` VALUES ('25', 'Дом разбитых сердец', 'hobh', null, '2013-03-27 15:16:26');
INSERT INTO `tags` VALUES ('26', 'About', 'about', null, '2013-03-27 15:16:29');
INSERT INTO `tags` VALUES ('27', 'Other', 'other', null, '2013-03-27 15:16:32');
INSERT INTO `tags` VALUES ('28', 'For promouters', 'for-promouters', null, '2013-03-27 15:16:39');
INSERT INTO `tags` VALUES ('29', 'For IT', 'for-it', null, '2013-03-27 15:16:42');
INSERT INTO `tags` VALUES ('30', 'Copyrights', 'copyrights', null, '2013-03-27 15:16:48');
INSERT INTO `tags` VALUES ('32', 'Acid Jazz', 'acid-jazz', null, '2013-03-27 15:17:00');
INSERT INTO `tags` VALUES ('33', 'Lounge', 'lounge', null, '2013-03-27 15:17:04');
INSERT INTO `tags` VALUES ('34', 'Bar La\'unge', 'bar-la-unge', null, '2013-03-27 15:17:14');
INSERT INTO `tags` VALUES ('35', 'MNT008', 'M08', null, '2013-03-27 15:17:29');
INSERT INTO `tags` VALUES ('36', 'Drum\'n\'Bass', 'dnb', null, '2013-03-27 15:17:35');
INSERT INTO `tags` VALUES ('37', 'Neurofunk', 'neurofunk', null, '2013-03-27 15:17:42');
INSERT INTO `tags` VALUES ('38', 'Technoid', 'technoid', null, '2013-03-27 15:17:45');
INSERT INTO `tags` VALUES ('39', 'Basstech', 'basstech', null, '2013-03-27 15:17:48');
INSERT INTO `tags` VALUES ('40', 'MNT018', 'M18', null, '2013-03-27 15:17:52');
INSERT INTO `tags` VALUES ('41', 'MNT020', 'M20', null, '2013-03-27 15:17:54');
INSERT INTO `tags` VALUES ('42', 'Chillhouse', 'chillhouse', null, '2013-03-27 15:17:58');
INSERT INTO `tags` VALUES ('43', 'Live', 'live', null, '2013-03-27 15:18:00');
INSERT INTO `tags` VALUES ('44', 'MNT012', 'M12', null, '2013-03-27 15:18:04');
INSERT INTO `tags` VALUES ('45', 'MNT014', 'M14', null, '2013-03-27 15:18:06');
INSERT INTO `tags` VALUES ('46', 'Funky House', 'funky-house', null, '2013-03-27 15:18:11');
INSERT INTO `tags` VALUES ('47', 'Cote d\'Azur', 'cote-d-azur', null, '2013-03-27 15:18:17');
INSERT INTO `tags` VALUES ('48', 'Promo', 'promo', null, '2013-03-27 15:18:20');
INSERT INTO `tags` VALUES ('49', 'MNT030', 'M30', null, '2013-03-27 15:18:23');
INSERT INTO `tags` VALUES ('50', 'All she wants is', 'all-she-wants', null, '2013-03-27 15:18:29');
INSERT INTO `tags` VALUES ('51', 'MNT002', 'M02', null, '2013-03-27 15:18:32');
INSERT INTO `tags` VALUES ('52', 'IRIS', 'iris', null, '2013-03-27 15:18:35');
INSERT INTO `tags` VALUES ('53', 'It\'s all about me', 'all-about-me', null, '2013-03-27 15:18:45');
INSERT INTO `tags` VALUES ('54', 'MNT004', 'M04', null, '2013-03-27 15:18:47');
INSERT INTO `tags` VALUES ('55', 'Minimal Techno', 'minimal-techno', null, '2013-03-27 15:18:53');
INSERT INTO `tags` VALUES ('56', 'Hi-Pass', 'hi-pass', null, '2013-03-27 15:18:57');
INSERT INTO `tags` VALUES ('57', 'MNT005', 'M05', null, '2013-03-27 15:18:59');
INSERT INTO `tags` VALUES ('58', 'Goa Trance', 'goa', null, '2013-04-02 18:13:01');
INSERT INTO `tags` VALUES ('59', 'Psy Trance', 'psy', null, '2013-04-02 18:13:04');
INSERT INTO `tags` VALUES ('60', 'MNT006', 'M06', null, '2013-04-02 18:13:10');
INSERT INTO `tags` VALUES ('61', 'Janaca Express', 'janaca-express', null, '2013-04-02 18:13:24');
INSERT INTO `tags` VALUES ('62', 'MNT009', 'M09', null, '2013-04-02 18:13:32');
INSERT INTO `tags` VALUES ('63', 'Marrakesh', 'marrakesh', null, '2013-04-02 18:13:37');
INSERT INTO `tags` VALUES ('64', 'MNT010', 'M10', null, '2013-04-02 18:13:39');
INSERT INTO `tags` VALUES ('66', 'MNT011', 'M11', null, '2013-04-02 18:15:26');
INSERT INTO `tags` VALUES ('67', 'Helloween live', 'helloween', null, '2013-04-02 18:15:31');
INSERT INTO `tags` VALUES ('68', 'MNT013', 'M13', null, '2013-04-02 18:15:34');
INSERT INTO `tags` VALUES ('69', 'Darkstep', 'darkstep', null, '2013-04-02 18:15:39');
INSERT INTO `tags` VALUES ('70', 'Killing machine', 'killing-machine', null, '2013-04-02 18:15:45');
INSERT INTO `tags` VALUES ('71', 'MNT016', 'M16', null, '2013-04-02 18:15:48');
INSERT INTO `tags` VALUES ('72', 'MNT023', 'M23', null, '2013-04-02 18:15:51');
INSERT INTO `tags` VALUES ('73', 'Trauma', 'trauma', null, '2013-04-02 18:15:54');
INSERT INTO `tags` VALUES ('74', 'Renaissance', 'renaissance', null, '2013-04-02 18:16:00');
INSERT INTO `tags` VALUES ('75', 'MNT024', 'M24', null, '2013-04-02 18:16:03');
INSERT INTO `tags` VALUES ('76', 'Exception', 'exception', null, '2013-04-02 18:16:08');
INSERT INTO `tags` VALUES ('77', 'MNT026', 'M26', null, '2013-04-02 18:16:13');
INSERT INTO `tags` VALUES ('78', 'Breaks', 'breaks', null, '2013-04-02 18:16:17');
INSERT INTO `tags` VALUES ('79', 'Athmospheric', 'athospheric', null, '2013-04-02 18:16:23');
INSERT INTO `tags` VALUES ('80', 'Progress', 'progress', null, '2013-04-02 18:16:27');
INSERT INTO `tags` VALUES ('81', 'MNT028', 'M28', null, '2013-04-02 18:16:30');
INSERT INTO `tags` VALUES ('82', 'Progressive', 'pregressive', null, '2013-04-02 18:16:35');
INSERT INTO `tags` VALUES ('83', 'Enzo cafe', 'enzo-cafe', null, '2013-04-02 18:16:42');
INSERT INTO `tags` VALUES ('84', 'MNT029', 'M29', null, '2013-04-02 18:16:48');
INSERT INTO `tags` VALUES ('85', 'MNT032', 'M32', null, '2013-04-02 18:16:50');
INSERT INTO `tags` VALUES ('86', 'MNT033', 'M33', null, '2013-04-02 18:16:53');
INSERT INTO `tags` VALUES ('87', 'Hip-Hop', 'hip-hop', null, '2013-04-02 18:16:56');
INSERT INTO `tags` VALUES ('88', 'Rap', 'rap', null, '2013-04-02 18:16:58');
INSERT INTO `tags` VALUES ('89', 'NLP', 'nlp', null, '2013-04-02 18:17:03');
INSERT INTO `tags` VALUES ('90', 'Exclusive', 'exclusive', null, '2013-04-02 18:17:09');
INSERT INTO `tags` VALUES ('91', 'MNTE01', 'ME01', null, '2013-04-02 18:17:14');
INSERT INTO `tags` VALUES ('92', 'My friend Friday', 'my-friend-friday', null, '2013-04-02 18:20:02');
INSERT INTO `tags` VALUES ('93', 'Drum\\\'n\\\'Bass', null, null, '2013-04-02 20:14:23');
INSERT INTO `tags` VALUES ('94', '[{', null, null, '2013-04-05 11:27:42');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(64) NOT NULL,
  `password` varchar(32) NOT NULL,
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `group_id` int(11) unsigned NOT NULL DEFAULT '1000',
  `username` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_email` (`email`) USING BTREE,
  KEY `fk_user_group_id` (`group_id`) USING BTREE,
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `group` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'marco.manti@gmail.com', 'd453e8618c7f43c084c74fbc9c197c5e', '2013-03-25 12:48:32', '1', 'Admin');
INSERT INTO `user` VALUES ('2', 'manti.by@gmail.com', '250ff9d90e5fbac7e286d9205917b50c', '2013-04-02 20:19:45', '1000', 'manti');

-- ----------------------------
-- Table structure for `_log`
-- ----------------------------
DROP TABLE IF EXISTS `_log`;
CREATE TABLE `_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `module` varchar(50) DEFAULT NULL,
  `action` varchar(50) DEFAULT NULL,
  `task` varchar(50) DEFAULT NULL,
  `refid` varchar(50) DEFAULT NULL,
  `ip` varchar(50) DEFAULT NULL,
  `browser` varchar(255) DEFAULT NULL,
  `referer` varchar(500) DEFAULT NULL,
  `sessionid` varchar(50) DEFAULT NULL,
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `ik_browser` (`browser`) USING BTREE,
  KEY `ik_module` (`module`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=1566 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of _log
-- ----------------------------
INSERT INTO `_log` VALUES ('1', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', '414a256795738e7263cd74bede401ef2', '2013-04-02 18:24:34');
INSERT INTO `_log` VALUES ('2', '', '', '', '', '66.249.74.158', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', '730da8f7602e4d5bacf4db9dcecffa93', '2013-04-02 18:24:52');
INSERT INTO `_log` VALUES ('3', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', '53030f14cee53e4796545dc36e351252', '2013-04-02 18:26:28');
INSERT INTO `_log` VALUES ('4', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', 'd342032fb774937464ca536c099b3963', '2013-04-02 18:29:17');
INSERT INTO `_log` VALUES ('5', '', '', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', '', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-02 18:29:45');
INSERT INTO `_log` VALUES ('6', 'blog', 'track', '', '13', '66.249.74.158', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', '26e19b824d56ddcb9a6111365d210823', '2013-04-02 18:42:48');
INSERT INTO `_log` VALUES ('7', 'blog', 'track', '', '11', '66.249.74.158', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', '51ae6f7154909158a8054ab8432b64ce', '2013-04-02 18:42:48');
INSERT INTO `_log` VALUES ('8', 'blog', 'track', '', '10', '66.249.74.158', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', '3054802b4cc2e220efc41016144fe478', '2013-04-02 18:43:00');
INSERT INTO `_log` VALUES ('9', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', 'db75606dd84fbb6779046de00740b436', '2013-04-02 18:43:33');
INSERT INTO `_log` VALUES ('10', '', '', '', '', '213.180.206.205', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots DEV)', '', '8a2ca821b6ae29864d6c347dcc5a6fad', '2013-04-02 18:43:36');
INSERT INTO `_log` VALUES ('11', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', '3f33933c981789183d6a0ac7b938a604', '2013-04-02 18:45:34');
INSERT INTO `_log` VALUES ('12', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', 'c94f84491d32aa881e638bf9929daa6e', '2013-04-02 18:48:00');
INSERT INTO `_log` VALUES ('13', '', '', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', '', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-02 18:56:35');
INSERT INTO `_log` VALUES ('14', '', '', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', '', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-02 18:56:36');
INSERT INTO `_log` VALUES ('15', '', '', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', '', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-02 18:56:53');
INSERT INTO `_log` VALUES ('16', '', '', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', '', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-02 18:56:57');
INSERT INTO `_log` VALUES ('17', '', '', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', '', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-02 18:56:59');
INSERT INTO `_log` VALUES ('18', '', '', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', '', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-02 18:58:55');
INSERT INTO `_log` VALUES ('19', '', '', '', '', '87.252.242.72', 'Mozilla/5.0 (Linux; Android 4.0.4; MT27i Build/6.1.1.B.1.54) AppleWebKit/535.19 (KHTML, like Gecko) Chrome/18.0.1025.166 Mobile Safari/535.19', 'http://manti.by/gallery/winter-13/', 'qr5bi5fqv0751q6n34njg9nak1', '2013-04-02 19:00:07');
INSERT INTO `_log` VALUES ('20', 'blog', 'show', '', '40', '87.252.242.72', 'Mozilla/5.0 (Linux; Android 4.0.4; MT27i Build/6.1.1.B.1.54) AppleWebKit/535.19 (KHTML, like Gecko) Chrome/18.0.1025.166 Mobile Safari/535.19', 'http://manti.by/', 'qr5bi5fqv0751q6n34njg9nak1', '2013-04-02 19:00:46');
INSERT INTO `_log` VALUES ('21', 'blog', 'show', '', '22', '87.252.242.72', 'Mozilla/5.0 (Linux; Android 4.0.4; MT27i Build/6.1.1.B.1.54) AppleWebKit/535.19 (KHTML, like Gecko) Chrome/18.0.1025.166 Mobile Safari/535.19', 'http://manti.by/', 'qr5bi5fqv0751q6n34njg9nak1', '2013-04-02 19:00:46');
INSERT INTO `_log` VALUES ('22', 'gallery', '', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-02 19:00:53');
INSERT INTO `_log` VALUES ('23', 'file', 'track', '', '565', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/gallery/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-02 19:00:53');
INSERT INTO `_log` VALUES ('24', 'blog', 'track', '', '22', '87.252.242.72', 'Mozilla/5.0 (Linux; Android 4.0.4; MT27i Build/6.1.1.B.1.54) AppleWebKit/535.19 (KHTML, like Gecko) Chrome/18.0.1025.166 Mobile Safari/535.19', 'http://manti.by/blog/cote-d-azur/', 'qr5bi5fqv0751q6n34njg9nak1', '2013-04-02 19:00:53');
INSERT INTO `_log` VALUES ('25', '', '', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/gallery/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-02 19:01:19');
INSERT INTO `_log` VALUES ('26', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', '10b7022c5ec44ac9e1aa019f72e75b96', '2013-04-02 19:02:30');
INSERT INTO `_log` VALUES ('27', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', 'cea54a851703de36755308463f4ed047', '2013-04-02 19:04:44');
INSERT INTO `_log` VALUES ('28', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', 'c2ba7bf55124fb7e3424eba0442e4a18', '2013-04-02 19:08:09');
INSERT INTO `_log` VALUES ('29', 'tag', 'search', '', '86', '66.249.74.158', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', '405e1ef7c0759fdd10d4a76112268624', '2013-04-02 19:20:08');
INSERT INTO `_log` VALUES ('30', 'tag', 'search', '', '84', '66.249.74.158', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', '2c1f87d280ffd0210422129300d63b62', '2013-04-02 19:20:25');
INSERT INTO `_log` VALUES ('31', 'tag', 'search', '', '85', '66.249.74.158', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', 'b18e7c645a2c103db5f4a563e2d400a3', '2013-04-02 19:20:42');
INSERT INTO `_log` VALUES ('32', 'tag', 'search', '', '75', '66.249.74.158', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', '06f5bd5f52e74143959b9f65a7345de1', '2013-04-02 19:21:01');
INSERT INTO `_log` VALUES ('33', '', '', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/gallery/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-02 19:21:03');
INSERT INTO `_log` VALUES ('34', 'tag', 'search', '', '72', '66.249.74.158', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', '7dad6216ef58365ba4005161a2b44f68', '2013-04-02 19:21:16');
INSERT INTO `_log` VALUES ('35', 'tag', 'search', '', '88', '66.249.74.158', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', 'a430d1fb394a327a0baed555dea46842', '2013-04-02 19:21:34');
INSERT INTO `_log` VALUES ('36', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', '5a44f660e424251755636725fe274677', '2013-04-02 19:21:36');
INSERT INTO `_log` VALUES ('37', 'tag', 'search', '', '89', '66.249.74.158', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', '66ac8f8c88fe74bcc01717b8ff8df480', '2013-04-02 19:21:51');
INSERT INTO `_log` VALUES ('38', 'tag', 'search', '', '77', '66.249.74.158', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', '05bc657eebddaf1a3e8d1ae1cb171fd5', '2013-04-02 19:22:08');
INSERT INTO `_log` VALUES ('39', 'tag', 'search', '', '81', '66.249.74.158', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', '37cba47edcbc6c5b33136062d5dfdf6f', '2013-04-02 19:22:25');
INSERT INTO `_log` VALUES ('40', 'blog', 'show', '', '39', '66.249.74.158', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', '86b8efe03e7671ed3c85d1b3729012ca', '2013-04-02 19:22:42');
INSERT INTO `_log` VALUES ('41', 'tag', 'search', '', '91', '66.249.74.158', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', 'd10ec3ff546c33820d938b5e58a2af14', '2013-04-02 19:23:00');
INSERT INTO `_log` VALUES ('42', 'tag', 'search', '', '73', '66.249.74.158', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', 'c43d159af9654711c9bc83a9f49e5fd1', '2013-04-02 19:23:17');
INSERT INTO `_log` VALUES ('43', 'blog', 'show', '', '38', '66.249.74.158', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', 'a8e23320d0082b7e25980ed4fc89525f', '2013-04-02 19:23:35');
INSERT INTO `_log` VALUES ('44', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', '072f8db6e3b1b8089aea243ad934ad0b', '2013-04-02 19:23:37');
INSERT INTO `_log` VALUES ('45', 'tag', 'search', '', '78', '66.249.74.158', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', '16fef1cf7cfd40c579806a1de59d5a3b', '2013-04-02 19:23:51');
INSERT INTO `_log` VALUES ('46', 'blog', 'show', '', '32', '66.249.74.158', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', '3a386fa865c4e6bb4e2c6a8063e3e1dd', '2013-04-02 19:24:09');
INSERT INTO `_log` VALUES ('47', 'tag', 'search', '', '87', '66.249.74.158', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', '3fa9e0bffeb1186db0f5a90fc4e9a51c', '2013-04-02 19:24:26');
INSERT INTO `_log` VALUES ('48', 'tag', 'search', '', '80', '66.249.74.158', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', '8d8a59ff069f7cd2baaaa93b63b40e14', '2013-04-02 19:24:43');
INSERT INTO `_log` VALUES ('49', 'blog', 'show', '', '35', '66.249.74.158', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', '094e3a3050e5621d8dc27aa6be656408', '2013-04-02 19:25:01');
INSERT INTO `_log` VALUES ('50', 'tag', 'search', '', '76', '66.249.74.158', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', '58cf70a3d164983619b669f7ace9105a', '2013-04-02 19:25:17');
INSERT INTO `_log` VALUES ('51', 'tag', 'search', '', '83', '66.249.74.158', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', '17b77d69f8b3d9f6439ea6608e788b09', '2013-04-02 19:25:35');
INSERT INTO `_log` VALUES ('52', 'tag', 'search', '', '90', '66.249.74.158', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', 'ffaa857230a75df88e8e144a249752c3', '2013-04-02 19:25:52');
INSERT INTO `_log` VALUES ('53', 'blog', 'show', '', '34', '66.249.74.158', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', '714d2c61626b05625c3443ae3bcce1aa', '2013-04-02 19:26:09');
INSERT INTO `_log` VALUES ('54', 'blog', 'show', '', '36', '66.249.74.158', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', '1dc0a4a9f1998f540955e7895f3d3fe8', '2013-04-02 19:26:26');
INSERT INTO `_log` VALUES ('55', '', '', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/gallery/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-02 19:26:35');
INSERT INTO `_log` VALUES ('56', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', 'c339bd3ca39d584516ae5632a282e168', '2013-04-02 19:26:42');
INSERT INTO `_log` VALUES ('57', 'tag', 'search', '', '82', '66.249.74.158', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', '52d15c23ca6c5f04bb0e9453ef72faf0', '2013-04-02 19:26:44');
INSERT INTO `_log` VALUES ('58', 'tag', 'search', '', '74', '66.249.74.158', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', '49ba427dcb44248ae9bbd7471c8415be', '2013-04-02 19:27:01');
INSERT INTO `_log` VALUES ('59', 'tag', 'search', '', '79', '66.249.74.158', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', 'a156c736a1d895fa579f66779cce4bde', '2013-04-02 19:27:30');
INSERT INTO `_log` VALUES ('60', 'blog', 'show', '', '33', '66.249.74.158', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', 'de99a2baec84449ac568a82428be91b0', '2013-04-02 19:27:33');
INSERT INTO `_log` VALUES ('61', 'tag', 'search', '', '92', '66.249.74.158', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', 'bf946dbbc949079585e87fc6328d0a46', '2013-04-02 19:27:56');
INSERT INTO `_log` VALUES ('62', 'blog', 'show', '', '40', '66.249.74.158', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', 'd27e2fd73eea6c67b85180be571ee13d', '2013-04-02 19:28:12');
INSERT INTO `_log` VALUES ('63', 'blog', 'show', '', '37', '66.249.74.158', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', 'e8d6535067e4dae2ed26e4c05632837a', '2013-04-02 19:28:36');
INSERT INTO `_log` VALUES ('64', 'blog', 'track', '', '36', '66.249.74.158', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', 'b2f33e6d9e56aa77ed17ad1930627da6', '2013-04-02 19:32:20');
INSERT INTO `_log` VALUES ('65', 'blog', 'track', '', '40', '66.249.74.158', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', 'd55f2bcad91bcfc3218e55b5b4228306', '2013-04-02 19:32:38');
INSERT INTO `_log` VALUES ('66', 'blog', 'show', '', '31', '66.249.74.158', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', '9d14fee59175b3b5ba948c203bdbf216', '2013-04-02 19:32:57');
INSERT INTO `_log` VALUES ('67', 'blog', 'track', '', '32', '66.249.74.158', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', 'e049363947cf6d7897886a6b5e92a0d9', '2013-04-02 19:32:58');
INSERT INTO `_log` VALUES ('68', 'blog', 'track', '', '39', '66.249.74.158', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', '2cd175665dded43551d16de0ad80dc8c', '2013-04-02 19:33:09');
INSERT INTO `_log` VALUES ('69', 'blog', 'track', '', '33', '66.249.74.158', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', 'ef3b9922b9652e6af942515a1860529e', '2013-04-02 19:33:12');
INSERT INTO `_log` VALUES ('70', 'blog', 'track', '', '35', '66.249.74.158', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', '68e33b65d371691a99432f20447846f0', '2013-04-02 19:33:14');
INSERT INTO `_log` VALUES ('71', 'blog', 'track', '', '37', '66.249.74.158', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', 'ed6fabd2f5f656854b41bc70fe687d36', '2013-04-02 19:33:27');
INSERT INTO `_log` VALUES ('72', 'blog', 'track', '', '34', '66.249.74.158', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', 'e2e524605dcbc77adfa29fd556a91e87', '2013-04-02 19:33:31');
INSERT INTO `_log` VALUES ('73', 'blog', 'track', '', '38', '66.249.74.158', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', 'e4d8763056f5300e39c25f4aa5125105', '2013-04-02 19:33:35');
INSERT INTO `_log` VALUES ('74', '', '', '', '', '213.180.206.205', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots DEV)', '', '5cabf49af50e8c637e30342fb4fc37ba', '2013-04-02 19:39:18');
INSERT INTO `_log` VALUES ('75', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', '7568516984c9cda8c268ec3f4fc97875', '2013-04-02 19:40:09');
INSERT INTO `_log` VALUES ('76', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', '35a23292b0e525eccbe33d623173711a', '2013-04-02 19:42:14');
INSERT INTO `_log` VALUES ('77', 'tag', 'search', '', '69', '66.249.74.158', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', '940c6148336f0198412da82efeded2de', '2013-04-02 19:44:31');
INSERT INTO `_log` VALUES ('78', 'tag', 'search', '', '71', '66.249.74.158', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', '9494158b587b43544a7f3b38631eb42e', '2013-04-02 19:44:32');
INSERT INTO `_log` VALUES ('79', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', '80fc00a8f82329ad9ecb679f56eb85a6', '2013-04-02 19:46:07');
INSERT INTO `_log` VALUES ('80', 'tag', 'search', '', '70', '66.249.74.158', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', 'd2a719113e5afad8c00f65da24924847', '2013-04-02 19:49:32');
INSERT INTO `_log` VALUES ('81', '', '', '', '', '93.158.155.137', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots)', '', '6e3bb0b26d4e676414868e3aeb8f2a02', '2013-04-02 19:49:52');
INSERT INTO `_log` VALUES ('82', '', '', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/gallery/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-02 19:53:31');
INSERT INTO `_log` VALUES ('83', 'blog', '', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-02 19:53:59');
INSERT INTO `_log` VALUES ('84', 'blog', 'next', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/blog/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-02 19:54:13');
INSERT INTO `_log` VALUES ('85', 'blog', 'next', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/blog/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-02 19:54:13');
INSERT INTO `_log` VALUES ('86', 'blog', 'next', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/blog/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-02 19:54:13');
INSERT INTO `_log` VALUES ('87', 'blog', 'edit', '', '40', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/blog/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-02 19:54:23');
INSERT INTO `_log` VALUES ('88', 'blog', 'track', '', '31', '66.249.74.158', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', '397c33a44e160afb613873736256db43', '2013-04-02 19:54:30');
INSERT INTO `_log` VALUES ('89', 'tag', 'autocomplete', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/blog/edit/id/40/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-02 19:55:00');
INSERT INTO `_log` VALUES ('90', 'tag', 'autocomplete', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/blog/edit/id/40/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-02 19:55:00');
INSERT INTO `_log` VALUES ('91', 'tag', 'autocomplete', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/blog/edit/id/40/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-02 19:55:00');
INSERT INTO `_log` VALUES ('92', 'tag', 'autocomplete', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/blog/edit/id/40/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-02 19:55:00');
INSERT INTO `_log` VALUES ('93', 'tag', 'autocomplete', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/blog/edit/id/40/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-02 19:55:00');
INSERT INTO `_log` VALUES ('94', 'tag', 'autocomplete', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/blog/edit/id/40/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-02 19:55:00');
INSERT INTO `_log` VALUES ('95', 'tag', 'autocomplete', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/blog/edit/id/40/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-02 19:55:01');
INSERT INTO `_log` VALUES ('96', 'tag', 'autocomplete', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/blog/edit/id/40/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-02 19:55:01');
INSERT INTO `_log` VALUES ('97', 'tag', 'autocomplete', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/blog/edit/id/40/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-02 19:55:01');
INSERT INTO `_log` VALUES ('98', 'tag', 'autocomplete', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/blog/edit/id/40/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-02 19:55:01');
INSERT INTO `_log` VALUES ('99', 'tag', 'autocomplete', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/blog/edit/id/40/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-02 19:55:02');
INSERT INTO `_log` VALUES ('100', 'tag', 'autocomplete', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/blog/edit/id/40/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-02 19:55:02');
INSERT INTO `_log` VALUES ('101', 'tag', 'autocomplete', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/blog/edit/id/40/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-02 19:55:02');
INSERT INTO `_log` VALUES ('102', 'tag', 'autocomplete', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/blog/edit/id/40/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-02 19:55:02');
INSERT INTO `_log` VALUES ('103', 'blog', 'save', '', '40', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/blog/edit/id/40/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-02 19:55:10');
INSERT INTO `_log` VALUES ('104', 'blog', '', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-02 19:55:16');
INSERT INTO `_log` VALUES ('105', 'blog', 'next', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/blog/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-02 19:55:17');
INSERT INTO `_log` VALUES ('106', 'blog', 'next', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/blog/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-02 19:55:23');
INSERT INTO `_log` VALUES ('107', 'blog', 'next', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/blog/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-02 19:55:24');
INSERT INTO `_log` VALUES ('108', 'blog', 'next', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/blog/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-02 19:55:26');
INSERT INTO `_log` VALUES ('109', 'blog', 'next', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/blog/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-02 19:55:35');
INSERT INTO `_log` VALUES ('110', 'blog', 'next', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/blog/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-02 19:55:35');
INSERT INTO `_log` VALUES ('111', 'blog', 'next', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/blog/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-02 19:55:43');
INSERT INTO `_log` VALUES ('112', 'blog', 'next', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/blog/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-02 19:55:43');
INSERT INTO `_log` VALUES ('113', 'blog', 'show', '', '13', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/blog/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-02 19:55:49');
INSERT INTO `_log` VALUES ('114', 'blog', 'track', '', '13', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/blog/hobh-four/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-02 19:55:49');
INSERT INTO `_log` VALUES ('115', 'blog', 'show', '', '13', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/blog/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-02 19:55:52');
INSERT INTO `_log` VALUES ('116', 'blog', 'track', '', '13', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/blog/hobh-four/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-02 19:55:53');
INSERT INTO `_log` VALUES ('117', 'blog', 'show', '', '13', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/blog/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-02 19:55:56');
INSERT INTO `_log` VALUES ('118', 'blog', 'track', '', '13', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/blog/hobh-four/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-02 19:55:57');
INSERT INTO `_log` VALUES ('119', 'blog', 'show', '', '11', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/blog/hobh-four/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-02 19:56:04');
INSERT INTO `_log` VALUES ('120', 'blog', 'track', '', '11', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/blog/hobh-two/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-02 19:56:05');
INSERT INTO `_log` VALUES ('121', 'file', '', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/blog/hobh-two/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-02 19:56:15');
INSERT INTO `_log` VALUES ('122', 'file', 'track', '', '532', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/download/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-02 19:56:19');
INSERT INTO `_log` VALUES ('123', 'blog', 'show', '', '14', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/download/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-02 19:56:25');
INSERT INTO `_log` VALUES ('124', 'blog', 'track', '', '14', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/about/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-02 19:56:25');
INSERT INTO `_log` VALUES ('125', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', 'bad9015c7f033f86774720c4554d10d5', '2013-04-02 19:58:53');
INSERT INTO `_log` VALUES ('126', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', '3da8c004dcfd73b19b273af800fa076f', '2013-04-02 20:01:08');
INSERT INTO `_log` VALUES ('127', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', 'bb7c4674d25ec55d69da377a1384eb5c', '2013-04-02 20:04:20');
INSERT INTO `_log` VALUES ('128', 'blog', 'show', '', '14', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/download/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-02 20:07:18');
INSERT INTO `_log` VALUES ('129', 'blog', 'track', '', '14', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/about/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-02 20:07:18');
INSERT INTO `_log` VALUES ('130', 'blog', 'show', '', '14', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/download/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-02 20:07:21');
INSERT INTO `_log` VALUES ('131', 'blog', 'track', '', '14', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/about/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-02 20:07:21');
INSERT INTO `_log` VALUES ('132', 'blog', 'show', '', '14', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/download/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-02 20:08:57');
INSERT INTO `_log` VALUES ('133', 'blog', 'track', '', '14', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/about/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-02 20:08:57');
INSERT INTO `_log` VALUES ('134', 'blog', 'show', '', '14', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/download/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-02 20:09:18');
INSERT INTO `_log` VALUES ('135', 'blog', 'track', '', '14', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/about/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-02 20:09:18');
INSERT INTO `_log` VALUES ('136', 'blog', 'show', '', '38', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/about/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-02 20:09:25');
INSERT INTO `_log` VALUES ('137', 'blog', 'track', '', '38', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/blog/reach/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-02 20:09:26');
INSERT INTO `_log` VALUES ('138', '', '', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/blog/reach/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-02 20:09:35');
INSERT INTO `_log` VALUES ('139', 'user', '', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-02 20:09:53');
INSERT INTO `_log` VALUES ('140', 'sitemap', 'generate', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/dashboard/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-02 20:09:55');
INSERT INTO `_log` VALUES ('141', '', '', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/dashboard/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-02 20:12:23');
INSERT INTO `_log` VALUES ('142', '', '', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/dashboard/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-02 20:12:46');
INSERT INTO `_log` VALUES ('143', 'blog', 'show', '', '14', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-02 20:12:58');
INSERT INTO `_log` VALUES ('144', 'blog', 'track', '', '14', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/about/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-02 20:12:59');
INSERT INTO `_log` VALUES ('145', 'blog', 'show', '', '38', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/about/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-02 20:13:01');
INSERT INTO `_log` VALUES ('146', 'blog', 'track', '', '38', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/blog/reach/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-02 20:13:01');
INSERT INTO `_log` VALUES ('147', 'tag', 'search', '', '36', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/blog/reach/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-02 20:13:10');
INSERT INTO `_log` VALUES ('148', '', '', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/tag/dnb/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-02 20:13:29');
INSERT INTO `_log` VALUES ('149', 'blog', 'show', '', '9', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-02 20:13:30');
INSERT INTO `_log` VALUES ('150', 'blog', 'track', '', '9', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/blog/katana/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-02 20:13:30');
INSERT INTO `_log` VALUES ('151', 'blog', 'edit', '', '9', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/blog/katana/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-02 20:13:35');
INSERT INTO `_log` VALUES ('152', 'tag', 'autocomplete', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/blog/edit/id/9/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-02 20:14:13');
INSERT INTO `_log` VALUES ('153', 'tag', 'autocomplete', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/blog/edit/id/9/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-02 20:14:13');
INSERT INTO `_log` VALUES ('154', 'tag', 'autocomplete', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/blog/edit/id/9/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-02 20:14:13');
INSERT INTO `_log` VALUES ('155', 'tag', 'autocomplete', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/blog/edit/id/9/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-02 20:14:13');
INSERT INTO `_log` VALUES ('156', 'tag', 'autocomplete', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/blog/edit/id/9/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-02 20:14:15');
INSERT INTO `_log` VALUES ('157', 'tag', 'autocomplete', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/blog/edit/id/9/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-02 20:14:15');
INSERT INTO `_log` VALUES ('158', 'tag', 'autocomplete', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/blog/edit/id/9/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-02 20:14:15');
INSERT INTO `_log` VALUES ('159', 'tag', 'autocomplete', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/blog/edit/id/9/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-02 20:14:15');
INSERT INTO `_log` VALUES ('160', 'tag', 'autocomplete', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/blog/edit/id/9/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-02 20:14:16');
INSERT INTO `_log` VALUES ('161', 'tag', 'autocomplete', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/blog/edit/id/9/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-02 20:14:16');
INSERT INTO `_log` VALUES ('162', 'tag', 'autocomplete', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/blog/edit/id/9/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-02 20:14:17');
INSERT INTO `_log` VALUES ('163', 'tag', 'autocomplete', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/blog/edit/id/9/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-02 20:14:17');
INSERT INTO `_log` VALUES ('164', 'tag', 'autocomplete', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/blog/edit/id/9/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-02 20:14:17');
INSERT INTO `_log` VALUES ('165', 'tag', 'autocomplete', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/blog/edit/id/9/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-02 20:14:17');
INSERT INTO `_log` VALUES ('166', 'tag', 'autocomplete', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/blog/edit/id/9/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-02 20:14:17');
INSERT INTO `_log` VALUES ('167', 'tag', 'autocomplete', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/blog/edit/id/9/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-02 20:14:18');
INSERT INTO `_log` VALUES ('168', 'tag', 'autocomplete', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/blog/edit/id/9/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-02 20:14:18');
INSERT INTO `_log` VALUES ('169', 'tag', 'autocomplete', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/blog/edit/id/9/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-02 20:14:18');
INSERT INTO `_log` VALUES ('170', 'tag', 'autocomplete', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/blog/edit/id/9/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-02 20:14:18');
INSERT INTO `_log` VALUES ('171', 'tag', 'autocomplete', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/blog/edit/id/9/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-02 20:14:18');
INSERT INTO `_log` VALUES ('172', 'tag', 'autocomplete', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/blog/edit/id/9/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-02 20:14:19');
INSERT INTO `_log` VALUES ('173', 'tag', 'autocomplete', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/blog/edit/id/9/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-02 20:14:19');
INSERT INTO `_log` VALUES ('174', 'tag', 'autocomplete', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/blog/edit/id/9/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-02 20:14:19');
INSERT INTO `_log` VALUES ('175', 'tag', 'autocomplete', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/blog/edit/id/9/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-02 20:14:19');
INSERT INTO `_log` VALUES ('176', 'tag', 'autocomplete', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/blog/edit/id/9/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-02 20:14:19');
INSERT INTO `_log` VALUES ('177', 'tag', 'autocomplete', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/blog/edit/id/9/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-02 20:14:19');
INSERT INTO `_log` VALUES ('178', 'tag', 'autocomplete', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/blog/edit/id/9/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-02 20:14:19');
INSERT INTO `_log` VALUES ('179', 'tag', 'autocomplete', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/blog/edit/id/9/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-02 20:14:19');
INSERT INTO `_log` VALUES ('180', 'tag', 'autocomplete', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/blog/edit/id/9/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-02 20:14:19');
INSERT INTO `_log` VALUES ('181', 'tag', 'autocomplete', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/blog/edit/id/9/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-02 20:14:19');
INSERT INTO `_log` VALUES ('182', 'blog', 'save', '', '9', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/blog/edit/id/9/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-02 20:14:23');
INSERT INTO `_log` VALUES ('183', '', '', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/blog/edit/id/9/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-02 20:14:26');
INSERT INTO `_log` VALUES ('184', 'blog', 'show', '', '9', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-02 20:14:44');
INSERT INTO `_log` VALUES ('185', 'blog', 'track', '', '9', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/blog/katana/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-02 20:14:44');
INSERT INTO `_log` VALUES ('186', 'blog', 'edit', '', '9', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/blog/katana/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-02 20:14:49');
INSERT INTO `_log` VALUES ('187', '', '', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/blog/edit/id/9/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-02 20:15:01');
INSERT INTO `_log` VALUES ('188', 'tag', 'search', '', '36', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-02 20:15:30');
INSERT INTO `_log` VALUES ('189', 'tag', 'search', '', '38', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/tag/dnb/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-02 20:15:38');
INSERT INTO `_log` VALUES ('190', '', '', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', '', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-02 20:18:19');
INSERT INTO `_log` VALUES ('191', 'user', 'logout', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-02 20:18:28');
INSERT INTO `_log` VALUES ('192', 'user', '', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/logout/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-02 20:18:32');
INSERT INTO `_log` VALUES ('193', 'blog', 'edit', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/dashboard/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-02 20:18:35');
INSERT INTO `_log` VALUES ('194', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', 'e8acd100c4c5e73f93f5e4acbc999664', '2013-04-02 20:18:37');
INSERT INTO `_log` VALUES ('195', 'user', '', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/blog/edit/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-02 20:18:37');
INSERT INTO `_log` VALUES ('196', 'user', '', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/dashboard/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-02 20:18:48');
INSERT INTO `_log` VALUES ('197', 'user', 'registerform', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/dashboard/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-02 20:19:29');
INSERT INTO `_log` VALUES ('198', 'user', 'register', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/register/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-02 20:19:45');
INSERT INTO `_log` VALUES ('199', 'file', 'edit', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-02 20:19:53');
INSERT INTO `_log` VALUES ('200', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', '4f57660808fa1a258ae717763173ceb9', '2013-04-02 20:20:18');
INSERT INTO `_log` VALUES ('201', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', 'cd5715936983d73714d34c03eb853390', '2013-04-02 20:23:54');
INSERT INTO `_log` VALUES ('202', '', '', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/file/edit/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-02 20:25:39');
INSERT INTO `_log` VALUES ('203', 'user', 'logout', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-02 20:25:40');
INSERT INTO `_log` VALUES ('204', 'user', 'registerform', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/logout/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-02 20:25:43');
INSERT INTO `_log` VALUES ('205', 'user', 'registerform', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/register/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-02 20:26:02');
INSERT INTO `_log` VALUES ('206', 'user', 'registerform', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/register/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-02 20:26:17');
INSERT INTO `_log` VALUES ('207', 'user', 'forgotform', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/register/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-02 20:26:22');
INSERT INTO `_log` VALUES ('208', 'user', 'registerform', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/forgot/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-02 20:26:28');
INSERT INTO `_log` VALUES ('209', 'user', 'loginform', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/register/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-02 20:26:32');
INSERT INTO `_log` VALUES ('210', 'user', 'login', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/login/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-02 20:26:35');
INSERT INTO `_log` VALUES ('211', '', '', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-02 20:33:41');
INSERT INTO `_log` VALUES ('212', '', '', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-02 20:33:43');
INSERT INTO `_log` VALUES ('213', '', '', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-02 20:33:53');
INSERT INTO `_log` VALUES ('214', 'user', '', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-02 20:34:26');
INSERT INTO `_log` VALUES ('215', '', '', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/dashboard/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-02 20:34:37');
INSERT INTO `_log` VALUES ('216', '', '', '', '', '213.180.206.205', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots DEV)', '', 'd77c1695164e37e83fe993496ab9455c', '2013-04-02 20:36:16');
INSERT INTO `_log` VALUES ('217', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', '3e8d0a27fd2a8fec7b45f8010af50dba', '2013-04-02 20:37:55');
INSERT INTO `_log` VALUES ('218', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', '050b340843a028cddda23095f04d927d', '2013-04-02 20:39:15');
INSERT INTO `_log` VALUES ('219', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', 'a10ffe74e42cf48334457a20200f5f3a', '2013-04-02 20:43:00');
INSERT INTO `_log` VALUES ('220', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', 'f375f5e8606658eda4de966cb7a7d614', '2013-04-02 20:57:10');
INSERT INTO `_log` VALUES ('221', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', '373c16caa54d84d35382165b7b939382', '2013-04-02 20:58:26');
INSERT INTO `_log` VALUES ('222', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', 'ae4573ea5c00d820b35f6dbaffdaa9f3', '2013-04-02 21:01:47');
INSERT INTO `_log` VALUES ('223', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', '529fcfbc99e47e0627a1ec5939c79bdd', '2013-04-02 21:16:38');
INSERT INTO `_log` VALUES ('224', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', 'c4ae770840d38368b60b3389d5a6cb2a', '2013-04-02 21:17:58');
INSERT INTO `_log` VALUES ('225', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', '1369cd83a08471d6dd947dd6e5cea4b8', '2013-04-02 21:21:02');
INSERT INTO `_log` VALUES ('226', '', '', '', '', '213.180.206.205', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots DEV)', '', '3879017c5de3aab7febb45930d692d0f', '2013-04-02 21:32:02');
INSERT INTO `_log` VALUES ('227', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', 'f565ed01d9c3ea2e91abf3ca4837cbef', '2013-04-02 21:35:47');
INSERT INTO `_log` VALUES ('228', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', 'c97aa1b4f010438df4a6874ae47b75d4', '2013-04-02 21:36:47');
INSERT INTO `_log` VALUES ('229', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', '48d0b65c452a3d38457387abcab3c5d1', '2013-04-02 21:40:20');
INSERT INTO `_log` VALUES ('230', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots)', '', 'd72f36886f6e1313d07fdca7a155845f', '2013-04-02 21:45:35');
INSERT INTO `_log` VALUES ('231', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', 'ec93da5b2318b94daaf5b3b17405c5f9', '2013-04-02 21:54:53');
INSERT INTO `_log` VALUES ('232', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', '4618f9d6358df72028ec670d902bf8df', '2013-04-02 21:55:46');
INSERT INTO `_log` VALUES ('233', '', '', '', '', '91.149.132.93', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', '', 'fff0ffdb6ee4ce6df3afc3793f55e6c2', '2013-04-02 21:58:40');
INSERT INTO `_log` VALUES ('234', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', '8d40e9ef91e972dcb4ebf949887519e2', '2013-04-02 21:59:32');
INSERT INTO `_log` VALUES ('235', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', 'eb6198d7099f76ff0e3cd077935f5481', '2013-04-02 22:13:22');
INSERT INTO `_log` VALUES ('236', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', '9bff71e1fa65b1600bb240ba82709b7f', '2013-04-02 22:15:41');
INSERT INTO `_log` VALUES ('237', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', 'c7c7fed4ef2d66410d9e42d0a6da8b27', '2013-04-02 22:18:04');
INSERT INTO `_log` VALUES ('238', '', '', '', '', '213.180.206.205', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots DEV)', '', '734304da630d06f89bc74be5a717d557', '2013-04-02 22:28:15');
INSERT INTO `_log` VALUES ('239', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', 'c803cba5713aff686fd584271da7c6b7', '2013-04-02 22:31:59');
INSERT INTO `_log` VALUES ('240', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', 'acf3480204334627c33b4cfc3931cfd0', '2013-04-02 22:34:23');
INSERT INTO `_log` VALUES ('241', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', '9f151794bdc99022c86989038037f643', '2013-04-02 22:37:36');
INSERT INTO `_log` VALUES ('242', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', '2585beae0d32fce36db0379f5cfffa85', '2013-04-02 22:51:16');
INSERT INTO `_log` VALUES ('243', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', 'c35058725c1e04447e58a28d03327c5b', '2013-04-02 22:53:40');
INSERT INTO `_log` VALUES ('244', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', 'b1520fb8380066a92b38c350ebdff52c', '2013-04-02 22:56:36');
INSERT INTO `_log` VALUES ('245', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', '5254026e7e18dc90b77ccaf643e9d797', '2013-04-02 23:09:45');
INSERT INTO `_log` VALUES ('246', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', '221cbd0f65c876129651660c1b2c3049', '2013-04-02 23:13:29');
INSERT INTO `_log` VALUES ('247', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', '102aad1cd6cc44bc42b84384021b30f6', '2013-04-02 23:15:51');
INSERT INTO `_log` VALUES ('248', '', '', '', '', '213.180.206.205', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots DEV)', '', 'e9fa4bd31a00cb179bd9afb8e545e54f', '2013-04-02 23:25:56');
INSERT INTO `_log` VALUES ('249', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', '481309b7bab5da97b77b0f9bbb4da700', '2013-04-02 23:29:13');
INSERT INTO `_log` VALUES ('250', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', 'ee0c06fcc7371fb6ebab654365197784', '2013-04-02 23:32:26');
INSERT INTO `_log` VALUES ('251', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', 'c94ce1dca257aa85d7a18f73c131bda0', '2013-04-02 23:34:55');
INSERT INTO `_log` VALUES ('252', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', '64ef61f894e885e235228553922f140d', '2013-04-02 23:48:17');
INSERT INTO `_log` VALUES ('253', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', 'ebcff4fae36f26e0f9dce5ee7eff2c2b', '2013-04-02 23:52:20');
INSERT INTO `_log` VALUES ('254', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', '9f63aa658c908405992efe97f328f3ab', '2013-04-02 23:53:42');
INSERT INTO `_log` VALUES ('255', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', 'a552c42bb0eb27eac2b22cfe42838f61', '2013-04-03 00:08:14');
INSERT INTO `_log` VALUES ('256', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', 'e11d3c3332fc892973eccabba718453d', '2013-04-03 00:11:11');
INSERT INTO `_log` VALUES ('257', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', 'b8d1d27ef13ca2de550541459462028c', '2013-04-03 00:12:21');
INSERT INTO `_log` VALUES ('258', '', '', '', '', '213.180.206.205', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots DEV)', '', '35a35a75d38ef21481fc65c3aeece402', '2013-04-03 00:22:26');
INSERT INTO `_log` VALUES ('259', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', '59d64cec88603acffca358b7cf805639', '2013-04-03 00:27:26');
INSERT INTO `_log` VALUES ('260', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', '3574ff8f7cdac5f263b7335c909145a6', '2013-04-03 00:30:58');
INSERT INTO `_log` VALUES ('261', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', '50622214f511a12d83410a8549d7c7cd', '2013-04-03 00:30:59');
INSERT INTO `_log` VALUES ('262', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', '78688610f50bff9cc1569e50f7b97caa', '2013-04-03 00:46:35');
INSERT INTO `_log` VALUES ('263', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', '5f25c5c46373db99f878def91fafde03', '2013-04-03 00:49:30');
INSERT INTO `_log` VALUES ('264', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', '00d2dcdc62306a456672a7c03d0b1087', '2013-04-03 00:50:35');
INSERT INTO `_log` VALUES ('265', '', '', '', '', '95.72.69.164', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1)', '', 'b52fc2fdf59ed8c65a3a299fb10e070b', '2013-04-03 00:52:10');
INSERT INTO `_log` VALUES ('266', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots)', '', '5de1861bafe0c09dfc77223256eea3f7', '2013-04-03 00:56:31');
INSERT INTO `_log` VALUES ('267', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', 'ae4654c70296957127d6582344cc1131', '2013-04-03 01:06:09');
INSERT INTO `_log` VALUES ('268', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', 'eba22cda49638c1c89f0560dd11d33d7', '2013-04-03 01:08:42');
INSERT INTO `_log` VALUES ('269', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', 'fa8300100c22805baa59d84995b04971', '2013-04-03 01:09:55');
INSERT INTO `_log` VALUES ('270', '', '', '', '', '213.180.206.205', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots DEV)', '', '9dc753badef8ee66b6f1f8573cecb830', '2013-04-03 01:18:37');
INSERT INTO `_log` VALUES ('271', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', '622be394177474b1af0cc08face568ea', '2013-04-03 01:25:07');
INSERT INTO `_log` VALUES ('272', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', '98a53092c3391b5a7cec8aca08b48618', '2013-04-03 01:27:39');
INSERT INTO `_log` VALUES ('273', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', '3ab6093e06ff2cf2c33d4bfd9676bc2e', '2013-04-03 01:28:59');
INSERT INTO `_log` VALUES ('274', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', '41f24f1a20c028984bfe054062f2f2c0', '2013-04-03 01:44:30');
INSERT INTO `_log` VALUES ('275', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', '044825f498331d5b10f33229696a3ec8', '2013-04-03 01:46:49');
INSERT INTO `_log` VALUES ('276', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', 'bd81477cafdf054b7dfa145055a13509', '2013-04-03 01:48:16');
INSERT INTO `_log` VALUES ('277', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', '8df57c035654b29b706315bd4789cdd2', '2013-04-03 02:04:17');
INSERT INTO `_log` VALUES ('278', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', 'b9f658ac9959d4352b9bf146f240bc8b', '2013-04-03 02:06:26');
INSERT INTO `_log` VALUES ('279', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', 'b9e7c85f6a386e752f7899eb5b4edfdc', '2013-04-03 02:07:46');
INSERT INTO `_log` VALUES ('280', '', '', '', '', '213.180.206.205', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots DEV)', '', '9a4a091df9b607d4f0aa86164d6e6179', '2013-04-03 02:14:56');
INSERT INTO `_log` VALUES ('281', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', '64931e3dd8fc93fe848ec34c6ea95756', '2013-04-03 02:23:36');
INSERT INTO `_log` VALUES ('282', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', '4aae36d67d859ad24882ca8c799c1437', '2013-04-03 02:25:34');
INSERT INTO `_log` VALUES ('283', 'user', 'loginform', '', '', '66.249.74.158', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', '56cc115faa6b52ebf6f41d6907218d0f', '2013-04-03 02:25:46');
INSERT INTO `_log` VALUES ('284', 'blog', 'show', '', '2', '66.249.74.158', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', '9cec06e2822fdf3c96a9a15fa01b307f', '2013-04-03 02:26:02');
INSERT INTO `_log` VALUES ('285', 'sitemap', '', '', '', '66.249.74.158', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', '9b105f9413df7dd46049814bc2d50c55', '2013-04-03 02:26:35');
INSERT INTO `_log` VALUES ('286', 'blog', '', '', '', '66.249.74.158', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', '6f0af74505c53a2f60c12f683732cdbe', '2013-04-03 02:27:05');
INSERT INTO `_log` VALUES ('287', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', 'c9dda92118056e560507dbe9d0cc8c02', '2013-04-03 02:27:26');
INSERT INTO `_log` VALUES ('288', 'blog', 'show', '', '14', '66.249.74.158', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', '96b868f3e1695bb37377126b59663c18', '2013-04-03 02:27:35');
INSERT INTO `_log` VALUES ('289', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', '77a245a1f061c9f154d6c0fa6911ddf1', '2013-04-03 02:42:24');
INSERT INTO `_log` VALUES ('290', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', 'cab5b5aa14fe496fd6a53abaac3f0c09', '2013-04-03 02:44:15');
INSERT INTO `_log` VALUES ('291', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', 'fb8f9abad0b741c4f51050de3da69177', '2013-04-03 02:46:05');
INSERT INTO `_log` VALUES ('292', 'gallery', '', '', '', '66.249.74.158', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', 'dd44810f09e23e1bc037037ccb7861db', '2013-04-03 02:50:39');
INSERT INTO `_log` VALUES ('293', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', 'eeaffe693bb582171d08539772b37990', '2013-04-03 03:01:42');
INSERT INTO `_log` VALUES ('294', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', 'e04fa6389b9c5b50ffb2760d1699dcc0', '2013-04-03 03:03:23');
INSERT INTO `_log` VALUES ('295', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', '3dac52e4921b865f1af2696a691c3809', '2013-04-03 03:05:02');
INSERT INTO `_log` VALUES ('296', '', '', '', '', '213.180.206.205', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots DEV)', '', '1d3212fa19685897fd3f650954041410', '2013-04-03 03:10:46');
INSERT INTO `_log` VALUES ('297', 'file', '', '', '', '66.249.74.158', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', 'c795ad420509f1469162252c1f8e846a', '2013-04-03 03:14:29');
INSERT INTO `_log` VALUES ('298', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', 'b3787c00b37470ca7c50d887f0fe1f7f', '2013-04-03 03:20:27');
INSERT INTO `_log` VALUES ('299', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', '210914b5061152ca923ba528894df873', '2013-04-03 03:22:57');
INSERT INTO `_log` VALUES ('300', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', 'f6e32fb2bdcb08a237a53a0f35ebee5b', '2013-04-03 03:24:23');
INSERT INTO `_log` VALUES ('301', 'blog', 'show', '', '16', '66.249.74.158', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', '6cb259a286f5008de20bc56ef75cee22', '2013-04-03 03:35:27');
INSERT INTO `_log` VALUES ('302', 'user', 'registerform', '', '', '66.249.74.158', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', '0b789c1c44b8f41c078d348269e49242', '2013-04-03 03:35:27');
INSERT INTO `_log` VALUES ('303', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', 'bbc3e2e22f302adb257fb84fab4de728', '2013-04-03 03:39:55');
INSERT INTO `_log` VALUES ('304', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', '9f5a7b20ff8da3f0ca2790aa6b5b5908', '2013-04-03 03:41:42');
INSERT INTO `_log` VALUES ('305', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', 'e6f96b145a8aadbac100402dea3c645d', '2013-04-03 03:44:00');
INSERT INTO `_log` VALUES ('306', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots)', '', '605ea8cc54e24e686e033324ef89889e', '2013-04-03 03:44:52');
INSERT INTO `_log` VALUES ('307', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', 'd0d9657229020b89bdde040fa23ed274', '2013-04-03 03:58:57');
INSERT INTO `_log` VALUES ('308', 'tag', 'search', '', '18', '66.249.74.158', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', 'b91021522c4477f530d4f20018667cfb', '2013-04-03 04:00:11');
INSERT INTO `_log` VALUES ('309', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', '73715fc54d40e7040a3db42ffdbb9d24', '2013-04-03 04:00:32');
INSERT INTO `_log` VALUES ('310', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', 'e09aa40596e6136f90c8cf74dbbaad74', '2013-04-03 04:03:13');
INSERT INTO `_log` VALUES ('311', '', '', '', '', '213.180.206.205', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots DEV)', '', 'e42440a25fe165e34a0ad87d5fcfa57c', '2013-04-03 04:07:54');
INSERT INTO `_log` VALUES ('312', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', '2eb01c618e60697101bcad8af02dbd22', '2013-04-03 04:18:28');
INSERT INTO `_log` VALUES ('313', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', 'da66558328b97dd662f01a3966ccbc0f', '2013-04-03 04:19:48');
INSERT INTO `_log` VALUES ('314', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', '15e9ffdb4795c4ac0a13c3f700ae64f0', '2013-04-03 04:22:24');
INSERT INTO `_log` VALUES ('315', 'tag', 'search', '', '5', '66.249.74.158', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', '5a18433da6d3069158d052ff16a28b3a', '2013-04-03 04:24:29');
INSERT INTO `_log` VALUES ('316', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', '24f52f4e5a6e9fbed306314312ca770f', '2013-04-03 04:37:34');
INSERT INTO `_log` VALUES ('317', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', '5adef5960b85705b7b711e89c1ab0cc4', '2013-04-03 04:38:34');
INSERT INTO `_log` VALUES ('318', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', '6fb971642c3d57ee112fa43f12958ce7', '2013-04-03 04:41:10');
INSERT INTO `_log` VALUES ('319', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', 'a32804447eed790f060c8b7aaa7b1a04', '2013-04-03 04:57:05');
INSERT INTO `_log` VALUES ('320', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', '3f8cda3eee0b487aad8894815f64a3f1', '2013-04-03 04:57:44');
INSERT INTO `_log` VALUES ('321', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', '8133a9bf9fa3816dac3f2aa641fb3301', '2013-04-03 05:00:32');
INSERT INTO `_log` VALUES ('322', '', '', '', '', '213.180.206.205', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots DEV)', '', '75203e07d1c4f684c565239bc18b4a48', '2013-04-03 05:04:49');
INSERT INTO `_log` VALUES ('323', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', '8011d2c0f4100dfe937aada9f83e808a', '2013-04-03 05:16:07');
INSERT INTO `_log` VALUES ('324', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', 'ee64d65c222930e4219ebe58425b08d4', '2013-04-03 05:16:38');
INSERT INTO `_log` VALUES ('325', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', '5a2a89dfc54348ccf09537e2de3471e2', '2013-04-03 05:19:22');
INSERT INTO `_log` VALUES ('326', 'tag', 'search', '', '36', '66.249.74.158', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', '3079b825100f9e24e281342c53c8d13c', '2013-04-03 05:22:05');
INSERT INTO `_log` VALUES ('327', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', 'a6a83ffa91b64e43150722db4bc9c9c9', '2013-04-03 05:35:20');
INSERT INTO `_log` VALUES ('328', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', 'b289c4df5c52e509411ca13b758dc2fa', '2013-04-03 05:35:31');
INSERT INTO `_log` VALUES ('329', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', '384b70029aa098fb7d6d75710179905f', '2013-04-03 05:38:29');
INSERT INTO `_log` VALUES ('330', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', '8217b7783266e0459206169dcdf66ea6', '2013-04-03 05:54:32');
INSERT INTO `_log` VALUES ('331', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', '2f293f68a619a362e04a08ebdf66c680', '2013-04-03 05:55:03');
INSERT INTO `_log` VALUES ('332', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', 'b70d40d6341c4a5358bb114a23919009', '2013-04-03 05:57:04');
INSERT INTO `_log` VALUES ('333', '', '', '', '', '213.180.206.205', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots DEV)', '', '1fd83e121f72e8923dcd9b084a3882a8', '2013-04-03 05:59:50');
INSERT INTO `_log` VALUES ('334', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', '62ca86f385df3e2524738235af04b1b2', '2013-04-03 06:14:26');
INSERT INTO `_log` VALUES ('335', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', 'ee9e20403277d8b1655a2557421c4694', '2013-04-03 06:14:55');
INSERT INTO `_log` VALUES ('336', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', '95be62a0555a5bc10f70920afde7216c', '2013-04-03 06:15:19');
INSERT INTO `_log` VALUES ('337', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots)', '', '1833bc59d1c2a221ea815bcb3697550a', '2013-04-03 06:15:47');
INSERT INTO `_log` VALUES ('338', 'tag', 'search', '', '24', '66.249.74.158', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', '7eb1bf79b67ec383701e845d5806d524', '2013-04-03 06:20:55');
INSERT INTO `_log` VALUES ('339', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', 'bf4334a4c6cb18a992b9a9b5a283164d', '2013-04-03 06:33:25');
INSERT INTO `_log` VALUES ('340', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', 'd454bae920e822513e8b57b43e03bb30', '2013-04-03 06:33:34');
INSERT INTO `_log` VALUES ('341', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', '380a68496bb669fb9369276c5eb8dce8', '2013-04-03 06:33:51');
INSERT INTO `_log` VALUES ('342', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', '9a5d99780bb745fa66b98efa94fc7a39', '2013-04-03 06:52:25');
INSERT INTO `_log` VALUES ('343', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', '1ea160c84761cc3d3fd3425dd5975e36', '2013-04-03 06:52:51');
INSERT INTO `_log` VALUES ('344', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', '510a3cd3fc5831dc0f628bb1ad709ebe', '2013-04-03 06:53:30');
INSERT INTO `_log` VALUES ('345', '', '', '', '', '213.180.206.205', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots DEV)', '', 'ca7d3e79ba4919d20e2f419e11a53e87', '2013-04-03 06:56:19');
INSERT INTO `_log` VALUES ('346', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', '12a9c967df6c3325b2187694af740b89', '2013-04-03 07:11:43');
INSERT INTO `_log` VALUES ('347', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', '1326f2a17a32449924ed58f2d9cff528', '2013-04-03 07:11:59');
INSERT INTO `_log` VALUES ('348', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', 'a7563b9eb9f48f7cd428f477395286f2', '2013-04-03 07:13:16');
INSERT INTO `_log` VALUES ('349', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', 'b14bbdc00d1e28149409942eada6868c', '2013-04-03 07:30:55');
INSERT INTO `_log` VALUES ('350', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', '72245d4d557c99129258288b8f3768a0', '2013-04-03 07:31:31');
INSERT INTO `_log` VALUES ('351', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', '910cf79a7a22de5c8b74efae509d783c', '2013-04-03 07:32:54');
INSERT INTO `_log` VALUES ('352', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', '5aed772338f63fe8e4ec0a97e6d79da3', '2013-04-03 07:49:24');
INSERT INTO `_log` VALUES ('353', 'tag', 'search', '', '20', '66.249.74.158', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', 'ca162f3ac9c91cba30ce0703e893adf5', '2013-04-03 07:51:02');
INSERT INTO `_log` VALUES ('354', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', '4b26f7831bae83d156f1bc11a99eee82', '2013-04-03 07:51:09');
INSERT INTO `_log` VALUES ('355', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', '975b7b210bc523d55d7cba510c6e7acb', '2013-04-03 07:52:46');
INSERT INTO `_log` VALUES ('356', '', '', '', '', '213.180.206.205', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots DEV)', '', '0f8edcb46e2be932e482599cadaafb29', '2013-04-03 07:52:54');
INSERT INTO `_log` VALUES ('357', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', '6b2c375c1121b7ee8536d2fb2938d7ae', '2013-04-03 08:08:45');
INSERT INTO `_log` VALUES ('358', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', 'a9fcd2ceebb5b5f867ba747ad46d0db0', '2013-04-03 08:09:50');
INSERT INTO `_log` VALUES ('359', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', '22e170bb22051c3710a4c0a4bd5ea8ed', '2013-04-03 08:11:48');
INSERT INTO `_log` VALUES ('360', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', '1b987cac5c6e77692af421d3bdd18782', '2013-04-03 08:28:36');
INSERT INTO `_log` VALUES ('361', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', 'e1fc181332205117982d047e9f9f3d87', '2013-04-03 08:28:42');
INSERT INTO `_log` VALUES ('362', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', '1b70c6ff8a568dc1360a6a2d9e53b377', '2013-04-03 08:30:47');
INSERT INTO `_log` VALUES ('363', 'tag', 'search', '', '49', '66.249.74.158', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', '0f8e22938c9827fb085ee853f5213b5b', '2013-04-03 08:43:41');
INSERT INTO `_log` VALUES ('364', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', '182c8ddaf8f015ccf7e31ce6ff3c2052', '2013-04-03 08:47:11');
INSERT INTO `_log` VALUES ('365', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', 'afc16b28df5fe79e66be02ee18209d72', '2013-04-03 08:48:20');
INSERT INTO `_log` VALUES ('366', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots)', '', '16f4f39bf80d1abf57b23be587fe389e', '2013-04-03 08:48:45');
INSERT INTO `_log` VALUES ('367', '', '', '', '', '213.180.206.205', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots DEV)', '', '1231e587837e4381434e85411c0a057a', '2013-04-03 08:49:10');
INSERT INTO `_log` VALUES ('368', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', 'd4301fdfbad6435b784ab55b3fbef58f', '2013-04-03 08:50:29');
INSERT INTO `_log` VALUES ('369', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', '28ce6c196435185cd32a14f8012b792a', '2013-04-03 09:06:24');
INSERT INTO `_log` VALUES ('370', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', 'c06c7d9132922175f2cbd24ee9a57336', '2013-04-03 09:07:38');
INSERT INTO `_log` VALUES ('371', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', 'd3620ef10d107ee097facedb6a481ace', '2013-04-03 09:09:49');
INSERT INTO `_log` VALUES ('372', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', '3144c87f55782acc64cae5ae0450bfd4', '2013-04-03 09:25:25');
INSERT INTO `_log` VALUES ('373', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', 'e6293dc97496e02b47ef9b70ed00ea67', '2013-04-03 09:26:33');
INSERT INTO `_log` VALUES ('374', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', 'b1a0dd609bf2051dff0bd88d2fd1ffd9', '2013-04-03 09:28:35');
INSERT INTO `_log` VALUES ('375', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', '4e69f728ab1c08de794fae163cce74cc', '2013-04-03 09:44:02');
INSERT INTO `_log` VALUES ('376', '', '', '', '', '213.180.206.205', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots DEV)', '', '308f296aad4d36e06d3aa47bf3b2ed74', '2013-04-03 09:44:48');
INSERT INTO `_log` VALUES ('377', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', 'd3a4e4febb572eafaacd37b620201517', '2013-04-03 09:45:38');
INSERT INTO `_log` VALUES ('378', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', '34808ba8930da9414fe205b7dfe00f43', '2013-04-03 09:47:49');
INSERT INTO `_log` VALUES ('379', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', '18e5ec6e1b40e290f74ed9691c86ca2a', '2013-04-03 10:02:49');
INSERT INTO `_log` VALUES ('380', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', '10a53089238327bae74c510cc558515a', '2013-04-03 10:04:53');
INSERT INTO `_log` VALUES ('381', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', 'a81c759c51a018b2f5e6028edcf9955e', '2013-04-03 10:06:58');
INSERT INTO `_log` VALUES ('382', 'tag', 'search', '', '43', '66.249.74.158', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', '14e9f2914057201dab8974fe7aa2f897', '2013-04-03 10:11:58');
INSERT INTO `_log` VALUES ('383', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', '67a62106fa96fd0e0cf258d196d44b07', '2013-04-03 10:21:44');
INSERT INTO `_log` VALUES ('384', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', '0eb6d03284ac46f5ae2bf559163e1dca', '2013-04-03 10:24:07');
INSERT INTO `_log` VALUES ('385', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', 'ef682675585382e86ee0a2c0c78aa0f5', '2013-04-03 10:26:29');
INSERT INTO `_log` VALUES ('386', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', '86dd2f7b282f85b27bfe21c6239e8bfe', '2013-04-03 10:40:30');
INSERT INTO `_log` VALUES ('387', '', '', '', '', '213.180.206.205', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots DEV)', '', '69f106dc6e80f9ea793500eae46572ac', '2013-04-03 10:42:55');
INSERT INTO `_log` VALUES ('388', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', 'f9687a76845875ed186547c6af4c7b8e', '2013-04-03 10:42:57');
INSERT INTO `_log` VALUES ('389', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', 'eb490f58deef952b94e7b955b7ba9db6', '2013-04-03 10:45:15');
INSERT INTO `_log` VALUES ('390', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', '64e2e9c323909d7691ff857967e8bcf6', '2013-04-03 10:45:19');
INSERT INTO `_log` VALUES ('391', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', 'a89600455081ef49521c1812a64f0f23', '2013-04-03 10:59:43');
INSERT INTO `_log` VALUES ('392', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', '6e0b82a398962254a3aef8bf5c04a789', '2013-04-03 11:04:09');
INSERT INTO `_log` VALUES ('393', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', 'fa06236d2ddea6c6db9aa4a36c9a42a0', '2013-04-03 11:04:17');
INSERT INTO `_log` VALUES ('394', 'tag', 'search', '', '48', '66.249.74.158', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', '6645789173d8a5f8afb451a382debd6a', '2013-04-03 11:10:13');
INSERT INTO `_log` VALUES ('395', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', 'cd5aa9759da0d18bfcbf8fc6e67cf2e7', '2013-04-03 11:19:02');
INSERT INTO `_log` VALUES ('396', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots)', '', '121b09575529984f1f11db7d56540045', '2013-04-03 11:22:11');
INSERT INTO `_log` VALUES ('397', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', '0d3d2a4a5f6c1fd8e78ff48967b70a50', '2013-04-03 11:23:11');
INSERT INTO `_log` VALUES ('398', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', '35d7a80debac79e04b99dde943db0e30', '2013-04-03 11:23:36');
INSERT INTO `_log` VALUES ('399', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', 'e35714a88603eb134dd1a32ffc1e5307', '2013-04-03 11:37:29');
INSERT INTO `_log` VALUES ('400', '', '', '', '', '213.180.206.205', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots DEV)', '', 'd406b86fb0cd39261a8fd8e44b5ba221', '2013-04-03 11:39:23');
INSERT INTO `_log` VALUES ('401', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', '39106e519a8bf7694732ee9e14d46a35', '2013-04-03 11:42:11');
INSERT INTO `_log` VALUES ('402', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', 'e35c686f307d2829472e92efa26e0aed', '2013-04-03 11:42:55');
INSERT INTO `_log` VALUES ('403', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', 'f257d1fa481f32bb6f668abe8ffec61e', '2013-04-03 11:56:54');
INSERT INTO `_log` VALUES ('404', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', '4eb5b127251e20e93a3a5d3e0d001e5f', '2013-04-03 12:01:21');
INSERT INTO `_log` VALUES ('405', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', '7f22d749e06a8b62b886cba6e7782dac', '2013-04-03 12:01:37');
INSERT INTO `_log` VALUES ('406', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', '19c5706aca93a17ea3825c896885462b', '2013-04-03 12:15:58');
INSERT INTO `_log` VALUES ('407', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', 'dc57c0f0f355ded70c95353988440dee', '2013-04-03 12:20:42');
INSERT INTO `_log` VALUES ('408', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', 'd6704daeaa454643577f4701d8c5a4db', '2013-04-03 12:21:26');
INSERT INTO `_log` VALUES ('409', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', '4c4c10322c244a2ca48aa8c499ec0e1e', '2013-04-03 12:35:27');
INSERT INTO `_log` VALUES ('410', '', '', '', '', '213.180.206.205', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots DEV)', '', '91b324243ae08cb5863d4ac678055764', '2013-04-03 12:35:51');
INSERT INTO `_log` VALUES ('411', '', '', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', '', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-03 12:35:53');
INSERT INTO `_log` VALUES ('412', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', '2b5988cee9c7d66c3dc0f1bcdceb4e93', '2013-04-03 12:39:28');
INSERT INTO `_log` VALUES ('413', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', 'd3b3f82c691759d291e1946da50ab263', '2013-04-03 12:39:55');
INSERT INTO `_log` VALUES ('414', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', 'e963da70ec1c86079c98d7d1f3e27a38', '2013-04-03 12:54:41');
INSERT INTO `_log` VALUES ('415', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', 'a5ca9d1a11815c34a3c0d28906785535', '2013-04-03 12:58:10');
INSERT INTO `_log` VALUES ('416', '', '', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', '', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-03 12:58:22');
INSERT INTO `_log` VALUES ('417', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', '070dcde4a54c299e1494e0a27c0888df', '2013-04-03 12:59:24');
INSERT INTO `_log` VALUES ('418', 'tag', 'search', '', '21', '66.249.74.158', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', '10b477c94b797f650d4971c701373b17', '2013-04-03 13:02:53');
INSERT INTO `_log` VALUES ('419', 'user', '', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-03 13:11:42');
INSERT INTO `_log` VALUES ('420', 'sitemap', 'generate', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/dashboard/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-03 13:11:44');
INSERT INTO `_log` VALUES ('421', 'sitemap', 'generate', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/dashboard/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-03 13:12:40');
INSERT INTO `_log` VALUES ('422', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', '826c9663267b7e50796ab853ad513700', '2013-04-03 13:13:40');
INSERT INTO `_log` VALUES ('423', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', 'a7c3a9a921d9ab46b20d0a9f85775d7e', '2013-04-03 13:16:37');
INSERT INTO `_log` VALUES ('424', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', '7ec7919c2797556b6ca4f30c0ab94902', '2013-04-03 13:18:23');
INSERT INTO `_log` VALUES ('425', 'sitemap', 'generate', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/dashboard/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-03 13:20:09');
INSERT INTO `_log` VALUES ('426', 'sitemap', 'generate', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/dashboard/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-03 13:21:16');
INSERT INTO `_log` VALUES ('427', 'sitemap', 'generate', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/dashboard/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-03 13:25:18');
INSERT INTO `_log` VALUES ('428', 'user', '', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-03 13:26:17');
INSERT INTO `_log` VALUES ('429', 'sitemap', 'generate', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/dashboard/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-03 13:27:04');
INSERT INTO `_log` VALUES ('430', 'user', '', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-03 13:27:10');
INSERT INTO `_log` VALUES ('431', '', '', '', '', '213.180.206.205', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots DEV)', '', 'qimgm0pdpst0d4rq1u8ttje2o0', '2013-04-03 13:31:32');
INSERT INTO `_log` VALUES ('432', 'blog', 'show', '', '9', '66.249.74.158', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', '13mrinv6hmnvut1h4qi6fiqio4', '2013-04-03 13:31:41');
INSERT INTO `_log` VALUES ('433', 'sitemap', 'generate', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/dashboard/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-03 13:32:16');
INSERT INTO `_log` VALUES ('434', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', '8pbaqk8gjf4coe22vvs11g1171', '2013-04-03 13:32:58');
INSERT INTO `_log` VALUES ('435', '', '', '', '', '86.57.158.234', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.4 (KHTML, like Gecko; Google Page Speed Insights) Chrome/22.0.1229 Safari/537.4', '', 'c1a5rtgk635akd4ug3pjtnqv43', '2013-04-03 13:35:14');
INSERT INTO `_log` VALUES ('436', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', '30lbqnsf1r3nja0t6fgct3ppf1', '2013-04-03 13:35:42');
INSERT INTO `_log` VALUES ('437', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', 'kah3s2t7f0jgskhmitiak003o7', '2013-04-03 13:38:05');
INSERT INTO `_log` VALUES ('438', '', '', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/dashboard/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-03 13:44:11');
INSERT INTO `_log` VALUES ('439', '', '', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/dashboard/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-03 13:44:16');
INSERT INTO `_log` VALUES ('440', '', '', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/dashboard/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-03 13:44:19');
INSERT INTO `_log` VALUES ('441', '', '', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/dashboard/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-03 13:45:34');
INSERT INTO `_log` VALUES ('442', '', '', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/dashboard/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-03 13:45:36');
INSERT INTO `_log` VALUES ('443', 'file', '', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-03 13:46:50');
INSERT INTO `_log` VALUES ('444', 'blog', 'show', '', '14', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/download/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-03 13:46:52');
INSERT INTO `_log` VALUES ('445', 'blog', 'track', '', '14', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/about/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-03 13:46:52');
INSERT INTO `_log` VALUES ('446', 'user', '', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/about/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-03 13:46:53');
INSERT INTO `_log` VALUES ('447', 'user', '', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/about/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-03 13:48:09');
INSERT INTO `_log` VALUES ('448', '', '', '', '', '86.57.158.234', 'Mozilla/5.0 (iPhone; U; CPU iPhone OS 4_0_1 like Mac OS X; en-us) AppleWebKit/537.4 (KHTML, like Gecko; Google Page Speed Insights) Version/4.0.5 Mobile/8A306 Safari/6531.22.7', '', '31hggnfscpo7t8qa4emsc0rfk3', '2013-04-03 13:48:44');
INSERT INTO `_log` VALUES ('449', '', '', '', '', '86.57.158.234', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.4 (KHTML, like Gecko; Google Page Speed Insights) Chrome/22.0.1229 Safari/537.4', '', '4vt1ugtqtbvu507c0ns9nbfcc2', '2013-04-03 13:49:12');
INSERT INTO `_log` VALUES ('450', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', 'c3v5d0glvhbptj7u9r3krbqgu3', '2013-04-03 13:52:02');
INSERT INTO `_log` VALUES ('451', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', '3a9at6gabm0gf7lu4nkjtlehm6', '2013-04-03 13:54:45');
INSERT INTO `_log` VALUES ('452', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', '8i9u4rhp64tuide71p29ebr537', '2013-04-03 13:56:34');
INSERT INTO `_log` VALUES ('453', '', '', '', '', '86.57.158.234', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.4 (KHTML, like Gecko; Google Page Speed Insights) Chrome/22.0.1229 Safari/537.4', '', '1fa1tca129kdft9l1hebtmqbv6', '2013-04-03 14:09:07');
INSERT INTO `_log` VALUES ('454', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots)', '', 'j1he33n8ubkmr85bmm4msm2mp6', '2013-04-03 14:09:39');
INSERT INTO `_log` VALUES ('455', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', 'br3hbe7sk8k540i7t1ua0h3ii4', '2013-04-03 14:11:46');
INSERT INTO `_log` VALUES ('456', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', 'b630edgorss50psj1hd0h5n2b6', '2013-04-03 14:13:22');
INSERT INTO `_log` VALUES ('457', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', 'anq64b36fnskco1ng1kb33ugm2', '2013-04-03 14:15:29');
INSERT INTO `_log` VALUES ('458', '', '', '', '', '213.180.206.205', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots DEV)', '', 'abp0o9s9p7tgosi3tti2s23ep1', '2013-04-03 14:28:16');
INSERT INTO `_log` VALUES ('459', 'tag', 'search', '', '3', '66.249.74.158', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', 'qb1e66ujhpvg9l1nfo6deuor27', '2013-04-03 14:30:27');
INSERT INTO `_log` VALUES ('460', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', '379eedtm7ekj1pdkva0af77580', '2013-04-03 14:30:59');
INSERT INTO `_log` VALUES ('461', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', 'iff412dnoo9cb7f95l3ao63et1', '2013-04-03 14:32:31');
INSERT INTO `_log` VALUES ('462', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', 'uda1skfdsemsep6icd23s2r997', '2013-04-03 14:33:36');
INSERT INTO `_log` VALUES ('463', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', 'viv0ci4844amgdu9hq5rpq0ag6', '2013-04-03 14:50:21');
INSERT INTO `_log` VALUES ('464', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', '66u74p2nvj8053ue6084pu4au3', '2013-04-03 14:51:47');
INSERT INTO `_log` VALUES ('465', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', 'oemi7004m758vogvgb2n3rc2n4', '2013-04-03 14:52:28');
INSERT INTO `_log` VALUES ('466', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', '9saerubdl9emf3j049q0fka7h2', '2013-04-03 15:09:33');
INSERT INTO `_log` VALUES ('467', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', 'vl3d8752hhc0u1i60stf536fe4', '2013-04-03 15:11:13');
INSERT INTO `_log` VALUES ('468', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', 'bao5rfqgpleq4lp0mjira1nos0', '2013-04-03 15:11:40');
INSERT INTO `_log` VALUES ('469', '', '', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', '', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-03 15:22:32');
INSERT INTO `_log` VALUES ('470', '', '', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', '', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-03 15:22:44');
INSERT INTO `_log` VALUES ('471', 'blog', 'show', '', '14', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-03 15:23:14');
INSERT INTO `_log` VALUES ('472', 'blog', 'track', '', '14', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/about/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-03 15:23:15');
INSERT INTO `_log` VALUES ('473', '', '', '', '', '213.180.206.205', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots DEV)', '', '0btlik2mhi5q8dfeehi8l71ve3', '2013-04-03 15:23:18');
INSERT INTO `_log` VALUES ('474', 'file', '', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/about/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-03 15:23:24');
INSERT INTO `_log` VALUES ('475', 'file', '', '', '', '86.57.158.234', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.4 (KHTML, like Gecko; Google Page Speed Insights) Chrome/22.0.1229 Safari/537.4', '', 't0ceqh73kbbukm56jb5o6bvu94', '2013-04-03 15:23:34');
INSERT INTO `_log` VALUES ('476', '', '', '', '', '86.57.158.234', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.4 (KHTML, like Gecko; Google Page Speed Insights) Chrome/22.0.1229 Safari/537.4', '', 'j9r29jr2r919lqo127ii2o5o47', '2013-04-03 15:24:51');
INSERT INTO `_log` VALUES ('477', 'gallery', '', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/download/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-03 15:25:03');
INSERT INTO `_log` VALUES ('478', '', '', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', '', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-03 15:25:41');
INSERT INTO `_log` VALUES ('479', '', '', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:14.0) Gecko/20100101 Firefox/14.0.1', '', 'dt65hqgehpt4uf95p70c1u4fb1', '2013-04-03 15:25:48');
INSERT INTO `_log` VALUES ('480', 'file', '', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:14.0) Gecko/20100101 Firefox/14.0.1', 'http://manti.by/', 'dt65hqgehpt4uf95p70c1u4fb1', '2013-04-03 15:26:12');
INSERT INTO `_log` VALUES ('481', 'blog', '', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:14.0) Gecko/20100101 Firefox/14.0.1', 'http://manti.by/download/', 'dt65hqgehpt4uf95p70c1u4fb1', '2013-04-03 15:26:14');
INSERT INTO `_log` VALUES ('482', 'blog', 'next', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:14.0) Gecko/20100101 Firefox/14.0.1', 'http://manti.by/blog/', 'dt65hqgehpt4uf95p70c1u4fb1', '2013-04-03 15:26:18');
INSERT INTO `_log` VALUES ('483', 'blog', 'next', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:14.0) Gecko/20100101 Firefox/14.0.1', 'http://manti.by/blog/', 'dt65hqgehpt4uf95p70c1u4fb1', '2013-04-03 15:26:18');
INSERT INTO `_log` VALUES ('484', 'blog', 'next', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:14.0) Gecko/20100101 Firefox/14.0.1', 'http://manti.by/blog/', 'dt65hqgehpt4uf95p70c1u4fb1', '2013-04-03 15:26:18');
INSERT INTO `_log` VALUES ('485', 'blog', 'next', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:14.0) Gecko/20100101 Firefox/14.0.1', 'http://manti.by/blog/', 'dt65hqgehpt4uf95p70c1u4fb1', '2013-04-03 15:26:18');
INSERT INTO `_log` VALUES ('486', 'blog', 'next', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:14.0) Gecko/20100101 Firefox/14.0.1', 'http://manti.by/blog/', 'dt65hqgehpt4uf95p70c1u4fb1', '2013-04-03 15:26:18');
INSERT INTO `_log` VALUES ('487', 'blog', 'next', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:14.0) Gecko/20100101 Firefox/14.0.1', 'http://manti.by/blog/', 'dt65hqgehpt4uf95p70c1u4fb1', '2013-04-03 15:26:30');
INSERT INTO `_log` VALUES ('488', 'blog', 'next', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:14.0) Gecko/20100101 Firefox/14.0.1', 'http://manti.by/blog/', 'dt65hqgehpt4uf95p70c1u4fb1', '2013-04-03 15:26:30');
INSERT INTO `_log` VALUES ('489', 'blog', 'next', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:14.0) Gecko/20100101 Firefox/14.0.1', 'http://manti.by/blog/', 'dt65hqgehpt4uf95p70c1u4fb1', '2013-04-03 15:26:30');
INSERT INTO `_log` VALUES ('490', 'blog', 'next', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:14.0) Gecko/20100101 Firefox/14.0.1', 'http://manti.by/blog/', 'dt65hqgehpt4uf95p70c1u4fb1', '2013-04-03 15:26:30');
INSERT INTO `_log` VALUES ('491', 'blog', 'next', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:14.0) Gecko/20100101 Firefox/14.0.1', 'http://manti.by/blog/', 'dt65hqgehpt4uf95p70c1u4fb1', '2013-04-03 15:26:30');
INSERT INTO `_log` VALUES ('492', 'blog', 'next', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:14.0) Gecko/20100101 Firefox/14.0.1', 'http://manti.by/blog/', 'dt65hqgehpt4uf95p70c1u4fb1', '2013-04-03 15:26:51');
INSERT INTO `_log` VALUES ('493', 'blog', 'next', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:14.0) Gecko/20100101 Firefox/14.0.1', 'http://manti.by/blog/', 'dt65hqgehpt4uf95p70c1u4fb1', '2013-04-03 15:26:51');
INSERT INTO `_log` VALUES ('494', 'blog', 'next', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:14.0) Gecko/20100101 Firefox/14.0.1', 'http://manti.by/blog/', 'dt65hqgehpt4uf95p70c1u4fb1', '2013-04-03 15:26:51');
INSERT INTO `_log` VALUES ('495', 'blog', 'next', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:14.0) Gecko/20100101 Firefox/14.0.1', 'http://manti.by/blog/', 'dt65hqgehpt4uf95p70c1u4fb1', '2013-04-03 15:26:51');
INSERT INTO `_log` VALUES ('496', 'blog', 'next', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:14.0) Gecko/20100101 Firefox/14.0.1', 'http://manti.by/blog/', 'dt65hqgehpt4uf95p70c1u4fb1', '2013-04-03 15:26:51');
INSERT INTO `_log` VALUES ('497', 'blog', 'next', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:14.0) Gecko/20100101 Firefox/14.0.1', 'http://manti.by/blog/', 'dt65hqgehpt4uf95p70c1u4fb1', '2013-04-03 15:26:51');
INSERT INTO `_log` VALUES ('498', 'blog', 'next', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:14.0) Gecko/20100101 Firefox/14.0.1', 'http://manti.by/blog/', 'dt65hqgehpt4uf95p70c1u4fb1', '2013-04-03 15:27:14');
INSERT INTO `_log` VALUES ('499', 'blog', 'next', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:14.0) Gecko/20100101 Firefox/14.0.1', 'http://manti.by/blog/', 'dt65hqgehpt4uf95p70c1u4fb1', '2013-04-03 15:27:14');
INSERT INTO `_log` VALUES ('500', 'blog', 'next', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:14.0) Gecko/20100101 Firefox/14.0.1', 'http://manti.by/blog/', 'dt65hqgehpt4uf95p70c1u4fb1', '2013-04-03 15:27:14');
INSERT INTO `_log` VALUES ('501', 'blog', 'next', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:14.0) Gecko/20100101 Firefox/14.0.1', 'http://manti.by/blog/', 'dt65hqgehpt4uf95p70c1u4fb1', '2013-04-03 15:27:14');
INSERT INTO `_log` VALUES ('502', 'gallery', '', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:14.0) Gecko/20100101 Firefox/14.0.1', 'http://manti.by/blog/', 'dt65hqgehpt4uf95p70c1u4fb1', '2013-04-03 15:27:26');
INSERT INTO `_log` VALUES ('503', 'file', 'track', '', '289', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:14.0) Gecko/20100101 Firefox/14.0.1', 'http://manti.by/gallery/', 'dt65hqgehpt4uf95p70c1u4fb1', '2013-04-03 15:27:30');
INSERT INTO `_log` VALUES ('504', 'gallery', 'next', '', '289', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:14.0) Gecko/20100101 Firefox/14.0.1', 'http://manti.by/gallery/', 'dt65hqgehpt4uf95p70c1u4fb1', '2013-04-03 15:27:41');
INSERT INTO `_log` VALUES ('505', 'file', 'track', '', '277', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:14.0) Gecko/20100101 Firefox/14.0.1', 'http://manti.by/gallery/', 'dt65hqgehpt4uf95p70c1u4fb1', '2013-04-03 15:27:44');
INSERT INTO `_log` VALUES ('506', 'gallery', 'next', '', '277', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:14.0) Gecko/20100101 Firefox/14.0.1', 'http://manti.by/gallery/', 'dt65hqgehpt4uf95p70c1u4fb1', '2013-04-03 15:27:44');
INSERT INTO `_log` VALUES ('507', '', '', '', '', '86.57.158.234', 'Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 6.1; WOW64; Trident/6.0)', '', 'edhptvf6ohtmppv4vbcn7d9h45', '2013-04-03 15:28:06');
INSERT INTO `_log` VALUES ('508', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', '7cpcf0no54r55adv48shnmvn75', '2013-04-03 15:28:07');
INSERT INTO `_log` VALUES ('509', 'file', 'track', '', '276', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:14.0) Gecko/20100101 Firefox/14.0.1', 'http://manti.by/gallery/', 'dt65hqgehpt4uf95p70c1u4fb1', '2013-04-03 15:28:36');
INSERT INTO `_log` VALUES ('510', 'gallery', '', '', '', '86.57.158.234', 'Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 6.1; WOW64; Trident/6.0)', 'http://manti.by/', 'edhptvf6ohtmppv4vbcn7d9h45', '2013-04-03 15:29:26');
INSERT INTO `_log` VALUES ('511', 'file', 'track', '', '442', '86.57.158.234', 'Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 6.1; WOW64; Trident/6.0)', 'http://manti.by/gallery/#image-442', 'edhptvf6ohtmppv4vbcn7d9h45', '2013-04-03 15:29:27');
INSERT INTO `_log` VALUES ('512', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', 'nujov2ua12f7d8pfnoa7b1eum0', '2013-04-03 15:30:06');
INSERT INTO `_log` VALUES ('513', 'tag', 'search', '', '22', '66.249.74.158', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', 'bl7er7rvhbin5mr1uuickh7qo6', '2013-04-03 15:30:09');
INSERT INTO `_log` VALUES ('514', 'blog', '', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:14.0) Gecko/20100101 Firefox/14.0.1', 'http://manti.by/gallery/', 'dt65hqgehpt4uf95p70c1u4fb1', '2013-04-03 15:30:21');
INSERT INTO `_log` VALUES ('515', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', 'aidcqd66qjvo5t822kclt96lt2', '2013-04-03 15:30:38');
INSERT INTO `_log` VALUES ('516', 'blog', 'next', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:14.0) Gecko/20100101 Firefox/14.0.1', 'http://manti.by/blog/', 'dt65hqgehpt4uf95p70c1u4fb1', '2013-04-03 15:30:43');
INSERT INTO `_log` VALUES ('517', 'blog', 'next', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:14.0) Gecko/20100101 Firefox/14.0.1', 'http://manti.by/blog/', 'dt65hqgehpt4uf95p70c1u4fb1', '2013-04-03 15:30:43');
INSERT INTO `_log` VALUES ('518', 'blog', 'next', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:14.0) Gecko/20100101 Firefox/14.0.1', 'http://manti.by/blog/', 'dt65hqgehpt4uf95p70c1u4fb1', '2013-04-03 15:30:43');
INSERT INTO `_log` VALUES ('519', 'blog', 'next', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:14.0) Gecko/20100101 Firefox/14.0.1', 'http://manti.by/blog/', 'dt65hqgehpt4uf95p70c1u4fb1', '2013-04-03 15:30:43');
INSERT INTO `_log` VALUES ('520', 'blog', 'next', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:14.0) Gecko/20100101 Firefox/14.0.1', 'http://manti.by/blog/', 'dt65hqgehpt4uf95p70c1u4fb1', '2013-04-03 15:30:43');
INSERT INTO `_log` VALUES ('521', 'blog', 'next', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:14.0) Gecko/20100101 Firefox/14.0.1', 'http://manti.by/blog/', 'dt65hqgehpt4uf95p70c1u4fb1', '2013-04-03 15:30:43');
INSERT INTO `_log` VALUES ('522', 'blog', 'next', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:14.0) Gecko/20100101 Firefox/14.0.1', 'http://manti.by/blog/', 'dt65hqgehpt4uf95p70c1u4fb1', '2013-04-03 15:30:43');
INSERT INTO `_log` VALUES ('523', 'blog', 'next', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:14.0) Gecko/20100101 Firefox/14.0.1', 'http://manti.by/blog/', 'dt65hqgehpt4uf95p70c1u4fb1', '2013-04-03 15:30:43');
INSERT INTO `_log` VALUES ('524', 'blog', 'next', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:14.0) Gecko/20100101 Firefox/14.0.1', 'http://manti.by/blog/', 'dt65hqgehpt4uf95p70c1u4fb1', '2013-04-03 15:30:43');
INSERT INTO `_log` VALUES ('525', 'blog', 'next', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:14.0) Gecko/20100101 Firefox/14.0.1', 'http://manti.by/blog/', 'dt65hqgehpt4uf95p70c1u4fb1', '2013-04-03 15:30:43');
INSERT INTO `_log` VALUES ('526', 'tag', 'search', '', '36', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:14.0) Gecko/20100101 Firefox/14.0.1', 'http://manti.by/blog/', 'dt65hqgehpt4uf95p70c1u4fb1', '2013-04-03 15:31:01');
INSERT INTO `_log` VALUES ('527', '', '', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:14.0) Gecko/20100101 Firefox/14.0.1', 'http://manti.by/tag/dnb/', 'dt65hqgehpt4uf95p70c1u4fb1', '2013-04-03 15:31:19');
INSERT INTO `_log` VALUES ('528', 'gallery', 'next', '', '442', '86.57.158.234', 'Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 6.1; WOW64; Trident/6.0)', 'http://manti.by/gallery/#image-442', 'edhptvf6ohtmppv4vbcn7d9h45', '2013-04-03 15:31:25');
INSERT INTO `_log` VALUES ('529', 'file', 'track', '', '441', '86.57.158.234', 'Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 6.1; WOW64; Trident/6.0)', 'http://manti.by/gallery/#image-442', 'edhptvf6ohtmppv4vbcn7d9h45', '2013-04-03 15:31:40');
INSERT INTO `_log` VALUES ('530', '', '', '', '', '86.57.158.234', 'Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 6.1; WOW64; Trident/6.0)', 'http://manti.by/gallery/', 'edhptvf6ohtmppv4vbcn7d9h45', '2013-04-03 15:31:48');
INSERT INTO `_log` VALUES ('531', '', '', '', '', '86.57.158.234', 'Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 6.1; WOW64; Trident/6.0)', 'http://manti.by/gallery/', 'edhptvf6ohtmppv4vbcn7d9h45', '2013-04-03 15:32:28');
INSERT INTO `_log` VALUES ('532', 'blog', '', '', '', '86.57.158.234', 'Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 6.1; WOW64; Trident/6.0)', 'http://manti.by/', 'edhptvf6ohtmppv4vbcn7d9h45', '2013-04-03 15:32:40');
INSERT INTO `_log` VALUES ('533', 'blog', 'next', '', '', '86.57.158.234', 'Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 6.1; WOW64; Trident/6.0)', 'http://manti.by/blog/#hide-tracklist', 'edhptvf6ohtmppv4vbcn7d9h45', '2013-04-03 15:32:45');
INSERT INTO `_log` VALUES ('534', 'blog', 'next', '', '', '86.57.158.234', 'Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 6.1; WOW64; Trident/6.0)', 'http://manti.by/blog/#hide-tracklist', 'edhptvf6ohtmppv4vbcn7d9h45', '2013-04-03 15:32:45');
INSERT INTO `_log` VALUES ('535', '', '', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/534.57.2 (KHTML, like Gecko) Version/5.1.7 Safari/534.57.2', '', '0hh2lbphilvmquns2h77ukrcc5', '2013-04-03 15:33:09');
INSERT INTO `_log` VALUES ('536', 'gallery', '', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/534.57.2 (KHTML, like Gecko) Version/5.1.7 Safari/534.57.2', 'http://manti.by/', '0hh2lbphilvmquns2h77ukrcc5', '2013-04-03 15:34:28');
INSERT INTO `_log` VALUES ('537', 'file', 'track', '', '284', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/534.57.2 (KHTML, like Gecko) Version/5.1.7 Safari/534.57.2', 'http://manti.by/gallery/', '0hh2lbphilvmquns2h77ukrcc5', '2013-04-03 15:34:34');
INSERT INTO `_log` VALUES ('538', 'blog', '', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-03 15:34:44');
INSERT INTO `_log` VALUES ('539', 'blog', 'next', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/blog/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-03 15:34:48');
INSERT INTO `_log` VALUES ('540', 'blog', 'next', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/blog/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-03 15:34:48');
INSERT INTO `_log` VALUES ('541', '', '', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', '', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-03 15:41:26');
INSERT INTO `_log` VALUES ('542', 'blog', '', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/534.57.2 (KHTML, like Gecko) Version/5.1.7 Safari/534.57.2', 'http://manti.by/gallery/', '0hh2lbphilvmquns2h77ukrcc5', '2013-04-03 15:42:26');
INSERT INTO `_log` VALUES ('543', 'blog', 'next', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/534.57.2 (KHTML, like Gecko) Version/5.1.7 Safari/534.57.2', 'http://manti.by/blog/', '0hh2lbphilvmquns2h77ukrcc5', '2013-04-03 15:42:29');
INSERT INTO `_log` VALUES ('544', 'blog', 'next', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/534.57.2 (KHTML, like Gecko) Version/5.1.7 Safari/534.57.2', 'http://manti.by/blog/', '0hh2lbphilvmquns2h77ukrcc5', '2013-04-03 15:42:29');
INSERT INTO `_log` VALUES ('545', 'blog', 'next', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/534.57.2 (KHTML, like Gecko) Version/5.1.7 Safari/534.57.2', 'http://manti.by/blog/', '0hh2lbphilvmquns2h77ukrcc5', '2013-04-03 15:42:29');
INSERT INTO `_log` VALUES ('546', '', '', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', '', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-03 15:42:37');
INSERT INTO `_log` VALUES ('547', '', '', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', '', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-03 15:42:39');
INSERT INTO `_log` VALUES ('548', 'blog', '', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-03 15:44:18');
INSERT INTO `_log` VALUES ('549', 'blog', 'next', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/blog/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-03 15:44:19');
INSERT INTO `_log` VALUES ('550', 'blog', 'next', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/blog/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-03 15:44:19');
INSERT INTO `_log` VALUES ('551', 'blog', 'next', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/blog/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-03 15:44:20');
INSERT INTO `_log` VALUES ('552', 'blog', '', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-03 15:44:26');
INSERT INTO `_log` VALUES ('553', 'blog', 'next', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/blog/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-03 15:44:26');
INSERT INTO `_log` VALUES ('554', 'blog', '', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-03 15:44:30');
INSERT INTO `_log` VALUES ('555', 'blog', '', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-03 15:44:53');
INSERT INTO `_log` VALUES ('556', 'blog', 'next', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/blog/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-03 15:44:56');
INSERT INTO `_log` VALUES ('557', 'blog', 'next', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/blog/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-03 15:44:56');
INSERT INTO `_log` VALUES ('558', 'blog', 'next', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/blog/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-03 15:45:03');
INSERT INTO `_log` VALUES ('559', 'blog', 'next', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/blog/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-03 15:45:03');
INSERT INTO `_log` VALUES ('560', 'blog', 'next', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/blog/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-03 15:45:03');
INSERT INTO `_log` VALUES ('561', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', 'ceftga3du3vgak14l74v77tee2', '2013-04-03 15:47:09');
INSERT INTO `_log` VALUES ('562', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', '8q75qqkepeed1nddab5huep470', '2013-04-03 15:48:52');
INSERT INTO `_log` VALUES ('563', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', '3msulmc0evvd53nv7jopv48qn2', '2013-04-03 15:49:24');
INSERT INTO `_log` VALUES ('564', 'tag', 'search', '', '38', '66.249.75.234', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', 'ksbr7d79g7mnkhmj0actv9uh66', '2013-04-03 16:00:07');
INSERT INTO `_log` VALUES ('565', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', 'ccboti55973sbrdohe2as0bgv2', '2013-04-03 16:06:18');
INSERT INTO `_log` VALUES ('566', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', 'jtsv0gf68gkfcrafe54kntt207', '2013-04-03 16:08:19');
INSERT INTO `_log` VALUES ('567', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', '2q42o0bp2fe7pgcvjub9h245s5', '2013-04-03 16:08:31');
INSERT INTO `_log` VALUES ('568', '', '', '', '', '213.180.206.205', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots DEV)', '', 'be5d4msp7qvaq97povgdedoh85', '2013-04-03 16:20:11');
INSERT INTO `_log` VALUES ('569', 'tag', 'search', '', '8', '66.249.75.234', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', 'apirlg8dajroeqebf6lgeh5nq2', '2013-04-03 16:24:29');
INSERT INTO `_log` VALUES ('570', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', 'br6158rutdkt7070071gmjsqn7', '2013-04-03 16:25:15');
INSERT INTO `_log` VALUES ('571', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', '8u5kt34f07rvdf6bgnthrismf1', '2013-04-03 16:27:13');
INSERT INTO `_log` VALUES ('572', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', 'vtsilbj1rqvtihsfkf4cli97g4', '2013-04-03 16:28:24');
INSERT INTO `_log` VALUES ('573', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots)', '', 'oa962aq9pu7nqpenskvl3k9g51', '2013-04-03 16:30:12');
INSERT INTO `_log` VALUES ('574', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', 'k480v3e074h4qhh4h5u29fqba0', '2013-04-03 16:44:34');
INSERT INTO `_log` VALUES ('575', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', '3h40co73jdloojrkg312pu5r65', '2013-04-03 16:45:58');
INSERT INTO `_log` VALUES ('576', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', 'ub9puupt6e2hur9iihdrhqi902', '2013-04-03 16:47:48');
INSERT INTO `_log` VALUES ('577', 'gallery', 'show', '', '5', '66.249.75.234', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', '1hkfodfrcbqsad9koiqtq2vaq1', '2013-04-03 16:53:17');
INSERT INTO `_log` VALUES ('578', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', 'hba73b95n1297tismln5gra8t0', '2013-04-03 17:03:17');
INSERT INTO `_log` VALUES ('579', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', 'udetvfcfr90566argttlc71p55', '2013-04-03 17:04:48');
INSERT INTO `_log` VALUES ('580', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', 'p4gmsp2kdns0butm0nr36b4k56', '2013-04-03 17:07:01');
INSERT INTO `_log` VALUES ('581', '', '', '', '', '213.180.206.205', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots DEV)', '', 'jd8srrplpokaidlhfc8jfgkb92', '2013-04-03 17:17:03');
INSERT INTO `_log` VALUES ('582', 'tag', 'search', '', '80', '66.249.75.234', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', 'reje31931hk0u17n7hcm32lmd7', '2013-04-03 17:22:05');
INSERT INTO `_log` VALUES ('583', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', '821mi0vbjj1ilenhn0chlacoi5', '2013-04-03 17:22:34');
INSERT INTO `_log` VALUES ('584', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', 'eeech2i1pc9ddmlqdb17oid684', '2013-04-03 17:24:07');
INSERT INTO `_log` VALUES ('585', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', '7c6sc6aflie1r6qmaisk6f9p72', '2013-04-03 17:26:02');
INSERT INTO `_log` VALUES ('586', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', 'i49bikif9v74jjoum75l4erq93', '2013-04-03 17:42:24');
INSERT INTO `_log` VALUES ('587', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', '2dibcabv6tm40rka01ga6vvrm4', '2013-04-03 17:43:19');
INSERT INTO `_log` VALUES ('588', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', '5kl7cd2lliesjdh7ql89gn1nm4', '2013-04-03 17:45:31');
INSERT INTO `_log` VALUES ('589', 'tag', 'search', '', '14', '66.249.75.234', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', 'o7fd7pitg2ksoltm1h70qpr4l4', '2013-04-03 17:50:53');
INSERT INTO `_log` VALUES ('590', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', 'ahc48phh1rjopl8idq67fiua65', '2013-04-03 18:01:16');
INSERT INTO `_log` VALUES ('591', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', 'pctfdijo3svoduagf8ks0bet36', '2013-04-03 18:02:48');
INSERT INTO `_log` VALUES ('592', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', 'k5aamvo3ikp824dh20nfee8k84', '2013-04-03 18:04:37');
INSERT INTO `_log` VALUES ('593', '', '', '', '', '213.180.206.205', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots DEV)', '', 'b2cs99ghs3oaia0mbp1mrn8910', '2013-04-03 18:14:19');
INSERT INTO `_log` VALUES ('594', 'tag', 'search', '', '19', '66.249.75.234', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', '502amavve83jpaa9u2nrvqpru5', '2013-04-03 18:20:53');
INSERT INTO `_log` VALUES ('595', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', 'i92nce1sn9b5bquvo7tm3f0a02', '2013-04-03 18:21:14');
INSERT INTO `_log` VALUES ('596', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', '8gcb10k6cieekpac7ee5s21eu7', '2013-04-03 18:21:16');
INSERT INTO `_log` VALUES ('597', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', 'anmolore310iofql80ognd99d0', '2013-04-03 18:23:22');
INSERT INTO `_log` VALUES ('598', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', '3qsbb9917au0179h81td5ugkp1', '2013-04-03 18:39:49');
INSERT INTO `_log` VALUES ('599', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', '19llg9c74dk1cmtprv230j3hh2', '2013-04-03 18:40:09');
INSERT INTO `_log` VALUES ('600', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', '41ubil7jmvjd9ukp3dp6rv0eq2', '2013-04-03 18:42:10');
INSERT INTO `_log` VALUES ('601', 'blog', 'show', '', '35', '66.249.75.234', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', 'io3hv5uvaqlm1vukcjl2a6vu74', '2013-04-03 18:51:44');
INSERT INTO `_log` VALUES ('602', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', '0jgaagj9ht5k64nv3pru2u97r4', '2013-04-03 18:58:42');
INSERT INTO `_log` VALUES ('603', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', '73mornfdv8ajs8u2880m0csik4', '2013-04-03 18:59:34');
INSERT INTO `_log` VALUES ('604', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', 'q5up8na7cc8hdgcu69l2tdmv10', '2013-04-03 19:02:05');
INSERT INTO `_log` VALUES ('605', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots)', '', 'bq1o09u5pgksibm1bq3rkh57n2', '2013-04-03 19:02:19');
INSERT INTO `_log` VALUES ('606', '', '', '', '', '213.180.206.205', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots DEV)', '', 'mvvbmk26sllfnpc778pmk8gjq0', '2013-04-03 19:10:36');
INSERT INTO `_log` VALUES ('607', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', 'm83eoudth3nol65t1q6tke9rl2', '2013-04-03 19:17:47');
INSERT INTO `_log` VALUES ('608', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', '6a6vt43h09cp9uq4cdc9gfmma4', '2013-04-03 19:18:51');
INSERT INTO `_log` VALUES ('609', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', 'lmhs555if3c4c2f6bnech5a1t4', '2013-04-03 19:21:20');
INSERT INTO `_log` VALUES ('610', 'tag', 'search', '', '23', '66.249.75.234', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', '55qam6pa4dk3h17kruin9tev62', '2013-04-03 19:21:50');
INSERT INTO `_log` VALUES ('611', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', 'ks3rbr9oq4ggjr04ar6q2iabv7', '2013-04-03 19:36:32');
INSERT INTO `_log` VALUES ('612', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', 'pdlbgof7q2v9jnk16g7hmv47v5', '2013-04-03 19:38:29');
INSERT INTO `_log` VALUES ('613', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', '788l16id3foutnh3sknbu9mqh0', '2013-04-03 19:40:40');
INSERT INTO `_log` VALUES ('614', 'tag', 'search', '', '76', '66.249.75.234', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', 'evbumb86r0qqqsjqt43resrtv3', '2013-04-03 19:51:36');
INSERT INTO `_log` VALUES ('615', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', '4cccec06i93dngom202dsevdb1', '2013-04-03 19:55:08');
INSERT INTO `_log` VALUES ('616', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', 'u28r5gtmu58j982pnel0mkm9k1', '2013-04-03 19:57:15');
INSERT INTO `_log` VALUES ('617', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', 'ermrlt39fun3t92ufe9g9cniq0', '2013-04-03 19:59:27');
INSERT INTO `_log` VALUES ('618', '', '', '', '', '213.180.206.205', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots DEV)', '', 'fk7s02sj507n6lfd80f3le2h42', '2013-04-03 20:06:46');
INSERT INTO `_log` VALUES ('619', 'tag', 'search', '', '15', '66.249.75.234', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', 'uo907io2beq1utknidk404d0j5', '2013-04-03 20:14:53');
INSERT INTO `_log` VALUES ('620', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', 'itsij2btmvqk78jiftstue6g31', '2013-04-03 20:14:58');
INSERT INTO `_log` VALUES ('621', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', 'ug53c5ugi5oeqdoj3sdtkpg1q3', '2013-04-03 20:16:51');
INSERT INTO `_log` VALUES ('622', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', '24o1r088eek6ioe16iapg4p5d5', '2013-04-03 20:18:51');
INSERT INTO `_log` VALUES ('623', 'tag', 'search', '', '44', '77.88.31.246', 'Mozilla/5.0 (compatible; YandexBot/3.0; +http://yandex.com/bots)', '', 'dse6db6g6od0o5cgce3lgv73j1', '2013-04-03 20:30:43');
INSERT INTO `_log` VALUES ('624', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', 'm86nanui25kmha6dfclm3rqs60', '2013-04-03 20:33:57');
INSERT INTO `_log` VALUES ('625', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', '61vh4c46495g2m9rklhhesd553', '2013-04-03 20:35:41');
INSERT INTO `_log` VALUES ('626', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', 'cghuia5a5r2n8du8gegu1bvag5', '2013-04-03 20:37:19');
INSERT INTO `_log` VALUES ('627', '', '', '', '', '77.88.31.246', 'Mozilla/5.0 (compatible; YandexBot/3.0; +http://yandex.com/bots)', '', 'e37egvbjhc095o63hqmbq27md7', '2013-04-03 20:40:11');
INSERT INTO `_log` VALUES ('628', 'blog', 'show', '', '19', '77.88.31.246', 'Mozilla/5.0 (compatible; YandexBot/3.0; +http://yandex.com/bots)', '', 'p83fp84g3kh3e5or6tc16uvf73', '2013-04-03 20:40:13');
INSERT INTO `_log` VALUES ('629', 'blog', 'show', '', '8', '77.88.31.246', 'Mozilla/5.0 (compatible; YandexBot/3.0; +http://yandex.com/bots)', '', '1hcmacusbsdojt23l7kiva0cr7', '2013-04-03 20:40:15');
INSERT INTO `_log` VALUES ('630', 'tag', 'search', '', '50', '77.88.31.246', 'Mozilla/5.0 (compatible; YandexBot/3.0; +http://yandex.com/bots)', '', '36pigu16ia54pdtr7fcgu75gf0', '2013-04-03 20:40:18');
INSERT INTO `_log` VALUES ('631', 'tag', 'search', '', '47', '77.88.31.246', 'Mozilla/5.0 (compatible; YandexBot/3.0; +http://yandex.com/bots)', '', 'oh9gu26tk2re8d1tr3cb5uou56', '2013-04-03 20:40:20');
INSERT INTO `_log` VALUES ('632', 'tag', 'search', '', '23', '77.88.31.246', 'Mozilla/5.0 (compatible; YandexBot/3.0; +http://yandex.com/bots)', '', 'gr6073gmd56cmqmgooc5iu84c0', '2013-04-03 20:40:22');
INSERT INTO `_log` VALUES ('633', 'tag', 'search', '', '37', '66.249.75.234', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', 'ug6lm7le60t1p8qfu25ui2n7l5', '2013-04-03 20:43:43');
INSERT INTO `_log` VALUES ('634', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', 'pkeiaoc2hpbs0j1ebolts6egr4', '2013-04-03 20:52:24');
INSERT INTO `_log` VALUES ('635', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', '8hi4kri1lvo1j0ojjtnk6p6uk4', '2013-04-03 20:55:03');
INSERT INTO `_log` VALUES ('636', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', 'cu3eaj97e3afq4vgcifjbqh9r7', '2013-04-03 20:56:45');
INSERT INTO `_log` VALUES ('637', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots)', '', 'lcp5n851p3foovbp4uurd41pq5', '2013-04-03 21:00:17');
INSERT INTO `_log` VALUES ('638', '', '', '', '', '213.180.206.205', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots DEV)', '', 'vc2i30q6ub43hf0hokcl0if5r6', '2013-04-03 21:02:07');
INSERT INTO `_log` VALUES ('639', 'tag', 'search', '', '48', '77.88.31.246', 'Mozilla/5.0 (compatible; YandexBot/3.0; +http://yandex.com/bots)', '', 'lu0933sufqgsr91fe3iq7gkln3', '2013-04-03 21:03:01');
INSERT INTO `_log` VALUES ('640', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', 'cfbafqfoel1rhvqo8gl65jp4l2', '2013-04-03 21:11:18');
INSERT INTO `_log` VALUES ('641', 'tag', 'search', '', '83', '66.249.75.234', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', '3poja4g6etlglrul11lo5btqp4', '2013-04-03 21:12:29');
INSERT INTO `_log` VALUES ('642', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', 'ks8sk90q616la2ijft2jbi6fq0', '2013-04-03 21:14:04');
INSERT INTO `_log` VALUES ('643', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', 'lt0h2l1adgu5kbnnqlugns4h31', '2013-04-03 21:15:40');
INSERT INTO `_log` VALUES ('644', 'blog', 'show', '', '12', '77.88.31.246', 'Mozilla/5.0 (compatible; YandexBot/3.0; +http://yandex.com/bots)', '', '0aen9fohe3oo2mej2tsfspppo6', '2013-04-03 21:25:40');
INSERT INTO `_log` VALUES ('645', '', '', '', '', '178.175.42.92', 'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.1; WOW64; Trident/5.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; .NET4.0C; .NET4.0E)', 'http://www.baidu.com/', '2na7ija05rfo8lc10k1jfpmr30', '2013-04-03 21:29:41');
INSERT INTO `_log` VALUES ('646', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', 'jk8jeru20cvb1kc6bu1vcm7s67', '2013-04-03 21:30:32');
INSERT INTO `_log` VALUES ('647', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', 'o3k0fdjq2dhphji8il8brc5ic1', '2013-04-03 21:33:12');
INSERT INTO `_log` VALUES ('648', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', '2if0ffonnilu4tab6aj4qod857', '2013-04-03 21:35:25');
INSERT INTO `_log` VALUES ('649', 'tag', 'search', '', '90', '66.249.75.234', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', 'm64mc2emhoihjirv0mjocim150', '2013-04-03 21:41:17');
INSERT INTO `_log` VALUES ('650', 'gallery', 'show', '', '1', '77.88.31.246', 'Mozilla/5.0 (compatible; YandexBot/3.0; +http://yandex.com/bots)', '', 'g2ljihmms4d3a31okaaesqc777', '2013-04-03 21:48:20');
INSERT INTO `_log` VALUES ('651', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', 'b2gcfntklrn9galr0e74q6sao5', '2013-04-03 21:48:54');
INSERT INTO `_log` VALUES ('652', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', '52ih43pgo044o6sdoqf89mfs35', '2013-04-03 21:51:48');
INSERT INTO `_log` VALUES ('653', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', 'konm8jgolq3jvh9u030420i6v2', '2013-04-03 21:54:20');
INSERT INTO `_log` VALUES ('654', '', '', '', '', '213.180.206.205', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots DEV)', '', 'sgc49kstvk1i00jfqvi2a6abo0', '2013-04-03 21:59:00');
INSERT INTO `_log` VALUES ('655', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', 'v9fdt04us3g2ccn4n0se5k5jn7', '2013-04-03 22:07:48');
INSERT INTO `_log` VALUES ('656', 'blog', 'show', '', '34', '66.249.75.234', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', 'tnuko41r7e6rmcu0ef0go071n5', '2013-04-03 22:10:05');
INSERT INTO `_log` VALUES ('657', 'blog', 'show', '', '6', '77.88.31.246', 'Mozilla/5.0 (compatible; YandexBot/3.0; +http://yandex.com/bots)', '', 'kifnv9r8dd27vd32otu2oc9ke5', '2013-04-03 22:10:59');
INSERT INTO `_log` VALUES ('658', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', 'ah0sprouoct3nt6pe9nrbp4e74', '2013-04-03 22:11:37');
INSERT INTO `_log` VALUES ('659', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', 'kl308j6a47058vj3hv50np8sh4', '2013-04-03 22:13:36');
INSERT INTO `_log` VALUES ('660', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', '1fthilikjbqvh8ov3bmln9spr5', '2013-04-03 22:26:52');
INSERT INTO `_log` VALUES ('661', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', 'dtp0gqt5fm8en0qbqod5a50vb0', '2013-04-03 22:30:45');
INSERT INTO `_log` VALUES ('662', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', 'l6p2hrqaad6igr0hu2uf3h84e2', '2013-04-03 22:32:19');
INSERT INTO `_log` VALUES ('663', 'tag', 'search', '', '12', '77.88.31.246', 'Mozilla/5.0 (compatible; YandexBot/3.0; +http://yandex.com/bots)', '', 'a3pb3fikndofoan3f6frq44396', '2013-04-03 22:33:39');
INSERT INTO `_log` VALUES ('664', 'blog', 'show', '', '8', '66.249.75.234', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', '6n9padoldc0s99k0vm133es5s0', '2013-04-03 22:40:56');
INSERT INTO `_log` VALUES ('665', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', 'h0gmkqb5i5doc3mibe8gum21e2', '2013-04-03 22:46:20');
INSERT INTO `_log` VALUES ('666', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', 'kf2f10sfb7svn7r3741pl98eb4', '2013-04-03 22:48:56');
INSERT INTO `_log` VALUES ('667', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', '4lsjo635fvudeneq134cobbpn2', '2013-04-03 22:52:03');
INSERT INTO `_log` VALUES ('668', '', '', '', '', '213.180.206.205', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots DEV)', '', 'pijdav59i9kt6lver57p1eco80', '2013-04-03 22:54:36');
INSERT INTO `_log` VALUES ('669', 'tag', 'search', '', '13', '77.88.31.246', 'Mozilla/5.0 (compatible; YandexBot/3.0; +http://yandex.com/bots)', '', 'h0g8i8gcciei55dj0vu0geaqn1', '2013-04-03 22:56:18');
INSERT INTO `_log` VALUES ('670', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', 'i5snopvpv0n3jnhetsi8e0piq0', '2013-04-03 23:06:13');
INSERT INTO `_log` VALUES ('671', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots)', '', 'p79mg6dtu2lcnkpafe5nuee517', '2013-04-03 23:06:38');
INSERT INTO `_log` VALUES ('672', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', '0070p6oh0pgn5f0gf95s3u6su2', '2013-04-03 23:07:22');
INSERT INTO `_log` VALUES ('673', 'tag', 'search', '', '17', '66.249.75.234', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', 'bqo8qclctdn0s93cve4vgko311', '2013-04-03 23:10:02');
INSERT INTO `_log` VALUES ('674', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', '8620dfq3ntcr7fdu8nahagoo04', '2013-04-03 23:11:07');
INSERT INTO `_log` VALUES ('675', 'tag', 'search', '', '11', '77.88.31.246', 'Mozilla/5.0 (compatible; YandexBot/3.0; +http://yandex.com/bots)', '', 'gvko18o73g7pac3avdvgsb3541', '2013-04-03 23:19:56');
INSERT INTO `_log` VALUES ('676', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', 'hd30fufna3ke6sn1b82j1qm8h5', '2013-04-03 23:25:58');
INSERT INTO `_log` VALUES ('677', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', '9u3kdq5lcu9f4bf3ihuqle17c4', '2013-04-03 23:26:09');
INSERT INTO `_log` VALUES ('678', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', '8547k5fqqt7kejiibdik4all05', '2013-04-03 23:30:36');
INSERT INTO `_log` VALUES ('679', 'blog', 'show', '', '36', '66.249.75.234', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', 'hunr2qk4brndpvn2amdn9gm9l2', '2013-04-03 23:40:22');
INSERT INTO `_log` VALUES ('680', 'tag', 'search', '', '33', '77.88.31.246', 'Mozilla/5.0 (compatible; YandexBot/3.0; +http://yandex.com/bots)', '', 'k8p3drh1eo23dlktm2d4k8rfv4', '2013-04-03 23:43:35');
INSERT INTO `_log` VALUES ('681', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', 'ij9h43ft3sbmltphjvel7rb4k0', '2013-04-03 23:44:35');
INSERT INTO `_log` VALUES ('682', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', '8mo1d91eeorii596sagccg3t94', '2013-04-03 23:45:19');
INSERT INTO `_log` VALUES ('683', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', '4sskg8abqtqum7rtjj3tvlqv41', '2013-04-03 23:49:37');
INSERT INTO `_log` VALUES ('684', '', '', '', '', '213.180.206.205', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots DEV)', '', '2798sspgsgps7jk9tap19bdf06', '2013-04-03 23:50:51');
INSERT INTO `_log` VALUES ('685', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', 'f07gueuviu1na6n1eid1951t42', '2013-04-04 00:03:01');
INSERT INTO `_log` VALUES ('686', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', '7bnam1ogvg7k99duqinkqb9460', '2013-04-04 00:04:07');
INSERT INTO `_log` VALUES ('687', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', '6tjcei03i6d1grfnhm4a7et2s2', '2013-04-04 00:08:54');
INSERT INTO `_log` VALUES ('688', 'tag', 'search', '', '16', '66.249.75.234', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', 'qm00pmt0k7jh04in5t3qcve0k0', '2013-04-04 00:10:20');
INSERT INTO `_log` VALUES ('689', 'tag', 'search', '', '40', '77.88.31.246', 'Mozilla/5.0 (compatible; YandexBot/3.0; +http://yandex.com/bots)', '', '9vllg3icmdn17mreuh6i9skdh5', '2013-04-04 00:14:47');
INSERT INTO `_log` VALUES ('690', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', '63fmpn6b56k4ufcpnagfv3rj97', '2013-04-04 00:21:25');
INSERT INTO `_log` VALUES ('691', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', 'p26h70aq94kgr1ff1rc2o639f7', '2013-04-04 00:23:00');
INSERT INTO `_log` VALUES ('692', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', 'ti0aje03u4rkbamscfa71lt2a6', '2013-04-04 00:28:19');
INSERT INTO `_log` VALUES ('693', 'tag', 'search', '', '82', '66.249.75.234', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', 'ok2v82bd87p8o6s2ticl5o6u62', '2013-04-04 00:34:05');
INSERT INTO `_log` VALUES ('694', 'tag', 'search', '', '39', '77.88.31.246', 'Mozilla/5.0 (compatible; YandexBot/3.0; +http://yandex.com/bots)', '', 'u3iuuaa9hoeuj1e057t8u29t87', '2013-04-04 00:38:02');
INSERT INTO `_log` VALUES ('695', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', 'sp4lpskb7oaiiksihq8lbi7n90', '2013-04-04 00:39:57');
INSERT INTO `_log` VALUES ('696', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', 'mqkh9pakd1f3r0a5q6kt60thd3', '2013-04-04 00:41:29');
INSERT INTO `_log` VALUES ('697', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', '4krr70dcd0oapg1dr2v0ag7mm4', '2013-04-04 00:47:12');
INSERT INTO `_log` VALUES ('698', '', '', '', '', '213.180.206.205', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots DEV)', '', '5ko0g6mp4v1mhrtnn990ihfu11', '2013-04-04 00:47:47');
INSERT INTO `_log` VALUES ('699', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', 'o5na6ivt6kj13p1g2hba1ptln3', '2013-04-04 00:58:49');
INSERT INTO `_log` VALUES ('700', 'tag', 'search', '', '42', '77.88.31.246', 'Mozilla/5.0 (compatible; YandexBot/3.0; +http://yandex.com/bots)', '', '41m02kucg32pse21t3i54gtrb5', '2013-04-04 01:01:18');
INSERT INTO `_log` VALUES ('701', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', 'dj0q7l25u4ir28ea9apf038430', '2013-04-04 01:01:30');
INSERT INTO `_log` VALUES ('702', 'tag', 'search', '', '47', '66.249.75.234', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', '8n0p3rjc54rp3h31v4u2bhgrb2', '2013-04-04 01:02:54');
INSERT INTO `_log` VALUES ('703', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', 'duahtd4rj8nl11vgt3lnflntn4', '2013-04-04 01:06:22');
INSERT INTO `_log` VALUES ('704', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', 'h0603an62qm0vc6cfvs98piff7', '2013-04-04 01:17:43');
INSERT INTO `_log` VALUES ('705', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', 'us4ut1rmviak7sibpe8tu224t5', '2013-04-04 01:20:09');
INSERT INTO `_log` VALUES ('706', 'tag', 'search', '', '9', '77.88.31.246', 'Mozilla/5.0 (compatible; YandexBot/3.0; +http://yandex.com/bots)', '', 'hk9rjd2kr9elj9uqlt1irbhje0', '2013-04-04 01:24:35');
INSERT INTO `_log` VALUES ('707', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', '88sholkpsah8n3kn87a0h8clp2', '2013-04-04 01:25:19');
INSERT INTO `_log` VALUES ('708', 'tag', 'search', '', '74', '66.249.75.234', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', '1ts66cm3md8d658lbkqahrctg2', '2013-04-04 01:34:23');
INSERT INTO `_log` VALUES ('709', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', 'errcqujh4h3fjlh7t074um9vr5', '2013-04-04 01:37:26');
INSERT INTO `_log` VALUES ('710', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', 'np861ueasdbvifijngbsna1bo4', '2013-04-04 01:39:15');
INSERT INTO `_log` VALUES ('711', '', '', '', '', '213.180.206.205', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots DEV)', '', 'rbag240e5locrgeksfrrdvekj1', '2013-04-04 01:44:10');
INSERT INTO `_log` VALUES ('712', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', 'b1hnsm6sbl9mv1nflna766oh60', '2013-04-04 01:44:48');
INSERT INTO `_log` VALUES ('713', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots)', '', 'hrfgno1ubjna07rrep6btkf471', '2013-04-04 01:52:19');
INSERT INTO `_log` VALUES ('714', 'tag', 'search', '', '46', '66.249.75.234', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', 'smc7tfc1rl2st4231kte70os84', '2013-04-04 01:54:41');
INSERT INTO `_log` VALUES ('715', 'tag', 'search', '', '79', '66.249.75.234', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', 'lb4pjocp429r24an8834jggtp6', '2013-04-04 01:54:42');
INSERT INTO `_log` VALUES ('716', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', 'od7br00q02k05pt1b5v38vrmq4', '2013-04-04 01:55:42');
INSERT INTO `_log` VALUES ('717', 'gallery', 'show', '', '2', '66.249.75.234', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', 'fk77vggor2gem12nv1i8gufb61', '2013-04-04 01:57:39');
INSERT INTO `_log` VALUES ('718', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', '7k428mqk6o57653ns7vf7kj7b2', '2013-04-04 01:58:35');
INSERT INTO `_log` VALUES ('719', 'blog', 'show', '', '33', '66.249.75.234', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', 'pakj9gldimhiiic33oe73qecm4', '2013-04-04 02:00:14');
INSERT INTO `_log` VALUES ('720', 'blog', 'show', '', '22', '66.249.75.234', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', 'p444jnmv5tsr6c2fkdq1eoe1f7', '2013-04-04 02:03:21');
INSERT INTO `_log` VALUES ('721', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', 'iuqtnbs5t4l98i23hb60cs4m52', '2013-04-04 02:03:35');
INSERT INTO `_log` VALUES ('722', 'blog', 'show', '', '13', '77.88.31.246', 'Mozilla/5.0 (compatible; YandexBot/3.0; +http://yandex.com/bots)', '', 'shveub55tekrmoa44km11rngh0', '2013-04-04 02:07:13');
INSERT INTO `_log` VALUES ('723', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', 'irq4iuhr7drrjjl4bhal9s2n96', '2013-04-04 02:14:38');
INSERT INTO `_log` VALUES ('724', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', '19otb899at05gvj10ub0gpsoo2', '2013-04-04 02:17:57');
INSERT INTO `_log` VALUES ('725', 'gallery', 'show', '', '3', '66.249.75.234', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', 'ugk46ua83qtbda99msvf88o746', '2013-04-04 02:20:39');
INSERT INTO `_log` VALUES ('726', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', 'e4kn6mjn6jd7cif8oqka0aov94', '2013-04-04 02:23:00');
INSERT INTO `_log` VALUES ('727', 'blog', 'show', '', '10', '77.88.31.246', 'Mozilla/5.0 (compatible; YandexBot/3.0; +http://yandex.com/bots)', '', 'nkdoo49ecuo11grr3hlt8u7ro3', '2013-04-04 02:27:12');
INSERT INTO `_log` VALUES ('728', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', 'apru2c4rfkm2fm1tgaih9bbui2', '2013-04-04 02:34:05');
INSERT INTO `_log` VALUES ('729', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', 'h32t3b93mqqhlfqq29bigjslv2', '2013-04-04 02:37:33');
INSERT INTO `_log` VALUES ('730', '', '', '', '', '213.180.206.205', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots DEV)', '', 'ogh2t5na8g3ngv1edn25ftc933', '2013-04-04 02:40:36');
INSERT INTO `_log` VALUES ('731', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', 'vea2upm4vmn2tmcnkt1hil7280', '2013-04-04 02:41:38');
INSERT INTO `_log` VALUES ('732', 'tag', 'search', '', '35', '77.88.31.246', 'Mozilla/5.0 (compatible; YandexBot/3.0; +http://yandex.com/bots)', '', '6q88i2qvpld7ar2jqr85e3e1l6', '2013-04-04 02:49:24');
INSERT INTO `_log` VALUES ('733', 'gallery', 'show', '', '4', '66.249.75.234', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', 'tq803in3or1fulopi5ancuv9f3', '2013-04-04 02:49:27');
INSERT INTO `_log` VALUES ('734', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', 'oepfpn0c883s0q9ngsjdu6n0l0', '2013-04-04 02:52:32');
INSERT INTO `_log` VALUES ('735', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', 'sdppsmu71jjv94j5revef5uel7', '2013-04-04 02:56:21');
INSERT INTO `_log` VALUES ('736', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', 'budkbpe8ejaqc81noqdmfg23r5', '2013-04-04 03:00:20');
INSERT INTO `_log` VALUES ('737', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', 'nievt6bmtfpiahl8t5o9mtl5s0', '2013-04-04 03:11:27');
INSERT INTO `_log` VALUES ('738', 'blog', 'show', '', '11', '77.88.31.246', 'Mozilla/5.0 (compatible; YandexBot/3.0; +http://yandex.com/bots)', '', 'ok0k4rc03arc40mvpppl72hbg2', '2013-04-04 03:11:35');
INSERT INTO `_log` VALUES ('739', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', '61h5kqkfsg5r367v2rfoknqvt0', '2013-04-04 03:15:30');
INSERT INTO `_log` VALUES ('740', 'gallery', 'show', '', '1', '66.249.75.234', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', 'rlr960f0dfkn94d6bmla5hjtu7', '2013-04-04 03:18:14');
INSERT INTO `_log` VALUES ('741', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', 'ikps7oom2ufisco452tls5pbh2', '2013-04-04 03:18:49');
INSERT INTO `_log` VALUES ('742', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', 'k6uof0d7n14vhr4ia4ocpgpd54', '2013-04-04 03:31:04');
INSERT INTO `_log` VALUES ('743', 'tag', 'search', '', '10', '77.88.31.246', 'Mozilla/5.0 (compatible; YandexBot/3.0; +http://yandex.com/bots)', '', 'lb7o2r9arq8sv2smph70aabvk5', '2013-04-04 03:33:47');
INSERT INTO `_log` VALUES ('744', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', 'fv0c4nncefr6imd8u5a3o6vfd7', '2013-04-04 03:34:48');
INSERT INTO `_log` VALUES ('745', '', '', '', '', '213.180.206.205', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots DEV)', '', 'ctjk2mdrm5qt0f53e6u4mtt222', '2013-04-04 03:37:04');
INSERT INTO `_log` VALUES ('746', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', 'l0k7qb6riddt2cm4ar6f0u6nv0', '2013-04-04 03:37:43');
INSERT INTO `_log` VALUES ('747', 'tag', 'search', '', '92', '66.249.75.234', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', 'dltl7m0r0f8ap1uaq9tijno0t4', '2013-04-04 03:48:08');
INSERT INTO `_log` VALUES ('748', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', '71rk3f4o0c1fcq0h7h56o2kgd2', '2013-04-04 03:50:05');
INSERT INTO `_log` VALUES ('749', 'tag', 'search', '', '32', '77.88.31.246', 'Mozilla/5.0 (compatible; YandexBot/3.0; +http://yandex.com/bots)', '', '67an81951fk7gr3uah7uug7rb0', '2013-04-04 03:53:15');
INSERT INTO `_log` VALUES ('750', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', 'q7tehd5td0sr3fquh2eg82stg5', '2013-04-04 03:53:56');
INSERT INTO `_log` VALUES ('751', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', '7svgf2itm0ul87qi996hrp1br5', '2013-04-04 03:57:06');
INSERT INTO `_log` VALUES ('752', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', 'kjpkscvidrpqqt2cde98gb0fs2', '2013-04-04 04:09:10');
INSERT INTO `_log` VALUES ('753', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots)', '', 'n9aqhmf25f6oq291h91r55s0p0', '2013-04-04 04:09:24');
INSERT INTO `_log` VALUES ('754', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', 'aeno17m88haorq0e51cblhcr34', '2013-04-04 04:12:44');
INSERT INTO `_log` VALUES ('755', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', '1622iejb3d5mquij51hkhvs9p7', '2013-04-04 04:15:27');
INSERT INTO `_log` VALUES ('756', 'tag', 'search', '', '34', '77.88.31.246', 'Mozilla/5.0 (compatible; YandexBot/3.0; +http://yandex.com/bots)', '', 'ssegjth2b7ajlehkl87k1d7jv0', '2013-04-04 04:15:41');
INSERT INTO `_log` VALUES ('757', 'blog', 'show', '', '40', '66.249.75.234', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', 'jj7f0da9v5h9c6pmc069buug25', '2013-04-04 04:18:13');
INSERT INTO `_log` VALUES ('758', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', '8cc3t8va1ckjq15558mkcbu624', '2013-04-04 04:28:41');
INSERT INTO `_log` VALUES ('759', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', 'a2q5c8acpqene7h8deijlm7932', '2013-04-04 04:31:57');
INSERT INTO `_log` VALUES ('760', '', '', '', '', '213.180.206.205', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots DEV)', '', 'v7rjo05v4bo4njoiam27icg4g5', '2013-04-04 04:33:43');
INSERT INTO `_log` VALUES ('761', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', 'n1rr9v3db39pjsjtqhm6i0rka3', '2013-04-04 04:34:49');
INSERT INTO `_log` VALUES ('762', 'tag', 'search', '', '6', '77.88.31.246', 'Mozilla/5.0 (compatible; YandexBot/3.0; +http://yandex.com/bots)', '', 'dg36g70bftu232pctjgj3e3767', '2013-04-04 04:38:07');
INSERT INTO `_log` VALUES ('763', 'blog', 'show', '', '6', '66.249.75.234', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', 'ertqsp9rrctp5rk44p0l6q4nb7', '2013-04-04 04:44:38');
INSERT INTO `_log` VALUES ('764', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', 'rsvqe4c1g87s90m8od6j7au685', '2013-04-04 04:47:47');
INSERT INTO `_log` VALUES ('765', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', '9oj5h0j8a0cmgdngorfdf8cn73', '2013-04-04 04:51:44');
INSERT INTO `_log` VALUES ('766', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', '80o15kajidghjgtpjarm56ko20', '2013-04-04 04:53:23');
INSERT INTO `_log` VALUES ('767', 'tag', 'search', '', '1', '77.88.31.246', 'Mozilla/5.0 (compatible; YandexBot/3.0; +http://yandex.com/bots)', '', 'lm8j0kofdfqh1soan8qcj8k1v6', '2013-04-04 05:00:33');
INSERT INTO `_log` VALUES ('768', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', 'ern1nb1rls8vg8m1kkhlomorv6', '2013-04-04 05:07:31');
INSERT INTO `_log` VALUES ('769', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', 'fs04ov55r9aj74agmbpcog9km3', '2013-04-04 05:11:01');
INSERT INTO `_log` VALUES ('770', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', '7t3fb9vdrceiv5k1afljf29g82', '2013-04-04 05:12:45');
INSERT INTO `_log` VALUES ('771', 'blog', 'show', '', '37', '66.249.75.234', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', 'ol0a0kresd7280rj7940uel5f0', '2013-04-04 05:13:46');
INSERT INTO `_log` VALUES ('772', 'blog', 'show', '', '17', '77.88.31.246', 'Mozilla/5.0 (compatible; YandexBot/3.0; +http://yandex.com/bots)', '', 'qq8vf2jes3gft5kop1448fvlo2', '2013-04-04 05:22:59');
INSERT INTO `_log` VALUES ('773', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', '5rb8hmpu5da2buguijlhjr13j4', '2013-04-04 05:25:54');
INSERT INTO `_log` VALUES ('774', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', 'gic865mo89023qjhofaufmmqi1', '2013-04-04 05:29:45');
INSERT INTO `_log` VALUES ('775', '', '', '', '', '213.180.206.205', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots DEV)', '', 'a7j7ldkirn3n8n1eidvgguinh4', '2013-04-04 05:30:24');
INSERT INTO `_log` VALUES ('776', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', 'iouqvli27f8llvd4nq9fo05017', '2013-04-04 05:31:22');
INSERT INTO `_log` VALUES ('777', 'user', 'forgotform', '', '', '66.249.75.234', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', '0mi3ef5lq5709itv2eef0d0ip0', '2013-04-04 05:42:14');
INSERT INTO `_log` VALUES ('778', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', '7b0uaorlfigmhpf1k7n8432cl4', '2013-04-04 05:45:09');
INSERT INTO `_log` VALUES ('779', 'blog', 'show', '', '18', '77.88.31.246', 'Mozilla/5.0 (compatible; YandexBot/3.0; +http://yandex.com/bots)', '', '0ga46h49icisptukp81cmrqad1', '2013-04-04 05:45:25');
INSERT INTO `_log` VALUES ('780', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', 'b3cf60kan7072happgq0ki1te0', '2013-04-04 05:49:27');
INSERT INTO `_log` VALUES ('781', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', 'k6k2obmhbs65s2uvge4c0p4d54', '2013-04-04 05:50:32');
INSERT INTO `_log` VALUES ('782', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', '3imvpvusvnh3vgftog5eb2gk60', '2013-04-04 06:04:14');
INSERT INTO `_log` VALUES ('783', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', 'hj5bqrop0oourfin6q7aa2fq96', '2013-04-04 06:08:52');
INSERT INTO `_log` VALUES ('784', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', '1su5o78stcefp840tjgnhfjv82', '2013-04-04 06:08:54');
INSERT INTO `_log` VALUES ('785', 'tag', 'search', '', '54', '66.249.75.234', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', 'l1lopmkfotnc2io9s47najfpk0', '2013-04-04 06:11:02');
INSERT INTO `_log` VALUES ('786', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', '51ktjpfio540ef0a7a9tvcr3t7', '2013-04-04 06:22:58');
INSERT INTO `_log` VALUES ('787', 'tag', 'search', '', '2', '77.88.31.246', 'Mozilla/5.0 (compatible; YandexBot/3.0; +http://yandex.com/bots)', '', 'bn2tf2a4j8ugvqqmcptb4r48m2', '2013-04-04 06:24:20');
INSERT INTO `_log` VALUES ('788', '', '', '', '', '213.180.206.205', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots DEV)', '', '96mkbhqicsovhvgjmeo0ttsh27', '2013-04-04 06:25:36');
INSERT INTO `_log` VALUES ('789', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', '9iv4ungdn5vm5gtuq2qg0e1h02', '2013-04-04 06:27:25');
INSERT INTO `_log` VALUES ('790', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', 'hbf54blk0kv0voivhdfqvhvab3', '2013-04-04 06:28:18');
INSERT INTO `_log` VALUES ('791', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots)', '', 'smre0685hgnei9cmon8civch07', '2013-04-04 06:30:22');
INSERT INTO `_log` VALUES ('792', 'tag', 'search', '', '58', '66.249.75.234', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', 'ter3jihsjf7qmh15j2o0uk41n4', '2013-04-04 06:39:50');
INSERT INTO `_log` VALUES ('793', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', '2iquk085ut531grb6l5jbqei95', '2013-04-04 06:41:44');
INSERT INTO `_log` VALUES ('794', 'user', 'forgotform', '', '', '77.88.31.246', 'Mozilla/5.0 (compatible; YandexBot/3.0; +http://yandex.com/bots)', '', 'dnj234bvufr4tid0v1lpbtu3t7', '2013-04-04 06:43:28');
INSERT INTO `_log` VALUES ('795', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', '0ft9ffpp3np8i6kncmp70v0ip3', '2013-04-04 06:46:19');
INSERT INTO `_log` VALUES ('796', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', '8l9bcb8fbn5tuag27b8tul9cm2', '2013-04-04 06:47:15');
INSERT INTO `_log` VALUES ('797', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', 'vu13d5p889e4ebicadjp52rt17', '2013-04-04 07:01:02');
INSERT INTO `_log` VALUES ('798', 'tag', 'search', '', '4', '77.88.31.246', 'Mozilla/5.0 (compatible; YandexBot/3.0; +http://yandex.com/bots)', '', 'vp2j49hpg3gplgqlv3h9h48hm1', '2013-04-04 07:02:36');
INSERT INTO `_log` VALUES ('799', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', 'g0dq7te8c131fhe1iu9e6hq721', '2013-04-04 07:05:38');
INSERT INTO `_log` VALUES ('800', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', 'bip0r00sv8g06qu76pssr2ckn5', '2013-04-04 07:06:15');
INSERT INTO `_log` VALUES ('801', 'tag', 'search', '', '13', '66.249.75.234', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', '9b5qul1fcc3tegguda6v8pnpd0', '2013-04-04 07:08:38');
INSERT INTO `_log` VALUES ('802', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', '8o300r1gvasf4u003uhvhlud26', '2013-04-04 07:20:04');
INSERT INTO `_log` VALUES ('803', 'tag', 'search', '', '7', '77.88.31.246', 'Mozilla/5.0 (compatible; YandexBot/3.0; +http://yandex.com/bots)', '', 'sdk4u003ases0bqtb35ogr1vi6', '2013-04-04 07:21:44');
INSERT INTO `_log` VALUES ('804', '', '', '', '', '213.180.206.205', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots DEV)', '', 'q1ah40ru5n8lq0qb4nit9nppc3', '2013-04-04 07:21:58');
INSERT INTO `_log` VALUES ('805', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', 'uv2v7vkrd66aetuhm43dnsoq66', '2013-04-04 07:24:13');
INSERT INTO `_log` VALUES ('806', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', 'fudg3ag1g224k53gi2vcdfnqr7', '2013-04-04 07:25:53');
INSERT INTO `_log` VALUES ('807', 'tag', 'search', '', '68', '66.249.75.234', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', 'm5ossua7ur361i3cejh3pd1l94', '2013-04-04 07:37:58');
INSERT INTO `_log` VALUES ('808', 'tag', 'search', '', '41', '77.88.31.246', 'Mozilla/5.0 (compatible; YandexBot/3.0; +http://yandex.com/bots)', '', 'c6u5etscg3up06b596nv708936', '2013-04-04 07:39:07');
INSERT INTO `_log` VALUES ('809', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', 'lotti5ki7o022n7lq5ppotkvh3', '2013-04-04 07:39:56');
INSERT INTO `_log` VALUES ('810', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', 'tv5lb8cvska3f9arvc19mopu47', '2013-04-04 07:43:51');
INSERT INTO `_log` VALUES ('811', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', 'r4k280cogfgmfk8khimhikptf5', '2013-04-04 07:45:01');
INSERT INTO `_log` VALUES ('812', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', 'v1v3k2fubcb9vprm1i5cvc39b2', '2013-04-04 07:59:27');
INSERT INTO `_log` VALUES ('813', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', 'vvqgk4pqdb0pig6mugp092vsf3', '2013-04-04 08:03:16');
INSERT INTO `_log` VALUES ('814', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', 'hr7m73k8fpoe0hfejcc9h8av05', '2013-04-04 08:03:34');
INSERT INTO `_log` VALUES ('815', 'tag', 'search', '', '9', '66.249.75.234', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', 'vn9tul8jn2qaqdijcqpskumt33', '2013-04-04 08:08:09');
INSERT INTO `_log` VALUES ('816', '', '', '', '', '213.180.206.205', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots DEV)', '', '36dvamjc5eg3d0pvo8qqappjs3', '2013-04-04 08:16:45');
INSERT INTO `_log` VALUES ('817', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', 'qs0mm73h54kqc3dn6c95v6q964', '2013-04-04 08:17:56');
INSERT INTO `_log` VALUES ('818', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', 'mk86rol8ng1kmkpmim8itcps65', '2013-04-04 08:22:04');
INSERT INTO `_log` VALUES ('819', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', 'h8kvd8roa3ao6bke3a9es1q8f1', '2013-04-04 08:22:12');
INSERT INTO `_log` VALUES ('820', 'tag', 'search', '', '59', '66.249.75.234', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', 'o0qv38tkmog6j8e1u487fuki32', '2013-04-04 08:35:02');
INSERT INTO `_log` VALUES ('821', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', 'ujfst20t9s79ep2g7rfjb4p803', '2013-04-04 08:37:30');
INSERT INTO `_log` VALUES ('822', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', '9j4ihbmvol5k6g27ta8uifjpe2', '2013-04-04 08:40:55');
INSERT INTO `_log` VALUES ('823', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', '07dgc3qi6go1mqac87h7uoe885', '2013-04-04 08:41:41');
INSERT INTO `_log` VALUES ('824', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', 'u5msgr7t6gqnmg5a4t5phsaq22', '2013-04-04 08:57:25');
INSERT INTO `_log` VALUES ('825', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', 'kfjl6tpcv2asteusqqjt5cnc37', '2013-04-04 09:00:39');
INSERT INTO `_log` VALUES ('826', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', 'fqv0cnljjvqflasv4qia3dbd73', '2013-04-04 09:00:57');
INSERT INTO `_log` VALUES ('827', 'tag', 'search', '', '11', '66.249.75.234', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', 'p4fim51t87nub6ndfc08fr24n4', '2013-04-04 09:03:50');
INSERT INTO `_log` VALUES ('828', 'blog', 'track', '', '34', '66.249.75.234', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', 'i5vp2ig8igt8bcoe77rr8938c2', '2013-04-04 09:09:38');
INSERT INTO `_log` VALUES ('829', 'blog', 'track', '', '39', '66.249.75.234', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', 'j8h24sbet9vi6h62ocm928k0r6', '2013-04-04 09:09:39');
INSERT INTO `_log` VALUES ('830', 'blog', 'track', '', '35', '66.249.75.234', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', 'c6lgijo7adt114cd0ed5v8jj27', '2013-04-04 09:09:39');
INSERT INTO `_log` VALUES ('831', 'blog', 'track', '', '40', '66.249.75.234', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', 'rdla6ib0e3tahfhq2ptnkop756', '2013-04-04 09:09:40');
INSERT INTO `_log` VALUES ('832', 'blog', 'track', '', '31', '66.249.75.234', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', 'trh8c4k9h0jsdjlh6k8rdsd4c7', '2013-04-04 09:09:40');
INSERT INTO `_log` VALUES ('833', 'blog', 'track', '', '36', '66.249.75.234', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', '5onv0v9fc180f6eb9dhk82lau4', '2013-04-04 09:09:41');
INSERT INTO `_log` VALUES ('834', 'blog', 'track', '', '33', '66.249.75.234', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', '2dq7497i2hcfm1p0ridfe5rv33', '2013-04-04 09:09:41');
INSERT INTO `_log` VALUES ('835', 'blog', 'track', '', '37', '66.249.75.234', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', 'gbi6anro95j7m27biu9dg55d90', '2013-04-04 09:09:41');
INSERT INTO `_log` VALUES ('836', 'blog', 'track', '', '38', '66.249.75.234', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', 'fqop360pbbhlc1dk3646jvkkt5', '2013-04-04 09:09:42');
INSERT INTO `_log` VALUES ('837', 'blog', 'track', '', '32', '66.249.75.234', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', 'olhb3t1cgmlrbv4bsccl7kldq0', '2013-04-04 09:09:42');
INSERT INTO `_log` VALUES ('838', '', '', '', '', '213.180.206.205', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots DEV)', '', '8kblgevcea50eh54l2le7r2404', '2013-04-04 09:13:14');
INSERT INTO `_log` VALUES ('839', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', 'tn72iui9beihh5548sm03b32a2', '2013-04-04 09:16:53');
INSERT INTO `_log` VALUES ('840', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', 'smp6h6fdj25nqdd1bpmqm9amb5', '2013-04-04 09:19:29');
INSERT INTO `_log` VALUES ('841', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', 'mu7m17e25rcr836vfprhiqqmq4', '2013-04-04 09:19:48');
INSERT INTO `_log` VALUES ('842', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots)', '', '7gqdiin4etqf74r8rj2mf5jo01', '2013-04-04 09:23:09');
INSERT INTO `_log` VALUES ('843', 'tag', 'search', '', '44', '66.249.75.234', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', 'ajs20upichgdh5v9quldmpm820', '2013-04-04 09:32:38');
INSERT INTO `_log` VALUES ('844', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', 'plnuh22htl398v5nq0gff9e952', '2013-04-04 09:36:02');
INSERT INTO `_log` VALUES ('845', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', 'h9k0n3j5vn0780tt065d40ab61', '2013-04-04 09:38:02');
INSERT INTO `_log` VALUES ('846', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', 'n50l4kuq21b4tu2l054cnakiu6', '2013-04-04 09:39:11');
INSERT INTO `_log` VALUES ('847', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', 'c8v5r2o65726qa9t3go446v5n4', '2013-04-04 09:55:06');
INSERT INTO `_log` VALUES ('848', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', 'olek3tstmd0fmchvbmqsf79ip4', '2013-04-04 09:57:02');
INSERT INTO `_log` VALUES ('849', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', 'kq40dumha1i17e2h0017v12lt2', '2013-04-04 09:57:47');
INSERT INTO `_log` VALUES ('850', 'tag', 'search', '', '6', '66.249.75.234', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', '9h6qql3u9m78951mu6jckj1i66', '2013-04-04 10:01:27');
INSERT INTO `_log` VALUES ('851', '', '', '', '', '213.180.206.205', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots DEV)', '', 'g9fddvjidcgrquq463j2abcd46', '2013-04-04 10:09:15');
INSERT INTO `_log` VALUES ('852', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', 'tvlkniu71j0lbmk3m4nkf4rvp6', '2013-04-04 10:13:52');
INSERT INTO `_log` VALUES ('853', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', 'pu30ev2p7pl6et7vtusd1fnds3', '2013-04-04 10:16:15');
INSERT INTO `_log` VALUES ('854', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', 'rq1tcrmt1dlqcit54b14k22q30', '2013-04-04 10:17:06');
INSERT INTO `_log` VALUES ('855', 'tag', 'search', '', '52', '66.249.75.234', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', 'd33jt915pk8e76gh1vpe1tpsr7', '2013-04-04 10:30:16');
INSERT INTO `_log` VALUES ('856', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', 'nv3ecub9uq78ju8aas8u070r33', '2013-04-04 10:32:55');
INSERT INTO `_log` VALUES ('857', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', 'ipvqnqh6e0erqqsv5rcdvb8vt1', '2013-04-04 10:35:53');
INSERT INTO `_log` VALUES ('858', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', 'snffv5ud9bk4cjf12htufmh9c7', '2013-04-04 10:36:27');
INSERT INTO `_log` VALUES ('859', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', '6sd00n5jo49dkgj2phlas3ino4', '2013-04-04 10:52:04');
INSERT INTO `_log` VALUES ('860', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', '03nnqe30s4pteum6p4t9qa3s75', '2013-04-04 10:55:25');
INSERT INTO `_log` VALUES ('861', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', 'rom38ljct177pe16tdrtop99k0', '2013-04-04 10:55:50');
INSERT INTO `_log` VALUES ('862', 'blog', 'next', '', '', '66.249.75.234', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', '53h6k65lq4bq3kro8t14r18540', '2013-04-04 10:59:02');
INSERT INTO `_log` VALUES ('863', '', '', '', '', '213.180.206.205', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots DEV)', '', '6s5lp5smt16mkeeib0ltq531m1', '2013-04-04 11:05:30');
INSERT INTO `_log` VALUES ('864', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', '0dlm24riharf9h8gj72a3o3jq1', '2013-04-04 11:11:59');
INSERT INTO `_log` VALUES ('865', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', 'h4isbv0kj3khkttkrfntuq8411', '2013-04-04 11:14:38');
INSERT INTO `_log` VALUES ('866', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', '9smd9644pjddp3n81pmfgu5fe5', '2013-04-04 11:15:01');
INSERT INTO `_log` VALUES ('867', 'tag', 'search', '', '2', '66.249.75.234', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', 'qqndt68rpiml8fileoim3ckn77', '2013-04-04 11:28:20');
INSERT INTO `_log` VALUES ('868', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', 'inobb18fgs7v3k6bolrj9vq9s0', '2013-04-04 11:31:49');
INSERT INTO `_log` VALUES ('869', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', 'kqj5jj2c4eqpioffgst2clhvu2', '2013-04-04 11:33:24');
INSERT INTO `_log` VALUES ('870', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', 'v81a72tbook2cn5ggniuf86a23', '2013-04-04 11:33:46');
INSERT INTO `_log` VALUES ('871', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots)', '', '4hjvd482uar42ioim9v7aencl0', '2013-04-04 11:34:14');
INSERT INTO `_log` VALUES ('872', '', '', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', '', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-04 11:44:19');
INSERT INTO `_log` VALUES ('873', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', '2rhs74kunr10jihcok0bmkmol3', '2013-04-04 11:51:39');
INSERT INTO `_log` VALUES ('874', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', '2qssabqqj5n4fj4shlhjci81s1', '2013-04-04 11:53:21');
INSERT INTO `_log` VALUES ('875', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', 'esc0dj8o8am3688d5jisodpsl1', '2013-04-04 11:53:22');
INSERT INTO `_log` VALUES ('876', 'tag', 'search', '', '12', '66.249.75.234', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', 'd9b2eb4aa7nn5d5fgpqvjb1a83', '2013-04-04 11:58:09');
INSERT INTO `_log` VALUES ('877', '', '', '', '', '213.180.206.205', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots DEV)', '', '1upvbpodebq7najc3ubtt1vuk5', '2013-04-04 12:01:19');
INSERT INTO `_log` VALUES ('878', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', '2do4rkqsopnh2cviqqfcc88385', '2013-04-04 12:11:05');
INSERT INTO `_log` VALUES ('879', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', '1l837aan50f3pg8gtednbbqpb2', '2013-04-04 12:11:52');
INSERT INTO `_log` VALUES ('880', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', 'ha2ugm4l56askrl4djhca2st81', '2013-04-04 12:12:35');
INSERT INTO `_log` VALUES ('881', 'tag', 'search', '', '1', '66.249.75.234', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', 'ki79k7cnvitdjti5enrqerbtq5', '2013-04-04 12:28:18');
INSERT INTO `_log` VALUES ('882', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', 'inht8t0mt73fnjaf1a0t7g76m1', '2013-04-04 12:29:47');
INSERT INTO `_log` VALUES ('883', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', '2og7l0s47h94i8k1pgcif0f8e1', '2013-04-04 12:30:49');
INSERT INTO `_log` VALUES ('884', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', 's2lebf5jd3vnomre36kiq6hpv4', '2013-04-04 12:31:18');
INSERT INTO `_log` VALUES ('885', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', 'rfh4s2o7jftfql3t7f0oth7aj4', '2013-04-04 12:49:02');
INSERT INTO `_log` VALUES ('886', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', 'db3n6gd9aods090bdgk220e8a6', '2013-04-04 12:49:37');
INSERT INTO `_log` VALUES ('887', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', 'qe8h2n36b581ur9vtffe6squq7', '2013-04-04 12:50:01');
INSERT INTO `_log` VALUES ('888', 'tag', 'search', '', '7', '66.249.75.234', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', 'bd6dcog2oieajgrct8gt62f5s1', '2013-04-04 12:54:14');
INSERT INTO `_log` VALUES ('889', '', '', '', '', '213.180.206.205', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots DEV)', '', 'ku8mi7vh5b6d3m44k48q4pl5q6', '2013-04-04 12:58:55');
INSERT INTO `_log` VALUES ('890', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', 'vd8hcdjve0m4d1pn11laffta27', '2013-04-04 13:07:46');
INSERT INTO `_log` VALUES ('891', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', 'e8aa3pv814idcofgke7dtjmlo7', '2013-04-04 13:08:20');
INSERT INTO `_log` VALUES ('892', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', 'sbrgc8bh58l3cttsv8g79iol23', '2013-04-04 13:09:53');
INSERT INTO `_log` VALUES ('893', 'blog', 'show', '', '11', '66.249.75.234', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', 'ki77t7raq6amdqpab80sq65c86', '2013-04-04 13:23:02');
INSERT INTO `_log` VALUES ('894', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', 'tfstt9eusguh4snrannbqsckr4', '2013-04-04 13:27:12');
INSERT INTO `_log` VALUES ('895', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', 'bgt2hg4c2q289lm170b4sb27a4', '2013-04-04 13:27:46');
INSERT INTO `_log` VALUES ('896', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', '2uf9kpsda6qji5297kto3u4hg2', '2013-04-04 13:28:51');
INSERT INTO `_log` VALUES ('897', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots)', '', '5gl0vgcqjomch50beic5pkfjq2', '2013-04-04 13:38:58');
INSERT INTO `_log` VALUES ('898', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', 'qtv0vspej78subcoho9l5hab16', '2013-04-04 13:46:14');
INSERT INTO `_log` VALUES ('899', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', 'atp7k4rmcmtaulgu96236bsq11', '2013-04-04 13:46:38');
INSERT INTO `_log` VALUES ('900', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', '2t5kttru56o3ovoe7honpod895', '2013-04-04 13:47:49');
INSERT INTO `_log` VALUES ('901', 'blog', 'show', '', '13', '66.249.75.234', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', 'jh45icm6cch281gaehhca5ttl7', '2013-04-04 13:51:50');
INSERT INTO `_log` VALUES ('902', '', '', '', '', '213.180.206.205', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots DEV)', '', 'ngqgm3qiujpdnofsb25980u0a1', '2013-04-04 13:55:16');
INSERT INTO `_log` VALUES ('903', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', '8htk5l4qfjtc14kh9chi9s0t23', '2013-04-04 14:05:59');
INSERT INTO `_log` VALUES ('904', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', 'n4io2kmd5giasc8umpe4thgfa2', '2013-04-04 14:06:18');
INSERT INTO `_log` VALUES ('905', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', '6dmj7l7snoi0m9h5p82k05dmv5', '2013-04-04 14:07:07');
INSERT INTO `_log` VALUES ('906', 'tag', 'search', '', '42', '66.249.73.187', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', 'les1qki282o4qhvnts8nhkqug5', '2013-04-04 14:20:42');
INSERT INTO `_log` VALUES ('907', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', '4fgpv0lscqgi7dtt5k6gmpark5', '2013-04-04 14:24:35');
INSERT INTO `_log` VALUES ('908', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', '8dvmesjh9guvad4mlsn5ku8ok5', '2013-04-04 14:25:32');
INSERT INTO `_log` VALUES ('909', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', 'f8ea0s699mbl37ahat388c97g1', '2013-04-04 14:25:40');
INSERT INTO `_log` VALUES ('910', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', 'i816a42d3de0fheuog2e2uaiu1', '2013-04-04 14:43:36');
INSERT INTO `_log` VALUES ('911', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', 'ajs81nj2h2n7b9t9g7s1mj38q1', '2013-04-04 14:44:49');
INSERT INTO `_log` VALUES ('912', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', '5o7t49r10156r3u6mmi10993i2', '2013-04-04 14:45:05');
INSERT INTO `_log` VALUES ('913', 'tag', 'search', '', '10', '66.249.73.187', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', 'lfguh8glr3a98ol9ibofd30ov5', '2013-04-04 14:49:26');
INSERT INTO `_log` VALUES ('914', '', '', '', '', '213.180.206.205', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots DEV)', '', 'r27hcn311t54hvpq2u42sa7ti3', '2013-04-04 14:50:53');
INSERT INTO `_log` VALUES ('915', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', 'g9m6ab7r7nkapnt8ior14i4ef4', '2013-04-04 15:02:29');
INSERT INTO `_log` VALUES ('916', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', 'nj47gbihu5qtqdosbrqq8fjta6', '2013-04-04 15:03:42');
INSERT INTO `_log` VALUES ('917', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', '90g8o1c6nq2770r6p275vhe4g7', '2013-04-04 15:04:37');
INSERT INTO `_log` VALUES ('918', '', '', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', '', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-04 15:07:38');
INSERT INTO `_log` VALUES ('919', '', '', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:14.0) Gecko/20100101 Firefox/14.0.1', '', '0khvmct27k4jr116j879bsd1o4', '2013-04-04 15:08:04');
INSERT INTO `_log` VALUES ('920', '', '', '', '', '86.57.158.234', 'Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 6.1; WOW64; Trident/6.0)', '', 'mftlp6g96ckp6justqrgmq30g5', '2013-04-04 15:08:15');
INSERT INTO `_log` VALUES ('921', 'blog', '', '', '', '86.57.158.234', 'Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 6.1; WOW64; Trident/6.0)', 'http://manti.by/', 'mftlp6g96ckp6justqrgmq30g5', '2013-04-04 15:13:07');
INSERT INTO `_log` VALUES ('922', 'blog', 'next', '', '', '86.57.158.234', 'Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 6.1; WOW64; Trident/6.0)', 'http://manti.by/blog/', 'mftlp6g96ckp6justqrgmq30g5', '2013-04-04 15:13:11');
INSERT INTO `_log` VALUES ('923', 'blog', 'next', '', '', '86.57.158.234', 'Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 6.1; WOW64; Trident/6.0)', 'http://manti.by/blog/', 'mftlp6g96ckp6justqrgmq30g5', '2013-04-04 15:13:11');
INSERT INTO `_log` VALUES ('924', 'blog', 'next', '', '', '86.57.158.234', 'Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 6.1; WOW64; Trident/6.0)', 'http://manti.by/blog/#hide-tracklist', 'mftlp6g96ckp6justqrgmq30g5', '2013-04-04 15:13:28');
INSERT INTO `_log` VALUES ('925', 'blog', 'next', '', '', '86.57.158.234', 'Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 6.1; WOW64; Trident/6.0)', 'http://manti.by/blog/#hide-tracklist', 'mftlp6g96ckp6justqrgmq30g5', '2013-04-04 15:13:28');
INSERT INTO `_log` VALUES ('926', 'blog', 'next', '', '', '86.57.158.234', 'Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 6.1; WOW64; Trident/6.0)', 'http://manti.by/blog/#hide-tracklist', 'mftlp6g96ckp6justqrgmq30g5', '2013-04-04 15:13:38');
INSERT INTO `_log` VALUES ('927', 'blog', 'next', '', '', '86.57.158.234', 'Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 6.1; WOW64; Trident/6.0)', 'http://manti.by/blog/#hide-tracklist', 'mftlp6g96ckp6justqrgmq30g5', '2013-04-04 15:13:40');
INSERT INTO `_log` VALUES ('928', 'blog', 'next', '', '', '86.57.158.234', 'Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 6.1; WOW64; Trident/6.0)', 'http://manti.by/blog/#hide-tracklist', 'mftlp6g96ckp6justqrgmq30g5', '2013-04-04 15:13:40');
INSERT INTO `_log` VALUES ('929', 'blog', 'next', '', '', '86.57.158.234', 'Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 6.1; WOW64; Trident/6.0)', 'http://manti.by/blog/#hide-tracklist', 'mftlp6g96ckp6justqrgmq30g5', '2013-04-04 15:13:58');
INSERT INTO `_log` VALUES ('930', 'blog', 'next', '', '', '86.57.158.234', 'Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 6.1; WOW64; Trident/6.0)', 'http://manti.by/blog/#hide-tracklist', 'mftlp6g96ckp6justqrgmq30g5', '2013-04-04 15:13:58');
INSERT INTO `_log` VALUES ('931', 'tag', 'search', '', '53', '66.249.73.187', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', 'n5q733v11ft90b5fqc5qqs1tp5', '2013-04-04 15:18:27');
INSERT INTO `_log` VALUES ('932', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', 'ge01v46cg17i0ub3dpp1ughqa2', '2013-04-04 15:21:12');
INSERT INTO `_log` VALUES ('933', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', '3v2bvsn920ph8tvbr8me6ap746', '2013-04-04 15:23:40');
INSERT INTO `_log` VALUES ('934', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', 'kublskgomedb7m7s826hq1ql46', '2013-04-04 15:24:07');
INSERT INTO `_log` VALUES ('935', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', 'qvc214vvkhjg3oihfijf6f5216', '2013-04-04 15:40:43');
INSERT INTO `_log` VALUES ('936', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', '06kng7olaf4n2jm93v66hhhor2', '2013-04-04 15:42:22');
INSERT INTO `_log` VALUES ('937', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', 'i9erbjla4pagr9mmvmunrfvu56', '2013-04-04 15:43:26');
INSERT INTO `_log` VALUES ('938', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots)', '', 'fc0hedgma3c23op68frj7qsut2', '2013-04-04 15:44:26');
INSERT INTO `_log` VALUES ('939', '', '', '', '', '213.180.206.205', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots DEV)', '', '362t9a1kvk2itpc0ea2vp4epa1', '2013-04-04 15:47:12');
INSERT INTO `_log` VALUES ('940', 'tag', 'search', '', '4', '66.249.73.187', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', '85fg438si6q33ivka29722g462', '2013-04-04 15:48:20');
INSERT INTO `_log` VALUES ('941', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', 'ngbl2dt116veq6d3tvtocs64e2', '2013-04-04 16:00:07');
INSERT INTO `_log` VALUES ('942', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', 'h4rh5buh848sfok3hrs1s85ad0', '2013-04-04 16:01:38');
INSERT INTO `_log` VALUES ('943', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', 'n8a4qomrrgkcc791g2oanj1iv5', '2013-04-04 16:02:49');
INSERT INTO `_log` VALUES ('944', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', '9q6vk1ihide5kq2m6u5dqio0o5', '2013-04-04 16:18:25');
INSERT INTO `_log` VALUES ('945', 'tag', 'search', '', '61', '66.249.73.187', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', 'cpa88quagc02ogj6gf9l5cdor7', '2013-04-04 16:18:32');
INSERT INTO `_log` VALUES ('946', '', '', '', '', '86.57.158.234', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729)', '', 'fbn9adr3l3u35gkec8k0ksc4d5', '2013-04-04 16:21:02');
INSERT INTO `_log` VALUES ('947', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', 'bp1kffak6ri616pbvg61t0vlo6', '2013-04-04 16:21:21');
INSERT INTO `_log` VALUES ('948', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', 't08l2jlkr05615ds22tcf99857', '2013-04-04 16:21:24');
INSERT INTO `_log` VALUES ('949', 'blog', '', '', '', '86.57.158.234', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729)', 'http://manti.by/', 'fbn9adr3l3u35gkec8k0ksc4d5', '2013-04-04 16:24:20');
INSERT INTO `_log` VALUES ('950', '', '', '', '', '86.57.158.234', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729)', 'http://manti.by/blog/', 'fbn9adr3l3u35gkec8k0ksc4d5', '2013-04-04 16:24:22');
INSERT INTO `_log` VALUES ('951', 'gallery', '', '', '', '86.57.158.234', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729)', 'http://manti.by/', 'fbn9adr3l3u35gkec8k0ksc4d5', '2013-04-04 16:24:31');
INSERT INTO `_log` VALUES ('952', 'blog', 'show', '', '14', '86.57.158.234', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729)', 'http://manti.by/gallery/', 'fbn9adr3l3u35gkec8k0ksc4d5', '2013-04-04 16:24:39');
INSERT INTO `_log` VALUES ('953', 'blog', 'track', '', '14', '86.57.158.234', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729)', 'http://manti.by/about/', 'fbn9adr3l3u35gkec8k0ksc4d5', '2013-04-04 16:24:39');
INSERT INTO `_log` VALUES ('954', 'file', '', '', '', '86.57.158.234', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729)', 'http://manti.by/about/', 'fbn9adr3l3u35gkec8k0ksc4d5', '2013-04-04 16:24:46');
INSERT INTO `_log` VALUES ('955', 'search', 'autocomplete', '', '', '86.57.158.234', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729)', 'http://manti.by/download/', 'fbn9adr3l3u35gkec8k0ksc4d5', '2013-04-04 16:24:59');
INSERT INTO `_log` VALUES ('956', 'search', '', '', '', '86.57.158.234', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729)', 'http://manti.by/download/', 'fbn9adr3l3u35gkec8k0ksc4d5', '2013-04-04 16:25:02');
INSERT INTO `_log` VALUES ('957', '', '', '', '', '86.57.158.234', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729)', '', 'fbn9adr3l3u35gkec8k0ksc4d5', '2013-04-04 16:25:23');
INSERT INTO `_log` VALUES ('958', 'gallery', '', '', '', '86.57.158.234', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729)', 'http://manti.by/', 'fbn9adr3l3u35gkec8k0ksc4d5', '2013-04-04 16:25:26');
INSERT INTO `_log` VALUES ('959', 'file', 'track', '', '442', '86.57.158.234', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729)', 'http://manti.by/gallery/#image-442', 'fbn9adr3l3u35gkec8k0ksc4d5', '2013-04-04 16:25:27');
INSERT INTO `_log` VALUES ('960', 'gallery', 'next', '', '442', '86.57.158.234', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729)', 'http://manti.by/gallery/#image-442', 'fbn9adr3l3u35gkec8k0ksc4d5', '2013-04-04 16:25:37');
INSERT INTO `_log` VALUES ('961', '', '', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', '', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-04 16:26:17');
INSERT INTO `_log` VALUES ('962', 'search', 'autocomplete', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-04 16:26:21');
INSERT INTO `_log` VALUES ('963', 'search', '', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-04 16:26:22');
INSERT INTO `_log` VALUES ('964', 'search', '', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-04 16:33:07');
INSERT INTO `_log` VALUES ('965', 'file', 'track', '', '567', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/search/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-04 16:33:09');
INSERT INTO `_log` VALUES ('966', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', '70thcvrhhav0b2cu0m31ttek14', '2013-04-04 16:37:09');
INSERT INTO `_log` VALUES ('967', '', '', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', '', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-04 16:38:58');
INSERT INTO `_log` VALUES ('968', 'blog', 'show', '', '39', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-04 16:39:25');
INSERT INTO `_log` VALUES ('969', 'blog', 'track', '', '39', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/blog/nlp/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-04 16:39:25');
INSERT INTO `_log` VALUES ('970', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', '4d7esk1s3njtr1pts43ov485u2', '2013-04-04 16:40:20');
INSERT INTO `_log` VALUES ('971', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', 'g3aalk1oflsiciq7ptpp8em970', '2013-04-04 16:40:51');
INSERT INTO `_log` VALUES ('972', '', '', '', '', '213.180.206.205', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots DEV)', '', 'o644olst9k6tkca427qos196e5', '2013-04-04 16:44:06');
INSERT INTO `_log` VALUES ('973', 'blog', 'track', '', '2', '66.249.73.187', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', 'f3h9fr4cj2d7sanucb5b4ujst3', '2013-04-04 16:44:38');
INSERT INTO `_log` VALUES ('974', '', '', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', '', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-04 16:52:00');
INSERT INTO `_log` VALUES ('975', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', 'lim5umdqlq8d3439urk7ju4rp2', '2013-04-04 16:56:27');
INSERT INTO `_log` VALUES ('976', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', 'ju96lbshcbk2qmvcqgcuvsffl5', '2013-04-04 16:59:07');
INSERT INTO `_log` VALUES ('977', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', '7g9jouk2aajfo65plrtr2a4ao3', '2013-04-04 17:01:14');
INSERT INTO `_log` VALUES ('978', '', '', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', '', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-04 17:01:16');
INSERT INTO `_log` VALUES ('979', '', '', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', '', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-04 17:08:05');
INSERT INTO `_log` VALUES ('980', 'gallery', '', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-04 17:11:14');
INSERT INTO `_log` VALUES ('981', 'file', '', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/gallery/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-04 17:11:15');
INSERT INTO `_log` VALUES ('982', 'file', 'track', '', '225', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/download/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-04 17:11:17');
INSERT INTO `_log` VALUES ('983', 'blog', 'show', '', '14', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/download/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-04 17:11:22');
INSERT INTO `_log` VALUES ('984', 'blog', 'track', '', '14', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/about/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-04 17:11:22');
INSERT INTO `_log` VALUES ('985', 'blog', '', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/about/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-04 17:11:24');
INSERT INTO `_log` VALUES ('986', 'blog', 'next', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/blog/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-04 17:11:25');
INSERT INTO `_log` VALUES ('987', 'blog', 'next', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/blog/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-04 17:11:25');
INSERT INTO `_log` VALUES ('988', 'blog', 'next', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/blog/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-04 17:11:25');
INSERT INTO `_log` VALUES ('989', 'blog', 'next', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/blog/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-04 17:11:28');
INSERT INTO `_log` VALUES ('990', 'blog', 'next', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/blog/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-04 17:11:28');
INSERT INTO `_log` VALUES ('991', 'blog', 'next', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/blog/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-04 17:11:30');
INSERT INTO `_log` VALUES ('992', 'blog', 'next', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/blog/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-04 17:11:30');
INSERT INTO `_log` VALUES ('993', 'blog', 'next', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/blog/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-04 17:11:30');
INSERT INTO `_log` VALUES ('994', 'blog', 'next', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/blog/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-04 17:11:36');
INSERT INTO `_log` VALUES ('995', 'blog', 'next', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/blog/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-04 17:11:36');
INSERT INTO `_log` VALUES ('996', 'blog', 'next', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/blog/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-04 17:11:36');
INSERT INTO `_log` VALUES ('997', 'blog', 'next', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/blog/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-04 17:11:36');
INSERT INTO `_log` VALUES ('998', 'blog', 'next', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/blog/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-04 17:11:58');
INSERT INTO `_log` VALUES ('999', 'blog', 'next', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/blog/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-04 17:11:58');
INSERT INTO `_log` VALUES ('1000', 'blog', 'next', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/blog/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-04 17:11:59');
INSERT INTO `_log` VALUES ('1001', 'blog', 'show', '', '25', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/blog/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-04 17:12:05');
INSERT INTO `_log` VALUES ('1002', 'blog', 'track', '', '25', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/blog/hi-pass/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-04 17:12:05');
INSERT INTO `_log` VALUES ('1003', 'blog', 'show', '', '25', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/blog/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-04 17:12:08');
INSERT INTO `_log` VALUES ('1004', 'blog', 'track', '', '25', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/blog/hi-pass/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-04 17:12:08');
INSERT INTO `_log` VALUES ('1005', 'blog', 'show', '', '25', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/blog/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-04 17:12:09');
INSERT INTO `_log` VALUES ('1006', 'blog', 'track', '', '25', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/blog/hi-pass/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-04 17:12:12');
INSERT INTO `_log` VALUES ('1007', 'blog', 'show', '', '39', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/blog/hi-pass/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-04 17:12:22');
INSERT INTO `_log` VALUES ('1008', 'blog', 'track', '', '39', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/blog/nlp/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-04 17:12:22');
INSERT INTO `_log` VALUES ('1009', 'blog', 'track', '', '9', '66.249.73.187', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', 't4t303nucbp9pba2a04smjjbf5', '2013-04-04 17:13:26');
INSERT INTO `_log` VALUES ('1010', 'user', '', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/blog/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-04 17:13:31');
INSERT INTO `_log` VALUES ('1011', 'user', 'logout', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/dashboard/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-04 17:13:36');
INSERT INTO `_log` VALUES ('1012', 'user', 'logout', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/dashboard/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-04 17:13:40');
INSERT INTO `_log` VALUES ('1013', 'user', 'logout', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/dashboard/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-04 17:13:42');
INSERT INTO `_log` VALUES ('1014', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', '00k6lcgkjqhlfabg9u0i1ltkv5', '2013-04-04 17:15:24');
INSERT INTO `_log` VALUES ('1015', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', '5k1b8keptrmn6fu23qn1gdqqr2', '2013-04-04 17:17:56');
INSERT INTO `_log` VALUES ('1016', '', '', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', '', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-04 17:19:04');
INSERT INTO `_log` VALUES ('1017', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', 'pu7ug31pth7kfnv6ok2l1opnv4', '2013-04-04 17:21:20');
INSERT INTO `_log` VALUES ('1018', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', 'bkc9cpe0mfme2h5srlg2sjlol6', '2013-04-04 17:34:30');
INSERT INTO `_log` VALUES ('1019', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', 'cn3pa5gtk9aht0lvme06812fj2', '2013-04-04 17:36:49');
INSERT INTO `_log` VALUES ('1020', '', '', '', '', '213.180.206.205', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots DEV)', '', 'e6vvp21h1hiol93kkhrjnekvr2', '2013-04-04 17:40:57');
INSERT INTO `_log` VALUES ('1021', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', '750echf1m715vp5dhlkec6orr4', '2013-04-04 17:40:59');
INSERT INTO `_log` VALUES ('1022', 'blog', 'track', '', '8', '66.249.73.187', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', 'h44ao321s8vgbr3qlh4httl312', '2013-04-04 17:42:14');
INSERT INTO `_log` VALUES ('1023', '', '', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', '', '0a3e5ecd821a7831933dee62dfd3f3c7', '2013-04-04 17:53:22');
INSERT INTO `_log` VALUES ('1024', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', 'su7jptk2h3tdahf5fhjssoum82', '2013-04-04 17:53:35');
INSERT INTO `_log` VALUES ('1025', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', 'k5thohc9odud8kvh62aelpcd30', '2013-04-04 17:56:17');
INSERT INTO `_log` VALUES ('1026', '', '', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', '', '0a3e5ecd821a7831933dee62dfd3f3c7', '2013-04-04 17:56:20');
INSERT INTO `_log` VALUES ('1027', '', '', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', '', '0a3e5ecd821a7831933dee62dfd3f3c7', '2013-04-04 17:57:32');
INSERT INTO `_log` VALUES ('1028', 'blog', '', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://beta.manti.by/', '0a3e5ecd821a7831933dee62dfd3f3c7', '2013-04-04 17:57:35');
INSERT INTO `_log` VALUES ('1029', 'blog', 'next', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://beta.manti.by/blog/', '0a3e5ecd821a7831933dee62dfd3f3c7', '2013-04-04 17:57:37');
INSERT INTO `_log` VALUES ('1030', 'blog', 'next', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://beta.manti.by/blog/', '0a3e5ecd821a7831933dee62dfd3f3c7', '2013-04-04 17:57:37');
INSERT INTO `_log` VALUES ('1031', 'blog', 'next', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://beta.manti.by/blog/', '0a3e5ecd821a7831933dee62dfd3f3c7', '2013-04-04 17:57:37');
INSERT INTO `_log` VALUES ('1032', 'blog', 'next', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://beta.manti.by/blog/', '0a3e5ecd821a7831933dee62dfd3f3c7', '2013-04-04 17:57:37');
INSERT INTO `_log` VALUES ('1033', 'file', '', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://beta.manti.by/blog/', '0a3e5ecd821a7831933dee62dfd3f3c7', '2013-04-04 17:57:48');
INSERT INTO `_log` VALUES ('1034', 'file', 'track', '', '509', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://beta.manti.by/download/', '0a3e5ecd821a7831933dee62dfd3f3c7', '2013-04-04 17:57:51');
INSERT INTO `_log` VALUES ('1035', 'blog', 'show', '', '14', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://beta.manti.by/download/', '0a3e5ecd821a7831933dee62dfd3f3c7', '2013-04-04 17:57:57');
INSERT INTO `_log` VALUES ('1036', 'blog', 'track', '', '14', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://beta.manti.by/about/', '0a3e5ecd821a7831933dee62dfd3f3c7', '2013-04-04 17:57:57');
INSERT INTO `_log` VALUES ('1037', '', '', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://beta.manti.by/about/', '0a3e5ecd821a7831933dee62dfd3f3c7', '2013-04-04 17:58:02');
INSERT INTO `_log` VALUES ('1038', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', '3p3t90sqtr7rrbs21qsvnokvl1', '2013-04-04 18:00:48');
INSERT INTO `_log` VALUES ('1039', '', '', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', '', '0a3e5ecd821a7831933dee62dfd3f3c7', '2013-04-04 18:05:21');
INSERT INTO `_log` VALUES ('1040', 'blog', 'track', '', '6', '66.249.73.187', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', 'k4fr4cutm6f93tmosohluikgm4', '2013-04-04 18:11:03');
INSERT INTO `_log` VALUES ('1041', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', 'hus0tlncbrk97i0qeln01b7lb1', '2013-04-04 18:12:19');
INSERT INTO `_log` VALUES ('1042', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', 't2vk26kiucomsepedhibkcm9c1', '2013-04-04 18:15:41');
INSERT INTO `_log` VALUES ('1043', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', '0jkeqeena4pl8va9fllele1kh6', '2013-04-04 18:20:00');
INSERT INTO `_log` VALUES ('1044', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots)', '', 'pdrs2bahoor4i87eraeb9u8g41', '2013-04-04 18:20:27');
INSERT INTO `_log` VALUES ('1045', '', '', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/logout/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-04 18:22:52');
INSERT INTO `_log` VALUES ('1046', 'user', '', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-04 18:23:11');
INSERT INTO `_log` VALUES ('1047', '', '', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://manti.by/dashboard/', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-04 18:23:21');
INSERT INTO `_log` VALUES ('1048', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', '0ac6gfcn0jdedkg2shcrto28o5', '2013-04-04 18:31:21');
INSERT INTO `_log` VALUES ('1049', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', 'elf99vjsafr74o4t4c2hfghtl3', '2013-04-04 18:35:07');
INSERT INTO `_log` VALUES ('1050', '', '', '', '', '213.180.206.205', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots DEV)', '', 'fd3lcevc39m92g45snldukfqp6', '2013-04-04 18:38:38');
INSERT INTO `_log` VALUES ('1051', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', 'pbhl8tft9ndabkum21h4m3ah34', '2013-04-04 18:39:14');
INSERT INTO `_log` VALUES ('1052', 'blog', 'track', '', '16', '66.249.73.187', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', 'lj5kgbqsplgk7gkc9tsgjvgnr6', '2013-04-04 18:39:50');
INSERT INTO `_log` VALUES ('1053', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', 'pk78e7gq14qgs1bv36stk2orl4', '2013-04-04 18:50:36');
INSERT INTO `_log` VALUES ('1054', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', '2i4o3j2gtntkv078i0q5627s35', '2013-04-04 18:54:04');
INSERT INTO `_log` VALUES ('1055', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', '9fbabdnsi0fimc3mu882v6vb55', '2013-04-04 18:58:27');
INSERT INTO `_log` VALUES ('1056', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', 'i3oov33g4b9f2pkcjnq983oip2', '2013-04-04 19:09:14');
INSERT INTO `_log` VALUES ('1057', 'blog', 'track', '', '37', '66.249.73.187', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', 'e2pri77tqao1i5f0nlf7gvlvv3', '2013-04-04 19:09:37');
INSERT INTO `_log` VALUES ('1058', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', 'm1pbfbkmqj8h094jld3mb77tt2', '2013-04-04 19:13:05');
INSERT INTO `_log` VALUES ('1059', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', 'fjfqig0t0p1rjtmvkv75iuj8a2', '2013-04-04 19:17:02');
INSERT INTO `_log` VALUES ('1060', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', '7n40nmvlhcls0cvob21db7mv40', '2013-04-04 19:27:28');
INSERT INTO `_log` VALUES ('1061', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', 'rku9ar1h95jd99lnq08ttcmev4', '2013-04-04 19:32:05');
INSERT INTO `_log` VALUES ('1062', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', '971ns7tj1ku455eo9cln4duod6', '2013-04-04 19:36:17');
INSERT INTO `_log` VALUES ('1063', '', '', '', '', '213.180.206.205', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots DEV)', '', '4v2bmmpi95vkv6hg5e3j3hv5b0', '2013-04-04 19:36:27');
INSERT INTO `_log` VALUES ('1064', 'blog', 'track', '', '22', '66.249.73.187', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', '63e4k4kp71afs1fp90tdma6883', '2013-04-04 19:39:22');
INSERT INTO `_log` VALUES ('1065', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', 'ljq4iif1k7pqbrsbipmvsi33b3', '2013-04-04 19:46:17');
INSERT INTO `_log` VALUES ('1066', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', 'fm55scue32cnu7q9vl2nalcgn3', '2013-04-04 19:50:46');
INSERT INTO `_log` VALUES ('1067', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', '72kt26cnogaihr7s60ptsemhn5', '2013-04-04 19:55:40');
INSERT INTO `_log` VALUES ('1068', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', 'jp5jtdqqldqaie864b0bkj5802', '2013-04-04 20:06:03');
INSERT INTO `_log` VALUES ('1069', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', 'g41207ug2a361jpbk3re3405o6', '2013-04-04 20:10:14');
INSERT INTO `_log` VALUES ('1070', 'blog', 'track', '', '14', '66.249.73.187', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', 'i1e5g3oc57ksio6j3sg8371h64', '2013-04-04 20:11:41');
INSERT INTO `_log` VALUES ('1071', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', 'oev1vbbtdr9imtq2c3jhvbqfo0', '2013-04-04 20:14:29');
INSERT INTO `_log` VALUES ('1072', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', 'sq2jdrak2o9eioa18unq415ns0', '2013-04-04 20:25:28');
INSERT INTO `_log` VALUES ('1073', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', 'lid5j2k2pu4ib9701kedbt6fc1', '2013-04-04 20:28:59');
INSERT INTO `_log` VALUES ('1074', '', '', '', '', '213.180.206.205', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots DEV)', '', '9ior59gajkvijchii7ehddup81', '2013-04-04 20:33:14');
INSERT INTO `_log` VALUES ('1075', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', 'jg8cgk55ilqt8vvkscjcd2mou1', '2013-04-04 20:34:11');
INSERT INTO `_log` VALUES ('1076', 'blog', 'track', '', '33', '66.249.73.187', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', '2tpjhvgpfgqm9mudsj8fojmeu1', '2013-04-04 20:35:10');
INSERT INTO `_log` VALUES ('1077', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', 'n7g1mn2al1tsgi4avkl2pf4i41', '2013-04-04 20:44:49');
INSERT INTO `_log` VALUES ('1078', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots)', '', 'sn6splc1vlagr2vbqmtfpf8bq0', '2013-04-04 20:47:55');
INSERT INTO `_log` VALUES ('1079', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', '1ab89394sl4c23gofi80o2l2u2', '2013-04-04 20:48:19');
INSERT INTO `_log` VALUES ('1080', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', 'mg1afi8utk3an3f8seg0vliuf4', '2013-04-04 20:52:59');
INSERT INTO `_log` VALUES ('1081', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', 'jnno2sbokksec3q4uv369irm90', '2013-04-04 21:03:38');
INSERT INTO `_log` VALUES ('1082', 'blog', 'track', '', '34', '66.249.73.187', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', 'giggevudjjj6cpdln3viici711', '2013-04-04 21:04:00');
INSERT INTO `_log` VALUES ('1083', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', '0l7jb6v2g1fl62s2vr2s1quc84', '2013-04-04 21:07:38');
INSERT INTO `_log` VALUES ('1084', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', '2nk6mur0747vhm1bssios5nec5', '2013-04-04 21:12:59');
INSERT INTO `_log` VALUES ('1085', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', '6i0pi4klp5m3626u7j99bulh22', '2013-04-04 21:22:59');
INSERT INTO `_log` VALUES ('1086', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', 'ok25n8k76d82i3eshm1jgj4605', '2013-04-04 21:26:59');
INSERT INTO `_log` VALUES ('1087', '', '', '', '', '213.180.206.205', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots DEV)', '', '9mvap2ge94r9suecq11f4rgbo7', '2013-04-04 21:29:02');
INSERT INTO `_log` VALUES ('1088', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', '7k03opkqbu6skrki4jtl8cv1h1', '2013-04-04 21:32:33');
INSERT INTO `_log` VALUES ('1089', 'blog', 'track', '', '32', '66.249.73.187', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', 'c12qggcvdnjo5ko4ihhlpfvk77', '2013-04-04 21:32:38');
INSERT INTO `_log` VALUES ('1090', '', '', '', '', '93.158.155.137', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots)', '', '8jbnk3pmr72h9ogf2hfeh0akj2', '2013-04-04 21:40:38');
INSERT INTO `_log` VALUES ('1091', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', 'm0uq1lehbeneji6ntl7secv8h6', '2013-04-04 21:42:36');
INSERT INTO `_log` VALUES ('1092', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', '5ku6vqf0svp2kj29t9ih1ku9s1', '2013-04-04 21:46:00');
INSERT INTO `_log` VALUES ('1093', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', 'cgkfhl44s5r08sqanqebireem3', '2013-04-04 21:52:06');
INSERT INTO `_log` VALUES ('1094', 'blog', 'track', '', '40', '66.249.73.187', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', 'ef7smitr3go8nj85fifa2ucbv5', '2013-04-04 22:01:29');
INSERT INTO `_log` VALUES ('1095', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', 'bkibharcmbte6b3nna5jl77bb4', '2013-04-04 22:01:54');
INSERT INTO `_log` VALUES ('1096', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', 'glh0spuq9a8uc9bgs3quf9crd2', '2013-04-04 22:05:36');
INSERT INTO `_log` VALUES ('1097', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', 'a1ru2nbukurqv4al2dmrvb9o76', '2013-04-04 22:11:44');
INSERT INTO `_log` VALUES ('1098', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', 'b0ukuvho598emqsh07i85b4gm1', '2013-04-04 22:20:34');
INSERT INTO `_log` VALUES ('1099', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', 'sr5jkqvm8on48d5k4qb6o0va44', '2013-04-04 22:23:49');
INSERT INTO `_log` VALUES ('1100', '', '', '', '', '213.180.206.205', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots DEV)', '', '5vca5lc2p8g83tgdtla9pl5i52', '2013-04-04 22:25:04');
INSERT INTO `_log` VALUES ('1101', 'blog', 'track', '', '36', '66.249.73.187', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', '5knqon9flbrmjna403vnbm1ks0', '2013-04-04 22:30:15');
INSERT INTO `_log` VALUES ('1102', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', 'r97t4hisj52tcd7rcdlf7m1vh1', '2013-04-04 22:31:05');
INSERT INTO `_log` VALUES ('1103', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', 'car9ppldq544ejhvqlna0paeu3', '2013-04-04 22:39:39');
INSERT INTO `_log` VALUES ('1104', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', 't8uu8ll75vor5sfmb94f0v47e7', '2013-04-04 22:43:46');
INSERT INTO `_log` VALUES ('1105', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', '7i3ktshc23vh5pfqdtb7cjao22', '2013-04-04 22:50:19');
INSERT INTO `_log` VALUES ('1106', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots)', '', 'd4vf4p96kjucrq9anmeu2v2f61', '2013-04-04 22:51:37');
INSERT INTO `_log` VALUES ('1107', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', 'ubrvql7hu4a6ebbjd38q435gb6', '2013-04-04 22:58:40');
INSERT INTO `_log` VALUES ('1108', 'blog', 'track', '', '39', '66.249.73.187', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', 't7dt6spup1lvmpurovm2nccog1', '2013-04-04 22:59:03');
INSERT INTO `_log` VALUES ('1109', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', '81apbkamqgfsfvmb7jsjvlim92', '2013-04-04 23:03:16');
INSERT INTO `_log` VALUES ('1110', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', '4nd1adgmv1hnuk2dfpmdqtnlv3', '2013-04-04 23:10:07');
INSERT INTO `_log` VALUES ('1111', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', '7b9scbtbfhmc2l1jtt8f0aqhb7', '2013-04-04 23:17:28');
INSERT INTO `_log` VALUES ('1112', '', '', '', '', '213.180.206.205', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots DEV)', '', 'ovb1lvghoe962rem3dnnsoh953', '2013-04-04 23:19:44');
INSERT INTO `_log` VALUES ('1113', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', '3rguu8rk0dshtscvdvb817quu5', '2013-04-04 23:22:16');
INSERT INTO `_log` VALUES ('1114', 'blog', 'track', '', '38', '66.249.73.187', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', '51q9g2t5s8plchcp2tfst5mce7', '2013-04-04 23:28:30');
INSERT INTO `_log` VALUES ('1115', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', 'rmtv86m4a8377qlkfir3u9j034', '2013-04-04 23:29:03');
INSERT INTO `_log` VALUES ('1116', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', 'ev9c3t4h3fi0930ue5ohlch4m1', '2013-04-04 23:37:11');
INSERT INTO `_log` VALUES ('1117', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', 'gd1qaa1rbqankur39tvqrm4ej7', '2013-04-04 23:41:13');
INSERT INTO `_log` VALUES ('1118', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', 'p7nfva3ad7mce43fiu9edgbqn0', '2013-04-04 23:47:58');
INSERT INTO `_log` VALUES ('1119', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', 'b6er07cpa6j08or2k9ufm1o112', '2013-04-04 23:56:36');
INSERT INTO `_log` VALUES ('1120', 'blog', 'track', '', '35', '66.249.73.187', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', 'ddpgv5m27ge3dtacv44nhsqmn1', '2013-04-04 23:58:53');
INSERT INTO `_log` VALUES ('1121', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', 'tg1inn0bq9j3s30u66rifl49v0', '2013-04-04 23:59:41');
INSERT INTO `_log` VALUES ('1122', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', 'p343kmdl7uraj3e4371g1dbib3', '2013-04-05 00:07:08');
INSERT INTO `_log` VALUES ('1123', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', '5o8k234nu8kntssd0m1rcj4nv0', '2013-04-05 00:15:42');
INSERT INTO `_log` VALUES ('1124', '', '', '', '', '213.180.206.205', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots DEV)', '', '5gqght500gl5l2eff12a8au3d3', '2013-04-05 00:16:14');
INSERT INTO `_log` VALUES ('1125', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', 'cmbu8r8lman08j91i30r71kdu7', '2013-04-05 00:18:39');
INSERT INTO `_log` VALUES ('1126', 'tag', 'search', '', '51', '66.249.73.187', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', 'j4cv30nvclscpo48ren6ueotl0', '2013-04-05 00:20:34');
INSERT INTO `_log` VALUES ('1127', 'tag', 'search', '', '45', '66.249.73.187', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', '56sgkebtncpm1mule1rrnkodu6', '2013-04-05 00:23:14');
INSERT INTO `_log` VALUES ('1128', 'tag', 'search', '', '41', '66.249.73.187', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', 'vqj3a1dphouv0j3qa57ptu0ve3', '2013-04-05 00:25:55');
INSERT INTO `_log` VALUES ('1129', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', 'eko9s76qi5ibuke5kqdgfoand3', '2013-04-05 00:26:07');
INSERT INTO `_log` VALUES ('1130', 'tag', 'search', '', '66', '66.249.73.187', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', 'n7ou1qetambpq8td1ssffi4tu5', '2013-04-05 00:29:12');
INSERT INTO `_log` VALUES ('1131', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', '7qe7vn8bn09k0vkc3dphms5i06', '2013-04-05 00:34:24');
INSERT INTO `_log` VALUES ('1132', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', 'b7iqismtho6cccmshc1hfdgjb6', '2013-04-05 00:37:51');
INSERT INTO `_log` VALUES ('1133', 'tag', 'search', '', '62', '66.249.73.187', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', '6bsclj28co8j0vea0f9ougaei7', '2013-04-05 00:45:01');
INSERT INTO `_log` VALUES ('1134', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', 'rbmlq922d03179977m7h83ndn2', '2013-04-05 00:46:00');
INSERT INTO `_log` VALUES ('1135', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', 'd7legvahpd7rcp1s7kldqri123', '2013-04-05 00:54:01');
INSERT INTO `_log` VALUES ('1136', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', 'bmhidk1qbvii3hdmqoql8af5e1', '2013-04-05 00:56:34');
INSERT INTO `_log` VALUES ('1137', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', 'rblltoadbhi5bec54eqsnhtnh6', '2013-04-05 01:04:18');
INSERT INTO `_log` VALUES ('1138', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', 'g3e2n78hbo82pjf9ljf9fhln84', '2013-04-05 01:12:53');
INSERT INTO `_log` VALUES ('1139', '', '', '', '', '213.180.206.205', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots DEV)', '', 'lnqhdne55ebtuqf65s0dhnm262', '2013-04-05 01:13:12');
INSERT INTO `_log` VALUES ('1140', 'tag', 'search', '', '35', '66.249.73.187', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', '482sen0opejbmk0brf65b2jbl7', '2013-04-05 01:13:49');
INSERT INTO `_log` VALUES ('1141', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', 'om4e9ql360psom6urbinoru8s4', '2013-04-05 01:15:11');
INSERT INTO `_log` VALUES ('1142', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', 'g934bet51n5r60umkbj3fm2f61', '2013-04-05 01:23:38');
INSERT INTO `_log` VALUES ('1143', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', '39meukvrk2npjm62d3649i5683', '2013-04-05 01:32:04');
INSERT INTO `_log` VALUES ('1144', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', 'uj9heqtg9n8qec9pbc4m6koik4', '2013-04-05 01:34:50');
INSERT INTO `_log` VALUES ('1145', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots)', '', '8ecevglpdp2v12ov5n3m0bca65', '2013-04-05 01:39:25');
INSERT INTO `_log` VALUES ('1146', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', 'iq6agl11bmrkm9utfgtdnv0e27', '2013-04-05 01:42:15');
INSERT INTO `_log` VALUES ('1147', 'tag', 'search', '', '64', '66.249.73.187', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', 'lhl6mme2hug0es11afpbqf1qa1', '2013-04-05 01:42:37');
INSERT INTO `_log` VALUES ('1148', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', 'ckr7dm1nipruhhjmknf08ur2j6', '2013-04-05 01:51:02');
INSERT INTO `_log` VALUES ('1149', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', 't0jqe80fnrrtmhfhft7vk0dcv0', '2013-04-05 01:53:34');
INSERT INTO `_log` VALUES ('1150', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', 'tgcmcdrq5cij840din33lkp495', '2013-04-05 02:02:03');
INSERT INTO `_log` VALUES ('1151', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', 'rj7rh48n6f5u71n78pmceuhs81', '2013-04-05 02:10:24');
INSERT INTO `_log` VALUES ('1152', '', '', '', '', '213.180.206.205', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots DEV)', '', 'q9d13jkl4h844vipgjnsgp6fn4', '2013-04-05 02:10:38');
INSERT INTO `_log` VALUES ('1153', '', '', '', '', '77.88.22.3', 'Mozilla/5.0 (compatible; YandexBot/3.0; +http://yandex.com/bots)', '', 'lvhvfphq13rccfq0viq23kjko3', '2013-04-05 02:11:09');
INSERT INTO `_log` VALUES ('1154', 'tag', 'search', '', '57', '66.249.73.187', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', 's4d4h72fro0duq5lqt3227olk2', '2013-04-05 02:11:42');
INSERT INTO `_log` VALUES ('1155', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', 'herb9g5j1epdc6v8s41hnpuoh4', '2013-04-05 02:12:05');
INSERT INTO `_log` VALUES ('1156', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', 'edufvv9062h5r5i1miudrpeiq4', '2013-04-05 02:21:10');
INSERT INTO `_log` VALUES ('1157', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', 'm10prb8oanvko2mjhr7dd8mvd2', '2013-04-05 02:29:30');
INSERT INTO `_log` VALUES ('1158', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', 'fmktirh7obq36rpvsajtvljpm7', '2013-04-05 02:32:17');
INSERT INTO `_log` VALUES ('1159', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', '1a439i1mktjqhm4rtnf8rmiuo2', '2013-04-05 02:40:04');
INSERT INTO `_log` VALUES ('1160', 'tag', 'search', '', '40', '66.249.73.187', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', 'vier8sv99ut7p0laoqdrj8bm05', '2013-04-05 02:41:23');
INSERT INTO `_log` VALUES ('1161', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', 'pru31ninf78r05chdot90n9553', '2013-04-05 02:48:25');
INSERT INTO `_log` VALUES ('1162', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', 'l6lfi133ki7o2vpqdjl9ol8hp2', '2013-04-05 02:50:56');
INSERT INTO `_log` VALUES ('1163', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', '7vevg2rpukpfp85c9runn1v6g1', '2013-04-05 02:59:13');
INSERT INTO `_log` VALUES ('1164', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', 'j8ed5cit64he6umhemve4r01q5', '2013-04-05 03:06:49');
INSERT INTO `_log` VALUES ('1165', '', '', '', '', '213.180.206.205', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots DEV)', '', 'tep1fesdddihkrma654e8dgn15', '2013-04-05 03:07:12');
INSERT INTO `_log` VALUES ('1166', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', 'du9hdvussjj6tl2ie2b47t7lm6', '2013-04-05 03:10:32');
INSERT INTO `_log` VALUES ('1167', 'tag', 'search', '', '60', '66.249.73.187', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', 'qpsgrvecee9umjtrkce4q5sim0', '2013-04-05 03:11:35');
INSERT INTO `_log` VALUES ('1168', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', 'kq57387aqgbmu6piqucvkghg11', '2013-04-05 03:18:44');
INSERT INTO `_log` VALUES ('1169', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', 'udm9fsev3b7h7q0aas4sloibj3', '2013-04-05 03:25:48');
INSERT INTO `_log` VALUES ('1170', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', '93g0npo86hvbtg5pcmfpau2vc7', '2013-04-05 03:29:33');
INSERT INTO `_log` VALUES ('1171', 'blog', 'show', '', '28', '66.249.73.187', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', '6o8okt9vs8g8546acph0q3juj7', '2013-04-05 03:29:38');
INSERT INTO `_log` VALUES ('1172', 'blog', 'show', '', '29', '66.249.73.187', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', 'rhek5reoegfh3q5ighht8ptbc0', '2013-04-05 03:30:09');
INSERT INTO `_log` VALUES ('1173', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', 'v146li5ng06n2j9fd3khadvl85', '2013-04-05 03:37:33');
INSERT INTO `_log` VALUES ('1174', 'tag', 'search', '', '71', '66.249.73.187', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', 'l9pnde43e5rv7crdimrkd4vt95', '2013-04-05 03:40:30');
INSERT INTO `_log` VALUES ('1175', 'blog', 'track', '', '29', '66.249.73.187', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', 'f90sladf8mslmh4uiqj6i31ct7', '2013-04-05 03:42:49');
INSERT INTO `_log` VALUES ('1176', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', 'imbu50aqiq9a6plju2vahdmg62', '2013-04-05 03:44:54');
INSERT INTO `_log` VALUES ('1177', 'tag', 'search', '', '63', '66.249.73.187', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', '0pjl3mch8bm90bvgvhuf15utr3', '2013-04-05 03:47:38');
INSERT INTO `_log` VALUES ('1178', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', 'ujd01leblfot4kgmji1kfo41d2', '2013-04-05 03:48:40');
INSERT INTO `_log` VALUES ('1179', 'tag', 'search', '', '67', '66.249.73.187', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', '4biqo7qvkk6kgg42qfavt5uno5', '2013-04-05 03:49:35');
INSERT INTO `_log` VALUES ('1180', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots)', '', 'f9cleiardikf59ptf1h6jposv6', '2013-04-05 03:49:52');
INSERT INTO `_log` VALUES ('1181', 'blog', 'track', '', '28', '66.249.73.187', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', 'te8f4anoa042d0flaapr74teo3', '2013-04-05 03:51:41');
INSERT INTO `_log` VALUES ('1182', 'blog', 'show', '', '27', '66.249.73.187', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', 'ksstsv79lve3okl3kknato80i1', '2013-04-05 03:52:34');
INSERT INTO `_log` VALUES ('1183', 'tag', 'search', '', '58', '66.249.73.187', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', 'b644crbhs2n267vqb1a0td0pi3', '2013-04-05 03:56:50');
INSERT INTO `_log` VALUES ('1184', 'blog', 'show', '', '26', '66.249.73.187', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', '9tklmo1q391agl25nig0i9tgv2', '2013-04-05 03:56:51');
INSERT INTO `_log` VALUES ('1185', 'tag', 'search', '', '59', '66.249.73.187', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', 'b2da851vt8v83na3i6sibj5u70', '2013-04-05 03:57:20');
INSERT INTO `_log` VALUES ('1186', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', 'rfi1anh8ltd5haj5k77ttf6va3', '2013-04-05 03:57:21');
INSERT INTO `_log` VALUES ('1187', '', '', '', '', '213.180.206.205', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots DEV)', '', 'a8jmj65n3po6cip8ofvm21sq95', '2013-04-05 04:04:01');
INSERT INTO `_log` VALUES ('1188', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', 'p8vv4jt7v9kv9qe830uhn6gpl7', '2013-04-05 04:04:11');
INSERT INTO `_log` VALUES ('1189', 'blog', 'show', '', '30', '66.249.73.187', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', '896evcu61cvd8n53106vm9k532', '2013-04-05 04:04:26');
INSERT INTO `_log` VALUES ('1190', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', '1bv76cvpthhm9rvf5pha0q0u07', '2013-04-05 04:07:40');
INSERT INTO `_log` VALUES ('1191', 'blog', 'track', '', '30', '66.249.73.187', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', 'tusn52ugt368nlrairaom9d7o4', '2013-04-05 04:10:38');
INSERT INTO `_log` VALUES ('1192', 'tag', 'search', '', '25', '66.249.73.187', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', '442e1sp53f74tu3cbacedekjl3', '2013-04-05 04:11:25');
INSERT INTO `_log` VALUES ('1193', 'blog', 'track', '', '27', '66.249.73.187', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', '3t0ije11fqs0p59h672tv342a0', '2013-04-05 04:12:17');
INSERT INTO `_log` VALUES ('1194', 'tag', 'search', '', '68', '66.249.73.187', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', 'g2o10n6ibd0i031vcj7ne4ks02', '2013-04-05 04:13:46');
INSERT INTO `_log` VALUES ('1195', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', '0hhet9jts2400de8lm7h50ere0', '2013-04-05 04:17:02');
INSERT INTO `_log` VALUES ('1196', 'blog', 'track', '', '26', '66.249.73.187', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', 'aqk6baetn54kfeal7tg722f4k6', '2013-04-05 04:22:09');
INSERT INTO `_log` VALUES ('1197', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', '9bbq53co8ivv2laekcle29vsn3', '2013-04-05 04:22:36');
INSERT INTO `_log` VALUES ('1198', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', 'otuvhqu5s6524p6rdlrsv29kf3', '2013-04-05 04:27:05');
INSERT INTO `_log` VALUES ('1199', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', 'utv4stu3uo3bua7vjvrghij3i7', '2013-04-05 04:36:06');
INSERT INTO `_log` VALUES ('1200', 'tag', 'search', '', '33', '66.249.73.187', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', 'kl1on3ag7v3k0l64nn4tvj81b4', '2013-04-05 04:40:55');
INSERT INTO `_log` VALUES ('1201', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', 'uct9bvd6rt7plonimbrj78st47', '2013-04-05 04:41:51');
INSERT INTO `_log` VALUES ('1202', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', 'p7jtmpveqn5vl353f9er3dfo91', '2013-04-05 04:45:56');
INSERT INTO `_log` VALUES ('1203', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', 'kqpba9mcjubbdursor3jtmsdb1', '2013-04-05 04:55:53');
INSERT INTO `_log` VALUES ('1204', '', '', '', '', '213.180.206.205', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots DEV)', '', '6aj93s7og1l7ilsdkofsl2nm00', '2013-04-05 05:00:10');
INSERT INTO `_log` VALUES ('1205', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', 'pteg3r6k6gtv5ss3jdcn2e37i0', '2013-04-05 05:00:47');
INSERT INTO `_log` VALUES ('1206', 'file', 'track', '', '', '66.249.73.187', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', '8s930f1gegog36um06aat19vn7', '2013-04-05 05:04:13');
INSERT INTO `_log` VALUES ('1207', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', '022e3v6pgtavnjlvbd4oc1tge3', '2013-04-05 05:04:24');
INSERT INTO `_log` VALUES ('1208', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', '512rik6394oaf3tdlj8dhj4l16', '2013-04-05 05:14:33');
INSERT INTO `_log` VALUES ('1209', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', '42u3shiedouqd9eu1s1r88rsq0', '2013-04-05 05:19:50');
INSERT INTO `_log` VALUES ('1210', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', '9c22jseo5svtqsjh0mpq8ig1j7', '2013-04-05 05:24:17');
INSERT INTO `_log` VALUES ('1211', 'tag', 'search', '', '56', '66.249.73.187', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', 'ejpk7mkhsbncpebmf0n0op8176', '2013-04-05 05:33:01');
INSERT INTO `_log` VALUES ('1212', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', 'v300t5lmuhiq6ahsdlken8c875', '2013-04-05 05:33:11');
INSERT INTO `_log` VALUES ('1213', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', 'tc909fqh87crib1ef4rh2tmhi3', '2013-04-05 05:38:36');
INSERT INTO `_log` VALUES ('1214', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', '2lv7p20v7e1sd3rt8ktj0tsl12', '2013-04-05 05:44:03');
INSERT INTO `_log` VALUES ('1215', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', '41d5va75qomc2m7tcovk95cm20', '2013-04-05 05:52:45');
INSERT INTO `_log` VALUES ('1216', '', '', '', '', '213.180.206.205', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots DEV)', '', 'h1lkitq6li9ku341ge8ehkje30', '2013-04-05 05:55:31');
INSERT INTO `_log` VALUES ('1217', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', 'np97d3ektk7pi6dubphg7odbc6', '2013-04-05 05:58:20');
INSERT INTO `_log` VALUES ('1218', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots)', '', '9ia1l219dhhrnndt0l8bnvj112', '2013-04-05 06:00:33');
INSERT INTO `_log` VALUES ('1219', 'gallery', 'prev', '', '', '66.249.73.187', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', 'v8cfgt2ifgokt1f0girfomfgo0', '2013-04-05 06:01:49');
INSERT INTO `_log` VALUES ('1220', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', '6j7o6cbsp6frihjld18ljs7ar2', '2013-04-05 06:03:13');
INSERT INTO `_log` VALUES ('1221', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', 'poc3ovqn0e0148dev4udce32c0', '2013-04-05 06:11:11');
INSERT INTO `_log` VALUES ('1222', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', 'b9q8ao9b1e7hu1b947tpnp9nt7', '2013-04-05 06:17:55');
INSERT INTO `_log` VALUES ('1223', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', 'u8d5usknv3kfdvr0vfgj28oc33', '2013-04-05 06:21:34');
INSERT INTO `_log` VALUES ('1224', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', 'm7sf93v41utsi88a95b4d18pe3', '2013-04-05 06:30:09');
INSERT INTO `_log` VALUES ('1225', 'tag', 'search', '', '69', '66.249.73.187', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', 'gig8l5kt8340hqcn31kdaj8b63', '2013-04-05 06:30:38');
INSERT INTO `_log` VALUES ('1226', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', '022e5b258tkpskmsjqmi6cg7o4', '2013-04-05 06:37:03');
INSERT INTO `_log` VALUES ('1227', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', 'ub3uuj695fgdtlrfuacvduf8r1', '2013-04-05 06:40:16');
INSERT INTO `_log` VALUES ('1228', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', 'v0k5eputbgprbvvnnqos81d280', '2013-04-05 06:49:41');
INSERT INTO `_log` VALUES ('1229', '', '', '', '', '213.180.206.205', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots DEV)', '', 'a7qgj5v6hs8ki7rvdpvco1ms67', '2013-04-05 06:51:12');
INSERT INTO `_log` VALUES ('1230', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', 't2hn61m1qdgsm2sv96mkjuagg4', '2013-04-05 06:56:11');
INSERT INTO `_log` VALUES ('1231', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', '9n9p9hnu3fnju99t9r6ap4obc4', '2013-04-05 06:59:14');
INSERT INTO `_log` VALUES ('1232', 'gallery', 'next', '', '', '66.249.73.187', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', 'g5vmchnudthbgcodigjqcuv761', '2013-04-05 07:01:22');
INSERT INTO `_log` VALUES ('1233', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', '5k48rkq2uo88s69st55a0o4ia6', '2013-04-05 07:08:49');
INSERT INTO `_log` VALUES ('1234', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', '4cuhi8fbd1je70dapifh0e6ad4', '2013-04-05 07:14:47');
INSERT INTO `_log` VALUES ('1235', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', 'porn8u3fllhndomah8p1mh4bj6', '2013-04-05 07:19:16');
INSERT INTO `_log` VALUES ('1236', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', 'bi928gj5b5ne9d4cgr5760mq43', '2013-04-05 07:27:49');
INSERT INTO `_log` VALUES ('1237', 'tag', 'search', '', '39', '66.249.73.187', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', 'ardv5rv03rcod6kafhm3lm9014', '2013-04-05 07:30:15');
INSERT INTO `_log` VALUES ('1238', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', '26eldhmmrc71q6pmqvl7k4s5o1', '2013-04-05 07:34:20');
INSERT INTO `_log` VALUES ('1239', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', '85pv27t55gj78c9v97g9ig8oe3', '2013-04-05 07:37:51');
INSERT INTO `_log` VALUES ('1240', '', '', '', '', '213.180.206.205', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots DEV)', '', '6m8k851d4vtfvtr4ui0t4d3f96', '2013-04-05 07:45:49');
INSERT INTO `_log` VALUES ('1241', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', 'ne8kmqjb61m9glmuhvfbjpjo14', '2013-04-05 07:47:37');
INSERT INTO `_log` VALUES ('1242', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', '5o023fc4l2591jc0epm7tu73h6', '2013-04-05 07:53:31');
INSERT INTO `_log` VALUES ('1243', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots)', '', '60sogetau79al6p2vth2np0og4', '2013-04-05 07:54:32');
INSERT INTO `_log` VALUES ('1244', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', '0fu728tbptrsmonpob5vdoiuo0', '2013-04-05 07:56:51');
INSERT INTO `_log` VALUES ('1245', 'gallery', 'track', '', '', '66.249.73.187', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', '83jaln29qq40vu3g7kui52s380', '2013-04-05 08:01:35');
INSERT INTO `_log` VALUES ('1246', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', '4lnb5erg6ra7oqlogqsm531r62', '2013-04-05 08:06:13');
INSERT INTO `_log` VALUES ('1247', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', 'ftc6mvith5hf2s1gn1n3qkd117', '2013-04-05 08:12:55');
INSERT INTO `_log` VALUES ('1248', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', '89c84i161efjd5u8nf04d552v3', '2013-04-05 08:15:59');
INSERT INTO `_log` VALUES ('1249', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', 'g3hmbhfdt27ffku2uurhdijrv1', '2013-04-05 08:25:49');
INSERT INTO `_log` VALUES ('1250', 'tag', 'search', '', '32', '66.249.73.187', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', '72au9lfd13fvau098siq6adfe6', '2013-04-05 08:30:37');
INSERT INTO `_log` VALUES ('1251', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', 'cu4fk8f8ke70dgfkbvikcr9j07', '2013-04-05 08:32:12');
INSERT INTO `_log` VALUES ('1252', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', 'fbal7uu181hv8skupa3a2hrid7', '2013-04-05 08:35:07');
INSERT INTO `_log` VALUES ('1253', '', '', '', '', '213.180.206.205', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots DEV)', '', 'stc39ce2lrv8mds3l3cklvjdq0', '2013-04-05 08:42:24');
INSERT INTO `_log` VALUES ('1254', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', '3dfn1s6ihuj63akb375pe725a2', '2013-04-05 08:45:12');
INSERT INTO `_log` VALUES ('1255', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', '24gaq6erh8b0s45h8utnc3vth0', '2013-04-05 08:51:32');
INSERT INTO `_log` VALUES ('1256', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', 'od9h53louqh3cegq264l433hv7', '2013-04-05 08:54:37');
INSERT INTO `_log` VALUES ('1257', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', 'vtfft6dn1asjncs9bpjdcg61d7', '2013-04-05 09:04:45');
INSERT INTO `_log` VALUES ('1258', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', '9jd1pvsgbicnu3gtctltknk1k4', '2013-04-05 09:10:49');
INSERT INTO `_log` VALUES ('1259', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', '0que5bja56a7ucsuheudc7vgq2', '2013-04-05 09:13:27');
INSERT INTO `_log` VALUES ('1260', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', '9ek5q50efci00kq973m40nbld1', '2013-04-05 09:23:43');
INSERT INTO `_log` VALUES ('1261', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', 'pri6im82b6p8ie6takiid5evo1', '2013-04-05 09:29:57');
INSERT INTO `_log` VALUES ('1262', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', 'g6vv4938lt1n1be6et4j8fraa7', '2013-04-05 09:32:26');
INSERT INTO `_log` VALUES ('1263', '', '', '', '', '213.180.206.205', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots DEV)', '', 'k9urv5au5eonhjv83doqjsr2d4', '2013-04-05 09:37:21');
INSERT INTO `_log` VALUES ('1264', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', '20aolfee1darl6dm3qic4kl800', '2013-04-05 09:42:10');
INSERT INTO `_log` VALUES ('1265', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', '3op6coeubnqj2l5vrc2qcmkm97', '2013-04-05 09:48:45');
INSERT INTO `_log` VALUES ('1266', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots)', '', '3tqjcinpo1sgnc9hv3hntduc34', '2013-04-05 09:49:27');
INSERT INTO `_log` VALUES ('1267', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', 'rc0div7g25dog1i32hdsh2bg53', '2013-04-05 09:51:22');
INSERT INTO `_log` VALUES ('1268', 'tag', 'search', '', '34', '66.249.73.187', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', 'oaohvrddljh35a6ar814fhtfh4', '2013-04-05 09:52:14');
INSERT INTO `_log` VALUES ('1269', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', 'ovn6g0049j9qphhg3rjtjmntb7', '2013-04-05 10:01:49');
INSERT INTO `_log` VALUES ('1270', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', 'lt3cknjalc180agk04rpsg8p00', '2013-04-05 10:08:33');
INSERT INTO `_log` VALUES ('1271', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', 'itongd4l52f44nt6obuvtg7qb6', '2013-04-05 10:11:06');
INSERT INTO `_log` VALUES ('1272', 'tag', 'search', '', '50', '66.249.73.187', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', 'faogrpcsvq7pdcv93rrobeqlf5', '2013-04-05 10:21:01');
INSERT INTO `_log` VALUES ('1273', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', 'j9q83edscbah7ps4p7h7bnr0s6', '2013-04-05 10:21:03');
INSERT INTO `_log` VALUES ('1274', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', '4et5g90qnn4dj53bgipj9arej1', '2013-04-05 10:27:24');
INSERT INTO `_log` VALUES ('1275', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', 'm9b3aosvphpcg5229128nbafb0', '2013-04-05 10:30:11');
INSERT INTO `_log` VALUES ('1276', '', '', '', '', '213.180.206.205', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots DEV)', '', '0npmheh3ujssnv7boq7lsusoc3', '2013-04-05 10:34:37');
INSERT INTO `_log` VALUES ('1277', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', '1h85mbidgimapu3tp13pgpmio4', '2013-04-05 10:40:21');
INSERT INTO `_log` VALUES ('1278', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', '9moku5ui1bbor3cu9bat6r9b33', '2013-04-05 10:46:18');
INSERT INTO `_log` VALUES ('1279', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', 'rhhm773n3kfv7bdg742nhmpa20', '2013-04-05 10:49:30');
INSERT INTO `_log` VALUES ('1280', 'tag', 'search', '', '55', '66.249.73.187', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', '5ttsvomjp9nkg93g5q4aqdjju0', '2013-04-05 10:50:46');
INSERT INTO `_log` VALUES ('1281', '', '', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', '', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-05 10:58:32');
INSERT INTO `_log` VALUES ('1282', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', 'rke0tv7g649eti99qa9lv0q455', '2013-04-05 10:59:43');
INSERT INTO `_log` VALUES ('1283', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', '77mcsl7fjvpjgbkua5sjteoum7', '2013-04-05 11:06:12');
INSERT INTO `_log` VALUES ('1284', '', '', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', '', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-05 11:07:25');
INSERT INTO `_log` VALUES ('1285', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', 'u86d9k2bcqrstngl8q9b2kut67', '2013-04-05 11:08:26');
INSERT INTO `_log` VALUES ('1286', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', 'g218ubdk43j3op8ggrr04bt7e0', '2013-04-05 11:19:03');
INSERT INTO `_log` VALUES ('1287', 'tag', 'search', '', '70', '66.249.73.187', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '', 'nvvpt9pfa89l924d1a732h7e16', '2013-04-05 11:20:46');
INSERT INTO `_log` VALUES ('1288', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', 'f1h1ajfqvk8a357s34lgq6t633', '2013-04-05 11:25:15');
INSERT INTO `_log` VALUES ('1289', '', '', '', '', '95.108.129.207', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon1)', '', '2bavstujpp578fk68qm9rjffm7', '2013-04-05 11:27:40');
INSERT INTO `_log` VALUES ('1290', '', '', '', '', '77.88.31.246', 'Mozilla/5.0 (compatible; YandexBot/3.0; +http://yandex.com/bots)', '', '0kjuqpfij4j1kgrtqd7oe21v81', '2013-04-05 11:27:48');
INSERT INTO `_log` VALUES ('1291', '', '', '', '', '213.180.206.205', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots DEV)', '', 'n9bula1nl6ebe7ngvkj60m27a0', '2013-04-05 11:32:03');
INSERT INTO `_log` VALUES ('1292', '', '', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', '', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-05 11:36:59');
INSERT INTO `_log` VALUES ('1293', '', '', '', '', '213.180.206.197', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon2)', '', 'k1h6o6iun35qq2k3l4109cjo37', '2013-04-05 11:38:24');
INSERT INTO `_log` VALUES ('1294', '', '', '', '', '86.57.158.234', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', '', '79jtl0cbj5o850ombd8bkskqs6', '2013-04-05 11:43:12');
INSERT INTO `_log` VALUES ('1295', '', '', '', '', '5.255.210.95', 'Mozilla/5.0 (compatible; YandexMetrika/2.0; +http://yandex.com/bots mon3)', '', 'jqidsfn5pc9nkgpkf6e9mo0bf0', '2013-04-05 11:43:42');
INSERT INTO `_log` VALUES ('1296', '', '', '', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', '', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 10:53:26');
INSERT INTO `_log` VALUES ('1297', '', '', '', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:14.0) Gecko/20100101 Firefox/14.0.1', '', '2pijf536cd06pmoae4irh2h8n5', '2013-04-05 10:54:58');
INSERT INTO `_log` VALUES ('1298', '', '', '', '', '127.0.0.1', 'Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 6.1; WOW64; Trident/6.0)', '', 'k12h2iaoo0vh6olk63m4d44k71', '2013-04-05 10:55:17');
INSERT INTO `_log` VALUES ('1299', '', '', '', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', '', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 10:56:29');
INSERT INTO `_log` VALUES ('1300', 'gallery', '', '', '', '127.0.0.1', 'Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 6.1; WOW64; Trident/6.0)', 'http://m2.local/', 'k12h2iaoo0vh6olk63m4d44k71', '2013-04-05 11:01:47');
INSERT INTO `_log` VALUES ('1301', '', '', '', '', '127.0.0.1', 'Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 6.1; WOW64; Trident/6.0)', 'http://m2.local/gallery/', 'k12h2iaoo0vh6olk63m4d44k71', '2013-04-05 11:01:52');
INSERT INTO `_log` VALUES ('1302', '', '', '', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', '', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:02:41');
INSERT INTO `_log` VALUES ('1303', '', '', '', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', '', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:03:09');
INSERT INTO `_log` VALUES ('1304', '', '', '', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', '', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:04:02');
INSERT INTO `_log` VALUES ('1305', '', '', '', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', '', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:06:09');
INSERT INTO `_log` VALUES ('1306', '', '', '', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', '', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:06:55');
INSERT INTO `_log` VALUES ('1307', '', '', '', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', '', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:08:58');
INSERT INTO `_log` VALUES ('1308', '', '', '', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', '', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:09:35');
INSERT INTO `_log` VALUES ('1309', '', '', '', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', '', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:10:45');
INSERT INTO `_log` VALUES ('1310', '', '', '', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', '', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:11:35');
INSERT INTO `_log` VALUES ('1311', '', '', '', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', '', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:11:56');
INSERT INTO `_log` VALUES ('1312', '', '', '', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', '', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:12:39');
INSERT INTO `_log` VALUES ('1313', '', '', '', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', '', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:14:03');
INSERT INTO `_log` VALUES ('1314', '', '', '', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', '', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:17:27');
INSERT INTO `_log` VALUES ('1315', '', '', '', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', '', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:19:06');
INSERT INTO `_log` VALUES ('1316', '', '', '', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', '', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:19:18');
INSERT INTO `_log` VALUES ('1317', '', '', '', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', '', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:19:44');
INSERT INTO `_log` VALUES ('1318', 'blog', 'show', '', '33', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:19:51');
INSERT INTO `_log` VALUES ('1319', 'blog', 'track', '', '33', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/blog/renaissance/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:19:51');
INSERT INTO `_log` VALUES ('1320', '', '', '', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/blog/renaissance/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:20:08');
INSERT INTO `_log` VALUES ('1321', '', '', '', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/blog/renaissance/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:23:38');
INSERT INTO `_log` VALUES ('1322', 'blog', 'show', '', '37', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:24:00');
INSERT INTO `_log` VALUES ('1323', 'blog', 'track', '', '37', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/blog/stockholm-syndrome-backset/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:24:00');
INSERT INTO `_log` VALUES ('1324', '', '', '', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/blog/renaissance/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:24:32');
INSERT INTO `_log` VALUES ('1325', '', '', '', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/blog/renaissance/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:24:39');
INSERT INTO `_log` VALUES ('1326', '', '', '', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/blog/renaissance/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:25:02');
INSERT INTO `_log` VALUES ('1327', 'blog', 'show', '', '9', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:25:22');
INSERT INTO `_log` VALUES ('1328', 'blog', 'track', '', '9', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/blog/katana/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:25:23');
INSERT INTO `_log` VALUES ('1329', 'blog', 'edit', '', '9', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/blog/katana/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:25:26');
INSERT INTO `_log` VALUES ('1330', 'tag', 'autocomplete', '', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/blog/edit/id/9/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:27:12');
INSERT INTO `_log` VALUES ('1331', 'tag', 'autocomplete', '', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/blog/edit/id/9/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:27:12');
INSERT INTO `_log` VALUES ('1332', 'tag', 'autocomplete', '', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/blog/edit/id/9/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:27:12');
INSERT INTO `_log` VALUES ('1333', 'tag', 'autocomplete', '', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/blog/edit/id/9/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:27:12');
INSERT INTO `_log` VALUES ('1334', 'tag', 'autocomplete', '', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/blog/edit/id/9/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:27:16');
INSERT INTO `_log` VALUES ('1335', 'tag', 'autocomplete', '', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/blog/edit/id/9/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:27:16');
INSERT INTO `_log` VALUES ('1336', 'tag', 'autocomplete', '', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/blog/edit/id/9/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:27:16');
INSERT INTO `_log` VALUES ('1337', 'tag', 'autocomplete', '', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/blog/edit/id/9/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:27:17');
INSERT INTO `_log` VALUES ('1338', 'tag', 'autocomplete', '', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/blog/edit/id/9/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:27:19');
INSERT INTO `_log` VALUES ('1339', 'tag', 'autocomplete', '', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/blog/edit/id/9/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:27:19');
INSERT INTO `_log` VALUES ('1340', 'tag', 'autocomplete', '', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/blog/edit/id/9/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:27:19');
INSERT INTO `_log` VALUES ('1341', 'tag', 'autocomplete', '', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/blog/edit/id/9/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:27:19');
INSERT INTO `_log` VALUES ('1342', 'tag', 'autocomplete', '', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/blog/edit/id/9/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:27:20');
INSERT INTO `_log` VALUES ('1343', 'tag', 'autocomplete', '', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/blog/edit/id/9/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:27:20');
INSERT INTO `_log` VALUES ('1344', 'tag', 'autocomplete', '', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/blog/edit/id/9/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:27:20');
INSERT INTO `_log` VALUES ('1345', 'tag', 'autocomplete', '', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/blog/edit/id/9/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:27:20');
INSERT INTO `_log` VALUES ('1346', 'tag', 'autocomplete', '', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/blog/edit/id/9/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:27:20');
INSERT INTO `_log` VALUES ('1347', 'tag', 'autocomplete', '', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/blog/edit/id/9/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:27:20');
INSERT INTO `_log` VALUES ('1348', 'tag', 'autocomplete', '', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/blog/edit/id/9/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:27:20');
INSERT INTO `_log` VALUES ('1349', 'tag', 'autocomplete', '', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/blog/edit/id/9/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:27:20');
INSERT INTO `_log` VALUES ('1350', 'tag', 'autocomplete', '', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/blog/edit/id/9/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:27:20');
INSERT INTO `_log` VALUES ('1351', 'tag', 'autocomplete', '', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/blog/edit/id/9/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:27:20');
INSERT INTO `_log` VALUES ('1352', 'tag', 'autocomplete', '', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/blog/edit/id/9/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:27:20');
INSERT INTO `_log` VALUES ('1353', 'tag', 'autocomplete', '', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/blog/edit/id/9/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:27:20');
INSERT INTO `_log` VALUES ('1354', 'tag', 'autocomplete', '', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/blog/edit/id/9/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:27:24');
INSERT INTO `_log` VALUES ('1355', 'tag', 'autocomplete', '', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/blog/edit/id/9/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:27:24');
INSERT INTO `_log` VALUES ('1356', 'tag', 'autocomplete', '', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/blog/edit/id/9/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:27:24');
INSERT INTO `_log` VALUES ('1357', 'tag', 'autocomplete', '', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/blog/edit/id/9/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:27:24');
INSERT INTO `_log` VALUES ('1358', 'tag', 'autocomplete', '', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/blog/edit/id/9/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:27:24');
INSERT INTO `_log` VALUES ('1359', 'tag', 'autocomplete', '', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/blog/edit/id/9/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:27:24');
INSERT INTO `_log` VALUES ('1360', 'tag', 'autocomplete', '', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/blog/edit/id/9/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:27:26');
INSERT INTO `_log` VALUES ('1361', 'tag', 'autocomplete', '', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/blog/edit/id/9/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:27:26');
INSERT INTO `_log` VALUES ('1362', 'tag', 'autocomplete', '', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/blog/edit/id/9/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:27:26');
INSERT INTO `_log` VALUES ('1363', 'tag', 'autocomplete', '', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/blog/edit/id/9/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:27:26');
INSERT INTO `_log` VALUES ('1364', 'tag', 'autocomplete', '', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/blog/edit/id/9/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:27:26');
INSERT INTO `_log` VALUES ('1365', 'tag', 'autocomplete', '', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/blog/edit/id/9/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:27:26');
INSERT INTO `_log` VALUES ('1366', 'tag', 'autocomplete', '', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/blog/edit/id/9/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:27:26');
INSERT INTO `_log` VALUES ('1367', 'tag', 'autocomplete', '', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/blog/edit/id/9/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:27:26');
INSERT INTO `_log` VALUES ('1368', 'tag', 'autocomplete', '', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/blog/edit/id/9/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:27:26');
INSERT INTO `_log` VALUES ('1369', 'tag', 'autocomplete', '', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/blog/edit/id/9/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:27:26');
INSERT INTO `_log` VALUES ('1370', 'tag', 'autocomplete', '', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/blog/edit/id/9/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:27:30');
INSERT INTO `_log` VALUES ('1371', 'tag', 'autocomplete', '', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/blog/edit/id/9/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:27:30');
INSERT INTO `_log` VALUES ('1372', 'tag', 'autocomplete', '', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/blog/edit/id/9/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:27:30');
INSERT INTO `_log` VALUES ('1373', 'tag', 'autocomplete', '', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/blog/edit/id/9/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:27:30');
INSERT INTO `_log` VALUES ('1374', 'tag', 'autocomplete', '', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/blog/edit/id/9/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:27:31');
INSERT INTO `_log` VALUES ('1375', 'tag', 'autocomplete', '', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/blog/edit/id/9/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:27:31');
INSERT INTO `_log` VALUES ('1376', 'tag', 'autocomplete', '', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/blog/edit/id/9/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:27:31');
INSERT INTO `_log` VALUES ('1377', 'tag', 'autocomplete', '', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/blog/edit/id/9/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:27:31');
INSERT INTO `_log` VALUES ('1378', 'tag', 'autocomplete', '', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/blog/edit/id/9/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:27:37');
INSERT INTO `_log` VALUES ('1379', 'tag', 'autocomplete', '', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/blog/edit/id/9/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:27:37');
INSERT INTO `_log` VALUES ('1380', 'tag', 'autocomplete', '', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/blog/edit/id/9/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:27:37');
INSERT INTO `_log` VALUES ('1381', 'tag', 'autocomplete', '', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/blog/edit/id/9/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:27:37');
INSERT INTO `_log` VALUES ('1382', 'blog', 'save', '', '9', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/blog/edit/id/9/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:27:42');
INSERT INTO `_log` VALUES ('1383', '', '', '', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/blog/edit/id/9/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:27:45');
INSERT INTO `_log` VALUES ('1384', 'blog', '', '', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:27:50');
INSERT INTO `_log` VALUES ('1385', 'blog', 'next', '', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/blog/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:27:55');
INSERT INTO `_log` VALUES ('1386', 'blog', 'next', '', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/blog/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:27:55');
INSERT INTO `_log` VALUES ('1387', 'blog', 'next', '', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/blog/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:27:55');
INSERT INTO `_log` VALUES ('1388', 'blog', 'next', '', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/blog/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:27:57');
INSERT INTO `_log` VALUES ('1389', 'blog', 'next', '', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/blog/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:27:57');
INSERT INTO `_log` VALUES ('1390', 'blog', 'next', '', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/blog/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:27:57');
INSERT INTO `_log` VALUES ('1391', 'blog', 'edit', '', '9', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/blog/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:28:03');
INSERT INTO `_log` VALUES ('1392', 'tag', 'autocomplete', '', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/blog/edit/id/9/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:28:08');
INSERT INTO `_log` VALUES ('1393', 'tag', 'autocomplete', '', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/blog/edit/id/9/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:28:08');
INSERT INTO `_log` VALUES ('1394', 'tag', 'autocomplete', '', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/blog/edit/id/9/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:28:09');
INSERT INTO `_log` VALUES ('1395', 'tag', 'autocomplete', '', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/blog/edit/id/9/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:28:09');
INSERT INTO `_log` VALUES ('1396', 'tag', 'autocomplete', '', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/blog/edit/id/9/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:28:09');
INSERT INTO `_log` VALUES ('1397', 'tag', 'autocomplete', '', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/blog/edit/id/9/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:28:09');
INSERT INTO `_log` VALUES ('1398', 'tag', 'autocomplete', '', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/blog/edit/id/9/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:28:09');
INSERT INTO `_log` VALUES ('1399', 'tag', 'autocomplete', '', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/blog/edit/id/9/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:28:09');
INSERT INTO `_log` VALUES ('1400', 'tag', 'autocomplete', '', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/blog/edit/id/9/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:28:09');
INSERT INTO `_log` VALUES ('1401', 'tag', 'autocomplete', '', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/blog/edit/id/9/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:28:09');
INSERT INTO `_log` VALUES ('1402', 'tag', 'autocomplete', '', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/blog/edit/id/9/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:28:10');
INSERT INTO `_log` VALUES ('1403', 'tag', 'autocomplete', '', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/blog/edit/id/9/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:28:10');
INSERT INTO `_log` VALUES ('1404', 'tag', 'autocomplete', '', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/blog/edit/id/9/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:28:20');
INSERT INTO `_log` VALUES ('1405', 'tag', 'autocomplete', '', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/blog/edit/id/9/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:28:20');
INSERT INTO `_log` VALUES ('1406', 'tag', 'autocomplete', '', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/blog/edit/id/9/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:28:21');
INSERT INTO `_log` VALUES ('1407', 'tag', 'autocomplete', '', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/blog/edit/id/9/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:28:21');
INSERT INTO `_log` VALUES ('1408', 'tag', 'autocomplete', '', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/blog/edit/id/9/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:28:21');
INSERT INTO `_log` VALUES ('1409', 'tag', 'autocomplete', '', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/blog/edit/id/9/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:28:21');
INSERT INTO `_log` VALUES ('1410', 'tag', 'autocomplete', '', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/blog/edit/id/9/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:28:21');
INSERT INTO `_log` VALUES ('1411', 'tag', 'autocomplete', '', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/blog/edit/id/9/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:28:21');
INSERT INTO `_log` VALUES ('1412', 'tag', 'autocomplete', '', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/blog/edit/id/9/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:28:22');
INSERT INTO `_log` VALUES ('1413', 'tag', 'autocomplete', '', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/blog/edit/id/9/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:28:22');
INSERT INTO `_log` VALUES ('1414', 'tag', 'autocomplete', '', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/blog/edit/id/9/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:28:22');
INSERT INTO `_log` VALUES ('1415', 'tag', 'autocomplete', '', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/blog/edit/id/9/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:28:22');
INSERT INTO `_log` VALUES ('1416', 'tag', 'autocomplete', '', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/blog/edit/id/9/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:28:22');
INSERT INTO `_log` VALUES ('1417', 'tag', 'autocomplete', '', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/blog/edit/id/9/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:28:22');
INSERT INTO `_log` VALUES ('1418', 'blog', 'save', '', '9', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/blog/edit/id/9/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:28:39');
INSERT INTO `_log` VALUES ('1419', '', '', '', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/blog/edit/id/9/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:28:42');
INSERT INTO `_log` VALUES ('1420', 'blog', 'show', '', '33', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:30:23');
INSERT INTO `_log` VALUES ('1421', 'blog', 'track', '', '33', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/blog/renaissance/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:30:23');
INSERT INTO `_log` VALUES ('1422', 'blog', 'show', '', '38', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:30:26');
INSERT INTO `_log` VALUES ('1423', 'blog', 'track', '', '38', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/blog/reach/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:30:26');
INSERT INTO `_log` VALUES ('1424', 'blog', 'show', '', '9', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:30:29');
INSERT INTO `_log` VALUES ('1425', 'blog', 'track', '', '9', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/blog/katana/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:30:29');
INSERT INTO `_log` VALUES ('1426', '', '', '', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:14.0) Gecko/20100101 Firefox/14.0.1', '', '2pijf536cd06pmoae4irh2h8n5', '2013-04-05 11:30:50');
INSERT INTO `_log` VALUES ('1427', 'blog', '', '', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:14.0) Gecko/20100101 Firefox/14.0.1', 'http://m2.local/', '2pijf536cd06pmoae4irh2h8n5', '2013-04-05 11:35:12');
INSERT INTO `_log` VALUES ('1428', 'file', '', '', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:35:12');
INSERT INTO `_log` VALUES ('1429', '', '', '', '', '127.0.0.1', 'Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 6.1; WOW64; Trident/6.0)', 'http://m2.local/gallery/', 'k12h2iaoo0vh6olk63m4d44k71', '2013-04-05 11:35:12');
INSERT INTO `_log` VALUES ('1430', 'blog', 'show', '', '6', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:35:12');
INSERT INTO `_log` VALUES ('1431', '', '', '', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/blog/edit/id/9/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:35:18');
INSERT INTO `_log` VALUES ('1432', 'tag', 'search', '', '23', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:35:34');
INSERT INTO `_log` VALUES ('1433', 'sitemap', '', '', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/tag/neurostep/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:35:43');
INSERT INTO `_log` VALUES ('1434', 'blog', 'show', '', '38', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/map/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:35:48');
INSERT INTO `_log` VALUES ('1435', 'blog', 'track', '', '38', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/blog/reach/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:35:48');
INSERT INTO `_log` VALUES ('1436', 'blog', 'show', '', '40', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/map/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:35:49');
INSERT INTO `_log` VALUES ('1437', 'blog', 'track', '', '40', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/blog/my-friend-friday/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:35:49');
INSERT INTO `_log` VALUES ('1438', 'blog', 'show', '', '37', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/map/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:35:49');
INSERT INTO `_log` VALUES ('1439', 'blog', 'track', '', '37', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/blog/stockholm-syndrome-backset/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:35:50');
INSERT INTO `_log` VALUES ('1440', 'blog', 'show', '', '6', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/map/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:35:50');
INSERT INTO `_log` VALUES ('1441', 'blog', 'track', '', '6', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/blog/stockholm-syndrome/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:35:50');
INSERT INTO `_log` VALUES ('1442', 'blog', 'show', '', '22', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/map/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:35:50');
INSERT INTO `_log` VALUES ('1443', 'blog', 'track', '', '22', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/blog/cote-d-azur/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:35:51');
INSERT INTO `_log` VALUES ('1444', 'blog', 'edit', '', '22', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/blog/cote-d-azur/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:37:06');
INSERT INTO `_log` VALUES ('1445', 'blog', 'save', '', '22', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/blog/edit/id/22/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:37:48');
INSERT INTO `_log` VALUES ('1446', 'blog', 'show', '', '22', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/map/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:37:52');
INSERT INTO `_log` VALUES ('1447', 'blog', 'track', '', '22', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/blog/cote-d-azur/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:37:52');
INSERT INTO `_log` VALUES ('1448', 'blog', 'edit', '', '38', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/blog/reach/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:38:04');
INSERT INTO `_log` VALUES ('1449', 'blog', 'save', '', '38', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/blog/edit/id/38/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:38:40');
INSERT INTO `_log` VALUES ('1450', 'blog', 'show', '', '38', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/map/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:38:43');
INSERT INTO `_log` VALUES ('1451', 'blog', 'track', '', '38', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/blog/reach/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:38:43');
INSERT INTO `_log` VALUES ('1452', 'blog', 'show', '', '36', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/map/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:40:07');
INSERT INTO `_log` VALUES ('1453', 'blog', 'track', '', '36', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/blog/enzo-cafe/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:40:08');
INSERT INTO `_log` VALUES ('1454', 'blog', 'show', '', '35', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/map/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:40:08');
INSERT INTO `_log` VALUES ('1455', 'blog', 'track', '', '35', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/blog/progress/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:40:09');
INSERT INTO `_log` VALUES ('1456', 'blog', 'show', '', '8', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/map/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:40:09');
INSERT INTO `_log` VALUES ('1457', 'blog', 'track', '', '8', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/blog/autoreply/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:40:09');
INSERT INTO `_log` VALUES ('1458', 'blog', 'show', '', '34', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/map/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:40:10');
INSERT INTO `_log` VALUES ('1459', 'blog', 'track', '', '34', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/blog/exception/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:40:10');
INSERT INTO `_log` VALUES ('1460', 'blog', 'show', '', '9', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/map/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:40:10');
INSERT INTO `_log` VALUES ('1461', 'blog', 'track', '', '9', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/blog/katana/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:40:11');
INSERT INTO `_log` VALUES ('1462', 'blog', 'edit', '', '36', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/blog/enzo-cafe/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:40:18');
INSERT INTO `_log` VALUES ('1463', 'blog', 'save', '', '36', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/blog/edit/id/36/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:40:32');
INSERT INTO `_log` VALUES ('1464', 'blog', 'show', '', '36', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/map/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:40:35');
INSERT INTO `_log` VALUES ('1465', 'blog', 'track', '', '36', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/blog/enzo-cafe/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:40:35');
INSERT INTO `_log` VALUES ('1466', 'blog', 'show', '', '39', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/map/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:41:14');
INSERT INTO `_log` VALUES ('1467', 'blog', 'track', '', '39', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/blog/nlp/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:41:14');
INSERT INTO `_log` VALUES ('1468', 'blog', 'show', '', '33', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/map/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:41:15');
INSERT INTO `_log` VALUES ('1469', 'blog', 'track', '', '33', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/blog/renaissance/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:41:15');
INSERT INTO `_log` VALUES ('1470', 'blog', 'show', '', '32', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/map/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:41:15');
INSERT INTO `_log` VALUES ('1471', 'blog', 'track', '', '32', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/blog/trauma/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:41:15');
INSERT INTO `_log` VALUES ('1472', 'blog', 'show', '', '13', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/map/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:41:16');
INSERT INTO `_log` VALUES ('1473', 'blog', 'track', '', '13', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/blog/hobh-four/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:41:16');
INSERT INTO `_log` VALUES ('1474', 'blog', 'show', '', '5', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/map/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:41:16');
INSERT INTO `_log` VALUES ('1475', 'blog', 'track', '', '5', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/blog/solaris/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:41:17');
INSERT INTO `_log` VALUES ('1476', 'blog', 'show', '', '19', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/map/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:41:17');
INSERT INTO `_log` VALUES ('1477', 'blog', 'track', '', '19', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/blog/basstech-2/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:41:17');
INSERT INTO `_log` VALUES ('1478', 'blog', 'edit', '', '32', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/blog/trauma/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:41:44');
INSERT INTO `_log` VALUES ('1479', 'blog', 'save', '', '32', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/blog/edit/id/32/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:42:13');
INSERT INTO `_log` VALUES ('1480', 'blog', 'show', '', '32', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/map/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:42:16');
INSERT INTO `_log` VALUES ('1481', 'blog', 'track', '', '32', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/blog/trauma/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:42:16');
INSERT INTO `_log` VALUES ('1482', 'blog', 'show', '', '13', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/map/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:42:29');
INSERT INTO `_log` VALUES ('1483', 'blog', 'track', '', '13', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/blog/hobh-four/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:42:29');
INSERT INTO `_log` VALUES ('1484', 'blog', 'show', '', '13', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/map/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:42:33');
INSERT INTO `_log` VALUES ('1485', 'blog', 'track', '', '13', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/blog/hobh-four/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:42:33');
INSERT INTO `_log` VALUES ('1486', 'blog', 'show', '', '5', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/map/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:42:48');
INSERT INTO `_log` VALUES ('1487', 'blog', 'track', '', '5', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/blog/solaris/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:42:49');
INSERT INTO `_log` VALUES ('1488', 'blog', 'show', '', '5', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/map/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:42:50');
INSERT INTO `_log` VALUES ('1489', 'blog', 'track', '', '5', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/blog/solaris/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:42:51');
INSERT INTO `_log` VALUES ('1490', 'blog', 'edit', '', '19', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/blog/basstech-2/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:43:01');
INSERT INTO `_log` VALUES ('1491', 'blog', 'save', '', '19', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/blog/edit/id/19/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:43:29');
INSERT INTO `_log` VALUES ('1492', 'blog', 'show', '', '19', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/map/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:43:32');
INSERT INTO `_log` VALUES ('1493', 'blog', 'track', '', '19', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/blog/basstech-2/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:43:32');
INSERT INTO `_log` VALUES ('1494', 'blog', 'show', '', '12', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/map/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:43:38');
INSERT INTO `_log` VALUES ('1495', 'blog', 'track', '', '12', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/blog/hobh-three/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:43:38');
INSERT INTO `_log` VALUES ('1496', 'blog', 'show', '', '18', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/map/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:43:39');
INSERT INTO `_log` VALUES ('1497', 'blog', 'track', '', '18', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/blog/basstech/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:43:39');
INSERT INTO `_log` VALUES ('1498', 'blog', 'show', '', '4', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/map/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:43:39');
INSERT INTO `_log` VALUES ('1499', 'blog', 'track', '', '4', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/blog/plastic-toy/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:43:40');
INSERT INTO `_log` VALUES ('1500', 'blog', 'show', '', '31', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/map/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:43:40');
INSERT INTO `_log` VALUES ('1501', 'blog', 'track', '', '31', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/blog/killing-machine/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:43:40');
INSERT INTO `_log` VALUES ('1502', 'blog', 'show', '', '11', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/map/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:43:41');
INSERT INTO `_log` VALUES ('1503', 'blog', 'track', '', '11', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/blog/hobh-two/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:43:41');
INSERT INTO `_log` VALUES ('1504', 'blog', 'edit', '', '18', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/blog/basstech/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:43:48');
INSERT INTO `_log` VALUES ('1505', 'blog', 'save', '', '18', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/blog/edit/id/18/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:44:01');
INSERT INTO `_log` VALUES ('1506', 'blog', 'show', '', '18', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/map/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:44:04');
INSERT INTO `_log` VALUES ('1507', 'blog', 'track', '', '18', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/blog/basstech/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:44:05');
INSERT INTO `_log` VALUES ('1508', 'blog', 'edit', '', '31', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/blog/killing-machine/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:44:17');
INSERT INTO `_log` VALUES ('1509', 'blog', 'save', '', '31', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/blog/edit/id/31/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:44:41');
INSERT INTO `_log` VALUES ('1510', 'blog', 'show', '', '31', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/map/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:44:43');
INSERT INTO `_log` VALUES ('1511', 'blog', 'track', '', '31', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/blog/killing-machine/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:44:44');
INSERT INTO `_log` VALUES ('1512', 'blog', 'show', '', '21', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/map/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:44:52');
INSERT INTO `_log` VALUES ('1513', 'blog', 'track', '', '21', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/blog/emofunk/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:44:53');
INSERT INTO `_log` VALUES ('1514', 'blog', 'show', '', '20', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/map/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:44:53');
INSERT INTO `_log` VALUES ('1515', 'blog', 'track', '', '20', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/blog/chillhouse-live/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:44:53');
INSERT INTO `_log` VALUES ('1516', 'blog', 'show', '', '30', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/map/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:44:53');
INSERT INTO `_log` VALUES ('1517', 'blog', 'track', '', '30', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/blog/janaca-express-live/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:44:54');
INSERT INTO `_log` VALUES ('1518', 'blog', 'show', '', '29', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/map/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:44:57');
INSERT INTO `_log` VALUES ('1519', 'blog', 'track', '', '29', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/blog/helloween-live/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:44:57');
INSERT INTO `_log` VALUES ('1520', 'blog', 'show', '', '28', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/map/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:44:58');
INSERT INTO `_log` VALUES ('1521', 'blog', 'track', '', '28', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/blog/marrakesh/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:44:58');
INSERT INTO `_log` VALUES ('1522', 'blog', 'edit', '', '20', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/blog/chillhouse-live/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:45:08');
INSERT INTO `_log` VALUES ('1523', 'blog', 'save', '', '20', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/blog/edit/id/20/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:45:38');
INSERT INTO `_log` VALUES ('1524', 'blog', 'show', '', '20', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/map/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:45:40');
INSERT INTO `_log` VALUES ('1525', 'blog', 'track', '', '20', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/blog/chillhouse-live/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:45:40');
INSERT INTO `_log` VALUES ('1526', 'blog', 'edit', '', '30', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/blog/janaca-express-live/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:45:52');
INSERT INTO `_log` VALUES ('1527', 'blog', 'save', '', '30', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/blog/edit/id/30/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:46:03');
INSERT INTO `_log` VALUES ('1528', 'blog', 'show', '', '30', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/map/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:46:05');
INSERT INTO `_log` VALUES ('1529', 'blog', 'track', '', '30', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/blog/janaca-express-live/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:46:06');
INSERT INTO `_log` VALUES ('1530', 'blog', 'edit', '', '29', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/blog/helloween-live/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:46:11');
INSERT INTO `_log` VALUES ('1531', 'blog', 'save', '', '29', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/blog/edit/id/29/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:46:28');
INSERT INTO `_log` VALUES ('1532', 'blog', 'show', '', '29', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/map/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:46:30');
INSERT INTO `_log` VALUES ('1533', 'blog', 'track', '', '29', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/blog/helloween-live/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:46:30');
INSERT INTO `_log` VALUES ('1534', 'blog', 'show', '', '17', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/map/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:46:42');
INSERT INTO `_log` VALUES ('1535', 'blog', 'track', '', '17', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/blog/bar-launge/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:46:42');
INSERT INTO `_log` VALUES ('1536', 'blog', 'show', '', '27', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/map/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:46:43');
INSERT INTO `_log` VALUES ('1537', 'blog', 'track', '', '27', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/blog/janaca-express-01/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:46:43');
INSERT INTO `_log` VALUES ('1538', 'blog', 'show', '', '3', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/map/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:46:43');
INSERT INTO `_log` VALUES ('1539', 'blog', 'track', '', '3', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/blog/synthetic/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:46:44');
INSERT INTO `_log` VALUES ('1540', 'blog', 'show', '', '26', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/map/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:46:44');
INSERT INTO `_log` VALUES ('1541', 'blog', 'track', '', '26', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/blog/janaca-express/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:46:44');
INSERT INTO `_log` VALUES ('1542', 'blog', 'show', '', '25', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/map/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:46:45');
INSERT INTO `_log` VALUES ('1543', 'blog', 'track', '', '25', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/blog/hi-pass/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:46:45');
INSERT INTO `_log` VALUES ('1544', 'blog', 'edit', '', '17', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/blog/bar-launge/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:46:53');
INSERT INTO `_log` VALUES ('1545', 'blog', 'save', '', '17', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/blog/edit/id/17/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:47:05');
INSERT INTO `_log` VALUES ('1546', 'blog', 'show', '', '17', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/map/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:47:09');
INSERT INTO `_log` VALUES ('1547', 'blog', 'track', '', '17', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/blog/bar-launge/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:47:09');
INSERT INTO `_log` VALUES ('1548', 'blog', 'edit', '', '27', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/blog/janaca-express-01/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:47:13');
INSERT INTO `_log` VALUES ('1549', 'blog', 'save', '', '27', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/blog/edit/id/27/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:47:27');
INSERT INTO `_log` VALUES ('1550', 'blog', 'show', '', '27', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/map/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:47:29');
INSERT INTO `_log` VALUES ('1551', 'blog', 'track', '', '27', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/blog/janaca-express-01/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:47:29');
INSERT INTO `_log` VALUES ('1552', 'blog', 'edit', '', '26', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/blog/janaca-express/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:47:41');
INSERT INTO `_log` VALUES ('1553', 'blog', 'save', '', '26', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/blog/edit/id/26/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:47:49');
INSERT INTO `_log` VALUES ('1554', 'blog', 'show', '', '26', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/map/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:47:51');
INSERT INTO `_log` VALUES ('1555', 'blog', 'track', '', '26', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/blog/janaca-express/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:47:52');
INSERT INTO `_log` VALUES ('1556', 'blog', 'show', '', '24', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/map/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:48:09');
INSERT INTO `_log` VALUES ('1557', 'blog', 'track', '', '24', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/blog/iris/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:48:09');
INSERT INTO `_log` VALUES ('1558', 'blog', 'show', '', '10', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/map/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:48:10');
INSERT INTO `_log` VALUES ('1559', 'blog', 'track', '', '10', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/blog/hobh-one/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:48:10');
INSERT INTO `_log` VALUES ('1560', 'blog', 'show', '', '23', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/map/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:48:10');
INSERT INTO `_log` VALUES ('1561', 'blog', 'track', '', '23', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/blog/all-she-wants-is/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:48:11');
INSERT INTO `_log` VALUES ('1562', 'blog', 'show', '', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/map/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:48:11');
INSERT INTO `_log` VALUES ('1563', 'blog', 'track', '', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/blog/insomnia/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:48:11');
INSERT INTO `_log` VALUES ('1564', 'blog', 'show', '', '37', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/map/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:48:25');
INSERT INTO `_log` VALUES ('1565', 'blog', 'track', '', '37', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 'http://m2.local/blog/stockholm-syndrome-backset/', 'n1kdd36gpqvb55hid3n5mvqj52', '2013-04-05 11:48:26');

-- ----------------------------
-- Table structure for `_sef_alias`
-- ----------------------------
DROP TABLE IF EXISTS `_sef_alias`;
CREATE TABLE `_sef_alias` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `request` varchar(255) NOT NULL,
  `link` varchar(255) NOT NULL,
  `viewed` int(11) unsigned DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=366 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of _sef_alias
-- ----------------------------
INSERT INTO `_sef_alias` VALUES ('74', 'index.php?module=blog&action=show&id=9', 'blog/katana/', '6');
INSERT INTO `_sef_alias` VALUES ('75', 'index.php?module=tag&action=search&id=21', 'tag/katana/', '1');
INSERT INTO `_sef_alias` VALUES ('76', 'index.php?module=tag&action=search&id=22', 'tag/techstep/', '1');
INSERT INTO `_sef_alias` VALUES ('77', 'index.php?module=tag&action=search&id=23', 'tag/neurostep/', '3');
INSERT INTO `_sef_alias` VALUES ('78', 'index.php?module=tag&action=search&id=14', 'tag/featured/', '1');
INSERT INTO `_sef_alias` VALUES ('79', 'index.php?module=tag&action=search&id=24', 'tag/m25/', '1');
INSERT INTO `_sef_alias` VALUES ('80', 'index.php?module=blog&action=show&id=6', 'blog/stockholm-syndrome/', '4');
INSERT INTO `_sef_alias` VALUES ('81', 'index.php?module=tag&action=search&id=15', 'tag/stockholm/', '1');
INSERT INTO `_sef_alias` VALUES ('82', 'index.php?module=tag&action=search&id=16', 'tag/tech-house/', '1');
INSERT INTO `_sef_alias` VALUES ('83', 'index.php?module=tag&action=search&id=17', 'tag/deep-house/', '1');
INSERT INTO `_sef_alias` VALUES ('84', 'index.php?module=tag&action=search&id=18', 'tag/m31/', '1');
INSERT INTO `_sef_alias` VALUES ('85', 'index.php?module=blog&action=show&id=8', 'blog/autoreply/', '3');
INSERT INTO `_sef_alias` VALUES ('86', 'index.php?module=tag&action=search&id=19', 'tag/autoreply/', '1');
INSERT INTO `_sef_alias` VALUES ('1', 'index.php?module=blog', 'blog/', '21');
INSERT INTO `_sef_alias` VALUES ('87', 'index.php?module=tag&action=search&id=20', 'tag/m27/', '1');
INSERT INTO `_sef_alias` VALUES ('88', 'index.php?module=gallery', 'gallery/', '10');
INSERT INTO `_sef_alias` VALUES ('89', 'index.php?module=blog&action=show&id=25', 'blog/hi-pass/', '4');
INSERT INTO `_sef_alias` VALUES ('90', 'index.php?module=tag&action=search&id=55', 'tag/minimal-techno/', '1');
INSERT INTO `_sef_alias` VALUES ('91', 'index.php?module=tag&action=search&id=56', 'tag/hi-pass/', '1');
INSERT INTO `_sef_alias` VALUES ('92', 'index.php?module=tag&action=search&id=57', 'tag/m05/', '1');
INSERT INTO `_sef_alias` VALUES ('93', 'index.php?module=blog&action=show&id=24', 'blog/iris/', '1');
INSERT INTO `_sef_alias` VALUES ('94', 'index.php?module=tag&action=search&id=52', 'tag/iris/', '1');
INSERT INTO `_sef_alias` VALUES ('95', 'index.php?module=tag&action=search&id=53', 'tag/all-about-me/', '1');
INSERT INTO `_sef_alias` VALUES ('96', 'index.php?module=tag&action=search&id=54', 'tag/m04/', '1');
INSERT INTO `_sef_alias` VALUES ('97', 'index.php?module=tag&action=search&id=48', 'tag/promo/', '2');
INSERT INTO `_sef_alias` VALUES ('98', 'index.php?module=blog&action=show&id=23', 'blog/all-she-wants-is/', '1');
INSERT INTO `_sef_alias` VALUES ('99', 'index.php?module=tag&action=search&id=50', 'tag/all-she-wants/', '2');
INSERT INTO `_sef_alias` VALUES ('100', 'index.php?module=tag&action=search&id=51', 'tag/m02/', '1');
INSERT INTO `_sef_alias` VALUES ('101', 'index.php?module=blog&action=show&id=22', 'blog/cote-d-azur/', '4');
INSERT INTO `_sef_alias` VALUES ('102', 'index.php?module=tag&action=search&id=46', 'tag/funky-house/', '1');
INSERT INTO `_sef_alias` VALUES ('103', 'index.php?module=tag&action=search&id=47', 'tag/cote-d-azur/', '2');
INSERT INTO `_sef_alias` VALUES ('104', 'index.php?module=tag&action=search&id=49', 'tag/m30/', '1');
INSERT INTO `_sef_alias` VALUES ('105', 'index.php?module=blog&action=show&id=21', 'blog/emofunk/', '1');
INSERT INTO `_sef_alias` VALUES ('106', 'index.php?module=tag&action=search&id=37', 'tag/neurofunk/', '1');
INSERT INTO `_sef_alias` VALUES ('107', 'index.php?module=tag&action=search&id=38', 'tag/technoid/', '2');
INSERT INTO `_sef_alias` VALUES ('108', 'index.php?module=tag&action=search&id=36', 'tag/dnb/', '4');
INSERT INTO `_sef_alias` VALUES ('109', 'index.php?module=tag&action=search&id=43', 'tag/live/', '1');
INSERT INTO `_sef_alias` VALUES ('110', 'index.php?module=tag&action=search&id=45', 'tag/m14/', '1');
INSERT INTO `_sef_alias` VALUES ('111', 'index.php?module=tag&action=search&id=3', 'tag/ambient/', '1');
INSERT INTO `_sef_alias` VALUES ('112', 'index.php?module=tag&action=search&id=8', 'tag/chillout/', '1');
INSERT INTO `_sef_alias` VALUES ('113', 'index.php?module=tag&action=search&id=25', 'tag/hobh/', '1');
INSERT INTO `_sef_alias` VALUES ('114', 'index.php?module=tag&action=search&id=5', 'tag/lsc/', '1');
INSERT INTO `_sef_alias` VALUES ('115', 'index.php?module=blog&action=show&id=20', 'blog/chillhouse-live/', '2');
INSERT INTO `_sef_alias` VALUES ('116', 'index.php?module=blog&action=show&id=19', 'blog/basstech-2/', '3');
INSERT INTO `_sef_alias` VALUES ('117', 'index.php?module=gallery&action=show&id=1', 'gallery/autumn-12/', '2');
INSERT INTO `_sef_alias` VALUES ('118', 'index.php?module=gallery&action=show&id=2', 'gallery/holland/', '1');
INSERT INTO `_sef_alias` VALUES ('2', 'index.php?module=user&action=loginform', 'login/', '2');
INSERT INTO `_sef_alias` VALUES ('3', 'index.php?module=file', 'download/', '10');
INSERT INTO `_sef_alias` VALUES ('4', 'index.php?module=blog&action=show&id=14', 'about/', '12');
INSERT INTO `_sef_alias` VALUES ('5', 'index.php?module=sitemap', 'map/', '2');
INSERT INTO `_sef_alias` VALUES ('6', 'index.php?module=user&action=registerform', 'register/', '6');
INSERT INTO `_sef_alias` VALUES ('7', 'index.php?module=blog&action=show&id=2', 'dev/', '1');
INSERT INTO `_sef_alias` VALUES ('8', 'index.php?module=blog&action=show&id=16', 'copyrights/', '1');
INSERT INTO `_sef_alias` VALUES ('119', 'index.php?module=gallery&action=show&id=3', 'gallery/spring-13/', '1');
INSERT INTO `_sef_alias` VALUES ('120', 'index.php?module=gallery&action=show&id=4', 'gallery/winter-13/', '1');
INSERT INTO `_sef_alias` VALUES ('121', 'index.php?module=gallery&action=show&id=5', 'gallery/z-xx/', '1');
INSERT INTO `_sef_alias` VALUES ('122', 'index.php?module=blog&action=show&id=1', 'blog/insomnia/', '1');
INSERT INTO `_sef_alias` VALUES ('123', 'index.php?module=blog&action=show&id=3', 'blog/synthetic/', '1');
INSERT INTO `_sef_alias` VALUES ('9', 'index.php?module=user&action=forgotform', 'forgot/', '3');
INSERT INTO `_sef_alias` VALUES ('124', 'index.php?module=blog&action=show&id=12', 'blog/hobh-three/', '2');
INSERT INTO `_sef_alias` VALUES ('125', 'index.php?module=blog&action=show&id=5', 'blog/solaris/', '3');
INSERT INTO `_sef_alias` VALUES ('126', 'index.php?module=blog&action=show&id=4', 'blog/plastic-toy/', '1');
INSERT INTO `_sef_alias` VALUES ('127', 'index.php?module=blog&action=show&id=17', 'blog/bar-launge/', '3');
INSERT INTO `_sef_alias` VALUES ('128', 'index.php?module=tag&action=search&id=32', 'tag/acid-jazz/', '2');
INSERT INTO `_sef_alias` VALUES ('129', 'index.php?module=tag&action=search&id=33', 'tag/lounge/', '2');
INSERT INTO `_sef_alias` VALUES ('130', 'index.php?module=tag&action=search&id=34', 'tag/bar-la-unge/', '2');
INSERT INTO `_sef_alias` VALUES ('131', 'index.php?module=tag&action=search&id=35', 'tag/m08/', '2');
INSERT INTO `_sef_alias` VALUES ('132', 'index.php?module=blog&action=show&id=18', 'blog/basstech/', '3');
INSERT INTO `_sef_alias` VALUES ('133', 'index.php?module=tag&action=search&id=39', 'tag/basstech/', '2');
INSERT INTO `_sef_alias` VALUES ('134', 'index.php?module=tag&action=search&id=40', 'tag/m18/', '2');
INSERT INTO `_sef_alias` VALUES ('135', 'index.php?module=tag&action=search&id=41', 'tag/m20/', '2');
INSERT INTO `_sef_alias` VALUES ('136', 'index.php?module=blog&action=track&id=19', 'blog/track/id/19/', '2');
INSERT INTO `_sef_alias` VALUES ('137', 'index.php?module=tag&action=search&id=42', 'tag/chillhouse/', '2');
INSERT INTO `_sef_alias` VALUES ('138', 'index.php?module=tag&action=search&id=44', 'tag/m12/', '2');
INSERT INTO `_sef_alias` VALUES ('139', 'index.php?module=blog&action=show&id=13', 'blog/hobh-four/', '8');
INSERT INTO `_sef_alias` VALUES ('140', 'index.php?module=blog&action=show&id=11', 'blog/hobh-two/', '4');
INSERT INTO `_sef_alias` VALUES ('141', 'index.php?module=blog&action=show&id=10', 'blog/hobh-one/', '2');
INSERT INTO `_sef_alias` VALUES ('142', 'index.php?module=gallery&action=track', 'gallery/track/', '1');
INSERT INTO `_sef_alias` VALUES ('143', 'index.php?module=file&action=track', 'file/track/', '13');
INSERT INTO `_sef_alias` VALUES ('144', 'index.php?module=gallery&action=next', 'gallery/next/', '5');
INSERT INTO `_sef_alias` VALUES ('145', 'index.php?module=gallery&action=prev', 'gallery/prev/', '1');
INSERT INTO `_sef_alias` VALUES ('146', 'index.php', '', '851');
INSERT INTO `_sef_alias` VALUES ('147', 'index.php?module=blog&action=edit&id=25', 'blog/edit/id/25/', '0');
INSERT INTO `_sef_alias` VALUES ('148', 'index.php?module=blog&action=delete&id=25', 'blog/delete/id/25/', '0');
INSERT INTO `_sef_alias` VALUES ('149', 'index.php?module=blog&action=edit&id=24', 'blog/edit/id/24/', '0');
INSERT INTO `_sef_alias` VALUES ('150', 'index.php?module=blog&action=delete&id=24', 'blog/delete/id/24/', '0');
INSERT INTO `_sef_alias` VALUES ('151', 'index.php?module=blog&action=edit&id=23', 'blog/edit/id/23/', '0');
INSERT INTO `_sef_alias` VALUES ('152', 'index.php?module=blog&action=delete&id=23', 'blog/delete/id/23/', '0');
INSERT INTO `_sef_alias` VALUES ('153', 'index.php?module=blog&action=edit&id=22', 'blog/edit/id/22/', '1');
INSERT INTO `_sef_alias` VALUES ('154', 'index.php?module=blog&action=delete&id=22', 'blog/delete/id/22/', '0');
INSERT INTO `_sef_alias` VALUES ('155', 'index.php?module=blog&action=edit&id=21', 'blog/edit/id/21/', '0');
INSERT INTO `_sef_alias` VALUES ('156', 'index.php?module=blog&action=delete&id=21', 'blog/delete/id/21/', '0');
INSERT INTO `_sef_alias` VALUES ('157', 'index.php?module=user&action=dashboard', 'dashboard/', '12');
INSERT INTO `_sef_alias` VALUES ('158', 'index.php?module=blog&action=edit', 'blog/edit/', '1');
INSERT INTO `_sef_alias` VALUES ('159', 'index.php?module=user&action=logout', 'logout/', '5');
INSERT INTO `_sef_alias` VALUES ('160', 'index.php?module=user', 'dashboard/', '12');
INSERT INTO `_sef_alias` VALUES ('161', 'index.php?module=file&action=edit', 'file/edit/', '1');
INSERT INTO `_sef_alias` VALUES ('162', 'index.php?module=gallery&action=updatefiles', 'gallery/updatefiles/', '0');
INSERT INTO `_sef_alias` VALUES ('163', 'index.php?module=gallery&action=rebuildthumbnails', 'gallery/rebuildthumbnails/', '0');
INSERT INTO `_sef_alias` VALUES ('164', 'index.php?module=tag&action=autocomplete', 'tag/autocomplete/', '122');
INSERT INTO `_sef_alias` VALUES ('165', 'index.php?module=blog&action=next', 'blog/next/', '108');
INSERT INTO `_sef_alias` VALUES ('166', 'index.php?module=blog&action=edit&id=14', 'blog/edit/id/14/', '0');
INSERT INTO `_sef_alias` VALUES ('167', 'index.php?module=blog&action=delete&id=14', 'blog/delete/id/14/', '0');
INSERT INTO `_sef_alias` VALUES ('168', 'index.php?module=blog&action=track&id=14', 'blog/track/id/14/', '12');
INSERT INTO `_sef_alias` VALUES ('169', 'index.php?module=blog&action=edit&id=20', 'blog/edit/id/20/', '1');
INSERT INTO `_sef_alias` VALUES ('170', 'index.php?module=blog&action=delete&id=20', 'blog/delete/id/20/', '0');
INSERT INTO `_sef_alias` VALUES ('171', 'index.php?module=blog&action=edit&id=19', 'blog/edit/id/19/', '1');
INSERT INTO `_sef_alias` VALUES ('172', 'index.php?module=blog&action=delete&id=19', 'blog/delete/id/19/', '0');
INSERT INTO `_sef_alias` VALUES ('173', 'index.php?module=blog&action=edit&id=18', 'blog/edit/id/18/', '1');
INSERT INTO `_sef_alias` VALUES ('174', 'index.php?module=blog&action=delete&id=18', 'blog/delete/id/18/', '0');
INSERT INTO `_sef_alias` VALUES ('175', 'index.php?module=blog&action=edit&id=17', 'blog/edit/id/17/', '1');
INSERT INTO `_sef_alias` VALUES ('176', 'index.php?module=blog&action=delete&id=17', 'blog/delete/id/17/', '0');
INSERT INTO `_sef_alias` VALUES ('177', 'index.php?module=blog&action=edit&id=13', 'blog/edit/id/13/', '0');
INSERT INTO `_sef_alias` VALUES ('178', 'index.php?module=blog&action=delete&id=13', 'blog/delete/id/13/', '0');
INSERT INTO `_sef_alias` VALUES ('179', 'index.php?module=blog&action=edit&id=12', 'blog/edit/id/12/', '0');
INSERT INTO `_sef_alias` VALUES ('180', 'index.php?module=blog&action=delete&id=12', 'blog/delete/id/12/', '0');
INSERT INTO `_sef_alias` VALUES ('181', 'index.php?module=blog&action=edit&id=11', 'blog/edit/id/11/', '0');
INSERT INTO `_sef_alias` VALUES ('182', 'index.php?module=blog&action=delete&id=11', 'blog/delete/id/11/', '0');
INSERT INTO `_sef_alias` VALUES ('183', 'index.php?module=blog&action=edit&id=10', 'blog/edit/id/10/', '0');
INSERT INTO `_sef_alias` VALUES ('184', 'index.php?module=blog&action=delete&id=10', 'blog/delete/id/10/', '0');
INSERT INTO `_sef_alias` VALUES ('185', 'index.php?module=blog&action=edit&id=9', 'blog/edit/id/9/', '4');
INSERT INTO `_sef_alias` VALUES ('186', 'index.php?module=blog&action=delete&id=9', 'blog/delete/id/9/', '0');
INSERT INTO `_sef_alias` VALUES ('187', 'index.php?module=sitemap&action=generate', 'map/generate/', '8');
INSERT INTO `_sef_alias` VALUES ('188', 'index.php?module=blog&action=edit&id=16', 'blog/edit/id/16/', '0');
INSERT INTO `_sef_alias` VALUES ('189', 'index.php?module=blog&action=delete&id=16', 'blog/delete/id/16/', '0');
INSERT INTO `_sef_alias` VALUES ('190', 'index.php?module=blog&action=track&id=16', 'blog/track/id/16/', '1');
INSERT INTO `_sef_alias` VALUES ('191', 'index.php?module=blog&action=edit&id=2', 'blog/edit/id/2/', '0');
INSERT INTO `_sef_alias` VALUES ('192', 'index.php?module=blog&action=delete&id=2', 'blog/delete/id/2/', '0');
INSERT INTO `_sef_alias` VALUES ('193', 'index.php?module=blog&action=track&id=2', 'blog/track/id/2/', '1');
INSERT INTO `_sef_alias` VALUES ('194', 'index.php?module=blog&action=track&id=12', 'blog/track/id/12/', '1');
INSERT INTO `_sef_alias` VALUES ('195', 'index.php?module=search&action=autocomplete', 'search/autocomplete/', '2');
INSERT INTO `_sef_alias` VALUES ('196', 'index.php?module=blog&action=track&id=24', 'blog/track/id/24/', '1');
INSERT INTO `_sef_alias` VALUES ('197', 'index.php?module=search', 'search/', '3');
INSERT INTO `_sef_alias` VALUES ('198', 'index.php?module=blog&action=track&id=20', 'blog/track/id/20/', '2');
INSERT INTO `_sef_alias` VALUES ('199', 'index.php?module=blog&action=track&id=25', 'blog/track/id/25/', '4');
INSERT INTO `_sef_alias` VALUES ('200', 'index.php?module=blog&action=edit&id=8', 'blog/edit/id/8/', '0');
INSERT INTO `_sef_alias` VALUES ('201', 'index.php?module=blog&action=delete&id=8', 'blog/delete/id/8/', '0');
INSERT INTO `_sef_alias` VALUES ('202', 'index.php?module=blog&action=edit&id=6', 'blog/edit/id/6/', '0');
INSERT INTO `_sef_alias` VALUES ('203', 'index.php?module=blog&action=delete&id=6', 'blog/delete/id/6/', '0');
INSERT INTO `_sef_alias` VALUES ('204', 'index.php?module=blog&action=edit&id=5', 'blog/edit/id/5/', '0');
INSERT INTO `_sef_alias` VALUES ('205', 'index.php?module=blog&action=delete&id=5', 'blog/delete/id/5/', '0');
INSERT INTO `_sef_alias` VALUES ('206', 'index.php?module=tag&action=search&id=12', 'tag/solaris/', '2');
INSERT INTO `_sef_alias` VALUES ('207', 'index.php?module=tag&action=search&id=13', 'tag/m21/', '2');
INSERT INTO `_sef_alias` VALUES ('208', 'index.php?module=blog&action=edit&id=4', 'blog/edit/id/4/', '0');
INSERT INTO `_sef_alias` VALUES ('209', 'index.php?module=blog&action=delete&id=4', 'blog/delete/id/4/', '0');
INSERT INTO `_sef_alias` VALUES ('210', 'index.php?module=tag&action=search&id=10', 'tag/plastic-toy/', '2');
INSERT INTO `_sef_alias` VALUES ('211', 'index.php?module=tag&action=search&id=11', 'tag/m17/', '2');
INSERT INTO `_sef_alias` VALUES ('212', 'index.php?module=blog&action=edit&id=3', 'blog/edit/id/3/', '0');
INSERT INTO `_sef_alias` VALUES ('213', 'index.php?module=blog&action=delete&id=3', 'blog/delete/id/3/', '0');
INSERT INTO `_sef_alias` VALUES ('214', 'index.php?module=tag&action=search&id=7', 'tag/synthetic/', '2');
INSERT INTO `_sef_alias` VALUES ('215', 'index.php?module=tag&action=search&id=9', 'tag/m07/', '2');
INSERT INTO `_sef_alias` VALUES ('216', 'index.php?module=blog&action=edit&id=1', 'blog/edit/id/1/', '0');
INSERT INTO `_sef_alias` VALUES ('217', 'index.php?module=blog&action=delete&id=1', 'blog/delete/id/1/', '0');
INSERT INTO `_sef_alias` VALUES ('218', 'index.php?module=tag&action=search&id=1', 'tag/insomnia/', '2');
INSERT INTO `_sef_alias` VALUES ('219', 'index.php?module=tag&action=search&id=2', 'tag/noise/', '2');
INSERT INTO `_sef_alias` VALUES ('220', 'index.php?module=tag&action=search&id=4', 'tag/easy-listening/', '2');
INSERT INTO `_sef_alias` VALUES ('221', 'index.php?module=tag&action=search&id=6', 'tag/m01/', '2');
INSERT INTO `_sef_alias` VALUES ('222', 'index.php?module=file&action=getaddform', 'file/getaddform/', '0');
INSERT INTO `_sef_alias` VALUES ('223', 'index.php?module=file&action=getdeleteform', 'file/getdeleteform/', '0');
INSERT INTO `_sef_alias` VALUES ('224', 'index.php?module=file&action=remove', 'file/remove/', '0');
INSERT INTO `_sef_alias` VALUES ('225', 'index.php?module=file&action=delete', 'file/delete/', '0');
INSERT INTO `_sef_alias` VALUES ('226', 'index.php?module=tag&action=search&id=27', 'tag/other/', '0');
INSERT INTO `_sef_alias` VALUES ('227', 'index.php?module=tag&action=search&id=29', 'tag/for-it/', '0');
INSERT INTO `_sef_alias` VALUES ('228', 'index.php?module=tag&action=search&id=30', 'tag/copyrights/', '0');
INSERT INTO `_sef_alias` VALUES ('229', 'index.php?module=tag&action=search&id=26', 'tag/about/', '0');
INSERT INTO `_sef_alias` VALUES ('230', 'index.php?module=tag&action=search&id=28', 'tag/for-promouters/', '0');
INSERT INTO `_sef_alias` VALUES ('231', 'index.php?module=blog&action=track&id=1', 'blog/track/id/1/', '1');
INSERT INTO `_sef_alias` VALUES ('351', 'index.php?module=blog&action=track&id=31', 'blog/track/id/31/', '4');
INSERT INTO `_sef_alias` VALUES ('232', 'index.php?module=blog&action=track&id=3', 'blog/track/id/3/', '1');
INSERT INTO `_sef_alias` VALUES ('350', 'index.php?module=tag&action=search&id=71', 'tag/m16/', '2');
INSERT INTO `_sef_alias` VALUES ('233', 'index.php?module=blog&action=track&id=8', 'blog/track/id/8/', '2');
INSERT INTO `_sef_alias` VALUES ('234', 'index.php?module=blog&action=track&id=9', 'blog/track/id/9/', '6');
INSERT INTO `_sef_alias` VALUES ('235', 'index.php?module=blog&action=track&id=23', 'blog/track/id/23/', '1');
INSERT INTO `_sef_alias` VALUES ('352', 'index.php?module=tag&action=search&id=66', 'tag/m11/', '1');
INSERT INTO `_sef_alias` VALUES ('236', 'index.php?module=blog&action=track&id=4', 'blog/track/id/4/', '1');
INSERT INTO `_sef_alias` VALUES ('237', 'index.php?module=blog&action=track&id=5', 'blog/track/id/5/', '3');
INSERT INTO `_sef_alias` VALUES ('238', 'index.php?module=blog&action=track&id=21', 'blog/track/id/21/', '1');
INSERT INTO `_sef_alias` VALUES ('353', 'index.php?module=tag&action=search&id=67', 'tag/helloween/', '1');
INSERT INTO `_sef_alias` VALUES ('239', 'index.php?module=blog&action=track&id=22', 'blog/track/id/22/', '4');
INSERT INTO `_sef_alias` VALUES ('349', 'index.php?module=tag&action=search&id=70', 'tag/killing-machine/', '2');
INSERT INTO `_sef_alias` VALUES ('240', 'index.php?module=blog&action=track&id=6', 'blog/track/id/6/', '2');
INSERT INTO `_sef_alias` VALUES ('347', 'index.php?module=blog&action=track&id=37', 'blog/track/id/37/', '6');
INSERT INTO `_sef_alias` VALUES ('344', 'index.php?module=blog&action=track&id=34', 'blog/track/id/34/', '4');
INSERT INTO `_sef_alias` VALUES ('345', 'index.php?module=blog&action=track&id=36', 'blog/track/id/36/', '5');
INSERT INTO `_sef_alias` VALUES ('348', 'index.php?module=tag&action=search&id=69', 'tag/darkstep/', '2');
INSERT INTO `_sef_alias` VALUES ('241', 'index.php?module=blog&action=track&id=18', 'blog/track/id/18/', '2');
INSERT INTO `_sef_alias` VALUES ('242', 'index.php?module=blog&action=track&id=17', 'blog/track/id/17/', '2');
INSERT INTO `_sef_alias` VALUES ('343', 'index.php?module=blog&action=track&id=35', 'blog/track/id/35/', '4');
INSERT INTO `_sef_alias` VALUES ('342', 'index.php?module=blog&action=track&id=32', 'blog/track/id/32/', '5');
INSERT INTO `_sef_alias` VALUES ('243', 'index.php?module=blog&action=track&id=11', 'blog/track/id/11/', '3');
INSERT INTO `_sef_alias` VALUES ('244', 'index.php?module=blog&action=track&id=10', 'blog/track/id/10/', '2');
INSERT INTO `_sef_alias` VALUES ('245', 'index.php?module=blog&action=track&id=13', 'blog/track/id/13/', '7');
INSERT INTO `_sef_alias` VALUES ('341', 'index.php?module=blog&action=track&id=39', 'blog/track/id/39/', '6');
INSERT INTO `_sef_alias` VALUES ('346', 'index.php?module=blog&action=track&id=33', 'blog/track/id/33/', '6');
INSERT INTO `_sef_alias` VALUES ('246', 'index.php?module=blog&action=show&id=29', 'blog/helloween-live/', '3');
INSERT INTO `_sef_alias` VALUES ('247', 'index.php?module=blog&action=edit&id=29', 'blog/edit/id/29/', '1');
INSERT INTO `_sef_alias` VALUES ('248', 'index.php?module=blog&action=delete&id=29', 'blog/delete/id/29/', '0');
INSERT INTO `_sef_alias` VALUES ('249', 'index.php?module=blog&action=show&id=28', 'blog/marrakesh/', '2');
INSERT INTO `_sef_alias` VALUES ('250', 'index.php?module=blog&action=edit&id=28', 'blog/edit/id/28/', '0');
INSERT INTO `_sef_alias` VALUES ('251', 'index.php?module=blog&action=delete&id=28', 'blog/delete/id/28/', '0');
INSERT INTO `_sef_alias` VALUES ('340', 'index.php?module=blog&action=track&id=40', 'blog/track/id/40/', '4');
INSERT INTO `_sef_alias` VALUES ('254', 'index.php?module=blog&action=show&id=27', 'blog/janaca-express-01/', '3');
INSERT INTO `_sef_alias` VALUES ('255', 'index.php?module=blog&action=edit&id=27', 'blog/edit/id/27/', '1');
INSERT INTO `_sef_alias` VALUES ('256', 'index.php?module=blog&action=delete&id=27', 'blog/delete/id/27/', '0');
INSERT INTO `_sef_alias` VALUES ('339', 'index.php?module=tag&action=search&id=73', 'tag/trauma/', '1');
INSERT INTO `_sef_alias` VALUES ('338', 'index.php?module=tag&action=search&id=72', 'tag/m23/', '1');
INSERT INTO `_sef_alias` VALUES ('337', 'index.php?module=tag&action=search&id=75', 'tag/m24/', '1');
INSERT INTO `_sef_alias` VALUES ('336', 'index.php?module=tag&action=search&id=74', 'tag/renaissance/', '2');
INSERT INTO `_sef_alias` VALUES ('261', 'index.php?module=blog&action=show&id=26', 'blog/janaca-express/', '3');
INSERT INTO `_sef_alias` VALUES ('262', 'index.php?module=blog&action=edit&id=26', 'blog/edit/id/26/', '1');
INSERT INTO `_sef_alias` VALUES ('263', 'index.php?module=blog&action=delete&id=26', 'blog/delete/id/26/', '0');
INSERT INTO `_sef_alias` VALUES ('335', 'index.php?module=tag&action=search&id=91', 'tag/me01/', '1');
INSERT INTO `_sef_alias` VALUES ('265', 'index.php?module=blog&action=track&id=27', 'blog/track/id/27/', '3');
INSERT INTO `_sef_alias` VALUES ('266', 'index.php?module=blog&action=track&id=26', 'blog/track/id/26/', '3');
INSERT INTO `_sef_alias` VALUES ('267', 'index.php?module=blog&action=show&id=30', 'blog/janaca-express-live/', '3');
INSERT INTO `_sef_alias` VALUES ('268', 'index.php?module=blog&action=edit&id=30', 'blog/edit/id/30/', '1');
INSERT INTO `_sef_alias` VALUES ('269', 'index.php?module=blog&action=delete&id=30', 'blog/delete/id/30/', '0');
INSERT INTO `_sef_alias` VALUES ('334', 'index.php?module=tag&action=search&id=90', 'tag/exclusive/', '2');
INSERT INTO `_sef_alias` VALUES ('271', 'index.php?module=blog&action=show&id=31', 'blog/killing-machine/', '3');
INSERT INTO `_sef_alias` VALUES ('272', 'index.php?module=blog&action=edit&id=31', 'blog/edit/id/31/', '1');
INSERT INTO `_sef_alias` VALUES ('273', 'index.php?module=blog&action=delete&id=31', 'blog/delete/id/31/', '0');
INSERT INTO `_sef_alias` VALUES ('274', 'index.php?module=blog&action=show&id=36', 'blog/enzo-cafe/', '4');
INSERT INTO `_sef_alias` VALUES ('275', 'index.php?module=blog&action=edit&id=36', 'blog/edit/id/36/', '1');
INSERT INTO `_sef_alias` VALUES ('276', 'index.php?module=blog&action=delete&id=36', 'blog/delete/id/36/', '0');
INSERT INTO `_sef_alias` VALUES ('333', 'index.php?module=tag&action=search&id=89', 'tag/nlp/', '1');
INSERT INTO `_sef_alias` VALUES ('332', 'index.php?module=tag&action=search&id=88', 'tag/rap/', '1');
INSERT INTO `_sef_alias` VALUES ('279', 'index.php?module=blog&action=show&id=35', 'blog/progress/', '3');
INSERT INTO `_sef_alias` VALUES ('280', 'index.php?module=blog&action=edit&id=35', 'blog/edit/id/35/', '0');
INSERT INTO `_sef_alias` VALUES ('281', 'index.php?module=blog&action=delete&id=35', 'blog/delete/id/35/', '0');
INSERT INTO `_sef_alias` VALUES ('331', 'index.php?module=tag&action=search&id=87', 'tag/hip-hop/', '1');
INSERT INTO `_sef_alias` VALUES ('330', 'index.php?module=tag&action=search&id=77', 'tag/m26/', '1');
INSERT INTO `_sef_alias` VALUES ('329', 'index.php?module=tag&action=search&id=76', 'tag/exception/', '2');
INSERT INTO `_sef_alias` VALUES ('328', 'index.php?module=tag&action=search&id=82', 'tag/pregressive/', '2');
INSERT INTO `_sef_alias` VALUES ('327', 'index.php?module=tag&action=search&id=81', 'tag/m28/', '1');
INSERT INTO `_sef_alias` VALUES ('287', 'index.php?module=blog&action=show&id=34', 'blog/exception/', '3');
INSERT INTO `_sef_alias` VALUES ('288', 'index.php?module=blog&action=edit&id=34', 'blog/edit/id/34/', '0');
INSERT INTO `_sef_alias` VALUES ('289', 'index.php?module=blog&action=delete&id=34', 'blog/delete/id/34/', '0');
INSERT INTO `_sef_alias` VALUES ('290', 'index.php?module=blog&action=show&id=33', 'blog/renaissance/', '5');
INSERT INTO `_sef_alias` VALUES ('291', 'index.php?module=blog&action=edit&id=33', 'blog/edit/id/33/', '0');
INSERT INTO `_sef_alias` VALUES ('292', 'index.php?module=blog&action=delete&id=33', 'blog/delete/id/33/', '0');
INSERT INTO `_sef_alias` VALUES ('293', 'index.php?module=blog&action=show&id=32', 'blog/trauma/', '3');
INSERT INTO `_sef_alias` VALUES ('294', 'index.php?module=blog&action=edit&id=32', 'blog/edit/id/32/', '1');
INSERT INTO `_sef_alias` VALUES ('295', 'index.php?module=blog&action=delete&id=32', 'blog/delete/id/32/', '0');
INSERT INTO `_sef_alias` VALUES ('326', 'index.php?module=tag&action=search&id=80', 'tag/progress/', '2');
INSERT INTO `_sef_alias` VALUES ('297', 'index.php?module=file&action=add', 'file/add/', '0');
INSERT INTO `_sef_alias` VALUES ('298', 'index.php?module=blog&action=show&id=38', 'blog/reach/', '6');
INSERT INTO `_sef_alias` VALUES ('299', 'index.php?module=blog&action=edit&id=38', 'blog/edit/id/38/', '1');
INSERT INTO `_sef_alias` VALUES ('300', 'index.php?module=blog&action=delete&id=38', 'blog/delete/id/38/', '0');
INSERT INTO `_sef_alias` VALUES ('325', 'index.php?module=tag&action=search&id=79', 'tag/athospheric/', '2');
INSERT INTO `_sef_alias` VALUES ('302', 'index.php?module=blog&action=show&id=37', 'blog/stockholm-syndrome-backset/', '5');
INSERT INTO `_sef_alias` VALUES ('303', 'index.php?module=blog&action=edit&id=37', 'blog/edit/id/37/', '0');
INSERT INTO `_sef_alias` VALUES ('304', 'index.php?module=blog&action=delete&id=37', 'blog/delete/id/37/', '0');
INSERT INTO `_sef_alias` VALUES ('324', 'index.php?module=tag&action=search&id=78', 'tag/breaks/', '1');
INSERT INTO `_sef_alias` VALUES ('306', 'index.php?module=blog&action=show&id=40', 'blog/my-friend-friday/', '4');
INSERT INTO `_sef_alias` VALUES ('307', 'index.php?module=blog&action=edit&id=40', 'blog/edit/id/40/', '1');
INSERT INTO `_sef_alias` VALUES ('308', 'index.php?module=blog&action=delete&id=40', 'blog/delete/id/40/', '0');
INSERT INTO `_sef_alias` VALUES ('323', 'index.php?module=tag&action=search&id=84', 'tag/m29/', '1');
INSERT INTO `_sef_alias` VALUES ('310', 'index.php?module=blog&action=show&id=39', 'blog/nlp/', '4');
INSERT INTO `_sef_alias` VALUES ('311', 'index.php?module=blog&action=edit&id=39', 'blog/edit/id/39/', '0');
INSERT INTO `_sef_alias` VALUES ('312', 'index.php?module=blog&action=delete&id=39', 'blog/delete/id/39/', '0');
INSERT INTO `_sef_alias` VALUES ('322', 'index.php?module=tag&action=search&id=83', 'tag/enzo-cafe/', '2');
INSERT INTO `_sef_alias` VALUES ('321', 'index.php?module=tag&action=search&id=85', 'tag/m32/', '1');
INSERT INTO `_sef_alias` VALUES ('320', 'index.php?module=tag&action=search&id=92', 'tag/my-friend-friday/', '2');
INSERT INTO `_sef_alias` VALUES ('319', 'index.php?module=tag&action=search&id=86', 'tag/m33/', '1');
INSERT INTO `_sef_alias` VALUES ('318', 'index.php?module=blog&action=track&id=38', 'blog/track/id/38/', '8');
INSERT INTO `_sef_alias` VALUES ('354', 'index.php?module=tag&action=search&id=58', 'tag/goa/', '2');
INSERT INTO `_sef_alias` VALUES ('355', 'index.php?module=tag&action=search&id=59', 'tag/psy/', '2');
INSERT INTO `_sef_alias` VALUES ('356', 'index.php?module=tag&action=search&id=61', 'tag/janaca-express/', '1');
INSERT INTO `_sef_alias` VALUES ('357', 'index.php?module=tag&action=search&id=68', 'tag/m13/', '2');
INSERT INTO `_sef_alias` VALUES ('358', 'index.php?module=tag&action=search&id=63', 'tag/marrakesh/', '1');
INSERT INTO `_sef_alias` VALUES ('359', 'index.php?module=tag&action=search&id=64', 'tag/m10/', '1');
INSERT INTO `_sef_alias` VALUES ('360', 'index.php?module=tag&action=search&id=62', 'tag/m09/', '1');
INSERT INTO `_sef_alias` VALUES ('361', 'index.php?module=tag&action=search&id=60', 'tag/m06/', '1');
INSERT INTO `_sef_alias` VALUES ('362', 'index.php?module=blog&action=track&id=28', 'blog/track/id/28/', '2');
INSERT INTO `_sef_alias` VALUES ('363', 'index.php?module=blog&action=track&id=29', 'blog/track/id/29/', '3');
INSERT INTO `_sef_alias` VALUES ('364', 'index.php?module=blog&action=track&id=30', 'blog/track/id/30/', '3');
INSERT INTO `_sef_alias` VALUES ('365', 'index.php?module=tag&action=search&id=94', 'tag/search/id/94/', '0');

-- ----------------------------
-- Procedure structure for `ALL_POSTS`
-- ----------------------------
DROP PROCEDURE IF EXISTS `ALL_POSTS`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ALL_POSTS`()
BEGIN
    CREATE TEMPORARY TABLE IF NOT EXISTS `all_posts` AS (
        SELECT p.`id`, p.`alias`, p.`name`, p.`teaser`, p.`description`, 
            (
                SELECT CONCAT('[', GROUP_CONCAT(CONCAT('{"id":',_t.`id`, ',"name":"', _t.`name`, '"}')), ']')
                FROM `post_tags` AS _pt 
                JOIN `tags` AS _t ON _t.`id` = _pt.`tag_id` 
                WHERE _pt.`post_id` = p.`id`
                  AND _pt.`type` = 'meta'
            ) AS `metakeys`,
            (
                SELECT CONCAT('[', GROUP_CONCAT(CONCAT('{"id":',_t.`id`, ',"name":"', _t.`name`, '"}')), ']')
                FROM `post_tags` AS _pt 
                JOIN `tags` AS _t ON _t.`id` = _pt.`tag_id` 
                WHERE _pt.`post_id` = p.`id`
                  AND _pt.`type` = 'taxonomy'
            ) AS `taxonomy`,
            p.`metadesc`,
            p.`is_music`, p.`catnum`, p.`genre`, p.`length`, p.`quality`, p.`tracklist`,
            (
                SELECT CONCAT('[', GROUP_CONCAT(CONCAT('{"id":',_f.`id`, ',"source":"', _f.`source`, '"}')), ']')
                FROM `post_files` AS _pf 
                JOIN `files` AS _f ON _f.`id` = _pf.`file_id` 
                WHERE _pf.`post_id` = p.`id`
                  AND _f.`type` = 'preview'
            ) AS `preview`,
            (
                SELECT CONCAT('[', GROUP_CONCAT(CONCAT('{"id":',_f.`id`, ',"source":"', _f.`source`, '"}')), ']')
                FROM `post_files` AS _pf 
                JOIN `files` AS _f ON _f.`id` = _pf.`file_id` 
                WHERE _pf.`post_id` = p.`id`
                  AND _f.`type` = 'release'
            ) AS `release`,
            (
                SELECT CONCAT('[', GROUP_CONCAT(CONCAT('{"id":',_f.`id`, ',"source":"', _f.`source`, '"}')), ']')
                FROM `post_files` AS _pf 
                JOIN `files` AS _f ON _f.`id` = _pf.`file_id` 
                WHERE _pf.`post_id` = p.`id`
                  AND _f.`type` = 'covers'
            ) AS `covers`,
            (
                SELECT CONCAT('[', GROUP_CONCAT(CONCAT('{"id":',_p.`id`, ',"name":"', _p.`name`, '","source":"', _f.`source`, '"}')), ']')
                FROM `post_relations` AS _pr
                JOIN `post` AS _p ON _p.`id` = _pr.`destination_id`
                JOIN `post_files` AS _pf ON _pf.`post_id` = _p.`id`
                JOIN `files` AS _f ON _f.`id` = _pf.`file_id`
                WHERE _pr.`original_id` = p.`id`
                  AND _f.`type` = 'covers'
            ) AS `relations`
            , p.`created`, p.`viewed`, p.`timestamp`
        FROM `post` AS p
    );
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `CHECK_COOKIE`
-- ----------------------------
DROP PROCEDURE IF EXISTS `CHECK_COOKIE`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CHECK_COOKIE`(IN `_cookie` varchar(32), IN `_secret` varchar(32))
BEGIN
    SELECT `id` 
    FROM `user` 
    WHERE _cookie = MD5(CONCAT(_secret, `email`))
    LIMIT 0, 1;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `CHECK_EMAIL`
-- ----------------------------
DROP PROCEDURE IF EXISTS `CHECK_EMAIL`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CHECK_EMAIL`(IN `_email` varchar(32))
BEGIN
    SELECT `id` 
    FROM `user` 
    WHERE `email` = _email 
    LIMIT 0, 1;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `CHECK_LOGIN`
-- ----------------------------
DROP PROCEDURE IF EXISTS `CHECK_LOGIN`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CHECK_LOGIN`(IN `_email` varchar(32), IN `_password` varchar(32))
BEGIN
    SELECT `id` 
    FROM `user`
    WHERE `email` = _email
      AND `password` = _password
    LIMIT 0, 1;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `CHECK_USERNAME`
-- ----------------------------
DROP PROCEDURE IF EXISTS `CHECK_USERNAME`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CHECK_USERNAME`(IN `_username` varchar(32))
BEGIN
    SELECT `id` 
    FROM `user` 
    WHERE `username` = _username
    LIMIT 0, 1;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `CREATE_FILE_RELATIONS`
-- ----------------------------
DROP PROCEDURE IF EXISTS `CREATE_FILE_RELATIONS`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CREATE_FILE_RELATIONS`(IN `_post_id` int,IN `_ids` varchar(255))
BEGIN
    DECLARE _index INT Default 0;
    DECLARE _current VARCHAR(255);

    default_loop: LOOP
        SET _index = _index + 1;
        SET _current = SPLIT_STR(_ids, ",", _index);

        SELECT _current;
        IF _current = '' THEN
            LEAVE default_loop;
        END IF;

        # Do Inserts
        INSERT INTO `post_files` (`post_id`, `file_id`)
        VALUES (_post_id, _current);
    END LOOP default_loop;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `CREATE_POST_RELATIONS`
-- ----------------------------
DROP PROCEDURE IF EXISTS `CREATE_POST_RELATIONS`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CREATE_POST_RELATIONS`(IN `_post_id` int,IN `_ids` varchar(255))
BEGIN
    DECLARE _index INT Default 0;
    DECLARE _current VARCHAR(255);

    default_loop: LOOP
        SET _index = _index + 1;
        SET _current = SPLIT_STR(_ids, ",", _index);

        SELECT _current;
        IF _current = '' THEN
            LEAVE default_loop;
        END IF;

        # Do Inserts
        INSERT INTO `post_relations` (`original_id`, `destination_id`)
        VALUES (_post_id, _current);
    END LOOP default_loop;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `CREATE_TAGS_RELATIONS`
-- ----------------------------
DROP PROCEDURE IF EXISTS `CREATE_TAGS_RELATIONS`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CREATE_TAGS_RELATIONS`(IN `_post_id` int,IN `_ids` varchar(255))
BEGIN
    DECLARE _index INT Default 0;
    DECLARE _current VARCHAR(255);

    default_loop: LOOP
        SET _index = _index + 1;
        SET _current = SPLIT_STR(_ids, ",", _index);

        SELECT _current;
        IF _current = '' THEN
            LEAVE default_loop;
        END IF;

        # Do Inserts
        INSERT INTO `post_tags` (`post_id`, `tag_id`)
        VALUES (_post_id, _current);
    END LOOP default_loop;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `DELETE_POST_BY_ID`
-- ----------------------------
DROP PROCEDURE IF EXISTS `DELETE_POST_BY_ID`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `DELETE_POST_BY_ID`(IN `_id` int)
BEGIN
    DELETE FROM `post`
    WHERE `id` = _id;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `GET_FILES`
-- ----------------------------
DROP PROCEDURE IF EXISTS `GET_FILES`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GET_FILES`(IN `_type` varchar(32), IN `_limit` int)
BEGIN
    SET @type = _type;
    SET @rows = _limit;
		
    IF _type <> '' THEN
			PREPARE stmt FROM "
				SELECT `id`, `type`, `name`, `description`, `source`, `size`, `md5`, `timestamp`
				FROM `files`
				WHERE `type` = ?
				ORDER BY `source`
				LIMIT ?;";

			EXECUTE stmt USING @type, @rows;
    ELSE
			PREPARE stmt FROM "
				SELECT `id`, `type`, `name`, `description`, `source`, `size`, `md5`, `timestamp`
				FROM `files`
				ORDER BY `source`
				LIMIT ?;";
      
      EXECUTE stmt USING @rows;
    END IF;	
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `GET_GALLERY`
-- ----------------------------
DROP PROCEDURE IF EXISTS `GET_GALLERY`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GET_GALLERY`(IN `_limit` int)
BEGIN
    PREPARE stmt FROM "
		    SELECT g.`id`, g.`path`, g.`name`, g.`alias`, g.`description`, g.`metadesc`, g.`timestamp`,
					(
							SELECT GROUP_CONCAT(CONCAT_WS(':', _t.`id`, _t.`name`))
							FROM `gallery_tags` AS _gt
							JOIN `tags` AS _t ON _t.`id` = _gt.`tag_id`
							WHERE _gt.`gallery_id` = g.`id`
								AND _gt.`type` = 'meta'
					) AS `metatags`,
					(
							SELECT GROUP_CONCAT(CONCAT_WS(':', _t.`id`, _t.`name`))
							FROM `gallery_tags` AS _gt
							JOIN `tags` AS _t ON _t.`id` = _gt.`tag_id`
							WHERE _gt.`gallery_id` = g.`id`
								AND _gt.`type` = 'taxonomy'
					) AS `taxonomy`
			  FROM `gallery` AS g
			  LIMIT ?;";

    SET @rows = _limit;
    EXECUTE stmt USING @rows;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `GET_GALLERY_BY_ID`
-- ----------------------------
DROP PROCEDURE IF EXISTS `GET_GALLERY_BY_ID`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GET_GALLERY_BY_ID`(IN `_id` int)
BEGIN
    SELECT g.`id`, g.`path`, g.`name`, g.`description`, g.`timestamp`,
        (
            SELECT GROUP_CONCAT(CONCAT_WS(':', _t.`id`, _t.`name`))
            FROM `gallery_tags` AS _gt
            JOIN `tags` AS _t ON _t.`id` = _gt.`tag_id`
            WHERE _gt.`gallery_id` = g.`id`
              AND _gt.`type` = 'meta'
        ) AS `metatags`,
        (
            SELECT GROUP_CONCAT(CONCAT_WS(':', _t.`id`, _t.`name`))
            FROM `gallery_tags` AS _gt
            JOIN `tags` AS _t ON _t.`id` = _gt.`tag_id`
            WHERE _gt.`gallery_id` = g.`id`
              AND _gt.`type` = 'taxonomy'
        ) AS `taxonomy`,
        g.`metadesc`
    FROM `gallery` AS g
    WHERE g.`id` = _id;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `GET_GALLERY_BY_TAGS`
-- ----------------------------
DROP PROCEDURE IF EXISTS `GET_GALLERY_BY_TAGS`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GET_GALLERY_BY_TAGS`(IN `_tags` varchar(512), IN `_limit` int)
BEGIN
    SELECT g.`id`, g.`path`, g.`name`, g.`description`, g.`timestamp`,
        (
            SELECT GROUP_CONCAT(CONCAT_WS(':', _t.`id`, _t.`name`))
            FROM `gallery_tags` AS _gt
            JOIN `tags` AS _t ON _t.`id` = _gt.`tag_id`
            WHERE _gt.`gallery_id` = g.`id`
              AND _gt.`type` = 'meta'
        ) AS `metatags`,
        (
            SELECT GROUP_CONCAT(CONCAT_WS(':', _t.`id`, _t.`name`))
            FROM `gallery_tags` AS _gt
            JOIN `tags` AS _t ON _t.`id` = _gt.`tag_id`
            WHERE _gt.`gallery_id` = p.`id`
              AND _gt.`type` = 'taxonomy'
        ) AS `taxonomy`,
        g.`metadesc`
    FROM `gallery` AS p
    JOIN `gallery_tags` AS gt ON gt.`gallery_id` = g.`id`
    JOIN `tags` AS t ON t.`id` = gt.`tag_id`
    WHERE t.`name` IN (_tags)
    LIMIT _limit;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `GET_GALLERY_ITEMS`
-- ----------------------------
DROP PROCEDURE IF EXISTS `GET_GALLERY_ITEMS`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GET_GALLERY_ITEMS`(IN `_path` varchar(255))
BEGIN
    SELECT *
    FROM `files`
    WHERE `source` LIKE CONCAT('%', _path, '%');
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `GET_GALLERY_ITEMS_BY_ID`
-- ----------------------------
DROP PROCEDURE IF EXISTS `GET_GALLERY_ITEMS_BY_ID`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GET_GALLERY_ITEMS_BY_ID`(IN `_id` int)
BEGIN
    SELECT f.*
    FROM `files` f
    JOIN `gallery_files` gf ON gf.`file_id` = f.`id`
    WHERE gf.`gallery_id` = _id
    ORDER BY f.`timestamp` DESC, f.`id` DESC;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `GET_LATEST_IMAGES`
-- ----------------------------
DROP PROCEDURE IF EXISTS `GET_LATEST_IMAGES`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GET_LATEST_IMAGES`(IN `_limit` int)
BEGIN
    PREPARE stmt FROM "
			SELECT *
			FROM `files`
			WHERE `type` = 'gallery'
			ORDER BY `timestamp` DESC, `id` DESC
			LIMIT ?;";

    SET @rows = _limit;
    EXECUTE stmt USING @rows;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `GET_NEXT_IMAGE_BY_ID`
-- ----------------------------
DROP PROCEDURE IF EXISTS `GET_NEXT_IMAGE_BY_ID`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GET_NEXT_IMAGE_BY_ID`(IN `_id` int)
BEGIN
    DECLARE __gallery_id INT;
    DECLARE __count_left INT;

    SELECT `gallery_id`
    INTO __gallery_id
    FROM `gallery_files`
    WHERE `file_id` = _id;

    CREATE TEMPORARY TABLE IF NOT EXISTS `next_image` AS (
        SELECT f.*
        FROM `gallery_files` gf
        JOIN `files` f ON f.`id` = gf.`file_id`
        WHERE gf.`file_id` < _id
          AND gf.`gallery_id` = __gallery_id
        ORDER BY f.`timestamp` DESC, f.`id` DESC
        LIMIT 1
    );

    SELECT COUNT(*)
    INTO __count_left
    FROM `next_image`;

    IF __count_left > 0 THEN
        SELECT * FROM `next_image`;
    ELSE
        SELECT f.*
        FROM `gallery_files` gf
        JOIN `files` f ON f.`id` = gf.`file_id`
        WHERE gf.`gallery_id` = __gallery_id
        ORDER BY f.`timestamp` DESC, f.`id` DESC
        LIMIT 1;
    END IF;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `GET_POPULAR_IMAGES`
-- ----------------------------
DROP PROCEDURE IF EXISTS `GET_POPULAR_IMAGES`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GET_POPULAR_IMAGES`(IN `_limit` int)
BEGIN
    PREPARE stmt FROM "
			SELECT *
			FROM `files`
			WHERE `type` = 'gallery'
			ORDER BY `viewed` DESC
			LIMIT ?;";

    SET @rows = _limit;
    EXECUTE stmt USING @rows;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `GET_POSTS`
-- ----------------------------
DROP PROCEDURE IF EXISTS `GET_POSTS`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GET_POSTS`(IN `_limitstart` int, IN `_limit` int)
BEGIN
    CALL ALL_POSTS();

    PREPARE stmt FROM "
			SELECT p.*
			FROM `all_posts` AS p
			WHERE p.`is_music` = 1
			ORDER BY p.`created` DESC
			LIMIT ?, ?;";

    SET @skip = _limitstart;
    SET @rows = _limit;
    EXECUTE stmt USING @skip, @rows;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `GET_POSTS_BY_TAGS`
-- ----------------------------
DROP PROCEDURE IF EXISTS `GET_POSTS_BY_TAGS`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GET_POSTS_BY_TAGS`(IN `_tags` varchar(512), IN `_limit` int)
BEGIN
    CALL ALL_POSTS();

    PREPARE stmt FROM "
			SELECT p.*
			FROM `all_posts` AS p
			JOIN `post_tags` AS pt ON pt.`post_id` = p.`id`
			JOIN `tags` AS t ON t.`id` = pt.`tag_id` 
			WHERE t.`name` IN (?)
			ORDER BY p.`viewed` DESC
			LIMIT ?;";

    SET @tags = _tags;
    SET @rows = _limit;
    EXECUTE stmt USING @tags, @rows;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `GET_POSTS_BY_TAG_ID`
-- ----------------------------
DROP PROCEDURE IF EXISTS `GET_POSTS_BY_TAG_ID`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GET_POSTS_BY_TAG_ID`(IN `_id` int, IN `_limit` int)
BEGIN
		CALL ALL_POSTS();

    PREPARE stmt FROM "
			SELECT p.*
			FROM `all_posts` AS p
			JOIN `post_tags` AS pt ON pt.`post_id` = p.`id`
			JOIN `tags` AS t ON t.`id` = pt.`tag_id` 
			WHERE t.`id` = ?
			LIMIT 0, ?;";

		SET @id = _id;
    SET @rows = _limit;
    EXECUTE stmt USING @id, @rows;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `GET_POSTS_BY_VIEW_COUNT`
-- ----------------------------
DROP PROCEDURE IF EXISTS `GET_POSTS_BY_VIEW_COUNT`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GET_POSTS_BY_VIEW_COUNT`(IN `_limit` int, IN `_with_covers` tinyint)
BEGIN
		CALL ALL_POSTS();

		IF _with_covers > 0 THEN
		    PREPARE stmt FROM "SELECT p.*
					FROM `all_posts` AS p
					WHERE `covers` IS NOT NULL
					ORDER BY p.`viewed` DESC, p.`created` DESC
					LIMIT ?;";
		ELSE
				PREPARE stmt FROM "SELECT p.*
					FROM `all_posts` AS p
					ORDER BY p.`viewed` DESC, p.`created` DESC
					LIMIT ?;";
		END IF;

    SET @rows = _limit;
    EXECUTE stmt USING @rows;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `GET_POST_BY_ID`
-- ----------------------------
DROP PROCEDURE IF EXISTS `GET_POST_BY_ID`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GET_POST_BY_ID`(IN `_id` int)
BEGIN
    CALL ALL_POSTS();

    SELECT p.*
    FROM `all_posts` AS p
    WHERE p.`id` = _id;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `GET_POST_RELATIONS`
-- ----------------------------
DROP PROCEDURE IF EXISTS `GET_POST_RELATIONS`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GET_POST_RELATIONS`(IN `_id` int)
BEGIN
    IF (_id > 0) THEN
        SELECT p.`id` AS `id`, p.`name` AS `name`
        FROM `post_relations` AS pr
        LEFT JOIN `post` AS p ON p.`id` = pr.`destination_id`
        WHERE pr.`original_id` = _id;
    ELSE
        SELECT p.`id` AS `id`, p.`name` AS `name`
        FROM `post` AS p;
    END IF;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `GET_PREV_IMAGE_BY_ID`
-- ----------------------------
DROP PROCEDURE IF EXISTS `GET_PREV_IMAGE_BY_ID`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GET_PREV_IMAGE_BY_ID`(IN `_id` int)
BEGIN
    DECLARE __gallery_id INT;
    DECLARE __count_left INT;

    SELECT `gallery_id`
    INTO __gallery_id
    FROM `gallery_files`
    WHERE `file_id` = _id;

    CREATE TEMPORARY TABLE IF NOT EXISTS `prev_image` AS (
        SELECT f.*
        FROM `gallery_files` gf
        JOIN `files` f ON f.`id` = gf.`file_id`
        WHERE gf.`file_id` > _id
          AND gf.`gallery_id` = __gallery_id
        ORDER BY f.`timestamp` ASC, f.`id` ASC
        LIMIT 1
    );

    SELECT COUNT(*)
    INTO __count_left
    FROM `prev_image`;

    IF __count_left > 0 THEN
        SELECT * FROM `prev_image`;
    ELSE
        SELECT f.*
        FROM `gallery_files` gf
        JOIN `files` f ON f.`id` = gf.`file_id`
        WHERE gf.`gallery_id` = __gallery_id
        ORDER BY f.`timestamp` ASC, f.`id` ASC
        LIMIT 1;
    END IF;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `GET_SEF`
-- ----------------------------
DROP PROCEDURE IF EXISTS `GET_SEF`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GET_SEF`(IN `_link` varchar(255))
BEGIN
    SELECT * 
    FROM `_sef_alias`
    WHERE `link` LIKE _link
       OR `request` LIKE _link;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `GET_SEF_MAP_ALIAS`
-- ----------------------------
DROP PROCEDURE IF EXISTS `GET_SEF_MAP_ALIAS`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GET_SEF_MAP_ALIAS`(IN `_field` varchar(255), IN `_table` varchar(255), IN `_id` int)
BEGIN
    SET @q = CONCAT('SELECT ', _field, ' FROM ', _table, ' WHERE `id` = ', _id);
		PREPARE stmt FROM @q;
		EXECUTE stmt;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `GET_TAGS`
-- ----------------------------
DROP PROCEDURE IF EXISTS `GET_TAGS`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GET_TAGS`(IN `_limit` int)
BEGIN
    PREPARE stmt FROM "
			SELECT t.*, COUNT(pt.`id`) `count`
			FROM `tags` t
			JOIN `post_tags` pt ON pt.`tag_id` = t.`id`
			GROUP BY t.`id`
			ORDER BY `count` DESC
			LIMIT ?;";

    SET @rows = _limit;
    EXECUTE stmt USING @rows;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `GET_TAGS_BY_IDS`
-- ----------------------------
DROP PROCEDURE IF EXISTS `GET_TAGS_BY_IDS`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GET_TAGS_BY_IDS`(IN `_ids` varchar(32))
BEGIN
    SET @sql = CONCAT('SELECT * FROM `tags` WHERE `id` IN (', _ids, ');');
    PREPARE stmt FROM @sql;
    EXECUTE stmt;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `GET_USER_BY_ID`
-- ----------------------------
DROP PROCEDURE IF EXISTS `GET_USER_BY_ID`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GET_USER_BY_ID`(IN `_id` int)
BEGIN
    SELECT u.*, g.`name` AS `group` 
    FROM `user` AS u
    JOIN `group` AS g ON g.`id` = u.`group_id`
    WHERE u.`id` = _id
    LIMIT 0, 1;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `REMOVE_FILE`
-- ----------------------------
DROP PROCEDURE IF EXISTS `REMOVE_FILE`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `REMOVE_FILE`(IN `_id` int)
BEGIN
    SELECT `source` 
    FROM `files` 
    WHERE `id` = _id OR `source` = _id;
    
    DELETE FROM `files` 
    WHERE `id` = _id OR `source` = _id;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `SEARCH_GALLERY`
-- ----------------------------
DROP PROCEDURE IF EXISTS `SEARCH_GALLERY`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SEARCH_GALLERY`(IN `_query` text)
BEGIN
    SELECT DISTINCT g.`id`, g.`path`, g.`name`, g.`alias`, g.`description`, g.`metadesc`, g.`timestamp`,
        (
            SELECT GROUP_CONCAT(CONCAT_WS(':', _t.`id`, _t.`name`))
            FROM `gallery_tags` AS _gt
            JOIN `tags` AS _t ON _t.`id` = _gt.`tag_id`
            WHERE _gt.`gallery_id` = g.`id`
              AND _gt.`type` = 'meta'
        ) AS `metatags`,
        (
            SELECT GROUP_CONCAT(CONCAT_WS(':', _t.`id`, _t.`name`))
            FROM `gallery_tags` AS _gt
            JOIN `tags` AS _t ON _t.`id` = _gt.`tag_id`
            WHERE _gt.`gallery_id` = g.`id`
              AND _gt.`type` = 'taxonomy'
        ) AS `taxonomy`
    FROM `gallery` AS g
    LEFT JOIN `gallery_tags` AS gt ON gt.`gallery_id` = g.`id`
    LEFT JOIN `tags` AS t ON t.`id` = gt.`tag_id`
    WHERE g.`name` LIKE CONCAT('%', _query, '%')
       OR g.`alias` LIKE CONCAT('%', _query, '%')
       OR g.`description` LIKE CONCAT('%', _query, '%')
       OR g.`metadesc` LIKE CONCAT('%', _query, '%')
       OR t.`name` LIKE CONCAT('%', _query, '%')
       OR t.`alias` LIKE CONCAT('%', _query, '%');
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `SEARCH_POST`
-- ----------------------------
DROP PROCEDURE IF EXISTS `SEARCH_POST`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SEARCH_POST`(IN `_query` text)
BEGIN
    CALL ALL_POSTS();

    SELECT DISTINCT p.*
    FROM `all_posts` AS p
    LEFT JOIN `post_tags` AS pt ON pt.`post_id` = p.`id`
    LEFT JOIN `tags` AS t ON t.`id` = pt.`tag_id`
    WHERE p.`name` LIKE CONCAT('%', _query, '%')
       OR p.`alias` LIKE CONCAT('%', _query, '%')       
       OR p.`teaser` LIKE CONCAT('%', _query, '%')
       OR p.`description` LIKE CONCAT('%', _query, '%')
       OR p.`metadesc` LIKE CONCAT('%', _query, '%')
       OR p.`catnum` LIKE CONCAT('%', _query, '%')
       OR p.`genre` LIKE CONCAT('%', _query, '%')
       OR p.`quality` LIKE CONCAT('%', _query, '%')
       OR p.`length` LIKE CONCAT('%', _query, '%')
       OR p.`tracklist` LIKE CONCAT('%', _query, '%')
       OR t.`name` LIKE CONCAT('%', _query, '%')
       OR t.`alias` LIKE CONCAT('%', _query, '%');
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `SEARCH_TAGS`
-- ----------------------------
DROP PROCEDURE IF EXISTS `SEARCH_TAGS`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SEARCH_TAGS`(IN `_query` varchar(32))
BEGIN
    SELECT *
    FROM `tags`
    WHERE `name` LIKE _query;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `TRACK_FILE_BY_ID`
-- ----------------------------
DROP PROCEDURE IF EXISTS `TRACK_FILE_BY_ID`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `TRACK_FILE_BY_ID`(IN `_id` int)
BEGIN
    UPDATE `files`
    SET `viewed` = `viewed` + 1
    WHERE `id` = _id;

    SELECT `viewed`
    FROM `files`
    WHERE `id` = _id; 
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `TRACK_GALLERY_BY_ID`
-- ----------------------------
DROP PROCEDURE IF EXISTS `TRACK_GALLERY_BY_ID`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `TRACK_GALLERY_BY_ID`(IN `_id` int)
BEGIN
    UPDATE `gallery`
    SET `viewed` = `viewed` + 1
    WHERE `id` = _id;

    SELECT `viewed`
    FROM `gallery`
    WHERE `id` = _id; 
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `TRACK_POST_BY_ID`
-- ----------------------------
DROP PROCEDURE IF EXISTS `TRACK_POST_BY_ID`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `TRACK_POST_BY_ID`(IN `_id` int)
BEGIN
    UPDATE `post`
    SET `viewed` = `viewed` + 1
    WHERE `id` = _id;

    SELECT `viewed`
    FROM `post`
    WHERE `id` = _id; 
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `UPDATE_PASSWORD`
-- ----------------------------
DROP PROCEDURE IF EXISTS `UPDATE_PASSWORD`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `UPDATE_PASSWORD`(IN `_email` varchar(64), IN `_password` varchar(32))
BEGIN
    UPDATE `user` 
    SET `password` = _password
    WHERE `email` = _email
    LIMIT 1;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `UPDATE_POST_DATE`
-- ----------------------------
DROP PROCEDURE IF EXISTS `UPDATE_POST_DATE`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `UPDATE_POST_DATE`()
BEGIN
	  UPDATE `post` AS p
    JOIN `post_files` AS pf ON pf.`post_id` = p.`id`
	  JOIN `files` f ON f.`id` = pf.`file_id`
	  SET p.`created` = f.`timestamp`
	  WHERE p.`is_music` = 1
	    AND f.`type` = 'release';
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `UPDATE_SEF_COUNTER`
-- ----------------------------
DROP PROCEDURE IF EXISTS `UPDATE_SEF_COUNTER`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `UPDATE_SEF_COUNTER`(IN `_request` varchar(255),IN `_link` varchar(255))
BEGIN
    UPDATE `_sef_alias`
    SET `viewed` = `viewed` + 1
    WHERE `request` = _request
       OR `link` = _link;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `UPSERT_FILE`
-- ----------------------------
DROP PROCEDURE IF EXISTS `UPSERT_FILE`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `UPSERT_FILE`(IN `_type` varchar(32), IN `_name` varchar(255), IN `_description` text, IN `_source` text, IN `_size` int,IN `_md5` varchar(32))
BEGIN
    DECLARE __id INT;

    SELECT `id`
    INTO __id
    FROM `files`
    WHERE `md5` = _md5 AND `source` = _source;

    IF (__id > 0) THEN
        UPDATE `files`
        SET `type` = _type, `name` = _name, `description` = _description, `size` = _size
        WHERE `id` = __id;

        SELECT __id;
    ELSE
        INSERT INTO `files` (`type`, `name`, `description`, `source`, `size`, `md5`)
        VALUES (_type, _name, _description, _source, _size, _md5);

        SELECT LAST_INSERT_ID();
    END IF;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `UPSERT_GALLERY`
-- ----------------------------
DROP PROCEDURE IF EXISTS `UPSERT_GALLERY`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `UPSERT_GALLERY`(IN `_id` int(10), IN `_path` varchar(255), IN `_name` varchar(255), IN `_alias` varchar(64), IN `_description` text, IN `_metadesc` varchar(255))
BEGIN
    DECLARE __gallery_id INT;

    IF (_id > 0) THEN
        UPDATE `gallery`
        SET `path` = _path, `name` = _name, `alias` = _alias, `description` = _description, `metadesc` = _metadesc
        WHERE `id` = _id;

        SELECT _id AS `result`;
    ELSE
        SELECT `id`
        INTO __gallery_id
        FROM `gallery`
        WHERE `path` = _path;

        IF (__gallery_id > 0) THEN
            SELECT __gallery_id AS `result`;
        ELSE
            INSERT INTO `gallery` (`path`, `name`, `alias`, `description`, `metadesc`)
            VALUES (_path, _name, _alias, _description, _metadesc);

            SELECT LAST_INSERT_ID() AS `result`;
        END IF;
    END IF;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `UPSERT_GALLERY_FILES`
-- ----------------------------
DROP PROCEDURE IF EXISTS `UPSERT_GALLERY_FILES`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `UPSERT_GALLERY_FILES`(IN `_gallery_id` int, IN `_file_id` int)
BEGIN
    INSERT INTO `gallery_files` (`gallery_id`, `file_id`)
    VALUES (_gallery_id, _file_id);

    SELECT LAST_INSERT_ID();
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `UPSERT_POST`
-- ----------------------------
DROP PROCEDURE IF EXISTS `UPSERT_POST`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `UPSERT_POST`(IN `_id` int, IN `_name` varchar(255), IN `_alias` varchar(64), IN `_teaser` varchar(512), IN `_description` text, IN `_metakeys` varchar(255), IN `_metadesc` varchar(255), IN `_is_music` int, IN `_relations` varchar(255), IN `_catnum` varchar(255),  IN `_genre` varchar(255),  IN `_quality` varchar(255),  IN `_length` varchar(255), IN `_tracklist` text,  IN `_attachments` varchar(255))
BEGIN
    DECLARE _post_id INT;
    IF (_id > 0) THEN
        SET _post_id = _id;
    END IF;

    # Remove old tags, files and relations
    DELETE FROM `post_tags` WHERE `post_id` = _post_id;
    DELETE FROM `post_files` WHERE `post_id` = _post_id;
    DELETE FROM `post_relations` WHERE `original_id` = _post_id;

    # Upsert post data
    IF (_post_id > 0) THEN
        UPDATE `post`
        SET `name` = _name, `alias` = _alias, `teaser` = _teaser, `description` = _description, `metadesc` = _metadesc,
            `is_music` = _is_music, `catnum`  = _catnum, `genre` = _genre, `quality` = _quality,
            `length` = _length, `tracklist` = _tracklist
        WHERE `id` = _post_id;
    ELSE
        INSERT INTO `post` (`name`, `alias`, `teaser`, `description`, `metadesc`, `is_music`,
             `catnum`, `genre`, `quality`, `length`, `tracklist`, `created`)
        VALUES (_name, _alias, _teaser, _description, _metadesc, _is_music, _catnum, _genre, _quality, _length, _tracklist, NOW());

        SELECT LAST_INSERT_ID() INTO _post_id;
    END IF;

    # Create tags, files and relations
    CALL CREATE_TAGS_RELATIONS(_post_id, _metakeys);
    CALL CREATE_FILE_RELATIONS(_post_id, _attachments);
    CALL CREATE_POST_RELATIONS(_post_id, _relations);

    # Return post IDENTIFIED
    SELECT _post_id;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `UPSERT_SEF`
-- ----------------------------
DROP PROCEDURE IF EXISTS `UPSERT_SEF`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `UPSERT_SEF`(IN `_request` varchar(255), IN `_link` varchar(255))
BEGIN
    INSERT INTO `_sef_alias` (`request`,`link`)
    VALUES (_request, _link);

    SELECT LAST_INSERT_ID() AS result;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `UPSERT_TAGS`
-- ----------------------------
DROP PROCEDURE IF EXISTS `UPSERT_TAGS`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `UPSERT_TAGS`(IN `_tags` varchar(255))
BEGIN
    DECLARE _index INT DEFAULT 0;
    DECLARE _current_id INT DEFAULT 0;
    DECLARE _previous_id INT DEFAULT 0;
    DECLARE _current_value VARCHAR(255);

    # Result set
    CREATE TEMPORARY TABLE IF NOT EXISTS `result_set` (
        `id` int NOT NULL,
        `name` varchar(32) NOT NULL
    ) ENGINE = MEMORY;
    TRUNCATE TABLE `result_set`;

    tags_loop: LOOP
        SET _index = _index + 1;
        SET _current_value = SPLIT_STR(_tags, ",", _index);

        IF _current_value = '' THEN
           LEAVE tags_loop;
        END IF;

        # Do existing tag
        SELECT `id`
        INTO _current_id
        FROM `tags`
        WHERE `name` = _current_value;

        # If not exists
        IF (_current_id = _previous_id) THEN
            INSERT INTO `tags` (`name`)
            VALUES (_current_value);
             
            SELECT LAST_INSERT_ID()
            INTO _current_id;
        END IF;

        # Add to result set
        INSERT INTO `result_set` (`id`, `name`)
        VALUES (_current_id, _current_value);

        SET _previous_id = _current_id;
    END LOOP tags_loop;

    # Retusr result set
    SELECT *
    FROM `result_set`;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `UPSERT_USER`
-- ----------------------------
DROP PROCEDURE IF EXISTS `UPSERT_USER`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `UPSERT_USER`(IN `_id` int, IN `_username` varchar(64), IN `_email` varchar(64), IN `_password` varchar(32))
BEGIN
    IF (_id > 0) THEN
        UPDATE `user`
        SET `username` = _username, `email` = _email, `password` = _password
        WHERE `id` = __id;

        SELECT __id AS record_id;
    ELSE
        INSERT INTO `user` (`username`, `email`, `password`)
        VALUES (_username, _email, _password);

        SELECT LAST_INSERT_ID() AS record_id;
    END IF;
END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for `SPLIT_STR`
-- ----------------------------
DROP FUNCTION IF EXISTS `SPLIT_STR`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `SPLIT_STR`(`_source` varchar(255),`_delimiter` varchar(1),`_position` int) RETURNS varchar(255) CHARSET utf8
BEGIN
    RETURN REPLACE (
        SUBSTRING(SUBSTRING_INDEX(_source, _delimiter, _position),
        LENGTH(SUBSTRING_INDEX(_source, _delimiter, _position - 1)) + 1),
       _delimiter, '');
END
;;
DELIMITER ;
