/*
 Navicat Premium Data Transfer

 Source Server         : Bug-本地
 Source Server Type    : MySQL
 Source Server Version : 50716
 Source Host           : localhost
 Source Database       : Bug-Dev

 Target Server Type    : MySQL
 Target Server Version : 50716
 File Encoding         : utf-8

 Date: 03/04/2018 13:20:12 PM
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `tb_box`
-- ----------------------------
DROP TABLE IF EXISTS `tb_box`;
CREATE TABLE `tb_box` (
  `boId` varchar(50) NOT NULL COMMENT '主键',
  `usId` varchar(50) DEFAULT NULL COMMENT '用户id',
  `gfId` varchar(50) DEFAULT NULL COMMENT '礼物ID',
  `boDate` datetime DEFAULT NULL COMMENT '添加日期(YY/MM/DD hh:mm:ss)',
  PRIMARY KEY (`boId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='礼品宝箱';

-- ----------------------------
--  Table structure for `tb_bugConfig`
-- ----------------------------
DROP TABLE IF EXISTS `tb_bugConfig`;
CREATE TABLE `tb_bugConfig` (
  `bgId` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '主键',
  `bgName` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '小强名称',
  `bgClass` int(11) DEFAULT NULL COMMENT '小强分类(1普通 2签到)',
  `bgGold` int(11) DEFAULT NULL COMMENT '得分',
  `bgCoin` int(11) DEFAULT NULL COMMENT '花费充值币',
  `bgLuck` int(11) DEFAULT NULL COMMENT '幸运依赖',
  `bgDoAve` int(11) DEFAULT NULL COMMENT '点击均值',
  `bgDoMin` int(11) DEFAULT NULL COMMENT '点击底值',
  `bgSetPro` float DEFAULT NULL COMMENT '设置概率(%百分比值)',
  `bgActPro` float DEFAULT NULL COMMENT '实际概率(%百分比值)',
  `bgSort` int(11) DEFAULT NULL COMMENT '小强排序(1-999 正向排序 小到大)',
  `bgStatus` int(11) DEFAULT NULL COMMENT '是否启用(0未启用 1启用)',
  PRIMARY KEY (`bgId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='小强设置表';

-- ----------------------------
--  Table structure for `tb_bugPic`
-- ----------------------------
DROP TABLE IF EXISTS `tb_bugPic`;
CREATE TABLE `tb_bugPic` (
  `bpId` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '主键',
  `bgId` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '小强设置主键',
  `bpClass` int(11) DEFAULT NULL COMMENT '图片分类(1走动图 2个性图 3逃跑图 4中毒图 5恢复图 6死亡图)',
  `bpPicPath` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '图片路径',
  `bpSort` int(11) DEFAULT NULL COMMENT '小强排序(1-999 正向排序 小到大)',
  PRIMARY KEY (`bpId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='小强图片';

-- ----------------------------
--  Table structure for `tb_config`
-- ----------------------------
DROP TABLE IF EXISTS `tb_config`;
CREATE TABLE `tb_config` (
  `cfId` varchar(50) NOT NULL COMMENT '主键Id',
  `cfNO` int(11) DEFAULT NULL COMMENT '配置编号(编号见“库表JSON说明”)',
  `cfTitle` varchar(100) DEFAULT NULL COMMENT '配置标题',
  `cfInfo` varchar(500) DEFAULT NULL COMMENT '配置说明',
  `cfValue` varchar(3000) DEFAULT NULL COMMENT '配置值JSON(JSON格式见“库表JSON说明”)',
  `cfDate` datetime DEFAULT NULL COMMENT '更新日期(YY/MM/DD hh:mm:ss)',
  PRIMARY KEY (`cfId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统配置表';

-- ----------------------------
--  Table structure for `tb_express`
-- ----------------------------
DROP TABLE IF EXISTS `tb_express`;
CREATE TABLE `tb_express` (
  `expId` varchar(50) NOT NULL COMMENT '主键',
  `usId` varchar(50) DEFAULT NULL COMMENT '用户ID',
  `expName` varchar(50) DEFAULT NULL COMMENT '收件人姓名',
  `expTel` varchar(50) DEFAULT NULL COMMENT '收件人电话',
  `expProvince` varchar(50) DEFAULT NULL COMMENT '收件省份',
  `expCity` varchar(50) DEFAULT NULL COMMENT '收件城市',
  `expZipCode` varchar(50) DEFAULT NULL COMMENT '收件邮编',
  `expAddress` varchar(500) DEFAULT NULL COMMENT '收件详细地址',
  PRIMARY KEY (`expId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='邮寄信息表';

-- ----------------------------
--  Table structure for `tb_gift`
-- ----------------------------
DROP TABLE IF EXISTS `tb_gift`;
CREATE TABLE `tb_gift` (
  `gfId` varchar(50) NOT NULL COMMENT '主键',
  `gfClass` int(11) DEFAULT NULL COMMENT '礼品分类(1喷雾剂 2实物 3虚拟物品)',
  `gfName` varchar(50) DEFAULT NULL COMMENT '礼品名称',
  `gfLogoPic` varchar(200) DEFAULT NULL COMMENT 'logo图片地址',
  `gfInfo` varchar(200) DEFAULT NULL COMMENT '礼品描述',
  `gfWantPer` int(11) DEFAULT NULL COMMENT '多少人想要',
  `gfStock` int(11) DEFAULT NULL COMMENT '库存量',
  `gfExchange` int(11) DEFAULT NULL COMMENT '累计兑换量',
  `gfGold` int(11) DEFAULT NULL COMMENT '礼品所需得分',
  `gfSoft` int(11) DEFAULT NULL COMMENT '礼物排序(1-999 正向排序 小到大)',
  `gfDate` datetime DEFAULT NULL COMMENT '更新时间(YY/MM/DD hh:mm:ss)',
  `gfTem` int(11) DEFAULT NULL COMMENT '启用状态(0未启用 1启用 2废弃 3不可兑换 4下架)',
  `gfMoney` float DEFAULT NULL COMMENT '累计礼物花费',
  PRIMARY KEY (`gfId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='礼品信息表';

-- ----------------------------
--  Table structure for `tb_giftExch`
-- ----------------------------
DROP TABLE IF EXISTS `tb_giftExch`;
CREATE TABLE `tb_giftExch` (
  `geId` varchar(50) NOT NULL COMMENT '主键',
  `geGroup` varchar(50) DEFAULT NULL COMMENT '购买组Id(打包购买时产生)',
  `usId` varchar(50) DEFAULT NULL COMMENT '用户ID',
  `gfId` varchar(50) DEFAULT NULL COMMENT '礼品ID',
  `geNum` int(11) DEFAULT NULL COMMENT '兑换数量',
  `geGold` int(11) DEFAULT NULL COMMENT '购买时花费分数',
  `geName` varchar(50) DEFAULT NULL COMMENT '兑换收件人姓名',
  `geProvince` varchar(50) DEFAULT NULL COMMENT '兑换收件省份',
  `geCity` varchar(50) DEFAULT NULL COMMENT '兑换收件城市',
  `geZipCode` varchar(50) DEFAULT NULL COMMENT '兑换收件邮编',
  `geTel` varchar(50) DEFAULT NULL COMMENT '兑换收件人电话',
  `geAddress` varchar(500) DEFAULT NULL COMMENT '兑换收件详细地址',
  `geExpName` varchar(50) DEFAULT NULL COMMENT '快递公司名称',
  `geExpNO` varchar(50) DEFAULT NULL COMMENT '快递单号',
  `geExpTel` varchar(50) DEFAULT NULL COMMENT '快递员电话',
  `geExpMoney` float DEFAULT NULL COMMENT '用户支付的邮费',
  `geDate` datetime DEFAULT NULL COMMENT '兑换时间(YY/MM/DD hh:mm:ss)',
  `geDeliveryDate` datetime DEFAULT NULL COMMENT '发货时间(YY/MM/DD hh:mm:ss)',
  `geArrivalDate` datetime DEFAULT NULL COMMENT '到货时间(YY/MM/DD hh:mm:ss)',
  `geSigStatus` int(11) DEFAULT NULL COMMENT '单品兑换状态(0未处理 1已备货 2邀邮 3已邮)',
  `geGroStatus` int(11) DEFAULT NULL COMMENT '全品兑换状态(0未处理 1备货中 2已备货 3邀约 4已邮)',
  `geExpUserMoney` float DEFAULT NULL COMMENT '实际邮寄费用',
  `geRemark` varchar(500) DEFAULT NULL COMMENT '备注说明',
  PRIMARY KEY (`geId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='礼品兑换表';

-- ----------------------------
--  Table structure for `tb_recharge`
-- ----------------------------
DROP TABLE IF EXISTS `tb_recharge`;
CREATE TABLE `tb_recharge` (
  `reId` varchar(50) NOT NULL COMMENT '主键ID',
  `usId` varchar(50) DEFAULT NULL COMMENT '用户ID',
  `reMoney` float DEFAULT NULL COMMENT '充值花费钱',
  `reCoin` int(11) DEFAULT NULL COMMENT '用户充值币(获得喷雾剂数)',
  `reDate` datetime DEFAULT NULL COMMENT '充值时间(YY/MM/DD hh:mm:ss)',
  PRIMARY KEY (`reId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='充值记录';

-- ----------------------------
--  Table structure for `tb_user`
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user` (
  `usId` varchar(50) NOT NULL COMMENT '主键',
  `usWxId` varchar(50) DEFAULT NULL COMMENT '微信用户ID',
  `usName` varchar(50) DEFAULT NULL COMMENT '用户姓名',
  `usCoin` int(11) DEFAULT NULL COMMENT '剩余充值币(喷雾剂)',
  `usLastGold` int(11) DEFAULT NULL COMMENT '最后单局得分',
  `usGold` int(11) DEFAULT NULL COMMENT '累计用户得分',
  `usMaxGold` int(11) DEFAULT NULL COMMENT '累计用户得分(得分最高记录)',
  `usMaxGoldDate` datetime DEFAULT NULL COMMENT '累计最高得分日期(YY/MM/DD hh:mm:ss)',
  `usLuck` int(11) DEFAULT NULL COMMENT '幸运值',
  `usConvertList` int(11) DEFAULT NULL COMMENT '兑换记录提醒(null 无提醒 1提醒)',
  `usSetVoice` int(11) DEFAULT NULL COMMENT '声音配置(null开启,1关闭)',
  `usSynDate` datetime DEFAULT NULL COMMENT '初次登录时间(YY/MM/DD hh:mm:ss)',
  `usDate` datetime DEFAULT NULL COMMENT '最后访问时间(YY/MM/DD hh:mm:ss)',
  `usGraCoin` int(11) DEFAULT NULL COMMENT '用户累计充值币',
  `usGraMoney` float DEFAULT NULL COMMENT '用户累计总花费',
  PRIMARY KEY (`usId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户信息表';

SET FOREIGN_KEY_CHECKS = 1;
