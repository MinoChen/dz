/*
 Navicat MySQL Data Transfer

 Source Server         : ConnectionMySQL
 Source Server Type    : MySQL
 Source Server Version : 80015
 Source Host           : localhost:3306
 Source Schema         : dz

 Target Server Type    : MySQL
 Target Server Version : 80015
 File Encoding         : 65001

 Date: 19/06/2019 18:18:13
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`category_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (1, '内饰展示');
INSERT INTO `category` VALUES (2, '产品展示');
INSERT INTO `category` VALUES (3, '最新产品');
INSERT INTO `category` VALUES (4, '新闻资讯');
INSERT INTO `category` VALUES (5, '最新资讯');
INSERT INTO `category` VALUES (6, '行业知识');
INSERT INTO `category` VALUES (7, '联系我们');
INSERT INTO `category` VALUES (8, '关于我们');

-- ----------------------------
-- Table structure for info
-- ----------------------------
DROP TABLE IF EXISTS `info`;
CREATE TABLE `info`  (
  `info_id` int(11) NOT NULL AUTO_INCREMENT,
  `info_author` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `info_content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `info_sort` int(255) NULL DEFAULT NULL,
  `info_picPath` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `info_publishStatus` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `info_publishTime` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `info_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `category_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`info_id`) USING BTREE,
  INDEX `FKn7nwvi29rnvg55fp0x1wb8gvg`(`category_id`) USING BTREE,
  CONSTRAINT `info_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 129 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of info
-- ----------------------------
INSERT INTO `info` VALUES (96, 'cy', '请扫描二维码添加微信<br>', 1, 'mmqrcode1560427640515.png', '1', '2019-06-13 20:09:29', '联系我们', 7);
INSERT INTO `info` VALUES (114, 'cy', ' &nbsp;&nbsp;&nbsp;&nbsp;近日，国家相关部门发布关于深化增值税改革有关政策的公告，自4月1日起制造业增值税税率下调政策开始实施。上汽大众积极响应国家新政，从3月27日起下调大众品牌、斯柯达品牌车型厂商建议零售价，最高降幅高达2万元，同时推出多重购车和服务优惠政策，让消费者即刻享受“减税降费”、“让利于民”带来的实惠。<br>\r\n&nbsp;&nbsp;&nbsp;&nbsp;本次建议零售价调整覆盖上汽大众两个品牌在售车型。<br>\r\n&nbsp;&nbsp;&nbsp;&nbsp;其中，大众品牌最高降幅20,000元，斯柯达品牌最高降幅15,000元。更多详情可查询品牌官方网站或咨询当地经销商。<br>\r\n除了建议零售价调整外，此次上汽大众还推出了更多购车和服务实惠。大众品牌三款高端车型途昂、途观L与全新一代帕萨特为消费者带来多重好礼，包含置换、保险与金融信贷优惠。以购买途昂车型为例，消费者可享最低2成首付、2年零利率，还可享受10,000元置换补贴与至高6,500元的保险优惠。斯柯达全系车型均有多重精彩好礼。以柯迪亚克GT为例，可享受低至两成首付，两年零利率，8000置换补贴，至高5000保险补贴。此外，斯柯达品牌还会向前四万名购车用户额外提供三年六次免费基础保养服务，即“三年智惠保养服务礼包”。<br>\r\n&nbsp;&nbsp;&nbsp;&nbsp;多年来，上汽大众始终坚持为消费者提供优质的产品和服务，收获了2000万消费者的信赖和认可。不久前，公司响应国家“汽车下乡”政策，推出了多项优惠购车政策，切实降低了汽车消费的门槛。此次，上汽大众带来了力度更大、范围更广的车型调价，将进一步刺激汽车消费，助力更多消费者开启高品质的车生活。<br>', 1, '767.jpg', '1', '2019-06-17 16:58:20', '响应国家“减税降费”号召 上汽大众下调车型厂商建议零售价', 4);
INSERT INTO `info` VALUES (115, 'cy', ' &nbsp;&nbsp;&nbsp;&nbsp;近日，上汽大众与北京首汽智行科技有限公司、大众汽车新动力投资公司、易手车（北京）互联网信息服务有限公司（筹）签署了“出行车源战略合作备忘录”，四方将共同探索汽车共享新模式，围绕从汽车研发制造到出行服务、车辆回收整备、高质量二手车再流通这一业务生态闭环开展战略合作。<br>\r\n&nbsp;&nbsp;&nbsp;&nbsp;上汽大众销售与市场执行副总经理、上海上汽大众汽车销售有限公司总经理贾鸣镝，首汽集团董事长赵金俊，大众汽车新动力总经理雷佑思，大众汽车集团全球执行副总裁苏伟铭共同见证了合作签约仪式。上海上汽大众汽车销售有限公司党委书记、上汽大众大众品牌营销事业执行总监杨嗣耀代表上汽大众签约。<br>\r\n &nbsp;&nbsp;&nbsp;&nbsp;贾鸣镝在讲话中表示：“此次四方将基于各自优势，资源互补，实现汽车制造、采购、使用和回收环节的无缝契合，共同完成汽车的‘共享化’改造，以灵活的租赁方式、便捷的借还渠道，助力中国消费者轻松成为‘用车一族’，打造全新的出行生态。”<br>\r\n&nbsp;&nbsp;&nbsp;&nbsp;本次合作中，上汽大众将向首汽集团旗下共享出行平台GoFun出行提供包括Polo、新桑塔纳、晶锐以及明锐在内共计16,000余辆大众品牌及斯柯达品牌产品，并通过上汽大众完善的全过程质量管理体系，保障车辆生产与市场需求的高度适配。同时，汽车金融平台大众新动力将根据GoFun出行的具体需求提供资金采购车辆，二手车交易平台易手车（筹）将提供车辆余值处置服务。未来，合作各方将继续在二手车置换、经销商及平台加盟、品牌营销等各方面加强探索。<br>', 1, '745.jpg', '1', '2019-06-17 17:01:23', '打造出行新生态 上汽大众与GoFun出行、大众新动力、易手车（筹）达成战略合作伙伴', 4);
INSERT INTO `info` VALUES (116, 'cy', ' &nbsp;&nbsp;&nbsp;&nbsp;2019年1月12日，在生产一线员工代表的共同见证下，一辆雅致白色的帕萨特插电式混合动力版驶下生产线，上汽大众迎来第2000万辆汽车下线，成为国内首家累计产量突破2000万的乘用车企业。<br>\r\n&nbsp;&nbsp;&nbsp;&nbsp;帕萨特自2000年进入中国市场以来，凭借与时俱进、锐意进取的品牌精神，以及领先同级的产品实力，树立了中高级轿车价值典范，累计赢得超过250万车主信赖。此次下线的帕萨特插电式混合动力版继承了燃油版车型的精髓，并搭载了由高能量三元锂电池、高效率一体电动机、智能电控管理系统、EA211 1.4TSI涡轮增压引擎组成的混合动力系统。车辆综合最大功率155kw、最大扭矩400Nm，综合燃料消耗量低至1.4L，拥有超过1000km的最高综合续航里程，实现了燃油经济性和强劲动力的完美平衡。同时车辆执行德系高等级安全标准，电池系统通过了针刺、火烧、碰撞、浸入式温度冲击等169项极限安全测试，充分验证了产品的可靠性。<br>\r\n&nbsp;&nbsp;&nbsp;&nbsp;近年来，上汽大众持续推动新能源汽车领域的布局。2018年，帕萨特插电式混合动力版和途观L插电式混合动力版相继上市；同年10月，新能源汽车工厂开工建设，计划于2020年底投入使用，未来将投产多款基于MEB平台打造的全新一代纯电动车型。在下一个千万辆产品中，将会有越来越多智能、洁净、高效的新能源汽车的身影。<br>\r\n&nbsp;&nbsp;&nbsp;&nbsp;2000万辆不仅仅是时间和数字的积累，背后更是千万车主的认可和支持。在30多年的滚动发展中，上汽大众不断夯实综合竞争力，形成了完善的生产体系和规模经济。近年来，随着企业“共创2025”战略的不断深入，上汽大众在研发、生产、营销等领域实力稳健，同时在新能源汽车、移动互联等新业务领域也充分布局，不断提升面向未来的核心竞争力，实现高质量发展。站在2000万辆的新起点上，上汽大众将继续以市场和用户为导向，依托体系实力为消费者带来高品质的产品和服务，用心回馈2000万用户的信赖。<br>', 1, '629.jpg', '1', '2019-06-17 17:05:15', '用心成就千万信赖 上汽大众第2000万辆汽车下线', 4);
INSERT INTO `info` VALUES (117, 'cy', ' &nbsp;&nbsp;&nbsp;&nbsp;近日，为期三个月的2019年KPL春季赛精彩落幕，上汽大众T-Cross作为官方合作伙伴全程见证王者的诞生。T-Cross是新近上市的潮流杰作，和电竞头牌赛事KPL一样备受年轻人关注。而与王者荣耀中六大位置上各显神通的英雄相似，T-Cross集合了胜人一筹的五大护身技能，为年轻族群带来潮酷享乐的用车享受。<br>\r\n&nbsp;&nbsp;&nbsp;&nbsp;作为大众品牌最新的一款全球车型，T-Cross基于对年轻消费者的调研而将中国市场设计需求完美兼容。它的灯组设计、腰线走势等勾勒出动感硬朗的气质，其中立体LED尾灯更是大众品牌首款，以黑色饰板搭配极简红色大灯，几何线条富有科技感。同时，T-Cross率先于上汽大众车型应用了Color-matching内外同色设计，用多种内饰主题展现色彩搭配的潮流美学，引领独具一格的视觉风潮。开T-Cross出街，凭颜值就可俘获注目礼。<br>\r\n&nbsp;&nbsp;&nbsp;&nbsp;动力对于一款车具有核心输出价值，就像是游戏里带队获胜的英雄角色。T-Cross搭载了同级少见的1.4TSI全铝环保发动机，110kW的最大功率能量澎湃，让驾驭快感劲擎来袭。匹配的DSG七速双离合变速箱带有S挡位，疾速飞驰或是灵巧过弯均能满足。大众品牌全新设计的一体式座椅运动感，包覆式结构符合人体自然乘坐姿态。顶配更配有KESSY无钥匙进入/一键启动功能，提升科技的同时让驾驶激情纵擎迸发。<br>\r\n&nbsp;&nbsp;&nbsp;&nbsp;这个春夏，T-Cross见证了2019KPL的王者诞生，2019KPL也陪伴了T-Cross的荣耀上市。更值得一提的是，T-Cross以貂蝉与马可波罗两个角色推出跨界联名版定制车贴，受到电竞粉追捧。为城市探险家而来，T-Cross致敬所有想要成为英雄的你。<br>', 1, '818.jpg', '1', '2019-06-17 17:09:14', '五大技能输出 上汽大众T-Cross志逐王者', 4);
INSERT INTO `info` VALUES (118, 'cy', ' &nbsp;&nbsp;&nbsp;&nbsp;近日，第二十五届华鼎奖•上汽大众途昂X之夜中国电影满意度调查发布盛典在澳门银河百老汇舞台举行。作为本届华鼎奖首席战略合作伙伴，上汽大众旗舰豪华运动型SUV 途昂X与现场明星嘉宾一同见证了这场群星璀璨的盛典。<br>\r\n&nbsp;&nbsp;&nbsp;&nbsp;华鼎奖创办于2007年，拥有“全球观众口碑大奖”之称，通过网络、电话等多维度的民意调查，将荣誉授予最受观众欢迎的演艺界人士。近一年内，国内电影领域佳作频出，入围华鼎奖作品精彩纷呈，参演明星实力强劲，各奖项的竞争角逐十分激烈。最终，《红海行动》拿下中国电影满意度调查第一名，《我不是药神》获颁中国电影最佳影片奖，同时，文牧野也凭该作摘得最佳导演奖。郭富城凭借《无双》夺得本届华鼎奖中国电影，马伊琍则凭《找到你》封获最佳女主角。张艺兴、周佳怡分获中国最佳男女配角。<br>\r\n&nbsp;&nbsp;&nbsp;&nbsp;荧屏上，明星用非凡而自信的实力演技塑造出鲜活的角色，闪耀着自己的强者光芒。作为大众品牌布局旗舰豪华运动型SUV市场的全新力作，途昂X同样绽放强者光芒。其造型采用独具特色的运动豪华造型设计语言，由外而内呈现出超高颜值与豪华质感，将运动美学表现得淋漓尽致。<br>\r\n&nbsp;&nbsp;&nbsp;&nbsp;自信的气场也少不了强大的“芯”动力支持，途昂X提供530V6、380TSI及330TSI三种动力选择，全系匹配DQ500 DSG七速湿式双离合变速器，输出澎湃动力，令驾驶者肆意驰骋。 此外，途昂X配备豪华运动底盘，带来高效精准的操控体验，其搭载毫秒级响应DCC自适应动态悬架、4Motion智能四驱系统、多路况驾控管家（8种驾驶模式）及运动换挡拨片，让驾驶者轻松自如地应对各种路况，享受酣畅淋漓的驾驶乐趣。<br>\r\n&nbsp;&nbsp;&nbsp;&nbsp;本次盛典现场，途昂X展现了其作为旗舰豪华运动型SUV的强大实力，见证新时代的强者卓越前行。<br>', 1, '242.jpg', '1', '2019-06-17 17:12:18', '绽放强者光芒 见证强者诞生 上汽大众途昂X助力第二十五届华鼎奖发布盛典', 4);
INSERT INTO `info` VALUES (119, 'cy', ' &nbsp;&nbsp;&nbsp;&nbsp;在每位超级暖爸心中，或许都还住着个迷人型男。这就像备受男性汽车用户青睐的全新凌渡，可酷可甜。父亲节即将到来，全新凌渡以夺目锋芒和贴心光芒，致敬所有的型男暖爸。<br>\r\n &nbsp;&nbsp;&nbsp;&nbsp;全新凌渡采用了大众品牌的最新设计语言，同时更具情感化、个性及动感元素，是年轻消费者中的型男之选。<br>\r\n&nbsp;&nbsp;&nbsp;&nbsp;其车身宽高比达到了1.28，与轿跑车型相当，以凌厉身姿诠释设计之美，焕新细节处更显耀眼本色。全新阵列式镀铬格栅勾勒出动感气息，配合横向前脸线条，令车头彰显强劲力量感。透镜式LED大灯锋利有神，并带凌视LED日间行车灯，展翼式排布更显视觉宽度。一体式全黑车顶，加上高强度超广角双开启大天窗，触目倾心。LED流光转向尾灯则为上汽大众车型首次采用，动态点亮效果极具时尚范，在光影的都市中俘获目光。<br>\r\n&nbsp;&nbsp;&nbsp;&nbsp;安全保护方面，亦如家庭中的父亲角色，全新凌渡也照顾到全员乘客的出行需求。可加热电动调节外后视镜为驾驶员行车带来便利，锁车自动折叠及副驾驶侧外后视镜倒车自动下翻则在泊车时发挥大作用。后排两套儿童安全座椅固定装置，悉心关怀儿童乘车的安全性与舒适性。全系还标配高度可调的WOKS安全头枕，当后方发生追尾碰撞时，能为驾乘人员颈部提供有效保护。<br>\r\n&nbsp;&nbsp;&nbsp;&nbsp;对越来越多已经转变成父亲角色的80后、90后来说，一款车既要彰显自己的个性，也要兼顾家庭的需要。全新凌渡将动感魅力与实用品质结合，深受年轻人喜爱，正是爸爸们的理想座驾。<br>', 1, '819.jpg', '1', '2019-06-17 17:15:06', '是型男也是暖爸 全新凌渡可酷可甜', 4);
INSERT INTO `info` VALUES (120, 'cy', ' &nbsp;&nbsp;&nbsp;&nbsp;新年伊始，上汽大众呈上了2018年销量成绩单，全年销售2,065,077辆，位列国内汽车市场销量第一，并连续四年蝉联乘用车市场销量冠军。<br>\r\n &nbsp;&nbsp;&nbsp;&nbsp;大众品牌在销量高位依旧保持稳健，全年销售171.3万辆，继续位列国内单一汽车品牌销量榜首；斯柯达品牌全年销售35.2万辆，同比增长5.7%。<br>\r\n&nbsp;&nbsp;&nbsp;&nbsp;面对多元化的消费需求，上汽大众聚焦行业变革，持续优化用户的产品体验和服务体验。除了在传统燃油车领域保持优势以外，企业在新能源汽车领域动作频频。途观L插电式混合动力版与帕萨特插电式混合动力版已相继登场，上市两个月累计销售4,174辆。新能源汽车工厂于2018年10月开工，这也是大众汽车集团全球首个新建的纯MEB工厂，预计将于2020年底建成投产。未来，上汽大众将基于MEB平台打造多款全新一代纯电动车型，为消费者提供更加智能、清洁的用车选择。<br>\r\n&nbsp;&nbsp;&nbsp;&nbsp;2019年，乘用车市场面临着更大挑战，行业竞争也将更加激烈。产品布局、产品质量、用户满意度依然是考验车企可持续发展的重要标准。新的一年，包括T-Cross、全新一代Polo、全新一代朗逸纯电动版车型、全新速派、柯米克GT等多款新产品将陆续登陆市场。立足“200万+”的产销高位，上汽大众将不断推进“共创2025”战略的实施，持续提升企业核心竞争力，为消费者提供更多超越期待的产品和服务。<br>', 1, '305.jpg', '1', '2019-06-17 17:20:11', '上汽大众2018年销售206.5万辆 位列国内汽车市场销量第一', 4);
INSERT INTO `info` VALUES (123, 'cy', ' 大众汽车（德语：Volkswagen）是一家总部位于德国沃尔夫斯堡的汽车制造公司，也是世界四大汽车生产商之一的大众集团的核心企业。2018年12月，世界品牌实验室编制的《2018世界品牌500强》揭晓，排名第39。Volks在德语中意思为“国民”，Wagen在德语中意思为“汽车”，全名的意思即“国民的汽车”，故常简称为“VW”。台湾译为福斯汽车，港澳、大陆译为大众汽车或福士汽车，意思是“人民的汽车”。整个汽车集团在2012年产销超过907万辆，大众品牌则超过574万辆。', 1, 'dzlogo.png', '1', '2019-06-17 18:54:16', '大众汽车信息网', 8);
INSERT INTO `info` VALUES (124, 'cy', '&nbsp;&nbsp;&nbsp;&nbsp;随着电动汽车日益普及，消费者在选购时除了注重外观及续航里程外，也越来越看重三电系统的性能，即电池、电机、电控系统。其中，电控系统被誉为电动车的“中枢神经系统”，其优劣将直接决定电机和电池是否能发挥出最大的硬件潜能，从而影响新能源车的整体性能。得益于领先精准的电控系统，朗逸电动版将自身卓越性能发挥到极致，为车主带来e触即发的高效驾驭体验。<br>\r\n&nbsp;&nbsp;&nbsp;&nbsp;对于电脑而言，CPU就是其运算核心和控制核心；而MCU电机控制单元则相当于电动车上的CPU，负责协调和控制电动车电机的运转。MCU性能越强，对电机的控制越精确，处理信息的速度更快，因此对电机的工作状态及功能性拓展起着关键作用。<br>\r\n&nbsp;&nbsp;&nbsp;&nbsp;相较市面上同级车型常见的单核MCU芯片，朗逸电动版采用了运算能力和控制精度更强的高速三核MCU芯片，计算能力更强、对电机电流和电压传感器的检测精度也更高，通过更为先进的控制算法，对电动机输出扭矩的控制精度能够达到2%。<br>\r\n&nbsp;&nbsp;&nbsp;&nbsp;目前，市面上一些电动车产品缺少精明的低电量控制管理系统，使得用户在行车过车中会遭遇“开车一时爽，缺电泪两行”的囧境。朗逸电动版配备了领先同级的低电量智能控制系统，可以在电池电量过低的情况下自动降低能量输出，以保障续航里程，让车主向着目的地轻松更近一步。<br>\r\n&nbsp;&nbsp;&nbsp;&nbsp;此外，该系统允许车辆在电量显示为0的情况下，还能以较低速度行驶一段时间，既方便为车辆寻找在周边附近的充电桩，也便于车主及时将车辆移至不影响交通的安全地带，确保乘员与车辆安全。即使车辆完全不能移动，应急电量依然可以为整车供电20分钟，保障紧急情况下车主手机充电等用电需求，体现了朗逸电动版无微不至的人性化关爱。<br>\r\n&nbsp;&nbsp;&nbsp;&nbsp;得益于领先精准的电控系统，朗逸电动版可以控制电池系统在最佳状态下开展工作，提高电池效率和可靠性，同时控制电机功率与扭矩输出，实现动力精准输出，保障续航里程持久耐用，为广大消费者带来高效都市出行新体验。<br>', 1, '312.jpg', '1', '2019-06-17 19:01:17', '高效生活e触即发 解密朗逸电动版领先电控系统', 4);
INSERT INTO `info` VALUES (125, 'cy', ' &nbsp;&nbsp;&nbsp;&nbsp;不懂的人会觉得汽车水箱里面加的是水，其实不是的，而是防冻液，那为什么不能用自来水代替呢？<br>\r\n&nbsp;&nbsp;&nbsp;&nbsp;那是因为汽车的水箱需要负责散热降温，但自来水容易沸腾，里面还有很多的物质，容易生成锈迹，而防冻液可以降温，控制温度，还有一定的清洁作用。另外，在冬天车里面要是自来水，很可能出现被冻坏的情况，但防冻液在零下40多度都不会有问题。<br>', 1, '385.jpg', '1', '2019-06-17 19:22:00', '水箱加的是什么水？', 6);
INSERT INTO `info` VALUES (126, 'cy', ' &nbsp;&nbsp;&nbsp;&nbsp;排气管冒白烟：主要是燃油没有充分燃烧就从排气管排出，形成了乳白色的烟，这个现象在冬季比较常见，因为温度低造成燃油雾化不良，一般在启动热车，温度上升后就会消失。<br>\r\n&nbsp;&nbsp;&nbsp;&nbsp;排气管冒蓝烟：说明车子在烧机油，一方面可能是因为机油加多了，进入了气缸内，另一方面可能是因为气缸壁和活塞之间间隙过大，机油进入了气缸，最好去4S店检查发动机，及时维修。<br>\r\n&nbsp;&nbsp;&nbsp;&nbsp;排气管冒黑烟：说明汽油燃烧不充分，高温下会分解成大量碳颗粒，碳是黑色的，所以这时候排出的尾气是黑色的。如果是长时间冒黑烟，可能是空气滤清器堵塞、喷油器有故障雾化不良、氧传感器故障、进气系统有漏气、火花塞跳火等原因，需要去修理，该更换的要更换。<br>\r\n\r\n\r\n', 1, '391.jpg', '1', '2019-06-17 19:28:21', '排气管冒白烟，蓝烟和黑烟是什么原因？', 6);
INSERT INTO `info` VALUES (127, 'cy', ' &nbsp;&nbsp;&nbsp;&nbsp;拆卸蓄电池的时候一定要按照先负极再正极的顺序来操作，如果顺序反了，可能引发短路。安装新的蓄电池，要先正后负，确认装好了之后，还要发动机运转一会将蓄电池充满电，以免出现不要有的麻烦。<br>', 1, '398.jpg', '1', '2019-06-17 19:29:47', '更换蓄电池，记好正负极', 6);
INSERT INTO `info` VALUES (128, 'cy', ' &nbsp;&nbsp;&nbsp;&nbsp;汽车冷启动或在低温运行时有敲缸声音，但发动机水温正常后，声音消失,，这种情况可以不用急于处理，但尽量不要在车未热时拉高转速。但当发动机达到正常工作温度时，还有明显的敲缸声，甚至更为严重，应尽快送检维修，不要再继续行驶了。<br>', 1, '243.jpg', '1', '2019-06-17 19:31:51', '敲缸怎么判断以及处理方法', 6);

-- ----------------------------
-- Table structure for pic
-- ----------------------------
DROP TABLE IF EXISTS `pic`;
CREATE TABLE `pic`  (
  `pic_id` int(255) NOT NULL AUTO_INCREMENT,
  `pic_author` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pic_content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `pic_sort` int(255) NULL DEFAULT NULL,
  `pic_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pic_publishStatus` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pic_publishTime` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pic_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `category_id` int(255) NULL DEFAULT NULL,
  PRIMARY KEY (`pic_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 41 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pic
-- ----------------------------
INSERT INTO `pic` VALUES (7, 'cy', ' 汽车座椅', 1, 'ns1.jpg', '1', '2019-06-11 20:15:31', '内饰1', 1);
INSERT INTO `pic` VALUES (9, 'cy', ' 汽车换挡杆', 1, 'ns3.jpg', '1', '2019-06-11 20:23:25', '内饰3', 1);
INSERT INTO `pic` VALUES (10, 'cy', ' 汽车仪表盘2', 1, 'ns4.jpg', '1', '2019-06-11 20:24:11', '内饰4', 1);
INSERT INTO `pic` VALUES (11, 'cy', ' 汽车内饰5', 1, 'ns5.jpg', '1', '2019-06-11 20:27:18', '内饰5', 1);
INSERT INTO `pic` VALUES (12, 'cy', ' 汽车内饰6', 1, 'ns6.jpg', '1', '2019-06-11 20:27:46', '内饰6', 1);
INSERT INTO `pic` VALUES (13, 'cy', ' 内饰2', 1, 'ns2.jpg', '1', '2019-06-11 21:57:39', '内饰2', 1);
INSERT INTO `pic` VALUES (14, 'cy', ' 内饰7', 1, 'ns7.jpg', '1', '2019-06-11 22:02:46', '内饰7', 1);
INSERT INTO `pic` VALUES (15, 'cy', ' 内饰8', 1, 'ns2.jpg', '1', '2019-06-11 22:03:30', '内饰8', 1);
INSERT INTO `pic` VALUES (16, 'cy', ' 内饰9', 1, 'ns6.jpg', '1', '2019-06-11 22:03:57', '内饰9', 1);
INSERT INTO `pic` VALUES (17, 'cy', ' 内饰10', 1, 'ns7.jpg', '1', '2019-06-11 22:04:23', '内饰10', 1);
INSERT INTO `pic` VALUES (27, 'cy', '级　别：紧凑型车 </br>\r\n结　构： 三厢车 </br>\r\n油　耗：5.4-6.8L/100km</br>\r\n排　量：1.2T|1.4T|1.6L </br>\r\n保　修：3年或10万公里</br>\r\n变速箱：手动|自动|双离合</br>', 1, 'pic01.jpg', '1', '2019-06-12 19:52:35', '速腾', 2);
INSERT INTO `pic` VALUES (30, 'cy', ' 本地参考价：18.59-31.39万<br>\r\n厂商指导价：18.59-31.39 万<br>\r\n级　别：中型SUV<br>\r\n结　构： SUV <br>\r\n油　耗：6.7-8L/100km<br>\r\n排　量：1.4T|2.0T <br>\r\n保　修：3年或10万公里<br>\r\n变速箱：双离合<br>', 1, 'pic02.jpg', '1', '2019-06-13 19:47:00', '探岳', 2);
INSERT INTO `pic` VALUES (32, 'cy', '本地参考价：50.88-81.88万<br>\r\n厂商指导价：56.98-81.98 万<br>\r\n级　别：中大型SUV<br>\r\n结　构：SUV<br>\r\n油　耗：8.9-9.2L/100km<br>\r\n排　量：2.0T|3.0T<br>\r\n保　修：3年或10万公里<br>\r\n变速箱：自动<br>\r\n\r\n', 1, 'pic05.jpg', '1', '2019-06-13 19:53:41', '途锐', 2);
INSERT INTO `pic` VALUES (34, 'cy', '本地参考价：7.29-14.99万<br>\r\n厂商指导价：10.79-15.89 万<br>\r\n级　别：紧凑型车<br>\r\n结　构：三厢车<br>\r\n油　耗：5.4-5.6L/100km<br>\r\n排　量：1.4T|1.5L|1.6L<br>\r\n保　修：3年或10万公里<br>\r\n变速箱：手动|自动|双离合<br>\r\n\r\n', 1, 'pic07.jpg', '1', '2019-06-13 19:59:02', '朗逸', 2);
INSERT INTO `pic` VALUES (35, 'cy', ' 本地参考价：9.29-13.09万<br>\r\n厂商指导价：14.29-19.69 万<br>\r\n级　别：紧凑型车<br>\r\n结　构：三厢车<br>\r\n油　耗：暂无<br>\r\n排　量：1.4T<br>\r\n保　修：3年或10万公里<br>\r\n变速箱：手动|双离合<br>\r\n\r\n', 1, 'pic08.jpg', '1', '2019-06-13 20:01:10', '凌渡', 2);
INSERT INTO `pic` VALUES (38, 'cy', '本地参考价：15.46万<br>\r\n厂商指导价：23.42 万<br>\r\n级　别：紧凑型车<br>\r\n结　构：两厢车<br>\r\n油　耗：6.5L/100km<br>\r\n排　量：2.0T<br> ', 1, 'pic06.jpg', '1', '2019-06-17 19:23:56', '高尔夫GTI', 2);
INSERT INTO `pic` VALUES (39, 'cy', ' 					 本地参考价：11.58-15.88 万<br>\r\n厂商指导价：16.58-22.38万<br>\r\n级别：紧凑型SUV<br>\r\n排量：1.4T 2.0T<br>\r\n结构：SUV<br>\r\n变速箱：双离合<br>\r\n保修：3年或10万公里<br>\r\n				', 1, 'pic04.jpg', '1', '2019-06-17 19:24:58', '途岳', 2);
INSERT INTO `pic` VALUES (40, 'cy', ' 					 本地参考价：10.58-17.38 万</br>\r\n\r\n厂商指导价：13.58-20.38万</br>\r\n级别：紧凑型SUV</br>\r\n\r\n排量：1.2T 1.4T</br>\r\n结构：SUV</br>\r\n\r\n变速箱：双离合 </br>\r\n手动保修：3年或10万公里</br>\r\n				', 1, 'pic03.jpg', '1', '2019-06-17 19:25:37', '探歌', 2);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`user_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('admin', 'ADMIN');

SET FOREIGN_KEY_CHECKS = 1;
