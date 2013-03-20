-- phpMyAdmin SQL Dump
-- version 3.5.3
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 20, 2013 at 02:35 PM
-- Server version: 5.5.29
-- PHP Version: 5.3.15

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `nightowl`
--

-- --------------------------------------------------------

--
-- Table structure for table `circles`
--

CREATE TABLE IF NOT EXISTS `circles` (
  `circle_id` int(11) NOT NULL,
  `circle_founder_id` int(11) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `last_updated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `member_number` int(11) NOT NULL DEFAULT '0',
  `circle_name` varchar(256) NOT NULL,
  `circle_description` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`circle_id`),
  KEY `circle_founder_id` (`circle_founder_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `circle_members`
--

CREATE TABLE IF NOT EXISTS `circle_members` (
  `circle_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY `circle_id` (`circle_id`),
  KEY `member_id` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE IF NOT EXISTS `cities` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `province_id` int(2) NOT NULL,
  `name` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=25 ;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `province_id`, `name`) VALUES
(1, 1, '不限'),
(2, 1, '合肥'),
(3, 1, '芜湖'),
(4, 1, '蚌蚨'),
(5, 1, '淮南'),
(6, 1, '马鞍山'),
(7, 1, '淮北'),
(8, 1, '铜陵'),
(9, 1, '安庆'),
(10, 1, '黄山'),
(11, 1, '浒州'),
(12, 1, '阜阳'),
(13, 1, '宿州'),
(14, 1, '巢湖'),
(15, 1, '六安'),
(16, 1, '毫州'),
(17, 1, '池州'),
(18, 1, '宣城'),
(19, 2, '不限'),
(20, 2, '东城区'),
(21, 2, '西城区'),
(22, 2, '崇文区'),
(23, 2, '宣武区'),
(24, 2, '朝阳区');

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE IF NOT EXISTS `events` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `events_types_id` int(11) unsigned NOT NULL,
  `event_date` datetime NOT NULL,
  `end_date` datetime DEFAULT '0000-00-00 00:00:00',
  `cost` int(11) unsigned NOT NULL DEFAULT '0',
  `theme` char(60) NOT NULL,
  `location` char(40) NOT NULL,
  `introduction` text NOT NULL,
  `participants_num` int(11) unsigned NOT NULL DEFAULT '0',
  `lat` float(10,6) NOT NULL,
  `lng` float(10,6) NOT NULL,
  `date_created` date NOT NULL,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=38 ;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `user_id`, `events_types_id`, `event_date`, `end_date`, `cost`, `theme`, `location`, `introduction`, `participants_num`, `lat`, `lng`, `date_created`, `date_updated`) VALUES
(31, 9, 8, '2014-05-01 04:00:00', '2014-01-01 00:00:00', 50, '2012第27届地坛春节庙会', '(北京)东城区安定门外大街', '地坛庙会始办于1985年，至今已成功举办了22届，一届胜似一届，以较高的艺术品位和鲜明的民族特色享誉中外，其胜景被誉为现代的《清明上河图》和中国的狂欢节。春节逛地坛庙会是京城老百姓沿袭多年的习俗。作为京城恢复最早的庙会，地坛春节文化庙会以地道民俗、传统民间特色闻名于京城。每届庙会都要吸引游客百万余人次。', 3, 39.959080, 116.408165, '2012-04-11', '2013-03-17 07:13:18'),
(32, 9, 5, '2014-03-05 04:00:00', '2014-02-08 00:00:00', 40, '人艺话剧《家》', '(北京)东城区王府井大街22号', '话剧《家》是曹禺根据巴金同名小说改编而成，曾被誉为从文学作品到戏剧剧本改编的典范。此次演出延续了去年为纪念曹禺诞辰百年所上演的四部作品，正好构成了北京人艺对曹禺经典代表作的回顾。《家》中的故事发生于“五四”前后，当时中国社会正处于一个风起云涌、激烈动荡的历史转折时期。背景是中国当时还很封闭的内地——四川成都。那里有一个官僚地主阶级的大家族——高公馆，公馆中除了老太爷，还有五房分支小说主要以长房中的三兄弟：觉新、觉民、觉慧的故事为主，以各房以及亲戚中的各种人物为纬，描绘出一幅大家族生活的画面，集中展现了封建大家族生活的典型形态，也真实地记录了一个封建大家族衰落、败坏以至最后崩溃的历史过程。继1984年蓝天野导演版的《家》之后，这部经典作品已经27年没有登上舞台了。此次重排本着尊重经典、再现大师风采的目标，以全新阵容再现辛亥革命之后的那段历史', 7, 39.921749, 116.410988, '2012-04-11', '2013-03-17 07:13:31'),
(33, 9, 5, '2014-07-19 04:00:00', '2014-04-17 00:00:00', 100, '电影《大闹天宫3D》', '中国北京市海淀区中关村南路46号 邮政编码: 100190', '电影《大闹天宫3D》将于2012年1月12日上映。该片由上影集团、上海美术电影制片厂出品、3D版《功夫熊猫1》原班团队打造。为“土地公”配音是陈佩斯，为“仙女”配音的是姚晨，而为“王母娘娘”的配音花落刘晓庆。陈道明、陈凯歌、张国立、冯小刚、陈佩斯、刘晓庆、姚晨等多位大腕纷纷献声。', 5, 39.980766, 116.319038, '2012-04-11', '2013-03-17 07:14:10'),
(34, 9, 2, '2014-06-21 04:00:00', '2014-02-07 00:00:00', 2000, '周四 热舞狂欢 Juicy酒吧', '朝阳公园西门', '活动内容：这里分静吧区和动吧区两部分，咱们22：00到了，先会有一个自我介绍和相互认识的环节，然后热舞。这里是越夜越HIGH的派对圣地，劲爆的HIPHOP音乐，随处流淌的灯光与魅影，充满创意的风趣PARTY，妖娆曼舞的颦笑……开始吧。。这里是Club Juicy！酒吧简介： JUICY酒吧位于朝阳公园西门，如果你发现一个不太起眼，甚至带着一种神秘感的门头，旅程便由此开开始。JUICY仅一年半却号称京城最新人气夜场，因为其地处北京第三使馆区，也成为众多使馆在京工作人员指定消遣场所，每到周三至周六，这里便是一个International Family.里面外国人很多。环境很不错，我喜欢里面的小蜡烛。喜欢里面幽暗的环境和越来越震撼的音乐。酒量好的可以试试长滩冰茶，酒量不太好的美眉可以试试草莓之吻~~   ', 1, 39.936642, 116.474739, '2012-04-11', '2013-03-17 07:13:40'),
(35, 9, 4, '2014-11-09 05:00:00', '2014-02-01 00:00:00', 300, '花开日本料理 四人同行一人免单', '北京市朝阳区建国路93号万达广场19号楼一层', '即日起到花开日本料理，消费198元/位的自助餐1份即可获得1颗星，活动结束日期前满3颗星即可获得198元/位自助餐免单一次', 4, 39.909069, 116.469681, '2012-04-14', '2013-03-17 07:13:43'),
(36, 9, 5, '2014-08-17 04:00:00', '2014-03-18 00:00:00', 200, '愚公移山音乐派对', '张自忠路3-2号段祺瑞执政府旧址西侧', '在90年代最大的舞曲组合中，你必须知道Leeroy Thornhill，这位近20年来最伟大的电子乐队成员之一。 离开了the Prodigy之后，开始了他自己创立的厂牌Flightcrank的DJ生涯，并创立了他独具特色的音乐风格，融合了Electrobreaks、old skool samples、hip hop、rock和electro Miami Bass，足以震撼舞池。', 1, 39.933586, 116.415733, '2012-04-14', '2013-03-17 07:13:46'),
(37, 2, 3, '2014-08-08 04:00:00', '2014-01-19 04:00:00', 1222, 'sakldjfasdf', '中国北京市海淀区中关村南路18号-20号 邮政编码: 100190', 'sadfasdfasdf', 0, 39.980862, 116.320206, '2012-08-13', '2013-03-17 07:13:49');

-- --------------------------------------------------------

--
-- Table structure for table `events_bk`
--

CREATE TABLE IF NOT EXISTS `events_bk` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `events_types_id` int(11) unsigned NOT NULL,
  `event_date` datetime NOT NULL,
  `end_date` datetime DEFAULT NULL,
  `cost` int(11) unsigned NOT NULL DEFAULT '0',
  `theme` char(60) NOT NULL,
  `location` char(40) NOT NULL,
  `introduction` text NOT NULL,
  `participants_num` int(11) unsigned NOT NULL DEFAULT '0',
  `lat` float(10,6) NOT NULL,
  `lng` float(10,6) NOT NULL,
  `date_created` date NOT NULL,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=36 ;

--
-- Dumping data for table `events_bk`
--

INSERT INTO `events_bk` (`id`, `user_id`, `events_types_id`, `event_date`, `end_date`, `cost`, `theme`, `location`, `introduction`, `participants_num`, `lat`, `lng`, `date_created`, `date_updated`) VALUES
(9, 1, 0, '2012-02-22 20:00:00', NULL, 0, '2012第27届地坛春节庙会', '(北京)东城区安定门外大街', '地坛庙会始办于1985年，至今已成功举办了22届，一届胜似一届，以较高的艺术品位和鲜明的民族特色享誉中外，其胜景被誉为现代的《清明上河图》和中国的狂欢节。春节逛地坛庙会是京城老百姓沿袭多年的习俗。作为京城恢复最早的庙会，地坛春节文化庙会以地道民俗、传统民间特色闻名于京城。每届庙会都要吸引游客百万余人次。', 0, 39.959023, 116.408020, '2012-01-17', '2012-02-04 14:29:10'),
(10, 1, 0, '2012-02-28 22:00:00', NULL, 40, '人艺话剧《家》', '(北京)东城区王府井大街22号', '话剧《家》是曹禺根据巴金同名小说改编而成，曾被誉为从文学作品到戏剧剧本改编的典范。此次演出延续了去年为纪念曹禺诞辰百年所上演的四部作品，正好构成了北京人艺对曹禺经典代表作的回顾。《家》中的故事发生于“五四”前后，当时中国社会正处于一个风起云涌、激烈动荡的历史转折时期。背景是中国当时还很封闭的内地——四川成都。那里有一个官僚地主阶级的大家族——高公馆，公馆中除了老太爷，还有五房分支小说主要以长房中的三兄弟：觉新、觉民、觉慧的故事为主，以各房以及亲戚中的各种人物为纬，描绘出一幅大家族生活的画面，集中展现了封建大家族生活的典型形态，也真实地记录了一个封建大家族衰落、败坏以至最后崩溃的历史过程。继1984年蓝天野导演版的《家》之后，这部经典作品已经27年没有登上舞台了。此次重排本着尊重经典、再现大师风采的目标，以全新阵容再现辛亥革命之后的那段历史', 0, 39.921749, 116.410988, '2012-01-17', '2012-02-04 14:18:59'),
(11, 1, 0, '2012-02-22 23:00:00', NULL, 120, '电影《大闹天宫3D》2012年1月12日上映', '中国北京市海淀区中关村南路46号 邮政编码: 100190', '电影《大闹天宫3D》将于2012年1月12日上映。该片由上影集团、上海美术电影制片厂出品、3D版《功夫熊猫1》原班团队打造。为“土地公”配音是陈佩斯，为“仙女”配音的是姚晨，而为“王母娘娘”的配音花落刘晓庆。陈道明、陈凯歌、张国立、冯小刚、陈佩斯、刘晓庆、姚晨等多位大腕纷纷献声。', 0, 39.980869, 116.318962, '2012-01-17', '2012-02-04 14:19:11'),
(12, 9, 0, '2012-02-27 19:00:00', NULL, 300, '周四 热舞狂欢 Juicy酒吧', ' 朝阳公园西门', '活动内容：这里分静吧区和动吧区两部分，咱们22：00到了，先会有一个自我介绍和相互认识的环节，然后热舞。这里是越夜越HIGH的派对圣地，劲爆的HIPHOP音乐，随处流淌的灯光与魅影，充满创意的风趣PARTY，妖娆曼舞的颦笑……开始吧。。这里是Club Juicy！酒吧简介： JUICY酒吧位于朝阳公园西门，如果你发现一个不太起眼，甚至带着一种神秘感的门头，旅程便由此开开始。JUICY仅一年半却号称京城最新人气夜场，因为其地处北京第三使馆区，也成为众多使馆在京工作人员指定消遣场所，每到周三至周六，这里便是一个International Family.里面外国人很多。环境很不错，我喜欢里面的小蜡烛。喜欢里面幽暗的环境和越来越震撼的音乐。酒量好的可以试试长滩冰茶，酒量不太好的美眉可以试试草莓之吻~~   ', 0, 39.936642, 116.474739, '2012-01-18', '2012-02-04 14:19:27'),
(13, 9, 0, '2012-03-21 17:00:00', NULL, 198, '花开日本料理 四人同行一人免单', '北京市朝阳区建国路93号万达广场19号楼一层', '即日起到花开日本料理，消费198元/位的自助餐1份即可获得1颗星，活动结束日期前满3颗星即可获得198元/位自助餐免单一次', 0, 39.909069, 116.469681, '2012-01-18', '2012-02-04 14:22:01'),
(14, 1, 0, '2012-03-15 20:00:00', NULL, 50, '中国爱乐乐团2011 — 2012音乐季', '中山公园音乐堂', '2012年2月11日 星期六 19:30 中山音乐堂交响音乐会卡米尔·圣-桑：《死之舞》，作品40号卡米尔·圣-桑：引子与回旋随想曲，作品28号帕布洛·德·萨拉萨蒂：《流浪者之歌》，作品20号曼努埃尔·德·法雅：《三角帽》第一组曲华金·罗德里戈：为吉他与乐队而作的《阿兰胡埃斯协奏曲》小提琴：陈倩莹吉他：杨雪霏指挥：夏小汤', 0, 39.911812, 116.394814, '2012-01-19', '2012-02-20 05:26:18'),
(17, 37, 0, '2012-03-18 01:00:00', NULL, 0, '新生摇滚力量', '中国北京市海淀区中关村南一街21号 邮政编码: 100190', '在这个消费的时代，潮流与我们无关。 Fuzzy Mood如是说，他们的音乐深受shoegaze, 歌特，仙音乐派等风格的影响，女主唱韩艾飘渺的唱腔，乐手们稳健而又充满创意的编配，既能让人听到My Bloody Valentine, Slowdive, Cocteau Twins以及其他早期4AD乐队的影子，同时也有他们自己的东西。', 0, 39.981533, 116.319839, '2012-02-09', '2012-02-20 05:26:29'),
(18, 37, 0, '2012-02-25 01:00:00', NULL, 100, '愚公移山音乐派对', '张自忠路3-2号段祺瑞执政府旧址西侧', '在90年代最大的舞曲组合中，你必须知道Leeroy Thornhill，这位近20年来最伟大的电子乐队成员之一。 离开了the Prodigy之后，开始了他自己创立的厂牌Flightcrank的DJ生涯，并创立了他独具特色的音乐风格，融合了Electrobreaks、old skool samples、hip hop、rock和electro Miami Bass，足以震撼舞池。', 0, 39.933586, 116.415733, '2012-02-09', '2012-02-09 13:52:01'),
(19, 37, 0, '2012-08-06 14:00:00', NULL, 0, '第四届北京市体育大会攀岩比赛', '金源新燕莎', '竞赛项目：难度赛：分为男子和女子青年组SALEWA学校户外知识及技能培训', 0, 39.949299, 116.463203, '2012-02-09', '2012-02-09 09:59:23'),
(20, 37, 0, '2012-05-29 13:00:00', NULL, 0, '“神华杯”北京桥牌大赛', '万嘉新兴体育俱乐部', '所有爱好桥牌的人士均可组队参加。报名费：第一阶段：每队人民币300元。第二阶段：每队人民币200元', 0, 39.884781, 116.464401, '2012-02-09', '2012-02-09 10:00:09'),
(21, 37, 0, '2012-03-30 14:00:00', NULL, 80, '《我的宇宙》“全即兴”跨界对话演出', '朝阳区酒仙桥路4号', '当人和生命的思考一层层褪去，褪到生灵们都相似的那一点，还有什么是在表达和传接的？ 2月18日，艺术家们将在悬浮着5000块不锈钢材质碎石片的展厅里起舞，演奏，歌唱，用不同的艺术语言，一同“全即兴”的去探讨和表达对这一命题的思索。科学和艺术，一个解释着外在宇宙，一个呈现着内心的宇宙。让我们置身于两者中间，和艺术家们一同发起对自己的宇宙的思考，感受，对话！', 0, 39.984497, 116.492065, '2012-02-09', '2012-02-09 10:02:03'),
(22, 37, 0, '2012-09-14 13:00:00', NULL, 680, '中国歌剧舞剧院大型原创歌舞诗剧《四美图》', '北京国家大剧院', '春江鱼语凝，秋关雁声寒，凤仪月垂泪，华清香已散…… 　　四美，四个美丽了华夏上千年，丰富了炎黄子孙无穷想象力的女子，为什么成了东方柔美的象征？这不仅仅是她们相貌出众，而更是因为她们不一样的传奇经历：她们的命运与国家的命运紧紧地联系了起来。美，不是静态的浓眉大眼和樱桃小嘴，美，是动态的选择和取舍。 　　四美，皆以“小我”放置在家国存亡的背景中，或致敌于难中，或救国于危时，个人情感，个人性命，都在乱世中灰飞烟灭。只留下那一丝牵挂与对家国的眷恋，温暖了无数的后人，让我们生发出无尽的联想。 　　借助美人，我们表达的是现代人的追问与思考。美是不是可以永恒？如果美不是永恒的，那我们更应该珍惜美，而不是去毁灭美。美的消失是不能抗拒的，我们所做的只能是珍惜。青春是美丽的，时光是美丽的，友爱是美丽的，信赖是美丽的……　　“起”于“柔美”，“承”于“壮美”，“转”为“凄美”，“合”为“华美”。玉刚是美的守望者，更是爱的守望者。没有这种守望，就难以呈现四种不同的美。而这守望者的情怀，是通过相互关联的五首现代诗完成的。　　音乐舞蹈作品表现的是美人之美，现代诗表现的是玉刚守望之美。两者交融，用屏幕和舞台、用影与形，表达出玉刚不同于别人的对于美的追问。', 0, 39.904213, 116.407410, '2012-02-09', '2012-02-09 14:03:30'),
(23, 37, 0, '2012-03-11 05:00:00', NULL, 0, '“幸福酵母”戏剧沙龙', '北三环中路20号', '幸福酵母 每个人都有一个关于幸福的梦想。有的人的幸福大大的，需要长途跋涉、开天辟地；有的人的幸福小小的，粗茶淡饭、家人安康即可。不管是何种幸福，沉浸其中的人总是最美的。幸福的味道从他们的言谈举止中散发出来，感染着我们。就好像面团里面添加了酵母，静静地膨胀，有暖暖地气息释放出来，轻轻地将你的心融化。我们坚信，幸福能够传递。幸福酵母工作室，将有共同的梦想与兴趣的人集合在一起，为大家组织有意义的文化活动。并在此过程中收集点点滴滴的幸福瞬间，通过视频、图片、文字，借助线下活动平台、互联网的社交网络将这些充满感染力与吸引力的“幸福酵母”传达给更多的人。', 0, 39.966335, 116.375954, '2012-02-09', '2012-02-20 05:26:45'),
(24, 37, 0, '2012-11-16 19:00:00', NULL, 28, '猫冬宾达喝免费咖啡看免费电影', '朝阳区工人体育场东路丙2号中国红街大厦3号楼109', '猫冬宾达咖啡三里屯店，温暖享受澳大利亚纯正咖啡。消费任意中杯及以上饮品，计满5杯即可获得牛角包或丹麦酥二选一；累计满10杯即送咖啡券一张（中杯任选）。周六提供免费电影，猫冬宾达，享受安逸周末！首次积星的用户还将获得星客杯一个。', 0, 39.928459, 116.450401, '2012-02-09', '2012-02-09 10:00:37'),
(25, 37, 0, '2012-08-16 15:00:00', NULL, 600, '北京渔阳滑雪场', '北京渔阳国际滑雪场', '北京渔阳国际度假村隶属于北京渔阳集团，坐落于平谷区东高村镇大旺务村东。距市区仅60公里，京平高速40分钟即可到达，交通便利，具有其独特的地理优势，即可吸纳京、津、冀三地游客。度假村于2005年12月28日正式开业，2006年被SOHU评为最佳品质滑雪场，2007年荣膺国家4A级旅游区，2009年被旅游局评为“最具旅游人气奖——最具人气的滑雪场”称号，2010年被北京市旅游协会评为“最受消费者喜爱的十大滑雪场”称号。是目前北京地区最大的集雪上运动、高尔夫休闲运动、生态园餐厅、住宿、会议、休闲、采摘于一体的综合滑雪旅游胜地。', 0, 40.080566, 117.146706, '2012-02-09', '2012-02-09 14:20:57'),
(26, 37, 0, '2012-11-12 17:00:00', NULL, 160, '翻糖艺术蛋糕DIY—将快乐进行到底', '朝阳区望京悠乐汇A座', '美忆艺术烘焙坊：美忆（sweet memory) 是一家期望用造型创意蛋糕带您重温美好回忆和打造美妙记忆的蛋糕工作室。正如我们的宗旨：A sweet cake for a sweet memory. 口感上我们致力于让它绵实丰盈甜美如初恋，外表上我们专注于它的独特个性及新奇的造型感。另外接受客户特性定制，让蛋糕代您说话，使其突破传统的食用功能，成为既美味又别致的礼物。', 0, 39.994080, 116.469162, '2012-02-09', '2012-02-09 10:05:35'),
(27, 37, 0, '2012-07-13 04:00:00', NULL, 100, '第五届香山草莓文化旅游节', '香山村', '活动简介：由于香山村的草莓种植由2011年的80棚增至115棚，加上今冬的天气好，草莓的成熟期提前，将有20万斤优质草莓成熟，等待游客的采摘品尝采摘园的草莓棚很多，园内还设有指示牌和引导，引导游客根据自己的喜好，采摘不同种类和口味的草莓。虽然采摘价格比在市场上买到的一般的草莓要贵，但是由于口感、种植环境好，御香园的草莓历年春节前常常处于脱销状态，并且只有在园内才买得到。', 0, 30.950010, 116.187622, '2012-02-09', '2012-02-09 10:09:02'),
(28, 37, 0, '2012-06-23 04:00:00', NULL, 20, '周六西直门K歌女10元男20元', '北京市海淀区高粱桥斜街19号', '足球经理“有诚来扰”之新年K歌 足球经理在网上已经组织1年的时间了，首先对参加经理活动的朋友表示诚志的感谢，感谢大家对经理活动的大力支持和肯定。周末组织大家出来交友K歌，目的就是让大家出来呼吸呼吸新年的气息、结交新朋友。女生10元，男生20元，k歌聚餐时间从下午16点到晚19点，下午15点40分大厅集合。包含3个小时自由欢唱+小吃2份+茶水1壶，不含餐。欢唱结束可以组织大家自愿就近聚餐聊天游戏，目的就是让大家相互了解。鼓励绅士，鼓励随缘！', 0, 39.946430, 116.332092, '2012-02-09', '2012-02-09 10:10:12'),
(29, 37, 0, '2012-04-13 04:00:00', NULL, 0, '北京希尔顿酒店第三届煎饼节趣味障碍赛', '北京希尔顿酒店', '2011年2月09日——快做好准备，在英国传统的煎饼星期二来参加北京希尔顿酒店第二届煎饼节趣味障碍赛，赢取抛饼达人奖杯吧！比赛介绍：成功报名的选手免费参加比赛（比赛仅限20人）观众免费入场并享用优惠的现场制作的煎饼及冷热饮 免费入场在颐达吧举办庆功会，整晚饮料半价！', 0, 39.904213, 116.407410, '2012-02-09', '2012-02-09 10:19:11'),
(30, 37, 0, '2012-03-18 05:00:00', NULL, 80, '情人节期间DIY蛋糕、饼干、巧克力优惠活动', '海淀区学清路城华园小区一号', '情人节相传节日命名源于19世纪末，古罗马青年基督教传教士Valentine冒险传教时被捕入狱。他的英勇行为感动了老狱吏及他一名双目失明的女儿，从而获得他们悉心照顾。面对行刑前，Valentine写信给失明女示爱。处死当天，失明女在他墓前种植一棵开红花的杏树寄托情思，这天就是2月14日。因此“情人节”定于每年的2月14日，是西方的传统节日之一。在这一天，有些人会赠送礼物给情人或心仪的人，例如会送巧克力、贺卡和花等，用以表达爱意或友好。', 0, 40.011547, 116.352455, '2012-02-09', '2012-02-20 05:26:57'),
(34, 9, 8, '2012-06-08 04:00:00', NULL, 80, '十二星座系列话剧之《双鱼座》', '北京枫蓝国际小剧场', '枫蓝国际小剧场枫蓝国际小剧场枫蓝国际小剧场枫蓝国际小剧场枫蓝国际小剧场', 0, 39.904213, 116.407410, '2012-03-10', '2012-03-11 04:13:21'),
(35, 2, 4, '2012-03-25 22:00:00', '2012-03-25 23:00:00', 100, 'event test', '中国北京市西城区大称钩胡同13号', 'testing testing', 0, 39.910843, 116.386162, '2012-03-24', '2012-03-24 11:46:40');

-- --------------------------------------------------------

--
-- Table structure for table `events_images`
--

CREATE TABLE IF NOT EXISTS `events_images` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `event_id` int(11) unsigned NOT NULL,
  `image_file_name` varchar(255) DEFAULT NULL,
  `image_content_type` varchar(255) DEFAULT NULL,
  `image_file_size` int(11) unsigned NOT NULL,
  `image_updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=36 ;

--
-- Dumping data for table `events_images`
--

INSERT INTO `events_images` (`id`, `event_id`, `image_file_name`, `image_content_type`, `image_file_size`, `image_updated_at`) VALUES
(29, 31, '29adc1093ea77950d45583be674702dd441.jpg', 'image/jpeg', 28121, '2012-04-11 11:44:05'),
(30, 32, '86a7710f1478728a1630d8ee6a8552c3cc8.jpg', 'image/jpeg', 62928, '2012-04-11 11:45:17'),
(31, 33, 'b4ac210ecefe086e9bfb5ecdd6c89b184d5.jpg', 'image/jpeg', 31698, '2012-04-11 12:01:24'),
(32, 34, '32aa310868ccd79bb9463c729b9265974a0.jpg', 'image/jpeg', 27666, '2012-04-11 12:02:29'),
(33, 35, 'a9aee10c3fd42da20cc8f99abd62eb72fc5.jpg', 'image/jpeg', 87795, '2012-04-14 10:43:57'),
(34, 36, '70a5b10f67ca9d901885c90b402a0f47020.jpg', 'image/jpeg', 42583, '2012-04-14 10:45:25'),
(35, 37, 'original_5xjK_4b4400004c301213.jpg', 'image/jpeg', 114967, '2012-08-13 07:22:14');

-- --------------------------------------------------------

--
-- Table structure for table `events_reviews`
--

CREATE TABLE IF NOT EXISTS `events_reviews` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `event_id` int(11) unsigned NOT NULL,
  `content` text NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `events_tags`
--

CREATE TABLE IF NOT EXISTS `events_tags` (
  `event_id` int(11) DEFAULT NULL,
  `tag_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `events_tags`
--

INSERT INTO `events_tags` (`event_id`, `tag_id`) VALUES
(31, 8),
(32, 9),
(32, 17),
(32, 18),
(33, 10),
(34, 12),
(35, 14),
(35, 15),
(36, 16),
(36, 17);

-- --------------------------------------------------------

--
-- Table structure for table `events_types`
--

CREATE TABLE IF NOT EXISTS `events_types` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `types` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `events_types`
--

INSERT INTO `events_types` (`id`, `types`) VALUES
(1, '户外旅游'),
(2, '夜店派对'),
(3, '音乐演出'),
(4, '吃喝玩乐'),
(5, '电影话剧'),
(6, '戏曲曲艺'),
(7, '艺术展览'),
(8, '庙会集市'),
(9, '运动健身'),
(10, '其它活动');

-- --------------------------------------------------------

--
-- Table structure for table `events_users`
--

CREATE TABLE IF NOT EXISTS `events_users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `event_id` int(11) unsigned NOT NULL,
  `user_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=60 ;

--
-- Dumping data for table `events_users`
--

INSERT INTO `events_users` (`id`, `event_id`, `user_id`) VALUES
(30, 32, 9),
(29, 31, 9),
(31, 33, 9),
(57, 32, 8),
(51, 36, 8),
(56, 34, 8),
(59, 33, 42);

-- --------------------------------------------------------

--
-- Table structure for table `friends`
--

CREATE TABLE IF NOT EXISTS `friends` (
  `friend1_id` int(11) NOT NULL,
  `friend2_id` int(11) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY `friend1_id` (`friend1_id`),
  KEY `friend2_id` (`friend2_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `friends`
--

INSERT INTO `friends` (`friend1_id`, `friend2_id`, `date_created`) VALUES
(8, 4, '2012-01-19 23:23:40'),
(8, 5, '2012-01-20 02:34:03'),
(1, 8, '2012-01-20 03:39:44'),
(1, 2, '2012-01-24 01:29:59'),
(8, 9, '2012-01-24 05:05:57'),
(34, 9, '2012-01-28 16:18:45'),
(34, 2, '2012-01-28 16:43:37'),
(8, 34, '2012-01-28 16:48:37'),
(8, 2, '2012-01-28 16:51:08'),
(2, 9, '2012-01-28 16:51:23');

-- --------------------------------------------------------

--
-- Table structure for table `friends_black_list`
--

CREATE TABLE IF NOT EXISTS `friends_black_list` (
  `user_id` int(11) NOT NULL,
  `blocked_user_id` int(11) NOT NULL,
  `date_blocked` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY `user_id` (`user_id`),
  KEY `blocked_user_id` (`blocked_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `friends_pending_list`
--

CREATE TABLE IF NOT EXISTS `friends_pending_list` (
  `requestor_user_id` int(11) NOT NULL,
  `acceptor_user_id` int(11) NOT NULL,
  `date_requested` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `message` varchar(256) NOT NULL,
  KEY `requestor_user_id` (`requestor_user_id`),
  KEY `acceptor_user_id` (`acceptor_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `friends_pending_list`
--

INSERT INTO `friends_pending_list` (`requestor_user_id`, `acceptor_user_id`, `date_requested`, `message`) VALUES
(9, 30, '2012-01-21 22:12:20', ''),
(9, 4, '2012-04-21 04:29:49', '');

-- --------------------------------------------------------

--
-- Table structure for table `private_messages`
--

CREATE TABLE IF NOT EXISTS `private_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subject` varchar(256) DEFAULT NULL,
  `body` text NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `private_message_status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `private_messages`
--

INSERT INTO `private_messages` (`id`, `subject`, `body`, `date_created`, `private_message_status`) VALUES
(3, '12', 'ffff', '2012-03-31 22:06:06', 0),
(4, '111', '333', '2012-03-31 22:08:25', 0),
(5, 'fa', 'fa', '2012-04-01 03:32:46', 0),
(6, 'new message', 'you can see it', '2012-04-02 00:35:10', 0);

-- --------------------------------------------------------

--
-- Table structure for table `private_message_inbox`
--

CREATE TABLE IF NOT EXISTS `private_message_inbox` (
  `user_id` int(11) NOT NULL,
  `sender_id` int(11) NOT NULL,
  `private_message_id` int(1) NOT NULL,
  KEY `user_id` (`user_id`),
  KEY `sender_id` (`sender_id`),
  KEY `private_message_id` (`private_message_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `private_message_inbox`
--

INSERT INTO `private_message_inbox` (`user_id`, `sender_id`, `private_message_id`) VALUES
(8, 34, 3),
(222, 8, 4),
(1000, 8, 5),
(9, 8, 6);

-- --------------------------------------------------------

--
-- Table structure for table `private_message_outbox`
--

CREATE TABLE IF NOT EXISTS `private_message_outbox` (
  `user_id` int(11) NOT NULL,
  `recipient_id` int(11) NOT NULL,
  `private_message_id` int(1) NOT NULL,
  KEY `user_id` (`user_id`),
  KEY `recipient_id` (`recipient_id`),
  KEY `private_message_id` (`private_message_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `private_message_outbox`
--

INSERT INTO `private_message_outbox` (`user_id`, `recipient_id`, `private_message_id`) VALUES
(8, 222, 4),
(8, 1000, 5),
(8, 9, 6);

-- --------------------------------------------------------

--
-- Table structure for table `profiles`
--

CREATE TABLE IF NOT EXISTS `profiles` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `city` varchar(32) DEFAULT NULL,
  `province` varchar(32) DEFAULT NULL,
  `province_id` int(2) unsigned DEFAULT NULL,
  `city_id` int(11) unsigned DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `cellphone` varchar(32) DEFAULT NULL,
  `qq` varchar(11) DEFAULT NULL,
  `msn` varchar(32) DEFAULT NULL,
  `gender` char(1) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `image_file_name` varchar(255) DEFAULT NULL,
  `image_content_type` varchar(255) DEFAULT NULL,
  `image_file_size` int(11) unsigned DEFAULT NULL,
  `image_updated_at` datetime DEFAULT NULL,
  `last_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `register_ip` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=17 ;

--
-- Dumping data for table `profiles`
--

INSERT INTO `profiles` (`id`, `user_id`, `city`, `province`, `province_id`, `city_id`, `name`, `cellphone`, `qq`, `msn`, `gender`, `birthday`, `image_file_name`, `image_content_type`, `image_file_size`, `image_updated_at`, `last_updated`, `register_ip`) VALUES
(12, 9, '多伦多', '安达略', 1, 1, '卢华', '123123131231', '1231231231', '12313@hotmail.com', 'm', '2000-01-02', 'b4ac210ecefe086e9bfb5ecdd6c89b184d5.jpg', 'image/jpeg', 31698, '2012-04-20 01:25:58', '2012-04-21 04:03:03', NULL),
(13, 2, '太原', '安大略', 0, 0, '吕超', '6479813489', '258222572', 'chao.cn@hotmail.com', 'm', '1988-07-04', 'original_s8xC_441400013d35125f.jpg', 'image/jpeg', 29228, '2012-04-16 00:49:55', '2012-05-01 19:11:56', NULL),
(14, 8, 'hamilton.cc', 'jiangsu', 0, 0, '', '1234314', '234324', 'fdsaf@hotmial', 'm', '1987-07-31', 'haha.jpg', 'image/jpeg', 7946, '2012-03-10 23:24:52', '2012-03-10 23:24:49', NULL),
(15, 1, '', '', 0, 0, '', '', '', '', '', NULL, 'test1.jpg', 'image/jpeg', 24813, '2012-03-14 04:48:14', '2012-03-14 04:48:13', NULL),
(16, 42, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-03-17 07:10:06', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `provinces`
--

CREATE TABLE IF NOT EXISTS `provinces` (
  `id` int(2) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=36 ;

--
-- Dumping data for table `provinces`
--

INSERT INTO `provinces` (`id`, `name`) VALUES
(1, '安徽'),
(2, '北京'),
(3, '重庆'),
(4, '福建'),
(5, '甘肃'),
(6, '广东'),
(7, '广西'),
(8, '贵州'),
(9, '海南'),
(10, '河北'),
(11, '黑龙江'),
(12, '河南'),
(13, '湖北'),
(14, '湖南'),
(15, '内蒙古'),
(16, '江苏'),
(17, '江西'),
(18, '吉林'),
(19, '辽宁'),
(20, '宁夏'),
(21, '青海'),
(22, '山西'),
(23, '山东'),
(24, '上海'),
(25, '四川'),
(26, '天津'),
(27, '西藏'),
(28, '新疆'),
(29, '云南'),
(30, '浙江'),
(31, '陕西'),
(32, '台湾'),
(33, '香港'),
(34, '澳门'),
(35, '其它');

-- --------------------------------------------------------

--
-- Table structure for table `replies`
--

CREATE TABLE IF NOT EXISTS `replies` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `review_id` int(11) unsigned NOT NULL,
  `user_id` int(11) unsigned NOT NULL,
  `content` text NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE IF NOT EXISTS `reviews` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `initiator_id` int(11) unsigned NOT NULL,
  `review_type` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `events_id` int(11) unsigned NOT NULL DEFAULT '0',
  `content` text NOT NULL,
  `image_file_name` varchar(255) DEFAULT NULL,
  `image_content_type` varchar(255) DEFAULT NULL,
  `image_file_size` int(11) unsigned DEFAULT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `initiator_id` (`initiator_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=80 ;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `initiator_id`, `review_type`, `events_id`, `content`, `image_file_name`, `image_content_type`, `image_file_size`, `date_created`) VALUES
(2, 9, 0, 0, 'ahhssahdfasdfd', NULL, NULL, NULL, '2012-04-14 17:12:24'),
(71, 9, 0, 0, '123123123123123', '86a7710f1478728a1630d8ee6a8552c3cc8.jpg', 'image/jpeg', 62928, '2012-04-17 02:36:06'),
(72, 2, 0, 0, 'asdfasdfasdf\r\n', NULL, NULL, NULL, '2012-08-13 03:09:21'),
(73, 2, 0, 0, 'asdfasfgagfasdfasd', NULL, NULL, NULL, '2012-08-13 03:09:25'),
(75, 2, 0, 0, '阿苏的发送的发送的发送地方', NULL, NULL, NULL, '2012-08-13 03:09:53'),
(77, 2, 0, 0, '这是你没', 'original_BEJi_4bda00004cde1261.jpg', 'image/jpeg', 157378, '2012-08-13 03:17:14'),
(78, 2, 0, 0, 'asdfasdf', NULL, NULL, NULL, '2012-08-13 03:17:31'),
(79, 2, 2, 37, 'sakldjfasdf 中国北京市海淀区中关村南路18号-20号 邮政编码: 100190', NULL, NULL, NULL, '2012-08-13 03:22:15');

-- --------------------------------------------------------

--
-- Table structure for table `reviews_users`
--

CREATE TABLE IF NOT EXISTS `reviews_users` (
  `review_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `reviews_users`
--

INSERT INTO `reviews_users` (`review_id`, `user_id`) VALUES
(173, 1),
(173, 30),
(174, 1),
(174, 2),
(175, 1),
(175, 2),
(175, 9),
(175, 30),
(177, 30),
(178, 1),
(178, 30),
(190, 1),
(190, 30),
(191, 1),
(191, 30),
(192, 1),
(200, 1),
(200, 30),
(201, 30),
(202, 30),
(203, 1),
(208, 9),
(209, 9),
(210, 9),
(212, 9),
(213, 1),
(214, 2),
(216, 2),
(217, 1),
(217, 2),
(217, 9),
(221, 1),
(221, 9),
(221, 10),
(221, 30),
(222, 1),
(222, 5),
(223, 1),
(223, 10),
(224, 4),
(224, 34),
(225, 30),
(226, 30),
(227, 30),
(229, 30),
(231, 30),
(233, 30),
(236, 30),
(237, 30),
(238, 1),
(238, 5),
(238, 30),
(239, 1),
(239, 30),
(240, 9),
(241, 8),
(241, 9),
(247, 2),
(246, 8);

-- --------------------------------------------------------

--
-- Table structure for table `schema_migrations`
--

CREATE TABLE IF NOT EXISTS `schema_migrations` (
  `version` varchar(255) NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `schema_migrations`
--

INSERT INTO `schema_migrations` (`version`) VALUES
('20120107233748'),
('20120107233820'),
('20120208030308'),
('20120304062857'),
('20120304072417');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE IF NOT EXISTS `sessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `session_id` varchar(255) NOT NULL,
  `data` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_sessions_on_session_id` (`session_id`),
  KEY `index_sessions_on_updated_at` (`updated_at`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=515 ;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `session_id`, `data`, `created_at`, `updated_at`) VALUES
(1, 'e373deaac41c83c67e4755fbf964816c', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFic3puYkZwUHE5RGM4ZVhmRXI4\nM0NrMm84cWRvL2s0cjhLbUh4TGsvaVJVPQY7AEZJIgx1c2VyX2lkBjsARmkG\n', '2012-01-07 23:40:12', '2012-01-07 23:40:44'),
(2, '6c43fa554e143fb72aea72691a9b6003', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFLVFJtODV4R21TbTExWUhxRzdG\nVncxZW1Od0NzMlVKYXU4YjhCL1NlYmJFPQY7AEZJIgx1c2VyX2lkBjsARmkG\n', '2012-01-08 02:35:15', '2012-01-08 02:35:24'),
(3, '33db30759c82ff1971e8109b1857d0ea', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFrQTltaDRpNWhUS0VpMXQ4UDZS\naHBIY0ZtQ1RrempNSWRIRXJrYkdTRnRzPQY7AEZJIgx1c2VyX2lkBjsARmkH\n', '2012-01-08 02:45:01', '2012-01-08 02:46:15'),
(4, '0b6b59b72ea7aa2826c90720a0b47190', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFWVlpOWkFlZ0c3WGRoSlZYU2ZR\neVlJU0liVTRhQ3hBN3RoVVhuRmZqZ2hBPQY7AEZJIgx1c2VyX2lkBjsARmkG\n', '2012-01-08 02:54:32', '2012-01-08 02:57:20'),
(5, '97c4cf289b9a15e23684d8eb9cb1eaf7', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFkV01hOGQ3MGhMZ1g1Vk1MeTRp\nRU1zalAzU1B0amtrcGRSRTdKN2Y1U0hVPQY7AEZJIgx1c2VyX2lkBjsARmkG\n', '2012-01-08 03:11:46', '2012-01-08 03:11:54'),
(7, '97031e224965818a78d22ec05d32b875', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFVakozL09RZWVJd2dlQnV5T2pI\nOUgxa1M1U0hzRi8yVlgrKzRpUHYzVWxBPQY7AEZJIgx1c2VyX2lkBjsARmkI\n', '2012-01-08 03:30:36', '2012-01-08 03:30:56'),
(8, '0777382183030308c2317ff99d6e52c7', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjEvQ0RVQThucndCakRubGs5MllJ\nZ0N2bmZFK1lXZzg4OWJkTkQrY1VTckRJPQY7AEZJIgx1c2VyX2lkBjsARmkH\n', '2012-01-08 03:37:42', '2012-01-08 03:40:13'),
(9, '7bb6f54f1dd85721c307bc917b84b857', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFWYk8wSUJKY2hpcllGMlBsZTE4\nRVlqTDA1MFNQbTdQZTZocVAzbGZiWlJvPQY7AEZJIgx1c2VyX2lkBjsARmkG\n', '2012-01-09 00:48:35', '2012-01-09 00:48:47'),
(10, '5f1d8eac366d20ba1e881f1c2f9485c0', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFlc2prb2FtTXFTUDM2cEd4QytO\nU01pM0Q3cWZrVU5zV1FhcFlQZk5YM1RRPQY7AEZJIgx1c2VyX2lkBjsARmkG\n', '2012-01-09 04:27:32', '2012-01-09 04:27:42'),
(11, '19c5d251762101c037d750f17a2e375b', 'BAh7BkkiEF9jc3JmX3Rva2VuBjoGRUZJIjF5NFQ0T2FkNnVCUHlqNHA0eXlL\nMDRuWGQvM0hoK01xVlM2L2phaTMzeExJPQY7AEY=\n', '2012-01-09 04:29:35', '2012-01-09 04:29:35'),
(12, '9892fe0d8a36d2a164a79cf87ed44c3d', 'BAh7BkkiEF9jc3JmX3Rva2VuBjoGRUZJIjFKV051M0pYMXgxSS9EVVdaVC9C\nVllYaXVWY05rWTA3R1BjUkRhZVJDdllvPQY7AEY=\n', '2012-01-09 04:38:32', '2012-01-09 04:44:24'),
(13, '4d22eefbd33090a8c5bad0b3464fad45', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjErZGNXeU4zMEpqN3c3U1NTUXFV\nQXZhNDlzaHZTbXBlRlBYd2Rrb2F2ZVJZPQY7AEZJIgx1c2VyX2lkBjsARmkL\n', '2012-01-09 05:17:08', '2012-01-09 06:27:07'),
(14, 'e3d85c4638448cce2c9378c84f552bad', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjExMlZSYTNXdHhTVzl1aHR0NkVC\nc2lHMDg5aWRvYWtWWUNWbFhISnBwQk5jPQY7AEZJIgx1c2VyX2lkBjsARmkG\n', '2012-01-09 06:32:05', '2012-01-09 06:32:17'),
(15, 'b31814e120e9f8d498f567a2e43af5c1', 'BAh7BkkiEF9jc3JmX3Rva2VuBjoGRUZJIjE0dkplT3ZFeFJKdCtPUU9KRWI3\nOHJKZ0prenM2ZzVkU0RDYmRBcjRnVmY0PQY7AEY=\n', '2012-01-09 06:34:01', '2012-01-09 06:34:01'),
(16, '3d628b2c74686dd5783e362679304363', 'BAh7BkkiEF9jc3JmX3Rva2VuBjoGRUZJIjFwZVc2dVlhOG5DY09zUWNNbjhU\nVS9OYkx3SjRFS01TOGxiTXNNcTQ4U3VFPQY7AEY=\n', '2012-01-09 07:36:39', '2012-01-09 07:36:39'),
(17, '66b891ec022e26284305496fdf399f5b', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFTcDM5Z01TL0NaV3BjeWt5cDFj\nQVpia1ZkQ2VzdWVhakFIdmFaMFA4cTRrPQY7AEZJIgx1c2VyX2lkBjsARmkH\n', '2012-01-09 22:38:03', '2012-01-09 22:38:18'),
(18, '4e4b4c9d8a9b89388f36775f61ced73e', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFGQTJQM3QrNkhlM0owN1I0c1BN\nTy9BUkw5UmpxQmd3L2E5dC81R016VzJ3PQY7AEZJIgx1c2VyX2lkBjsARmkG\n', '2012-01-10 02:14:48', '2012-01-10 02:14:58'),
(19, '8dc2af2e80cd98c682c94415b849d21e', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFDWUNmMmhIR2ttVzByZExLMmhO\nZ0Q3NUR1UjgwaXQxMHRYN0g2QzhZcklBPQY7AEZJIgx1c2VyX2lkBjsARmkL\n', '2012-01-10 09:37:23', '2012-01-10 09:37:45'),
(20, '017c62b7f984c657314a07b160f796c4', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFqTWRaOExLbkZpV0cwbG9xQzFu\naVBtYXRiSmZQcVpyUlA4d0VLQTl4eGhJPQY7AEZJIgx1c2VyX2lkBjsARmkG\n', '2012-01-10 20:32:24', '2012-01-10 20:32:42'),
(21, 'ed9e92d4b9bd5f8b02076a10751b475e', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjE4Uk1VdDc2QjdmQXZoeEFVZEYz\nRU1tUjdKbFRFUUlyY05QT3FseTFOZWZVPQY7AEZJIgx1c2VyX2lkBjsARmkG\n', '2012-01-11 00:41:47', '2012-01-11 00:41:59'),
(22, '70a51e26743893c1c5fdf7a74e2189f1', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFBWVlvL01lRWhaOGZxMk03bE5U\nMjV4RjVIb3orTFhDd0F6WkYyWUJrZ0dzPQY7AEZJIgx1c2VyX2lkBjsARmkH\n', '2012-01-11 19:53:42', '2012-01-11 19:53:53'),
(23, 'e3edaaeaaa25a15a49b201bc2bff5331', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFkN3lHU3hlQnpOcTljY3lhYW5F\nRlgyTTBsTXhpUGdqNFR4bkIrU05SZ2JjPQY7AEZJIgx1c2VyX2lkBjsARmkG\n', '2012-01-11 20:03:22', '2012-01-11 21:35:53'),
(24, 'b3cd515c879017f3ce84023a78802129', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFUODNZVEs1KzFJWkZvWTN3TmVR\nbW5yOG03RlpCeFV5am5YdDlCUFY1elZRPQY7AEZJIgx1c2VyX2lkBjsARmkL\n', '2012-01-11 22:22:29', '2012-01-11 22:22:45'),
(25, '171343ca7f3b38fb723374121f663f24', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjEwNEI4cUx2QkpQN0hWbFZsMlJK\nZzBrdWJVNWFIeFNMcXUyM0J2TXFNTmhBPQY7AEZJIgx1c2VyX2lkBjsARmkL\n', '2012-01-12 05:52:04', '2012-01-12 05:52:11'),
(26, 'cfae27a67f5d2d2bd2f99ff856dab3f6', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFaUDBoaWpMaHQxdnBlV2s1NmZy\nM3lTNXhYNTd5N3VRTnJqdlVDZDdWN2FnPQY7AEZJIgx1c2VyX2lkBjsARmkL\n', '2012-01-12 19:09:52', '2012-01-12 19:12:14'),
(27, '1a6fbcedeedae032685fef9ea110b9b3', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjE2WWJLVUpicWZKU3BlTHpDcVZn\nUEh4UW5FWnZUK01Zb01TeGtEYVMvTUs0PQY7AEZJIgx1c2VyX2lkBjsARmkN\n', '2012-01-12 20:04:31', '2012-01-12 20:06:42'),
(31, '14c253077d6d28d3971b887ae956ef35', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFTQ2IxM0hrdzIvSU1wV0xrdER2\nWnhoWEZHNzg4eGhxOHA1SHFueFZKbjhBPQY7AEZJIgx1c2VyX2lkBjsARmkN\n', '2012-01-13 02:39:36', '2012-01-13 02:39:52'),
(32, '232e991142f9dab2775c4883f82d0df1', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjF2UngzTDRPbVFDdFJOZFZreWZS\nSXZ4SlhjWE5GQnNZMFBNU1hjSjRWTnRvPQY7AEZJIgx1c2VyX2lkBjsARmkO\n', '2012-01-13 03:17:02', '2012-01-13 03:48:19'),
(33, '44b95f9b2a7fd7f27a6f9e20b4d56555', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjE3dnlLVG12S0wvbDdKN3JJRFps\nSXJXemNZNVBXRUpMMjNXeGJaYlQ0UlZ3PQY7AEZJIgx1c2VyX2lkBjsARmkG\n', '2012-01-13 04:34:58', '2012-01-13 04:35:23'),
(34, 'e447169e42381fb1ab06ece1cce17abd', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFONjZqcmFNQStZQnJKME9uV1NY\nVUFCZGtzOFVFV3owbXgwcDcxWmZ0SENVPQY7AEZJIgx1c2VyX2lkBjsARmkP\n', '2012-01-13 05:02:45', '2012-01-13 05:04:38'),
(35, '7b75e2f81abb6e81c12358e313d9fc2b', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjEzZTVWaWtObGQwMk1CVXVRbW10\nUjVFenRYczAwS1ladnZRcXM3eXJTcVk0PQY7AEZJIgx1c2VyX2lkBjsARmkQ\n', '2012-01-13 05:08:45', '2012-01-13 05:09:32'),
(36, '00ac0f0cde3eea6755c4a26dda303350', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjExcWJBa3U3c2RuZHVLNjQxY00y\nd0F0YzlvaUZqamg2TE9yUjJOcnVUYnlNPQY7AEZJIgx1c2VyX2lkBjsARmkN\n', '2012-01-14 01:23:14', '2012-01-14 01:23:23'),
(37, '3db1f07dc01358a5fdbe38dbc753efb6', 'BAh7BkkiEF9jc3JmX3Rva2VuBjoGRUZJIjFwNllHWnNNUGN0Qk1UNVVUT3ZC\nQmp4Q3dLMHJWV2k2SlNwWmc3NVJxRS9JPQY7AEY=\n', '2012-01-14 01:46:45', '2012-01-14 01:46:45'),
(39, '314a412f59f8c8d41a6ac136cffb40bb', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFENGNERXc5MnlwYjZKdFIzanNW\nTWdRWVZPckFGY0JkM2ZuM0d2Y3BlV2tVPQY7AEZJIgx1c2VyX2lkBjsARmkO\n', '2012-01-14 01:56:10', '2012-01-14 01:56:42'),
(40, 'ff20d1dce4fe2753ce22d64869e77632', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFBSFV4OGtQanljUDdCWjJXVzE1\nTllCV2RZZTRaNFdrUGdWeUhkUytVYW1zPQY7AEZJIgx1c2VyX2lkBjsARmkH\n', '2012-01-14 17:52:50', '2012-01-14 17:57:14'),
(41, '4d97dbe0ee5b937d984bb60304681ff7', 'BAh7AA==\n', '2012-01-15 00:10:25', '2012-01-15 00:10:25'),
(42, '9c74f0f5dfe295c8f687a115cfd5fa37', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFmMVloOXRudzRmUDhJdUkvbnB4\nT0QvYWo3TEkyQU0wMHNjS1VkZk5zNFdvPQY7AEZJIgx1c2VyX2lkBjsARmkG\n', '2012-01-15 00:24:01', '2012-01-16 04:44:26'),
(43, '7e33794214d0fe0210c0e35a8ede9953', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFKZzJKV3lGRzBvY0NnNEpiazM4\nT00xSUVCcjJqTjFXVm5XN00zNld6TGhjPQY7AEZJIgx1c2VyX2lkBjsARmkG\n', '2012-01-16 05:22:36', '2012-01-16 05:22:52'),
(44, 'f125112f23d08117f2fa704957f7ec8f', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFwV2NKME9UTEpqMGMvRktyTDZq\nN3hSVnBmMHgwd2tseVM4a3dTK2pHR3B3PQY7AEZJIgx1c2VyX2lkBjsARmkG\n', '2012-01-16 20:22:58', '2012-01-16 20:23:05'),
(45, 'f1c70139174e216fac9e485280a581e1', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFCdjk5eEN6REtYTGNZMzVGK1o5\nY0ppcWpGY3lYWGk2c1JONTd0RENUU3lFPQY7AEZJIgx1c2VyX2lkBjsARmkG\n', '2012-01-17 00:31:42', '2012-01-17 00:31:53'),
(47, '48fcb5149b398e7dbc4360e2573932d1', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFrOGFiamhxR2d5WFhkeXVaNXM2\nMzJOMktPU1BqUFJCU3ZpTUhvOXNUYVNjPQY7AEZJIgx1c2VyX2lkBjsARmkN\n', '2012-01-17 16:04:08', '2012-01-17 16:04:20'),
(48, '429f63d1ab734519ff7cad3b87d3d467', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFkQTBzVXpaRjN2YzB4VXMvbWlG\nQVM2NU1tZlh5MXluZi9ScmtFSDlxU3QwPQY7AEZJIgx1c2VyX2lkBjsARmkH\n', '2012-01-17 16:56:08', '2012-01-17 16:56:17'),
(49, '956088661db6c30dfe4240ebd298b126', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFzT3puZ0dUL1YwNTJDaVpFUUUv\nZWJUMFllZ3ZqcElReXIyWmM2YjY0b2NrPQY7AEZJIgx1c2VyX2lkBjsARmkH\n', '2012-01-17 17:39:44', '2012-01-17 17:39:54'),
(50, '72b25ad39e5675dfce110f07748bc9bc', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFJUTB0d01hanNiUnROaVphZTFN\nZFFDaGxURmwveTVtTHlBY2ZNQUw2N2dVPQY7AEZJIgx1c2VyX2lkBjsARmkN\n', '2012-01-17 17:53:20', '2012-01-17 17:53:28'),
(51, 'b2da297213891fb0151d421ef682d4b5', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFVMlYwMDZLb3dOUGxZT2RaRU9a\nc2lJdU1LT0lNYms3OEp6ZTIyK05sL1FVPQY7AEZJIgx1c2VyX2lkBjsARmkH\n', '2012-01-17 21:16:37', '2012-01-17 21:16:48'),
(52, '00c068aaedd05deb00c1239954ba88fc', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFTSWNiOEkva1hzdUNJMllVME9r\nSzlKTm1pKzhYeUxWWi92ekZDNVdxQUJnPQY7AEZJIgx1c2VyX2lkBjsARmkH\n', '2012-01-17 21:28:59', '2012-01-17 21:29:05'),
(55, '049fddbffdb3a66e00d979fa3365a5b0', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjF3Rm9UNkxqaGt1NWczd1pNT3h4\nSjVVOUJBVS9OZGlPaHAwTGU1MlZaRTJnPQY7AEZJIgx1c2VyX2lkBjsARmkH\n', '2012-01-18 04:09:36', '2012-01-18 04:09:45'),
(56, 'c34f31da7e2996e137dca0cc88716e4a', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjEvZ29MVDN3blAyQ1Q4OE1ySVpq\nODdQUjZxRjQyVzlvWk1oTlg1dWlMNW9BPQY7AEZJIgx1c2VyX2lkBjsARmkG\n', '2012-01-18 04:54:05', '2012-01-18 04:55:20'),
(57, '4f0304b57f796c9c98ce126ecfb8b791', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjF1dmIrWGkyV29NT05XZ0xhRXZa\nendwYUE4YmQ3ZytLLzY3U1Zya3hBQTJBPQY7AEZJIgx1c2VyX2lkBjsARmkG\n', '2012-01-18 15:31:40', '2012-01-18 15:31:52'),
(58, '5f271ad7833a95d9861095de9826c879', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFMc0I5SEQwUk1JSXVxVlRhQUVx\nSXloRDltdXcyQjlwazhTbGUxVVp3RFBjPQY7AEZJIgx1c2VyX2lkBjsARmkH\n', '2012-01-18 23:04:05', '2012-01-18 23:04:20'),
(59, 'b76550987832dc473ebefa549010c0ef', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjEyUzRHV2s1b1d1VFRNblpTbVJm\ncEplWDl2TFBvZE12bGtZbTZib2FqQ2FVPQY7AEZJIgx1c2VyX2lkBjsARmkG\n', '2012-01-19 01:32:32', '2012-01-19 01:32:50'),
(60, 'c247cad1a9efba7f61ebf14c91f8b7c7', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjE2dzF0amtvalRKb051bTRoLytl\nMk91K1ozYWFpR0FZeEJtWVk4RDY1ODJzPQY7AEZJIgx1c2VyX2lkBjsARmkH\n', '2012-01-19 02:31:52', '2012-01-19 02:31:59'),
(61, '1fe0857ea33830b77adf75af7225cc41', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFiQ3J0VU8zTlF5dXgzRjhYNkZW\nVmZuaVVEZmMzZmwybWw4TjZRUXgrMk1nPQY7AEZJIgx1c2VyX2lkBjsARmkG\n', '2012-01-19 06:39:25', '2012-01-19 06:39:40'),
(62, '257c0f79c56007014e67dbcd01169791', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFGOW5qSG9SSDBLWnk3NWJRa3Ny\nN0UzY1ZwYzBjLzV0dU01TlhCajFNenpZPQY7AEZJIgx1c2VyX2lkBjsARmkH\n', '2012-01-19 18:55:08', '2012-01-19 18:55:17'),
(63, '6438e4ce2d7392123c3fbe8dce370c0d', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFoNTBzVE8xUEw3eTIzWjFCZGpp\nQkVsYlpxNHBablpJT1JMUzZGbS96VDV3PQY7AEZJIgx1c2VyX2lkBjsARmkG\n', '2012-01-19 22:30:09', '2012-01-19 22:30:20'),
(66, 'cfcae6eec73a7f69b0709429596e28d8', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFieFNkQVM0bS9Cb2xpc1h1S3Bp\nU0lvY1o3dVBKN2J0d2xQTTFYdk9GMmNzPQY7AEZJIgx1c2VyX2lkBjsARmkN\n', '2012-01-20 03:13:57', '2012-01-20 03:14:09'),
(67, 'f000f542a891653c8c20dcc3893733bf', 'BAh7AA==\n', '2012-01-20 04:46:23', '2012-01-20 04:46:23'),
(73, '4986f43e976ec5ef4d0ae89322880a37', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjEzNHlySVd1TDRxeUh4WU12eWMx\nQ0l0N0hxTWgzeGNnZGhTR0pVL080cFo0PQY7AEZJIgx1c2VyX2lkBjsARmkH\n', '2012-01-20 16:51:38', '2012-01-20 16:51:43'),
(74, '44eb40f1ba44b70c369c23b8ee0172de', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFsenFSVFJQZ2xzRVk1SGphSVdF\nQXJCYUpDZ0lYRm01SUlKTzdMME1zT2ZVPQY7AEZJIgx1c2VyX2lkBjsARmkG\n', '2012-01-20 19:09:35', '2012-01-20 19:09:43'),
(75, '1b0c67d3fcfb40afe5d4af8f9961926f', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjEzZ1hnNFRQc3ZHb2xNVGR2VTgr\nK0NJVGg5L25MVTZNelBIdzlhQktaTnA4PQY7AEZJIgx1c2VyX2lkBjsARmkG\n', '2012-01-20 22:11:35', '2012-01-20 22:11:49'),
(76, 'f8989805b191677d1bfb4439b6f60f41', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFEaU54WEZsekFBU3QzcEdabitu\nMXc3QzR4eXJBb1pQVW90WkthY3plVEFJPQY7AEZJIgx1c2VyX2lkBjsARmkG\n', '2012-01-20 22:15:03', '2012-01-20 22:15:16'),
(77, '3e98507c78759447b43af9fa797cba7a', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFYbkdoUU9CUnZMdTFOczZ2OGxS\ncFNpNEpoV2s4YUJrYm1odHRIcS9JeG9ZPQY7AEZJIgx1c2VyX2lkBjsARmkk\n', '2012-01-20 22:21:23', '2012-01-20 22:22:08'),
(83, '1825c3f4eb0e56b4eae1eb7e9f291f3d', 'BAh7B0kiCmZsYXNoBjoGRUZvOiVBY3Rpb25EaXNwYXRjaDo6Rmxhc2g6OkZs\nYXNoSGFzaAk6CkB1c2VkbzoIU2V0BjoKQGhhc2h7BjoLbm90aWNlVDoMQGNs\nb3NlZEY6DUBmbGFzaGVzewY7CkkiIFlvdSBzdWNjZXNzZnVsbHkgbG9nZ2Vk\nIG91dAY7AEY6CUBub3cwSSIQX2NzcmZfdG9rZW4GOwBGSSIxUWU2YjkwQ1Ji\nTnBUTUJ2ekJkTjVUd2ROVmR5WHpZbThsclo1T3ZoZVlwbz0GOwBG\n', '2012-01-21 03:56:33', '2012-01-21 03:56:39'),
(85, 'd81808344e7cfb801ab1fdd0b7f04621', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFRRUMwd0thN1BReXc5MkE5U0hC\nalJjVVNRRWVQYmp1SlZQSmpaRjJvK2Z3PQY7AEZJIgx1c2VyX2lkBjsARmkO\n', '2012-01-21 04:24:05', '2012-01-21 04:42:16'),
(86, 'cc568052965cb6d0c134ea078336730d', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFnUWprOFd5UkxJUnA4UHZ5Uldp\nT2RiNmQvckthbXQ0NnhMS25za3dBdVdRPQY7AEZJIgx1c2VyX2lkBjsARmkO\n', '2012-01-21 04:52:11', '2012-01-21 04:52:20'),
(88, 'd758b4fb29b8e6de64460bcea42af681', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFxTWIydTVpTmxtUUowWFM4cGNo\nUmVLM21YS29BZ2NlTWI3dkxhaHNobjMwPQY7AEZJIgx1c2VyX2lkBjsARmkG\n', '2012-01-21 19:02:27', '2012-01-21 19:02:36'),
(89, '1aa99d550960bde0b071a0f2465f62cd', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFucHJCTWo5TDFIdUI1RU5EbGZ6\nNVdvWE1xK08xNGlnd210NkU1NHpvNEFjPQY7AEZJIgx1c2VyX2lkBjsARmkH\n', '2012-01-21 20:57:42', '2012-01-21 20:57:48'),
(90, '992eae286eb37d89d1b5df30fba64ae5', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjF5ck1VTFJ1bmNNVzBicW5McEdz\nLzN5UWIvM1gvNStwVUtBVk5yY29DQVdvPQY7AEZJIgx1c2VyX2lkBjsARmkG\n', '2012-01-22 03:01:00', '2012-01-22 03:01:06'),
(92, '79961342d3309f8123374ede25217085', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFyQ0ErVkR4QjNwTE8xaHFkMjBY\nOWJ6YkNTdUVpOUJVOTNlTUEyRnkyVUo0PQY7AEZJIgx1c2VyX2lkBjsARmkG\n', '2012-01-22 22:18:42', '2012-01-22 22:18:48'),
(93, '6dfeff3611275a3dac0b22131d320c7b', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFKelQxczdGS1lBREN6YzI2N3ln\nMjdhOGwraWlzeE1obng5RnI3cWtKQ3VRPQY7AEZJIgx1c2VyX2lkBjsARmkH\n', '2012-01-23 00:10:48', '2012-01-23 00:11:00'),
(94, 'e158ae633ca95df35a0cb4be0b23a6e6', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFPMnVyTnozUHg5Szl2ejJvOXU3\nRUZ4emd3bEU2TTk2WS9VUHFWTXhuclI0PQY7AEZJIgx1c2VyX2lkBjsARmkN\n', '2012-01-24 03:13:40', '2012-01-24 03:13:58'),
(95, 'b4f49811d067975f322a104cee25afd1', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFqY01CczcvUTNkT2RRMkxVcjhJ\ncVNmVS9QMzF3WXZJcCtyUkYvYk45ZmVnPQY7AEZJIgx1c2VyX2lkBjsARmkH\n', '2012-01-24 21:49:46', '2012-01-24 21:49:51'),
(96, '143632b950190f1553a8c62d9ef970d5', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFKOThaRG84MDVVb2dLajMvaVVr\nWXRGaVJyNzl5QVQvaFJ4a1pZaGZBNlVJPQY7AEZJIgx1c2VyX2lkBjsARmkH\n', '2012-01-25 01:27:49', '2012-01-25 01:27:58'),
(97, '986eaf0130109632a6cbfa3d6ddcf1d8', 'BAh7BkkiEF9jc3JmX3Rva2VuBjoGRUZJIjFhVytUaTNjNWZsMTlCTEVzaWtE\nWlQ0TGhCSHV1Z3dKWVB6UW1ZdEJQaW5NPQY7AEY=\n', '2012-01-25 02:08:15', '2012-01-25 02:08:15'),
(99, '4445c15dd46fef90226f2efea75b8d2a', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFoM20yL1ptdGFRNXRUYTEyekpC\nWmpBOTZxWkNhbWhxaHpaakZFNkkveGtvPQY7AEZJIgx1c2VyX2lkBjsARmkH\n', '2012-01-25 04:19:58', '2012-01-25 04:20:08'),
(100, '082b21bb6065644acf9f202d3d8cac91', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFSSXFoVWhRZVZvUy94NE95Y3h3\nMEFOMjZuWDZLTVpzZ3ZMdUlYWTVmTnZrPQY7AEZJIgx1c2VyX2lkBjsARmkH\n', '2012-01-25 04:32:48', '2012-01-25 04:32:59'),
(102, 'bd4a55e9cdbd5c8b740017bf275de532', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFTeVB6Rm9RNzNOdDQvM3ZBY2N3\nN0lLY0hpTTdkUTVEeFNOU3VJYVk3eldzPQY7AEZJIgx1c2VyX2lkBjsARmkH\n', '2012-01-25 06:58:44', '2012-01-25 06:58:51'),
(104, '9b8ab015de7d0573a320f7efd66b7c0f', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjE3c0M3eUtyckhVQmhQdm1seHVx\nS1dXWGk1NE1CZ2RZSitXR0YxeVhVWFBnPQY7AEZJIgx1c2VyX2lkBjsARmkH\n', '2012-01-25 19:46:57', '2012-01-25 19:47:04'),
(106, 'cb2a0a4a6f66bfe9da25bda871d89fd8', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFWQTBrTG9Henpzd3U2TWlzTkxl\nWDFjTzBkZjNEdEQxZjVqT0tIRW5xZTRjPQY7AEZJIgx1c2VyX2lkBjsARmkO\n', '2012-01-26 03:14:50', '2012-01-26 03:15:00'),
(107, '717861e974a409a9eb2fb00a3d96c839', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjEvTERuVU9DaUVnT2pwQWRlVlVr\nV2phclB5b2JjOVk3QTgrV1JEVEI1VmxFPQY7AEZJIgx1c2VyX2lkBjsARmkn\n', '2012-01-27 03:26:37', '2012-01-28 07:18:25'),
(108, 'e1cb5b20bc13392cf15efb3ad10cabcf', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjF0NzQ4OUcyRytNRk5jWHNBZGln\nLzBaTGdwU0IzQUtsZTV1bkxCSFBUcWRvPQY7AEZJIgx1c2VyX2lkBjsARmkN\n', '2012-01-27 05:07:44', '2012-01-27 05:08:04'),
(109, '81c4fe11cc13da101b02bd51a668c2ff', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFNc1dzdWx2OUJPN3lIMjVsMGdO\nYVEyZWN0TmZVQXhmc1YvbkpjWjlKeUhzPQY7AEZJIgx1c2VyX2lkBjsARmkN\n', '2012-01-27 18:50:08', '2012-01-27 18:50:17'),
(110, '4a29805dea208597dd4c9f9bedbf220a', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFWekFzbWNzSmNRZWRkb2xTWEJG\na0x3UVFNYXp2dTZvT1d5VW1KRGZ1NW1JPQY7AEZJIgx1c2VyX2lkBjsARmkN\n', '2012-01-28 01:10:10', '2012-01-28 01:10:19'),
(111, '1e7132df743caf965139f644658a859f', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFsT3FhYnNRVGNDemxoaXVSV3Iy\nZlo4YktHRERTZGhwWlVnQWVnR01hUG9FPQY7AEZJIgx1c2VyX2lkBjsARmkj\n', '2012-01-28 15:49:09', '2012-01-28 15:49:18'),
(114, '30dac5ea8dfe605e9a4a2eab8ca985b8', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFUYXQ5YWRSeW43cDJ4MkhDN2Z3\nSEtSeWVpWWtJMHJtVHZ2VHRRbWQxQnNzPQY7AEZJIgx1c2VyX2lkBjsARmkN\n', '2012-01-28 16:03:14', '2012-01-28 16:03:25'),
(115, '3f669cf7a0ea5167a5d770003f68cb72', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjErNEJCdmpNNkZwek0wN0VMR1Jw\nM1NKRThPcjJRNmNROVF5Q1IrRVRtTU40PQY7AEZJIgx1c2VyX2lkBjsARmkO\n', '2012-01-28 16:08:47', '2012-01-28 16:08:55'),
(116, '6d8911607e748bbd7a3785f89394b50d', 'BAh7BkkiCmZsYXNoBjoGRUZvOiVBY3Rpb25EaXNwYXRjaDo6Rmxhc2g6OkZs\nYXNoSGFzaAk6CkB1c2VkbzoIU2V0BjoKQGhhc2h7ADoMQGNsb3NlZEY6DUBm\nbGFzaGVzewY6C25vdGljZUkiIFlvdSBzdWNjZXNzZnVsbHkgbG9nZ2VkIG91\ndAY7AEY6CUBub3cw\n', '2012-01-28 16:47:23', '2012-01-28 16:47:23'),
(117, '368141320a875134c1d95623e711e7ee', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFQSFdyWi9RU2VBZlB6TW94UGRY\nZlJYV0E5QTlaWS9DK3RidWtuNjI4TDN3PQY7AEZJIgx1c2VyX2lkBjsARmkH\n', '2012-01-28 16:47:23', '2012-01-28 16:47:44'),
(118, '864fc778386e3d2d45dae01bd77efe5f', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjE1VmpNNHI0czJKaERENGF6K1Ay\naEIyR0Nub3BQaW1HVFUyUFU5VnNVQXFVPQY7AEZJIgx1c2VyX2lkBjsARmkN\n', '2012-01-28 16:48:22', '2012-01-28 16:48:31'),
(119, '7aea967580efcb5cf0dea78a38aa97cb', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFEc3BkKzVzekFyN0ZiMFJVRk4w\nZGhTM2trL3RMZlJVNjV2eGFCZ1lzK3JVPQY7AEZJIgx1c2VyX2lkBjsARmkG\n', '2012-01-28 17:35:37', '2012-01-28 17:37:46'),
(120, 'b7626eee03a05232bc91220d7ba3fea9', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFWUnRBd2Fzd2tNbGlDM0xUUklq\nZkNqZVZlOXNnT25HZ2c3dEVtN0FuZXRjPQY7AEZJIgx1c2VyX2lkBjsARmkO\n', '2012-01-28 17:35:40', '2012-01-28 17:37:16'),
(121, 'c16aefd8f91b903380981eede8003811', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjE3T2JxQVdtTnpvMGF5Uk91U3Nz\nVFkzZ3FESXFkVWFvcGtXeVAyTGlKSjFZPQY7AEZJIgx1c2VyX2lkBjsARmkN\n', '2012-01-28 17:36:12', '2012-01-28 17:37:30'),
(122, 'e43b30b17770321f6d8f8e3cbdaf561c', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFFZ3dqNjRIQm56dno1TDR6UUNt\nWmdwclZYcXFsL1oxMTJROFNVM3dYTkxjPQY7AEZJIgx1c2VyX2lkBjsARmkO\n', '2012-01-28 17:38:05', '2012-01-28 17:38:52'),
(123, 'c89e9570d749be6f2d3c21d9e7c07932', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjExTWR4cWQxUldzK2gxVHUwZ0ly\nRm9HNElFZUJsdHJSUUlLc0tzUkIxTE5FPQY7AEZJIgx1c2VyX2lkBjsARmkH\n', '2012-01-28 17:43:53', '2012-01-28 17:44:02'),
(124, 'cb9415d35a7e33b29ba9b6dc21c1e92d', 'BAh7BkkiEF9jc3JmX3Rva2VuBjoGRUZJIjFhb1FkN1Voa3QvL2RhQXFTM1hM\nL0NpVC9RUXk4ZU0wbjd6bzdsUTY5akw4PQY7AEY=\n', '2012-01-28 18:33:58', '2012-01-28 18:34:17'),
(125, '32fe8c4ee05c63c0310a7025d011677f', 'BAh7BkkiEF9jc3JmX3Rva2VuBjoGRUZJIjFvYjc3VTBVZkdLQjdBeWtiSVph\ndHpGcjBpbWkyOVdFNzNqN3c4MVR3VVlNPQY7AEY=\n', '2012-01-28 19:14:36', '2012-01-28 19:14:36'),
(126, 'c1d2cf8df39c4fff01fe1ddcb950be62', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFMclZCRFpOMnZLWU5zZXJPYmxZ\nY3dPc1BsSjJtVTNSWW85OU5sVmN2UWgwPQY7AEZJIgx1c2VyX2lkBjsARmkH\n', '2012-01-28 19:16:50', '2012-01-28 19:17:54'),
(127, '5bf2f17988e79e285daf01ac0f4419c2', 'BAh7BkkiEF9jc3JmX3Rva2VuBjoGRUZJIjE5LzZNb09Ybzl5d2JsQTlpakg4\ndnJCYWZIMUJuQ2lzbW94RlpBZ0lhTzZnPQY7AEY=\n', '2012-01-28 20:37:49', '2012-01-28 20:37:49'),
(128, '418e1e5682812f04c103038555b24f9e', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFQeG9nTnhqUUVmcHNXM2w3WXFB\nWnc3KzNBVGpFcjY4UHgreGlGYkZiQks4PQY7AEZJIgx1c2VyX2lkBjsARmkO\n', '2012-01-29 01:56:50', '2012-01-29 01:57:14'),
(129, 'bfc25260497f484d1067df2fa5e07adf', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFubE1MNU1iZm5MVEhVUnllb2xx\nSCtRaDVLK1RuYjRldjdKZzNFOGc0RWg4PQY7AEZJIgx1c2VyX2lkBjsARmkN\n', '2012-01-29 03:49:53', '2012-01-29 03:50:08'),
(131, 'c0e0c966db34c796c394516e2d7ad4a8', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFldThTR1ZZd0pDUTZXT1VtYmFQ\nT1I4cE8ybFJEQmVZUTBsRzIrR1JwV2MwPQY7AEZJIgx1c2VyX2lkBjsARmkH\n', '2012-01-31 01:19:37', '2012-01-31 01:19:48'),
(132, 'dd354aad79d85af75c2cfe0799d02095', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFXazhUc1lXbWdWaThJR3lEWGgx\nengzd0hpOTBtdERVVzJGWUgwbmdjeEJBPQY7AEZJIgx1c2VyX2lkBjsARmkG\n', '2012-01-31 04:24:18', '2012-01-31 04:24:29'),
(133, '0e6787d842557c5df4d6f64f7e0f4cdc', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjF0aEJHT0dXQkpJSVZpYzQydmZq\neDlBTGo2Y2lmY0JEYnltbTRjRnI5OFN3PQY7AEZJIgx1c2VyX2lkBjsARmkG\n', '2012-01-31 04:37:11', '2012-01-31 04:37:26'),
(134, 'a875581eb25ed4084f260081965c2c1a', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjErb1pVcEFsWStJVUd2dWY4cm1u\nYlVTY0s4a0w0bVhOQTRQY1VsSDFWVG9NPQY7AEZJIgx1c2VyX2lkBjsARmkO\n', '2012-01-31 04:49:05', '2012-02-01 02:58:49'),
(135, '712b68fd83237bb24196bbc7dbe7f885', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFPK1RzNE5RZXJCRnJ1ejBZbjg1\nb2dDU3NnRVJuTUdVelQyM2IzMVNCZEZnPQY7AEZJIgx1c2VyX2lkBjsARmkH\n', '2012-02-01 03:36:07', '2012-02-01 03:37:53'),
(136, '23b6febbaffcbd00068f492aa3d28602', 'BAh7BkkiEF9jc3JmX3Rva2VuBjoGRUZJIjF4cTY2WXlDWDBxZ3JKZWhDemk1\nMUxrRk1rYkt6cHQvdVBBV0ZqYmRVYUQwPQY7AEY=\n', '2012-02-01 03:45:11', '2012-02-01 03:45:11'),
(137, '5074d376eb4c98c382dcab6f0e45c202', 'BAh7BkkiEF9jc3JmX3Rva2VuBjoGRUZJIjE2aGNWdGxhQVRRZWg3cmZLU2t2\nencwbzlleTQ5MWh4N0xMQkNqcnQ4SzRjPQY7AEY=\n', '2012-02-01 03:45:20', '2012-02-01 03:45:20'),
(138, '30ac49810b0dac94cd60d107feb886e6', 'BAh7BkkiEF9jc3JmX3Rva2VuBjoGRUZJIjFXa3ZpaVhoMHFBZWhSWnRJdFor\nZ212d2pabVM1R3VkclNwREtSbk11S1QwPQY7AEY=\n', '2012-02-01 04:02:08', '2012-02-01 04:02:08'),
(139, 'd2204ba0c81e13960ec4cbb785e6687a', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFWV1JoWFlRRFpWVUxKQ2ovWi8y\nd1BNL050aHdoVDl0QXJacG41Qk1KcllJPQY7AEZJIgx1c2VyX2lkBjsARmkH\n', '2012-02-02 02:49:04', '2012-02-02 03:10:42'),
(140, '4ed91e106b6d3e57111408345d40837e', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjE5bDU1RytSTTZCSkRzY0ZocjZZ\naUpYYXFLMmJseTFUWEJsM1JOZlhmQmQ4PQY7AEZJIgx1c2VyX2lkBjsARmkG\n', '2012-02-03 02:37:25', '2012-02-03 02:37:41'),
(142, 'ac9d78610ded30033b363d75fafd11a2', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFZM24wR2RySEF4WXFGa2lnMzdR\nTzV4QVZUM0NEWDE5RGhzd3RUcjIzVldvPQY7AEZJIgx1c2VyX2lkBjsARmkH\n', '2012-02-03 05:01:11', '2012-02-03 05:03:06'),
(143, '56fa0515b6bdd2b6e2721ebf20175120', 'BAh7AA==\n', '2012-02-03 05:01:12', '2012-02-03 05:01:12'),
(144, '07083193c79c194b098e261d963c0fbb', 'BAh7AA==\n', '2012-02-03 05:01:12', '2012-02-03 05:01:12'),
(145, '1bd298900b8f67c14ed69eb8f55dd310', 'BAh7AA==\n', '2012-02-03 05:01:12', '2012-02-03 05:01:12'),
(146, 'd8a509e5096007b57807a4acafa95ee2', 'BAh7AA==\n', '2012-02-03 05:01:13', '2012-02-03 05:01:13'),
(147, 'b9ec1d31596c49f36e42e9386b21c833', 'BAh7AA==\n', '2012-02-03 05:01:13', '2012-02-03 05:01:13'),
(148, '2ad53d049a9f983d2319039abccc1b5d', 'BAh7AA==\n', '2012-02-03 05:01:14', '2012-02-03 05:01:14'),
(149, '4b7b447fd540dc4a14e32e85b9437c67', 'BAh7AA==\n', '2012-02-03 05:01:15', '2012-02-03 05:01:15'),
(150, '894d275ef4001a6b70b70360bc7f96b7', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFmWmVRdE9kT3REMWhKU2VXaUlS\nTzc0RnNkRU5nQVk2S0pTYkx1YWpISmdNPQY7AEZJIgx1c2VyX2lkBjsARmkN\n', '2012-02-03 16:13:57', '2012-02-03 16:14:09'),
(151, '3b5fba26771f8d1a2e607cf4562afdf0', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFUalRSbDBuNXBxTFVNZkJzZEhs\nUFVXd3hzK1VVWjhTOUpIVWdnc3BuUEswPQY7AEZJIgx1c2VyX2lkBjsARmkG\n', '2012-02-03 16:31:23', '2012-02-03 16:31:38'),
(152, '64aed8a084334b8ea13af964f64eb1ee', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFoQStxK0NZYUY1bnFFV0ZscFIv\nSzNsUEdSZUxabnZHMGxsYzFSMTlCNmxRPQY7AEZJIgx1c2VyX2lkBjsARmkH\n', '2012-02-03 17:10:34', '2012-02-03 17:10:38'),
(153, '4fbc0f231e9ec21aee01f1b4f5837f4b', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFJRnh1TGVNb0ZFQTVVeUJMdmpv\nRlh2VVUzWHdoc0lZRzg0T2x2aHlVQnRRPQY7AEZJIgx1c2VyX2lkBjsARmkN\n', '2012-02-03 21:44:28', '2012-02-03 21:44:49'),
(154, '61f952a0616fac5c9c25f079cd7779e5', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFOVTkxSloxWDhlSE5OYjlpYmdO\neGtnMEo1WUhJb1llbnpXbjZMejZmdmFJPQY7AEZJIgx1c2VyX2lkBjsARmkG\n', '2012-02-03 21:44:54', '2012-02-03 21:45:16'),
(155, 'ccef902f4f77b867ddb629b34f7074e5', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFicHIxMndPQWZldDRMSDJoVDNz\nN2laNE1uVUZVeDZkdjdBd0pDcnVXT1NVPQY7AEZJIgx1c2VyX2lkBjsARmkO\n', '2012-02-04 05:26:11', '2012-02-04 05:26:23'),
(156, 'c2ac5e715b29d26259a0cc931158ccb1', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFrbXN5Yk9TRjZRSGkzNWJMdWJI\nV1BDeVgzaXJQa1BENjZkaitNS2xheEMwPQY7AEZJIgx1c2VyX2lkBjsARmkH\n', '2012-02-04 21:14:46', '2012-02-04 21:18:14'),
(157, '1df3a77784b293b0e167e62a2a2211fd', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFmWnRMYXBHQ25zKytPT0JDQzNW\nMGhFN3I5bDh4N2dtSlI4WTloY2N2alY0PQY7AEZJIgx1c2VyX2lkBjsARmkO\n', '2012-02-04 23:32:41', '2012-02-04 23:58:10'),
(158, 'd936f4b55ad72e9105c92c655892bc6f', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFFRlJ1SFE5Q0IxaWxWcW0wY3ly\nVVRRU0RSaEZlODdHcllZSE9vZ2NSRURFPQY7AEZJIgx1c2VyX2lkBjsARmkG\n', '2012-02-05 01:29:29', '2012-02-05 01:29:38'),
(159, '8e327e112e8016944818a783887dfd60', 'BAh7BkkiEF9jc3JmX3Rva2VuBjoGRUZJIjFtRzVrbnZQK1EyMmx0OWhib3Jz\nb1dMdFBCR05UcTFVMzZxTEhTM3BPQjA0PQY7AEY=\n', '2012-02-05 03:55:49', '2012-02-05 03:55:49'),
(160, '1c6e3da03ae95491a0398126c5b9742f', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFLbDJMWHF0ODExS1pGNlV4UDAr\neFJ0S0NZZlZZdVJ5L0pZM3IwOEZpNG8wPQY7AEZJIgx1c2VyX2lkBjsARmkO\n', '2012-02-05 22:09:55', '2012-02-05 22:10:02'),
(161, '615967ad53eddfcb197c0fcab2eaac7b', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFzVTNQOE5Za0JOa0pHT3Rabk5k\ndTA4MGNqcGN4bCtsU3JjT01rMmxaN2swPQY7AEZJIgx1c2VyX2lkBjsARmkO\n', '2012-02-06 01:18:36', '2012-02-06 01:18:44'),
(163, '97cd7194bbb5c9f6aa9ccd7c2b105290', 'BAh7BkkiEF9jc3JmX3Rva2VuBjoGRUZJIjFaQWxLb1NmQ0ZxUXdoaW5ESW01\ncUpNVzcwZmJXdXRxUjAvQ2FPbE5zQzJvPQY7AEY=\n', '2012-02-06 02:14:15', '2012-02-06 02:14:15'),
(164, 'beb12641637bb368019b42ef6fc0ac9d', 'BAh7BkkiEF9jc3JmX3Rva2VuBjoGRUZJIjFFL1Q5S2ZZaTZjSXdpeFhjOXdF\ndDBZODJCS0pNR0FUSFZ6eFozcmtxRFNVPQY7AEY=\n', '2012-02-06 02:14:15', '2012-02-06 02:14:15'),
(168, '3f95a677972aa5831b5697b00729a57f', 'BAh7BkkiCmZsYXNoBjoGRUZvOiVBY3Rpb25EaXNwYXRjaDo6Rmxhc2g6OkZs\nYXNoSGFzaAk6CkB1c2VkbzoIU2V0BjoKQGhhc2h7ADoMQGNsb3NlZEY6DUBm\nbGFzaGVzewY6C25vdGljZUkiIFlvdSBzdWNjZXNzZnVsbHkgbG9nZ2VkIG91\ndAY7AEY6CUBub3cw\n', '2012-02-06 04:34:22', '2012-02-06 04:34:22'),
(169, 'e636240ae2a31ca462e3f208befe0f9f', 'BAh7BkkiEF9jc3JmX3Rva2VuBjoGRUZJIjF6NmdmZ0hqYzE5YVlONjE1eGtJ\nNTMvSUJ3WmowQWtnYWN4eXRaa250RGpNPQY7AEY=\n', '2012-02-06 04:34:50', '2012-02-06 04:36:30'),
(170, '7216c83ad45e1e999e0145d01089e755', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFKRWZUU3F4aDNQZmJ5OGIrNHMr\nZ1dvTndjQ2tmdTBRUVJUY2F5MmNCVTFzPQY7AEZJIgx1c2VyX2lkBjsARmkH\n', '2012-02-06 04:45:34', '2012-02-06 04:46:13'),
(171, '10799f5b7eb7322f78ae28b133c690fe', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFnTWp3SzhnYm9vRWFORHlGajBC\naCsxc3BBQVhRV2hWQ3BtcW8vSmVreUM4PQY7AEZJIgx1c2VyX2lkBjsARmkH\n', '2012-02-06 23:33:47', '2012-02-06 23:34:08'),
(172, 'a6045ea74e2548a1dfe2816be8cb6fee', 'BAh7BkkiEF9jc3JmX3Rva2VuBjoGRUZJIjE1R2tnTCtwTWI0dGsyWkljYUR2\ndVoxMlhudmRRY0oxMitYNHVxQjNMeUcwPQY7AEY=\n', '2012-02-07 05:46:17', '2012-02-07 05:46:17'),
(173, '7862587a3dcfc0068b3338a57375ab33', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFJQVRpWmJ0RndkR3lhTFlOaUd6\nOHIwRTlmanViOUFaQ0xYbC9sY21XTlFnPQY7AEZJIgx1c2VyX2lkBjsARmkO\n', '2012-02-07 05:46:18', '2012-02-07 05:46:53'),
(174, '72ed055b693b014ba867b070e7ea9603', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFLSVpQTUVNZ0xPZDE3YjJsODF1\nMDVWNXI5M0c2cnYvcE1hMmxISDZBb2lzPQY7AEZJIgx1c2VyX2lkBjsARmkN\n', '2012-02-07 23:53:47', '2012-02-07 23:53:56'),
(175, 'd6652eaf00424496ba0d3b6838767ab9', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFNS0VNYlFRcTgwQWtKVDJTUDBT\ndXRBa2diSmFYQ1V4ZjBSQW1BcFVwMWhzPQY7AEZJIgx1c2VyX2lkBjsARmkO\n', '2012-02-08 00:06:04', '2012-02-08 00:06:10'),
(176, '02655c748f453f9c5e753f7f3a20b464', 'BAh7BkkiEF9jc3JmX3Rva2VuBjoGRUZJIjEzNUN0aFN4WHh0bGVzUCs3MDk2\nV29OTmFVWDlyLysrbWJXQ2hza0h2ditnPQY7AEY=\n', '2012-02-08 00:55:19', '2012-02-08 00:55:19'),
(177, '0d4b4b7fa8c784651f1db8066bd89ccb', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjE4aUM0SFlRTUlYdlVEZkQ5eTd4\na1hDMGkyaSt3ejVjcDFEbTQxeWUrSDhBPQY7AEZJIgx1c2VyX2lkBjsARmkG\n', '2012-02-08 00:55:19', '2012-02-08 01:18:25'),
(178, '7df41faba76c9cd3a2584f47faebd873', 'BAh7BkkiEF9jc3JmX3Rva2VuBjoGRUZJIjEydERoTFZOak9XRjRra25DUE43\nSVE4b0x5OWR5N3ZVYkxvOFRNc1JsTDJvPQY7AEY=\n', '2012-02-08 02:46:24', '2012-02-08 02:46:24'),
(179, '7f620e433752e4a9d02d7c1489d8a663', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFKT0llMHJPU3BlL1FKUWttZC8y\nUmhBVW1NazdBbXVJSThoTFQvWCt1WGlnPQY7AEZJIgx1c2VyX2lkBjsARmkO\n', '2012-02-08 02:46:34', '2012-02-08 02:47:03'),
(180, '2ea815a156cb86455e1bc5c8adffdd5c', 'BAh7BkkiEF9jc3JmX3Rva2VuBjoGRUZJIjE4S1FTdEh6L3RKV3QvZmNoeW55\nYWIyeVRvT0FRYjI4UkFlalhPVy9mR3VZPQY7AEY=\n', '2012-02-09 01:20:50', '2012-02-09 01:20:50'),
(181, '049c9f17141c207af6e1f7d175c541e8', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFqY0VJZU1IQnZnMlY3VmpRQ3Vo\nZlJpSVF5YkhRTUFvdGE4Y2dKVjB4WFlnPQY7AEZJIgx1c2VyX2lkBjsARmkO\n', '2012-02-09 01:20:59', '2012-02-09 01:22:05'),
(182, '96444d9f8a62ec9b9a831a7d56f2f932', 'BAh7BkkiCmZsYXNoBjoGRUZvOiVBY3Rpb25EaXNwYXRjaDo6Rmxhc2g6OkZs\nYXNoSGFzaAk6CkB1c2VkbzoIU2V0BjoKQGhhc2h7ADoMQGNsb3NlZEY6DUBm\nbGFzaGVzewY6C25vdGljZUkiHlBsZWFzZSBsb2cgaW4gdG8gY29udGludWUG\nOwBGOglAbm93MA==\n', '2012-02-09 02:03:27', '2012-02-09 02:03:27'),
(183, 'ef705fea187b15d8b67d7fa7baf741a9', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjE1b29VKzVEZEhoZkxabnJUWXJu\ndnVKdUxzTzFvUTg3YTgyaTlzaGV3MzQ0PQY7AEZJIgx1c2VyX2lkBjsARmkO\n', '2012-02-09 02:03:28', '2012-02-09 02:03:41'),
(185, '446065d015acdb8fdaa983e48433c6ff', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjE3M1FlMkdaQ0lHT092cWUwbGdC\ncEdZOUthZTU5ZWExNmVjaVl6d3o5aTljPQY7AEZJIgx1c2VyX2lkBjsARmkO\n', '2012-02-09 03:04:07', '2012-02-09 04:59:32'),
(186, '1ef574d3c675840c059ee1cefbafac6c', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFKWVVtWVpVd0llbkgxdWZMMjJ4\nanY4dDdRcDJhaGo2MlNiWEFPbDZUa2hBPQY7AEZJIgx1c2VyX2lkBjsARmkq\n', '2012-02-09 03:04:57', '2012-02-09 03:11:35'),
(188, '0eddff49a64d4b5eac692a9eb74cbb59', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFDTzJBbXU0Sld2NmRtYzEwVExo\nNE5qUk55VmhOUjFJSWN0U3FWaEJxQjdFPQY7AEZJIgx1c2VyX2lkBjsARmkO\n', '2012-02-09 04:49:23', '2012-02-09 04:57:01'),
(189, '490a69ebbf9d8c932d0a59435dfdbd60', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFkM1l1bVlBMzBiNUY5aC90N2M3\nVEx4bFFYaG02YWU4Qll3SisvSVN4SlJVPQY7AEZJIgx1c2VyX2lkBjsARmkO\n', '2012-02-09 05:04:28', '2012-02-09 05:05:06'),
(191, '7099fc9261cbe298943a80ee60f155fc', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFEak1ObFVzYzY4ekVYc1hMSi80\nbVRhbEJjYWl4V3dNaG9OWDBrV0FzRWc0PQY7AEZJIgx1c2VyX2lkBjsARmkG\n', '2012-02-09 14:51:26', '2012-02-09 14:55:09'),
(192, '5c7152cee8fcfdde68725d32e289184c', 'BAh7BkkiEF9jc3JmX3Rva2VuBjoGRUZJIjFqakRObzA0UjNOOTFvWHhqMUxu\nanhtUDRxN1Z1cnNDZDlnNVVjQlJoWnlZPQY7AEY=\n', '2012-02-09 14:52:16', '2012-02-09 14:52:17'),
(193, 'b65abe0712ff929ba5932fe7bc74406b', 'BAh7BkkiEF9jc3JmX3Rva2VuBjoGRUZJIjFIQnNyOEh2RVBBSWphZnlSazZY\neGVvVG9zUFl5ckFoTHkzWUJtc2cvd2NNPQY7AEY=\n', '2012-02-09 17:23:22', '2012-02-09 17:23:22'),
(194, '61a57b960ee574f6305eb2400f7fc5ac', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFHNkNENzJQUnVhQ2NocWRuU01X\nYm9DRllkRE9QMTNxV0tJQU9NTWZ1MUpZPQY7AEZJIgx1c2VyX2lkBjsARmkG\n', '2012-02-09 17:33:42', '2012-02-09 17:33:49'),
(195, 'e2c3e633909016145c1efe1c27f51bc0', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjEyQ0J4V1hWQXdaMFlzNEFrd3VV\nL1VSSSthdmNjcCtaK2FhOEh2eHA0QjVzPQY7AEZJIgx1c2VyX2lkBjsARmkG\n', '2012-02-09 22:52:25', '2012-02-09 22:52:38'),
(197, 'c17b96e1d70c511df576e1c789790f9a', 'BAh7BkkiEF9jc3JmX3Rva2VuBjoGRUZJIjFzWTJnTVhYYlJjNkhPZGJ4Ymts\nWTE4MkxLcG1ka1YvL1FBZDhVSjAwZUNjPQY7AEY=\n', '2012-02-10 01:17:26', '2012-02-10 01:18:09'),
(198, 'be8138cadb3816199ecfcd212049c40c', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFRVjFLdzFUcUZqaTFad0wxdlJP\nNWhiOWMrU3JwRkdocnhxd2Z1OTVSbTA4PQY7AEZJIgx1c2VyX2lkBjsARmkG\n', '2012-02-10 01:51:21', '2012-02-10 01:51:38'),
(199, 'da9e6749eca8e11c545d845093475c04', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFzN1lNTDBiSGFiekU5UUx3ZVlv\nL05iSG9xQzRzUG11RmRUWm5vUU5sT0VjPQY7AEZJIgx1c2VyX2lkBjsARmkH\n', '2012-02-10 18:00:43', '2012-02-10 18:00:49'),
(200, '203f88d4f345c57736b946835b840e0f', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjF6VlNkNGhuTUF6VVJZTmpIMlpq\neitRQTVFc2RUZXdsT0JudkFxTDZ6VE1zPQY7AEZJIgx1c2VyX2lkBjsARmkG\n', '2012-02-10 21:05:08', '2012-02-10 21:48:11'),
(201, '7c6fbf241c9c4be6a61e35cb2b7568d2', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFzcTcrOEtzVXl2bzJEa1ZlMHdK\nVFhWYzVUd21SdEZNMzVHTDY4V0t1WCtRPQY7AEZJIgx1c2VyX2lkBjsARmkH\n', '2012-02-10 16:19:57', '2012-02-10 16:20:05'),
(202, '36a8667f81ef74f5931ee9ef180b9452', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjF6ZFFMaDRRblFKY0l1UUlQOUxZ\nM3ROWEhVRTgwNzRNbjhvSGYrT0pRbVpFPQY7AEZJIgx1c2VyX2lkBjsARmkH\n', '2012-02-10 16:25:32', '2012-02-10 16:25:37'),
(203, 'ee38c1748e1bc192d82c935ea79b543f', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFaeVVJY1hHSzRxYnFGakRVVGJq\nOE1hS0M5SVhRSVIvN0srbGw2d1JWcnVJPQY7AEZJIgx1c2VyX2lkBjsARmkH\n', '2012-02-10 16:25:58', '2012-02-10 16:26:06'),
(204, '63dffeb9680b254dc58edb50e09226f1', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFLMVBhaG1jeDl5V1NVNStaNERN\nZ0Vob3QremRxNkxiNTZlM0JEc29tVzBVPQY7AEZJIgx1c2VyX2lkBjsARmkH\n', '2012-02-10 16:32:15', '2012-02-10 16:32:23'),
(205, 'd02af0dff5169ceb2e0fc151ed080875', 'BAh7BkkiCmZsYXNoBjoGRUZvOiVBY3Rpb25EaXNwYXRjaDo6Rmxhc2g6OkZs\nYXNoSGFzaAk6CkB1c2VkbzoIU2V0BjoKQGhhc2h7ADoMQGNsb3NlZEY6DUBm\nbGFzaGVzewY6C25vdGljZUkiHlBsZWFzZSBsb2cgaW4gdG8gY29udGludWUG\nOwBGOglAbm93MA==\n', '2012-02-10 16:35:19', '2012-02-10 16:35:19'),
(206, '72282d011b8260c73c0b205279311921', 'BAh7BkkiCmZsYXNoBjoGRUZvOiVBY3Rpb25EaXNwYXRjaDo6Rmxhc2g6OkZs\nYXNoSGFzaAk6CkB1c2VkbzoIU2V0BjoKQGhhc2h7ADoMQGNsb3NlZEY6DUBm\nbGFzaGVzewY6C25vdGljZUkiHlBsZWFzZSBsb2cgaW4gdG8gY29udGludWUG\nOwBGOglAbm93MA==\n', '2012-02-10 16:35:20', '2012-02-10 16:35:20'),
(207, '58ae580c06a6f7a9de3c77b976904754', 'BAh7BkkiCmZsYXNoBjoGRUZvOiVBY3Rpb25EaXNwYXRjaDo6Rmxhc2g6OkZs\nYXNoSGFzaAk6CkB1c2VkbzoIU2V0BjoKQGhhc2h7ADoMQGNsb3NlZEY6DUBm\nbGFzaGVzewY6C25vdGljZUkiHlBsZWFzZSBsb2cgaW4gdG8gY29udGludWUG\nOwBGOglAbm93MA==\n', '2012-02-10 16:35:20', '2012-02-10 16:35:20'),
(208, 'e9430a65ef315461bef50f4cf4ee07d9', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFNcDUrVTlqOGFPS3ZWVm1FbjM2\nNEZZaUZ3NzBGdVlBTTVMRjRuM09BaG1RPQY7AEZJIgx1c2VyX2lkBjsARmkH\n', '2012-02-10 16:35:21', '2012-02-10 16:35:32'),
(209, 'c101c5999001c3d22789f2e93eac3c61', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjE3ZUNIdGJZSlJoYlVXNkdIaWtt\nc09HMHNzcTk0aU1WS2xQNlV5VVNEMGUwPQY7AEZJIgx1c2VyX2lkBjsARmkH\n', '2012-02-10 16:38:17', '2012-02-10 16:38:24'),
(210, 'd1a201897cacfbca0ec44ffa723090cf', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjF4L2JQRlU5NzVKelJiKzQ0bXh1\ncGJEc0R4NUZhYzJaKzZzK2dQUW1RSk1jPQY7AEZJIgx1c2VyX2lkBjsARmkH\n', '2012-02-10 16:42:40', '2012-02-10 16:42:50'),
(211, '0a88b9f4dab6f2e0ffab2f95828aab0a', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFkSVlWWFZoMTlkMVFIOFp6Z0E4\nYjlDaG84MnN3K2FFWk9pcEVkc2p5dnI0PQY7AEZJIgx1c2VyX2lkBjsARmkH\n', '2012-02-10 16:43:06', '2012-02-10 16:43:23'),
(212, '3793d6af0d582553193e26cc112cef9b', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFXcE9aODkvV0FDY045Vm1PbUNU\na1lpc0Z4MUxSZXFqankvMCtvaFJoMEhjPQY7AEZJIgx1c2VyX2lkBjsARmkH\n', '2012-02-10 16:43:14', '2012-02-10 16:43:36'),
(213, '42da2b5decea2fb6a06ca78b0851ebc6', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFhUm5BMTBkYjhpdGk0cThtNVh0\nK2ZZVXdWeWQvU3lsVk4zNTUxMHZCZHhZPQY7AEZJIgx1c2VyX2lkBjsARmkH\n', '2012-02-10 21:45:25', '2012-02-10 21:45:49'),
(214, 'fd99ee9a898b32e4a8d6b6a91ecda524', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFCZ2VUTUFvVjRyL1daL0FicXVa\nNWk2WFNUQkRaMjNIanVheUNRWWhUTnpvPQY7AEZJIgx1c2VyX2lkBjsARmkH\n', '2012-02-10 22:10:59', '2012-02-10 22:13:18'),
(215, 'a9c298772a376cd7a642c015337293e9', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFoVzgxNjJLdDJTbHA5emYxck9C\nOG51cDBlZ3pFN2ZLSUdmS2VMZ3ZZbjRjPQY7AEZJIgx1c2VyX2lkBjsARmkO\n', '2012-02-10 22:21:11', '2012-02-10 22:21:34'),
(216, '8093a463eaa2d73d3832a3acaadd3771', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFmbnNvNHBNYXdYbCtUclluck1U\nUUxSN0JjUEhjdFozcEpCcnhBUVR1VTNzPQY7AEZJIgx1c2VyX2lkBjsARmkH\n', '2012-02-10 22:40:57', '2012-02-10 22:41:33'),
(217, '93091ddd6492d2845de4fc32c8c87b11', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFhTEYzZWladFJPV0FKRmNYUFc3\nb2pvdlUwVHFlK0RKQkowSmNJZmJocTZrPQY7AEZJIgx1c2VyX2lkBjsARmkH\n', '2012-02-10 17:45:12', '2012-02-10 17:45:21'),
(218, '6381a2af25fc100ae1281968ef253055', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFEVmd4VDlJSXN2T0l4dTFiYjZW\nWlF0U3NIejBDaUFjK0JkUDJORzdVNFJ3PQY7AEZJIgx1c2VyX2lkBjsARmkH\n', '2012-02-10 17:49:43', '2012-02-10 17:49:48'),
(219, 'e57f375b14e291fdea5e68957544d005', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFIaHpPUjE4Q0xZT01mTGI0MHZi\nK2RldENJNVdlaGN3b3lUZVk2SnEyd2RrPQY7AEZJIgx1c2VyX2lkBjsARmkH\n', '2012-02-10 17:54:32', '2012-02-10 17:54:40'),
(221, '64f0bd8e948bfa042b393bb9f118bd76', 'BAh7BkkiEF9jc3JmX3Rva2VuBjoGRUZJIjFoM3A0U1lDUUlCdGNYZWV2SnNS\nTEQ2QjlvOVpqUWZZOFpCUE5TY1kxZVlBPQY7AEY=\n', '2012-02-10 21:24:17', '2012-02-10 21:24:18'),
(222, '04cdb8015f0f2ec4e04c740b43e39676', 'BAh7BkkiEF9jc3JmX3Rva2VuBjoGRUZJIjFTZVdWSXJYZnVzWTh1dm51RTd2\nSk14Zm42eFpiRTlFNEt0dHpEc25yZFRFPQY7AEY=\n', '2012-02-11 05:47:56', '2012-02-11 05:47:56'),
(223, 'c18dfcc5b8a57876b5ff363321b5658b', 'BAh7B0kiDHVzZXJfaWQGOgZFRmkOSSIQX2NzcmZfdG9rZW4GOwBGSSIxSWJL\nWU9WckpHMXlzdU5yN2ZnOXFXZlltd0dKcFZOY1RPNkhzVE5LQmxQRT0GOwBG\n', '2012-02-11 05:49:24', '2012-02-11 05:49:43'),
(224, 'f60ed661afc6fcf4d8e25acaca263537', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFwc1FtWEpveUFqeS9KTGNlSkx1\nUXF2QUN0VFRlVWFhZHYrNG1mOENCOEwwPQY7AEZJIgx1c2VyX2lkBjsARmkO\n', '2012-02-11 06:07:48', '2012-02-12 00:54:05'),
(225, 'd31605b6fbfe50fc63c8b937d58ea179', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFrTk12OUtlcHA2SnB0aVNTN1dx\ndGlrdTZ2eGcwWnBxbG5rR05VajhqYTdnPQY7AEZJIgx1c2VyX2lkBjsARmkO\n', '2012-02-11 06:08:03', '2012-02-11 06:08:14'),
(226, '36d0db890251abdb09c872931941cf98', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFKR3FOZ0tjK3ZlNGJBR3pxdGsr\nUGFoblN5RkQ5MXovY0h4eU1GTDk4MmI4PQY7AEZJIgx1c2VyX2lkBjsARmkG\n', '2012-02-11 19:23:03', '2012-02-11 19:23:10'),
(227, '06ffa2969ff3ae71e618b5e3fe841414', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjF0K3hhRExIKy9XbGlXcFB0YSs3\nYThDQnMwenc4aWxCYURHT2J6NmVoMWtFPQY7AEZJIgx1c2VyX2lkBjsARmkN\n', '2012-02-11 21:21:19', '2012-02-11 21:21:25'),
(228, 'fafb1ba96373940c20687296052856da', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFxRUxsRzNFVURjTUh3WnE1S2gx\nMysyQzRGR013bm9PY3lxaDlHbXkyV0dzPQY7AEZJIgx1c2VyX2lkBjsARmkG\n', '2012-02-11 22:19:58', '2012-02-11 22:20:04'),
(229, 'a4dad97c49fa87b9a1825b66078a780f', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjF1N2k5b0ZmL0F4WDh2WGV3aXl4\nVnVwY2ZGZm9EVnE4aURMU1hOZzA4aTk0PQY7AEZJIgx1c2VyX2lkBjsARmkO\n', '2012-02-11 23:34:46', '2012-02-11 23:34:54'),
(230, 'd0cb6c57af5d8c8335a446dfcf142629', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjEydEN2d2xLQ0RRRXd2L245Kzh1\nUXN3ZmxNMTlYZTNqbUlGVGw2R3VRaEVrPQY7AEZJIgx1c2VyX2lkBjsARmkG\n', '2012-02-12 00:53:55', '2012-02-12 00:54:05'),
(231, '4cc9f4e7b3325908e25b44c57e2a6703', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFaSUk0NEhkZUo1TVltQ29OREVy\naHZHNnczcXdXQXhTbVg4TmVpZi9lTlpvPQY7AEZJIgx1c2VyX2lkBjsARmkG\n', '2012-02-13 04:12:40', '2012-02-13 04:12:53'),
(232, 'fbff48ab9a79065ba2631be4cddc5a46', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFSTmU3Z1d4QStDNHlZajNUWlI3\nVnV5WS83ZDYyUlRQN09RM290T1E0TzBnPQY7AEZJIgx1c2VyX2lkBjsARmkH\n', '2012-02-13 22:47:58', '2012-02-13 22:48:07'),
(233, '7d592d5345eca3ac3a8d941908d32ad6', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFXdmp4b1NTOS9ubytoa2h5em9p\nMUpYWjhLQmZ0Y1IreXI5bUIwZHo4Tm9zPQY7AEZJIgx1c2VyX2lkBjsARmkH\n', '2012-02-14 03:48:33', '2012-02-14 03:49:13'),
(234, 'ec2134db11c95df367a94b6bb9b504d9', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFsTTliTGFYbGJYaFhFSE0zNHQy\nZkc5NWFHZlkvWi9GeGhFaGlFT0NqZjVVPQY7AEZJIgx1c2VyX2lkBjsARmkH\n', '2012-02-14 05:55:15', '2012-02-14 05:55:28'),
(235, 'e434a79611242eea9924f2a7c9468590', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFpS0gxNHFpVUFlSEhuQU5XVzYy\nMnFXelI4RVBic3VmZ3FCaWdkVm1GRzdNPQY7AEZJIgx1c2VyX2lkBjsARmkH\n', '2012-02-14 06:26:35', '2012-02-14 06:26:52'),
(236, 'abb5befa9f16fee4075bf71941144383', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFRSW01ajdkNDdheG4wM2tWNlBT\nenpCUkVsemFQWmdZOVdMblQ5NEdBTnZnPQY7AEZJIgx1c2VyX2lkBjsARmkH\n', '2012-02-14 06:56:35', '2012-02-14 06:56:48'),
(237, '2eaa859823aabc2186b59517f6e69bff', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFCOFZnRVFkRUltVXJrTzJmVmdQ\nMFhUYWZzcGNoNk9oUm1JVmRtMXpQZGxzPQY7AEZJIgx1c2VyX2lkBjsARmkH\n', '2012-02-14 15:13:02', '2012-02-14 15:29:57'),
(238, 'c043a50a99b94154ca692a9b4adc3dfb', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFtVGcwSTFOeGdDOVU5L0h6Rkxo\nakNtaTRSWmtsVThqZEYrQ0NwNjRaWi84PQY7AEZJIgx1c2VyX2lkBjsARmkH\n', '2012-02-15 22:10:35', '2012-02-15 22:11:05'),
(239, 'ea8852051fc569644167b7dc677f693d', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjEzR1dhVW8rMmxjdm1iTzhWUHFO\nL0Q3dlQ3eXJnbGFjNS9ZemxQZzNuYlhZPQY7AEZJIgx1c2VyX2lkBjsARmkH\n', '2012-02-17 03:29:00', '2012-02-17 03:29:17'),
(240, 'dc8c78c5ae0cfd25d912a70516d97974', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjEzc1dmOUxUM0YydUduQzdJbHdo\nd1hBTTVNeUVVb1QwdHJmZnhDT04wOFY0PQY7AEZJIgx1c2VyX2lkBjsARmkH\n', '2012-02-18 01:39:05', '2012-02-18 01:39:18'),
(241, 'c4521baba607fb1862ec3bea97b11270', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjEyVjN5UnFzWnNsd3R6UE55NEdB\neDZRSENhQUltUDFRYjhCdlRjclhCOGNRPQY7AEZJIgx1c2VyX2lkBjsARmkH\n', '2012-02-18 02:26:15', '2012-02-18 02:26:38'),
(242, '4d4616609b2ef434f5fb948615cf2778', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFsUmM5OEtwcW9nQ2ZMUlUzY092\nMnNYRjY3Snc2WTVaSzg2RmIzTzU0a2xrPQY7AEZJIgx1c2VyX2lkBjsARmkH\n', '2012-02-18 19:34:42', '2012-02-18 19:34:56'),
(243, '1ab94c6ce7a768f81938d0075cf37305', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFLL1JPRzFVdDd5VUhTZkJwa0pV\ndUFpYitWRUJOZUx4WWtCOWt6TWxnc0NrPQY7AEZJIgx1c2VyX2lkBjsARmkH\n', '2012-02-18 20:33:17', '2012-02-18 20:33:36'),
(244, '0a0c3bd851a8e7772e19d830d09185ef', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFjRmU4QWJmT0oxak93UGE1djU5\nYVJLNzRRd2M5NlZlZjg3T21nTjdjTHpnPQY7AEZJIgx1c2VyX2lkBjsARmkO\n', '2012-02-19 03:23:30', '2012-02-19 03:23:39'),
(245, 'a586fdea4f9d71b2651571546cf63787', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFlc3JwOWpoYWl1Szk2SVdIaUxy\nc1ZzQlJaRkVacDNPQmwwVWdvSWhEc0dzPQY7AEZJIgx1c2VyX2lkBjsARmkN\n', '2012-02-19 04:14:45', '2012-02-19 04:15:03'),
(246, '88d18ff19a32f7aedc47ad9cef1ae2fb', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFKcTFiTWpVcFJFSy9FOXNIRTRt\na0ZmbERESE9PZXNHNDZ1b1VHM2tXVC9FPQY7AEZJIgx1c2VyX2lkBjsARmkH\n', '2012-02-19 04:53:18', '2012-02-19 04:54:10'),
(247, '036fd64da31239f1b88fedf3939c4ff8', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFLbmF4cVV0Y05hbHlPSStCRm9i\nazZDaDlBd3NkK0g0TUE4WjlORDlyakxrPQY7AEZJIgx1c2VyX2lkBjsARmkH\n', '2012-02-19 04:53:28', '2012-02-19 04:53:36'),
(248, '5cac387e4e2dad45803e4707e4727daa', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFuS0toWElXTXR1S3l4V0V4aXhv\nOXJ3a1YxNnZ5bGUyOFdTWFFrV3JCWXJ3PQY7AEZJIgx1c2VyX2lkBjsARmkN\n', '2012-02-20 02:25:55', '2012-02-20 02:26:09'),
(249, '696c2eed5f8c47c2a397d784015ba837', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjEzbFpLS0I3L3lybTc0b2d0WXFT\nOUlVcTlTVGl0ekF0bDNNTEthTTBjQTk0PQY7AEZJIgx1c2VyX2lkBjsARmkN\n', '2012-02-20 19:41:18', '2012-02-20 19:41:56'),
(250, '25494fb880c7c8e2084b47fcd395e859', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFUbHR2TUZpN0ZVc0ZQYk02SDVy\ndGZOZWZHVWN6VVdLLzIyNVdUVm9QWHhBPQY7AEZJIgx1c2VyX2lkBjsARmkH\n', '2012-02-21 03:28:26', '2012-02-21 03:28:38'),
(251, '519c66f3203ff2246b801bc9efd03c6d', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjE5M2ZUZUxDWFNtbGNRMGQ5U2Zp\nVHA1TkRWRnFSSXhsMzU0RUJuNDVKb0FnPQY7AEZJIgx1c2VyX2lkBjsARmkH\n', '2012-02-21 16:16:17', '2012-02-21 16:20:45'),
(252, 'a336cd1fcfc23ba835450566389cb7b1', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFDOVpJaGRLSUpKZlRrcjlmeTN4\nenF2bU96bTZNc2kydzFjK3g3T3MzRWRjPQY7AEZJIgx1c2VyX2lkBjsARmkN\n', '2012-02-21 18:01:29', '2012-02-21 18:01:44'),
(253, '4549b7eaa5efa45383bc18b8814781d9', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFSM3NWQnZCRVJDMGUxL0xuR0xE\nbTBRVjFOWE42ajNPVjhoMUtaSzBnUVRJPQY7AEZJIgx1c2VyX2lkBjsARmkN\n', '2012-02-22 19:16:42', '2012-02-22 19:16:53'),
(254, '819b6627e5470e849f1ba062714ae3f4', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFPVUFiOVJVNys1aWVlT2t2cFVY\nWU1qbTFLdlZCRldwdjZjVkttbCtGUW9vPQY7AEZJIgx1c2VyX2lkBjsARmkG\n', '2012-02-23 01:22:12', '2012-02-23 01:22:33'),
(255, 'ed58fcef3e282491e31d7258847c8958', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjEwbTJxcTM0Y3BTODhhNTVoVHgz\naGVkZnJ0WlJXNHh0OWxGd0ZPZzlTSzRBPQY7AEZJIgx1c2VyX2lkBjsARmkG\n', '2012-02-23 23:02:25', '2012-02-23 23:03:17'),
(256, '09c946c7fd99db2659fb46a60dac8e98', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFURFl6bWpjbWkwZVBJMlo0UkNr\ndFhzMkI1TzBReWE4blBVV0F5T0VUQm9VPQY7AEZJIgx1c2VyX2lkBjsARmkN\n', '2012-02-24 03:07:46', '2012-02-24 03:08:02'),
(257, 'd8930c7e1c70ad40f9d818b93e5225a4', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFFOE9WcDljbXkxZ2U4VlFjZDh3\nQ3kzTFZTY29tM3lxZFpFVUJUK0cwQVZBPQY7AEZJIgx1c2VyX2lkBjsARmkG\n', '2012-02-24 19:25:20', '2012-02-24 19:25:34'),
(258, '331615cb76c0131702de64c7c009950e', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjF6eGVOWk0reGIxVnVLOGlxTm1l\ndG5XeThRbFIxaFhSVVZFcTlOYlE4YlprPQY7AEZJIgx1c2VyX2lkBjsARmkN\n', '2012-02-24 20:38:19', '2012-02-24 20:39:02'),
(259, '3d8b1e3ceb81cd31e0ea8fc71ee042d2', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjEyaERERlN6TFdlTHpvN05KT0Qv\nN0h3UGtZRDJMY3FnYlFwdFdsUUFYV0hBPQY7AEZJIgx1c2VyX2lkBjsARmkN\n', '2012-02-26 18:42:00', '2012-02-26 18:42:09'),
(260, '346643946aaffcd7d4cbcf0ba9c92371', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFIeFpXL1dsL0lEMmRId1NCem91\nTkpwYUdSd25EZnhFTUhSdWdOelZEMk40PQY7AEZJIgx1c2VyX2lkBjsARmkH\n', '2012-02-26 19:21:57', '2012-02-26 19:22:10'),
(262, 'ba4c1df6e4bca33bad6429bb8f350438', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjE1Wm1KdlBOT2wzVmpRQ0NzNTFO\nN2NpWkhVeW8xcHltai96WlVMYmU5cnlVPQY7AEZJIgx1c2VyX2lkBjsARmkH\n', '2012-03-01 00:03:31', '2012-03-01 00:03:53'),
(263, 'b2d94717e15cc036a3aa3b4f1cd9e244', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjE2aHpaU0dnMmlCQmdSRTJCRTJ3\nNUpDSEZIV0JtTzMxczZ4K25WMFE0dmZVPQY7AEZJIgx1c2VyX2lkBjsARmkH\n', '2012-03-01 00:50:39', '2012-03-01 00:50:50'),
(264, '68ee1ac64e1122c5705f0583ac2bdcb5', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFjRTQ3U0dHY0UyZ3grVVFFSmJq\naEpjbzBFYnZ0UWdGTzVkOU53djU5TCswPQY7AEZJIgx1c2VyX2lkBjsARmkH\n', '2012-03-01 00:54:31', '2012-03-01 00:54:41'),
(265, '16fd6e84a2a35bbf55513497e10438ee', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjF5NWZ0aXpOTCtUMk9RT0JvZ2g2\nRUJsZEM3M1pLUENWcU9mSVEwOWlWdXN3PQY7AEZJIgx1c2VyX2lkBjsARmkH\n', '2012-03-01 00:54:47', '2012-03-01 00:56:31'),
(266, '6daff695d92669274cea1c7059650451', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFkTDNuaHBuZnk1Um5MbFZWdk9W\nZUQxSUdkdXFVZ0FydEtIcjVoVUEySFIwPQY7AEZJIgx1c2VyX2lkBjsARmkH\n', '2012-03-01 01:00:23', '2012-03-01 01:00:33'),
(267, '374da402cf96fbd24c366822d1740573', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFiS2dtMEdxY2szRFdaQ2pvQXpG\nWVlRMVdma3NqZ3hLalowajM0bGtzaXRjPQY7AEZJIgx1c2VyX2lkBjsARmkH\n', '2012-03-01 05:01:08', '2012-03-01 05:01:19'),
(268, 'e0e2cf763f768932aecee7b85121ef2f', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFJcTd6NGd2UVlPdTZuRS8wWklq\nSy9KY0JWVFNWejU2MG5NeitEZkUyVXJRPQY7AEZJIgx1c2VyX2lkBjsARmkG\n', '2012-03-01 19:45:35', '2012-03-01 19:45:49'),
(270, '9ce7948d361ad811bdbb66df99e1f98d', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjF5MXRNSlJuUXJTUWpRSDhlV2Jt\nNGM1eFZ6ZERjVTBwTkl2RmthM1UzQW5ZPQY7AEZJIgx1c2VyX2lkBjsARmkH\n', '2012-03-02 21:33:06', '2012-03-04 03:46:10'),
(272, 'a4040786d84fde159b3893c34ffa0ef9', 'BAh7BkkiEF9jc3JmX3Rva2VuBjoGRUZJIjFMMHMwRmZrd0h6Q09yNTdZUHQz\ncHQyVXZNN3NEY0lwOS9taVI3SGwzcGRjPQY7AEY=\n', '2012-03-04 04:38:56', '2012-03-04 04:38:56'),
(273, '332a8d9acc7858e73b5bc5b49354d1bd', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFVZm1TSTlmeDF2VVFmVm0ya0t3\nTldSVEdhQ2NJeTl5a1RXVWRrRzhPMmJrPQY7AEZJIgx1c2VyX2lkBjsARmkG\n', '2012-03-04 06:42:13', '2012-03-04 06:42:43'),
(274, 'af182858ba951b0fdeafdfc0dd99384b', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFRbllPTnU1ejFNZ0tOQXJleWpE\nYWprZ3YzU1c1RHFxYjVmL0VDdVJiakFrPQY7AEZJIgx1c2VyX2lkBjsARmkG\n', '2012-03-05 15:33:03', '2012-03-05 15:33:38'),
(276, 'a2bb79bee5f90ca432e77b286ed58d9d', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjErOEVheDJmaDA3bHZodEZHZkxS\nMGY0SjRQcWJhdDI0RGNwbVRseFFzbkVBPQY7AEZJIgx1c2VyX2lkBjsARmkH\n', '2012-03-05 23:20:09', '2012-03-05 23:21:11'),
(277, '1dec3823b63acd8f3574dd507c0e0d6c', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFjYUg4UmRVcXFQblNHandzK1RS\nYmZseVltTDNCYXdsMGZnYmZXd0dzd01jPQY7AEZJIgx1c2VyX2lkBjsARmkH\n', '2012-03-06 04:29:20', '2012-03-06 04:29:36'),
(278, '579118c353338eab741e5aa7654fd0e1', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFLMVNkMmQ1VU5hbHBwcE1yVTJS\ndEFPRTVWUEZqL0h5Q3hGV0M3TFdienlJPQY7AEZJIgx1c2VyX2lkBjsARmkH\n', '2012-03-06 22:36:06', '2012-03-06 22:36:16'),
(279, '9b4de989c7cb5d6435fd7e178b8b1f82', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFQMkRCWWZ4YzkrMWkyMk50am1a\nUDFMRjhUejFtT1NyaDBFeUN5QVNBSElvPQY7AEZJIgx1c2VyX2lkBjsARmkH\n', '2012-03-06 23:11:24', '2012-03-06 23:11:28'),
(280, 'f589890a86de7c94fcd60a6ab7beeac0', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFSQlJHT1l4YjNQNERhODcydmty\nbVU4cHdjK1AvRU9PYlB0clN2bzdGVjBzPQY7AEZJIgx1c2VyX2lkBjsARmkH\n', '2012-03-08 20:03:42', '2012-03-08 20:03:51');
INSERT INTO `sessions` (`id`, `session_id`, `data`, `created_at`, `updated_at`) VALUES
(281, 'd6f736d28bed2fb7755964eda03d0752', 'BAh7BkkiEF9jc3JmX3Rva2VuBjoGRUZJIjFaVXZmZlJMcDhsbXZ1WHk4akdn\nUFdYcUsrUTlwclhHQmVuTk9CVHdaNVZBPQY7AEY=\n', '2012-03-08 20:20:12', '2012-03-08 20:20:12'),
(282, '0b209b829a56238030852a86efd4fbb4', 'BAh7BkkiEF9jc3JmX3Rva2VuBjoGRUZJIjF2aVYxd1c5amprOU83THF5SjFN\nUU5DN2o5TXYvZnUrbFBJWWRpZTIybSs4PQY7AEY=\n', '2012-03-08 20:20:45', '2012-03-08 20:20:45'),
(283, '441584499be654fe7ac786c4d20f8916', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFvdUhTUlNXK29QcHhrbFdtV202\nWEZHdlJpQnhXL2o5R0M4eG4rSStDbjFNPQY7AEZJIgx1c2VyX2lkBjsARmkH\n', '2012-03-08 20:24:27', '2012-03-08 20:24:35'),
(284, 'df19f1e46d643dc57cde5d3152e1c6ba', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFteitCdk9KeTNib2R6bEJ5b1Zw\neUl2L3UxYmpSSmNRb256UlpMZFdNVng4PQY7AEZJIgx1c2VyX2lkBjsARmkN\n', '2012-03-08 20:54:02', '2012-03-08 20:54:11'),
(285, 'b65348a5a992198787b340605637b78a', 'BAh7BkkiEF9jc3JmX3Rva2VuBjoGRUZJIjFvQzFCalVFb2srazJzdnNzQkRH\nRjhiZ3cvMFRmMUJZT0dDd0ZRVStsWmYwPQY7AEY=\n', '2012-03-08 21:59:22', '2012-03-08 21:59:22'),
(286, 'fadacbf67c69b3343b50a7f763e3bb13', 'BAh7BkkiEF9jc3JmX3Rva2VuBjoGRUZJIjF0MkphZjVwa3hNMzRFRlREZVpH\nQTg3N2IyWVUwTFFrSmpyVjFCNDBTcmpjPQY7AEY=\n', '2012-03-09 02:16:57', '2012-03-09 02:16:57'),
(287, 'f0516459cc7d8827def0d47b8084b1b3', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFLMFNWRi85WmFEaER2OWkyWjcv\nMlpmNllmaFF5TGhIQW5HNFcvVmxUUjZjPQY7AEZJIgx1c2VyX2lkBjsARmkN\n', '2012-03-09 02:17:01', '2012-03-09 02:17:35'),
(288, '4faeed6b3795c382f4a2134d9cd74ed0', 'BAh7BkkiEF9jc3JmX3Rva2VuBjoGRUZJIjFIaGRobTdweWdmeVVFNmlGaDBG\nNGxaZS9TOUtTcVJLSE9GL0grOW5SVGpJPQY7AEY=\n', '2012-03-09 02:31:03', '2012-03-09 02:31:03'),
(289, 'c6b8b3dd695f33471bb28e0ae724c562', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjF4bmVnK0QwcmlMV2RHZ0JCQmVP\nMHpDWW5MU21rckt0U1JKYTFMdzZXTytVPQY7AEZJIgx1c2VyX2lkBjsARmkN\n', '2012-03-09 02:31:19', '2012-03-09 02:31:26'),
(290, '87391770134d4251feac68a6da23c41f', 'BAh7BkkiEF9jc3JmX3Rva2VuBjoGRUZJIjFQclNEeEZ3NVo2VFB4d0d0NTFS\ndE9RQXpPVERVN2tLOUFENnNRREFIeVpBPQY7AEY=\n', '2012-03-09 02:31:29', '2012-03-09 02:31:29'),
(291, '678aab7e4576764b608cb3aa4bc2ce42', 'BAh7BkkiEF9jc3JmX3Rva2VuBjoGRUZJIjFrSGw0RzI3UU9XcUZDNTdpdUhy\nMW5WRjhRcEhsY3NWbHd0RzM0SnlPbHdRPQY7AEY=\n', '2012-03-09 02:32:04', '2012-03-09 02:32:44'),
(294, '8e4da050eb89c66f4cee9b7e4fe0cbbb', 'BAh7BkkiCmZsYXNoBjoGRUZvOiVBY3Rpb25EaXNwYXRjaDo6Rmxhc2g6OkZs\nYXNoSGFzaAk6CkB1c2VkbzoIU2V0BjoKQGhhc2h7ADoMQGNsb3NlZEY6DUBm\nbGFzaGVzewY6C25vdGljZUkiIFlvdSBzdWNjZXNzZnVsbHkgbG9nZ2VkIG91\ndAY7AEY6CUBub3cw\n', '2012-03-10 05:49:52', '2012-03-10 05:49:52'),
(295, '908356432b8dfd2e1ee119540a5d9c56', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFlVU43bHNLNm1rb0ZNZTVnNHVR\ncHltM2JDTkI4YVVhUW55YVRUNU9Gc3NnPQY7AEZJIgx1c2VyX2lkBjsARmkH\n', '2012-03-10 05:49:53', '2012-03-10 05:49:58'),
(296, '6ae1fa1519087860ead96b9c6ed8a1af', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFROC9VTWNKYVA4S1kzQ0dDWEsy\nLzI1UWNaSDN5ZmhzdDBZcUJzZEt2dWFZPQY7AEZJIgx1c2VyX2lkBjsARmkN\n', '2012-03-10 20:48:15', '2012-03-10 20:48:39'),
(297, '23c8ade2ffa5e3a923b9737d1a87d3dc', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFtanlNb2N1Z1cxbkE0NUZvdG1w\nVFB1OVhScWNLdzlXY3ZNeEZWekNCWVc4PQY7AEZJIgx1c2VyX2lkBjsARmkH\n', '2012-03-10 20:56:02', '2012-03-10 20:56:13'),
(299, '1687d96f3d8927041a31b6e262816ccb', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjF4czZXZXJiYU5FRFkvTjJXMStp\nS2JDa0lUdzE4SXdlaHJKa0RlVS9wbVZjPQY7AEZJIgx1c2VyX2lkBjsARmkO\n', '2012-03-11 02:13:16', '2012-03-11 02:16:17'),
(300, 'cf7043b1a1e4844a29adaa5fd26cadc9', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFyTGRhRTlkcGtPYmxnN1ZjUi9s\nQ3ZuNEdMQmIzZ25MZEV2RjFhMUprUFNnPQY7AEZJIgx1c2VyX2lkBjsARmkG\n', '2012-03-11 04:49:48', '2012-03-11 04:52:36'),
(301, '36ca91ffa835060b8af4f0c3a30fe721', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFmNEh0RFFzb3ltYUZmd1hjemla\nYjhzM2FTbUVSWnJVY2tCQ056LzJtNUVvPQY7AEZJIgx1c2VyX2lkBjsARmkG\n', '2012-03-11 16:45:24', '2012-03-11 16:45:33'),
(302, 'b8c0b60e76a33147712f191125180445', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFOZXE5SGVUS21hcWVaZmRabEFB\nUDIyTWhtaHR6WlVCcFJIV1RINlkvNWdvPQY7AEZJIgx1c2VyX2lkBjsARmkO\n', '2012-03-12 23:42:41', '2012-03-12 23:43:02'),
(304, '9915e346525363b3b7f3347b8388dd72', 'BAh7BkkiEF9jc3JmX3Rva2VuBjoGRUZJIjFZU2QzRGNaemU4TFp2Z1lPS3BI\naWU4aWFuNGZCTTNqTkhQcHBVa2VNeWFNPQY7AEY=\n', '2012-03-13 00:01:24', '2012-03-13 00:01:25'),
(305, '36794de16ee5dee63896e3ef50c601a9', 'BAh7BkkiEF9jc3JmX3Rva2VuBjoGRUZJIjExNDZFZ0pvbUtBUHcvZDhpMThS\nM3FvY1J3RlJmOXJlWHpmMGFLdnh2NUtNPQY7AEY=\n', '2012-03-13 18:54:27', '2012-03-13 18:54:27'),
(306, 'ae913f80d4b53ca989d83d0f8994ba3b', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFySE5yU2VpUWs3WlVKRFJpR3Fi\nRk10dXQxUGtwTE1iTWxjaDlqVkgzNHU4PQY7AEZJIgx1c2VyX2lkBjsARmkG\n', '2012-03-13 18:54:49', '2012-03-13 19:14:26'),
(310, '16513d1629ddee1481581f163069d6de', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFFT2FHVHlpOVd0YjhnR1ZGVWtC\nMWEyUlp5YjVEbUdjL0pLeHdHdUVsUHM0PQY7AEZJIgx1c2VyX2lkBjsARmkN\n', '2012-03-14 04:58:47', '2012-03-14 04:58:59'),
(311, '078b8235d790e84e0fc957ea9325f558', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFDRktNZGhCZmMyWXdHL1Ftelkr\nVEd4enFPcmQ0OXQ2L0t6dkxvNDE3Qmp3PQY7AEZJIgx1c2VyX2lkBjsARmkN\n', '2012-03-15 01:54:19', '2012-03-15 01:54:25'),
(312, '2238310b9abcbf962d9164efab5f3475', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFCZytqbDNMQmRSYTdwMGpwMmZN\nYzhiajhPdmlKUGZRdzlrS3Z0bDN5RGxrPQY7AEZJIgx1c2VyX2lkBjsARmkO\n', '2012-03-15 01:57:24', '2012-03-15 01:57:46'),
(313, 'a7c40fdbbb9d4dc9fb3392e19869e919', 'BAh7BkkiEF9jc3JmX3Rva2VuBjoGRUZJIjFSYmlOanVza3VwY2poWDZDdUFr\nVldaTEdlWFVua1F1dThEZXczTVdCN0xNPQY7AEY=\n', '2012-03-16 02:01:51', '2012-03-16 02:01:51'),
(314, '8495cb1b5142bcd7d14973c841877b7d', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjE0N0FiU2ZuT2pHT3pzZDNSSTRU\nVjhOYzE4aUdpWjhRajcyUXhSVHAyUEZnPQY7AEZJIgx1c2VyX2lkBjsARmkO\n', '2012-03-16 02:02:35', '2012-03-16 02:06:26'),
(315, '9e979159445451eff91a2772bc062fb9', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFOYWxINFgrblVIZFRQelo4NVkz\nTWlvQlpBTUZzckR2NjNySGRxTkpHMjBzPQY7AEZJIgx1c2VyX2lkBjsARmkG\n', '2012-03-16 21:05:16', '2012-03-16 21:05:40'),
(316, '9c9a75d61652406a4c0f20bc7e9b265a', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjF0WTNBaGFPL3lwbzdBYW8zVWFV\ncnlOK3B5ZEZFVGZRYWErY2NrbnlCdFY0PQY7AEZJIgx1c2VyX2lkBjsARmkH\n', '2012-03-17 01:54:51', '2012-03-17 01:55:25'),
(317, '52d5ff6c0f5e69e1aad1d65bbd4e2f60', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFNcktlZXNTd0hXUFVhSTdjZXVr\nc1hxWTRqdHk2QUtzTCtZQlZVcWltYUxjPQY7AEZJIgx1c2VyX2lkBjsARmkH\n', '2012-03-17 01:58:00', '2012-03-17 01:58:10'),
(318, 'ef03301cd2553a07cc4907d038ba9b41', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFDU0h5NTJkY1JTUmVzMURiMnNh\nM0hpNlBZZWV3aGxpMEN1YWk1eEtQdk93PQY7AEZJIgx1c2VyX2lkBjsARmkG\n', '2012-03-17 02:10:04', '2012-03-17 02:10:28'),
(319, '3fa0a20ff126b97a17709cfb270ee9b8', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFrbHoyQWZKNmk5RXFwdG82RW1O\nYjl1L0hWRmRpRVU5ZjBjeXNmSlp5R0djPQY7AEZJIgx1c2VyX2lkBjsARmkG\n', '2012-03-17 19:29:19', '2012-03-18 06:37:22'),
(320, '30b222dfa85da9949c918caee2395187', 'BAh7BkkiEF9jc3JmX3Rva2VuBjoGRUZJIjFIMnJyY1ZrQktVZGZvVUczNWp4\nTHVkMjVZTFJZTjRHelB2cHFmTll1aU5VPQY7AEY=\n', '2012-03-18 01:31:24', '2012-03-18 01:31:24'),
(322, '4b3184bd2b9624763c86280123c68ee6', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFubXVxdzNlMkZPMGEzNGhMbStU\naDFCdUgwcEZsNjkrWEhXaTVvRjBpUUhnPQY7AEZJIgx1c2VyX2lkBjsARmkG\n', '2012-03-18 01:39:02', '2012-03-18 03:38:44'),
(323, 'e09788bfa5be3ed931f8c7aebee4b981', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFvakVjYkNOMk14SXhRcEtvM0lq\nUFZZTWFteitNSW45cHdlN2ZQYzM1ZGFRPQY7AEZJIgx1c2VyX2lkBjsARmkH\n', '2012-03-19 03:39:13', '2012-03-19 03:39:23'),
(324, 'a1fd883b5a6852f7f67fa2404c548a79', 'BAh7BkkiEF9jc3JmX3Rva2VuBjoGRUZJIjEvd1lPS2c5b2RsQXN5Wnd5V2N3\nWG1JRkhTNTluZmp0cHJiTmY0RFZaS004PQY7AEY=\n', '2012-03-20 07:09:39', '2012-03-20 07:09:39'),
(325, '144c7f06b2658c624f02cd35c9fecb31', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFFY1M4RmlzcWhBVFFWNkU4OHNq\nYTBUUEJxb2pRbm4rcURueG9WY2d2TDFvPQY7AEZJIgx1c2VyX2lkBjsARmkN\n', '2012-03-22 22:46:40', '2012-03-23 04:33:15'),
(326, 'b21d9dd85f531963b22c30b1992ffa41', 'BAh7BkkiCmZsYXNoBjoGRUZvOiVBY3Rpb25EaXNwYXRjaDo6Rmxhc2g6OkZs\nYXNoSGFzaAk6CkB1c2VkbzoIU2V0BjoKQGhhc2h7ADoMQGNsb3NlZEY6DUBm\nbGFzaGVzewY6C25vdGljZUkiHlBsZWFzZSBsb2cgaW4gdG8gY29udGludWUG\nOwBGOglAbm93MA==\n', '2012-03-23 07:44:34', '2012-03-23 07:44:34'),
(328, '81a08dc6ffc12637f584a2efef812470', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFvM2d5K2R0amE3M3dJY2tobmRh\nSXJkRmZQZHA5aFVydVk1Ui9sTWhXNGNFPQY7AEZJIgx1c2VyX2lkBjsARmkG\n', '2012-03-23 14:44:39', '2012-03-23 14:44:55'),
(329, 'ca5dcf6cffa49f5d1a74c6f8f53ed577', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFxblJ0SlVlT0FsS0piMENKVDJU\nZmJDYUtlTjM5aEJBa2dmMWc3dHJQTTRvPQY7AEZJIgx1c2VyX2lkBjsARmkG\n', '2012-03-24 03:17:00', '2012-03-24 07:38:34'),
(330, '405c2861a33b224159a98907bc188e26', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjE3ZEhOc1NicmZKQzBTQlNtaU16\nMjFvTXdXZ3dWQUNzWXdwRGhxTlhpL1BnPQY7AEZJIgx1c2VyX2lkBjsARmkH\n', '2012-03-24 08:14:29', '2012-03-24 08:14:53'),
(340, '6b9332509410f097afd5d72b5d64cffa', 'BAh7AA==\n', '2012-03-25 03:27:36', '2012-03-25 03:27:36'),
(347, 'b78d6347bd0d4acadcb3430e1caa9610', 'BAh7AA==\n', '2012-03-25 03:27:39', '2012-03-25 03:27:39'),
(348, 'f3c8de74ff158cda5a5a38307a2fa3d0', 'BAh7AA==\n', '2012-03-25 03:27:40', '2012-03-25 03:27:40'),
(349, '5e601003c5165d5faf41a61cb2fdf786', 'BAh7AA==\n', '2012-03-25 03:27:40', '2012-03-25 03:27:40'),
(350, '650c66c4593f924e4012bd44b21b8a98', 'BAh7AA==\n', '2012-03-25 03:27:41', '2012-03-25 03:27:41'),
(357, 'f329080f4954d494aebf0f7244325b71', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjE2aXVvOWJOZ0hNUVA0QkllQzRV\nSlFqY0hITnJacGlIUjQvWXBNZUNkTGlzPQY7AEZJIgx1c2VyX2lkBjsARmkG\n', '2012-03-25 04:19:21', '2012-03-25 04:20:24'),
(358, '9325dbfbf68b71df4363a681a6421258', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFiempzTytZV01VTi9GRHF6bWZX\nY2FWa2syZ3JwV2NPcks5a0FzWTdPdDNNPQY7AEZJIgx1c2VyX2lkBjsARmkO\n', '2012-03-26 04:08:57', '2012-03-26 04:09:05'),
(360, '407dd1aa8579de12d772bae408980109', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFQVjVDUmM3b1lVUXJlajBiNzRG\nWDJYTUMycStrMGdHeVRJVlhtbWtxaDJjPQY7AEZJIgx1c2VyX2lkBjsARmkH\n', '2012-03-26 20:41:33', '2012-03-26 20:43:53'),
(361, 'e9e9fcee17839ab48fb044a688f29432', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFza3RJWVF4aVpYSUxJYnlodFFq\nZVlJcktBczFrNjhFdVUreWVrVTNBL0djPQY7AEZJIgx1c2VyX2lkBjsARmkG\n', '2012-03-27 01:42:17', '2012-03-27 01:42:42'),
(362, '9dac51c6e00ee5a9c5b788dc610c1c16', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjEzWEc5TzRzYlZ6N1owcjJQejRS\nTmFTYzdjOHROYjBmWkVtbElqK3drREdvPQY7AEZJIgx1c2VyX2lkBjsARmkH\n', '2012-03-28 08:23:26', '2012-03-28 08:25:20'),
(364, 'fedda84563bab0b84bf970946129f903', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFqbE92eGJRMkpqeU5VNUtxMWdP\naDU0bjF6ZlpleDhMZnVoR0R3OGhkNml3PQY7AEZJIgx1c2VyX2lkBjsARmkH\n', '2012-03-29 00:22:27', '2012-03-29 00:22:41'),
(365, 'e676e5031f142954a4881a415ef72d95', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFEQkNOeXFtNE9FQlQ1d015elJr\ndXdBUFlBaFY4dUY2NE4raUkzR3dqUFFzPQY7AEZJIgx1c2VyX2lkBjsARmkH\n', '2012-03-29 00:24:25', '2012-03-29 00:24:32'),
(366, '188dffee5262d501080d940c7cea02ea', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFuQ0ZyN21QbGthcm9WSUlsaWp6\nbVJPUUpjQVJnbjRERWU1UWdzTDdEYTNjPQY7AEZJIgx1c2VyX2lkBjsARmkH\n', '2012-03-29 00:26:28', '2012-03-29 00:26:34'),
(367, '1e1fcabaaaa7ca27e58d15a0802d1d86', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFEYzlKM2xPTmpNeEZOcE9tREZK\nbHJZdzVHRHNCek1kY3VOb0k2R0xNakVjPQY7AEZJIgx1c2VyX2lkBjsARmkH\n', '2012-03-29 00:27:39', '2012-03-29 00:28:04'),
(369, 'd074bcf66ade8a0aad49da32a8e728a5', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFkRkVFTGwvMXVlMEpuTWtHZzVn\nK2N1Q2d6SGhZRUFGbVR5eXNiNnp4Ykt3PQY7AEZJIgx1c2VyX2lkBjsARmkH\n', '2012-03-29 21:08:20', '2012-03-29 21:37:40'),
(370, '02fca19da8d3c8b1eff1ec72e10ff9e8', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFCM3ZrNTJYc3JYU2VreWd4ZlJ3\nS2hvM2VmalZUUnFqN1dzaFZBc3lTR2tnPQY7AEZJIgx1c2VyX2lkBjsARmkH\n', '2012-03-30 19:25:15', '2012-03-30 19:25:41'),
(371, '5a4c4a1031f3d798b24e5899b50ebb65', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFWaUlxVG5OMHBJYzhKMWUzRjho\nWEJ4QTFtVm9uTm5Kdkd5a0JjQ0JMWldjPQY7AEZJIgx1c2VyX2lkBjsARmkH\n', '2012-03-30 19:51:23', '2012-03-30 19:51:31'),
(372, '4f936de0db70f72f66ec05d57ff25dc2', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFUUzNRMlYwd1pLWW03ZHc0d083\nbE9vcXdEdFpkV3QydW9NT2w3MHNpcHVVPQY7AEZJIgx1c2VyX2lkBjsARmkG\n', '2012-03-30 21:28:48', '2012-03-30 21:29:24'),
(373, 'dff01fb4a56ed04a113ae446dbd54e88', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFpUkZJdkZ5dlhQalRYUjYxYTRu\nSVp6RWlZcnJseWhzM1owN1lBdTRNT2FrPQY7AEZJIgx1c2VyX2lkBjsARmkH\n', '2012-03-30 21:31:55', '2012-03-30 21:32:59'),
(374, '03b35d8b5f4f18e4a8927762e1c6c91a', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFhdEFDQlg1MXpqaHNaeGk4bDBw\nQ3BZQklWNEtwZFFFMXR3U3JnK3p5ajZJPQY7AEZJIgx1c2VyX2lkBjsARmkH\n', '2012-03-31 04:19:23', '2012-03-31 04:21:19'),
(375, '1f8607c661008dddc7fd7914b09d0db1', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjE0Z2NIMnBTd3N0RWUwUlg1c2ps\nb2Nra0pYeEdJQ0YyRTlvdk5kZlhPNWk4PQY7AEZJIgx1c2VyX2lkBjsARmkH\n', '2012-03-31 06:09:34', '2012-03-31 07:06:56'),
(376, 'b9fb73030ed3de76ea19419332ff0294', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFsTXYxTUlaTGhkYXZ1czVuWXRP\neWxiUkNLK1piRVFyY1JPcXBYa3AyNVdRPQY7AEZJIgx1c2VyX2lkBjsARmkH\n', '2012-03-31 06:11:57', '2012-03-31 06:14:51'),
(377, 'c5dcc748cb1a742d03e1cb339c155510', 'BAh7BkkiEF9jc3JmX3Rva2VuBjoGRUZJIjFUcXZadXZiSGRiNFZoaUNxd2sx\nLzBaamd2NS9zRXQ2U1FiRkRIdmV4WDFBPQY7AEY=\n', '2012-03-31 06:17:31', '2012-03-31 06:17:31'),
(378, 'bff48de4708ca520791ea471abcd86de', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjE2cjg1c3JLSEVKOFluNUZOeDJp\nMVkxRHY5dStlVzRnQ1JaT3VDNVhDR2VjPQY7AEZJIgx1c2VyX2lkBjsARmkH\n', '2012-03-31 07:20:47', '2012-03-31 07:20:51'),
(379, 'a2d8bdbc155b5b98ba9ebc8bac4a9fc3', 'BAh7BkkiEF9jc3JmX3Rva2VuBjoGRUZJIjE2dHhuU1FKNTBRSFpVdFRxMFl2\nSFJDb2pNVUlJVk1iVjQxVGQxUEFaR2MwPQY7AEY=\n', '2012-03-31 20:56:26', '2012-03-31 20:56:26'),
(381, '90fa20463159c1dae9fbf9b7c0d79d0b', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFzQzZBQUhCQjlTTHdzUTM0Y3R0\nWUNjeFBIUnBvOUNDWkUwVTFPY1lPc2xvPQY7AEZJIgx1c2VyX2lkBjsARmkH\n', '2012-03-31 21:40:59', '2012-03-31 21:41:05'),
(382, '1ceed67f26e489be10f1a16236f3e121', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjE4MjV4anUwWmx2cXdFaVl5NFVQ\nemkwZG5CWWVwQy9tei9uc0U5MW1kZi9nPQY7AEZJIgx1c2VyX2lkBjsARmkH\n', '2012-04-01 00:55:57', '2012-04-01 00:56:02'),
(383, 'f1093bee735c93333bb3fccfeb8e7410', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFxMjk3cXFmVDQwU2xlbXBQYUQ4\nNVJEdXRGK3cvN2paQitrZmtGNTAvOElZPQY7AEZJIgx1c2VyX2lkBjsARmkH\n', '2012-04-01 01:36:00', '2012-04-01 01:36:13'),
(384, 'f92ee116391c8b43bf4c33b09fa36906', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFCRkF0NUpOT0NTbVB1a1VjZFVY\nMk9acWdtakVGZnZ2N3grSW9jejNvNjRzPQY7AEZJIgx1c2VyX2lkBjsARmkH\n', '2012-04-01 01:37:04', '2012-04-01 01:38:07'),
(385, '06736620508fc33499f985d6ecf7f14b', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFDb3Brc0EyVE5YeWg4TFVDeS9D\naStJWnFqbHJoN2hZRE1DNW5jdXRGZ0RrPQY7AEZJIgx1c2VyX2lkBjsARmkG\n', '2012-04-01 06:49:19', '2012-04-01 06:50:10'),
(389, '590e2e9df3b8c880cbd3fe4a674cab81', 'BAh7AA==\n', '2012-04-02 05:18:43', '2012-04-02 05:18:43'),
(391, 'b06b449b75870ec60c2543af6b825c24', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFqc3Y3Vm5Ma3VQaytLcGJwU25k\nVGNDWWpaaTMrK0ZvWVF5L1RJRjNXejZFPQY7AEZJIgx1c2VyX2lkBjsARmkN\n', '2012-04-02 05:21:32', '2012-04-02 05:21:54'),
(392, 'edf01f334f45217b1deca27db7e3e5e5', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjE1RXhOZFY0cncwNHFQek9WVmxa\nMEVPbEprZ052aDRmNld2TVJDT0dzNm9NPQY7AEZJIgx1c2VyX2lkBjsARmkN\n', '2012-04-03 01:40:51', '2012-04-03 01:40:55'),
(396, '5cf45183d41b12631f616b46266c699d', 'BAh7AA==\n', '2012-04-03 03:03:02', '2012-04-03 03:03:02'),
(397, '0cd34e4a642c8deb5dddf5f48a56a794', 'BAh7AA==\n', '2012-04-03 03:03:13', '2012-04-03 03:03:13'),
(399, 'c081277d0240d0fd2b4a4438c3866587', 'BAh7AA==\n', '2012-04-03 03:05:56', '2012-04-03 03:05:56'),
(400, '127e5f2f4fdcf95a2f665163e6786b5f', 'BAh7AA==\n', '2012-04-03 03:05:56', '2012-04-03 03:05:56'),
(401, '05532c5292bee4eed50f87e8abdd0b09', 'BAh7AA==\n', '2012-04-03 03:05:57', '2012-04-03 03:05:57'),
(402, 'f1299683857220cbbae1a5ed20571451', 'BAh7AA==\n', '2012-04-03 03:05:57', '2012-04-03 03:05:57'),
(403, '4a9996177fa25cd26a11c59903c1a452', 'BAh7AA==\n', '2012-04-03 03:05:58', '2012-04-03 03:05:58'),
(404, '373c5946677057195b2b07968fff5193', 'BAh7AA==\n', '2012-04-03 03:05:58', '2012-04-03 03:05:58'),
(405, '312a3e12bed415d782cf320e05e3cfc4', 'BAh7AA==\n', '2012-04-03 03:05:58', '2012-04-03 03:05:58'),
(406, 'bf4e9def20a85607ede150498c68a607', 'BAh7AA==\n', '2012-04-03 03:05:59', '2012-04-03 03:05:59'),
(407, '3f6bf5a43215275f32a5551e4ab3d618', 'BAh7AA==\n', '2012-04-03 03:05:59', '2012-04-03 03:05:59'),
(408, '8622240575ea094802c26b886e1db1cc', 'BAh7AA==\n', '2012-04-03 03:05:59', '2012-04-03 03:05:59'),
(409, 'd419a16d5ce0e2b99bcf0f07e14b3ffb', 'BAh7AA==\n', '2012-04-03 03:06:00', '2012-04-03 03:06:00'),
(410, '1f32998496e4c673dbab8346d832c267', 'BAh7AA==\n', '2012-04-03 03:06:00', '2012-04-03 03:06:00'),
(411, '029850825b0b4f4818230f31290ab8a3', 'BAh7AA==\n', '2012-04-03 03:06:01', '2012-04-03 03:06:01'),
(412, '07f55af5ab33627dd672ba9aae7cdb84', 'BAh7AA==\n', '2012-04-03 03:06:01', '2012-04-03 03:06:01'),
(413, 'ddb1eaafe6229b8a1a46ff5e266758ae', 'BAh7AA==\n', '2012-04-03 03:06:02', '2012-04-03 03:06:02'),
(414, 'd4eea718775b8871065b2e9ded60b180', 'BAh7AA==\n', '2012-04-03 03:06:02', '2012-04-03 03:06:02'),
(415, 'd2fc2a67e9f440882f445007fbf8674f', 'BAh7AA==\n', '2012-04-03 03:06:02', '2012-04-03 03:06:02'),
(416, 'fd83a48eab311de2b83dd4b9835608d5', 'BAh7AA==\n', '2012-04-03 03:06:03', '2012-04-03 03:06:03'),
(417, '4403203d5367bcdb8016228f3a5f3510', 'BAh7AA==\n', '2012-04-03 03:06:03', '2012-04-03 03:06:03'),
(418, '3b9cbfff58c9f89f22c20772e0f4b85b', 'BAh7AA==\n', '2012-04-03 03:06:03', '2012-04-03 03:06:03'),
(419, '6275e1b1bc301b27b451bb7328b71bee', 'BAh7AA==\n', '2012-04-03 03:06:04', '2012-04-03 03:06:04'),
(420, '5dd28aaa6e3cde6f9e133f84766a2f6d', 'BAh7AA==\n', '2012-04-03 03:06:04', '2012-04-03 03:06:04'),
(421, '382c4c5ff34b20a480c213be4dd17947', 'BAh7AA==\n', '2012-04-03 03:06:05', '2012-04-03 03:06:05'),
(422, 'e438fb3ae8d35b2e1b6eabd9390478dc', 'BAh7AA==\n', '2012-04-03 03:06:05', '2012-04-03 03:06:05'),
(423, 'eed7431611fe9f195d923d87780c61c3', 'BAh7AA==\n', '2012-04-03 03:06:11', '2012-04-03 03:06:11'),
(424, 'f7821f5fc7893eecfe4a8a8dc71819c3', 'BAh7AA==\n', '2012-04-03 03:06:11', '2012-04-03 03:06:11'),
(425, 'f4ea1abe3a25855c803d31d784b6dab8', 'BAh7AA==\n', '2012-04-03 03:06:17', '2012-04-03 03:06:17'),
(426, 'b428370da1dd7811bdad227f071c3a45', 'BAh7AA==\n', '2012-04-03 03:06:17', '2012-04-03 03:06:17'),
(428, '4af1f74b83e976d8c3ef797436d7d242', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjF0Rjh2S21QY014dGVFS1BlaU84\nM2FRTHk5eFZlenFKZVhZK081WWN6OWRzPQY7AEZJIgx1c2VyX2lkBjsARmkN\n', '2012-04-03 03:22:09', '2012-04-03 03:22:14'),
(429, '09162cca72ad0a65c943d917aca6c771', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFsRlNJTmlEYW1uY3UwdnRZMk1q\nV2ZKZm54MVBxVkhVN1lxNG4yT1BTRFNFPQY7AEZJIgx1c2VyX2lkBjsARmkN\n', '2012-04-03 06:33:20', '2012-04-03 06:33:31'),
(430, '9b86bed4907ba3db0236b638166206cc', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFJb3BMR3BjVFByWjVTcWtRTEhS\ncTg0MkdsTy9qMU5XbmI3WDZvY00zY3VJPQY7AEZJIgx1c2VyX2lkBjsARmkN\n', '2012-04-03 20:52:12', '2012-04-03 20:52:17'),
(431, 'f2552e0852dccd2eb838206d89f2580f', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFIbW5GaHJBRENnVWR2SVlzUkg2\nZXlxQk9vNndCd3pza2NObUNFRTZpamZFPQY7AEZJIgx1c2VyX2lkBjsARmkH\n', '2012-04-03 21:33:32', '2012-04-03 21:33:50'),
(432, '7e22a1af8bb05201e36939c11e131ed8', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFGUUJNZ0ZkNTI3V094b0tETEVV\nbHdxRzZtcGloU1NuS21RaGNjc3dSbE1JPQY7AEZJIgx1c2VyX2lkBjsARmkH\n', '2012-04-03 21:34:08', '2012-04-03 21:34:12'),
(433, '901f9cf3506f23ccb400b8d88f6f6299', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFVb2RKWmYvR1NhRkF1WHc4OSth\nNWRyTi9KQkZQbTNuWkQzM2dQaS9ueU5FPQY7AEZJIgx1c2VyX2lkBjsARmkH\n', '2012-04-03 21:37:28', '2012-04-03 21:37:31'),
(434, '3395eb250d4b74df0e7591951a936925', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjF1QmFjMUpsNGlTcEF0RXp0anVl\nYmpSY1poRnJVN1Z2WHI2RDRDZlJ2SWZFPQY7AEZJIgx1c2VyX2lkBjsARmkN\n', '2012-04-04 00:56:46', '2012-04-04 00:56:51'),
(436, 'a79059b2a9ba9ed56881f63d6809b9f2', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFEVm5CaWNmbWpzMkdhNjRUUExj\nMUlKZ2J2MUxHc01UTGh0VEtoOE04c2lFPQY7AEZJIgx1c2VyX2lkBjsARmkH\n', '2012-04-04 06:11:23', '2012-04-04 06:12:16'),
(437, '72973fadfc7853396498a09a06a79c5a', 'BAh7BkkiEF9jc3JmX3Rva2VuBjoGRUZJIjF2T2M4cDg3MnBUY3JEYWJ4ME1L\nTU5kUjdEcDlGZzlhSEpwUFE3RlpLNmlnPQY7AEY=\n', '2012-04-04 06:15:53', '2012-04-04 06:15:59'),
(438, '255097f12596fdfc9f18e86e04917329', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFzL0cvUEJJZXp5dGl5NXAvbkpz\nSVpiSGp0djJOT1lGTTNXdnJRWlpXeXdNPQY7AEZJIgx1c2VyX2lkBjsARmkG\n', '2012-04-04 20:57:10', '2012-04-04 20:57:31'),
(439, '307b8f33fa23416bf94ecdb3a1a75bbe', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFLcVVBRitHakZtZ1IzTXh2TllK\nSEZkcEZOejVPeWtzalRlK0pqZnBNZXpnPQY7AEZJIgx1c2VyX2lkBjsARmkH\n', '2012-04-04 21:41:39', '2012-04-04 21:41:44'),
(440, 'dca24c7a3fc3bfc8eeb2a617c23b2108', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFtVndXRlg3R0RydUtIVzVLNDhy\neW1mU1V0dHMwMzY1bk5QZXJnMTFHa0NJPQY7AEZJIgx1c2VyX2lkBjsARmkH\n', '2012-04-05 02:46:50', '2012-04-05 02:47:23'),
(441, 'af1b2c8ad06e862d4e2f58cb0ca3867b', 'BAh7AA==\n', '2012-04-05 03:12:55', '2012-04-05 03:12:55'),
(442, '9deba8becefbabcb4ee8cc3d1d2aba52', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjEwUnAwbTZFRGNkU3JDU3c1V1A5\nZ1dNMFp0bUFaVGhHRWxCSndnRWQxUkFNPQY7AEZJIgx1c2VyX2lkBjsARmkH\n', '2012-04-05 04:09:26', '2012-04-05 04:09:34'),
(443, '7d4b5828d878d940c554cf95184be078', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjF5elRIYTBZV3pVN0pJeVBtYlNY\nNmVUQTFEb0VqQ2pLSld2cFlKaHczOWZvPQY7AEZJIgx1c2VyX2lkBjsARmkH\n', '2012-04-05 06:37:25', '2012-04-05 06:37:47'),
(444, '0ff93273833f5d342f5f8ef0de6440c8', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjE3ZWVsWjJTemN0SXVORzdrQW1v\nWS9IVGp1eGoyYVg1YzNwaFZNN3ZHWm9JPQY7AEZJIgx1c2VyX2lkBjsARmkH\n', '2012-04-05 06:37:27', '2012-04-05 06:38:05'),
(445, '984105a68b54f7b7df6b61326ada2450', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjE0OVZYOTJhRzAwWW1tQVFaVXk1\nZ2lGZU5saVhtTzR3bUh2OEZlWUdtL3c4PQY7AEZJIgx1c2VyX2lkBjsARmkH\n', '2012-04-05 06:37:34', '2012-04-05 06:38:10'),
(446, '78a514629d50e379bb30ba5197276fee', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjEvdCtoWFR1NkhGQk8vVFhTVDR0\ndHVRNUtRL1NuUzVzOVFaM1ErNkJZbUJVPQY7AEZJIgx1c2VyX2lkBjsARmkH\n', '2012-04-05 06:41:40', '2012-04-05 06:41:55'),
(447, 'c9712f8d61f81321e30893f64907afce', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFVekZVRUFZZkxTaWtGd0VNTDZ1\nSmR4dC9CakZRMlNNbWtGK1NVMXpSY3I0PQY7AEZJIgx1c2VyX2lkBjsARmkG\n', '2012-04-05 22:03:23', '2012-04-05 22:03:44'),
(448, '7c4ec89440ea3d5981d67e4baab4187c', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFCc0FBTU0ycmpiU2tUdWQySEJy\ndFZwbGdzVjBIQllJMkZjZ2Vkb21Pa1N3PQY7AEZJIgx1c2VyX2lkBjsARmkH\n', '2012-04-07 04:56:26', '2012-04-07 05:03:29'),
(449, 'ad11a63c6cc2e61a43f220d3779a7c76', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFISnl5dWxCZDJHSnZ1aWhjNDNV\nb2JPTy9JWHYvNGRmdlZxcnZjQVk1aHNFPQY7AEZJIgx1c2VyX2lkBjsARmkH\n', '2012-04-07 18:18:39', '2012-04-07 18:18:46'),
(450, 'dcb4a37afe2bae958bdbc50e94a474e8', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjE5bmRaWjhTWHRpN2tSOEtMbDBn\naEF2bXdZaHRwWXdHSFRjbTh4MjI2bmxjPQY7AEZJIgx1c2VyX2lkBjsARmkG\n', '2012-04-08 23:14:26', '2012-04-08 23:14:51'),
(451, 'f7ec00ef47467efecce55e8264fa3892', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFKWDA1cmtxOFkxTVVXRDlIOFRM\nelJyT0pOaTJJRXU1U2xCTzczSnFPRTRNPQY7AEZJIgx1c2VyX2lkBjsARmkH\n', '2012-04-11 06:41:00', '2012-04-11 06:41:12'),
(452, 'f7fe0f57d868738a888c611adade99cb', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFzQXpKK2pmUjNGazNTeGxTTkV3\nRXZpTVpmNTgrRkdmR2M4NVJoRlN4TkRzPQY7AEZJIgx1c2VyX2lkBjsARmkH\n', '2012-04-11 19:35:04', '2012-04-11 19:35:14'),
(453, '3280ac35a8970efb8e1c00ae1e876cde', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFsMnJEUjAwRk5uRXMrRjVBRW9m\nMnpRNEExazJYNkpWZXlQNi9qeVNFRk5zPQY7AEZJIgx1c2VyX2lkBjsARmkH\n', '2012-04-11 19:35:23', '2012-04-11 19:37:18'),
(454, '77596eef691ffccf6164686a5b84e9d6', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFXK0FmOVhHVm13OVUxa2lXSlRx\nV25IbHUyYk10WG5BNUxDYWxvTlhxYXNvPQY7AEZJIgx1c2VyX2lkBjsARmkH\n', '2012-04-11 19:37:04', '2012-04-11 19:37:28'),
(455, 'd7e8e692d06d3b9a84e5d58a61c43855', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjE2WUZZTFhuOHlPU1c3Z1FmRGQr\nYW9aNVNQQktIMnpaZCt1a3NuK3E5MDhVPQY7AEZJIgx1c2VyX2lkBjsARmkH\n', '2012-04-12 06:44:51', '2012-04-12 06:45:04'),
(456, 'd02ef4b61c05c01c068996fb8ed41a80', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFHbmNDNU1zRkNOczVWOWNMMVVm\nYmwwZUNpaXJGS0ZqZlVnZjFNclpQREdRPQY7AEZJIgx1c2VyX2lkBjsARmkH\n', '2012-04-12 17:13:52', '2012-04-12 17:42:40'),
(459, '850d7a015e7587c414205f4586b9f89b', 'BAh7BkkiEF9jc3JmX3Rva2VuBjoGRUZJIjFYOE00V25lVmFpQnRyaHNzZ0l0\nbVZNU1phZHA1QkUvZEl2Um5MOTA4NWZRPQY7AEY=\n', '2012-04-13 07:49:57', '2012-04-13 07:49:57'),
(460, 'a18e0346666c91b12472ba8aaa041947', 'BAh7BkkiEF9jc3JmX3Rva2VuBjoGRUZJIjFoU0cvbStNWFlHVGRZdzhLV1N5\nNVlrbm9uSUtpRFJGWmVPMExpckVweFdzPQY7AEY=\n', '2012-04-13 07:55:09', '2012-04-13 07:55:09'),
(461, 'b172e64f3e40f0dd9a5dffd3b387e764', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFQeFNoVmJJVTBsU09UMEkwVHlT\neTFmd0xpVll2MHFmRXdHUDZNRC9sdE9vPQY7AEZJIgx1c2VyX2lkBjsARmkN\n', '2012-04-14 01:06:22', '2012-04-14 01:06:29'),
(463, '6caeca21a1976a226eea045e36ee88d7', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjEwdWNCR3BlQ0pqR2FEQzlZbnJY\namQwWUhENHZSN0ZPb01QU0xTZzFIS1FrPQY7AEZJIgx1c2VyX2lkBjsARmkO\n', '2012-04-14 04:09:26', '2012-04-14 04:09:33'),
(464, 'd7eb42be6c385cba5554685a96e25bb5', 'BAh7BkkiEF9jc3JmX3Rva2VuBjoGRUZJIjFsQXhVT0hHRFhHcUZmT2luOXdC\nU2JlR3czUzZXMEZuOHdEcFlCRlJ2Nnl3PQY7AEY=\n', '2012-04-14 04:35:26', '2012-04-14 04:35:26'),
(465, '9ce5a185d7b51172cafd324f127a2627', 'BAh7BkkiEF9jc3JmX3Rva2VuBjoGRUZJIjFEWkFzWHc4U3ZpOGc5YTFEK1N1\nQUJ0SkxDaHQrL0xnWXpiZWtibngvSWdRPQY7AEY=\n', '2012-04-14 04:35:30', '2012-04-14 04:35:30'),
(466, '4031070d0901e18555e7c9afee5149f9', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjE3SHhGSGZZNTRvNkNDTzVhZ29B\nS0VsaGhqUWs1MnNOTXRFNm5zTUN6YlpNPQY7AEZJIgx1c2VyX2lkBjsARmkN\n', '2012-04-14 04:39:10', '2012-04-14 04:39:53'),
(467, '730a2ae5d997b1194b71d529c534dc0a', 'BAh7BkkiEF9jc3JmX3Rva2VuBjoGRUZJIjFkbVJhV0h0UlJrUHpyK3hsVEdK\naURyVVNWekNDMFlZek93U3F3anhub1JnPQY7AEY=\n', '2012-04-14 04:39:46', '2012-04-14 04:39:46'),
(468, '05618cf213c6f869b6d8e2e1533a12e8', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjF6T0VHUXl5VFk2cUx1OTRhSkg3\nQkV6TWlHL0FNcFd6UmpDeGNwTHlEVWQ4PQY7AEZJIgx1c2VyX2lkBjsARmkH\n', '2012-04-14 09:25:09', '2012-04-14 09:25:13'),
(469, 'fb7218fff4cf0a96d26688a6051188f8', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFzbjBpelhuc2dlb0xWeHhaeWxW\nbkh4T2hDOXhXeEtPUE9HYVdkbUFXN2VBPQY7AEZJIgx1c2VyX2lkBjsARmkO\n', '2012-04-14 17:10:10', '2012-04-14 17:10:24'),
(470, 'd18272bc733dc830e121f187e983f919', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFBV3VHSlNnY0plaXVraU5tUGFM\nQllabjEvOGwrM3IyZU9ZR0lIZGNrdk5zPQY7AEZJIgx1c2VyX2lkBjsARmkG\n', '2012-04-15 09:38:49', '2012-04-15 09:39:01'),
(471, '123a7bcccf0d679ff15e11aa0656c186', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFneXhBbjZtNk03b09mWVRPTndv\naUVVQ0NxNVhseVlBTE54NlNpQlhEUC9rPQY7AEZJIgx1c2VyX2lkBjsARmkG\n', '2012-04-15 09:40:16', '2012-04-15 09:40:33'),
(472, 'c910f1d3fed086be36bf6b83d79df34f', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjE4dWhucHFDUWpNZmorTW5GRU4y\ncUJoV0ZDMW4rTHZab1RDMm41ZkI3ZzljPQY7AEZJIgx1c2VyX2lkBjsARmkH\n', '2012-04-15 18:57:40', '2012-04-15 19:07:22'),
(474, '17a812a6b54a473af156ebbd57328b80', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjE5bzB4YklxR3EydDdGS1FZdG1Q\nQUc0dzZ3OEtYemlQcDEyNVZUcFZjUFpRPQY7AEZJIgx1c2VyX2lkBjsARmkH\n', '2012-04-16 06:28:03', '2012-04-16 06:29:05'),
(475, 'c24de5b2ccc194d42344a562c85f8990', 'BAh7BkkiEF9jc3JmX3Rva2VuBjoGRUZJIjEzKzRiNk94U3hmQk5KQnNZWno2\nWGd3QWEwYVdRay9sZTdFamlYcWx5NEIwPQY7AEY=\n', '2012-04-16 06:49:00', '2012-04-16 06:49:00'),
(476, '8b991e469a61e33d8e8ae00cc649d9b7', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFZYUFwZ0hEWWV6QkFneERBMnN5\nRDhWMlVPNTROdmN2bUtxaTR5c1BuQ3VJPQY7AEZJIgx1c2VyX2lkBjsARmkH\n', '2012-04-16 06:51:04', '2012-04-16 06:52:19'),
(477, 'b51fd7f402ee6945ce6f0eee3a25500a', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFYQ2tPZ0kySzlXVWNERUliQXRw\nbWxvMU80S2lMbXhHTzFYZ01kb1RwdGdVPQY7AEZJIgx1c2VyX2lkBjsARmkH\n', '2012-04-16 07:06:14', '2012-04-16 07:10:53'),
(478, '3f2d2ae081e088ec6ca2fcbbe848c311', 'BAh7BkkiEF9jc3JmX3Rva2VuBjoGRUZJIjE1QWtVSFdlL0d3VGlwN2tlTjhY\nK0F5Z1RoeHE2dWVmdnZJK242bzVvblowPQY7AEY=\n', '2012-04-16 16:49:44', '2012-04-16 16:49:44'),
(479, '194e823494dd19fb5517174a2b35fb34', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFKU2o5R3NSMWpYWmJubmk4eXAz\nM2FZb2Yvb01zazN2dHFQcUxpV0dpekVFPQY7AEZJIgx1c2VyX2lkBjsARmkN\n', '2012-04-16 16:49:47', '2012-04-16 16:49:53'),
(480, 'fd3e879d238b70315dd2c9f9f0573732', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjExTDVkVTRSZElheEVsZGlYRW1E\nNVlvQ1p2bVNrUkhLaURpdEtqYktzODFrPQY7AEZJIgx1c2VyX2lkBjsARmkO\n', '2012-04-17 00:40:11', '2012-04-17 00:41:32'),
(481, '1870dcaedf588fe4d27389f71ba95a47', 'BAh7BkkiEF9jc3JmX3Rva2VuBjoGRUZJIjFzeG50ODh4MTNLbEt3WDJ2c1ZF\nb3Vtc0pxNDJxT2tjT0JwcUIxTFRYS2tBPQY7AEY=\n', '2012-04-17 04:10:04', '2012-04-17 04:10:04'),
(482, '51db3d3ddc8c5b32fcf5a9bb8d7c1e30', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFKMFN0L0NFTS9iZXgwOUNQK0Rj\nREVHZlZHUTF5STZ5MFpvZ3l2SkljdkN3PQY7AEZJIgx1c2VyX2lkBjsARmkG\n', '2012-04-17 21:06:42', '2012-04-17 21:07:45'),
(484, '127368a68d1d1b636483f9a1ae59cd26', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjF3a0JUL3F3Y2IvbWpNcjhZWEdh\nWk1sQUdENmJDcjNWYSs1anVLM0FEVG1JPQY7AEZJIgx1c2VyX2lkBjsARmkH\n', '2012-04-18 22:31:19', '2012-04-18 22:31:25'),
(485, '1c3abc03289d453282f83c74f18c9b11', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFnZlNRWGsvcTN6cytCUkpQcm5R\nc09qek04OHBNd3dYOHdmWHFVVDkzZ1lNPQY7AEZJIgx1c2VyX2lkBjsARmkH\n', '2012-04-19 01:49:35', '2012-04-19 01:49:43'),
(486, 'ac7be7093204970f9afad7d3a543675c', 'BAh7BkkiCmZsYXNoBjoGRUZvOiVBY3Rpb25EaXNwYXRjaDo6Rmxhc2g6OkZs\nYXNoSGFzaAk6CkB1c2VkbzoIU2V0BjoKQGhhc2h7ADoMQGNsb3NlZEY6DUBm\nbGFzaGVzewY6C25vdGljZUkiHlBsZWFzZSBsb2cgaW4gdG8gY29udGludWUG\nOwBGOglAbm93MA==\n', '2012-04-19 02:26:44', '2012-04-19 02:26:44'),
(487, 'cdc028a34da3a6fec0e94122a1e255e5', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjE3bVBWTzdLT2FtZjV4aU1PeDdu\ndldJWEh1VFNxeFJ5ZFQ1ejZ4NlRNOFhjPQY7AEZJIgx1c2VyX2lkBjsARmkO\n', '2012-04-19 02:26:44', '2012-04-19 02:26:54'),
(488, 'dc042156affb2a88827fa6cf58e1f888', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFZNXdCY3ZUSExIVkdZUjhtazFY\nYlF3NSt2TGJ6NGl3TzFKNU5FT01zRC9FPQY7AEZJIgx1c2VyX2lkBjsARmkG\n', '2012-04-19 02:27:00', '2012-04-19 02:27:08'),
(489, 'd8e91154e925218a8f3ec48357e985ce', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFEemhTcnZadUpneEhpTGhOdUlz\nbXdrZDNSMS9BSUNrOTNHUlNrNVNHQW1BPQY7AEZJIgx1c2VyX2lkBjsARmkN\n', '2012-04-19 03:49:50', '2012-04-19 03:49:55'),
(490, 'eb56db9b63420d185e7f5c6baf33dddf', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjE1a0VrZ3FCRWhEZ053ZzA4WHk0\nY0d0S21MeE4wN2VuNkJwWE91RXFlbDZBPQY7AEZJIgx1c2VyX2lkBjsARmkO\n', '2012-04-20 16:42:46', '2012-04-20 16:42:57'),
(491, 'fc16db271ffe9157796facf71d89b190', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFhUzVKdzZhMHd1cnAwZktIYmVp\nS1NOWDkwc1Q5VVpQd0hnTjB2SmlXM3ZBPQY7AEZJIgx1c2VyX2lkBjsARmkH\n', '2012-04-20 19:05:18', '2012-04-20 19:05:24'),
(492, '9d9043e859fe2da0594c771420f5c74b', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjF0VWtRRGdLZ09vYU9DNFMwd0J0\nL044ZDFzeFZRVWJiY3JMRFdLcFBMb2tFPQY7AEZJIgx1c2VyX2lkBjsARmkO\n', '2012-04-21 01:55:43', '2012-04-21 01:56:20'),
(494, 'a3d2a4ef852a7f6183c4d9cf828693f6', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjEyVzFUUCt3alJxMzBNeWVUd1Vz\nWVROQWYrWmphcG1YMXZzQU5PMnltajVJPQY7AEZJIgx1c2VyX2lkBjsARmkO\n', '2012-04-21 04:31:14', '2012-04-21 04:35:04'),
(495, 'b6e15823419a019a86a321bf4531b45f', 'BAh7BkkiEF9jc3JmX3Rva2VuBjoGRUZJIjFBQk5hR3UxSS9Ia3dFQ0g3ZVlY\nMjJwUmdFWlAzc2pRMGkzTnhJT1RNMWlZPQY7AEY=\n', '2012-04-22 03:48:21', '2012-04-22 03:48:21'),
(496, '7cdf2eedab722117c7802b4ff1e6eeb8', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFLL2tOdEdQemwwOXB6ZHJYbFpO\nTFZFVXFYWXYrTlp3Z3VDbCsrWDJMbHl3PQY7AEZJIgx1c2VyX2lkBjsARmkN\n', '2012-04-22 03:48:22', '2012-04-22 03:48:32'),
(497, 'd55f7888c9ca5e5a80bd104b9605a78e', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjErRVhocXlIQUdnYTM0bzZZNXU1\nd08xdWVTd2wzYTJRVWppb3RTVnRrVEI0PQY7AEZJIgx1c2VyX2lkBjsARmkN\n', '2012-04-22 21:33:45', '2012-04-22 21:35:54'),
(498, '03623431ffe9626be8180a8a32afc2b5', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFZM3JqeVFqWmNCbTVrNDVrcFNv\nNXFtU1JwRmlYNjZkdVhpenVpc3NraHdnPQY7AEZJIgx1c2VyX2lkBjsARmkH\n', '2012-04-27 02:38:44', '2012-04-27 02:39:28'),
(499, '7bea0c28744ecd7672041ccdb087bbb6', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjE3cTEwdFhlMktCaHU4am94NzFN\nam1lTXdSOUxYUDhrWXVUYlEyTTJTaWZrPQY7AEZJIgx1c2VyX2lkBjsARmkG\n', '2012-04-28 19:15:26', '2012-04-28 19:19:25'),
(500, '5c9bef24cbda396f2bc2f7238fc62ab2', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFCaDlIVXRacVhKTVVFRHpHbm4z\nYkxtOTRvVHJmeHpBTEpDVldZZ3B0TDE4PQY7AEZJIgx1c2VyX2lkBjsARmkG\n', '2012-04-28 19:30:12', '2012-04-28 19:30:36'),
(501, 'c70450ffe94363e886548904c3abd46a', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFmMk5kVVl1RWxHWm9pQUowT1Ix\ncml5WXd0MFgrNU5NaGRrV1dHSDFBdmJnPQY7AEZJIgx1c2VyX2lkBjsARmkH\n', '2012-04-29 04:46:29', '2012-04-29 04:46:35'),
(502, '12295aeaa5f428771bc227c852889d4f', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFRMys4RmxzU0toUWVzNGF6N2tM\nQVIyVnlobUNsaW54aFY0S0xzUFE2SitzPQY7AEZJIgx1c2VyX2lkBjsARmkH\n', '2012-05-10 18:49:44', '2012-05-10 18:49:53'),
(503, '1bcced054f8757aba862490e324f6254', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFrRURHeHYxMmVBZUJPMTkzM21H\nc01zZ1k0dTJYMUQvczVDSnIrakN4Z3hvPQY7AEZJIgx1c2VyX2lkBjsARmkH\n', '2012-08-04 20:17:03', '2012-08-04 20:17:44'),
(505, 'f5fd742d818eddfe4303b51036b38f20', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFmK3pOWHZTZE1zTGRyOE44RXVU\nc3U5SVArZk03MjNFQ2QrdTg1dWk4MzdVPQY7AEZJIgx1c2VyX2lkBjsARmkH\n', '2012-08-13 03:19:13', '2012-08-13 03:19:30'),
(506, '9167d81344a2dd825d68a2735cb5152e', 'BAh7BkkiEF9jc3JmX3Rva2VuBjoGRUZJIjE4T2hneUJzSlN3WjB1ZVcyWHlK\nZnUxQ1ZxNjhDeGFXNXBsNWNSUGVkcmtBPQY7AEY=\n', '2012-08-17 02:41:51', '2012-08-17 02:41:51'),
(507, '53dbebb5c002840696b1f6cfc2660639', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFrdUJhQ3dGeEZlS1kyRWpONVpm\nV2g3bHA0bGlvS05FZmZHMkRzQ0w4ZDZzPQY7AEZJIgx1c2VyX2lkBjsARmkH\n', '2012-08-17 02:41:54', '2012-08-17 02:42:07'),
(508, '71d36d7f36c4347f0f38f5e2d4d2e06f', 'BAh7BkkiEF9jc3JmX3Rva2VuBjoGRUZJIjF5WTByZnV1V2V4SHUxZU5Vcm1P\ndCtRTTNvUklyU1hWd1VNNEhzbzhRQm9rPQY7AEY=\n', '2013-03-16 21:14:22', '2013-03-16 21:14:22'),
(510, 'bd819ce99565e01f8030f5d069e2a2ca', 'BAh7BkkiEF9jc3JmX3Rva2VuBjoGRUZJIjFrNmg2QzFadWx2M3hWNzVTK3VK\nUXA5YXFWZHF0MWVwWG9UV0h1NnByQkZrPQY7AEY=\n', '2013-03-16 21:15:02', '2013-03-16 21:15:03'),
(514, '30ebb23d023a9e10e0775ba542d64028', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjEreUQyMzROdmpXbVUwa0NPVkhr\nbXBZVi9HblFtb1I5dmM5VXFNZXZEWGxjPQY7AEZJIgx1c2VyX2lkBjsARmkv\n', '2013-03-17 07:02:47', '2013-03-17 07:10:06');

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE IF NOT EXISTS `tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `num_events` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=36 ;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`id`, `name`, `created_at`, `updated_at`, `num_events`) VALUES
(8, '庙会', '2012-01-17 02:37:09', '2012-01-17 02:37:09', 1),
(9, '话剧', '2012-01-17 02:41:02', '2012-03-10 23:13:22', 2),
(10, '电影', '2012-01-17 02:42:40', '2012-01-17 02:42:40', 1),
(12, '夜店', '2012-01-18 03:53:02', '2012-01-18 03:53:02', 1),
(14, '日本料理', '2012-01-18 03:54:41', '2012-01-18 03:54:41', 1),
(15, '自助餐', '2012-01-18 03:54:41', '2012-01-18 03:54:41', 1),
(16, '音乐会', '2012-01-19 02:49:20', '2012-01-19 02:49:20', 1),
(17, '演出', '2012-01-19 02:49:20', '2012-02-09 04:01:27', 3),
(18, '艺术', '2012-02-07 02:29:03', '2012-02-07 05:58:57', 2),
(34, 'tsg', '2012-04-18 22:32:57', '2012-04-18 22:32:57', 1),
(35, 'asfgadsfg', '2012-08-13 03:22:15', '2012-08-13 03:22:15', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tags_users`
--

CREATE TABLE IF NOT EXISTS `tags_users` (
  `tag_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tags_users`
--

INSERT INTO `tags_users` (`tag_id`, `user_id`) VALUES
(14, 1),
(10, 1),
(22, 1),
(28, 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `hashed_password` varchar(255) DEFAULT NULL,
  `nickname` varchar(255) DEFAULT NULL,
  `friends_num` int(11) DEFAULT '0',
  `fans_num` int(11) unsigned DEFAULT '0',
  `follow_num` int(11) unsigned DEFAULT '0',
  `blocked` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=43 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `hashed_password`, `nickname`, `friends_num`, `fans_num`, `follow_num`, `blocked`, `created_at`, `updated_at`) VALUES
(1, 'test100@test.com', '56a90172698187d9876cdd2c6dc158a39e81d693', 'test100', 2, 0, 0, 0, '2012-01-07 23:40:36', '2012-01-24 01:30:07'),
(2, 'chao.cn@hotmail.com', '80737dd5daab777f359b5ca957a0953c50a20c1b', '剑客逍遥', 4, 0, 0, 0, '2012-01-08 02:45:45', '2012-01-28 16:51:26'),
(3, 'test101@test.com', '879091bfc28e48b9ae663beb0c72cfa0660529bd', 'test101', 0, 0, 0, 1, '2012-01-08 03:30:49', '2012-01-20 02:17:03'),
(4, 'test001@test.com', '9a78a71190ceb282c8b9b0cbe9f9bfeda2e2fb6d', 'test001', 1, 0, 0, 1, '2012-01-09 05:43:50', '2012-01-19 23:23:45'),
(5, 'test002@test.com', '75ba8cf59a35a4383a2f1d0ddb8498f2e8866bfc', 'test002', 1, 0, 0, 1, '2012-01-09 05:44:51', '2012-01-20 02:34:04'),
(6, 'test003@test.com', '71908a18118f4d9a986e5f202846dc09e45a5867', 'test03', 0, 0, 0, 1, '2012-01-09 05:57:29', '2012-01-09 05:57:29'),
(8, 'jing@test.com', '9c5dcf89813466ba54b83dcc6113d82de3559390', 'jing', 6, 0, 0, 0, '2012-01-12 20:06:29', '2012-01-28 16:51:12'),
(9, 'hua@test.com', 'f3dd2731ac7c2d56c518cf8ce504b1d60ed85f29', 'luhua', 4, 0, 0, 0, '2012-01-13 03:48:04', '2012-01-28 16:51:26'),
(10, 'abc@abc.com', '22e4e721767da7b5a4cb31d1e2f6f344110ca508', 'abcdef', 0, 0, 0, 1, '2012-01-13 05:04:23', '2012-01-13 05:04:23'),
(11, 'test102@test.com', '619bded245ace15ff81f308f352f788b9afd308f', 'test102', 0, 0, 0, 1, '2012-01-13 05:09:32', '2012-01-13 05:09:32'),
(12, 'test103@test.com', '369df4cd89af732e047524272527b212597d5b4e', 'test103', 0, 0, 0, 1, '2012-01-14 01:55:58', '2012-01-14 01:55:58'),
(30, 'hongsentest1@gmail.com', '4899930a8c07e62419d2fc6480f266e6b67935bf', 'hongsentest1', 0, 0, 0, 0, '2012-01-20 16:32:14', '2012-01-20 16:32:14'),
(31, 'hongsentest2@hotmail.com', '6beee3570767cca001ebd51513d0cdb5cd3c6f87', 'hongsentest2', 0, 0, 0, 1, '2012-01-20 22:22:07', '2012-01-20 22:22:07'),
(33, 'matchge@gmail.com', '9168ba0ef5fede9bcb51c4b25e2dde38aa60f96e', '大头大头火柴', 0, 0, 0, 1, '2012-01-21 03:01:38', '2012-01-21 03:01:38'),
(34, 'abc@a.ca', '4fb3a2701ba3bc1a82c5ed4b9f2ab1b1f6dcc28b', 'abcd', 3, 0, 0, 1, '2012-01-28 07:18:18', '2012-01-28 16:48:41'),
(35, 'hstest1@test.com', '81267c4ec9fbecfcface5f8ef11d4d315b68c123', 'hstest1', 0, 0, 0, 1, '2012-02-08 00:59:48', '2012-02-08 00:59:48'),
(36, 'hualu@ibm.com', 'bd05b28e11cac536e0597d4457354fa702750505', 'luhualuhua', 0, 0, 0, 1, '2012-02-09 03:09:37', '2012-02-09 03:09:37'),
(37, 'william@abc.com', '2cd7d2061fd904f96e212840f93eee6c215962bf', 'William', 0, 0, 0, 0, '2012-02-09 03:10:24', '2012-02-09 03:10:24'),
(42, 'charleslu@gmail.com', '8d219e33d35dd90f5456fb70e54db929da273335', 'charleslu', 0, 0, 0, 0, '2013-03-17 07:10:06', '2013-03-17 07:10:06');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
