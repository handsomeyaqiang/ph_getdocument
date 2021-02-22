/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50534
Source Host           : localhost:3306
Source Database       : spider

Target Server Type    : MYSQL
Target Server Version : 50534
File Encoding         : 65001

Date: 2021-02-22 14:19:53
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `real_movie_rank`
-- ----------------------------
DROP TABLE IF EXISTS `real_movie_rank`;
CREATE TABLE `real_movie_rank` (
  `rank_id` int(11) NOT NULL,
  `movie_name` varchar(32) DEFAULT NULL,
  `drpp` varchar(255) DEFAULT NULL,
  `currdate_person` varchar(255) DEFAULT NULL,
  `yspf` varchar(255) DEFAULT NULL,
  `ssljpf` varchar(255) DEFAULT NULL,
  `href` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rank_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of real_movie_rank
-- ----------------------------
INSERT INTO `real_movie_rank` VALUES ('1', '误杀', '177', null, null, '11.97亿', 'http://58921.com//film/9663');
INSERT INTO `real_movie_rank` VALUES ('2', '动物特工局 ', '104', null, null, '4338.39万', 'http://58921.com//film/8077');
INSERT INTO `real_movie_rank` VALUES ('3', '解放·终局营救', '26', null, null, '4110.19万', 'http://58921.com//film/9642');
INSERT INTO `real_movie_rank` VALUES ('4', '我和我的祖国', '14', null, null, '31.46亿', 'http://58921.com//film/9134');
INSERT INTO `real_movie_rank` VALUES ('5', '唐人街探案3 ', '7', null, null, null, 'http://58921.com//film/7695');
INSERT INTO `real_movie_rank` VALUES ('6', '叶问4', '6', null, null, '11.72亿', 'http://58921.com//film/9566');
INSERT INTO `real_movie_rank` VALUES ('7', '流浪地球', '6', null, null, '46.18亿', 'http://58921.com//film/6904');
INSERT INTO `real_movie_rank` VALUES ('8', '何以为家', '5', null, null, '3.7亿', 'http://58921.com//film/9194');
INSERT INTO `real_movie_rank` VALUES ('9', '魔镜奇缘3 ', '4', null, null, '317.93万', 'http://58921.com//film/9733');
INSERT INTO `real_movie_rank` VALUES ('10', '昆仑兄弟', '4', null, null, '295.31万', 'http://58921.com//film/9250');
INSERT INTO `real_movie_rank` VALUES ('11', '战狼2', '4', null, null, '56.39亿', 'http://58921.com//film/5331');
INSERT INTO `real_movie_rank` VALUES ('12', '那人那事', '3', null, null, '54.18万', 'http://58921.com//film/9831');
INSERT INTO `real_movie_rank` VALUES ('13', '远去的牧歌 ', '3', null, null, '672.58万', 'http://58921.com//film/8907');
INSERT INTO `real_movie_rank` VALUES ('14', '士兵顺溜：兵王争锋', '2', null, null, '185.94万', 'http://58921.com//film/9791');
INSERT INTO `real_movie_rank` VALUES ('15', '蓝色百褶裙', '2', null, null, null, 'http://58921.com//film/9829');
INSERT INTO `real_movie_rank` VALUES ('16', '那时风华 ', '2', null, null, '1535.43万', 'http://58921.com//film/9755');
INSERT INTO `real_movie_rank` VALUES ('17', '红旗渠之归来仍是少年', '2', null, null, '85.64万', 'http://58921.com//film/9720');
INSERT INTO `real_movie_rank` VALUES ('18', '海林都', '2', null, null, '4621.04万', 'http://58921.com//film/9717');
INSERT INTO `real_movie_rank` VALUES ('19', '为国而歌', '2', null, null, '795.92万', 'http://58921.com//film/9558');
INSERT INTO `real_movie_rank` VALUES ('20', '鲨海逃生', '1', null, null, '4674.65万', 'http://58921.com//film/9840');
INSERT INTO `real_movie_rank` VALUES ('21', '阳光下的少年之我的无色世界 ', '1', null, null, '4.76万', 'http://58921.com//film/9859');
INSERT INTO `real_movie_rank` VALUES ('22', '变身特工', '1', null, null, '1.02亿', 'http://58921.com//film/9810');
INSERT INTO `real_movie_rank` VALUES ('23', '利刃破冰', '1', null, null, '220.94万', 'http://58921.com//film/9787');
INSERT INTO `real_movie_rank` VALUES ('24', '太空狗之月球大冒险', '1', null, null, '285.09万', 'http://58921.com//film/9732');

-- ----------------------------
-- Table structure for `user_relation`
-- ----------------------------
DROP TABLE IF EXISTS `user_relation`;
CREATE TABLE `user_relation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `followed_user_id` int(11) DEFAULT NULL,
  `followed_time` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_relation
-- ----------------------------
INSERT INTO `user_relation` VALUES ('1', '23', '32', '2020-11-27');
INSERT INTO `user_relation` VALUES ('2', '23', '45', '2020-11-27');
INSERT INTO `user_relation` VALUES ('3', '32', '23', '2020-11-27');
INSERT INTO `user_relation` VALUES ('4', '35', '87', '2020-11-27');

-- ----------------------------
-- Table structure for `weiboresou`
-- ----------------------------
DROP TABLE IF EXISTS `weiboresou`;
CREATE TABLE `weiboresou` (
  `rank_id` int(11) DEFAULT '0',
  `title` varchar(255) DEFAULT NULL,
  `remark` int(11) DEFAULT NULL,
  `hot` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of weiboresou
-- ----------------------------
INSERT INTO `weiboresou` VALUES ('0', '全国所有地级以上城市覆盖5G', null, '热', 'https://s.weibo.com//weibo?q=%23%E5%85%A8%E5%9B%BD%E6%89%80%E6%9C%89%E5%9C%B0%E7%BA%A7%E4%BB%A5%E4%B8%8A%E5%9F%8E%E5%B8%82%E8%A6%86%E7%9B%965G%23&Refer=new_time', '热搜榜');
INSERT INTO `weiboresou` VALUES ('1', '支付宝写福', '3451341', '沸', 'https://s.weibo.com//weibo?q=%23%E6%94%AF%E4%BB%98%E5%AE%9D%E5%86%99%E7%A6%8F%23&Refer=top', '热搜榜');
INSERT INTO `weiboresou` VALUES ('2', '国务院安委办约谈山东省政府', '2293331', '新', 'https://s.weibo.com//weibo?q=%23%E5%9B%BD%E5%8A%A1%E9%99%A2%E5%AE%89%E5%A7%94%E5%8A%9E%E7%BA%A6%E8%B0%88%E5%B1%B1%E4%B8%9C%E7%9C%81%E6%94%BF%E5%BA%9C%23&Refer=top', '热搜榜');
INSERT INTO `weiboresou` VALUES ('3', '关晓彤FRED甜心大片', '2253571', '荐', 'https://s.weibo.com//weibo?q=%23%E5%85%B3%E6%99%93%E5%BD%A4FRED%E7%94%9C%E5%BF%83%E5%A4%A7%E7%89%87%23&topic_ad=1&Refer=top', '热搜榜');
INSERT INTO `weiboresou` VALUES ('4', '浙江多地车厘子价格跳水', '2222331', '新', 'https://s.weibo.com//weibo?q=%23%E6%B5%99%E6%B1%9F%E5%A4%9A%E5%9C%B0%E8%BD%A6%E5%8E%98%E5%AD%90%E4%BB%B7%E6%A0%BC%E8%B7%B3%E6%B0%B4%23&Refer=top', '热搜榜');
INSERT INTO `weiboresou` VALUES ('5', '洛洛的微博', '2206321', '沸', 'https://s.weibo.com//weibo?q=%E6%B4%9B%E6%B4%9B%E7%9A%84%E5%BE%AE%E5%8D%9A&Refer=top', '热搜榜');
INSERT INTO `weiboresou` VALUES ('6', '高嘉朗公开恋情', '2138683', '新', 'https://s.weibo.com//weibo?q=%E9%AB%98%E5%98%89%E6%9C%97%E5%85%AC%E5%BC%80%E6%81%8B%E6%83%85&Refer=top', '热搜榜');
INSERT INTO `weiboresou` VALUES ('7', '艾略特佩吉离婚', '1114720', '新', 'https://s.weibo.com//weibo?q=%23%E8%89%BE%E7%95%A5%E7%89%B9%E4%BD%A9%E5%90%89%E7%A6%BB%E5%A9%9A%23&Refer=top', '热搜榜');
INSERT INTO `weiboresou` VALUES ('8', '警方撤销对辱骂社区书记女子的行政处罚', '1113357', '沸', 'https://s.weibo.com//weibo?q=%23%E8%AD%A6%E6%96%B9%E6%92%A4%E9%94%80%E5%AF%B9%E8%BE%B1%E9%AA%82%E7%A4%BE%E5%8C%BA%E4%B9%A6%E8%AE%B0%E5%A5%B3%E5%AD%90%E7%9A%84%E8%A1%8C%E6%94%BF%E5%A4%84%E7%BD%9A%23&Refer=top', '热搜榜');
INSERT INTO `weiboresou` VALUES ('9', '现实版樊胜美', '961127', '沸', 'https://s.weibo.com//weibo?q=%23%E7%8E%B0%E5%AE%9E%E7%89%88%E6%A8%8A%E8%83%9C%E7%BE%8E%23&Refer=top', '热搜榜');
INSERT INTO `weiboresou` VALUES ('10', '全国多地公务员省考提前', '680629', '新', 'https://s.weibo.com//weibo?q=%E5%85%A8%E5%9B%BD%E5%A4%9A%E5%9C%B0%E5%85%AC%E5%8A%A1%E5%91%98%E7%9C%81%E8%80%83%E6%8F%90%E5%89%8D&Refer=top', '热搜榜');
INSERT INTO `weiboresou` VALUES ('11', '胡冰卿演技', '624413', '沸', 'https://s.weibo.com//weibo?q=%23%E8%83%A1%E5%86%B0%E5%8D%BF%E6%BC%94%E6%8A%80%23&Refer=top', '热搜榜');
INSERT INTO `weiboresou` VALUES ('12', '各地花式留人过年', '567093', '新', 'https://s.weibo.com//weibo?q=%23%E5%90%84%E5%9C%B0%E8%8A%B1%E5%BC%8F%E7%95%99%E4%BA%BA%E8%BF%87%E5%B9%B4%23&Refer=top', '热搜榜');
INSERT INTO `weiboresou` VALUES ('13', '微信左哼哼没了', '417706', '热', 'https://s.weibo.com//weibo?q=%23%E5%BE%AE%E4%BF%A1%E5%B7%A6%E5%93%BC%E5%93%BC%E6%B2%A1%E4%BA%86%23&Refer=top', '热搜榜');
INSERT INTO `weiboresou` VALUES ('14', '石家庄低风险区有序恢复商超经营', '417054', '新', 'https://s.weibo.com//weibo?q=%23%E7%9F%B3%E5%AE%B6%E5%BA%84%E4%BD%8E%E9%A3%8E%E9%99%A9%E5%8C%BA%E6%9C%89%E5%BA%8F%E6%81%A2%E5%A4%8D%E5%95%86%E8%B6%85%E7%BB%8F%E8%90%A5%23&Refer=top', '热搜榜');
INSERT INTO `weiboresou` VALUES ('15', '姚晨给自己和白宇取CP名', '413353', null, 'https://s.weibo.com//weibo?q=%23%E5%A7%9A%E6%99%A8%E7%BB%99%E8%87%AA%E5%B7%B1%E5%92%8C%E7%99%BD%E5%AE%87%E5%8F%96CP%E5%90%8D%23&Refer=top', '热搜榜');
INSERT INTO `weiboresou` VALUES ('16', '上海新增1例本地确诊', '410426', null, 'https://s.weibo.com//weibo?q=%23%E4%B8%8A%E6%B5%B7%E6%96%B0%E5%A2%9E1%E4%BE%8B%E6%9C%AC%E5%9C%B0%E7%A1%AE%E8%AF%8A%23&Refer=top', '热搜榜');
INSERT INTO `weiboresou` VALUES ('17', '孟佳想参加恋爱综艺的理由', '408354', '新', 'https://s.weibo.com//weibo?q=%23%E5%AD%9F%E4%BD%B3%E6%83%B3%E5%8F%82%E5%8A%A0%E6%81%8B%E7%88%B1%E7%BB%BC%E8%89%BA%E7%9A%84%E7%90%86%E7%94%B1%23&Refer=top', '热搜榜');
INSERT INTO `weiboresou` VALUES ('18', '李银河谈单身潮的原因', '406497', null, 'https://s.weibo.com//weibo?q=%23%E6%9D%8E%E9%93%B6%E6%B2%B3%E8%B0%88%E5%8D%95%E8%BA%AB%E6%BD%AE%E7%9A%84%E5%8E%9F%E5%9B%A0%23&Refer=top', '热搜榜');
INSERT INTO `weiboresou` VALUES ('19', '90后医生用细菌作画教孩子讲卫生', '405052', null, 'https://s.weibo.com//weibo?q=90%E5%90%8E%E5%8C%BB%E7%94%9F%E7%94%A8%E7%BB%86%E8%8F%8C%E4%BD%9C%E7%94%BB%E6%95%99%E5%AD%A9%E5%AD%90%E8%AE%B2%E5%8D%AB%E7%94%9F&Refer=top', '热搜榜');
INSERT INTO `weiboresou` VALUES ('20', '长辈重男轻女该怎么办', '387183', null, 'https://s.weibo.com//weibo?q=%E9%95%BF%E8%BE%88%E9%87%8D%E7%94%B7%E8%BD%BB%E5%A5%B3%E8%AF%A5%E6%80%8E%E4%B9%88%E5%8A%9E&Refer=top', '热搜榜');
INSERT INTO `weiboresou` VALUES ('21', '阳光之下', '377482', null, 'https://s.weibo.com//weibo?q=%E9%98%B3%E5%85%89%E4%B9%8B%E4%B8%8B&Refer=top', '热搜榜');
INSERT INTO `weiboresou` VALUES ('22', '橙里橙气的甜品', '367362', null, 'https://s.weibo.com//weibo?q=%23%E6%A9%99%E9%87%8C%E6%A9%99%E6%B0%94%E7%9A%84%E7%94%9C%E5%93%81%23&Refer=top', '热搜榜');
INSERT INTO `weiboresou` VALUES ('23', '北京新增本土确诊4例', '326355', null, 'https://s.weibo.com//weibo?q=%23%E5%8C%97%E4%BA%AC%E6%96%B0%E5%A2%9E%E6%9C%AC%E5%9C%9F%E7%A1%AE%E8%AF%8A4%E4%BE%8B%23&Refer=top', '热搜榜');
INSERT INTO `weiboresou` VALUES ('24', '陈翔', '319809', '热', 'https://s.weibo.com//weibo?q=%E9%99%88%E7%BF%94&Refer=top', '热搜榜');
INSERT INTO `weiboresou` VALUES ('25', '吉林通化一线医务人员补助提高一倍', '308148', '新', 'https://s.weibo.com//weibo?q=%23%E5%90%89%E6%9E%97%E9%80%9A%E5%8C%96%E4%B8%80%E7%BA%BF%E5%8C%BB%E5%8A%A1%E4%BA%BA%E5%91%98%E8%A1%A5%E5%8A%A9%E6%8F%90%E9%AB%98%E4%B8%80%E5%80%8D%23&Refer=top', '热搜榜');
INSERT INTO `weiboresou` VALUES ('26', '美国参议院确认布林肯为国务卿', '271546', null, 'https://s.weibo.com//weibo?q=%E7%BE%8E%E5%9B%BD%E5%8F%82%E8%AE%AE%E9%99%A2%E7%A1%AE%E8%AE%A4%E5%B8%83%E6%9E%97%E8%82%AF%E4%B8%BA%E5%9B%BD%E5%8A%A1%E5%8D%BF&Refer=top', '热搜榜');
INSERT INTO `weiboresou` VALUES ('27', '希金斯新冠病毒检测呈阳性', '255466', null, 'https://s.weibo.com//weibo?q=%E5%B8%8C%E9%87%91%E6%96%AF%E6%96%B0%E5%86%A0%E7%97%85%E6%AF%92%E6%A3%80%E6%B5%8B%E5%91%88%E9%98%B3%E6%80%A7&Refer=top', '热搜榜');
INSERT INTO `weiboresou` VALUES ('28', '风起霓裳预告', '230006', null, 'https://s.weibo.com//weibo?q=%23%E9%A3%8E%E8%B5%B7%E9%9C%93%E8%A3%B3%E9%A2%84%E5%91%8A%23&Refer=top', '热搜榜');
INSERT INTO `weiboresou` VALUES ('29', '杭州和事佬', '215843', null, 'https://s.weibo.com//weibo?q=%E6%9D%AD%E5%B7%9E%E5%92%8C%E4%BA%8B%E4%BD%AC&Refer=top', '热搜榜');
INSERT INTO `weiboresou` VALUES ('30', '珠海国资向FF投资20亿元', '203526', '新', 'https://s.weibo.com//weibo?q=%23%E7%8F%A0%E6%B5%B7%E5%9B%BD%E8%B5%84%E5%90%91FF%E6%8A%95%E8%B5%8420%E4%BA%BF%E5%85%83%23&Refer=top', '热搜榜');
INSERT INTO `weiboresou` VALUES ('31', '市监部门介入调查go猫粮产品质量', '195849', null, 'https://s.weibo.com//weibo?q=%23%E5%B8%82%E7%9B%91%E9%83%A8%E9%97%A8%E4%BB%8B%E5%85%A5%E8%B0%83%E6%9F%A5go%E7%8C%AB%E7%B2%AE%E4%BA%A7%E5%93%81%E8%B4%A8%E9%87%8F%23&Refer=top', '热搜榜');
INSERT INTO `weiboresou` VALUES ('32', '长沙万名球迷照片拼成巨幅科比海报', '193147', null, 'https://s.weibo.com//weibo?q=%E9%95%BF%E6%B2%99%E4%B8%87%E5%90%8D%E7%90%83%E8%BF%B7%E7%85%A7%E7%89%87%E6%8B%BC%E6%88%90%E5%B7%A8%E5%B9%85%E7%A7%91%E6%AF%94%E6%B5%B7%E6%8A%A5&Refer=top', '热搜榜');
INSERT INTO `weiboresou` VALUES ('33', '马来西亚签约购买中国新冠疫苗', '190532', '新', 'https://s.weibo.com//weibo?q=%E9%A9%AC%E6%9D%A5%E8%A5%BF%E4%BA%9A%E7%AD%BE%E7%BA%A6%E8%B4%AD%E4%B9%B0%E4%B8%AD%E5%9B%BD%E6%96%B0%E5%86%A0%E7%96%AB%E8%8B%97&Refer=top', '热搜榜');
INSERT INTO `weiboresou` VALUES ('34', '特朗普律师被投票系统公司指控诽谤', '183689', null, 'https://s.weibo.com//weibo?q=%23%E7%89%B9%E6%9C%97%E6%99%AE%E5%BE%8B%E5%B8%88%E8%A2%AB%E6%8A%95%E7%A5%A8%E7%B3%BB%E7%BB%9F%E5%85%AC%E5%8F%B8%E6%8C%87%E6%8E%A7%E8%AF%BD%E8%B0%A4%23&Refer=top', '热搜榜');
INSERT INTO `weiboresou` VALUES ('35', '邓超 鞋脱成这样挺诡异的', '180932', null, 'https://s.weibo.com//weibo?q=%E9%82%93%E8%B6%85%20%E9%9E%8B%E8%84%B1%E6%88%90%E8%BF%99%E6%A0%B7%E6%8C%BA%E8%AF%A1%E5%BC%82%E7%9A%84&Refer=top', '热搜榜');
INSERT INTO `weiboresou` VALUES ('36', '全球新冠确诊病例超1亿例', '178754', null, 'https://s.weibo.com//weibo?q=%23%E5%85%A8%E7%90%83%E6%96%B0%E5%86%A0%E7%A1%AE%E8%AF%8A%E7%97%85%E4%BE%8B%E8%B6%851%E4%BA%BF%E4%BE%8B%23&Refer=top', '热搜榜');
INSERT INTO `weiboresou` VALUES ('37', '中消协批有经营者用盲盒清库存', '176120', null, 'https://s.weibo.com//weibo?q=%23%E4%B8%AD%E6%B6%88%E5%8D%8F%E6%89%B9%E6%9C%89%E7%BB%8F%E8%90%A5%E8%80%85%E7%94%A8%E7%9B%B2%E7%9B%92%E6%B8%85%E5%BA%93%E5%AD%98%23&Refer=top', '热搜榜');
INSERT INTO `weiboresou` VALUES ('38', '回形针', '167886', null, 'https://s.weibo.com//weibo?q=%E5%9B%9E%E5%BD%A2%E9%92%88&Refer=top', '热搜榜');
INSERT INTO `weiboresou` VALUES ('39', '周润发与妻子的相处模式', '161215', '新', 'https://s.weibo.com//weibo?q=%E5%91%A8%E6%B6%A6%E5%8F%91%E4%B8%8E%E5%A6%BB%E5%AD%90%E7%9A%84%E7%9B%B8%E5%A4%84%E6%A8%A1%E5%BC%8F&Refer=top', '热搜榜');
INSERT INTO `weiboresou` VALUES ('40', '张若昀方否认耍大牌', '152764', null, 'https://s.weibo.com//weibo?q=%23%E5%BC%A0%E8%8B%A5%E6%98%80%E6%96%B9%E5%90%A6%E8%AE%A4%E8%80%8D%E5%A4%A7%E7%89%8C%23&Refer=top', '热搜榜');
INSERT INTO `weiboresou` VALUES ('41', '重庆百架无人机表演失控撞楼', '140988', null, 'https://s.weibo.com//weibo?q=%23%E9%87%8D%E5%BA%86%E7%99%BE%E6%9E%B6%E6%97%A0%E4%BA%BA%E6%9C%BA%E8%A1%A8%E6%BC%94%E5%A4%B1%E6%8E%A7%E6%92%9E%E6%A5%BC%23&Refer=top', '热搜榜');
INSERT INTO `weiboresou` VALUES ('42', '呼伦贝尔月晕', '125042', '新', 'https://s.weibo.com//weibo?q=%E5%91%BC%E4%BC%A6%E8%B4%9D%E5%B0%94%E6%9C%88%E6%99%95&Refer=top', '热搜榜');
INSERT INTO `weiboresou` VALUES ('43', '膏药的正确贴法', '124982', '新', 'https://s.weibo.com//weibo?q=%E8%86%8F%E8%8D%AF%E7%9A%84%E6%AD%A3%E7%A1%AE%E8%B4%B4%E6%B3%95&Refer=top', '热搜榜');
INSERT INTO `weiboresou` VALUES ('44', '杭州加强住房限购', '123620', '新', 'https://s.weibo.com//weibo?q=%E6%9D%AD%E5%B7%9E%E5%8A%A0%E5%BC%BA%E4%BD%8F%E6%88%BF%E9%99%90%E8%B4%AD&Refer=top', '热搜榜');
INSERT INTO `weiboresou` VALUES ('45', '黑龙江新增28例无症状', '123479', '新', 'https://s.weibo.com//weibo?q=%23%E9%BB%91%E9%BE%99%E6%B1%9F%E6%96%B0%E5%A2%9E28%E4%BE%8B%E6%97%A0%E7%97%87%E7%8A%B6%23&Refer=top', '热搜榜');
INSERT INTO `weiboresou` VALUES ('46', 'NBA众球星发文缅怀科比', '122357', '新', 'https://s.weibo.com//weibo?q=%23NBA%E4%BC%97%E7%90%83%E6%98%9F%E5%8F%91%E6%96%87%E7%BC%85%E6%80%80%E7%A7%91%E6%AF%94%23&Refer=top', '热搜榜');
INSERT INTO `weiboresou` VALUES ('47', '程青松出柜', '122065', null, 'https://s.weibo.com//weibo?q=%23%E7%A8%8B%E9%9D%92%E6%9D%BE%E5%87%BA%E6%9F%9C%23&Refer=top', '热搜榜');
INSERT INTO `weiboresou` VALUES ('48', '盛淮南偷看洛枳', '109515', null, 'https://s.weibo.com//weibo?q=%23%E7%9B%9B%E6%B7%AE%E5%8D%97%E5%81%B7%E7%9C%8B%E6%B4%9B%E6%9E%B3%23&Refer=top', '热搜榜');
INSERT INTO `weiboresou` VALUES ('49', '感谢过年不回家的你', '108173', null, 'https://s.weibo.com//weibo?q=%23%E6%84%9F%E8%B0%A2%E8%BF%87%E5%B9%B4%E4%B8%8D%E5%9B%9E%E5%AE%B6%E7%9A%84%E4%BD%A0%23&Refer=top', '热搜榜');
INSERT INTO `weiboresou` VALUES ('50', '李晨演的北漂饭店老板', '107279', null, 'https://s.weibo.com//weibo?q=%E6%9D%8E%E6%99%A8%E6%BC%94%E7%9A%84%E5%8C%97%E6%BC%82%E9%A5%AD%E5%BA%97%E8%80%81%E6%9D%BF&Refer=top', '热搜榜');
INSERT INTO `weiboresou` VALUES ('0', '#感谢过年不回家的你#', null, null, 'https://s.weibo.com//weibo?q=%23%E6%84%9F%E8%B0%A2%E8%BF%87%E5%B9%B4%E4%B8%8D%E5%9B%9E%E5%AE%B6%E7%9A%84%E4%BD%A0%23', '新时代');
INSERT INTO `weiboresou` VALUES ('1', '#吉林新增14例本土确诊#', null, null, 'https://s.weibo.com//weibo?q=%23%E5%90%89%E6%9E%97%E6%96%B0%E5%A2%9E14%E4%BE%8B%E6%9C%AC%E5%9C%9F%E7%A1%AE%E8%AF%8A%23', '新时代');
INSERT INTO `weiboresou` VALUES ('2', '#全球新冠确诊病例超1亿例#', null, null, 'https://s.weibo.com//weibo?q=%23%E5%85%A8%E7%90%83%E6%96%B0%E5%86%A0%E7%A1%AE%E8%AF%8A%E7%97%85%E4%BE%8B%E8%B6%851%E4%BA%BF%E4%BE%8B%23', '新时代');
INSERT INTO `weiboresou` VALUES ('3', '#长辈重男轻女该怎么办#', null, null, 'https://s.weibo.com//weibo?q=%23%E9%95%BF%E8%BE%88%E9%87%8D%E7%94%B7%E8%BD%BB%E5%A5%B3%E8%AF%A5%E6%80%8E%E4%B9%88%E5%8A%9E%23', '新时代');
INSERT INTO `weiboresou` VALUES ('4', '#国务院安委办约谈山东省政府#', null, null, 'https://s.weibo.com//weibo?q=%23%E5%9B%BD%E5%8A%A1%E9%99%A2%E5%AE%89%E5%A7%94%E5%8A%9E%E7%BA%A6%E8%B0%88%E5%B1%B1%E4%B8%9C%E7%9C%81%E6%94%BF%E5%BA%9C%23', '新时代');
INSERT INTO `weiboresou` VALUES ('5', '#消费者反映go猫粮疑致猫中毒死亡#', null, null, 'https://s.weibo.com//weibo?q=%23%E6%B6%88%E8%B4%B9%E8%80%85%E5%8F%8D%E6%98%A0go%E7%8C%AB%E7%B2%AE%E7%96%91%E8%87%B4%E7%8C%AB%E4%B8%AD%E6%AF%92%E6%AD%BB%E4%BA%A1%23', '新时代');
INSERT INTO `weiboresou` VALUES ('6', '#黑龙江新增29例确诊#', null, null, 'https://s.weibo.com//weibo?q=%23%E9%BB%91%E9%BE%99%E6%B1%9F%E6%96%B0%E5%A2%9E29%E4%BE%8B%E7%A1%AE%E8%AF%8A%23', '新时代');
INSERT INTO `weiboresou` VALUES ('7', '#陕西新增1例疑似病例#', null, null, 'https://s.weibo.com//weibo?q=%23%E9%99%95%E8%A5%BF%E6%96%B0%E5%A2%9E1%E4%BE%8B%E7%96%91%E4%BC%BC%E7%97%85%E4%BE%8B%23', '新时代');
INSERT INTO `weiboresou` VALUES ('8', '#重庆百架无人机表演失控撞楼#', null, null, 'https://s.weibo.com//weibo?q=%23%E9%87%8D%E5%BA%86%E7%99%BE%E6%9E%B6%E6%97%A0%E4%BA%BA%E6%9C%BA%E8%A1%A8%E6%BC%94%E5%A4%B1%E6%8E%A7%E6%92%9E%E6%A5%BC%23', '新时代');
INSERT INTO `weiboresou` VALUES ('9', '#全国多地公务员省考提前#', null, null, 'https://s.weibo.com//weibo?q=%23%E5%85%A8%E5%9B%BD%E5%A4%9A%E5%9C%B0%E5%85%AC%E5%8A%A1%E5%91%98%E7%9C%81%E8%80%83%E6%8F%90%E5%89%8D%23', '新时代');
INSERT INTO `weiboresou` VALUES ('10', '#疫情期间日常消毒实用指南#', null, null, 'https://s.weibo.com//weibo?q=%23%E7%96%AB%E6%83%85%E6%9C%9F%E9%97%B4%E6%97%A5%E5%B8%B8%E6%B6%88%E6%AF%92%E5%AE%9E%E7%94%A8%E6%8C%87%E5%8D%97%23', '新时代');
INSERT INTO `weiboresou` VALUES ('11', '#吉林通化一线医务人员补助提高一倍#', null, null, 'https://s.weibo.com//weibo?q=%23%E5%90%89%E6%9E%97%E9%80%9A%E5%8C%96%E4%B8%80%E7%BA%BF%E5%8C%BB%E5%8A%A1%E4%BA%BA%E5%91%98%E8%A1%A5%E5%8A%A9%E6%8F%90%E9%AB%98%E4%B8%80%E5%80%8D%23', '新时代');
INSERT INTO `weiboresou` VALUES ('12', '#警方撤销对辱骂社区书记女子的行政处罚#', null, null, 'https://s.weibo.com//weibo?q=%23%E8%AD%A6%E6%96%B9%E6%92%A4%E9%94%80%E5%AF%B9%E8%BE%B1%E9%AA%82%E7%A4%BE%E5%8C%BA%E4%B9%A6%E8%AE%B0%E5%A5%B3%E5%AD%90%E7%9A%84%E8%A1%8C%E6%94%BF%E5%A4%84%E7%BD%9A%23', '新时代');
INSERT INTO `weiboresou` VALUES ('13', '#河北新增7例确诊#', null, null, 'https://s.weibo.com//weibo?q=%23%E6%B2%B3%E5%8C%97%E6%96%B0%E5%A2%9E7%E4%BE%8B%E7%A1%AE%E8%AF%8A%23', '新时代');
INSERT INTO `weiboresou` VALUES ('14', '#中消协批有经营者用盲盒清库存#', null, null, 'https://s.weibo.com//weibo?q=%23%E4%B8%AD%E6%B6%88%E5%8D%8F%E6%89%B9%E6%9C%89%E7%BB%8F%E8%90%A5%E8%80%85%E7%94%A8%E7%9B%B2%E7%9B%92%E6%B8%85%E5%BA%93%E5%AD%98%23', '新时代');
INSERT INTO `weiboresou` VALUES ('15', '#市监部门介入调查go猫粮产品质量#', null, null, 'https://s.weibo.com//weibo?q=%23%E5%B8%82%E7%9B%91%E9%83%A8%E9%97%A8%E4%BB%8B%E5%85%A5%E8%B0%83%E6%9F%A5go%E7%8C%AB%E7%B2%AE%E4%BA%A7%E5%93%81%E8%B4%A8%E9%87%8F%23', '新时代');
INSERT INTO `weiboresou` VALUES ('16', '#北京新增无症状1例#', null, null, 'https://s.weibo.com//weibo?q=%23%E5%8C%97%E4%BA%AC%E6%96%B0%E5%A2%9E%E6%97%A0%E7%97%87%E7%8A%B61%E4%BE%8B%23', '新时代');
INSERT INTO `weiboresou` VALUES ('17', '#2021年考证时间表#', null, null, 'https://s.weibo.com//weibo?q=%232021%E5%B9%B4%E8%80%83%E8%AF%81%E6%97%B6%E9%97%B4%E8%A1%A8%23', '新时代');
INSERT INTO `weiboresou` VALUES ('18', '#石家庄低风险区有序恢复商超经营#', null, null, 'https://s.weibo.com//weibo?q=%23%E7%9F%B3%E5%AE%B6%E5%BA%84%E4%BD%8E%E9%A3%8E%E9%99%A9%E5%8C%BA%E6%9C%89%E5%BA%8F%E6%81%A2%E5%A4%8D%E5%95%86%E8%B6%85%E7%BB%8F%E8%90%A5%23', '新时代');
INSERT INTO `weiboresou` VALUES ('19', '#美国参议院确认布林肯为国务卿#', null, null, 'https://s.weibo.com//weibo?q=%23%E7%BE%8E%E5%9B%BD%E5%8F%82%E8%AE%AE%E9%99%A2%E7%A1%AE%E8%AE%A4%E5%B8%83%E6%9E%97%E8%82%AF%E4%B8%BA%E5%9B%BD%E5%8A%A1%E5%8D%BF%23', '新时代');
INSERT INTO `weiboresou` VALUES ('20', '#全国有9个高风险79个中风险地区#', null, null, 'https://s.weibo.com//weibo?q=%23%E5%85%A8%E5%9B%BD%E6%9C%899%E4%B8%AA%E9%AB%98%E9%A3%8E%E9%99%A979%E4%B8%AA%E4%B8%AD%E9%A3%8E%E9%99%A9%E5%9C%B0%E5%8C%BA%23', '新时代');
INSERT INTO `weiboresou` VALUES ('21', '#核酸检测采样前30分钟不喝水#', null, null, 'https://s.weibo.com//weibo?q=%23%E6%A0%B8%E9%85%B8%E6%A3%80%E6%B5%8B%E9%87%87%E6%A0%B7%E5%89%8D30%E5%88%86%E9%92%9F%E4%B8%8D%E5%96%9D%E6%B0%B4%23', '新时代');
INSERT INTO `weiboresou` VALUES ('22', '#北京新增本地确诊4例#', null, null, 'https://s.weibo.com//weibo?q=%23%E5%8C%97%E4%BA%AC%E6%96%B0%E5%A2%9E%E6%9C%AC%E5%9C%B0%E7%A1%AE%E8%AF%8A4%E4%BE%8B%23', '新时代');
INSERT INTO `weiboresou` VALUES ('23', '#复阳病例是否还有传染性#', null, null, 'https://s.weibo.com//weibo?q=%23%E5%A4%8D%E9%98%B3%E7%97%85%E4%BE%8B%E6%98%AF%E5%90%A6%E8%BF%98%E6%9C%89%E4%BC%A0%E6%9F%93%E6%80%A7%23', '新时代');
INSERT INTO `weiboresou` VALUES ('24', '#美国新冠肺炎超2540万例#', null, null, 'https://s.weibo.com//weibo?q=%23%E7%BE%8E%E5%9B%BD%E6%96%B0%E5%86%A0%E8%82%BA%E7%82%8E%E8%B6%852540%E4%B8%87%E4%BE%8B%23', '新时代');
INSERT INTO `weiboresou` VALUES ('25', '#通化志愿者送菜后躺雪地休息#', null, null, 'https://s.weibo.com//weibo?q=%23%E9%80%9A%E5%8C%96%E5%BF%97%E6%84%BF%E8%80%85%E9%80%81%E8%8F%9C%E5%90%8E%E8%BA%BA%E9%9B%AA%E5%9C%B0%E4%BC%91%E6%81%AF%23', '新时代');
INSERT INTO `weiboresou` VALUES ('26', '#31省区市新增确诊75例#', null, null, 'https://s.weibo.com//weibo?q=%2331%E7%9C%81%E5%8C%BA%E5%B8%82%E6%96%B0%E5%A2%9E%E7%A1%AE%E8%AF%8A75%E4%BE%8B%23', '新时代');
INSERT INTO `weiboresou` VALUES ('27', '#全国最缺工100个职业排行#', null, null, 'https://s.weibo.com//weibo?q=%23%E5%85%A8%E5%9B%BD%E6%9C%80%E7%BC%BA%E5%B7%A5100%E4%B8%AA%E8%81%8C%E4%B8%9A%E6%8E%92%E8%A1%8C%23', '新时代');
INSERT INTO `weiboresou` VALUES ('28', '#警方回应女子骂社区书记被铐走#', null, null, 'https://s.weibo.com//weibo?q=%23%E8%AD%A6%E6%96%B9%E5%9B%9E%E5%BA%94%E5%A5%B3%E5%AD%90%E9%AA%82%E7%A4%BE%E5%8C%BA%E4%B9%A6%E8%AE%B0%E8%A2%AB%E9%93%90%E8%B5%B0%23', '新时代');
INSERT INTO `weiboresou` VALUES ('29', '#西安酒店拒绝未交全款隔离人员入住#', null, null, 'https://s.weibo.com//weibo?q=%23%E8%A5%BF%E5%AE%89%E9%85%92%E5%BA%97%E6%8B%92%E7%BB%9D%E6%9C%AA%E4%BA%A4%E5%85%A8%E6%AC%BE%E9%9A%94%E7%A6%BB%E4%BA%BA%E5%91%98%E5%85%A5%E4%BD%8F%23', '新时代');
INSERT INTO `weiboresou` VALUES ('30', '#央视评通化不该一封了之#', null, null, 'https://s.weibo.com//weibo?q=%23%E5%A4%AE%E8%A7%86%E8%AF%84%E9%80%9A%E5%8C%96%E4%B8%8D%E8%AF%A5%E4%B8%80%E5%B0%81%E4%BA%86%E4%B9%8B%23', '新时代');
INSERT INTO `weiboresou` VALUES ('31', '#河海大学清退125名博士生#', null, null, 'https://s.weibo.com//weibo?q=%23%E6%B2%B3%E6%B5%B7%E5%A4%A7%E5%AD%A6%E6%B8%85%E9%80%80125%E5%90%8D%E5%8D%9A%E5%A3%AB%E7%94%9F%23', '新时代');
INSERT INTO `weiboresou` VALUES ('32', '#人民日报对话井下写纸条的老大哥#', null, null, 'https://s.weibo.com//weibo?q=%23%E4%BA%BA%E6%B0%91%E6%97%A5%E6%8A%A5%E5%AF%B9%E8%AF%9D%E4%BA%95%E4%B8%8B%E5%86%99%E7%BA%B8%E6%9D%A1%E7%9A%84%E8%80%81%E5%A4%A7%E5%93%A5%23', '新时代');
INSERT INTO `weiboresou` VALUES ('33', '#陈薇院士春节前送祝福#', null, null, 'https://s.weibo.com//weibo?q=%23%E9%99%88%E8%96%87%E9%99%A2%E5%A3%AB%E6%98%A5%E8%8A%82%E5%89%8D%E9%80%81%E7%A5%9D%E7%A6%8F%23', '新时代');
INSERT INTO `weiboresou` VALUES ('34', '#英国成首个新冠病亡超10万的欧洲国家#', null, null, 'https://s.weibo.com//weibo?q=%23%E8%8B%B1%E5%9B%BD%E6%88%90%E9%A6%96%E4%B8%AA%E6%96%B0%E5%86%A0%E7%97%85%E4%BA%A1%E8%B6%8510%E4%B8%87%E7%9A%84%E6%AC%A7%E6%B4%B2%E5%9B%BD%E5%AE%B6%23', '新时代');
INSERT INTO `weiboresou` VALUES ('35', '#女子虐待亲生女儿3年获刑2年#', null, null, 'https://s.weibo.com//weibo?q=%23%E5%A5%B3%E5%AD%90%E8%99%90%E5%BE%85%E4%BA%B2%E7%94%9F%E5%A5%B3%E5%84%BF3%E5%B9%B4%E8%8E%B7%E5%88%912%E5%B9%B4%23', '新时代');
INSERT INTO `weiboresou` VALUES ('36', '#白岩松对话崔天凯#', null, null, 'https://s.weibo.com//weibo?q=%23%E7%99%BD%E5%B2%A9%E6%9D%BE%E5%AF%B9%E8%AF%9D%E5%B4%94%E5%A4%A9%E5%87%AF%23', '新时代');
INSERT INTO `weiboresou` VALUES ('37', '#杭州落户未满5年限购1套住房#', null, null, 'https://s.weibo.com//weibo?q=%23%E6%9D%AD%E5%B7%9E%E8%90%BD%E6%88%B7%E6%9C%AA%E6%BB%A15%E5%B9%B4%E9%99%90%E8%B4%AD1%E5%A5%97%E4%BD%8F%E6%88%BF%23', '新时代');
INSERT INTO `weiboresou` VALUES ('38', '#西藏冒险王家属发声质疑失踪事件#', null, null, 'https://s.weibo.com//weibo?q=%23%E8%A5%BF%E8%97%8F%E5%86%92%E9%99%A9%E7%8E%8B%E5%AE%B6%E5%B1%9E%E5%8F%91%E5%A3%B0%E8%B4%A8%E7%96%91%E5%A4%B1%E8%B8%AA%E4%BA%8B%E4%BB%B6%23', '新时代');
INSERT INTO `weiboresou` VALUES ('39', '#女子瞒报回国后确诊获刑一年缓刑一年#', null, null, 'https://s.weibo.com//weibo?q=%23%E5%A5%B3%E5%AD%90%E7%9E%92%E6%8A%A5%E5%9B%9E%E5%9B%BD%E5%90%8E%E7%A1%AE%E8%AF%8A%E8%8E%B7%E5%88%91%E4%B8%80%E5%B9%B4%E7%BC%93%E5%88%91%E4%B8%80%E5%B9%B4%23', '新时代');
INSERT INTO `weiboresou` VALUES ('40', '#女子骂社区书记草包被拘#', null, null, 'https://s.weibo.com//weibo?q=%23%E5%A5%B3%E5%AD%90%E9%AA%82%E7%A4%BE%E5%8C%BA%E4%B9%A6%E8%AE%B0%E8%8D%89%E5%8C%85%E8%A2%AB%E6%8B%98%23', '新时代');
INSERT INTO `weiboresou` VALUES ('41', '#敦煌阳关未发现林地大面积减少#', null, null, 'https://s.weibo.com//weibo?q=%23%E6%95%A6%E7%85%8C%E9%98%B3%E5%85%B3%E6%9C%AA%E5%8F%91%E7%8E%B0%E6%9E%97%E5%9C%B0%E5%A4%A7%E9%9D%A2%E7%A7%AF%E5%87%8F%E5%B0%91%23', '新时代');
INSERT INTO `weiboresou` VALUES ('42', '#核酸复阳者还会传染别人吗#', null, null, 'https://s.weibo.com//weibo?q=%23%E6%A0%B8%E9%85%B8%E5%A4%8D%E9%98%B3%E8%80%85%E8%BF%98%E4%BC%9A%E4%BC%A0%E6%9F%93%E5%88%AB%E4%BA%BA%E5%90%97%23', '新时代');
INSERT INTO `weiboresou` VALUES ('43', '#警方通报女子骂支书草包被拘#', null, null, 'https://s.weibo.com//weibo?q=%23%E8%AD%A6%E6%96%B9%E9%80%9A%E6%8A%A5%E5%A5%B3%E5%AD%90%E9%AA%82%E6%94%AF%E4%B9%A6%E8%8D%89%E5%8C%85%E8%A2%AB%E6%8B%98%23', '新时代');
INSERT INTO `weiboresou` VALUES ('44', '#获救矿工回忆爆炸瞬间人冲出去头盔破碎#', null, null, 'https://s.weibo.com//weibo?q=%23%E8%8E%B7%E6%95%91%E7%9F%BF%E5%B7%A5%E5%9B%9E%E5%BF%86%E7%88%86%E7%82%B8%E7%9E%AC%E9%97%B4%E4%BA%BA%E5%86%B2%E5%87%BA%E5%8E%BB%E5%A4%B4%E7%9B%94%E7%A0%B4%E7%A2%8E%23', '新时代');
INSERT INTO `weiboresou` VALUES ('45', '#英国累计新冠死亡病例超10万例#', null, null, 'https://s.weibo.com//weibo?q=%23%E8%8B%B1%E5%9B%BD%E7%B4%AF%E8%AE%A1%E6%96%B0%E5%86%A0%E6%AD%BB%E4%BA%A1%E7%97%85%E4%BE%8B%E8%B6%8510%E4%B8%87%E4%BE%8B%23', '新时代');
INSERT INTO `weiboresou` VALUES ('46', '#基金投资成年轻人社交工具#', null, null, 'https://s.weibo.com//weibo?q=%23%E5%9F%BA%E9%87%91%E6%8A%95%E8%B5%84%E6%88%90%E5%B9%B4%E8%BD%BB%E4%BA%BA%E7%A4%BE%E4%BA%A4%E5%B7%A5%E5%85%B7%23', '新时代');
INSERT INTO `weiboresou` VALUES ('47', '#NBA赛场用狗狗筛查新冠#', null, null, 'https://s.weibo.com//weibo?q=%23NBA%E8%B5%9B%E5%9C%BA%E7%94%A8%E7%8B%97%E7%8B%97%E7%AD%9B%E6%9F%A5%E6%96%B0%E5%86%A0%23', '新时代');
INSERT INTO `weiboresou` VALUES ('48', '#福奇年薪超美国总统#', null, null, 'https://s.weibo.com//weibo?q=%23%E7%A6%8F%E5%A5%87%E5%B9%B4%E8%96%AA%E8%B6%85%E7%BE%8E%E5%9B%BD%E6%80%BB%E7%BB%9F%23', '新时代');
INSERT INTO `weiboresou` VALUES ('49', '#湖南专家组驰援吉林抗疫#', null, null, 'https://s.weibo.com//weibo?q=%23%E6%B9%96%E5%8D%97%E4%B8%93%E5%AE%B6%E7%BB%84%E9%A9%B0%E6%8F%B4%E5%90%89%E6%9E%97%E6%8A%97%E7%96%AB%23', '新时代');

-- ----------------------------
-- Table structure for `year_movie_rank`
-- ----------------------------
DROP TABLE IF EXISTS `year_movie_rank`;
CREATE TABLE `year_movie_rank` (
  `rank_id` int(11) NOT NULL DEFAULT '0',
  `movie_name` varchar(255) NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `total_pf` int(11) DEFAULT NULL,
  `average_price` float DEFAULT NULL,
  `average_person` int(11) DEFAULT NULL,
  `area` varchar(255) DEFAULT NULL,
  `open_date` date DEFAULT NULL,
  `imag_url` varchar(255) DEFAULT NULL,
  `href_url` varchar(255) DEFAULT NULL,
  `rank_year` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of year_movie_rank
-- ----------------------------
