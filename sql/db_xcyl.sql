/*
Navicat MySQL Data Transfer

Source Server         : sss
Source Server Version : 50528
Source Host           : 192.168.1.128:3306
Source Database       : db_xcyl

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2017-10-11 10:31:09
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sys_app_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_app_user`;
CREATE TABLE `sys_app_user` (
  `USER_ID` varchar(100) NOT NULL,
  `USERNAME` varchar(255) DEFAULT NULL,
  `PASSWORD` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `RIGHTS` varchar(255) DEFAULT NULL,
  `ROLE_ID` varchar(100) DEFAULT NULL,
  `LAST_LOGIN` varchar(255) DEFAULT NULL,
  `IP` varchar(100) DEFAULT NULL,
  `STATUS` varchar(32) DEFAULT NULL,
  `BZ` varchar(255) DEFAULT NULL,
  `PHONE` varchar(100) DEFAULT NULL,
  `SFID` varchar(100) DEFAULT NULL,
  `START_TIME` varchar(100) DEFAULT NULL,
  `END_TIME` varchar(100) DEFAULT NULL,
  `YEARS` int(10) DEFAULT NULL,
  `NUMBER` varchar(100) DEFAULT NULL,
  `EMAIL` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_app_user
-- ----------------------------
INSERT INTO `sys_app_user` VALUES ('04762c0b28b643939455c7800c2e2412', 'dsfsd', 'f1290186a5d0b1ceab27f4e77c0c5d68', 'w', '', '55896f5ce3c0494fa6850775a4e29ff6', '', '', '1', '', '18766666666', '', '', '', '0', '001', '18766666666@qq.com');

-- ----------------------------
-- Table structure for sys_contactwm
-- ----------------------------
DROP TABLE IF EXISTS `sys_contactwm`;
CREATE TABLE `sys_contactwm` (
  `contact_id` varchar(32) CHARACTER SET utf8 NOT NULL COMMENT '联系我们的主键',
  `hotline` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '客服热线电话',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `weizhi` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '位置',
  `detailWeizhi` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '详细位置',
  PRIMARY KEY (`contact_id`)
) ENGINE=InnoDB DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of sys_contactwm
-- ----------------------------
INSERT INTO `sys_contactwm` VALUES ('d1349b4542a64833bb65f11b159053ed', '0898-55524444', '2017-10-11 10:17:00', null, '天津市 县 宁河县', 'afafaf');

-- ----------------------------
-- Table structure for sys_dictionaries
-- ----------------------------
DROP TABLE IF EXISTS `sys_dictionaries`;
CREATE TABLE `sys_dictionaries` (
  `ZD_ID` varchar(100) NOT NULL,
  `NAME` varchar(100) DEFAULT NULL,
  `BIANMA` varchar(100) DEFAULT NULL,
  `ORDY_BY` int(10) DEFAULT NULL,
  `PARENT_ID` varchar(100) DEFAULT NULL,
  `JB` int(10) DEFAULT NULL,
  `P_BM` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`ZD_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_dictionaries
-- ----------------------------

-- ----------------------------
-- Table structure for sys_feedback
-- ----------------------------
DROP TABLE IF EXISTS `sys_feedback`;
CREATE TABLE `sys_feedback` (
  `feedback_id` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '意见反馈主键id',
  `textarea` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '留言框',
  `status` varchar(2) CHARACTER SET utf8 DEFAULT NULL COMMENT '状态(0 未处理 1 已处理)',
  `user_kehu_fid` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '外键(用户的主键ID号)',
  `create_time` datetime DEFAULT NULL COMMENT '反馈时间'
) ENGINE=InnoDB DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of sys_feedback
-- ----------------------------
INSERT INTO `sys_feedback` VALUES ('9578eef8c74140bd9ae85c19a2a80d5f', 'afasfsa', '1', 'd24a7be2ff8e459c91f5da9fe404c7da', '2017-09-28 16:53:36');

-- ----------------------------
-- Table structure for sys_gl_qx
-- ----------------------------
DROP TABLE IF EXISTS `sys_gl_qx`;
CREATE TABLE `sys_gl_qx` (
  `GL_ID` varchar(100) NOT NULL,
  `ROLE_ID` varchar(100) DEFAULT NULL,
  `FX_QX` int(10) DEFAULT NULL,
  `FW_QX` int(10) DEFAULT NULL,
  `QX1` int(10) DEFAULT NULL,
  `QX2` int(10) DEFAULT NULL,
  `QX3` int(10) DEFAULT NULL,
  `QX4` int(10) DEFAULT NULL,
  PRIMARY KEY (`GL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_gl_qx
-- ----------------------------
INSERT INTO `sys_gl_qx` VALUES ('0bcb8bef98684668a04bb16c398dc194', '4', '0', '0', '0', '0', '0', '0');
INSERT INTO `sys_gl_qx` VALUES ('1', '2', '1', '1', '1', '1', '1', '1');
INSERT INTO `sys_gl_qx` VALUES ('2', '1', '0', '0', '1', '1', '1', '1');
INSERT INTO `sys_gl_qx` VALUES ('55896f5ce3c0494fa6850775a4e29ff6', '7', '0', '0', '1', '0', '0', '0');
INSERT INTO `sys_gl_qx` VALUES ('605b0e19e54349d2b8cca96ece966da5', '1', '0', '0', '1', '1', '0', '0');
INSERT INTO `sys_gl_qx` VALUES ('68f23fc0caee475bae8d52244dea8444', '7', '0', '0', '1', '1', '0', '0');
INSERT INTO `sys_gl_qx` VALUES ('ac66961adaa2426da4470c72ffeec117', '1', '1', '0', '1', '1', '0', '0');
INSERT INTO `sys_gl_qx` VALUES ('b0c77c29dfa140dc9b14a29c056f824f', '7', '1', '0', '1', '1', '0', '0');
INSERT INTO `sys_gl_qx` VALUES ('e74f713314154c35bd7fc98897859fe3', '6', '1', '1', '1', '1', '0', '0');
INSERT INTO `sys_gl_qx` VALUES ('f944a9df72634249bbcb8cb73b0c9b86', '7', '1', '1', '1', '1', '0', '0');

-- ----------------------------
-- Table structure for sys_good_danwei
-- ----------------------------
DROP TABLE IF EXISTS `sys_good_danwei`;
CREATE TABLE `sys_good_danwei` (
  `danwei_id` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL COMMENT '物品单位名称',
  `time` varchar(255) DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`danwei_id`)
) ENGINE=InnoDB DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of sys_good_danwei
-- ----------------------------
INSERT INTO `sys_good_danwei` VALUES ('027fa068dfc043c6a7fef7bd56d71f34', '扎', '2017-09-22 17:36:56');
INSERT INTO `sys_good_danwei` VALUES ('1e9a55493dab49158c979f166ac320c1', '个', '2017-09-22 17:34:49');
INSERT INTO `sys_good_danwei` VALUES ('21186d4d5a3e4dedb58b6055b93fa027', '50斤', '2017-09-22 17:37:23');
INSERT INTO `sys_good_danwei` VALUES ('277cd4a8d550477c962c0275bd52f269', '件', '2017-09-22 17:37:31');
INSERT INTO `sys_good_danwei` VALUES ('2d11f1baa9a24d1aac30c6c0aa069ee1', '把', '2017-09-22 17:37:16');
INSERT INTO `sys_good_danwei` VALUES ('3acb6b7b68e8493b8d3bf93b2badb38a', '盒', '2017-09-22 17:36:48');
INSERT INTO `sys_good_danwei` VALUES ('540f4f9546eb46c88e8267ced0f90797', '支', '2017-09-22 17:37:36');
INSERT INTO `sys_good_danwei` VALUES ('6146b8ed999d4a8dad4e12faa6082f6c', '条', '2017-09-22 17:36:42');
INSERT INTO `sys_good_danwei` VALUES ('685895e4941a4b68af8238d9ec05c976', '份', '2017-09-22 17:34:56');
INSERT INTO `sys_good_danwei` VALUES ('7099b64b755a4c8bb7b43b9031e6734e', '袋', '2017-09-22 17:36:34');
INSERT INTO `sys_good_danwei` VALUES ('75b12372ad60420b990cc973610be5b1', '箱', '2017-09-22 17:35:21');
INSERT INTO `sys_good_danwei` VALUES ('7ad2d34893224abbb6f2030067dc3295', '张', '2017-09-22 17:35:09');
INSERT INTO `sys_good_danwei` VALUES ('7d46799f3d5d4a63afeceec2dbb4eaf9', '批', '2017-09-22 17:35:43');
INSERT INTO `sys_good_danwei` VALUES ('7d691b3fa48f47f4991029858141845f', '盆', '2017-09-22 17:38:17');
INSERT INTO `sys_good_danwei` VALUES ('82694944368d4231be2be41193f8e975', '斤', '2017-09-22 17:34:40');
INSERT INTO `sys_good_danwei` VALUES ('93d019f857b747c9a2ca4edbe9e3cdf8', '盘', '2017-09-22 17:35:15');
INSERT INTO `sys_good_danwei` VALUES ('a23f9905062a4803881e2c1fe7fdc7f8', '瓶', '2017-09-22 17:35:28');
INSERT INTO `sys_good_danwei` VALUES ('b326aea5775042e6bc444113fb368084', '筒', '2017-09-22 17:36:08');
INSERT INTO `sys_good_danwei` VALUES ('ce4a1d20793b41338c851e871eb437c9', '卷', '2017-09-22 17:37:04');
INSERT INTO `sys_good_danwei` VALUES ('fc2216ad5a3046b0ab0dc6d994d2ae0e', '包', '2017-09-22 17:35:36');
INSERT INTO `sys_good_danwei` VALUES ('fe67a00d8eb04458841efaff7dc5cbc7', '只', '2017-09-22 17:35:02');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `MENU_ID` int(11) NOT NULL,
  `MENU_NAME` varchar(255) DEFAULT NULL,
  `MENU_URL` varchar(255) DEFAULT NULL,
  `PARENT_ID` varchar(100) DEFAULT NULL,
  `MENU_ORDER` varchar(100) DEFAULT NULL,
  `MENU_ICON` varchar(30) DEFAULT NULL,
  `MENU_TYPE` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`MENU_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '系统管理', '#', '0', '1', 'icon-desktop', '2');
INSERT INTO `sys_menu` VALUES ('5', '系统用户', 'user/listUsers.do', '1', '3', null, '2');
INSERT INTO `sys_menu` VALUES ('21', '会员管理', '#', '0', '2', 'icon-comments', '2');
INSERT INTO `sys_menu` VALUES ('23', '会员列表', 'api/kehu/memberlistPage.do', '21', '2', null, '2');
INSERT INTO `sys_menu` VALUES ('24', '菜篮管理', '#', '0', '3', 'icon-list', '2');
INSERT INTO `sys_menu` VALUES ('26', '商品类别', 'api/kehu/getlistPagespfl.do', '24', '2', null, '2');
INSERT INTO `sys_menu` VALUES ('27', '商品管理', 'api/kehu/goodsgetlistPage.do', '24', '3', null, '2');
INSERT INTO `sys_menu` VALUES ('28', '综合管理', '#', '0', '5', 'icon-edit', '2');
INSERT INTO `sys_menu` VALUES ('29', '意见反馈', 'api/kehu/feedbacklistPage', '28', '1', null, '2');
INSERT INTO `sys_menu` VALUES ('31', '菜单管理', 'menu.do', '1', '3', null, '2');
INSERT INTO `sys_menu` VALUES ('35', '订单管理', '#', '0', '4', 'icon-list-alt', '2');
INSERT INTO `sys_menu` VALUES ('36', '订单列表', 'orderTakeout/getOrderTakeoulistPage.do', '35', '1', null, '2');
INSERT INTO `sys_menu` VALUES ('38', '菜篮分类', 'api/kehu/mokuailistPage.do', '24', '1', null, '2');
INSERT INTO `sys_menu` VALUES ('39', '商品单位', 'sys/manager/sysManagerlistPage.do', '24', '4', null, '2');
INSERT INTO `sys_menu` VALUES ('40', '端口管理', 'api/duankou/duankoulistPage.do', '24', '5', null, '2');
INSERT INTO `sys_menu` VALUES ('41', '联系我们', 'api/contact/contactlistPage', '28', '2', null, '2');
INSERT INTO `sys_menu` VALUES ('42', '商品汇总', '#', '0', '6', 'icon-book', '');
INSERT INTO `sys_menu` VALUES ('43', '销售汇总', 'goodsSummary/getgoodsSummarylist.do', '42', '1', null, '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `ROLE_ID` varchar(100) NOT NULL,
  `ROLE_NAME` varchar(100) DEFAULT NULL,
  `RIGHTS` varchar(255) DEFAULT NULL,
  `PARENT_ID` varchar(100) DEFAULT NULL,
  `ADD_QX` varchar(255) DEFAULT NULL,
  `DEL_QX` varchar(255) DEFAULT NULL,
  `EDIT_QX` varchar(255) DEFAULT NULL,
  `CHA_QX` varchar(255) DEFAULT NULL,
  `QX_ID` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ROLE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('0bcb8bef98684668a04bb16c398dc194', '小菜一篮商家', '118', '4', '0', '0', '0', '0', '0bcb8bef98684668a04bb16c398dc194');
INSERT INTO `sys_role` VALUES ('1', '系统管理员', '274871615654', '0', '1', '1', '1', '1', '1');
INSERT INTO `sys_role` VALUES ('2', '超级管理员', '274871615654', '1', '246', '50', '50', '38', '2');
INSERT INTO `sys_role` VALUES ('4', '用户组', '118', '0', '0', '0', '0', '0', null);
INSERT INTO `sys_role` VALUES ('55896f5ce3c0494fa6850775a4e29ff6', '特级会员', '498', '7', '0', '0', '0', '0', '55896f5ce3c0494fa6850775a4e29ff6');
INSERT INTO `sys_role` VALUES ('6', '客户组', '18', '0', '1', '1', '1', '1', null);
INSERT INTO `sys_role` VALUES ('68f23fc0caee475bae8d52244dea8444', '中级会员', '498', '7', '0', '0', '0', '0', '68f23fc0caee475bae8d52244dea8444');
INSERT INTO `sys_role` VALUES ('7', '会员组', '498', '0', '0', '0', '0', '1', null);
INSERT INTO `sys_role` VALUES ('ac66961adaa2426da4470c72ffeec117', '管理员A', '274871615654', '1', '54', '54', '0', '246', 'ac66961adaa2426da4470c72ffeec117');
INSERT INTO `sys_role` VALUES ('b0c77c29dfa140dc9b14a29c056f824f', '高级会员', '498', '7', '0', '0', '0', '0', 'b0c77c29dfa140dc9b14a29c056f824f');
INSERT INTO `sys_role` VALUES ('e74f713314154c35bd7fc98897859fe3', '黄金客户', '18', '6', '1', '1', '1', '1', 'e74f713314154c35bd7fc98897859fe3');
INSERT INTO `sys_role` VALUES ('f944a9df72634249bbcb8cb73b0c9b86', '初级会员', '498', '7', '1', '1', '1', '1', 'f944a9df72634249bbcb8cb73b0c9b86');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `USER_ID` varchar(100) NOT NULL,
  `USERNAME` varchar(255) DEFAULT NULL,
  `PASSWORD` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `RIGHTS` varchar(255) DEFAULT NULL,
  `ROLE_ID` varchar(100) DEFAULT NULL,
  `LAST_LOGIN` varchar(255) DEFAULT NULL,
  `IP` varchar(100) DEFAULT NULL,
  `STATUS` varchar(32) DEFAULT NULL,
  `BZ` varchar(255) DEFAULT NULL,
  `SKIN` varchar(100) DEFAULT NULL,
  `EMAIL` varchar(32) DEFAULT NULL,
  `NUMBER` varchar(100) DEFAULT NULL,
  `PHONE` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('0bcb8bef98684668a04bb16c398dc194', 'xcyl', 'bb6e1b0b4df2db696a8e45a9939799abeb2f5ff2', '小菜一篮商家', '', '0bcb8bef98684668a04bb16c398dc194', '2017-09-20 18:59:42', '192.168.1.124', '0', '小菜一篮管理者', 'default', 'wwwwq@qq.com', '1101', '18788888888');
INSERT INTO `sys_user` VALUES ('1', 'admin', 'dd94709528bb1c83d08f3088d4043f4742891f4f', '系统管理员', '1133671055321055258374707980945218933803269864762743594642571294', '1', '2017-10-11 10:09:05', '127.0.0.1', '0', '最高统治者', 'default', 'admin@main.com', '001', '18788888888');
INSERT INTO `sys_user` VALUES ('681464038b004566b3c437bcc6555d63', 'yangym', 'f7316e1c4b97ac3bd17f7133976187b63156f90e', '李四', '', 'ac66961adaa2426da4470c72ffeec117', '2017-09-25 14:36:20', '192.168.1.128', '0', '杨永明是管理员', 'default', '734562051@qq.com', '1102', '18898218580');
INSERT INTO `sys_user` VALUES ('b3816b4d83e44b2dabcdbec910a9e1ec', 'aaa', 'e1ad01def90c966cf10dd6cfda9b36a42e7446a9', '张三', '', 'ac66961adaa2426da4470c72ffeec117', '2017-09-30 14:35:39', '192.168.1.128', '0', '', 'default', '', '111', '18898218580');

-- ----------------------------
-- Table structure for sys_user_qx
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_qx`;
CREATE TABLE `sys_user_qx` (
  `U_ID` varchar(100) NOT NULL,
  `C1` int(10) DEFAULT NULL,
  `C2` int(10) DEFAULT NULL,
  `C3` int(10) DEFAULT NULL,
  `C4` int(10) DEFAULT NULL,
  `Q1` int(10) DEFAULT NULL,
  `Q2` int(10) DEFAULT NULL,
  `Q3` int(10) DEFAULT NULL,
  `Q4` int(10) DEFAULT NULL,
  PRIMARY KEY (`U_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user_qx
-- ----------------------------
INSERT INTO `sys_user_qx` VALUES ('0bcb8bef98684668a04bb16c398dc194', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `sys_user_qx` VALUES ('1', '1', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `sys_user_qx` VALUES ('2', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `sys_user_qx` VALUES ('55896f5ce3c0494fa6850775a4e29ff6', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `sys_user_qx` VALUES ('605b0e19e54349d2b8cca96ece966da5', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `sys_user_qx` VALUES ('68f23fc0caee475bae8d52244dea8444', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `sys_user_qx` VALUES ('ac66961adaa2426da4470c72ffeec117', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `sys_user_qx` VALUES ('b0c77c29dfa140dc9b14a29c056f824f', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `sys_user_qx` VALUES ('e74f713314154c35bd7fc98897859fe3', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `sys_user_qx` VALUES ('f944a9df72634249bbcb8cb73b0c9b86', '0', '0', '0', '0', '0', '0', '0', '0');

-- ----------------------------
-- Table structure for tb_duankou
-- ----------------------------
DROP TABLE IF EXISTS `tb_duankou`;
CREATE TABLE `tb_duankou` (
  `duankou_id` varchar(255) NOT NULL COMMENT '端口id',
  `dkmc` varchar(255) DEFAULT NULL COMMENT '端口名称',
  PRIMARY KEY (`duankou_id`)
) ENGINE=InnoDB DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of tb_duankou
-- ----------------------------
INSERT INTO `tb_duankou` VALUES ('66a6b2943d554065b4064de94f71e51d', '饭店端');
INSERT INTO `tb_duankou` VALUES ('7829bdd133124e379d7f44399ffbea22', '门店端');
INSERT INTO `tb_duankou` VALUES ('b30175c36701467cb3051a39059e02b1', '超市端');
INSERT INTO `tb_duankou` VALUES ('c390522d56404f13847acef70d82b4e7', '联采端');
INSERT INTO `tb_duankou` VALUES ('d79369dc72e346a281c32ffc0958df96', '酒店端');

-- ----------------------------
-- Table structure for tb_goods
-- ----------------------------
DROP TABLE IF EXISTS `tb_goods`;
CREATE TABLE `tb_goods` (
  `goods_id` varchar(255) NOT NULL COMMENT '主键ID',
  `goodsName` varchar(50) DEFAULT NULL COMMENT '商品名称',
  `goodsImg` varchar(255) DEFAULT NULL COMMENT '商品图片',
  `goodsIntroduce` varchar(255) DEFAULT NULL COMMENT '商品介绍',
  `goods_category_fid` varchar(32) DEFAULT NULL COMMENT '商品分类外键id',
  `topPrice` double DEFAULT '0' COMMENT '商品最高价',
  `advisePrice` double DEFAULT '0' COMMENT '商品建议价',
  `shangjiaPrice` double DEFAULT '0' COMMENT '上架价',
  `shanghuPrice` varchar(255) DEFAULT '0' COMMENT '商户价',
  `fabuTime` varchar(50) DEFAULT NULL COMMENT '商品发布的时间',
  `goodsState` varchar(2) DEFAULT '0' COMMENT '商品状态(0-下架，1-上架)',
  `Stock` varchar(255) DEFAULT '0' COMMENT '商品库存',
  `danwei_fid` varchar(100) DEFAULT NULL COMMENT '物品单位表外建id',
  `weight` varchar(255) DEFAULT '0' COMMENT '商品重量（商品规格）',
  `describe` varchar(255) DEFAULT NULL COMMENT '商品5斤起订',
  `user_shangjia_fid` varchar(255) DEFAULT NULL COMMENT '外键ID(商家的主键ID)',
  PRIMARY KEY (`goods_id`)
) ENGINE=InnoDB DEFAULT CHARSET=gb2312 COMMENT='商品表';

-- ----------------------------
-- Records of tb_goods
-- ----------------------------
INSERT INTO `tb_goods` VALUES ('29994cf7043647f89a3538bb3442eb7b', '葡萄王', 'uploadFiles/uploadImgs/shangjia/shangpin/20170930/b68fb53ca17245e4b01aa10cce1b0eb0.jpg', '送达', 'fa22cd72fc94462cb4026649f634ea95', '20', '10', '9', '7', '2017-09-30 10:01:30', '1', '80', '82694944368d4231be2be41193f8e975', '0', null, null);
INSERT INTO `tb_goods` VALUES ('3b242d23ad364686bba6ed49e3b76fa3', '香蕉', 'uploadFiles/uploadImgs/shangjia/shangpin/20170919/82fd5c59a0564ab6b4c291f4dbb95180.jpg', '甜甜的，减肥作用', 'fa22cd72fc94462cb4026649f634ea95', '15', '12', '10.11', '10.54', '2017-09-25 14:17:44', '1', '5', '82694944368d4231be2be41193f8e975', null, '5', null);
INSERT INTO `tb_goods` VALUES ('43d876ef4c7c4006b87d4ad7dddbf102', '绿豆芽', 'uploadFiles/uploadImgs/shangjia/shangpin/20170919/47b09007527048cbb536e22dd074b7db.jpg', '阿斯达', '1e71a26dde5b4929b81ca648397d7257', '15', '11', '10', '10.54', '2017-09-27 11:49:54', '1', '5', '685895e4941a4b68af8238d9ec05c976', null, '5', null);
INSERT INTO `tb_goods` VALUES ('49beae6f4c744797b5e00be9b4f509ba', '清蒸鱼', 'uploadFiles/uploadImgs/shangjia/shangpin/20170919/4eb9fbf4bcf4494b87e956894c5dfe29.jpg', '美味', 'f1383f1f485c49f2b36e6d5a3ff1d190', '14', '10', '9', '10.54', '2017-09-25 14:16:00', '1', '5', '93d019f857b747c9a2ca4edbe9e3cdf8', null, '5', null);
INSERT INTO `tb_goods` VALUES ('ad68b38bf8434383ad3d2ffab1a78b07', '香菇', 'uploadFiles/uploadImgs/shangjia/shangpin/20170927/d84f1803793841678c712135c798467f.jpg', '逗', '0a0b8822942e45fcafd9b2d536faeb11', '4', '50', '41', '20', '2017-09-30 09:49:28', '1', '12', '82694944368d4231be2be41193f8e975', null, null, null);
INSERT INTO `tb_goods` VALUES ('be4eea1f03994801b3d5aa847bfdfa9a', '鸡肉', 'uploadFiles/uploadImgs/shangjia/shangpin/20170926/d4035e39182b4f31a1427a0b2ef2c403.jpg', '新鲜', 'cd5769c24c314c0da19091c66ff2bc7d', '30', '20', '20', '120', '2017-09-30 09:49:22', '1', '2130', '82694944368d4231be2be41193f8e975', null, null, null);
INSERT INTO `tb_goods` VALUES ('dae2c69852cc48b487b234f7adcfde5d', '鱼王', 'uploadFiles/uploadImgs/shangjia/shangpin/20170930/0036732ad01a482b979fa746be8ce1ab.jpg', '阿达', 'f1383f1f485c49f2b36e6d5a3ff1d190', '12', '12', '12', '11', '2017-09-30 10:02:15', '1', '100', '93d019f857b747c9a2ca4edbe9e3cdf8', '0', null, null);
INSERT INTO `tb_goods` VALUES ('e8a23059cedb407e84fa0ffe63b4f3ed', '黄豆芽', 'uploadFiles/uploadImgs/shangjia/shangpin/20170919/23d0e785c29b4d5784e0c3d36de82955.jpg', '豆芽很新鲜，一点保你满意！', '1e71a26dde5b4929b81ca648397d7257', '14', '10', '9', '10.54', '2017-09-25 14:17:05', '1', '5', '82694944368d4231be2be41193f8e975', null, '5', null);
INSERT INTO `tb_goods` VALUES ('e8cf77a0679d405caf2755d44e64dbb8', '豆王', 'uploadFiles/uploadImgs/shangjia/shangpin/20170930/acff53625a284e5bbc0fbd830af4fde2.jpg', '是多少', '1e71a26dde5b4929b81ca648397d7257', '12', '12', '12', '11', '2017-09-30 10:06:31', '1', '100', '82694944368d4231be2be41193f8e975', '0', null, null);
INSERT INTO `tb_goods` VALUES ('ebd979fde47841f79d0c4881baf39c0a', '菌王菇', 'uploadFiles/uploadImgs/shangjia/shangpin/20170930/5be370ff5c8246439dc01462db609a76.jpg', '啊撒大声地', '0a0b8822942e45fcafd9b2d536faeb11', '23', '21', '11', '11', '2017-09-30 10:08:32', '1', '80', '685895e4941a4b68af8238d9ec05c976', '0', null, null);

-- ----------------------------
-- Table structure for tb_goods_category
-- ----------------------------
DROP TABLE IF EXISTS `tb_goods_category`;
CREATE TABLE `tb_goods_category` (
  `goods_category_id` varchar(255) NOT NULL COMMENT '主键ID',
  `categoryName` varchar(50) DEFAULT NULL COMMENT '分类、类别名称',
  `addTime` varchar(30) DEFAULT NULL COMMENT '添加时间',
  `goods_mokuai_fid` varchar(32) DEFAULT NULL COMMENT '外键（所属模块的主键ID）',
  `user_shangjia_fid` varchar(255) DEFAULT NULL COMMENT '外键ID(商家用户的主键ID)',
  PRIMARY KEY (`goods_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=gb2312 COMMENT='店铺商品分类(主食、套餐、凉菜。。。)';

-- ----------------------------
-- Records of tb_goods_category
-- ----------------------------
INSERT INTO `tb_goods_category` VALUES ('0a0b8822942e45fcafd9b2d536faeb11', '菌类', '2017-09-19 11:39:15', 'b0b8c4da91b84b888e5f76d00031531d', null);
INSERT INTO `tb_goods_category` VALUES ('1e71a26dde5b4929b81ca648397d7257', '豆芽类', '2017-09-19 11:18:54', 'b0b8c4da91b84b888e5f76d00031531d', null);
INSERT INTO `tb_goods_category` VALUES ('242c36de043f448da6db9c5f72e53123', '果菜类', '2017-09-19 11:22:50', 'b0b8c4da91b84b888e5f76d00031531d', null);
INSERT INTO `tb_goods_category` VALUES ('3432acacca0043ec8db9270f172800e2', '肉类', '2017-09-18 17:48:56', '2dc2d5d166b444bc9a6d122669327770', null);
INSERT INTO `tb_goods_category` VALUES ('5cbeda3afaf640cabf4074af153c0541', '猪肉类', '2017-09-19 16:50:23', '2dc2d5d166b444bc9a6d122669327770', null);
INSERT INTO `tb_goods_category` VALUES ('cd5769c24c314c0da19091c66ff2bc7d', '鸡肉类', '2017-09-19 16:50:43', '2dc2d5d166b444bc9a6d122669327770', null);
INSERT INTO `tb_goods_category` VALUES ('f1383f1f485c49f2b36e6d5a3ff1d190', '鱼类', '2017-09-18 18:01:39', '7183d9de1ad545618aacd86836af7cd1', null);
INSERT INTO `tb_goods_category` VALUES ('fa22cd72fc94462cb4026649f634ea95', '水果类', '2017-09-18 17:50:18', 'b0b8c4da91b84b888e5f76d00031531d', null);

-- ----------------------------
-- Table structure for tb_goods_mokuai
-- ----------------------------
DROP TABLE IF EXISTS `tb_goods_mokuai`;
CREATE TABLE `tb_goods_mokuai` (
  `goods_mokuai_id` varchar(32) NOT NULL COMMENT '主键ID',
  `title` varchar(255) DEFAULT NULL COMMENT '名称',
  `goods_mokuai_Img_url` varchar(255) DEFAULT NULL COMMENT '商品模块图片url',
  `type` varchar(5) DEFAULT NULL COMMENT '排列序号',
  PRIMARY KEY (`goods_mokuai_id`)
) ENGINE=InnoDB DEFAULT CHARSET=gb2312 COMMENT='客户端主页面商品大模块分类表';

-- ----------------------------
-- Records of tb_goods_mokuai
-- ----------------------------
INSERT INTO `tb_goods_mokuai` VALUES ('2dc2d5d166b444bc9a6d122669327770', '鲜肉禽蛋', 'uploadFiles/uploadImgs/mokuai/mokuaiImg/20170919/417da5754b0840f6a2a97386ccc41f77.png', '2');
INSERT INTO `tb_goods_mokuai` VALUES ('7183d9de1ad545618aacd86836af7cd1', '水产冻货', 'uploadFiles/uploadImgs/mokuai/mokuaiImg/20170915/38d62631a5874e70aa9e3790f69564c8.png', '3');
INSERT INTO `tb_goods_mokuai` VALUES ('8dea7fb671294b00ae3d833127e0aa11', '超市便利', 'uploadFiles/uploadImgs/mokuai/mokuaiImg/20170915/27c34a685c1148c2941979feec6688fb.png', '5');
INSERT INTO `tb_goods_mokuai` VALUES ('b0b8c4da91b84b888e5f76d00031531d', '蔬菜蓝', 'uploadFiles/uploadImgs/mokuai/mokuaiImg/20170915/5143bdbd46ad4cbb9f80a2352d8ac1a1.png', '1');
INSERT INTO `tb_goods_mokuai` VALUES ('e0f3e5211cde48ee91d3b2a807e2f442', '农贸市场', 'uploadFiles/uploadImgs/mokuai/mokuaiImg/20170915/5143bdbd46ad4cbb9f80a2352d8ac1a1.png', '6');

-- ----------------------------
-- Table structure for tb_order_goods
-- ----------------------------
DROP TABLE IF EXISTS `tb_order_goods`;
CREATE TABLE `tb_order_goods` (
  `order_goods_id` varchar(255) NOT NULL COMMENT '主键ID',
  `goodsName` varchar(50) DEFAULT NULL COMMENT '商品名称',
  `goodsNum` varchar(10) DEFAULT NULL COMMENT '商品的数量',
  `price` varchar(10) DEFAULT NULL COMMENT '商品的价格',
  `img` varchar(255) DEFAULT NULL COMMENT '商品logo图',
  `takeout_order_fid` varchar(255) DEFAULT NULL COMMENT '外键ID(外卖订单表的主键ID)',
  `goods_fid` varchar(255) DEFAULT NULL COMMENT '外键ID(商品的主键ID)',
  `create_time` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`order_goods_id`)
) ENGINE=InnoDB DEFAULT CHARSET=gb2312 COMMENT='外卖订单中选择的商品';

-- ----------------------------
-- Records of tb_order_goods
-- ----------------------------
INSERT INTO `tb_order_goods` VALUES ('13de4225170547f1900197095f144fe0', '蘑菇', '1', '10.00', 'uploadFiles/uploadImgs/shangjia/shangpin/20170919/935531ee60834554a2afce839c4e54aa.jpg', '2c1f5b187a7e48f7a6164615df0fc7b0', '4f9f714a74334f308f06b89dc888d878', '2017-10-10 10:44:02');
INSERT INTO `tb_order_goods` VALUES ('2107927f936f4b63abd21e9b4b7322d0', '鲍鱼清蒸', '2', '15.00', 'uploadFiles/uploadImgs/shangjia/shangpin/20170919/0862332c635a46ae9ddad05f5feb6588.jpg', '4d6d8a44c05a426391e0cfe79d1cd883', '4ed4866cd28d40189aaa0fd07aa3b875', '2017-10-10 10:49:30');
INSERT INTO `tb_order_goods` VALUES ('26bece853009451083e2a2e98e25d3d6', '鸡肉', '1', '20.00', 'uploadFiles/uploadImgs/shangjia/shangpin/20170926/d4035e39182b4f31a1427a0b2ef2c403.jpg', '2c0e1fe96fa049528db3601d5e8d3167', 'be4eea1f03994801b3d5aa847bfdfa9a', '2017-10-10 18:38:07');
INSERT INTO `tb_order_goods` VALUES ('3a67b4d9f0f845599cd0f25d650016f3', '鸡肉', '1', '20.00', 'uploadFiles/uploadImgs/shangjia/shangpin/20170926/d4035e39182b4f31a1427a0b2ef2c403.jpg', '718ff0518f9946acb2ba800fcb83e473', 'be4eea1f03994801b3d5aa847bfdfa9a', '2017-10-10 10:51:45');
INSERT INTO `tb_order_goods` VALUES ('606f7fc6754d4d15b46d109f3f3284d8', '蘑菇', '5', '10.00', 'uploadFiles/uploadImgs/shangjia/shangpin/20170919/935531ee60834554a2afce839c4e54aa.jpg', 'db7d3b761d1f49139a53079ae95bcd68', '4f9f714a74334f308f06b89dc888d878', '2017-09-30 10:04:14');
INSERT INTO `tb_order_goods` VALUES ('649be456fbf64642882096d72645835e', '鱼王', '1', '12.00', 'uploadFiles/uploadImgs/shangjia/shangpin/20170930/0036732ad01a482b979fa746be8ce1ab.jpg', '855575a4ea8f461391c4bfce4f765108', 'dae2c69852cc48b487b234f7adcfde5d', '2017-10-10 17:37:32');
INSERT INTO `tb_order_goods` VALUES ('660224275b1f4dde8016def8f649e1df', '清蒸鱼', '2', '9.00', 'uploadFiles/uploadImgs/shangjia/shangpin/20170919/4eb9fbf4bcf4494b87e956894c5dfe29.jpg', '2c0e1fe96fa049528db3601d5e8d3167', '49beae6f4c744797b5e00be9b4f509ba', '2017-10-10 18:38:07');
INSERT INTO `tb_order_goods` VALUES ('66a4b23956fd43aab725430c1c07d9bc', '葡萄王', '200', '9.00', 'uploadFiles/uploadImgs/shangjia/shangpin/20170930/b68fb53ca17245e4b01aa10cce1b0eb0.jpg', '47eac367c6cf4442a42a4c5f38cc4b13', '29994cf7043647f89a3538bb3442eb7b', '2017-09-30 10:04:14');
INSERT INTO `tb_order_goods` VALUES ('68d65615c6b447de87b6586f872b5bb1', '绿豆芽', '30', '10.00', 'uploadFiles/uploadImgs/shangjia/shangpin/20170919/47b09007527048cbb536e22dd074b7db.jpg', '47eac367c6cf4442a42a4c5f38cc4b13', '43d876ef4c7c4006b87d4ad7dddbf102', '2017-09-30 10:04:14');
INSERT INTO `tb_order_goods` VALUES ('6930e9f9bc4c4041bafc2f013fa3b088', '清蒸鱼', '1', '9.00', 'uploadFiles/uploadImgs/shangjia/shangpin/20170919/4eb9fbf4bcf4494b87e956894c5dfe29.jpg', 'e91d4e7acb4b4e42a2d3f68e3f9ef986', '49beae6f4c744797b5e00be9b4f509ba', '2017-10-10 18:00:20');
INSERT INTO `tb_order_goods` VALUES ('6cd80973fab74bcc810b6dce9ef04886', '五花肉', '1', '10.00', 'uploadFiles/uploadImgs/shangjia/shangpin/20170919/b0bfa2c4bd3541b58766585b96628001.jpg', '443bde7905024e3d99c1ff1e375ac393', '5bdd29cb1c9043c28d948a907933882e', '2017-09-30 10:04:14');
INSERT INTO `tb_order_goods` VALUES ('6f99a6596527433384ba3769f4465e56', '香菇', '2', '41.00', 'uploadFiles/uploadImgs/shangjia/shangpin/20170927/d84f1803793841678c712135c798467f.jpg', 'cb46af4687524826870dccad2059acf8', 'ad68b38bf8434383ad3d2ffab1a78b07', '2017-09-30 10:04:14');
INSERT INTO `tb_order_goods` VALUES ('706bf1b16e4a4f8b83cbc5ab76c56444', '人肉', '90', '10.00', 'uploadFiles/uploadImgs/shangjia/shangpin/20170926/7f093425480b4dc6af020b1af3dbe1e9.jpg', '832665de26894a808a2da81ccc6104db', '7298b0f95f6b46cc9110a81ac52bb74a', '2017-09-30 10:04:14');
INSERT INTO `tb_order_goods` VALUES ('7416779aaae24d2bbe15b6a55a0f89d7', '香菇', '3', '41.00', 'uploadFiles/uploadImgs/shangjia/shangpin/20170927/d84f1803793841678c712135c798467f.jpg', 'db7d3b761d1f49139a53079ae95bcd68', 'ad68b38bf8434383ad3d2ffab1a78b07', '2017-09-30 10:04:14');
INSERT INTO `tb_order_goods` VALUES ('745dde86204b4a1a98141e745281aaf9', '菌王菇', '1', '11.00', 'uploadFiles/uploadImgs/shangjia/shangpin/20170930/5be370ff5c8246439dc01462db609a76.jpg', '2c1f5b187a7e48f7a6164615df0fc7b0', 'ebd979fde47841f79d0c4881baf39c0a', '2017-10-10 10:44:02');
INSERT INTO `tb_order_goods` VALUES ('78a3f3224f3e454bb01748e12b691912', '水果王', '4', '12.00', 'uploadFiles/uploadImgs/shangjia/shangpin/20170930/2124cea8ccf34b70b6d0e9dbe1af5e57.jpg', '87668efa0c1a4cebbb568feb0bd1a125', '5828616c86394126af40514b7dc40b8d', '2017-09-30 10:04:14');
INSERT INTO `tb_order_goods` VALUES ('7ec0efdb05a244c1b1d492e4f4f319d3', '鲍鱼清蒸', '1', '15.00', 'uploadFiles/uploadImgs/shangjia/shangpin/20170919/0862332c635a46ae9ddad05f5feb6588.jpg', '353d5c8e123e471092c3f93c2699a821', '4ed4866cd28d40189aaa0fd07aa3b875', '2017-09-30 10:04:14');
INSERT INTO `tb_order_goods` VALUES ('81c494dcb3ee47c88b6d3a88035419b8', '香菇', '4', '41.00', 'uploadFiles/uploadImgs/shangjia/shangpin/20170927/d84f1803793841678c712135c798467f.jpg', 'fe67d8fd9c5047c6b1277c0f19a6e49c', 'ad68b38bf8434383ad3d2ffab1a78b07', '2017-09-30 10:12:40');
INSERT INTO `tb_order_goods` VALUES ('824b63953ea24a0bb7bea2a6996ee750', '果菜', '5', '12.00', 'uploadFiles/uploadImgs/shangjia/shangpin/20170927/e68d32d204704068b45804118f6dfa6b.jpg', '87668efa0c1a4cebbb568feb0bd1a125', '8718c8a47cee4ca0952e1f379bd1cdc3', '2017-09-30 10:04:14');
INSERT INTO `tb_order_goods` VALUES ('8333927de48144b7ae0776b98ddedd67', '五花肉', '80', '10.00', 'uploadFiles/uploadImgs/shangjia/shangpin/20170919/b0bfa2c4bd3541b58766585b96628001.jpg', '832665de26894a808a2da81ccc6104db', '5bdd29cb1c9043c28d948a907933882e', '2017-09-30 09:54:46');
INSERT INTO `tb_order_goods` VALUES ('84309a99ec14432c9427e642bb151229', '芒果大', '10', '11.00', 'uploadFiles/uploadImgs/shangjia/shangpin/20170930/b6ae30dd03fb413ca32e305d22beba50.jpg', '47eac367c6cf4442a42a4c5f38cc4b13', '57c2c787d5c4474aab5dacf990bf34eb', '2017-09-30 10:10:49');
INSERT INTO `tb_order_goods` VALUES ('8616565d12a3425aaf50f786b7eb6861', '葡萄王', '4', '9.00', 'uploadFiles/uploadImgs/shangjia/shangpin/20170930/b68fb53ca17245e4b01aa10cce1b0eb0.jpg', '87668efa0c1a4cebbb568feb0bd1a125', '29994cf7043647f89a3538bb3442eb7b', '2017-09-30 11:30:50');
INSERT INTO `tb_order_goods` VALUES ('8719d5ffc26b4b03a561e4434a84116f', '盼盼竭诚', '1', '10.00', 'uploadFiles/uploadImgs/shangjia/shangpin/20170930/4a9488f6c62e45b7bde75484b1ced621.jpg', 'cb46af4687524826870dccad2059acf8', '4af0729dba9748c39e0604b941e2e378', '2017-09-30 15:53:03');
INSERT INTO `tb_order_goods` VALUES ('8e5de0edab3840abb01a5e58113ae0b8', '鸡肉', '60', '11.00', 'uploadFiles/uploadImgs/shangjia/shangpin/20170926/8eccb0068b7e47618ae184c9f5893eab.jpeg', '832665de26894a808a2da81ccc6104db', '775df0d506d9411293b29716c589cb4a', '2017-09-30 10:12:40');
INSERT INTO `tb_order_goods` VALUES ('90aa85c956144ba0851f5c1bd7f8aa76', '果菜', '7', '12.00', 'uploadFiles/uploadImgs/shangjia/shangpin/20170927/e68d32d204704068b45804118f6dfa6b.jpg', 'db7d3b761d1f49139a53079ae95bcd68', '8718c8a47cee4ca0952e1f379bd1cdc3', '2017-09-30 10:04:14');
INSERT INTO `tb_order_goods` VALUES ('953f597833d74ce4b5f15343d888d18a', '五花肉', '1', '10.00', 'uploadFiles/uploadImgs/shangjia/shangpin/20170919/b0bfa2c4bd3541b58766585b96628001.jpg', '718ff0518f9946acb2ba800fcb83e473', '5bdd29cb1c9043c28d948a907933882e', '2017-10-10 10:51:45');
INSERT INTO `tb_order_goods` VALUES ('96eb48b5cab24b3fa5e4105be1d7c54a', '鸡肉', '80', '20.00', 'uploadFiles/uploadImgs/shangjia/shangpin/20170926/d4035e39182b4f31a1427a0b2ef2c403.jpg', '832665de26894a808a2da81ccc6104db', 'be4eea1f03994801b3d5aa847bfdfa9a', '2017-09-30 09:54:46');
INSERT INTO `tb_order_goods` VALUES ('9769fd0b07164abc95cb107c314d7bb9', '芒果大', '3', '11.00', 'uploadFiles/uploadImgs/shangjia/shangpin/20170930/b6ae30dd03fb413ca32e305d22beba50.jpg', '87668efa0c1a4cebbb568feb0bd1a125', '57c2c787d5c4474aab5dacf990bf34eb', '2017-09-30 10:10:49');
INSERT INTO `tb_order_goods` VALUES ('9bce85d6a58c439381c6d9d90bd49027', '鸡肉', '1', '20.00', 'uploadFiles/uploadImgs/shangjia/shangpin/20170926/d4035e39182b4f31a1427a0b2ef2c403.jpg', 'f0a427cbc95f4096814fee0c4948fa07', 'be4eea1f03994801b3d5aa847bfdfa9a', '2017-09-30 11:30:50');
INSERT INTO `tb_order_goods` VALUES ('9d4446bbff2d420a82fd5e317bb106ef', '鸡腿', '1', '9.00', 'uploadFiles/uploadImgs/shangjia/shangpin/20170919/227d2ea173114d5d9db07a1d13eed823.jpg', '718ff0518f9946acb2ba800fcb83e473', '7dbb908bbdf3443f911ef108d04b08b6', '2017-10-10 10:51:45');
INSERT INTO `tb_order_goods` VALUES ('9d4a98c699b74653873c8ae496f64dd2', '水果王', '50', '12.00', 'uploadFiles/uploadImgs/shangjia/shangpin/20170930/2124cea8ccf34b70b6d0e9dbe1af5e57.jpg', '47eac367c6cf4442a42a4c5f38cc4b13', '5828616c86394126af40514b7dc40b8d', '2017-09-30 15:53:03');
INSERT INTO `tb_order_goods` VALUES ('9d80381300674a08beafd820f2507f4d', 'agfyfd', '1', '30.00', 'uploadFiles/uploadImgs/shangjia/shangpin/20170926/8aac25f0e0bd45f7a94fcb5f085173b6.png', '4d6d8a44c05a426391e0cfe79d1cd883', '0913b75d244947a38f0f4e9903f9dadb', '2017-10-10 10:49:30');
INSERT INTO `tb_order_goods` VALUES ('a6bdda86d2294fd1966a8904a5ac675e', '香蕉王', '3', '12.00', 'uploadFiles/uploadImgs/shangjia/shangpin/20170930/2381238184b64e20b6ac732b5b8369e0.jpg', '87668efa0c1a4cebbb568feb0bd1a125', '9ab51bdec9c5440cb2b3a38183aef5db', '2017-09-30 10:12:40');
INSERT INTO `tb_order_goods` VALUES ('a90dd41d80a54ab3ae83ddf9f85ec371', '菌王菇', '1', '11.00', 'uploadFiles/uploadImgs/shangjia/shangpin/20170930/5be370ff5c8246439dc01462db609a76.jpg', 'cb46af4687524826870dccad2059acf8', 'ebd979fde47841f79d0c4881baf39c0a', '2017-09-30 10:04:14');
INSERT INTO `tb_order_goods` VALUES ('aab5293a8d944ef5a226451e114362f1', '人肉', '1', '10.00', 'uploadFiles/uploadImgs/shangjia/shangpin/20170926/7f093425480b4dc6af020b1af3dbe1e9.jpg', '443bde7905024e3d99c1ff1e375ac393', '7298b0f95f6b46cc9110a81ac52bb74a', '2017-09-30 09:54:46');
INSERT INTO `tb_order_goods` VALUES ('ae7db149e85343c8845fdc57645a95ef', '鸡肉', '1', '11.00', 'uploadFiles/uploadImgs/shangjia/shangpin/20170926/8eccb0068b7e47618ae184c9f5893eab.jpeg', '718ff0518f9946acb2ba800fcb83e473', '775df0d506d9411293b29716c589cb4a', '2017-10-10 10:51:45');
INSERT INTO `tb_order_goods` VALUES ('b24525e841174143aa32891f045785c0', '鸡肉', '5', '20.00', 'uploadFiles/uploadImgs/shangjia/shangpin/20170926/d4035e39182b4f31a1427a0b2ef2c403.jpg', '21b8d23031ff44519eb104f0d36153e9', 'be4eea1f03994801b3d5aa847bfdfa9a', '2017-10-10 18:41:18');
INSERT INTO `tb_order_goods` VALUES ('b262772f0aa7428fbfaed7e8f4aee987', '鱼王', '1', '12.00', 'uploadFiles/uploadImgs/shangjia/shangpin/20170930/0036732ad01a482b979fa746be8ce1ab.jpg', '353d5c8e123e471092c3f93c2699a821', 'dae2c69852cc48b487b234f7adcfde5d', '2017-09-30 10:10:49');
INSERT INTO `tb_order_goods` VALUES ('b2cb2d86c73e43ac9a637316d20ebd8d', '香菇', '2', '41.00', 'uploadFiles/uploadImgs/shangjia/shangpin/20170927/d84f1803793841678c712135c798467f.jpg', '2c0e1fe96fa049528db3601d5e8d3167', 'ad68b38bf8434383ad3d2ffab1a78b07', '2017-10-10 18:38:07');
INSERT INTO `tb_order_goods` VALUES ('b8c7ecc2759343e1a6bc516bae133f97', '豆王', '4', '12.00', 'uploadFiles/uploadImgs/shangjia/shangpin/20170930/acff53625a284e5bbc0fbd830af4fde2.jpg', '87668efa0c1a4cebbb568feb0bd1a125', 'e8cf77a0679d405caf2755d44e64dbb8', '2017-09-30 11:30:50');
INSERT INTO `tb_order_goods` VALUES ('bb6398920b5e4ac888d2d6486393e92e', '鸡肉', '1', '20.00', 'uploadFiles/uploadImgs/shangjia/shangpin/20170926/d4035e39182b4f31a1427a0b2ef2c403.jpg', 'e91d4e7acb4b4e42a2d3f68e3f9ef986', 'be4eea1f03994801b3d5aa847bfdfa9a', '2017-10-10 18:00:20');
INSERT INTO `tb_order_goods` VALUES ('bd20e02cdbd84fdf985a6bf0f7e26d77', '香菇', '1', '41.00', 'uploadFiles/uploadImgs/shangjia/shangpin/20170927/d84f1803793841678c712135c798467f.jpg', '2c1f5b187a7e48f7a6164615df0fc7b0', 'ad68b38bf8434383ad3d2ffab1a78b07', '2017-10-10 10:44:02');
INSERT INTO `tb_order_goods` VALUES ('bee546fd6c7e45d0aa777966e9ff2634', '菌王菇', '1', '11.00', 'uploadFiles/uploadImgs/shangjia/shangpin/20170930/5be370ff5c8246439dc01462db609a76.jpg', '855575a4ea8f461391c4bfce4f765108', 'ebd979fde47841f79d0c4881baf39c0a', '2017-10-10 17:37:32');
INSERT INTO `tb_order_goods` VALUES ('c0ffa9dc63714e92b5c7ce6000cfd260', '绿豆芽', '50', '10.00', 'uploadFiles/uploadImgs/shangjia/shangpin/20170919/47b09007527048cbb536e22dd074b7db.jpg', 'db7d3b761d1f49139a53079ae95bcd68', '43d876ef4c7c4006b87d4ad7dddbf102', '2017-09-30 15:53:03');
INSERT INTO `tb_order_goods` VALUES ('c4c20cfb8dbf402eb222370c1a5bd60e', '黄豆芽', '100', '9.00', 'uploadFiles/uploadImgs/shangjia/shangpin/20170919/23d0e785c29b4d5784e0c3d36de82955.jpg', 'db7d3b761d1f49139a53079ae95bcd68', 'e8a23059cedb407e84fa0ffe63b4f3ed', '2017-09-30 15:53:03');
INSERT INTO `tb_order_goods` VALUES ('c665d38658e846508488efaa05b5e80b', '鸡腿', '100', '9.00', 'uploadFiles/uploadImgs/shangjia/shangpin/20170919/227d2ea173114d5d9db07a1d13eed823.jpg', '832665de26894a808a2da81ccc6104db', '7dbb908bbdf3443f911ef108d04b08b6', '2017-09-30 15:53:03');
INSERT INTO `tb_order_goods` VALUES ('cbc5e54f559c444dad6f5edd59c4348b', '鸡肉', '1', '11.00', 'uploadFiles/uploadImgs/shangjia/shangpin/20170926/8eccb0068b7e47618ae184c9f5893eab.jpeg', 'f0a427cbc95f4096814fee0c4948fa07', '775df0d506d9411293b29716c589cb4a', '2017-09-30 15:53:03');
INSERT INTO `tb_order_goods` VALUES ('cc00e477813545109259893ec032542a', '葡萄', '10', '11.00', 'uploadFiles/uploadImgs/shangjia/shangpin/20170919/37bbff476e144554858e6b07e5b0d2c4.jpg', 'db7d3b761d1f49139a53079ae95bcd68', '5c644be03aac4b40b7ebe1c5b01f5b29', '2017-09-30 15:53:03');
INSERT INTO `tb_order_goods` VALUES ('d10345f5d7934075be83e36659549e57', '清蒸鱼', '1', '9.00', 'uploadFiles/uploadImgs/shangjia/shangpin/20170919/4eb9fbf4bcf4494b87e956894c5dfe29.jpg', '4d6d8a44c05a426391e0cfe79d1cd883', '49beae6f4c744797b5e00be9b4f509ba', '2017-10-10 10:49:30');
INSERT INTO `tb_order_goods` VALUES ('f3aeaa710b2e4a2c806807f0fa65406f', '盼盼竭诚', '1', '10.00', 'uploadFiles/uploadImgs/shangjia/shangpin/20170930/4a9488f6c62e45b7bde75484b1ced621.jpg', '2c1f5b187a7e48f7a6164615df0fc7b0', '4af0729dba9748c39e0604b941e2e378', '2017-09-30 15:53:03');

-- ----------------------------
-- Table structure for tb_order_takeout
-- ----------------------------
DROP TABLE IF EXISTS `tb_order_takeout`;
CREATE TABLE `tb_order_takeout` (
  `order_takeou_id` varchar(255) NOT NULL COMMENT '主键ID',
  `orderTime` varchar(100) DEFAULT NULL COMMENT '下单时间',
  `orderNumber` varchar(255) DEFAULT NULL COMMENT '订单编号',
  `order_remark` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '订单备注(要求，口味等)',
  `payState` varchar(10) DEFAULT NULL COMMENT '支付状态(1未支付，2已支付就是待处理，3已处理就是派送中，4已完成)',
  `payMethod` varchar(30) DEFAULT NULL COMMENT '支付方式(支付宝，微信，银联)',
  `payType` varchar(255) DEFAULT NULL COMMENT '支付类型（在线支付，货到付款）',
  `totalSum` decimal(10,2) DEFAULT NULL COMMENT '合计总价',
  `paySum` decimal(10,2) DEFAULT NULL COMMENT '实际支付金额',
  `bucha` decimal(10,2) DEFAULT '0.00',
  `user_kehu_fid` varchar(255) DEFAULT NULL COMMENT '外键ID(客户端用户的主键ID号)',
  PRIMARY KEY (`order_takeou_id`)
) ENGINE=InnoDB DEFAULT CHARSET=gb2312 COMMENT='外卖订单表(提交订单的时候创建订单存入订单表)';

-- ----------------------------
-- Records of tb_order_takeout
-- ----------------------------
INSERT INTO `tb_order_takeout` VALUES ('21b8d23031ff44519eb104f0d36153e9', '2017-10-10 18:41:18', '1507632078744', '无', '1', '无', '货到付款', '100.00', '120.00', '20.00', 'd24a7be2ff8e459c91f5da9fe404c7da');
INSERT INTO `tb_order_takeout` VALUES ('2c0e1fe96fa049528db3601d5e8d3167', '2017-10-10 18:38:07', '1507631887542', '无', '1', '无', '货到付款', '120.00', '140.00', '20.00', 'd24a7be2ff8e459c91f5da9fe404c7da');
INSERT INTO `tb_order_takeout` VALUES ('2c1f5b187a7e48f7a6164615df0fc7b0', '2017-10-10 10:44:02', '1507603442959', '无', '1', '无', '货到付款', '72.00', '72.00', '0.00', '1aa5ecb826204621ae7a31838834cd6e');
INSERT INTO `tb_order_takeout` VALUES ('353d5c8e123e471092c3f93c2699a821', '2017-09-30 15:52:28', '1506757948848', '无', '1', '无', '货到付款', '57.00', '57.00', '0.00', '1aa5ecb826204621ae7a31838834cd6e');
INSERT INTO `tb_order_takeout` VALUES ('443bde7905024e3d99c1ff1e375ac393', '2017-09-30 10:12:40', '1506737560718', '无', '4', '无', '货到付款', '60.00', '60.00', '0.00', '192b3f893a654d3aaf6e66af37fb45c8');
INSERT INTO `tb_order_takeout` VALUES ('47eac367c6cf4442a42a4c5f38cc4b13', '2017-09-30 10:04:14', '1506737054660', '无', '1', '无', '货到付款', '6520.30', '6520.30', '0.00', '60295c023a9f4deabbdfcb061534397d');
INSERT INTO `tb_order_takeout` VALUES ('4d6d8a44c05a426391e0cfe79d1cd883', '2017-10-10 10:49:30', '1507603770843', '无', '1', '无', '货到付款', '69.00', '69.00', '0.00', '1aa5ecb826204621ae7a31838834cd6e');
INSERT INTO `tb_order_takeout` VALUES ('718ff0518f9946acb2ba800fcb83e473', '2017-10-10 10:51:45', '1507603905128', '无', '1', '无', '货到付款', '50.00', '50.00', '0.00', '1aa5ecb826204621ae7a31838834cd6e');
INSERT INTO `tb_order_takeout` VALUES ('832665de26894a808a2da81ccc6104db', '2017-09-30 09:54:46', '1506736486923', '无', '1', '无', '货到付款', '4810.00', '4810.00', '0.00', '54104bc4281d4c848ab83d396a0fbe74');
INSERT INTO `tb_order_takeout` VALUES ('855575a4ea8f461391c4bfce4f765108', '2017-10-10 17:37:32', '1507628252195', '无', '1', '无', '货到付款', '23.00', '43.00', '20.00', 'd24a7be2ff8e459c91f5da9fe404c7da');
INSERT INTO `tb_order_takeout` VALUES ('87668efa0c1a4cebbb568feb0bd1a125', '2017-09-30 10:10:49', '1506737449957', '无', '1', '无', '货到付款', '711.55', '711.55', '0.00', '9328f1c240224a928f646d09f8ba18e7');
INSERT INTO `tb_order_takeout` VALUES ('a3a48a35445e4a3fac441fda8f2139b4', '2017-09-30 11:30:50', '1506742250856', '无', '4', '无', '货到付款', '20.00', '40.00', '20.00', 'd24a7be2ff8e459c91f5da9fe404c7da');
INSERT INTO `tb_order_takeout` VALUES ('b18235c18b4b4206b9d62bfe9171c0e3', '2017-09-30 15:53:03', '1506757983195', '无', '1', '无', '货到付款', '72.00', '72.00', '0.00', '1aa5ecb826204621ae7a31838834cd6e');
INSERT INTO `tb_order_takeout` VALUES ('cb46af4687524826870dccad2059acf8', '2017-09-30 15:51:28', '1506757888963', '无', '1', '无', '货到付款', '113.00', '113.00', '0.00', '1aa5ecb826204621ae7a31838834cd6e');
INSERT INTO `tb_order_takeout` VALUES ('db7d3b761d1f49139a53079ae95bcd68', '2017-09-30 09:51:13', '1506736273997', '无', '1', '无', '货到付款', '1959.09', '1959.09', '0.00', '1aa5ecb826204621ae7a31838834cd6e');
INSERT INTO `tb_order_takeout` VALUES ('e91d4e7acb4b4e42a2d3f68e3f9ef986', '2017-10-10 18:00:20', '1507629620361', '无', '1', '无', '货到付款', '29.00', '49.00', '20.00', 'd24a7be2ff8e459c91f5da9fe404c7da');
INSERT INTO `tb_order_takeout` VALUES ('f0a427cbc95f4096814fee0c4948fa07', '2017-09-30 15:52:10', '1506757930711', '无', '1', '无', '货到付款', '40.00', '40.00', '0.00', '1aa5ecb826204621ae7a31838834cd6e');
INSERT INTO `tb_order_takeout` VALUES ('fe67d8fd9c5047c6b1277c0f19a6e49c', '2017-09-30 10:12:01', '1506737521606', '无', '4', '无', '货到付款', '257.00', '257.00', '0.00', '5c663c5b92b64ac088b02a3597635b16');
INSERT INTO `tb_order_takeout` VALUES ('ff17ad1eadba484da980c8c2c976eafe', '2017-09-30 15:53:18', '1506757998516', '无', '1', '无', '货到付款', '32.00', '32.00', '0.00', '1aa5ecb826204621ae7a31838834cd6e');

-- ----------------------------
-- Table structure for tb_order_temp
-- ----------------------------
DROP TABLE IF EXISTS `tb_order_temp`;
CREATE TABLE `tb_order_temp` (
  `temp_id` varchar(255) NOT NULL,
  `kehu_id` varchar(255) DEFAULT NULL COMMENT '客户id',
  `sp_id` varchar(255) DEFAULT NULL COMMENT '商品id',
  `sp_name` varchar(255) DEFAULT NULL COMMENT '商品名称',
  `price` decimal(10,2) DEFAULT NULL COMMENT '价格',
  `num` int(10) DEFAULT NULL COMMENT '数量',
  `danwei` varchar(10) DEFAULT NULL COMMENT '单位',
  `mkID` varchar(32) CHARACTER SET utf8 DEFAULT NULL COMMENT '模块的主键ID',
  `img` varchar(255) DEFAULT NULL COMMENT '图片路经',
  PRIMARY KEY (`temp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of tb_order_temp
-- ----------------------------
INSERT INTO `tb_order_temp` VALUES ('0e1c62a675804d1f8a1942371acad424', '9328f1c240224a928f646d09f8ba18e7', '4f9f714a74334f308f06b89dc888d878', '蘑菇', '10.00', '4', '份', 'b0b8c4da91b84b888e5f76d00031531d', 'uploadFiles/uploadImgs/shangjia/shangpin/20170919/935531ee60834554a2afce839c4e54aa.jpg');
INSERT INTO `tb_order_temp` VALUES ('16351de0a63a4c40999c3bb8266ad5bc', '9328f1c240224a928f646d09f8ba18e7', '5828616c86394126af40514b7dc40b8d', '水果王', '12.00', '4', '斤', 'b0b8c4da91b84b888e5f76d00031531d', 'uploadFiles/uploadImgs/shangjia/shangpin/20170930/2124cea8ccf34b70b6d0e9dbe1af5e57.jpg');
INSERT INTO `tb_order_temp` VALUES ('1a24470eda0145e19d12f3749ba9db2c', '9328f1c240224a928f646d09f8ba18e7', '4af0729dba9748c39e0604b941e2e378', '盼盼竭诚', '10.00', '3', '箱', 'b0b8c4da91b84b888e5f76d00031531d', 'uploadFiles/uploadImgs/shangjia/shangpin/20170930/4a9488f6c62e45b7bde75484b1ced621.jpg');
INSERT INTO `tb_order_temp` VALUES ('1a75d505fabc4ddf85a79da81e440e58', '9328f1c240224a928f646d09f8ba18e7', 'ebd979fde47841f79d0c4881baf39c0a', '菌王菇', '11.00', '3', '份', 'b0b8c4da91b84b888e5f76d00031531d', 'uploadFiles/uploadImgs/shangjia/shangpin/20170930/5be370ff5c8246439dc01462db609a76.jpg');
INSERT INTO `tb_order_temp` VALUES ('1a8e0d66823e4dd2a84e2af6d15ed0a4', '5c663c5b92b64ac088b02a3597635b16', 'ad68b38bf8434383ad3d2ffab1a78b07', '香菇', '41.00', '4', '斤', 'b0b8c4da91b84b888e5f76d00031531d', 'uploadFiles/uploadImgs/shangjia/shangpin/20170927/d84f1803793841678c712135c798467f.jpg');
INSERT INTO `tb_order_temp` VALUES ('32181feab7864282812273d254ecb4be', '5c663c5b92b64ac088b02a3597635b16', '4af0729dba9748c39e0604b941e2e378', '盼盼竭诚', '10.00', '3', '箱', 'b0b8c4da91b84b888e5f76d00031531d', 'uploadFiles/uploadImgs/shangjia/shangpin/20170930/4a9488f6c62e45b7bde75484b1ced621.jpg');
INSERT INTO `tb_order_temp` VALUES ('323aa7afa1b44f9f9db5af5ee169c8cb', '9328f1c240224a928f646d09f8ba18e7', 'ad68b38bf8434383ad3d2ffab1a78b07', '香菇', '41.00', '3', '斤', 'b0b8c4da91b84b888e5f76d00031531d', 'uploadFiles/uploadImgs/shangjia/shangpin/20170927/d84f1803793841678c712135c798467f.jpg');
INSERT INTO `tb_order_temp` VALUES ('34cd3d60792d406ebb95dddda4e20672', '192b3f893a654d3aaf6e66af37fb45c8', '7dbb908bbdf3443f911ef108d04b08b6', '鸡腿', '9.00', '1', '份', '2dc2d5d166b444bc9a6d122669327770', 'uploadFiles/uploadImgs/shangjia/shangpin/20170919/227d2ea173114d5d9db07a1d13eed823.jpg');
INSERT INTO `tb_order_temp` VALUES ('5c9309e24e0a47b99a396a14b640c98e', '1aa5ecb826204621ae7a31838834cd6e', 'be4eea1f03994801b3d5aa847bfdfa9a', '鸡肉', '20.00', '1', '斤', '2dc2d5d166b444bc9a6d122669327770', 'uploadFiles/uploadImgs/shangjia/shangpin/20170926/d4035e39182b4f31a1427a0b2ef2c403.jpg');
INSERT INTO `tb_order_temp` VALUES ('5eec09bdb19b4c6ca1cae30731d3322b', '9328f1c240224a928f646d09f8ba18e7', '57c2c787d5c4474aab5dacf990bf34eb', '芒果大', '11.00', '3', '斤', 'b0b8c4da91b84b888e5f76d00031531d', 'uploadFiles/uploadImgs/shangjia/shangpin/20170930/b6ae30dd03fb413ca32e305d22beba50.jpg');
INSERT INTO `tb_order_temp` VALUES ('612667d03c384a58bf5c3c081d4ddac6', '9328f1c240224a928f646d09f8ba18e7', 'e8a23059cedb407e84fa0ffe63b4f3ed', '黄豆芽', '9.00', '4', '斤', 'b0b8c4da91b84b888e5f76d00031531d', 'uploadFiles/uploadImgs/shangjia/shangpin/20170919/23d0e785c29b4d5784e0c3d36de82955.jpg');
INSERT INTO `tb_order_temp` VALUES ('6e4355c5cde54140b9dd6d5c9dd5c275', '192b3f893a654d3aaf6e66af37fb45c8', '7298b0f95f6b46cc9110a81ac52bb74a', '人肉', '10.00', '1', '盘', '2dc2d5d166b444bc9a6d122669327770', 'uploadFiles/uploadImgs/shangjia/shangpin/20170926/7f093425480b4dc6af020b1af3dbe1e9.jpg');
INSERT INTO `tb_order_temp` VALUES ('774d06b9029a49db91399d1f31826143', '1aa5ecb826204621ae7a31838834cd6e', '5bdd29cb1c9043c28d948a907933882e', '五花肉', '10.00', '1', '斤', '2dc2d5d166b444bc9a6d122669327770', 'uploadFiles/uploadImgs/shangjia/shangpin/20170919/b0bfa2c4bd3541b58766585b96628001.jpg');
INSERT INTO `tb_order_temp` VALUES ('7b71f33466414c81988a547e605806cc', '192b3f893a654d3aaf6e66af37fb45c8', 'be4eea1f03994801b3d5aa847bfdfa9a', '鸡肉', '20.00', '1', '斤', '2dc2d5d166b444bc9a6d122669327770', 'uploadFiles/uploadImgs/shangjia/shangpin/20170926/d4035e39182b4f31a1427a0b2ef2c403.jpg');
INSERT INTO `tb_order_temp` VALUES ('822f042999a640c99aeb2cf6448782b5', '9328f1c240224a928f646d09f8ba18e7', '9ab51bdec9c5440cb2b3a38183aef5db', '香蕉王', '12.00', '3', '斤', 'b0b8c4da91b84b888e5f76d00031531d', 'uploadFiles/uploadImgs/shangjia/shangpin/20170930/2381238184b64e20b6ac732b5b8369e0.jpg');
INSERT INTO `tb_order_temp` VALUES ('85f64430c1144d92ac6a2ec2d8257d49', '9328f1c240224a928f646d09f8ba18e7', '3b242d23ad364686bba6ed49e3b76fa3', '香蕉', '10.11', '5', '斤', 'b0b8c4da91b84b888e5f76d00031531d', 'uploadFiles/uploadImgs/shangjia/shangpin/20170919/82fd5c59a0564ab6b4c291f4dbb95180.jpg');
INSERT INTO `tb_order_temp` VALUES ('87cd9da93bba483888024b6ac83a8696', '1aa5ecb826204621ae7a31838834cd6e', '7dbb908bbdf3443f911ef108d04b08b6', '鸡腿', '9.00', '1', '份', '2dc2d5d166b444bc9a6d122669327770', 'uploadFiles/uploadImgs/shangjia/shangpin/20170919/227d2ea173114d5d9db07a1d13eed823.jpg');
INSERT INTO `tb_order_temp` VALUES ('9060ff9fccf84b528ac6c650c078ad51', '9328f1c240224a928f646d09f8ba18e7', '5c644be03aac4b40b7ebe1c5b01f5b29', '葡萄', '11.00', '5', '斤', 'b0b8c4da91b84b888e5f76d00031531d', 'uploadFiles/uploadImgs/shangjia/shangpin/20170919/37bbff476e144554858e6b07e5b0d2c4.jpg');
INSERT INTO `tb_order_temp` VALUES ('9561a822bebc4b6eb86cf95bff564135', '9328f1c240224a928f646d09f8ba18e7', '43d876ef4c7c4006b87d4ad7dddbf102', '绿豆芽', '10.00', '5', '份', 'b0b8c4da91b84b888e5f76d00031531d', 'uploadFiles/uploadImgs/shangjia/shangpin/20170919/47b09007527048cbb536e22dd074b7db.jpg');
INSERT INTO `tb_order_temp` VALUES ('96d95ef75ddc4dfbbbc1a0d567cfb4df', '9328f1c240224a928f646d09f8ba18e7', '8718c8a47cee4ca0952e1f379bd1cdc3', '果菜', '12.00', '5', '瓶', 'b0b8c4da91b84b888e5f76d00031531d', 'uploadFiles/uploadImgs/shangjia/shangpin/20170927/e68d32d204704068b45804118f6dfa6b.jpg');
INSERT INTO `tb_order_temp` VALUES ('c56f52aab2274192bf925c379f863e34', '5c663c5b92b64ac088b02a3597635b16', 'ebd979fde47841f79d0c4881baf39c0a', '菌王菇', '11.00', '3', '份', 'b0b8c4da91b84b888e5f76d00031531d', 'uploadFiles/uploadImgs/shangjia/shangpin/20170930/5be370ff5c8246439dc01462db609a76.jpg');
INSERT INTO `tb_order_temp` VALUES ('c7a49603877a473484c577f281fd2737', '192b3f893a654d3aaf6e66af37fb45c8', '5bdd29cb1c9043c28d948a907933882e', '五花肉', '10.00', '1', '斤', '2dc2d5d166b444bc9a6d122669327770', 'uploadFiles/uploadImgs/shangjia/shangpin/20170919/b0bfa2c4bd3541b58766585b96628001.jpg');
INSERT INTO `tb_order_temp` VALUES ('c7bde9d6a6d247dd882ad6b3c9e02927', '9328f1c240224a928f646d09f8ba18e7', '824953c84440464b881cfd394dc2213c', '豆芽芽', '11.00', '3', '斤', 'b0b8c4da91b84b888e5f76d00031531d', 'uploadFiles/uploadImgs/shangjia/shangpin/20170930/843839acd6e24399a7819fd51295d488.jpg');
INSERT INTO `tb_order_temp` VALUES ('c923206ee5354bc3a5e103007b177328', '192b3f893a654d3aaf6e66af37fb45c8', '775df0d506d9411293b29716c589cb4a', '鸡肉', '11.00', '1', '盘', '2dc2d5d166b444bc9a6d122669327770', 'uploadFiles/uploadImgs/shangjia/shangpin/20170926/8eccb0068b7e47618ae184c9f5893eab.jpeg');
INSERT INTO `tb_order_temp` VALUES ('ee95c75bd10f4ccc8407260f90104105', '9328f1c240224a928f646d09f8ba18e7', '29994cf7043647f89a3538bb3442eb7b', '葡萄王', '9.00', '4', '斤', 'b0b8c4da91b84b888e5f76d00031531d', 'uploadFiles/uploadImgs/shangjia/shangpin/20170930/b68fb53ca17245e4b01aa10cce1b0eb0.jpg');
INSERT INTO `tb_order_temp` VALUES ('f3c6fd99e4714d6eb8a58b1a973955d6', '5c663c5b92b64ac088b02a3597635b16', '4f9f714a74334f308f06b89dc888d878', '蘑菇', '10.00', '3', '份', 'b0b8c4da91b84b888e5f76d00031531d', 'uploadFiles/uploadImgs/shangjia/shangpin/20170919/935531ee60834554a2afce839c4e54aa.jpg');
INSERT INTO `tb_order_temp` VALUES ('fb414221d61e408e95a88a5046818874', '9328f1c240224a928f646d09f8ba18e7', 'e8cf77a0679d405caf2755d44e64dbb8', '豆王', '12.00', '4', '斤', 'b0b8c4da91b84b888e5f76d00031531d', 'uploadFiles/uploadImgs/shangjia/shangpin/20170930/acff53625a284e5bbc0fbd830af4fde2.jpg');
INSERT INTO `tb_order_temp` VALUES ('fb514a74a9b94e928eff4aaffd9d243e', '1aa5ecb826204621ae7a31838834cd6e', '775df0d506d9411293b29716c589cb4a', '鸡肉', '11.00', '1', '盘', '2dc2d5d166b444bc9a6d122669327770', 'uploadFiles/uploadImgs/shangjia/shangpin/20170926/8eccb0068b7e47618ae184c9f5893eab.jpeg');

-- ----------------------------
-- Table structure for tb_pictures
-- ----------------------------
DROP TABLE IF EXISTS `tb_pictures`;
CREATE TABLE `tb_pictures` (
  `PICTURES_ID` varchar(100) NOT NULL,
  `TITLE` varchar(255) DEFAULT NULL COMMENT '标题',
  `LINK` varchar(500) DEFAULT NULL COMMENT '链接地址',
  `NAME` varchar(255) DEFAULT NULL COMMENT '文件名',
  `PATH` varchar(255) DEFAULT NULL COMMENT '路径',
  `CREATETIME` varchar(255) DEFAULT NULL COMMENT '创建时间',
  `MASTER_ID` varchar(255) DEFAULT NULL COMMENT '属于',
  `STATUS` int(11) DEFAULT '0' COMMENT '0下架1上架',
  `BZ` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`PICTURES_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_pictures
-- ----------------------------
INSERT INTO `tb_pictures` VALUES ('2ecca6a6fe9146b086a06cac3568d914', '图片1', 'http://www.baidu.com', '4786a6655be142bdb93b8e835c2b8b0c.jpg', 'uploadFiles/uploadImgs/banner/20161124/4786a6655be142bdb93b8e835c2b8b0c.jpg', '2016-11-24 21:26:42', null, '1', '图片管理处上传');
INSERT INTO `tb_pictures` VALUES ('539d5bffa5364c549fd7a9058d3abdb4', '图片2', null, '71a75aacfe8a4881a8cb7750620cc662.jpg', 'uploadFiles/uploadImgs/banner/20161124/71a75aacfe8a4881a8cb7750620cc662.jpg', '2016-11-24 21:26:42', '1', '1', '图片管理处上传');
INSERT INTO `tb_pictures` VALUES ('9fe32eb2bd2540eb80af2356b73398a9', '图片3', null, 'bab3e74e6adc46a498c3c33be766bf65.jpg', 'uploadFiles/uploadImgs/banner/20161124/bab3e74e6adc46a498c3c33be766bf65.jpg', '2016-11-24 21:26:42', '1', '1', '图片管理处上传');
INSERT INTO `tb_pictures` VALUES ('a9f85b49ae7c447eaeed27247aede964', '图片4', null, 'cec7e2b230a74cc8a246f7cd4835c734.jpg', 'uploadFiles/uploadImgs/banner/20161124/cec7e2b230a74cc8a246f7cd4835c734.jpg', '2016-11-24 21:26:42', '1', '1', '图片管理处上传');

-- ----------------------------
-- Table structure for tb_shouhuo_address
-- ----------------------------
DROP TABLE IF EXISTS `tb_shouhuo_address`;
CREATE TABLE `tb_shouhuo_address` (
  `shouhuo_address_id` varchar(255) NOT NULL COMMENT '主键ID',
  `lianxirnName` varchar(20) DEFAULT NULL COMMENT '联系人姓名',
  `phone` varchar(11) DEFAULT NULL COMMENT '联系电话',
  `address` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '所在地区',
  `detailAddress` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '详细地址',
  `isDefault` varchar(2) DEFAULT NULL COMMENT '是否为默认地址(0-不默认，1-默认)',
  `user_kehu_fid` varchar(255) DEFAULT NULL COMMENT '外键(用户的主键ID号)',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`shouhuo_address_id`)
) ENGINE=InnoDB DEFAULT CHARSET=gb2312 COMMENT='客户端的收地址信息表';

-- ----------------------------
-- Records of tb_shouhuo_address
-- ----------------------------
INSERT INTO `tb_shouhuo_address` VALUES ('37a2e40db33a4eaab6e34805b2c96c49', '赵巴巴', '15187456321', '河南省 郑州市 中原区', '科学大道116号', '1', 'd24a7be2ff8e459c91f5da9fe404c7da', '2017-09-30 12:04:44', null);
INSERT INTO `tb_shouhuo_address` VALUES ('41b08c270fb149c1afe81f2b5efe507d', '陈巴巴', '15187459632', '广东省 广州市 天河区', '胜多负少飞', '0', '54104bc4281d4c848ab83d396a0fbe74', '2017-10-09 09:01:09', null);
INSERT INTO `tb_shouhuo_address` VALUES ('95cbece56f1b4d0f8545435a5957ff0e', '123', '18846707761', '重庆市 市 合川市', '32423', '1', '1aa5ecb826204621ae7a31838834cd6e', '2017-09-30 17:23:18', null);
INSERT INTO `tb_shouhuo_address` VALUES ('b1a261a84f5c4f9d930f15bf12d02bf9', '小白', '18846701251', '河南省 郑州市 市辖区', '啊撒大声地', '0', '1aa5ecb826204621ae7a31838834cd6e', '2017-09-30 16:30:03', null);
INSERT INTO `tb_shouhuo_address` VALUES ('c7faec3f23d84f5281f461bfc3e948ed', '愁死了', '18889468125', '重庆市 县 梁平县', '首付多斯蒂芬斯蒂芬', '0', '1aa5ecb826204621ae7a31838834cd6e', '2017-09-30 17:19:01', null);
INSERT INTO `tb_shouhuo_address` VALUES ('e39564c3d61d4f58a846d19cb752e052', '李巴巴', '15189638745', '海南省 海口市 美兰区', '公司的说的电饭锅', '1', '54104bc4281d4c848ab83d396a0fbe74', '2017-09-30 16:18:29', null);

-- ----------------------------
-- Table structure for tb_user_kehu
-- ----------------------------
DROP TABLE IF EXISTS `tb_user_kehu`;
CREATE TABLE `tb_user_kehu` (
  `user_kehu_id` varchar(255) NOT NULL COMMENT '用户ID(主键)',
  `phone` varchar(11) DEFAULT NULL COMMENT '手机号',
  `loginPassword` varchar(255) DEFAULT NULL COMMENT '密码',
  `headImg` varchar(255) DEFAULT NULL COMMENT '头像',
  `userName` varchar(50) DEFAULT NULL COMMENT '用户名',
  `sex` varchar(255) DEFAULT NULL COMMENT '性别',
  `calendar` varchar(255) DEFAULT NULL COMMENT '日历（农历/日历）',
  `birthday` varchar(255) DEFAULT NULL COMMENT '生日',
  `shanghuName` varchar(255) DEFAULT NULL COMMENT '商户名称',
  `address` varchar(255) DEFAULT NULL COMMENT '地址(省/市/区、县)',
  `detailAddress` varchar(255) DEFAULT NULL COMMENT '详细地址(街道)',
  `registerTime` varchar(30) DEFAULT NULL COMMENT '注册时间',
  `last_login_time` varchar(255) DEFAULT NULL COMMENT '最近登录时间(每次登录时，更新为当前时间)',
  `ip` varchar(100) DEFAULT NULL COMMENT '登录的IP地址',
  `status` varchar(2) DEFAULT NULL COMMENT '状态(1-使用中，默认。0-禁用状态)',
  `bz` varchar(255) DEFAULT NULL COMMENT '备注',
  `payPassword` varchar(255) DEFAULT NULL COMMENT '支付密码',
  `float` double(100,2) DEFAULT '1.00' COMMENT '上浮或者下浮百分之几，默认1即100%',
  `bucha` double(100,2) DEFAULT '0.00' COMMENT '补差钱',
  `balance` double(100,2) DEFAULT '0.00' COMMENT '余额',
  `duankou_fid` varchar(255) DEFAULT NULL COMMENT '端口表外建id',
  PRIMARY KEY (`user_kehu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=gb2312 COMMENT='客户端用户表';

-- ----------------------------
-- Records of tb_user_kehu
-- ----------------------------
INSERT INTO `tb_user_kehu` VALUES ('192b3f893a654d3aaf6e66af37fb45c8', '17876407761', 'e10adc3949ba59abbe56e057f20f883e', null, '三总', '女', '农历', '2017-09-15', '国兴，大润达', '新疆乌鲁木齐市乌鲁木齐县', '沈达大厦', '2017-09-21 18:40:53', '2017-09-30 10:12:28', '192.168.1.124', '1', '小菜一篮用户', null, null, '10.00', '0.00', '');
INSERT INTO `tb_user_kehu` VALUES ('1aa5ecb826204621ae7a31838834cd6e', '18888888888', 'e10adc3949ba59abbe56e057f20f883e', null, '小黄', '男', null, null, '老爸茶（饭店）', '海南省海口市琼山区', '中丹村50号', '2017-09-28 15:11:15', '2017-10-10 10:49:20', '192.168.1.124', '1', '小菜一篮用户', null, '1.00', '0.00', '0.00', null);
INSERT INTO `tb_user_kehu` VALUES ('54104bc4281d4c848ab83d396a0fbe74', '13333333333', 'e10adc3949ba59abbe56e057f20f883e', null, '来总', '女', null, null, '如家酒店', '云南省昆明市市辖区', '干干净净', '2017-09-22 17:09:51', '2017-10-09 09:07:47', '127.0.0.1', '1', '小菜一篮用户', null, '1.00', '0.00', '50.00', 'd79369dc72e346a281c32ffc0958df96');
INSERT INTO `tb_user_kehu` VALUES ('5c663c5b92b64ac088b02a3597635b16', '13676407758', 'e10adc3949ba59abbe56e057f20f883e', null, '尼总', '女', '农历', '2017-09-22', '喜来登大酒店', '广西省南宁市市辖区', 'qweweq', '2017-09-22 15:34:45', '2017-09-30 10:11:48', '192.168.1.124', '1', '小菜一篮用户', null, null, '0.00', '0.00', '');
INSERT INTO `tb_user_kehu` VALUES ('60295c023a9f4deabbdfcb061534397d', '13976407761', 'e10adc3949ba59abbe56e057f20f883e', null, '晓飞', '男', '农历', '2017-09-19', '老爸茶饭店', '海南海口市美兰区', '上丹小区', '2017-09-21 17:09:00', '2017-09-30 10:03:09', '192.168.1.124', '1', '小菜一篮用户', null, null, '0.50', '0.00', null);
INSERT INTO `tb_user_kehu` VALUES ('9328f1c240224a928f646d09f8ba18e7', '17776407761', 'e10adc3949ba59abbe56e057f20f883e', null, '黄总', '男', '新历', '2018-09-13', '华盛顿酒店', '陕西省西安市市辖区', '794987', '2017-09-22 15:40:53', '2017-09-30 10:10:13', '192.168.1.124', '1', '小菜一篮用户', null, null, '0.00', '0.00', 'c390522d56404f13847acef70d82b4e7');
INSERT INTO `tb_user_kehu` VALUES ('a78d49a66b09419ab49171b426ffd20d', '15576407761', 'c4ca4238a0b923820dcc509a6f75849b', null, '马总', '男', '新历', '2017-09-21', '马来西亚酒店', '湖北省武汉市市辖区', 'sadsd', '2017-09-22 15:39:35', '2017-09-22 15:39:35', '192.168.1.124', '1', '小菜一篮用户', null, null, '0.00', '0.00', null);
INSERT INTO `tb_user_kehu` VALUES ('ac7c5a2aea7546a6895d9b8c043987f7', '18898556588', '202cb962ac59075b964b07152d234b70', null, '张三', '男', '农历', '1995-09-15', '发发发发付', '重庆市市辖区万州区', '阿达大大啊官方十大歌手根深蒂固', '2017-09-25 10:29:56', '2017-09-26 15:46:37', '192.168.1.128', '1', '小菜一篮用户', null, '1.00', '10.00', '2.30', 'b30175c36701467cb3051a39059e02b1');
INSERT INTO `tb_user_kehu` VALUES ('c6484844283345a4b0fe4dfe2e6fde52', '18879407761', 'e10adc3949ba59abbe56e057f20f883e', null, '鸿总', '男', '新历', '2017-09-14', '国兴店', '海南省海口市琼山区', '大道黄东', '2017-09-30 12:05:11', '2017-09-30 17:38:38', '192.168.1.124', '1', '小菜一篮用户', null, '1.00', '0.00', '0.00', null);
INSERT INTO `tb_user_kehu` VALUES ('d24a7be2ff8e459c91f5da9fe404c7da', '18898218580', '698d51a19d8a121ce581499d7b701668', null, '杨先生', '男', '农历', '1993-09-16', '666店铺', '海南省海口市龙华区', '凤翔东路1号,小区内会所旁边13976116674小雨 ', '2017-09-22 18:11:50', '2017-10-11 09:51:18', '127.0.0.1', '1', '小菜一篮用户', null, '1.00', '20.00', '0.00', 'b30175c36701467cb3051a39059e02b1');

-- ----------------------------
-- Table structure for tb_withdrawals
-- ----------------------------
DROP TABLE IF EXISTS `tb_withdrawals`;
CREATE TABLE `tb_withdrawals` (
  `WITHDRAWALS_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '记录ID',
  `APPLYNO` varchar(255) DEFAULT NULL COMMENT '申请单号',
  `MEMID` varchar(255) DEFAULT NULL COMMENT '会员ID',
  `BANK` varchar(255) DEFAULT NULL COMMENT '开户行',
  `CARDNO` varchar(255) DEFAULT NULL COMMENT '银行卡号',
  `NAME` varchar(255) DEFAULT NULL COMMENT '开户名称',
  `TELEPHONE` varchar(255) DEFAULT NULL COMMENT '预留手机号',
  `VALUE` int(11) DEFAULT '0' COMMENT '金额',
  `STATUS` int(11) DEFAULT '0' COMMENT '状态',
  `APPLYTIME` varchar(255) DEFAULT NULL COMMENT '操作时间',
  `APPLYIP` varchar(255) DEFAULT NULL COMMENT '申请IP',
  PRIMARY KEY (`WITHDRAWALS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='账户记录';

-- ----------------------------
-- Records of tb_withdrawals
-- ----------------------------
