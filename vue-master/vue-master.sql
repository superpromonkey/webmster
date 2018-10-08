/*
Navicat MySQL Data Transfer

Source Server         : management
Source Server Version : 50714
Source Host           : localhost:3306
Source Database       : guanli

Target Server Type    : MYSQL
Target Server Version : 50714
File Encoding         : 65001

Date: 2018-10-07 23:40:22
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for goodslist
-- ----------------------------
DROP TABLE IF EXISTS `goodslist`;
CREATE TABLE `goodslist` (
  `id` int(255) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(255) DEFAULT NULL,
  `price` varchar(255) DEFAULT NULL,
  `date` varchar(255) DEFAULT '',
  `status` int(2) DEFAULT NULL,
  `control` int(2) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goodslist
-- ----------------------------
INSERT INTO `goodslist` VALUES ('3', '手机', '2399.00', '2018/9/25 20:00:29', '0', '1', '荣耀10 AI摄影手机 6GB+128GB 幻影蓝 全网通 双卡双待 尊享版');
INSERT INTO `goodslist` VALUES ('4', '笔记本电脑', '16699.00', '2018/9/25 20:01:30', '0', '1', 'Apple MacBook Pro 15.4英寸 深空灰色 配备Touch Bar 2018新款(六核八');
INSERT INTO `goodslist` VALUES ('5', '笔记本', '8728.00', '2018/9/25 20:02:00', '0', '1', 'Apple MacBook Pro 13.3英寸笔记本电脑 银色 Core i5/8GB内存/128GB硬');
INSERT INTO `goodslist` VALUES ('6', '手机', '4028.00', '2018/9/25 20:02:23', '0', '1', '华为 P20 Pro 全面屏徕卡三摄 6GB +64GB 宝石蓝 全网通版 4G手机');
INSERT INTO `goodslist` VALUES ('7', '家用电器', '8199.00', '2018/9/25 20:03:37', '0', '1', '索尼(SONY)电视 65英寸 大屏4K 智能网络 液晶电视 腾讯视频内容 HDR(黑色)KD-65X8566F\r\n\r\n索尼(SONY)电视 65英寸 大屏4K 智能网络 液晶电视 腾讯视频内容 HDR');
INSERT INTO `goodslist` VALUES ('8', '家用电器', '1599.00', '2018/9/25 20:04:03', '0', '1', 'Bobot 智能电动拖地机 拖把 电拖把 家用 无线 手持 旋转 打蜡 擦地 Mop8');
INSERT INTO `goodslist` VALUES ('9', '手机', '1598.00', '2018/9/25 20:04:29', '0', '1', 'vivo Z1 新一代全面屏AI双摄手机 4GB+64GB 炫慕红 移动联通电信全网通');
INSERT INTO `goodslist` VALUES ('10', '手机配件', '1599.00', '2018/9/25 20:05:14', '0', '1', '索尼WI-1000X 颈挂式降噪蓝牙耳机 WI-1000X黑色');
INSERT INTO `goodslist` VALUES ('11', '相机', '13299.00', '2018/9/25 20:05:44', '0', '1', 'Olympus 奥林巴斯 E-M1 Mark II(12-40mmPRO)微型单电套机');
INSERT INTO `goodslist` VALUES ('12', '电脑配件', '569.00', '2018/9/25 20:06:44', '0', '1', 'TOSHIBA 东芝 新黑甲虫系列 2.5寸 2TB USB3.0 移动硬盘 黑色 HDTB320');
INSERT INTO `goodslist` VALUES ('13', '笔记本', '6788.00', '2018/9/25 20:09:13', '0', '1', 'HUAWEI 华为 MateBook X 13英寸 轻薄笔记本电脑(i5-7200U 8G 256G Wifi');
INSERT INTO `goodslist` VALUES ('14', '手机', '2849.00', '2018/9/25 20:09:46', '0', '1', '荣耀Note10 全网通6G+128G幻影蓝 移动联通电信4G全面屏 游戏手机');
INSERT INTO `goodslist` VALUES ('15', '家用电器', '2499.00', '2018/9/25 20:21:32', '0', '1', '美的 Midea 移动空调一体机冷暖大1.5p 冷暖 厨房空调K');
INSERT INTO `goodslist` VALUES ('16', '电脑配件', '7199.00', '2018/9/25 20:27:50', '0', '1', 'Microsoft 微软 New Surface Pro 二合一平板电脑 12.3英');
INSERT INTO `goodslist` VALUES ('17', '手机配件', '699.00', '2018/9/25 20:29:06', '0', '1', 'TEK 泰怡凯 科沃斯 吸尘器 家用 手持 无线 充电车载 ');
INSERT INTO `goodslist` VALUES ('18', '手机', '2119.00', '2018/9/25 20:29:25', '0', '1', '华为 HUAWEI nova 2S 全面屏四摄 6GB +128GB 银钻灰 ');
INSERT INTO `goodslist` VALUES ('19', '手机配件', '229.00', '2018/9/25 20:30:16', '0', '1', 'JBL GO2 音乐金砖二代 蓝牙音箱 低音炮 户外便携音响 ');
INSERT INTO `goodslist` VALUES ('20', '手机配件', '2388.00', '2018/9/25 20:30:42', '0', '1', 'Bose QuietComfort 35 II 无线降噪耳机蓝牙耳麦 耳机');
INSERT INTO `goodslist` VALUES ('21', '笔记本', '8399.00', '2018/9/25 20:39:00', '0', '1', 'Thinkpad 14英寸轻薄笔记本电脑 X1 CARBON @07CD (i5-7200U 内存8G 硬盘256GSSD 集成 win10)');
INSERT INTO `goodslist` VALUES ('22', '电脑配件', '999.00', '2018/9/25 20:36:47', '0', '1', 'Seagate 希捷 V5系列 4T 企业级硬盘 ST4000NM0035 - 7200转 SATA3 128M');
INSERT INTO `goodslist` VALUES ('23', '笔记本 ', '14888.00', '2018/9/25 20:39:25', '0', '1', 'Apple MacBook Pro 13.3英寸笔记本 深空灰 Multi-Touch Bar/Core i5/8G/256G');
INSERT INTO `goodslist` VALUES ('24', '笔记本', '17999.00', '2018/9/25 20:40:00', '0', '1', 'Apple MacBook Pro 15.4英寸笔记本 深空灰 Multi-Touch Bar/Core ');
INSERT INTO `goodslist` VALUES ('25', '笔记本', '9988.00', '2018/9/25 20:40:34', '0', '1', 'Apple MacBook 12英寸笔记本电脑 深空灰 Core m3 处理器/8GB内存/256GB闪存 ');
INSERT INTO `goodslist` VALUES ('26', '笔记本', '4818.00', '2018/9/25 20:41:02', '0', '1', '(含亮铂金键盘)微软(Microsoft)Surface Go 二合一平板电脑 10英寸 8G内存 128G存储 ');
INSERT INTO `goodslist` VALUES ('27', '笔记本', '3818.00', '2018/9/25 20:41:29', '0', '1', '(含亮铂金键盘)微软(Microsoft)Surface Go 二合一平板电脑 10英寸 4G内存 64G存储 ');
INSERT INTO `goodslist` VALUES ('28', '电脑配件', '299.00', '2018/9/25 20:42:09', '0', '1', 'WD 西部数据 蓝盘 1TB 台式机硬盘 WD10EZEX - 3.5英寸 7200转 ');
INSERT INTO `goodslist` VALUES ('29', '电脑配件', '949.00', '2018/9/25 20:42:54', '0', '1', 'WD 西部数据 红盘 4TB NAS专用硬盘 WD40EFRX - 3.5英寸 5400-7200转 ');
INSERT INTO `goodslist` VALUES ('30', '电脑配件', '559.00', '2018/9/25 20:43:30', '0', '1', 'ViewSonic 优派 VA1921a 经典18.5英寸 节能 LED液晶显示器');
INSERT INTO `goodslist` VALUES ('31', '相机', '1669.00', '2018/9/25 20:44:39', '0', '1', '富士 FUJIFILM X-A10 (XC 16-50II) 微单电套机 摩卡棕');
INSERT INTO `goodslist` VALUES ('32', '电脑配件', '3259.00', '2018/9/25 20:45:20', '0', '1', '丹拿 (DYNAUDIO) Music 3 无线蓝牙音箱 云淡灰');
INSERT INTO `goodslist` VALUES ('33', '手机配件', '999.00', '2018/9/25 20:45:42', '0', '1', '索尼(SONY)WF-SP700N 全无线降噪蓝牙运动耳机 IPX4级防泼溅(黄色)');
INSERT INTO `goodslist` VALUES ('34', '电脑配件', '269.00', '2018/9/25 20:46:18', '0', '1', 'TP-LINK 普联 TL-WAR308 300M企业级无线路由器 wifi穿墙/防火墙 上网行为管理');
INSERT INTO `goodslist` VALUES ('35', '电脑配件', '149.00', '2018/9/25 20:46:53', '0', '1', 'Microsoft 微软 Sculpt 无线蓝影舒适滑控鼠标');
INSERT INTO `goodslist` VALUES ('36', '笔记本', '7888.00', '2018/9/25 20:48:04', '0', '1', 'Microsoft 微软 New Surface Pro 二合一平板电脑 12.3英寸(i5 8G 256G)(亮铂金键盘');
INSERT INTO `goodslist` VALUES ('37', '护肤品', '489.00', '2018/9/25 20:48:33', '0', '1', '意大利直邮 Estée Lauder 雅诗兰黛 小棕瓶眼精华 15ml');
INSERT INTO `goodslist` VALUES ('38', '护肤品', '169.00', '2018/9/25 20:48:58', '0', '1', '保税区发货 韩国 爱茉莉RYOE 紫吕滋养韧发敏感性洗发水套装 新款');
INSERT INTO `goodslist` VALUES ('39', '护肤品', '229.00', '2018/9/25 20:49:22', '0', '1', '香港直邮 美国kiehl\'s科颜氏 契尔氏 高保湿蛋白面霜50ml');
INSERT INTO `goodslist` VALUES ('40', '护肤品', '225.00', '2018/9/25 20:50:08', '0', '1', '荷兰直邮Balea 德国 芭乐雅 7日焕肤舒缓玻尿酸保湿精华安瓶 7*1ml/4件');
INSERT INTO `goodslist` VALUES ('41', '家用电器', '2499.00', '2018/9/25 20:50:39', '0', '1', 'iRobot 艾罗伯特 iRobot894 扫地机器人 不缠毛发 家用 全自动 智能 吸尘 清洁 机');
INSERT INTO `goodslist` VALUES ('42', '电脑配件', '2988.00', '2018/9/25 20:51:17', '0', '1', 'Apple iPad 2018年新款9.7英寸(128G WLAN版/A10芯片/Retina显示屏/Touch ID ');
INSERT INTO `goodslist` VALUES ('43', '手机配件', '878.00', '2018/9/25 20:51:49', '0', '1', 'Beats Powerbeats3 by Dr. Dre Wireless 蓝牙无线 运动耳机 - 白色 ML8W2PA/A');
INSERT INTO `goodslist` VALUES ('44', '家用电器', '2000.00', '2018/9/25 20:52:05', '0', '1', 'HOBOT 玻妞 擦窗机器人 三代 HOBOT 198 擦窗机 窗宝 无线智控 仿人工 全自动 ');
INSERT INTO `goodslist` VALUES ('45', '护肤品', '89.00', '2018/9/25 20:52:55', '0', '1', 'SkinWard+ 斯汀沃德 补水仪 纳米喷雾器 脸部保湿 面部加湿 蒸脸冷喷 充电礼盒 移');
INSERT INTO `goodslist` VALUES ('46', '护肤品', '149.00', '2018/9/25 20:54:34', '0', '1', '香港直邮MAC 美国 魅可 子弹头水漾润泽唇膏 CHILLI 3g');
INSERT INTO `goodslist` VALUES ('47', '护肤品', '138.00', '2018/9/25 20:55:05', '0', '1', '3盒装 UTENA 日本 佑天兰 黄色 3D蜂皇浆面膜 33g*3片');
INSERT INTO `goodslist` VALUES ('48', '护肤品', '225.00', '2018/9/25 20:55:37', '0', '1', '荷兰直邮Balea 德国 芭乐雅 7日焕肤舒缓玻尿酸保湿精华安瓶 7*1ml/4件');
INSERT INTO `goodslist` VALUES ('49', '护肤品', '389.00', '2018/9/25 20:56:08', '0', '1', '香港直邮 日本KOS/高丝 雪肌精化妆水200ml+乳液140ml套装(清爽型)');
INSERT INTO `goodslist` VALUES ('50', '电脑配件', '1899.00', '2018/9/25 20:56:27', '0', '1', '华硕(ASUS) GT-AC5300 玩家国度 电竞路由器 (4×4 MU-MIMO 8LAN 256MB FLASH ');

-- ----------------------------
-- Table structure for master
-- ----------------------------
DROP TABLE IF EXISTS `master`;
CREATE TABLE `master` (
  `id` int(255) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nickname` varchar(255) DEFAULT NULL,
  `sex` varchar(255) NOT NULL,
  `iphone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `textare` varchar(255) DEFAULT NULL,
  `createdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of master
-- ----------------------------
INSERT INTO `master` VALUES ('1', 'laowang', '123456', '王根基', '男', '16666666666', '123456@qq.com', '睡觉', '2018-10-07 23:36:21');
INSERT INTO `master` VALUES ('2', 'admin', '888888', '小林林', '男', '15555555555', '333333@163.com', '旅游', '2018-10-07 23:36:42');

-- ----------------------------
-- Table structure for userlist
-- ----------------------------
DROP TABLE IF EXISTS `userlist`;
CREATE TABLE `userlist` (
  `id` int(255) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `iphone` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `juese` varchar(255) NOT NULL,
  `shijian` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1025 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of userlist
-- ----------------------------
INSERT INTO `userlist` VALUES ('1', 'root', '12222222222', '97576555645@qq.com', '超级管理员', '2018-10-07 23:37:59', '已审核');
INSERT INTO `userlist` VALUES ('2', '王尼玛', '18888888888', '6767672894@qq.com', '管理员', '2018-10-07 23:37:30', '未审核');
INSERT INTO `userlist` VALUES ('3', '奥巴马', '1999999999', '7878903222@qq.com', '管理员', '2018-10-07 23:37:40', '未审核');
SET FOREIGN_KEY_CHECKS=1;
