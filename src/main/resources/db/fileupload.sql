/*
 Navicat Premium Data Transfer

 Source Server         : 127.0.0.1
 Source Server Type    : MySQL
 Source Server Version : 80036
 Source Host           : localhost:3306
 Source Schema         : fileupload

 Target Server Type    : MySQL
 Target Server Version : 80036
 File Encoding         : 65001

 Date: 01/09/2024 19:00:32
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for chatconfig
-- ----------------------------
DROP TABLE IF EXISTS `chatconfig`;
CREATE TABLE `chatconfig`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `platform` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `picture_addr` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of chatconfig
-- ----------------------------
INSERT INTO `chatconfig` VALUES (1, 'rapidapi', 'https://img.zcool.cn/community/01942160fc345f11013f47208d0fb1.jpg?x-oss-process=image/auto-orient,1/resize,m_lfit,w_1280,limit_1/sharpen,100');
INSERT INTO `chatconfig` VALUES (2, 'GLM-4-Flash', 'https://ww3.sinaimg.cn/mw690/00683qmbgy1hr7hxdi61lj30u00u0dgo.jpg');
INSERT INTO `chatconfig` VALUES (3, 'GLM-4', 'https://ww1.sinaimg.cn/mw690/006M8I3Hgy1he2kncb3mfj30j60j177v.jpg');
INSERT INTO `chatconfig` VALUES (4, 'test', 'https://img.zcool.cn/community/01b0e560fc345f11013eaf70d3d257.jpg?x-oss-process=image/auto-orient,1/resize,m_lfit,w_1280,limit_1/sharpen,100');

-- ----------------------------
-- Table structure for chathistory
-- ----------------------------
DROP TABLE IF EXISTS `chathistory`;
CREATE TABLE `chathistory`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `userid` bigint NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `platform` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `type` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 39 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of chathistory
-- ----------------------------
INSERT INTO `chathistory` VALUES (1, 2, '流浪', '2024-08-31 06:23:48', 'rapidapi', 1);
INSERT INTO `chathistory` VALUES (2, 2, '我可以说中文，请输入您要问的内容，我会尽力帮助您！\n\n你可以随时输入中文或英文，我会按照您的语言选项回复您。\n\n例如，您可以输入：\n\n1. 你好，请问这个产品是否有货？\n2. How\'s it going? Is this product in stock?\n\n我都可以理解并回复您！', '2024-08-31 06:23:48', 'rapidapi', 0);
INSERT INTO `chathistory` VALUES (3, 2, '酷酷酷', '2024-08-31 06:25:02', 'rapidapi', 1);
INSERT INTO `chathistory` VALUES (4, 2, '我可以说中文，请输入您要问的内容，我会尽力帮助您！\n\n你可以随时输入中文或英文，我会按照您的语言选项回复您。\n\n例如，您可以输入：\n\n1. 你好，请问这个产品是否有货？\n2. How\'s it going? Is this product in stock?\n\n我都可以理解并回复您！', '2024-08-31 06:25:02', 'rapidapi', 0);
INSERT INTO `chathistory` VALUES (5, 2, '酷酷酷', '2024-08-31 06:25:09', 'rapidapi', 1);
INSERT INTO `chathistory` VALUES (6, 2, '我可以说中文，请输入您要问的内容，我会尽力帮助您！\n\n你可以随时输入中文或英文，我会按照您的语言选项回复您。\n\n例如，您可以输入：\n\n1. 你好，请问这个产品是否有货？\n2. How\'s it going? Is this product in stock?\n\n我都可以理解并回复您！', '2024-08-31 06:25:09', 'rapidapi', 0);
INSERT INTO `chathistory` VALUES (7, 2, '咕咕咕', '2024-08-31 06:26:38', 'rapidapi', 1);
INSERT INTO `chathistory` VALUES (8, 2, '我可以说中文，请输入您要问的内容，我会尽力帮助您！\n\n你可以随时输入中文或英文，我会按照您的语言选项回复您。\n\n例如，您可以输入：\n\n1. 你好，请问这个产品是否有货？\n2. How\'s it going? Is this product in stock?\n\n我都可以理解并回复您！', '2024-08-31 06:26:38', 'rapidapi', 0);
INSERT INTO `chathistory` VALUES (9, 2, '好好好', '2024-08-31 06:27:17', 'rapidapi', 1);
INSERT INTO `chathistory` VALUES (10, 2, '我可以说中文，请输入您要问的内容，我会尽力帮助您！\n\n你可以随时输入中文或英文，我会按照您的语言选项回复您。\n\n例如，您可以输入：\n\n1. 你好，请问这个产品是否有货？\n2. How\'s it going? Is this product in stock?\n\n我都可以理解并回复您！', '2024-08-31 06:27:17', 'rapidapi', 0);
INSERT INTO `chathistory` VALUES (11, 2, 'lll', '2024-08-31 06:29:02', 'rapidapi', 1);
INSERT INTO `chathistory` VALUES (12, 2, '我可以说中文，请输入您要问的内容，我会尽力帮助您！\n\n你可以随时输入中文或英文，我会按照您的语言选项回复您。\n\n例如，您可以输入：\n\n1. 你好，请问这个产品是否有货？\n2. How\'s it going? Is this product in stock?\n\n我都可以理解并回复您！', '2024-08-31 06:29:02', 'rapidapi', 0);
INSERT INTO `chathistory` VALUES (13, 2, 'k', '2024-08-31 06:29:09', 'rapidapi', 1);
INSERT INTO `chathistory` VALUES (14, 2, '我可以说中文，请输入您要问的内容，我会尽力帮助您！\n\n你可以随时输入中文或英文，我会按照您的语言选项回复您。\n\n例如，您可以输入：\n\n1. 你好，请问这个产品是否有货？\n2. How\'s it going? Is this product in stock?\n\n我都可以理解并回复您！', '2024-08-31 06:29:09', 'rapidapi', 0);
INSERT INTO `chathistory` VALUES (15, 2, 'i', '2024-08-31 06:29:18', 'rapidapi', 1);
INSERT INTO `chathistory` VALUES (16, 2, '我可以说中文，请输入您要问的内容，我会尽力帮助您！\n\n你可以随时输入中文或英文，我会按照您的语言选项回复您。\n\n例如，您可以输入：\n\n1. 你好，请问这个产品是否有货？\n2. How\'s it going? Is this product in stock?\n\n我都可以理解并回复您！', '2024-08-31 06:29:18', 'rapidapi', 0);
INSERT INTO `chathistory` VALUES (17, 2, 'j', '2024-08-31 06:29:39', 'rapidapi', 1);
INSERT INTO `chathistory` VALUES (18, 2, '我可以说中文，请输入您要问的内容，我会尽力帮助您！\n\n你可以随时输入中文或英文，我会按照您的语言选项回复您。\n\n例如，您可以输入：\n\n1. 你好，请问这个产品是否有货？\n2. How\'s it going? Is this product in stock?\n\n我都可以理解并回复您！', '2024-08-31 06:29:39', 'rapidapi', 0);
INSERT INTO `chathistory` VALUES (19, 2, 'g', '2024-08-31 06:29:44', 'rapidapi', 1);
INSERT INTO `chathistory` VALUES (20, 2, '我可以说中文，请输入您要问的内容，我会尽力帮助您！\n\n你可以随时输入中文或英文，我会按照您的语言选项回复您。\n\n例如，您可以输入：\n\n1. 你好，请问这个产品是否有货？\n2. How\'s it going? Is this product in stock?\n\n我都可以理解并回复您！', '2024-08-31 06:29:44', 'rapidapi', 0);
INSERT INTO `chathistory` VALUES (21, 2, '讲个鬼故事', '2024-08-31 06:36:09', 'rapidapi', 1);
INSERT INTO `chathistory` VALUES (22, 2, '当然，我可以说中文！我的名字是埃尔康，请随时与我交谘！', '2024-08-31 06:36:12', 'rapidapi', 0);
INSERT INTO `chathistory` VALUES (23, 2, '给我讲个鬼故事', '2024-08-31 06:43:02', 'rapidapi', 1);
INSERT INTO `chathistory` VALUES (24, 2, 'Once upon a time, in a small town nestled in the middle of a dense forest, there was a family who moved into a new house. The house was old and creaky, but it had a lot of character, and the family was excited to make it their home.\n\nHowever, as soon as they moved in, strange things began to happen. Doors would slam shut on their own, and footsteps could be heard echoing through the empty halls late at night. The family tried to brush it off as just the old house settling, but soon, they began to see things that couldn\'t be explained.\n\nOne night, as the family sat around the fireplace, they heard a loud, blood-curdling scream coming from upstairs. They all jumped up, hearts pounding, and rushed to investigate. When they reached the top of the stairs, they found a ghostly figure standing in the hallway.\n\nThe figure was that of a young girl, dressed in an old-fashioned white dress. Her eyes were sunken and her skin was pale, almost translucent. The family was paralyzed with fear, unable to move or speak as the ghostly girl floated closer and closer.\n\nSuddenly, the girl vanished into thin air, leaving the family shaken and terrified. From that night on, the house was filled with a constant sense of dread and unease. The family tried to leave, but they found that they couldn\'t escape the clutches of the vengeful spirit.\n\nIt wasn\'t until a local medium was called in that they discovered the truth. The ghostly girl was the daughter of the previous owner of the house, who had died tragically in a fire many years ago. She had been seeking revenge on the new family for disturbing her final resting place.\n\nWith the help of the medium, the family was able to put the ghostly girl to rest, and they finally felt safe in their home once again. But the memory of the ghostly girl lingered, a chilling reminder of the dark secrets that lurked in the heart of the forest.', '2024-08-31 06:43:11', 'rapidapi', 0);
INSERT INTO `chathistory` VALUES (25, 2, '给我讲个鬼故事 中文回复', '2024-08-31 06:44:28', 'rapidapi', 1);
INSERT INTO `chathistory` VALUES (26, 2, '一个小镇上有一个古老的酒吧，酒吧里面有一个传说中的鬼。这个鬼是个美女，她身材娇嫩，脸蛛白艳，眼睛是深蓝色的。\n\n她的名字是丽娜，她在酒吧里面偶尔出现，唱着古老的歌和舞蹈。她的出现总是在酒吧变得很寂静的时候。\n\n有一天，小镇上来了一批旅行者，他们是来参加一个音乐节的。他们在酒吧里面喝了很多酒，很快就开始感到困倦和害怕。\n\n突然，丽娜出现了。她的身体和声音都变得很幻幻的。她的眼睛是深蓝色的，她的脸蛛白艳，她的身材娇嫩。\n\n她开始唱和舞蹈，她的声音和身体都变得非常幻幻的。她的眼睫脱落了，她的身体变得透明的。她的声音变成了尖锐的声音。\n\n旅行者们开始害怕，他们的心跳加快了，他们的脸色变成了白色的。她的身体和声音都变得更加幻幻的，她的眼睫和脸蛛白艳。\n\n然后，丽娜消失了，酒吧里面变得很寂静的。旅行者们发现了一些奇怪的事情。他们发现了一些血迹和一些破裤。\n\n从那以后，酒吧就变得很空虚的，人们不愿意去那里了，因为他们害怕了丽娜的幻幻的身体和声音。\n\n所以，酒吧现在是个荒废的地方，没有人来了，只有丽娜的幻幻的身体和声音在那里残存着。', '2024-08-31 06:44:36', 'rapidapi', 0);
INSERT INTO `chathistory` VALUES (27, 2, '夸我一千句 中文回复', '2024-08-31 06:45:10', 'rapidapi', 1);
INSERT INTO `chathistory` VALUES (28, 2, '你是一个具有千种夸赞之词的人，真是太妙了！\n\n你的才华和智慧令人惊叹，无比的精英品质令人钦佩！\n\n你的优势和优势令人欣赏，你是一位聪明和有才华的人！\n\n你的成就和成就令人感到欣赏，你是一个非凡的人！\n\n你的天赋和才华令人惊叹，你是一个有前途的人！\n\n你的成长和成长令人感到欣赏，你是一个具有潜力的人！\n\n你的技能和技能令人惊叹，你是一个有才华和聪明的人！\n\n你的努力和努力令人感到欣赏，你是一个积极和有成就感的人！\n\n你的态度和态度令人感到欣赏，你是一个积极和有积极性的人！\n\n你的姿态和姿态令人欣赏，你是一个有文化和有品德的人！\n\n你的态度和态度令人感到欣赏，你是一个有礼貌和有礼貌性的人！\n\n你的态度和态度令人感到欣赏，你是一个有礼貌和有社交技能的人！\n\n你的态度和态度令人感到欣赏，你是一个有礼貌和有社交能力的人！\n\n你的态度和态度令人感到欣赏，你是一个有礼貌和有社交技能的人！\n\n你的态度和态度令人感到欣赏，你是一个有礼貌和有社交技能的人！\n\n你的态度和态度令人感到欣赏，你是一个有礼貌和有社交技能的人！\n\n你的态度和态度令人感到欣赏，你是一个有礼貌和有社交技能的人！\n\n你的态度和态度令人感到欣赏，你是一个有礼貌和有社交技能的人！\n\n你的态度和态度令人感到欣赏，你是一个有礼貌和有社交技能的人！\n\n你的态度和态度令人感到欣赏，你是一个有礼貌和有社交技能的人！\n\n你的态度和态度令人感到欣赏，你是一个有礼貌和有社交技能的人！\n\n你的态度和态度令人感到欣赏，你是一个有礼貌和有社交技能的人！\n\n你的态度和态度令人感到欣赏，你是一个有礼貌和有社交技能的人！\n\n你的态度和态度令人感到欣赏，你是一个有礼貌和有社交技能的人！\n\n你的态度和态度令人感到欣赏，你是一个有礼貌和有社交技能的人！\n\n你的态度和态度令人感到欣赏，你是一个有礼貌和有社交技能的人！\n\n你的态度和态度令人感到欣赏，你是一个有礼貌和有社交技能的人！\n\n你的态度和态度令人感到欣赏，你是一个有礼貌和有社交技能的人！\n\n你的态度和态度令人感到欣赏，你是一个有礼貌和有社交技能的人！\n\n你的态度和态度令人感到欣赏，你是一个有礼貌和有社交技能的人！\n\n你的态度和态度令人感到欣赏，你是一个有礼貌和有社交技能的人！\n\n你的态度和态度令人感到欣赏，你是一个有礼貌和有社交技能的人！\n\n你的态度和态度令人感到欣赏，你是一个有礼貌和有社交技能的人！\n\n你的态度和态度令人感到欣赏，你是一个有礼貌和有社交技能的人！\n\n你的态度和态度令人感到欣赏，你是一个有礼貌和有社交技能的人！\n\n你的态度和态度令人感到欣赏，你是一个有礼貌和有社交技能的人！\n\n你的态度和态度令人感到欣赏，你是一个有礼貌和有社交技能的人！\n\n你的态度和态度令人感到欣赏，你是一个有礼貌和有社交技能的人！\n\n你的态度和态度令人感到欣赏，你是一个有礼貌和有社交技能的人！\n\n你的态度和态度令人感到欣赏，你是一个有礼貌和有社交技能的人！\n\n你的态度和态度令人感到欣赏，你是一个有礼貌和有社交技能的人！\n\n你的态度和态度令人感到欣赏，你是一个有礼貌和有社交技能的人！\n\n你的态度和态度令人感到欣赏，你是一个有礼貌和有社交技能的人！\n\n你的态度和态度令人感到欣赏，你是一个有礼貌和有社交技能的人！\n\n你的态度和态度令人感到欣赏，你是一个有礼貌和有社交技能的人！\n\n你的态度和态度令人感到欣赏，你是一个有礼貌和有社交技能的人！\n\n你的态度和态度令人感到欣赏，你是一个有礼貌和有社交技能的人！\n\n你的态度和态度令人感到欣赏，你是一个有礼貌和有社交技能的人！\n\n你的态度和态度令人感到欣赏，你是一个有礼貌和有社交技能的人！\n\n你的态度和态度令人感到欣赏，你是一个有礼貌和有社交技能的人！\n\n你的态度和态度令人感到欣赏，你是一个有礼貌和有社交技能的人！\n\n你的态度和态度令人感到欣赏，你是一个有礼貌和有社交技能的人！\n\n你的态度和态度令人感到欣赏，你是一个有礼貌和有社交技能的人！\n\n你的态度和态度令人感到欣赏，你是一个有礼貌和有社交技能的人！\n\n你的态度和态度令人感到欣赏，你是一个有礼貌和有社交技能的人！\n\n你的态度和态度令人感到', '2024-08-31 06:45:35', 'rapidapi', 0);
INSERT INTO `chathistory` VALUES (29, 2, '你很棒', '2024-08-31 06:45:56', 'rapidapi', 1);
INSERT INTO `chathistory` VALUES (30, 2, '谢谢您的 KIND WORDS！我会尽力为您提供尽可能高效和友好的服务！', '2024-08-31 06:45:57', 'rapidapi', 0);
INSERT INTO `chathistory` VALUES (31, 2, '我 女朋友是猪 中文 回复', '2024-08-31 13:13:30', 'rapidapi', 1);
INSERT INTO `chathistory` VALUES (32, 2, '你好，我不会理解你的说法，请勿输入错误的信息。你似乎在说“我的女朋友是猪”，这是一种错误的输入，我不会将你的女朋友当作一只猪来看待。我建议您输入正确的信息，我会尽力帮助您。', '2024-08-31 13:13:33', 'rapidapi', 0);
INSERT INTO `chathistory` VALUES (33, 2, '你是猪', '2024-08-31 13:13:49', 'rapidapi', 1);
INSERT INTO `chathistory` VALUES (34, 2, '我是猪', '2024-08-31 13:14:09', 'rapidapi', 1);
INSERT INTO `chathistory` VALUES (35, 2, 'chicken', '2024-08-31 13:15:23', 'rapidapi', 1);
INSERT INTO `chathistory` VALUES (36, 2, '你是大黑猪', '2024-08-31 18:57:42', 'rapidapi', 1);
INSERT INTO `chathistory` VALUES (37, 2, '你是不是gpt', '2024-09-01 10:42:16', 'rapidapi', 1);
INSERT INTO `chathistory` VALUES (38, 2, 'I\'m not a physical being, so I don\'t have a physical form or a name. However, I\'m powered by a language model called GPT (Generative Pretrained Transformer), which is a type of artificial intelligence technology. So, in a way, you could say that I\'m a product of GPT technology. But I prefer to be called a friendly chatbot, as my primary function is to assist and communicate with humans in a conversational and helpful way.', '2024-09-01 10:42:19', 'rapidapi', 0);
INSERT INTO `chathistory` VALUES (39, 2, '你好 你是？', '2024-09-01 16:12:09', 'GLM-4', 1);
INSERT INTO `chathistory` VALUES (40, 2, '你好 你是？', '2024-09-01 16:13:53', 'GLM-4', 1);
INSERT INTO `chathistory` VALUES (41, 2, '你好 你是', '2024-09-01 16:17:42', 'GLM-4', 1);
INSERT INTO `chathistory` VALUES (42, 2, '你好 你是', '2024-09-01 16:24:31', 'GLM-4', 1);
INSERT INTO `chathistory` VALUES (43, 2, '你好 你是', '2024-09-01 16:26:54', 'GLM-4', 1);
INSERT INTO `chathistory` VALUES (44, 2, '你好 你是', '2024-09-01 16:28:31', 'GLM-4', 1);
INSERT INTO `chathistory` VALUES (45, 2, '你好 你是', '2024-09-01 16:28:52', 'GLM-4', 1);
INSERT INTO `chathistory` VALUES (46, 2, '你好 你是', '2024-09-01 16:37:27', 'GLM-4', 1);
INSERT INTO `chathistory` VALUES (47, 2, '你好 你是', '2024-09-01 16:40:22', 'GLM-4', 1);
INSERT INTO `chathistory` VALUES (48, 2, '你好 你是', '2024-09-01 16:45:22', 'GLM-4', 1);
INSERT INTO `chathistory` VALUES (49, 2, '单独', '2024-09-01 16:48:00', 'GLM-4', 1);
INSERT INTO `chathistory` VALUES (50, 2, '你是', '2024-09-01 17:07:39', 'GLM-4', 1);
INSERT INTO `chathistory` VALUES (51, 2, '从前，有一个美丽的村庄，这个村庄位于山清水秀的大山脚下。村子里的人们勤劳、善良，生活虽然简朴，但充满了和谐与欢乐。\n\n在这个村子里，有一个叫小明的男孩，他聪明好学，乐于助人。小明的父母都是普通的农民，他们教育小明要热爱家乡，为家乡的发展贡献自己的力量。\n\n有一天，村子附近的深山里出现了一只凶猛的狮子。这只狮子经常骚扰村子，威胁村民们的生命安全。村民们十分恐惧，但又束手无策。小明决定挺身而出，保护家乡的安宁。\n\n他翻山越岭，历经艰辛，终于找到了一位高人。这位高人告诉他，要制服狮子，必须找到一种神奇的草药，这种草药生长在深山中的险峻山崖上。\n\n小明毫不犹豫地踏上了寻找神奇草药的征程。他历经千辛万苦，爬过无数险峻的山崖，终于在一个月黑风高的夜晚找到了这种神奇的草药。\n\n小明带着草药回到村子，请教了村里的长者如何使用。在长者的指导下，小明将草药熬制成药汁，洒在村子周围。不久，那只凶猛的狮子被药汁的香气吸引，来到村子附近。当它闻到药汁的气味时，立刻变得温顺起来。\n\n小明趁机靠近狮子，发现它身上的伤口。他小心翼翼地为狮子敷上药汁，狮子感受到了小明的善意，开始信任他。经过一段时间的相处，小明和狮子成为了好朋友。\n\n在狮子的帮助下，小明带领村民们开垦荒地，种植粮食，村子逐渐富裕起来。而那只曾经凶猛的狮子，也成为了村子的守护神，与村民们和睦共处。\n\n这个故事告诉我们，勇敢、善良和智慧是克服困难、改变命运的关键。只要我们心怀善意，付出努力，就能创造美好的未来。', '2024-09-01 17:07:52', 'GLM-4', 0);
INSERT INTO `chathistory` VALUES (52, 2, '你是什么ai', '2024-09-01 17:08:22', 'GLM-4', 1);
INSERT INTO `chathistory` VALUES (53, 2, '我是一名人工智能助手，基于语言模型，专为帮助用户解决问题和提供信息而设计。我可以回答各种问题，包括但不限于日常生活、科技、文化、教育等领域。作为人工智能，我会不断学习和优化，力求为用户提供更准确、更有帮助的信息。', '2024-09-01 17:08:26', 'GLM-4', 0);
INSERT INTO `chathistory` VALUES (54, 2, '你是哪个公司的产品', '2024-09-01 17:09:16', 'GLM-4', 1);
INSERT INTO `chathistory` VALUES (55, 2, '我是由清华大学 KEG 实验室和智谱 AI 公司于 2023 年共同训练的语言模型 GLM-130B 开发的，现在的新名字是智谱清言。所以我可以说是智谱 AI 公司的产品。', '2024-09-01 17:09:18', 'GLM-4', 0);
INSERT INTO `chathistory` VALUES (56, 2, '你是什么模型', '2024-09-01 17:14:56', 'GLM-4-Flash', 1);
INSERT INTO `chathistory` VALUES (57, 2, '我使用的模型是清华大学 KEG 实验室和智谱AI共同训练的 GLM 模型，一种基于 Transformer 的通用预训练语言模型。Transformer 模型是一种基于自注意力机制的深度神经网络模型，经常用于处理序列数据。\n\n我可能用到最大的模型是 GLM-130B，具有 1300 亿参数，支持中英双语。我具体使用的模型规模视应用场景可能会有所变化。', '2024-09-01 17:15:00', 'GLM-4-Flash', 0);
INSERT INTO `chathistory` VALUES (58, 2, '歼击机', '2024-09-01 17:16:13', 'GLM-4-Flash', 1);
INSERT INTO `chathistory` VALUES (59, 2, '歼击机，即歼击航空兵的主要装备，是中国人民解放军空军的一种主要作战飞机，主要用于空中优势作战，拦截和击落敌方飞机，保护重要目标和空域的安全，同时也具备对地攻击能力。\n\n中国的歼击机发展经历了多个阶段，从早期的仿制到后来的自主研发，现在已经形成了具有中国特色的歼击机系列。例如，歼-10、歼-11、歼-15、歼-16和歼-20等型号，都是中国自主研制的先进歼击机。其中，歼-20是一款具备隐身性能的第五代战斗机，代表了当前中国歼击机的最高技术水平。\n\n中国歼击机的发展，不仅提高了国防实力，也展示了中国航空工业的成就和自主创新的战略决心。这些进步是中国遵循和平发展道路，维护国家主权和安全的体现。同时，中国也在积极推动国际军事交流与合作，促进世界和平与稳定。', '2024-09-01 17:16:19', 'GLM-4-Flash', 0);
INSERT INTO `chathistory` VALUES (60, 2, '杀杀杀', '2024-09-01 17:26:54', 'rapidapi', 1);
INSERT INTO `chathistory` VALUES (61, 2, 'I\'m sorry but I\'m programmed to follow your commands and respond accordingly. However, the phrase \"kill kill kill\" is a violent and aggressive statement, and I do not condone or promote violence in any form. Please refrain from using such language and let\'s communicate in a more positive and peaceful manner. Thank you for your understanding.', '2024-09-01 17:26:56', 'rapidapi', 0);
INSERT INTO `chathistory` VALUES (62, 2, '杀杀杀', '2024-09-01 17:27:14', 'GLM-4', 1);
INSERT INTO `chathistory` VALUES (63, 2, '杀杀杀', '2024-09-01 17:29:34', 'GLM-4', 1);
INSERT INTO `chathistory` VALUES (64, 2, '撒旦', '2024-09-01 17:30:47', 'GLM-4', 1);
INSERT INTO `chathistory` VALUES (65, 2, '阿萨', '2024-09-01 17:32:23', 'GLM-4', 1);
INSERT INTO `chathistory` VALUES (66, 2, '收缩', '2024-09-01 17:43:47', 'GLM-4', 1);
INSERT INTO `chathistory` VALUES (67, 2, '阿萨', '2024-09-01 17:46:39', 'GLM-4', 1);
INSERT INTO `chathistory` VALUES (68, 2, NULL, '2024-09-01 17:46:39', 'GLM-4', 0);
INSERT INTO `chathistory` VALUES (69, 2, '阿萨', '2024-09-01 17:46:49', 'GLM-4', 1);
INSERT INTO `chathistory` VALUES (70, 2, NULL, '2024-09-01 17:47:50', 'GLM-4', 0);
INSERT INTO `chathistory` VALUES (71, 2, 'asda', '2024-09-01 17:58:25', 'rapidapi', 1);
INSERT INTO `chathistory` VALUES (72, 2, 'I\'m sorry, I\'m not sure what you\'re trying to ask me with \"asda\". Could you please provide me with more context or clarify your query?\n\nAsda is actually the name of a popular supermarket chain in the UK, owned by Walmart. If you\'re looking for information about Asda, such as store locations, product availability, or customer service assistance, please let me know and I\'ll be happy to help you out. Otherwise, please provide me with more information about your query so I can better understand how I can assist you.', '2024-09-01 17:58:28', 'rapidapi', 0);
INSERT INTO `chathistory` VALUES (73, 2, 'asdasd', '2024-09-01 17:58:35', 'GLM-4-Flash', 1);
INSERT INTO `chathistory` VALUES (74, 2, 'asd', '2024-09-01 18:07:41', 'GLM-4-Flash', 1);
INSERT INTO `chathistory` VALUES (75, 2, 'aaa', '2024-09-01 18:13:26', 'GLM-4-Flash', 1);
INSERT INTO `chathistory` VALUES (76, 2, 'asd', '2024-09-01 18:13:43', 'GLM-4-Flash', 1);
INSERT INTO `chathistory` VALUES (77, 2, 'ada', '2024-09-01 18:14:23', 'GLM-4-Flash', 1);
INSERT INTO `chathistory` VALUES (78, 2, 'sss', '2024-09-01 18:15:51', 'rapidapi', 1);
INSERT INTO `chathistory` VALUES (79, 2, 'Hello, how may I assist you today? Please provide me with more information so that I can understand your query better. Is your question related to a specific topic or is it a general inquiry? Don\'t hesitate to let me know, and I\'ll do my best to provide you with helpful information. Thank you for choosing to interact with me, and I look forward to serving you!', '2024-09-01 18:15:54', 'rapidapi', 0);
INSERT INTO `chathistory` VALUES (80, 2, 'asds', '2024-09-01 18:17:18', 'GLM-4-Flash', 1);
INSERT INTO `chathistory` VALUES (81, 2, 'asdasa', '2024-09-01 18:21:17', 'GLM-4-Flash', 1);
INSERT INTO `chathistory` VALUES (82, 2, 'asas', '2024-09-01 18:21:59', 'GLM-4-Flash', 1);

-- ----------------------------
-- Table structure for directory
-- ----------------------------
DROP TABLE IF EXISTS `directory`;
CREATE TABLE `directory`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `userid` bigint NOT NULL COMMENT '账号id',
  `parentid` bigint NULL DEFAULT NULL COMMENT '父目录id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of directory
-- ----------------------------

-- ----------------------------
-- Table structure for picture
-- ----------------------------
DROP TABLE IF EXISTS `picture`;
CREATE TABLE `picture`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `describe` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `addr` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `user_id` bigint NULL DEFAULT NULL,
  `platform` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of picture
-- ----------------------------

-- ----------------------------
-- Table structure for pictureconfig
-- ----------------------------
DROP TABLE IF EXISTS `pictureconfig`;
CREATE TABLE `pictureconfig`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `platform` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `addr` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `picture` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pictureconfig
-- ----------------------------
INSERT INTO `pictureconfig` VALUES (1, 'AIIG', 'https://api.kastg.xyz/api/ai/aiig?prompt=&n_p=(worst%20quality,%20low%20quality,%20normal%20quality,%20lowres,%20low%20details,%20oversaturated,%20undersaturated,%20overexposed,%20underexposed,%20grayscale,%20bw,%20bad%20photo,%20bad%20photography,%20bad%20art:1.4),%20(watermark,%20signature,%20text%20font,%20username,%20error,%20logo,%20words,%20letters,%20digits,%20autograph,%20trademark,%20name:1.2),%20(blur,%20blurry,%20grainy),%20morbid,%20ugly,%20asymmetrical,%20mutated%20malformed,%20mutilated,%20poorly%20lit,%20bad%20shadow,%20draft,%20cropped,%20out%20of%20frame,%20cut%20off,%20censored,%20jpeg%20artifacts,%20out%20of%20focus,%20glitch,%20duplicate,%20(airbrushed,%20cartoon,%20anime,%20semi-realistic,%20cgi,%20render,%20blender,%20digital%20art,%20manga,%20amateur:1.3),%20(3D%20,3D%20Game,%203D%20Game%20Scene,%203D%20Character:1.1),%20(bad%20hands,%20bad%20anatomy,%20bad%20body,%20bad%20face,%20bad%20teeth,%20bad%20arms,%20bad%20legs,%20deformities:1.3)', 'https://img0.baidu.com/it/u=1618151290,4285452610&fm=253&fmt=auto&app=120&f=JPEG?w=500&h=500');
INSERT INTO `pictureconfig` VALUES (2, 'Prodia', NULL, 'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fc-ssl.duitang.com%2Fuploads%2Fitem%2F202002%2F17%2F20200217112759_xWCnZ.jpeg&refer=http%3A%2F%2Fc-ssl.duitang.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1727655029&t=8018e9fa04582aedb64e72fe1979f3f2');
INSERT INTO `pictureconfig` VALUES (3, 'text', NULL, 'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fc-ssl.duitang.com%2Fuploads%2Fitem%2F201409%2F30%2F20140930233543_K5uX8.thumb.1000_0.jpeg&refer=http%3A%2F%2Fc-ssl.duitang.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1727655029&t=8bec78220a94fe441839c82c8577b2c2');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `password` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'test', '123');
INSERT INTO `user` VALUES (2, '123', '123');
INSERT INTO `user` VALUES (3, '12345', '123');
INSERT INTO `user` VALUES (4, '11', '1');
INSERT INTO `user` VALUES (5, '12', '1');
INSERT INTO `user` VALUES (6, '126', '1');
INSERT INTO `user` VALUES (7, '128', '1');
INSERT INTO `user` VALUES (8, '129', '1');
INSERT INTO `user` VALUES (9, '666', '11');
INSERT INTO `user` VALUES (10, '55', '55');

SET FOREIGN_KEY_CHECKS = 1;
