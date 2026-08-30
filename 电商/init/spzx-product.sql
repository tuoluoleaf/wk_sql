/*
 Navicat Premium Data Transfer

 Source Server         : 192.168.6.100_spzx_3306
 Source Server Type    : MySQL
 Source Server Version : 80030
 Source Host           : 192.168.6.100:3306
 Source Schema         : spzx-product

 Target Server Type    : MySQL
 Target Server Version : 80030
 File Encoding         : 65001

 Date: 06/11/2024 11:54:16
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- 切库
use `spzx-product`;

-- ----------------------------
-- Table structure for brand
-- ----------------------------
DROP TABLE IF EXISTS `brand`;
CREATE TABLE `brand`
(
    `id`          bigint                                                        NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `name`        varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL     DEFAULT NULL COMMENT '品牌名称',
    `logo`        varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL     DEFAULT NULL COMMENT '品牌图标',
    `create_time` timestamp                                                     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `create_by`   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NULL     DEFAULT NULL COMMENT '创建者',
    `update_time` timestamp                                                     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `update_by`   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NULL     DEFAULT NULL COMMENT '更新者',
    `del_flag`    char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci      NOT NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
    `remark`      varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL     DEFAULT NULL COMMENT '备注',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 21
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci COMMENT = '分类品牌'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of brand
-- ----------------------------
INSERT INTO `brand`
VALUES (1, '华为', 'http://139.198.127.41:9000/sph/20230506/华为.png', '2024-01-09 18:15:05', 'admin',
        '2024-11-05 21:11:12', 'admin', '0', NULL);
INSERT INTO `brand`
VALUES (2, '小米', 'http://139.198.127.41:9000/spzx/2024/02/03/xm_20240203154528A007.png', '2024-02-03 23:45:29',
        'admin', '2024-09-23 14:31:30', 'admin', '0', NULL);
INSERT INTO `brand`
VALUES (6, '鸿蒙', 'http://139.198.127.41:9000/spzx/2024/02/03/xm_20240203154528A007.png', '2024-09-19 14:41:49',
        'admin', '2024-11-05 21:11:12', 'admin', '0', NULL);
INSERT INTO `brand`
VALUES (10, 'VIVO', 'http://139.198.127.41:9000/spzx/2024/02/03/xm_20240203154528A007.png', '2024-09-19 14:46:20',
        'admin', '2024-11-05 21:11:12', 'admin', '0', NULL);
INSERT INTO `brand`
VALUES (13, '联想', 'http://139.198.127.41:9000/spzx/2024/02/03/xm_20240203154528A007.png', '2024-09-20 09:45:01',
        'admin', '2024-11-05 21:11:12', 'admin', '0', NULL);
INSERT INTO `brand`
VALUES (15, '中兴', 'http://192.168.6.121:9000/spzx/2024/09/23/p3_20240923153206A002.png', '2024-09-23 15:32:08',
        'admin', '2024-11-05 21:11:12', 'admin', '0', NULL);
INSERT INTO `brand`
VALUES (19, '硅谷', 'http://192.168.6.121:9000/spzx/2024/09/27/atguigu_20240927105739A001.jpg', '2024-09-27 10:57:42',
        'admin', '2024-11-05 21:11:12', 'admin', '0', NULL);
INSERT INTO `brand`
VALUES (20, '小霸王', 'http://192.168.6.100:9000/spzx/2024/11/06/3631bce316fec01d_20241106091406A001.jpg',
        '2024-11-06 09:14:08', NULL, '2024-11-06 09:14:08', NULL, '0', NULL);

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`
(
    `id`          bigint                                                        NOT NULL AUTO_INCREMENT COMMENT '分类id',
    `name`        varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NULL     DEFAULT NULL COMMENT '分类名称',
    `image_url`   varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL     DEFAULT NULL,
    `parent_id`   bigint                                                        NULL     DEFAULT NULL COMMENT '父分类id',
    `status`      tinyint                                                       NULL     DEFAULT NULL COMMENT '是否显示[0-不显示，1显示]',
    `order_num`   int                                                           NULL     DEFAULT NULL COMMENT '排序',
    `create_time` timestamp                                                     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `create_by`   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NULL     DEFAULT NULL COMMENT '创建者',
    `update_time` timestamp                                                     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `update_by`   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NULL     DEFAULT NULL COMMENT '更新者',
    `del_flag`    char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci      NOT NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
    `remark`      varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL     DEFAULT NULL COMMENT '备注',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 704
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci COMMENT = '商品分类'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category`
VALUES (1, '数码办公', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/230f48f024a343c6be9be72597c2dcd0.png', 0, 1, 1,
        '2024-09-25 14:45:39', NULL, '2024-09-25 14:45:39', NULL, '0', NULL);
INSERT INTO `category`
VALUES (2, '手机通讯', NULL, 1, 1, 0, '2024-09-25 14:45:39', NULL, '2024-09-25 14:45:39', NULL, '0', NULL);
INSERT INTO `category`
VALUES (3, '手机', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427264204943.png', 2, 1, 0,
        '2024-09-25 14:45:39', NULL, '2024-09-25 14:45:39', NULL, '0', NULL);
INSERT INTO `category`
VALUES (4, '对讲机', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427264204944.png', 2, 1, 0,
        '2024-09-25 14:45:39', NULL, '2024-09-25 14:45:39', NULL, '0', NULL);
INSERT INTO `category`
VALUES (5, '摄影摄像', NULL, 1, 1, 0, '2024-09-25 14:45:39', NULL, '2024-09-25 14:45:39', NULL, '0', NULL);
INSERT INTO `category`
VALUES (6, '数码相机', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427264204947.png', 5, 1, 0,
        '2024-09-25 14:45:39', NULL, '2024-09-25 14:45:39', NULL, '0', NULL);
INSERT INTO `category`
VALUES (7, '单电/微单相机', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427264204948.png', 5, 1, 0,
        '2024-09-25 14:45:39', NULL, '2024-09-25 14:45:39', NULL, '0', NULL);
INSERT INTO `category`
VALUES (8, '单反相机', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427264204949.png', 5, 1, 0,
        '2024-09-25 14:45:39', NULL, '2024-09-25 14:45:39', NULL, '0', NULL);
INSERT INTO `category`
VALUES (9, '摄像机', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427264204950.png', 5, 1, 0,
        '2024-09-25 14:45:39', NULL, '2024-09-25 14:45:39', NULL, '0', NULL);
INSERT INTO `category`
VALUES (10, '拍立得', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427264204951.png', 5, 1, 0,
        '2024-09-25 14:45:39', NULL, '2024-09-25 14:45:39', NULL, '0', NULL);
INSERT INTO `category`
VALUES (11, '镜头', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427264204952.png', 5, 1, 0,
        '2024-09-25 14:45:39', NULL, '2024-09-25 14:45:39', NULL, '0', NULL);
INSERT INTO `category`
VALUES (12, '数码配件', NULL, 1, 1, 0, '2024-09-25 14:45:39', NULL, '2024-09-25 14:45:39', NULL, '0', NULL);
INSERT INTO `category`
VALUES (13, '存储卡', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427264204954.png', 12, 1, 0,
        '2024-09-25 14:45:39', NULL, '2024-09-25 14:45:39', NULL, '0', NULL);
INSERT INTO `category`
VALUES (14, '读卡器', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427264204955.png', 12, 1, 0,
        '2024-09-25 14:45:39', NULL, '2024-09-25 14:45:39', NULL, '0', NULL);
INSERT INTO `category`
VALUES (15, '滤镜', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427264204956.png', 12, 1, 0,
        '2024-09-25 14:45:39', NULL, '2024-09-25 14:45:39', NULL, '0', NULL);
INSERT INTO `category`
VALUES (16, '闪光灯/手柄', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427264204957.png', 12, 1, 0,
        '2024-09-25 14:45:39', NULL, '2024-09-25 14:45:39', NULL, '0', NULL);
INSERT INTO `category`
VALUES (17, '相机包', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427264204958.png', 12, 1, 0,
        '2024-09-25 14:45:39', NULL, '2024-09-25 14:45:39', NULL, '0', NULL);
INSERT INTO `category`
VALUES (18, '三脚架/云台', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427264204959.png', 12, 1, 0,
        '2024-09-25 14:45:39', NULL, '2024-09-25 14:45:39', NULL, '0', NULL);
INSERT INTO `category`
VALUES (19, '相机清洁', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427264204960.png', 12, 1, 0,
        '2024-09-25 14:45:39', NULL, '2024-09-25 14:45:39', NULL, '0', NULL);
INSERT INTO `category`
VALUES (20, '相机贴膜', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427264204961.png', 12, 1, 0,
        '2024-09-25 14:45:39', NULL, '2024-09-25 14:45:39', NULL, '0', NULL);
INSERT INTO `category`
VALUES (21, '机身附件', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427264204962.png', 12, 1, 0,
        '2024-09-25 14:45:39', NULL, '2024-09-25 14:45:39', NULL, '0', NULL);
INSERT INTO `category`
VALUES (22, '镜头附件', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427264204963.png', 12, 1, 0,
        '2024-09-25 14:45:39', NULL, '2024-09-25 14:45:39', NULL, '0', NULL);
INSERT INTO `category`
VALUES (23, '电池/充电器', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427264204964.png', 12, 1, 0,
        '2024-09-25 14:45:39', NULL, '2024-09-25 14:45:39', NULL, '0', NULL);
INSERT INTO `category`
VALUES (24, '移动电源', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427264204965.png', 12, 1, 0,
        '2024-09-25 14:45:39', NULL, '2024-09-25 14:45:39', NULL, '0', NULL);
INSERT INTO `category`
VALUES (25, 'SSS', NULL, 12, 1, 100, '2024-09-25 14:45:39', NULL, '2024-09-25 14:45:39', NULL, '0', NULL);
INSERT INTO `category`
VALUES (26, '时尚影音', NULL, 1, 1, 0, '2024-09-25 14:45:39', NULL, '2024-09-25 14:45:39', NULL, '0', NULL);
INSERT INTO `category`
VALUES (27, 'MP3/MP4', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427264204967.png', 26, 1, 0,
        '2024-09-25 14:45:39', NULL, '2024-09-25 14:45:39', NULL, '0', NULL);
INSERT INTO `category`
VALUES (28, '智能设备', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427264204968.png', 26, 1, 0,
        '2024-09-25 14:45:39', NULL, '2024-09-25 14:45:39', NULL, '0', NULL);
INSERT INTO `category`
VALUES (29, '耳机/耳麦', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427264204969.png', 26, 1, 0,
        '2024-09-25 14:45:39', NULL, '2024-09-25 14:45:39', NULL, '0', NULL);
INSERT INTO `category`
VALUES (30, '音箱', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427264204970.png', 26, 1, 0,
        '2024-09-25 14:45:39', NULL, '2024-09-25 14:45:39', NULL, '0', NULL);
INSERT INTO `category`
VALUES (31, '高清播放器', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427264204971.png', 26, 1, 0,
        '2024-09-25 14:45:39', NULL, '2024-09-25 14:45:39', NULL, '0', NULL);
INSERT INTO `category`
VALUES (32, '电子书', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427264204972.png', 26, 1, 0,
        '2024-09-25 14:45:39', NULL, '2024-09-25 14:45:39', NULL, '0', NULL);
INSERT INTO `category`
VALUES (33, '电子词典', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427264204973.png', 26, 1, 0,
        '2024-09-25 14:45:39', NULL, '2024-09-25 14:45:39', NULL, '0', NULL);
INSERT INTO `category`
VALUES (34, 'MP3/MP4配件', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427264204974.png', 26, 1, 0,
        '2024-09-25 14:45:39', NULL, '2024-09-25 14:45:39', NULL, '0', NULL);
INSERT INTO `category`
VALUES (35, '录音笔', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427264204975.png', 26, 1, 0,
        '2024-09-25 14:45:39', NULL, '2024-09-25 14:45:39', NULL, '0', NULL);
INSERT INTO `category`
VALUES (36, '麦克风', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427264204976.png', 26, 1, 0,
        '2024-09-25 14:45:39', NULL, '2024-09-25 14:45:39', NULL, '0', NULL);
INSERT INTO `category`
VALUES (37, '专业音频', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427264204977.png', 26, 1, 0,
        '2024-09-25 14:45:39', NULL, '2024-09-25 14:45:39', NULL, '0', NULL);
INSERT INTO `category`
VALUES (38, '电子教育', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427264204978.png', 26, 1, 0,
        '2024-09-25 14:45:39', NULL, '2024-09-25 14:45:39', NULL, '0', NULL);
INSERT INTO `category`
VALUES (39, '数码相框', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427264204979.png', 26, 1, 0,
        '2024-09-25 14:45:39', NULL, '2024-09-25 14:45:39', NULL, '0', NULL);
INSERT INTO `category`
VALUES (40, '苹果配件', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427264204980.png', 26, 1, 0,
        '2024-09-25 14:45:39', NULL, '2024-09-25 14:45:39', NULL, '0', NULL);
INSERT INTO `category`
VALUES (41, '电脑整机', NULL, 1, 1, 0, '2024-09-25 14:45:39', NULL, '2024-09-25 14:45:39', NULL, '0', NULL);
INSERT INTO `category`
VALUES (42, '笔记本', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427264204982.png', 41, 1, 0,
        '2024-09-25 14:45:39', NULL, '2024-09-25 14:45:39', NULL, '0', NULL);
INSERT INTO `category`
VALUES (43, '超极本', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427264204983.png', 41, 1, 0,
        '2024-09-25 14:45:39', NULL, '2024-09-25 14:45:39', NULL, '0', NULL);
INSERT INTO `category`
VALUES (44, '游戏本', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427264204984.png', 41, 1, 0,
        '2024-09-25 14:45:39', NULL, '2024-09-25 14:45:39', NULL, '0', NULL);
INSERT INTO `category`
VALUES (45, '平板电脑', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427264204985.png', 41, 1, 0,
        '2024-09-25 14:45:39', NULL, '2024-09-25 14:45:39', NULL, '0', NULL);
INSERT INTO `category`
VALUES (46, '平板电脑配件', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427264204986.png', 41, 1, 0,
        '2024-09-25 14:45:39', NULL, '2024-09-25 14:45:39', NULL, '0', NULL);
INSERT INTO `category`
VALUES (47, '台式机', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427264204987.png', 41, 1, 0,
        '2024-09-25 14:45:39', NULL, '2024-09-25 14:45:39', NULL, '0', NULL);
INSERT INTO `category`
VALUES (48, '服务器', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427264204988.png', 41, 1, 0,
        '2024-09-25 14:45:39', NULL, '2024-09-25 14:45:39', NULL, '0', NULL);
INSERT INTO `category`
VALUES (49, '笔记本配件', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427264204989.png', 41, 1, 0,
        '2024-09-25 14:45:39', NULL, '2024-09-25 14:45:39', NULL, '0', NULL);
INSERT INTO `category`
VALUES (50, '电脑配件', NULL, 1, 1, 0, '2024-09-25 14:45:39', NULL, '2024-09-25 14:45:39', NULL, '0', NULL);
INSERT INTO `category`
VALUES (51, 'CPU', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399105.png', 50, 1, 0,
        '2024-09-25 14:45:39', NULL, '2024-09-25 14:45:39', NULL, '0', NULL);
INSERT INTO `category`
VALUES (52, '主板', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399106.png', 50, 1, 0,
        '2024-09-25 14:45:39', NULL, '2024-09-25 14:45:39', NULL, '0', NULL);
INSERT INTO `category`
VALUES (53, '显卡', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399107.png', 50, 1, 0,
        '2024-09-25 14:45:39', NULL, '2024-09-25 14:45:39', NULL, '0', NULL);
INSERT INTO `category`
VALUES (54, '硬盘', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399108.png', 50, 1, 0,
        '2024-09-25 14:45:39', NULL, '2024-09-25 14:45:39', NULL, '0', NULL);
INSERT INTO `category`
VALUES (55, 'SSD固态硬盘', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399109.png', 50, 1, 0,
        '2024-09-25 14:45:39', NULL, '2024-09-25 14:45:39', NULL, '0', NULL);
INSERT INTO `category`
VALUES (56, '内存', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399110.png', 50, 1, 0,
        '2024-09-25 14:45:39', NULL, '2024-09-25 14:45:39', NULL, '0', NULL);
INSERT INTO `category`
VALUES (57, '机箱', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399111.png', 50, 1, 0,
        '2024-09-25 14:45:39', NULL, '2024-09-25 14:45:39', NULL, '0', NULL);
INSERT INTO `category`
VALUES (58, '电源', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399112.png', 50, 1, 0,
        '2024-09-25 14:45:39', NULL, '2024-09-25 14:45:39', NULL, '0', NULL);
INSERT INTO `category`
VALUES (59, '显示器', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399113.png', 50, 1, 0,
        '2024-09-25 14:45:39', NULL, '2024-09-25 14:45:39', NULL, '0', NULL);
INSERT INTO `category`
VALUES (60, '刻录机/光驱', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399114.png', 50, 1, 0,
        '2024-09-25 14:45:39', NULL, '2024-09-25 14:45:39', NULL, '0', NULL);
INSERT INTO `category`
VALUES (61, '散热器', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399115.png', 50, 1, 0,
        '2024-09-25 14:45:39', NULL, '2024-09-25 14:45:39', NULL, '0', NULL);
INSERT INTO `category`
VALUES (62, '声卡/扩展卡', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399116.png', 50, 1, 0,
        '2024-09-25 14:45:39', NULL, '2024-09-25 14:45:39', NULL, '0', NULL);
INSERT INTO `category`
VALUES (63, '装机配件', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399117.png', 50, 1, 0,
        '2024-09-25 14:45:39', NULL, '2024-09-25 14:45:39', NULL, '0', NULL);
INSERT INTO `category`
VALUES (64, '外设产品', NULL, 1, 1, 0, '2024-09-25 14:45:39', NULL, '2024-09-25 14:45:39', NULL, '0', NULL);
INSERT INTO `category`
VALUES (65, '鼠标', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399119.png', 64, 1, 0,
        '2024-09-25 14:45:39', NULL, '2024-09-25 14:45:39', NULL, '0', NULL);
INSERT INTO `category`
VALUES (66, '键盘', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399120.png', 64, 1, 0,
        '2024-09-25 14:45:39', NULL, '2024-09-25 14:45:39', NULL, '0', NULL);
INSERT INTO `category`
VALUES (67, '移动硬盘', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399121.png', 64, 1, 0,
        '2024-09-25 14:45:39', NULL, '2024-09-25 14:45:39', NULL, '0', NULL);
INSERT INTO `category`
VALUES (68, 'U盘', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399122.png', 64, 1, 0,
        '2024-09-25 14:45:39', NULL, '2024-09-25 14:45:39', NULL, '0', NULL);
INSERT INTO `category`
VALUES (69, '摄像头', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399123.png', 64, 1, 0,
        '2024-09-25 14:45:39', NULL, '2024-09-25 14:45:39', NULL, '0', NULL);
INSERT INTO `category`
VALUES (70, '外置盒', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399124.png', 64, 1, 0,
        '2024-09-25 14:45:39', NULL, '2024-09-25 14:45:39', NULL, '0', NULL);
INSERT INTO `category`
VALUES (71, '游戏设备', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399125.png', 64, 1, 0,
        '2024-09-25 14:45:39', NULL, '2024-09-25 14:45:39', NULL, '0', NULL);
INSERT INTO `category`
VALUES (72, '电视盒', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399126.png', 64, 1, 0,
        '2024-09-25 14:45:39', NULL, '2024-09-25 14:45:39', NULL, '0', NULL);
INSERT INTO `category`
VALUES (73, '手写板', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399127.png', 64, 1, 0,
        '2024-09-25 14:45:39', NULL, '2024-09-25 14:45:39', NULL, '0', NULL);
INSERT INTO `category`
VALUES (74, '鼠标垫', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399128.png', 64, 1, 0,
        '2024-09-25 14:45:39', NULL, '2024-09-25 14:45:39', NULL, '0', NULL);
INSERT INTO `category`
VALUES (75, '插座', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399129.png', 64, 1, 0,
        '2024-09-25 14:45:39', NULL, '2024-09-25 14:45:39', NULL, '0', NULL);
INSERT INTO `category`
VALUES (76, 'UPS电源', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399130.png', 64, 1, 0,
        '2024-09-25 14:45:39', NULL, '2024-09-25 14:45:39', NULL, '0', NULL);
INSERT INTO `category`
VALUES (77, '线缆', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399131.png', 64, 1, 0,
        '2024-09-25 14:45:39', NULL, '2024-09-25 14:45:39', NULL, '0', NULL);
INSERT INTO `category`
VALUES (78, '电脑工具', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399132.png', 64, 1, 0,
        '2024-09-25 14:45:39', NULL, '2024-09-25 14:45:39', NULL, '0', NULL);
INSERT INTO `category`
VALUES (79, '电脑清洁', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399133.png', 64, 1, 0,
        '2024-09-25 14:45:39', NULL, '2024-09-25 14:45:39', NULL, '0', NULL);
INSERT INTO `category`
VALUES (80, '网络产品', NULL, 1, 1, 0, '2024-09-25 14:45:39', NULL, '2024-09-25 14:45:39', NULL, '0', NULL);
INSERT INTO `category`
VALUES (81, '路由器', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399135.png', 80, 1, 0,
        '2024-09-25 14:45:39', NULL, '2024-09-25 14:45:39', NULL, '0', NULL);
INSERT INTO `category`
VALUES (82, '网卡', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399136.png', 80, 1, 0,
        '2024-09-25 14:45:39', NULL, '2024-09-25 14:45:39', NULL, '0', NULL);
INSERT INTO `category`
VALUES (83, '交换机', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399137.png', 80, 1, 0,
        '2024-09-25 14:45:39', NULL, '2024-09-25 14:45:39', NULL, '0', NULL);
INSERT INTO `category`
VALUES (84, '网络存储', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399138.png', 80, 1, 0,
        '2024-09-25 14:45:39', NULL, '2024-09-25 14:45:39', NULL, '0', NULL);
INSERT INTO `category`
VALUES (85, '3G上网', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399139.png', 80, 1, 0,
        '2024-09-25 14:45:39', NULL, '2024-09-25 14:45:39', NULL, '0', NULL);
INSERT INTO `category`
VALUES (86, '网络盒子', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399140.png', 80, 1, 0,
        '2024-09-25 14:45:39', NULL, '2024-09-25 14:45:39', NULL, '0', NULL);
INSERT INTO `category`
VALUES (87, '办公打印', NULL, 1, 1, 0, '2024-09-25 14:45:39', NULL, '2024-09-25 14:45:39', NULL, '0', NULL);
INSERT INTO `category`
VALUES (88, '打印机', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399142.png', 87, 1, 0,
        '2024-09-25 14:45:39', NULL, '2024-09-25 14:45:39', NULL, '0', NULL);
INSERT INTO `category`
VALUES (89, '一体机', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399143.png', 87, 1, 0,
        '2024-09-25 14:45:39', NULL, '2024-09-25 14:45:39', NULL, '0', NULL);
INSERT INTO `category`
VALUES (90, '投影机', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399144.png', 87, 1, 0,
        '2024-09-25 14:45:39', NULL, '2024-09-25 14:45:39', NULL, '0', NULL);
INSERT INTO `category`
VALUES (91, '投影配件', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399145.png', 87, 1, 0,
        '2024-09-25 14:45:39', NULL, '2024-09-25 14:45:39', NULL, '0', NULL);
INSERT INTO `category`
VALUES (92, '传真机', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399146.png', 87, 1, 0,
        '2024-09-25 14:45:39', NULL, '2024-09-25 14:45:39', NULL, '0', NULL);
INSERT INTO `category`
VALUES (93, '复合机', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399147.png', 87, 1, 0,
        '2024-09-25 14:45:39', NULL, '2024-09-25 14:45:39', NULL, '0', NULL);
INSERT INTO `category`
VALUES (94, '碎纸机', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399148.png', 87, 1, 0,
        '2024-09-25 14:45:39', NULL, '2024-09-25 14:45:39', NULL, '0', NULL);
INSERT INTO `category`
VALUES (95, '扫描仪', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399149.png', 87, 1, 0,
        '2024-09-25 14:45:39', NULL, '2024-09-25 14:45:39', NULL, '0', NULL);
INSERT INTO `category`
VALUES (96, '墨盒', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399150.png', 87, 1, 0,
        '2024-09-25 14:45:39', NULL, '2024-09-25 14:45:39', NULL, '0', NULL);
INSERT INTO `category`
VALUES (97, '墨粉', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399151.png', 87, 1, 0,
        '2024-09-25 14:45:39', NULL, '2024-09-25 14:45:39', NULL, '0', NULL);
INSERT INTO `category`
VALUES (98, '色带', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399152.png', 87, 1, 0,
        '2024-09-25 14:45:39', NULL, '2024-09-25 14:45:39', NULL, '0', NULL);
INSERT INTO `category`
VALUES (99, '定制服务', NULL, 87, 1, 100, '2024-09-25 14:45:39', NULL, '2024-09-25 14:45:39', NULL, '0', NULL);
INSERT INTO `category`
VALUES (100, '办公文仪', NULL, 1, 1, 0, '2024-09-25 14:45:39', NULL, '2024-09-25 14:45:39', NULL, '0', NULL);
INSERT INTO `category`
VALUES (101, '办公文具', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399154.png', 100, 1, 0,
        '2024-09-25 14:45:39', NULL, '2024-09-25 14:45:39', NULL, '0', NULL);
INSERT INTO `category`
VALUES (102, '文件管理', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399155.png', 100, 1, 0,
        '2024-09-25 14:45:39', NULL, '2024-09-25 14:45:39', NULL, '0', NULL);
INSERT INTO `category`
VALUES (103, '笔类', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399156.png', 100, 1, 0,
        '2024-09-25 14:45:39', NULL, '2024-09-25 14:45:39', NULL, '0', NULL);
INSERT INTO `category`
VALUES (104, '纸类', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399157.png', 100, 1, 0,
        '2024-09-25 14:45:39', NULL, '2024-09-25 14:45:39', NULL, '0', NULL);
INSERT INTO `category`
VALUES (105, '本册/便签', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399158.png', 100, 1, 0,
        '2024-09-25 14:45:39', NULL, '2024-09-25 14:45:39', NULL, '0', NULL);
INSERT INTO `category`
VALUES (106, '学生文具', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399159.png', 100, 1, 0,
        '2024-09-25 14:45:39', NULL, '2024-09-25 14:45:39', NULL, '0', NULL);
INSERT INTO `category`
VALUES (107, '财务用品', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399160.png', 100, 1, 0,
        '2024-09-25 14:45:39', NULL, '2024-09-25 14:45:39', NULL, '0', NULL);
INSERT INTO `category`
VALUES (108, '计算器', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399161.png', 100, 1, 0,
        '2024-09-25 14:45:39', NULL, '2024-09-25 14:45:39', NULL, '0', NULL);
INSERT INTO `category`
VALUES (109, '激光笔', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399162.png', 100, 1, 0,
        '2024-09-25 14:45:39', NULL, '2024-09-25 14:45:39', NULL, '0', NULL);
INSERT INTO `category`
VALUES (110, '白板/封装', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399163.png', 100, 1, 0,
        '2024-09-25 14:45:39', NULL, '2024-09-25 14:45:39', NULL, '0', NULL);
INSERT INTO `category`
VALUES (111, '考勤机', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399164.png', 100, 1, 0,
        '2024-09-25 14:45:39', NULL, '2024-09-25 14:45:39', NULL, '0', NULL);
INSERT INTO `category`
VALUES (112, '刻录碟片/附件', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399165.png', 100, 1, 0,
        '2024-09-25 14:45:39', NULL, '2024-09-25 14:45:39', NULL, '0', NULL);
INSERT INTO `category`
VALUES (113, '点钞机', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399166.png', 100, 1, 0,
        '2024-09-25 14:45:39', NULL, '2024-09-25 14:45:39', NULL, '0', NULL);
INSERT INTO `category`
VALUES (114, '支付设备/POS机', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399167.png', 100, 1, 0,
        '2024-09-25 14:45:39', NULL, '2024-09-25 14:45:39', NULL, '0', NULL);
INSERT INTO `category`
VALUES (115, '安防监控', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399168.png', 100, 1, 0,
        '2024-09-25 14:45:39', NULL, '2024-09-25 14:45:39', NULL, '0', NULL);
INSERT INTO `category`
VALUES (116, '呼叫/会议设备', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399169.png', 100, 1, 0,
        '2024-09-25 14:45:39', NULL, '2024-09-25 14:45:39', NULL, '0', NULL);
INSERT INTO `category`
VALUES (117, '保险柜', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399170.png', 100, 1, 0,
        '2024-09-25 14:45:39', NULL, '2024-09-25 14:45:39', NULL, '0', NULL);
INSERT INTO `category`
VALUES (118, '办公家具', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399171.png', 100, 1, 0,
        '2024-09-25 14:45:39', NULL, '2024-09-25 14:45:39', NULL, '0', NULL);
INSERT INTO `category`
VALUES (119, '家用电器', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/ada7d39419554cb1ab52b3d5aae1563a.png', 0, 1,
        2, '2024-09-25 14:45:39', NULL, '2024-09-25 14:45:39', NULL, '0', NULL);
INSERT INTO `category`
VALUES (120, '大家电', NULL, 119, 1, 0, '2024-09-25 14:45:39', NULL, '2024-09-25 14:45:39', NULL, '0', NULL);
INSERT INTO `category`
VALUES (121, '平板电视', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399555.png', 120, 1, 0,
        '2024-09-25 14:45:39', NULL, '2024-09-25 14:45:39', NULL, '0', NULL);
INSERT INTO `category`
VALUES (122, '空调', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399556.png', 120, 1, 0,
        '2024-09-25 14:45:39', NULL, '2024-09-25 14:45:39', NULL, '0', NULL);
INSERT INTO `category`
VALUES (123, '冰箱', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399557.png', 120, 1, 0,
        '2024-09-25 14:45:39', NULL, '2024-09-25 14:45:39', NULL, '0', NULL);
INSERT INTO `category`
VALUES (124, '洗衣机', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399558.png', 120, 1, 0,
        '2024-09-25 14:45:39', NULL, '2024-09-25 14:45:39', NULL, '0', NULL);
INSERT INTO `category`
VALUES (125, '家庭影院', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399559.png', 120, 1, 0,
        '2024-09-25 14:45:39', NULL, '2024-09-25 14:45:39', NULL, '0', NULL);
INSERT INTO `category`
VALUES (126, 'DVD播放机', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399560.png', 120, 1, 0,
        '2024-09-25 14:45:39', NULL, '2024-09-25 14:45:39', NULL, '0', NULL);
INSERT INTO `category`
VALUES (127, '迷你音响', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399561.png', 120, 1, 0,
        '2024-09-25 14:45:39', NULL, '2024-09-25 14:45:39', NULL, '0', NULL);
INSERT INTO `category`
VALUES (128, '烟机/灶具', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399562.png', 120, 1, 0,
        '2024-09-25 14:45:39', NULL, '2024-09-25 14:45:39', NULL, '0', NULL);
INSERT INTO `category`
VALUES (129, '热水器', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399563.png', 120, 1, 0,
        '2024-09-25 14:45:39', NULL, '2024-09-25 14:45:39', NULL, '0', NULL);
INSERT INTO `category`
VALUES (130, '消毒柜/洗碗机', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399564.png', 120, 1, 0,
        '2024-09-25 14:45:39', NULL, '2024-09-25 14:45:39', NULL, '0', NULL);
INSERT INTO `category`
VALUES (131, '酒柜/冰吧/冷柜', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399565.png', 120, 1, 0,
        '2024-09-25 14:45:39', NULL, '2024-09-25 14:45:39', NULL, '0', NULL);
INSERT INTO `category`
VALUES (132, '家电配件', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399566.png', 120, 1, 0,
        '2024-09-25 14:45:39', NULL, '2024-09-25 14:45:39', NULL, '0', NULL);
INSERT INTO `category`
VALUES (133, '生活电器', NULL, 119, 1, 0, '2024-09-25 14:45:39', NULL, '2024-09-25 14:45:39', NULL, '0', NULL);
INSERT INTO `category`
VALUES (134, '电风扇', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399568.png', 133, 1, 0,
        '2024-09-25 14:45:39', NULL, '2024-09-25 14:45:39', NULL, '0', NULL);
INSERT INTO `category`
VALUES (135, '吸尘器', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399569.png', 133, 1, 0,
        '2024-09-25 14:45:39', NULL, '2024-09-25 14:45:39', NULL, '0', NULL);
INSERT INTO `category`
VALUES (136, '加湿器', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399570.png', 133, 1, 0,
        '2024-09-25 14:45:39', NULL, '2024-09-25 14:45:39', NULL, '0', NULL);
INSERT INTO `category`
VALUES (137, '净水设备', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399571.png', 133, 1, 0,
        '2024-09-25 14:45:39', NULL, '2024-09-25 14:45:39', NULL, '0', NULL);
INSERT INTO `category`
VALUES (138, '饮水机', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399572.png', 133, 1, 0,
        '2024-09-25 14:45:39', NULL, '2024-09-25 14:45:39', NULL, '0', NULL);
INSERT INTO `category`
VALUES (139, '冷风扇', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399573.png', 133, 1, 0,
        '2024-09-25 14:45:39', NULL, '2024-09-25 14:45:39', NULL, '0', NULL);
INSERT INTO `category`
VALUES (140, '电话机', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399574.png', 133, 1, 0,
        '2024-09-25 14:45:39', NULL, '2024-09-25 14:45:39', NULL, '0', NULL);
INSERT INTO `category`
VALUES (141, '插座', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399575.png', 133, 1, 0,
        '2024-09-25 14:45:39', NULL, '2024-09-25 14:45:39', NULL, '0', NULL);
INSERT INTO `category`
VALUES (142, '除湿/干衣机', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399576.png', 133, 1, 0,
        '2024-09-25 14:45:39', NULL, '2024-09-25 14:45:39', NULL, '0', NULL);
INSERT INTO `category`
VALUES (143, '清洁机', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399577.png', 133, 1, 0,
        '2024-09-25 14:45:39', NULL, '2024-09-25 14:45:39', NULL, '0', NULL);
INSERT INTO `category`
VALUES (144, '取暖电器', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399578.png', 133, 1, 0,
        '2024-09-25 14:45:39', NULL, '2024-09-25 14:45:39', NULL, '0', NULL);
INSERT INTO `category`
VALUES (145, '其它生活电器', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399579.png', 133, 1, 0,
        '2024-09-25 14:45:39', NULL, '2024-09-25 14:45:39', NULL, '0', NULL);
INSERT INTO `category`
VALUES (146, '厨房电器', NULL, 119, 1, 0, '2024-09-25 14:45:39', NULL, '2024-09-25 14:45:39', NULL, '0', NULL);
INSERT INTO `category`
VALUES (147, '料理/榨汁机', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399581.png', 146, 1, 0,
        '2024-09-25 14:45:39', NULL, '2024-09-25 14:45:39', NULL, '0', NULL);
INSERT INTO `category`
VALUES (148, '豆浆机', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399582.png', 146, 1, 0,
        '2024-09-25 14:45:39', NULL, '2024-09-25 14:45:39', NULL, '0', NULL);
INSERT INTO `category`
VALUES (149, '电饭煲', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399583.png', 146, 1, 0,
        '2024-09-25 14:45:39', NULL, '2024-09-25 14:45:39', NULL, '0', NULL);
INSERT INTO `category`
VALUES (150, '电压力锅', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399584.png', 146, 1, 0,
        '2024-09-25 14:45:39', NULL, '2024-09-25 14:45:39', NULL, '0', NULL);
INSERT INTO `category`
VALUES (151, '面包机', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399585.png', 146, 1, 0,
        '2024-09-25 14:45:39', NULL, '2024-09-25 14:45:39', NULL, '0', NULL);
INSERT INTO `category`
VALUES (152, '咖啡机', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399586.png', 146, 1, 0,
        '2024-09-25 14:45:39', NULL, '2024-09-25 14:45:39', NULL, '0', NULL);
INSERT INTO `category`
VALUES (153, '微波炉', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399587.png', 146, 1, 0,
        '2024-09-25 14:45:39', NULL, '2024-09-25 14:45:39', NULL, '0', NULL);
INSERT INTO `category`
VALUES (154, '电烤箱', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399588.png', 146, 1, 0,
        '2024-09-25 14:45:39', NULL, '2024-09-25 14:45:39', NULL, '0', NULL);
INSERT INTO `category`
VALUES (155, '电饼铛/烧烤盘', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399589.png', 146, 1, 0,
        '2024-09-25 14:45:39', NULL, '2024-09-25 14:45:39', NULL, '0', NULL);
INSERT INTO `category`
VALUES (156, '煮蛋器', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399590.png', 146, 1, 0,
        '2024-09-25 14:45:39', NULL, '2024-09-25 14:45:39', NULL, '0', NULL);
INSERT INTO `category`
VALUES (157, '电水壶/热水瓶', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399591.png', 146, 1, 0,
        '2024-09-25 14:45:39', NULL, '2024-09-25 14:45:39', NULL, '0', NULL);
INSERT INTO `category`
VALUES (158, '其它厨房电器', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399592.png', 146, 1, 0,
        '2024-09-25 14:45:39', NULL, '2024-09-25 14:45:39', NULL, '0', NULL);
INSERT INTO `category`
VALUES (159, '五金家装', NULL, 119, 1, 0, '2024-09-25 14:45:39', NULL, '2024-09-25 14:45:39', NULL, '0', NULL);
INSERT INTO `category`
VALUES (160, '电动工具', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399609.png', 159, 1, 0,
        '2024-09-25 14:45:39', NULL, '2024-09-25 14:45:39', NULL, '0', NULL);
INSERT INTO `category`
VALUES (161, '手动工具', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399610.png', 159, 1, 0,
        '2024-09-25 14:45:39', NULL, '2024-09-25 14:45:39', NULL, '0', NULL);
INSERT INTO `category`
VALUES (162, '仪器仪表', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399611.png', 159, 1, 0,
        '2024-09-25 14:45:39', NULL, '2024-09-25 14:45:39', NULL, '0', NULL);
INSERT INTO `category`
VALUES (163, '浴霸/排气扇', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399612.png', 159, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (164, '灯具', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399613.png', 159, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (165, 'LED灯', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399614.png', 159, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (166, '水槽', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399615.png', 159, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (167, '龙头', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399616.png', 159, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (168, '淋浴花洒', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399617.png', 159, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (169, '厨卫五金', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399618.png', 159, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (170, '家具五金', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399619.png', 159, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (171, '插座', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399620.png', 159, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (172, '电工电料', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399621.png', 159, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (173, '监控安防', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399622.png', 159, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (174, '服装鞋帽', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/9bd0d0ed2ec546619d62889f2ae465c7.jpeg', 0, 1,
        3, '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (175, '女装', NULL, 174, 1, 0, '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (176, 'T恤', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427264204801.png', 175, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (177, '衬衫', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427264204802.png', 175, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (178, '雪纺衫', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427264204803.png', 175, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (179, '卫衣', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427264204804.png', 175, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (180, '马甲', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427264204805.png', 175, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (181, '连衣裙', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427264204806.png', 175, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (182, '半身裙', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427264204807.png', 175, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (183, '牛仔裤', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427264204808.png', 175, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (184, '休闲裤', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427264204809.png', 175, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (185, '正装裤', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427264204810.png', 175, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (186, '西服', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427264204811.png', 175, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (187, '短外套', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427264204812.png', 175, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (188, '风衣', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427264204813.png', 175, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (189, '大衣', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427264204814.png', 175, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (190, '皮衣皮草', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427264204815.png', 175, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (191, '棉服', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427264204816.png', 175, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (192, '羽绒服', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427264204817.png', 175, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (193, '孕妇装', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427264204818.png', 175, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (194, '大码装', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427264204819.png', 175, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (195, '婚纱礼服', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427264204820.png', 175, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (196, '男装', NULL, 174, 1, 0, '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (197, '衬衫', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427264204822.png', 196, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (198, 'T恤', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427264204823.png', 196, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (199, 'POLO衫', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427264204824.png', 196, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (200, '针织衫', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427264204825.png', 196, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (201, '卫衣', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427264204826.png', 196, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (202, '马甲／背心', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427264204827.png', 196, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (203, '夹克', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427264204828.png', 196, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (204, '风衣', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427264204829.png', 196, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (205, '大衣', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427264204830.png', 196, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (206, '皮衣', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427264204831.png', 196, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (207, '外套', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427264204832.png', 196, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (208, '西服', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427264204833.png', 196, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (209, '牛仔裤', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427264204834.png', 196, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (210, '休闲裤', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427264204835.png', 196, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (211, '西裤', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427264204836.png', 196, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (212, '西服套装', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427264204837.png', 196, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (213, '大码装', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427264204838.png', 196, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (214, '中老年装', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427264204839.png', 196, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (215, '唐装', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427264204840.png', 196, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (216, '工装', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427264204841.png', 196, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (217, '内衣', NULL, 174, 1, 0, '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (218, '文胸', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427264204843.png', 217, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (219, '女式内裤', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427264204844.png', 217, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (220, '男式内裤', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427264204845.png', 217, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (221, '家居', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427264204846.png', 217, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (222, '睡衣', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427264204847.png', 217, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (223, '塑身衣', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427264204848.png', 217, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (224, '睡袍／浴袍', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427264204849.png', 217, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (225, '泳衣', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427264204850.png', 217, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (226, '背心', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427264204851.png', 217, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (227, '抹胸', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427264204852.png', 217, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (228, '连裤袜', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427264204853.png', 217, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (229, '美腿袜', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427264204854.png', 217, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (230, '男袜', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427264204855.png', 217, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (231, '女袜', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427264204856.png', 217, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (232, '情趣内衣', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427264204857.png', 217, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (233, '保暖内衣', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427264204858.png', 217, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (234, '运动', NULL, 174, 1, 0, '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (235, '休闲鞋', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427264204860.png', 234, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (236, '帆布鞋', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427264204861.png', 234, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (237, '跑步鞋', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427264204862.png', 234, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (238, '篮球鞋', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427264204863.png', 234, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (239, '足球鞋', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427264204864.png', 234, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (240, '训练鞋', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427264204865.png', 234, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (241, '乒羽鞋', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427264204866.png', 234, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (242, '拖鞋', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427264204867.png', 234, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (243, '卫衣', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427264204868.png', 234, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (244, '夹克', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427264204869.png', 234, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (245, 'T恤', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427264204870.png', 234, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (246, '棉服／羽绒服', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427264204871.png', 234, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (247, '运动裤', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427264204872.png', 234, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (248, '套装', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427264204873.png', 234, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (249, '运动包', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427264204874.png', 234, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (250, '运动配件', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427264204875.png', 234, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (251, '女鞋', NULL, 174, 1, 0, '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (252, '平底鞋', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427264204877.png', 251, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (253, '高跟鞋', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427264204878.png', 251, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (254, '单鞋', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427264204879.png', 251, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (255, '休闲鞋', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427264204880.png', 251, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (256, '凉鞋', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427264204881.png', 251, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (257, '女靴', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427264204882.png', 251, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (258, '雪地靴', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427264204883.png', 251, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (259, '拖鞋', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427264204884.png', 251, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (260, '裸靴', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427264204885.png', 251, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (261, '筒靴', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427264204886.png', 251, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (262, '帆布鞋', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427264204887.png', 251, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (263, '雨鞋／雨靴', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427264204888.png', 251, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (264, '妈妈鞋', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427264204889.png', 251, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (265, '鞋配件', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427264204890.png', 251, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (266, '特色鞋', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427264204891.png', 251, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (267, '鱼嘴鞋', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427264204892.png', 251, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (268, '布鞋／绣花鞋', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427264204893.png', 251, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (269, '男鞋', NULL, 174, 1, 0, '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (270, '商务休闲鞋', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427264204895.png', 269, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (271, '正装鞋', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427264204896.png', 269, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (272, '休闲鞋', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427264204897.png', 269, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (273, '凉鞋／沙滩鞋', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427264204898.png', 269, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (274, '男靴', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427264204899.png', 269, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (275, '功能鞋', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427264204900.png', 269, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (276, '拖鞋', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427264204901.png', 269, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (277, '传统布鞋', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427264204902.png', 269, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (278, '鞋配件', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427264204903.png', 269, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (279, '帆布鞋', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427264204904.png', 269, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (280, '豆豆鞋', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427264204905.png', 269, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (281, '驾车鞋', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427264204906.png', 269, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (282, '配饰', NULL, 174, 1, 0, '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (283, '太阳镜', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427264204908.png', 282, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (284, '框镜', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427264204909.png', 282, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (285, '皮带', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427264204910.png', 282, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (286, '围巾', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427264204911.png', 282, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (287, '手套', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427264204912.png', 282, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (288, '帽子', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427264204913.png', 282, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (289, '领带', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427264204914.png', 282, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (290, '袖扣', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427264204915.png', 282, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (291, '其他配件', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427264204916.png', 282, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (292, '丝巾', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427264204917.png', 282, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (293, '披肩', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427264204918.png', 282, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (294, '腰带', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427264204919.png', 282, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (295, '腰链／腰封', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427264204920.png', 282, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (296, '棒球帽', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427264204921.png', 282, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (297, '毛线', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427264204922.png', 282, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (298, '遮阳帽', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427264204923.png', 282, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (299, '防紫外线手套', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427264204924.png', 282, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (300, '草帽', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427264204925.png', 282, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (301, '童装', NULL, 174, 1, 0, '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (302, '套装', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427264204927.png', 301, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (303, '上衣', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427264204928.png', 301, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (304, '裤子', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427264204929.png', 301, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (305, '裙子', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427264204930.png', 301, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (306, '内衣／家居服', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427264204931.png', 301, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (307, '羽绒服／棉服', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427264204932.png', 301, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (308, '亲子装', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427264204933.png', 301, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (309, '儿童配饰', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427264204934.png', 301, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (310, '礼服／演出服', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427264204935.png', 301, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (311, '运动鞋', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427264204936.png', 301, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (312, '单鞋', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427264204937.png', 301, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (313, '靴子', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427264204938.png', 301, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (314, '凉鞋', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427264204939.png', 301, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (315, '功能鞋', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427264204940.png', 301, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (316, '食品饮料', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/24b886dd9ea84559bdf173320b6c7366.png', 0, 1,
        3, '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (317, '进口食品', NULL, 316, 1, 0, '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (318, '饼干蛋糕', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399365.png', 317, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (319, '糖果巧克力', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399366.png', 317, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (320, '休闲零食', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399367.png', 317, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (321, '冲调饮品', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399368.png', 317, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (322, '粮油调味', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399369.png', 317, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (323, '地方特产', NULL, 316, 1, 0, '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (324, '华北', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399371.png', 323, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (325, '西北', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399372.png', 323, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (326, '西南', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399373.png', 323, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (327, '东北', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399374.png', 323, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (328, '华南', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399375.png', 323, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (329, '华东', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399376.png', 323, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (330, '华中', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399377.png', 323, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (331, '休闲食品', NULL, 316, 1, 0, '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (332, '休闲零食', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399379.png', 331, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (333, '坚果炒货', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399380.png', 331, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (334, '肉干肉松', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399381.png', 331, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (335, '蜜饯果脯', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399382.png', 331, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (336, '糖果/巧克力', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399383.png', 331, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (337, '饼干蛋糕', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399384.png', 331, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (338, '粮油调味', NULL, 316, 1, 0, '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (339, '米面杂粮', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399386.png', 338, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (340, '食用油', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399387.png', 338, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (341, '调味品', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399388.png', 338, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (342, '南北干货', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399389.png', 338, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (343, '方便食品', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399390.png', 338, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (344, '有机食品', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399391.png', 338, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (345, '中外名酒', NULL, 316, 1, 0, '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (346, '白酒', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399393.png', 345, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (347, '洋酒', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399394.png', 345, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (348, '葡萄酒', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399395.png', 345, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (349, '啤酒', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399396.png', 345, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (350, '黄酒', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399397.png', 345, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (351, '饮料冲调', NULL, 316, 1, 0, '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (352, '水', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399399.png', 351, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (353, '饮料', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399400.png', 351, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (354, '牛奶', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399401.png', 351, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (355, '茶叶', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399402.png', 351, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (356, '咖啡/奶茶', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399403.png', 351, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (357, '冲饮谷物', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399404.png', 351, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (358, '营养健康', NULL, 316, 1, 0, '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (359, '基础营养', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399406.png', 358, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (360, '美体养颜', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399407.png', 358, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (361, '滋补调养', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399408.png', 358, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (362, '骨骼健康', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399409.png', 358, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (363, '保健茶饮', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399410.png', 358, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (364, '成分保健', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399411.png', 358, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (365, '无糖食品', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399412.png', 358, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (366, '亚健康调理', NULL, 316, 1, 0, '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (367, '调节三高', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399414.png', 366, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (368, '心脑养护', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399415.png', 366, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (369, '改善睡眠', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399416.png', 366, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (370, '肝肾养护', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399417.png', 366, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (371, '免疫调节', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399418.png', 366, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (372, '更多调理', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399419.png', 366, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (373, '健康礼品', NULL, 316, 1, 0, '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (374, '参茸礼品', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399421.png', 373, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (375, '更多礼品', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399422.png', 373, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (376, '生鲜食品', NULL, 316, 1, 0, '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (377, '水果', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399424.png', 376, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (378, '蔬菜', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399425.png', 376, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (379, '海鲜水产', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399426.png', 376, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (380, '禽蛋', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399427.png', 376, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (381, '鲜肉', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399428.png', 376, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (382, '加工类肉食', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399429.png', 376, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (383, '冻品', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399430.png', 376, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (384, '半成品', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399431.png', 376, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (385, '礼品箱包', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/ebc6c9e114d6416f9985a3ff7c8ea19f.png', 0, 1,
        4, '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (386, '潮流女包', NULL, 385, 1, 0, '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (387, '钱包/卡包', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399174.png', 386, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (388, '手拿包', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399175.png', 386, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (389, '单肩包', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399176.png', 386, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (390, '双肩包', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399177.png', 386, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (391, '手提包', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399178.png', 386, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (392, '斜挎包', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399179.png', 386, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (393, '时尚男包', NULL, 385, 1, 0, '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (394, '钱包/卡包', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399181.png', 393, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (395, '男士手包', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399182.png', 393, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (396, '腰带／礼盒', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399183.png', 393, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (397, '商务公文包', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399184.png', 393, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (398, '功能箱包', NULL, 385, 1, 0, '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (399, '电脑数码包', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399186.png', 398, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (400, '拉杆箱', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399187.png', 398, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (401, '旅行包', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399188.png', 398, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (402, '旅行用品', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399189.png', 398, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (403, '休闲运动包', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399190.png', 398, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (404, '登山包', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399191.png', 398, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (405, '妈咪包', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399192.png', 398, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (406, '书包', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399193.png', 398, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (407, '礼品', NULL, 385, 1, 0, '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (408, '火机烟具', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399195.png', 407, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (409, '礼品文具', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399196.png', 407, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (410, '瑞士军刀', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399197.png', 407, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (411, '收藏品', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399198.png', 407, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (412, '工艺礼品', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399199.png', 407, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (413, '创意礼品', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399200.png', 407, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (414, '礼卡礼卷', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399201.png', 407, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (415, '鲜花速递', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399202.png', 407, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (416, '婚庆用品', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399203.png', 407, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (417, '奢侈品', NULL, 385, 1, 0, '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (418, '奢侈品箱包', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399205.png', 417, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (419, '钱包', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399206.png', 417, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (420, '服饰', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399207.png', 417, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (421, '腰带', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399208.png', 417, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (422, '太阳镜眼镜', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399209.png', 417, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (423, '配件', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399210.png', 417, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (424, 'GUCCI', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399211.png', 417, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (425, 'PRADA', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399212.png', 417, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (426, 'FENDI', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399213.png', 417, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (427, 'BURBERRY', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399214.png', 417, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (428, 'ARMANI', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399215.png', 417, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (429, 'COACH', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399216.png', 417, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (430, '个护化妆', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/9a107ef24c444b30bf3a577ed9630fe1.jpeg', 0, 1,
        4, '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (431, '面部护理', NULL, 430, 1, 0, '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (432, '洁面乳', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399320.png', 431, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (433, '爽肤水', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399321.png', 431, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (434, '精华露', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399322.png', 431, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (435, '乳液面霜', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399323.png', 431, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (436, '面膜面贴', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399324.png', 431, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (437, '眼部护理', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399325.png', 431, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (438, 'T区护理', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399326.png', 431, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (439, '护肤套装', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399327.png', 431, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (440, '防晒隔离', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399328.png', 431, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (441, '身体护理', NULL, 430, 1, 0, '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (442, '洗发护发', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399330.png', 441, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (443, '染发/造型', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399331.png', 441, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (444, '沐浴', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399332.png', 441, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (445, '身体乳', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399333.png', 441, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (446, '香薰精油', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399334.png', 441, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (447, '纤体瘦身', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399335.png', 441, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (448, '脱毛膏', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399336.png', 441, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (449, '手足护理', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399337.png', 441, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (450, '洗护套装', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399338.png', 441, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (451, '口腔护理', NULL, 430, 1, 0, '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (452, '牙膏/牙粉', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399340.png', 451, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (453, '漱口水', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399341.png', 451, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (454, '女性护理', NULL, 430, 1, 0, '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (455, '卫生巾', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399343.png', 454, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (456, '卫生护垫', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399344.png', 454, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (457, '洗液', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399345.png', 454, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (458, '男士护理', NULL, 430, 1, 0, '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (459, '男士香水', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399347.png', 458, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (460, '剃须护理', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399348.png', 458, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (461, '魅力彩妆', NULL, 430, 1, 0, '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (462, '粉底/遮瑕', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399350.png', 461, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (463, '腮红', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399351.png', 461, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (464, '眼影/眼线', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399352.png', 461, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (465, '眉笔', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399353.png', 461, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (466, '睫毛膏', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399354.png', 461, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (467, '唇膏唇彩', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399355.png', 461, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (468, '彩妆组合', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399356.png', 461, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (469, '卸妆', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399357.png', 461, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (470, '美甲', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399358.png', 461, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (471, '假发', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399359.png', 461, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (472, '香水SPA', NULL, 430, 1, 0, '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (473, '女士香水', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399361.png', 472, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (474, '男士香水', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399362.png', 472, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (475, '厨房餐饮', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/155c65e778204372ac196ab6cd7cd598.png', 0, 1,
        5, '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (476, '烹饪锅具', NULL, 475, 1, 0, '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (477, '炒锅', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399276.png', 476, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (478, '煎锅', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399277.png', 476, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (479, '压力锅', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399278.png', 476, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (480, '汤锅', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399279.png', 476, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (481, '蒸锅', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399280.png', 476, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (482, '奶锅', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399281.png', 476, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (483, '套锅', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399282.png', 476, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (484, '煲锅', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399283.png', 476, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (485, '水壶', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399284.png', 476, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (486, '刀剪菜板', NULL, 475, 1, 0, '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (487, '单刀', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399286.png', 486, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (488, '剪刀', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399287.png', 486, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (489, '套刀', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399288.png', 486, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (490, '砧板', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399289.png', 486, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (491, '刀具配件', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399290.png', 486, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (492, '收纳保鲜', NULL, 475, 1, 0, '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (493, '保鲜盒', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399292.png', 492, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (494, '保鲜膜/袋', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399293.png', 492, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (495, '塑料器皿', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399294.png', 492, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (496, '饭盒/提锅', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399295.png', 492, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (497, '水具酒具', NULL, 475, 1, 0, '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (498, '塑料杯', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399297.png', 497, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (499, '运动水壶', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399298.png', 497, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (500, '玻璃杯', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399299.png', 497, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (501, '陶瓷马克杯', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399300.png', 497, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (502, '保温壶', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399301.png', 497, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (503, '杯具套件', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399302.png', 497, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (504, '餐具', NULL, 475, 1, 0, '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (505, '餐具套装', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399304.png', 504, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (506, '碗/碟/盘', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399305.png', 504, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (507, '筷勺/刀叉', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399306.png', 504, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (508, '一次性餐具', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399307.png', 504, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (509, '茶具/咖啡具', NULL, 475, 1, 0, '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (510, '整套茶具', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399309.png', 509, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (511, '茶杯', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399310.png', 509, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (512, '茶壶', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399311.png', 509, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (513, '茶盘茶托', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399312.png', 509, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (514, '茶叶罐', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399313.png', 509, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (515, '茶具配件', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399314.png', 509, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (516, '茶宠摆件', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399315.png', 509, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (517, '咖啡具', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399316.png', 509, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (518, '其他', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399317.png', 509, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (519, '家居家装', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/d1a0cea8d5554bafafef7734efc08820.png', 0, 1,
        10, '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (520, '家纺', NULL, 519, 1, 0, '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (521, '床品套件', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399219.png', 520, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (522, '被子', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399220.png', 520, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (523, '枕芯枕套', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399221.png', 520, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (524, '床单被罩', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399222.png', 520, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (525, '毛巾被/毯', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399223.png', 520, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (526, '床垫/床褥', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399224.png', 520, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (527, '蚊帐/凉席', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399225.png', 520, 1, 0,
        '2024-09-25 14:45:40', NULL, '2024-09-25 14:45:40', NULL, '0', NULL);
INSERT INTO `category`
VALUES (528, '抱枕坐垫', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399226.png', 520, 1, 0,
        '2024-09-25 14:45:41', NULL, '2024-09-25 14:45:41', NULL, '0', NULL);
INSERT INTO `category`
VALUES (529, '毛巾家纺', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399227.png', 520, 1, 0,
        '2024-09-25 14:45:41', NULL, '2024-09-25 14:45:41', NULL, '0', NULL);
INSERT INTO `category`
VALUES (530, NULL, 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399228.png', 520, 1, 0,
        '2024-09-25 14:45:41', NULL, '2024-09-25 14:45:41', NULL, '0', NULL);
INSERT INTO `category`
VALUES (531, '窗帘/窗纱', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399229.png', 520, 1, 0,
        '2024-09-25 14:45:41', NULL, '2024-09-25 14:45:41', NULL, '0', NULL);
INSERT INTO `category`
VALUES (532, '酒店用品', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399230.png', 520, 1, 0,
        '2024-09-25 14:45:41', NULL, '2024-09-25 14:45:41', NULL, '0', NULL);
INSERT INTO `category`
VALUES (533, '灯具', NULL, 519, 1, 0, '2024-09-25 14:45:41', NULL, '2024-09-25 14:45:41', NULL, '0', NULL);
INSERT INTO `category`
VALUES (534, '台灯', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399232.png', 533, 1, 0,
        '2024-09-25 14:45:41', NULL, '2024-09-25 14:45:41', NULL, '0', NULL);
INSERT INTO `category`
VALUES (535, '节能灯', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399233.png', 533, 1, 0,
        '2024-09-25 14:45:41', NULL, '2024-09-25 14:45:41', NULL, '0', NULL);
INSERT INTO `category`
VALUES (536, '装饰灯', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399234.png', 533, 1, 0,
        '2024-09-25 14:45:41', NULL, '2024-09-25 14:45:41', NULL, '0', NULL);
INSERT INTO `category`
VALUES (537, '落地灯', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399235.png', 533, 1, 0,
        '2024-09-25 14:45:41', NULL, '2024-09-25 14:45:41', NULL, '0', NULL);
INSERT INTO `category`
VALUES (538, '应急灯/手电', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399236.png', 533, 1, 0,
        '2024-09-25 14:45:41', NULL, '2024-09-25 14:45:41', NULL, '0', NULL);
INSERT INTO `category`
VALUES (539, 'LED灯', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399237.png', 533, 1, 0,
        '2024-09-25 14:45:41', NULL, '2024-09-25 14:45:41', NULL, '0', NULL);
INSERT INTO `category`
VALUES (540, '吸顶灯', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399238.png', 533, 1, 0,
        '2024-09-25 14:45:41', NULL, '2024-09-25 14:45:41', NULL, '0', NULL);
INSERT INTO `category`
VALUES (541, '五金电器', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399239.png', 533, 1, 0,
        '2024-09-25 14:45:41', NULL, '2024-09-25 14:45:41', NULL, '0', NULL);
INSERT INTO `category`
VALUES (542, '吊灯', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399240.png', 533, 1, 0,
        '2024-09-25 14:45:41', NULL, '2024-09-25 14:45:41', NULL, '0', NULL);
INSERT INTO `category`
VALUES (543, '氛围照明', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399241.png', 533, 1, 0,
        '2024-09-25 14:45:41', NULL, '2024-09-25 14:45:41', NULL, '0', NULL);
INSERT INTO `category`
VALUES (544, '生活日用', NULL, 519, 1, 0, '2024-09-25 14:45:41', NULL, '2024-09-25 14:45:41', NULL, '0', NULL);
INSERT INTO `category`
VALUES (545, '收纳用品', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399243.png', 544, 1, 0,
        '2024-09-25 14:45:41', NULL, '2024-09-25 14:45:41', NULL, '0', NULL);
INSERT INTO `category`
VALUES (546, '雨伞雨具', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399244.png', 544, 1, 0,
        '2024-09-25 14:45:41', NULL, '2024-09-25 14:45:41', NULL, '0', NULL);
INSERT INTO `category`
VALUES (547, '浴室用品', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399245.png', 544, 1, 0,
        '2024-09-25 14:45:41', NULL, '2024-09-25 14:45:41', NULL, '0', NULL);
INSERT INTO `category`
VALUES (548, '缝纫用品', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399246.png', 544, 1, 0,
        '2024-09-25 14:45:41', NULL, '2024-09-25 14:45:41', NULL, '0', NULL);
INSERT INTO `category`
VALUES (549, '洗晒用品', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399247.png', 544, 1, 0,
        '2024-09-25 14:45:41', NULL, '2024-09-25 14:45:41', NULL, '0', NULL);
INSERT INTO `category`
VALUES (550, '净化除味', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399248.png', 544, 1, 0,
        '2024-09-25 14:45:41', NULL, '2024-09-25 14:45:41', NULL, '0', NULL);
INSERT INTO `category`
VALUES (551, '家装软饰', NULL, 519, 1, 0, '2024-09-25 14:45:41', NULL, '2024-09-25 14:45:41', NULL, '0', NULL);
INSERT INTO `category`
VALUES (552, '桌布/罩件', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399250.png', 551, 1, 0,
        '2024-09-25 14:45:41', NULL, '2024-09-25 14:45:41', NULL, '0', NULL);
INSERT INTO `category`
VALUES (553, '地毯地垫', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399251.png', 551, 1, 0,
        '2024-09-25 14:45:41', NULL, '2024-09-25 14:45:41', NULL, '0', NULL);
INSERT INTO `category`
VALUES (554, '沙发垫套', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399252.png', 551, 1, 0,
        '2024-09-25 14:45:41', NULL, '2024-09-25 14:45:41', NULL, '0', NULL);
INSERT INTO `category`
VALUES (555, '相框/相片墙', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399253.png', 551, 1, 0,
        '2024-09-25 14:45:41', NULL, '2024-09-25 14:45:41', NULL, '0', NULL);
INSERT INTO `category`
VALUES (556, '墙画墙贴', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399254.png', 551, 1, 0,
        '2024-09-25 14:45:41', NULL, '2024-09-25 14:45:41', NULL, '0', NULL);
INSERT INTO `category`
VALUES (557, '节庆饰品', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399255.png', 551, 1, 0,
        '2024-09-25 14:45:41', NULL, '2024-09-25 14:45:41', NULL, '0', NULL);
INSERT INTO `category`
VALUES (558, '手工/十字绣', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399256.png', 551, 1, 0,
        '2024-09-25 14:45:41', NULL, '2024-09-25 14:45:41', NULL, '0', NULL);
INSERT INTO `category`
VALUES (559, '工艺摆件', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399257.png', 551, 1, 0,
        '2024-09-25 14:45:41', NULL, '2024-09-25 14:45:41', NULL, '0', NULL);
INSERT INTO `category`
VALUES (560, '其他', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399258.png', 551, 1, 0,
        '2024-09-25 14:45:41', NULL, '2024-09-25 14:45:41', NULL, '0', NULL);
INSERT INTO `category`
VALUES (561, '清洁日用', NULL, 519, 1, 0, '2024-09-25 14:45:41', NULL, '2024-09-25 14:45:41', NULL, '0', NULL);
INSERT INTO `category`
VALUES (562, '纸品湿巾', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399260.png', 561, 1, 0,
        '2024-09-25 14:45:41', NULL, '2024-09-25 14:45:41', NULL, '0', NULL);
INSERT INTO `category`
VALUES (563, '衣物清洁', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399261.png', 561, 1, 0,
        '2024-09-25 14:45:41', NULL, '2024-09-25 14:45:41', NULL, '0', NULL);
INSERT INTO `category`
VALUES (564, '清洁工具', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399262.png', 561, 1, 0,
        '2024-09-25 14:45:41', NULL, '2024-09-25 14:45:41', NULL, '0', NULL);
INSERT INTO `category`
VALUES (565, '驱虫用品', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399263.png', 561, 1, 0,
        '2024-09-25 14:45:41', NULL, '2024-09-25 14:45:41', NULL, '0', NULL);
INSERT INTO `category`
VALUES (566, '居室清洁', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399264.png', 561, 1, 0,
        '2024-09-25 14:45:41', NULL, '2024-09-25 14:45:41', NULL, '0', NULL);
INSERT INTO `category`
VALUES (567, '皮具护理', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399265.png', 561, 1, 0,
        '2024-09-25 14:45:41', NULL, '2024-09-25 14:45:41', NULL, '0', NULL);
INSERT INTO `category`
VALUES (568, '宠物生活', NULL, 519, 1, 0, '2024-09-25 14:45:41', NULL, '2024-09-25 14:45:41', NULL, '0', NULL);
INSERT INTO `category`
VALUES (569, '宠物主粮', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399267.png', 568, 1, 0,
        '2024-09-25 14:45:41', NULL, '2024-09-25 14:45:41', NULL, '0', NULL);
INSERT INTO `category`
VALUES (570, '宠物零食', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399268.png', 568, 1, 0,
        '2024-09-25 14:45:41', NULL, '2024-09-25 14:45:41', NULL, '0', NULL);
INSERT INTO `category`
VALUES (571, '营养品', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399269.png', 568, 1, 0,
        '2024-09-25 14:45:41', NULL, '2024-09-25 14:45:41', NULL, '0', NULL);
INSERT INTO `category`
VALUES (572, '家居日用', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399270.png', 568, 1, 0,
        '2024-09-25 14:45:41', NULL, '2024-09-25 14:45:41', NULL, '0', NULL);
INSERT INTO `category`
VALUES (573, '玩具服饰', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399271.png', 568, 1, 0,
        '2024-09-25 14:45:41', NULL, '2024-09-25 14:45:41', NULL, '0', NULL);
INSERT INTO `category`
VALUES (574, '出行装备', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399272.png', 568, 1, 0,
        '2024-09-25 14:45:41', NULL, '2024-09-25 14:45:41', NULL, '0', NULL);
INSERT INTO `category`
VALUES (575, '医护美容', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399273.png', 568, 1, 0,
        '2024-09-25 14:45:41', NULL, '2024-09-25 14:45:41', NULL, '0', NULL);
INSERT INTO `category`
VALUES (576, '汽车用品', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/665dd952b54e4911b99b5e1eba4b164f.png', 0, 1,
        10, '2024-09-25 14:45:41', NULL, '2024-09-25 14:45:41', NULL, '0', NULL);
INSERT INTO `category`
VALUES (577, '电子电器', NULL, 576, 1, 0, '2024-09-25 14:45:41', NULL, '2024-09-25 14:45:41', NULL, '0', NULL);
INSERT INTO `category`
VALUES (578, '导航仪', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399488.png', 577, 1, 0,
        '2024-09-25 14:45:41', NULL, '2024-09-25 14:45:41', NULL, '0', NULL);
INSERT INTO `category`
VALUES (579, '安全预警仪', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399489.png', 577, 1, 0,
        '2024-09-25 14:45:41', NULL, '2024-09-25 14:45:41', NULL, '0', NULL);
INSERT INTO `category`
VALUES (580, '行车记录仪', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399490.png', 577, 1, 0,
        '2024-09-25 14:45:41', NULL, '2024-09-25 14:45:41', NULL, '0', NULL);
INSERT INTO `category`
VALUES (581, '倒车雷达', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399491.png', 577, 1, 0,
        '2024-09-25 14:45:41', NULL, '2024-09-25 14:45:41', NULL, '0', NULL);
INSERT INTO `category`
VALUES (582, '车载电源', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399492.png', 577, 1, 0,
        '2024-09-25 14:45:41', NULL, '2024-09-25 14:45:41', NULL, '0', NULL);
INSERT INTO `category`
VALUES (583, '车载蓝牙', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399493.png', 577, 1, 0,
        '2024-09-25 14:45:41', NULL, '2024-09-25 14:45:41', NULL, '0', NULL);
INSERT INTO `category`
VALUES (584, '车载影音', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399494.png', 577, 1, 0,
        '2024-09-25 14:45:41', NULL, '2024-09-25 14:45:41', NULL, '0', NULL);
INSERT INTO `category`
VALUES (585, '车载净化器', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399495.png', 577, 1, 0,
        '2024-09-25 14:45:41', NULL, '2024-09-25 14:45:41', NULL, '0', NULL);
INSERT INTO `category`
VALUES (586, '车载冰箱', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399496.png', 577, 1, 0,
        '2024-09-25 14:45:41', NULL, '2024-09-25 14:45:41', NULL, '0', NULL);
INSERT INTO `category`
VALUES (587, '车载吸尘器', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399497.png', 577, 1, 0,
        '2024-09-25 14:45:41', NULL, '2024-09-25 14:45:41', NULL, '0', NULL);
INSERT INTO `category`
VALUES (588, '充气泵', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399498.png', 577, 1, 0,
        '2024-09-25 14:45:41', NULL, '2024-09-25 14:45:41', NULL, '0', NULL);
INSERT INTO `category`
VALUES (589, '车载生活电器', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399499.png', 577, 1, 0,
        '2024-09-25 14:45:41', NULL, '2024-09-25 14:45:41', NULL, '0', NULL);
INSERT INTO `category`
VALUES (590, '系统养护', NULL, 576, 1, 0, '2024-09-25 14:45:41', NULL, '2024-09-25 14:45:41', NULL, '0', NULL);
INSERT INTO `category`
VALUES (591, '机油', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399501.png', 590, 1, 0,
        '2024-09-25 14:45:41', NULL, '2024-09-25 14:45:41', NULL, '0', NULL);
INSERT INTO `category`
VALUES (592, '添加剂', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399502.png', 590, 1, 0,
        '2024-09-25 14:45:41', NULL, '2024-09-25 14:45:41', NULL, '0', NULL);
INSERT INTO `category`
VALUES (593, '防冻冷却液', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399503.png', 590, 1, 0,
        '2024-09-25 14:45:41', NULL, '2024-09-25 14:45:41', NULL, '0', NULL);
INSERT INTO `category`
VALUES (594, '附属油', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399504.png', 590, 1, 0,
        '2024-09-25 14:45:41', NULL, '2024-09-25 14:45:41', NULL, '0', NULL);
INSERT INTO `category`
VALUES (595, '底盘装甲', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399505.png', 590, 1, 0,
        '2024-09-25 14:45:41', NULL, '2024-09-25 14:45:41', NULL, '0', NULL);
INSERT INTO `category`
VALUES (596, '空调清洗剂', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399506.png', 590, 1, 0,
        '2024-09-25 14:45:41', NULL, '2024-09-25 14:45:41', NULL, '0', NULL);
INSERT INTO `category`
VALUES (597, '改装配件', NULL, 576, 1, 0, '2024-09-25 14:45:41', NULL, '2024-09-25 14:45:41', NULL, '0', NULL);
INSERT INTO `category`
VALUES (598, '雨刷', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399508.png', 597, 1, 0,
        '2024-09-25 14:45:41', NULL, '2024-09-25 14:45:41', NULL, '0', NULL);
INSERT INTO `category`
VALUES (599, '车灯', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399509.png', 597, 1, 0,
        '2024-09-25 14:45:41', NULL, '2024-09-25 14:45:41', NULL, '0', NULL);
INSERT INTO `category`
VALUES (600, '轮胎', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399510.png', 597, 1, 0,
        '2024-09-25 14:45:41', NULL, '2024-09-25 14:45:41', NULL, '0', NULL);
INSERT INTO `category`
VALUES (601, '贴膜', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399511.png', 597, 1, 0,
        '2024-09-25 14:45:41', NULL, '2024-09-25 14:45:41', NULL, '0', NULL);
INSERT INTO `category`
VALUES (602, '后视镜', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399512.png', 597, 1, 0,
        '2024-09-25 14:45:41', NULL, '2024-09-25 14:45:41', NULL, '0', NULL);
INSERT INTO `category`
VALUES (603, '机油滤', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399513.png', 597, 1, 0,
        '2024-09-25 14:45:41', NULL, '2024-09-25 14:45:41', NULL, '0', NULL);
INSERT INTO `category`
VALUES (604, '火花塞', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399514.png', 597, 1, 0,
        '2024-09-25 14:45:41', NULL, '2024-09-25 14:45:41', NULL, '0', NULL);
INSERT INTO `category`
VALUES (605, '刹车片', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399515.png', 597, 1, 0,
        '2024-09-25 14:45:41', NULL, '2024-09-25 14:45:41', NULL, '0', NULL);
INSERT INTO `category`
VALUES (606, '蓄电池', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399516.png', 597, 1, 0,
        '2024-09-25 14:45:41', NULL, '2024-09-25 14:45:41', NULL, '0', NULL);
INSERT INTO `category`
VALUES (607, '车身装饰', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399517.png', 597, 1, 0,
        '2024-09-25 14:45:41', NULL, '2024-09-25 14:45:41', NULL, '0', NULL);
INSERT INTO `category`
VALUES (608, '维修配件', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399518.png', 597, 1, 0,
        '2024-09-25 14:45:41', NULL, '2024-09-25 14:45:41', NULL, '0', NULL);
INSERT INTO `category`
VALUES (609, '汽修工具', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399519.png', 597, 1, 0,
        '2024-09-25 14:45:41', NULL, '2024-09-25 14:45:41', NULL, '0', NULL);
INSERT INTO `category`
VALUES (610, '汽车美容', NULL, 576, 1, 0, '2024-09-25 14:45:41', NULL, '2024-09-25 14:45:41', NULL, '0', NULL);
INSERT INTO `category`
VALUES (611, '漆面美容', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399521.png', 610, 1, 0,
        '2024-09-25 14:45:41', NULL, '2024-09-25 14:45:41', NULL, '0', NULL);
INSERT INTO `category`
VALUES (612, '漆面修复', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399522.png', 610, 1, 0,
        '2024-09-25 14:45:41', NULL, '2024-09-25 14:45:41', NULL, '0', NULL);
INSERT INTO `category`
VALUES (613, '内饰清洁', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399523.png', 610, 1, 0,
        '2024-09-25 14:45:41', NULL, '2024-09-25 14:45:41', NULL, '0', NULL);
INSERT INTO `category`
VALUES (614, '玻璃美容', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399524.png', 610, 1, 0,
        '2024-09-25 14:45:41', NULL, '2024-09-25 14:45:41', NULL, '0', NULL);
INSERT INTO `category`
VALUES (615, '洗车机', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399525.png', 610, 1, 0,
        '2024-09-25 14:45:41', NULL, '2024-09-25 14:45:41', NULL, '0', NULL);
INSERT INTO `category`
VALUES (616, '洗车水枪', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399526.png', 610, 1, 0,
        '2024-09-25 14:45:41', NULL, '2024-09-25 14:45:41', NULL, '0', NULL);
INSERT INTO `category`
VALUES (617, '洗车配件', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399527.png', 610, 1, 0,
        '2024-09-25 14:45:41', NULL, '2024-09-25 14:45:41', NULL, '0', NULL);
INSERT INTO `category`
VALUES (618, '车掸', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399528.png', 610, 1, 0,
        '2024-09-25 14:45:41', NULL, '2024-09-25 14:45:41', NULL, '0', NULL);
INSERT INTO `category`
VALUES (619, '洗车液', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399529.png', 610, 1, 0,
        '2024-09-25 14:45:41', NULL, '2024-09-25 14:45:41', NULL, '0', NULL);
INSERT INTO `category`
VALUES (620, '坐垫脚垫', NULL, 576, 1, 0, '2024-09-25 14:45:41', NULL, '2024-09-25 14:45:41', NULL, '0', NULL);
INSERT INTO `category`
VALUES (621, '脚垫', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399531.png', 620, 1, 0,
        '2024-09-25 14:45:41', NULL, '2024-09-25 14:45:41', NULL, '0', NULL);
INSERT INTO `category`
VALUES (622, '坐垫', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399532.png', 620, 1, 0,
        '2024-09-25 14:45:41', NULL, '2024-09-25 14:45:41', NULL, '0', NULL);
INSERT INTO `category`
VALUES (623, '座套', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399533.png', 620, 1, 0,
        '2024-09-25 14:45:41', NULL, '2024-09-25 14:45:41', NULL, '0', NULL);
INSERT INTO `category`
VALUES (624, '内饰精品', NULL, 576, 1, 0, '2024-09-25 14:45:41', NULL, '2024-09-25 14:45:41', NULL, '0', NULL);
INSERT INTO `category`
VALUES (625, '车用香水', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399535.png', 624, 1, 0,
        '2024-09-25 14:45:41', NULL, '2024-09-25 14:45:41', NULL, '0', NULL);
INSERT INTO `category`
VALUES (626, '车用炭包', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399536.png', 624, 1, 0,
        '2024-09-25 14:45:41', NULL, '2024-09-25 14:45:41', NULL, '0', NULL);
INSERT INTO `category`
VALUES (627, '头枕腰枕', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399537.png', 624, 1, 0,
        '2024-09-25 14:45:41', NULL, '2024-09-25 14:45:41', NULL, '0', NULL);
INSERT INTO `category`
VALUES (628, '方向盘套', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399538.png', 624, 1, 0,
        '2024-09-25 14:45:41', NULL, '2024-09-25 14:45:41', NULL, '0', NULL);
INSERT INTO `category`
VALUES (629, '功能小件', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399539.png', 624, 1, 0,
        '2024-09-25 14:45:41', NULL, '2024-09-25 14:45:41', NULL, '0', NULL);
INSERT INTO `category`
VALUES (630, '车内挂饰', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399540.png', 624, 1, 0,
        '2024-09-25 14:45:41', NULL, '2024-09-25 14:45:41', NULL, '0', NULL);
INSERT INTO `category`
VALUES (631, '安全自驾', NULL, 576, 1, 0, '2024-09-25 14:45:41', NULL, '2024-09-25 14:45:41', NULL, '0', NULL);
INSERT INTO `category`
VALUES (632, '安全座椅', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399542.png', 631, 1, 0,
        '2024-09-25 14:45:41', NULL, '2024-09-25 14:45:41', NULL, '0', NULL);
INSERT INTO `category`
VALUES (633, '应急救援', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399543.png', 631, 1, 0,
        '2024-09-25 14:45:41', NULL, '2024-09-25 14:45:41', NULL, '0', NULL);
INSERT INTO `category`
VALUES (634, '汽修工具', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399544.png', 631, 1, 0,
        '2024-09-25 14:45:41', NULL, '2024-09-25 14:45:41', NULL, '0', NULL);
INSERT INTO `category`
VALUES (635, '保温箱', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399545.png', 631, 1, 0,
        '2024-09-25 14:45:41', NULL, '2024-09-25 14:45:41', NULL, '0', NULL);
INSERT INTO `category`
VALUES (636, '储物箱', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399546.png', 631, 1, 0,
        '2024-09-25 14:45:41', NULL, '2024-09-25 14:45:41', NULL, '0', NULL);
INSERT INTO `category`
VALUES (637, '车衣', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399547.png', 631, 1, 0,
        '2024-09-25 14:45:41', NULL, '2024-09-25 14:45:41', NULL, '0', NULL);
INSERT INTO `category`
VALUES (638, '车锁', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399548.png', 631, 1, 0,
        '2024-09-25 14:45:41', NULL, '2024-09-25 14:45:41', NULL, '0', NULL);
INSERT INTO `category`
VALUES (639, '摩托车设备', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399549.png', 631, 1, 0,
        '2024-09-25 14:45:41', NULL, '2024-09-25 14:45:41', NULL, '0', NULL);
INSERT INTO `category`
VALUES (640, '整车', NULL, 576, 1, 0, '2024-09-25 14:45:41', NULL, '2024-09-25 14:45:41', NULL, '0', NULL);
INSERT INTO `category`
VALUES (641, '新车', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399551.png', 640, 1, 0,
        '2024-09-25 14:45:41', NULL, '2024-09-25 14:45:41', NULL, '0', NULL);
INSERT INTO `category`
VALUES (642, '二手车', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399552.png', 640, 1, 0,
        '2024-09-25 14:45:41', NULL, '2024-09-25 14:45:41', NULL, '0', NULL);
INSERT INTO `category`
VALUES (643, '玩具乐器', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/0f423fb60f084b2caade164fae25a9a0.png', 0, 1,
        10, '2024-09-25 14:45:41', NULL, '2024-09-25 14:45:41', NULL, '0', NULL);
INSERT INTO `category`
VALUES (644, '适用年龄', NULL, 643, 1, 0, '2024-09-25 14:45:41', NULL, '2024-09-25 14:45:41', NULL, '0', NULL);
INSERT INTO `category`
VALUES (645, '1-3岁', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399678.png', 644, 1, 0,
        '2024-09-25 14:45:41', NULL, '2024-09-25 14:45:41', NULL, '0', NULL);
INSERT INTO `category`
VALUES (646, '3-6岁', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399679.png', 644, 1, 0,
        '2024-09-25 14:45:41', NULL, '2024-09-25 14:45:41', NULL, '0', NULL);
INSERT INTO `category`
VALUES (647, '6-14岁', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399680.png', 644, 1, 0,
        '2024-09-25 14:45:41', NULL, '2024-09-25 14:45:41', NULL, '0', NULL);
INSERT INTO `category`
VALUES (648, '14岁以上', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399681.png', 644, 1, 0,
        '2024-09-25 14:45:41', NULL, '2024-09-25 14:45:41', NULL, '0', NULL);
INSERT INTO `category`
VALUES (649, '遥控/电动', NULL, 643, 1, 0, '2024-09-25 14:45:41', NULL, '2024-09-25 14:45:41', NULL, '0', NULL);
INSERT INTO `category`
VALUES (650, '遥控车', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399683.png', 649, 1, 0,
        '2024-09-25 14:45:41', NULL, '2024-09-25 14:45:41', NULL, '0', NULL);
INSERT INTO `category`
VALUES (651, '遥控飞机', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399684.png', 649, 1, 0,
        '2024-09-25 14:45:41', NULL, '2024-09-25 14:45:41', NULL, '0', NULL);
INSERT INTO `category`
VALUES (652, '遥控船', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399685.png', 649, 1, 0,
        '2024-09-25 14:45:41', NULL, '2024-09-25 14:45:41', NULL, '0', NULL);
INSERT INTO `category`
VALUES (653, '机器人/电动', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399686.png', 649, 1, 0,
        '2024-09-25 14:45:41', NULL, '2024-09-25 14:45:41', NULL, '0', NULL);
INSERT INTO `category`
VALUES (654, '轨道/助力', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399687.png', 649, 1, 0,
        '2024-09-25 14:45:41', NULL, '2024-09-25 14:45:41', NULL, '0', NULL);
INSERT INTO `category`
VALUES (655, '毛绒布艺', NULL, 643, 1, 0, '2024-09-25 14:45:41', NULL, '2024-09-25 14:45:41', NULL, '0', NULL);
INSERT INTO `category`
VALUES (656, '毛绒/布艺', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399689.png', 655, 1, 0,
        '2024-09-25 14:45:41', NULL, '2024-09-25 14:45:41', NULL, '0', NULL);
INSERT INTO `category`
VALUES (657, '靠垫/抱枕', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399690.png', 655, 1, 0,
        '2024-09-25 14:45:41', NULL, '2024-09-25 14:45:41', NULL, '0', NULL);
INSERT INTO `category`
VALUES (658, '娃娃玩具', NULL, 643, 1, 0, '2024-09-25 14:45:41', NULL, '2024-09-25 14:45:41', NULL, '0', NULL);
INSERT INTO `category`
VALUES (659, '芭比娃娃', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399692.png', 658, 1, 0,
        '2024-09-25 14:45:41', NULL, '2024-09-25 14:45:41', NULL, '0', NULL);
INSERT INTO `category`
VALUES (660, '卡通娃娃', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399693.png', 658, 1, 0,
        '2024-09-25 14:45:41', NULL, '2024-09-25 14:45:41', NULL, '0', NULL);
INSERT INTO `category`
VALUES (661, '智能娃娃', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399694.png', 658, 1, 0,
        '2024-09-25 14:45:41', NULL, '2024-09-25 14:45:41', NULL, '0', NULL);
INSERT INTO `category`
VALUES (662, '模型玩具', NULL, 643, 1, 0, '2024-09-25 14:45:41', NULL, '2024-09-25 14:45:41', NULL, '0', NULL);
INSERT INTO `category`
VALUES (663, '仿真模型', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399696.png', 662, 1, 0,
        '2024-09-25 14:45:41', NULL, '2024-09-25 14:45:41', NULL, '0', NULL);
INSERT INTO `category`
VALUES (664, '拼插模型', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399697.png', 662, 1, 0,
        '2024-09-25 14:45:41', NULL, '2024-09-25 14:45:41', NULL, '0', NULL);
INSERT INTO `category`
VALUES (665, '收藏爱好', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399698.png', 662, 1, 0,
        '2024-09-25 14:45:41', NULL, '2024-09-25 14:45:41', NULL, '0', NULL);
INSERT INTO `category`
VALUES (666, '健身玩具', NULL, 643, 1, 0, '2024-09-25 14:45:41', NULL, '2024-09-25 14:45:41', NULL, '0', NULL);
INSERT INTO `category`
VALUES (667, '炫舞毯', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399700.png', 666, 1, 0,
        '2024-09-25 14:45:41', NULL, '2024-09-25 14:45:41', NULL, '0', NULL);
INSERT INTO `category`
VALUES (668, '爬行垫/毯', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399701.png', 666, 1, 0,
        '2024-09-25 14:45:41', NULL, '2024-09-25 14:45:41', NULL, '0', NULL);
INSERT INTO `category`
VALUES (669, '户外玩具', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399702.png', 666, 1, 0,
        '2024-09-25 14:45:41', NULL, '2024-09-25 14:45:41', NULL, '0', NULL);
INSERT INTO `category`
VALUES (670, '戏水玩具', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399703.png', 666, 1, 0,
        '2024-09-25 14:45:41', NULL, '2024-09-25 14:45:41', NULL, '0', NULL);
INSERT INTO `category`
VALUES (671, '动漫玩具', NULL, 643, 1, 0, '2024-09-25 14:45:41', NULL, '2024-09-25 14:45:41', NULL, '0', NULL);
INSERT INTO `category`
VALUES (672, '电影周边', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399705.png', 671, 1, 0,
        '2024-09-25 14:45:41', NULL, '2024-09-25 14:45:41', NULL, '0', NULL);
INSERT INTO `category`
VALUES (673, '卡通周边', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399706.png', 671, 1, 0,
        '2024-09-25 14:45:41', NULL, '2024-09-25 14:45:41', NULL, '0', NULL);
INSERT INTO `category`
VALUES (674, '网游周边', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399707.png', 671, 1, 0,
        '2024-09-25 14:45:41', NULL, '2024-09-25 14:45:41', NULL, '0', NULL);
INSERT INTO `category`
VALUES (675, '益智玩具', NULL, 643, 1, 0, '2024-09-25 14:45:41', NULL, '2024-09-25 14:45:41', NULL, '0', NULL);
INSERT INTO `category`
VALUES (676, '摇铃/床铃', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399709.png', 675, 1, 0,
        '2024-09-25 14:45:41', NULL, '2024-09-25 14:45:41', NULL, '0', NULL);
INSERT INTO `category`
VALUES (677, '健身架', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399710.png', 675, 1, 0,
        '2024-09-25 14:45:41', NULL, '2024-09-25 14:45:41', NULL, '0', NULL);
INSERT INTO `category`
VALUES (678, '早教启智', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399711.png', 675, 1, 0,
        '2024-09-25 14:45:41', NULL, '2024-09-25 14:45:41', NULL, '0', NULL);
INSERT INTO `category`
VALUES (679, '拖拉玩具', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399712.png', 675, 1, 0,
        '2024-09-25 14:45:41', NULL, '2024-09-25 14:45:41', NULL, '0', NULL);
INSERT INTO `category`
VALUES (680, '积木拼插', NULL, 643, 1, 0, '2024-09-25 14:45:41', NULL, '2024-09-25 14:45:41', NULL, '0', NULL);
INSERT INTO `category`
VALUES (681, '积木', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399714.png', 680, 1, 0,
        '2024-09-25 14:45:41', NULL, '2024-09-25 14:45:41', NULL, '0', NULL);
INSERT INTO `category`
VALUES (682, '拼图', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399715.png', 680, 1, 0,
        '2024-09-25 14:45:41', NULL, '2024-09-25 14:45:41', NULL, '0', NULL);
INSERT INTO `category`
VALUES (683, '磁力棒', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399716.png', 680, 1, 0,
        '2024-09-25 14:45:41', NULL, '2024-09-25 14:45:41', NULL, '0', NULL);
INSERT INTO `category`
VALUES (684, '立体拼插', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399717.png', 680, 1, 0,
        '2024-09-25 14:45:41', NULL, '2024-09-25 14:45:41', NULL, '0', NULL);
INSERT INTO `category`
VALUES (685, 'DIY玩具', NULL, 643, 1, 0, '2024-09-25 14:45:41', NULL, '2024-09-25 14:45:41', NULL, '0', NULL);
INSERT INTO `category`
VALUES (686, '手工彩泥', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399719.png', 685, 1, 0,
        '2024-09-25 14:45:41', NULL, '2024-09-25 14:45:41', NULL, '0', NULL);
INSERT INTO `category`
VALUES (687, '绘画工具', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399720.png', 685, 1, 0,
        '2024-09-25 14:45:41', NULL, '2024-09-25 14:45:41', NULL, '0', NULL);
INSERT INTO `category`
VALUES (688, '情景玩具', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399721.png', 685, 1, 0,
        '2024-09-25 14:45:41', NULL, '2024-09-25 14:45:41', NULL, '0', NULL);
INSERT INTO `category`
VALUES (689, '创意减压', NULL, 643, 1, 0, '2024-09-25 14:45:41', NULL, '2024-09-25 14:45:41', NULL, '0', NULL);
INSERT INTO `category`
VALUES (690, '减压玩具', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399723.png', 689, 1, 0,
        '2024-09-25 14:45:41', NULL, '2024-09-25 14:45:41', NULL, '0', NULL);
INSERT INTO `category`
VALUES (691, '创意玩具', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399724.png', 689, 1, 0,
        '2024-09-25 14:45:41', NULL, '2024-09-25 14:45:41', NULL, '0', NULL);
INSERT INTO `category`
VALUES (692, '乐器相关', NULL, 643, 1, 0, '2024-09-25 14:45:41', NULL, '2024-09-25 14:45:41', NULL, '0', NULL);
INSERT INTO `category`
VALUES (693, '钢琴', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399726.png', 692, 1, 0,
        '2024-09-25 14:45:41', NULL, '2024-09-25 14:45:41', NULL, '0', NULL);
INSERT INTO `category`
VALUES (694, '电子琴', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399727.png', 692, 1, 0,
        '2024-09-25 14:45:41', NULL, '2024-09-25 14:45:41', NULL, '0', NULL);
INSERT INTO `category`
VALUES (695, '手风琴', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399728.png', 692, 1, 0,
        '2024-09-25 14:45:41', NULL, '2024-09-25 14:45:41', NULL, '0', NULL);
INSERT INTO `category`
VALUES (696, '吉他/贝斯', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399729.png', 692, 1, 0,
        '2024-09-25 14:45:41', NULL, '2024-09-25 14:45:41', NULL, '0', NULL);
INSERT INTO `category`
VALUES (697, '民族管弦乐器', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399730.png', 692, 1, 0,
        '2024-09-25 14:45:41', NULL, '2024-09-25 14:45:41', NULL, '0', NULL);
INSERT INTO `category`
VALUES (698, '西洋管弦乐', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399731.png', 692, 1, 0,
        '2024-09-25 14:45:41', NULL, '2024-09-25 14:45:41', NULL, '0', NULL);
INSERT INTO `category`
VALUES (699, '口琴/口风琴/竖笛', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399732.png', 692, 1, 0,
        '2024-09-25 14:45:41', NULL, '2024-09-25 14:45:41', NULL, '0', NULL);
INSERT INTO `category`
VALUES (700, '西洋打击乐器', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399733.png', 692, 1, 0,
        '2024-09-25 14:45:41', NULL, '2024-09-25 14:45:41', NULL, '0', NULL);
INSERT INTO `category`
VALUES (701, '各式乐器配件', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399734.png', 692, 1, 0,
        '2024-09-25 14:45:41', NULL, '2024-09-25 14:45:41', NULL, '0', NULL);
INSERT INTO `category`
VALUES (702, '电脑音乐', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399735.png', 692, 1, 0,
        '2024-09-25 14:45:41', NULL, '2024-09-25 14:45:41', NULL, '0', NULL);
INSERT INTO `category`
VALUES (703, '工艺礼品乐器', 'https://lilishop-oss.oss-cn-beijing.aliyuncs.com/1348576427268399736.png', 692, 1, 0,
        '2024-09-25 14:45:41', NULL, '2024-09-25 14:45:41', NULL, '0', NULL);

-- ----------------------------
-- Table structure for category_brand
-- ----------------------------
DROP TABLE IF EXISTS `category_brand`;
CREATE TABLE `category_brand`
(
    `id`          bigint                                                        NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `brand_id`    bigint                                                        NULL     DEFAULT NULL COMMENT '品牌ID',
    `category_id` bigint                                                        NULL     DEFAULT NULL COMMENT '分类ID',
    `create_time` timestamp                                                     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `create_by`   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NULL     DEFAULT NULL COMMENT '创建者',
    `update_time` timestamp                                                     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `update_by`   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NULL     DEFAULT NULL COMMENT '更新者',
    `del_flag`    char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci      NOT NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
    `remark`      varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL     DEFAULT NULL COMMENT '备注',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 8
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci COMMENT = '分类品牌'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category_brand
-- ----------------------------
INSERT INTO `category_brand`
VALUES (2, 2, 3, '2024-02-20 16:59:31', 'admin', '2024-11-05 21:10:59', 'admin', '0', NULL);
INSERT INTO `category_brand`
VALUES (4, 1, 3, '2024-09-20 16:22:28', 'admin', '2024-11-05 21:10:56', 'admin', '0', NULL);
INSERT INTO `category_brand`
VALUES (5, 6, 3, '2024-09-24 15:41:49', 'admin', '2024-11-04 23:20:44', 'admin', '0', NULL);
INSERT INTO `category_brand`
VALUES (7, 20, 3, '2024-11-06 09:15:32', 'admin', '2024-11-06 09:15:32', NULL, '0', NULL);

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`
(
    `table_id`          bigint                                                         NOT NULL AUTO_INCREMENT COMMENT '编号',
    `table_name`        varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NULL DEFAULT '' COMMENT '表名称',
    `table_comment`     varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NULL DEFAULT '' COMMENT '表描述',
    `sub_table_name`    varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci   NULL DEFAULT NULL COMMENT '关联子表的表名',
    `sub_table_fk_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci   NULL DEFAULT NULL COMMENT '子表关联的外键名',
    `class_name`        varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NULL DEFAULT '' COMMENT '实体类名称',
    `tpl_category`      varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
    `tpl_web_type`      varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci   NULL DEFAULT '' COMMENT '前端模板类型（element-ui模版 element-plus模版）',
    `package_name`      varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NULL DEFAULT NULL COMMENT '生成包路径',
    `module_name`       varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci   NULL DEFAULT NULL COMMENT '生成模块名',
    `business_name`     varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci   NULL DEFAULT NULL COMMENT '生成业务名',
    `function_name`     varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci   NULL DEFAULT NULL COMMENT '生成功能名',
    `function_author`   varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci   NULL DEFAULT NULL COMMENT '生成功能作者',
    `gen_type`          char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci       NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
    `gen_path`          varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
    `options`           varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '其它生成选项',
    `create_by`         varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci   NULL DEFAULT '' COMMENT '创建者',
    `create_time`       datetime                                                       NULL DEFAULT NULL COMMENT '创建时间',
    `update_by`         varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci   NULL DEFAULT '' COMMENT '更新者',
    `update_time`       datetime                                                       NULL DEFAULT NULL COMMENT '更新时间',
    `remark`            varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NULL DEFAULT NULL COMMENT '备注',
    PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 4
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci COMMENT = '代码生成业务表'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table`
VALUES (2, 'brand', '分类品牌', NULL, NULL, 'Brand', 'crud', 'element-plus', 'com.spzx.product', 'product', 'brand',
        '分类品牌', 'atguigu', '0', '/', '{\"parentMenuId\":2006}', 'admin', '2024-09-27 11:41:00', '',
        '2024-09-27 11:50:50', NULL);
INSERT INTO `gen_table`
VALUES (3, 'category', '商品分类', NULL, NULL, 'Category', 'crud', '', 'com.spzx.product', 'product', 'category',
        '商品分类', 'atguigu', '0', '/', NULL, 'admin', '2024-09-27 11:41:00', '', NULL, NULL);

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`
(
    `column_id`      bigint                                                        NOT NULL AUTO_INCREMENT COMMENT '编号',
    `table_id`       bigint                                                        NULL DEFAULT NULL COMMENT '归属表编号',
    `column_name`    varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '列名称',
    `column_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '列描述',
    `column_type`    varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '列类型',
    `java_type`      varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
    `java_field`     varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
    `is_pk`          char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci      NULL DEFAULT NULL COMMENT '是否主键（1是）',
    `is_increment`   char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci      NULL DEFAULT NULL COMMENT '是否自增（1是）',
    `is_required`    char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci      NULL DEFAULT NULL COMMENT '是否必填（1是）',
    `is_insert`      char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci      NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
    `is_edit`        char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci      NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
    `is_list`        char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci      NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
    `is_query`       char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci      NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
    `query_type`     varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
    `html_type`      varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
    `dict_type`      varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
    `sort`           int                                                           NULL DEFAULT NULL COMMENT '排序',
    `create_by`      varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NULL DEFAULT '' COMMENT '创建者',
    `create_time`    datetime                                                      NULL DEFAULT NULL COMMENT '创建时间',
    `update_by`      varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NULL DEFAULT '' COMMENT '更新者',
    `update_time`    datetime                                                      NULL DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 40
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci COMMENT = '代码生成业务表字段'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column`
VALUES (19, 2, 'id', 'ID', 'bigint', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin',
        '2024-09-27 11:41:00', '', '2024-09-27 11:50:50');
INSERT INTO `gen_table_column`
VALUES (20, 2, 'name', '品牌名称', 'varchar(100)', 'String', 'name', '0', '0', NULL, '1', '1', '1', '1', 'LIKE',
        'input', '', 2, 'admin', '2024-09-27 11:41:00', '', '2024-09-27 11:50:50');
INSERT INTO `gen_table_column`
VALUES (21, 2, 'logo', '品牌图标', 'varchar(255)', 'String', 'logo', '0', '0', NULL, '1', '1', '1', '1', 'EQ',
        'imageUpload', '', 3, 'admin', '2024-09-27 11:41:00', '', '2024-09-27 11:50:50');
INSERT INTO `gen_table_column`
VALUES (22, 2, 'create_time', '创建时间', 'timestamp', 'Date', 'createTime', '0', '0', '1', '1', NULL, NULL, NULL, 'EQ',
        'datetime', '', 4, 'admin', '2024-09-27 11:41:00', '', '2024-09-27 11:50:50');
INSERT INTO `gen_table_column`
VALUES (23, 2, 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ',
        'input', '', 5, 'admin', '2024-09-27 11:41:00', '', '2024-09-27 11:50:50');
INSERT INTO `gen_table_column`
VALUES (24, 2, 'update_time', '更新时间', 'timestamp', 'Date', 'updateTime', '0', '0', '1', '1', '1', NULL, NULL, 'EQ',
        'datetime', '', 6, 'admin', '2024-09-27 11:41:00', '', '2024-09-27 11:50:50');
INSERT INTO `gen_table_column`
VALUES (25, 2, 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ',
        'input', '', 7, 'admin', '2024-09-27 11:41:00', '', '2024-09-27 11:50:50');
INSERT INTO `gen_table_column`
VALUES (26, 2, 'del_flag', '删除标志（0代表存在 2代表删除）', 'char(1)', 'String', 'delFlag', '0', '0', '1', '1', NULL,
        NULL, NULL, 'EQ', 'input', '', 8, 'admin', '2024-09-27 11:41:00', '', '2024-09-27 11:50:50');
INSERT INTO `gen_table_column`
VALUES (27, 2, 'remark', '备注', 'varchar(255)', 'String', 'remark', '0', '0', NULL, '0', '1', '1', NULL, 'EQ', 'input',
        '', 9, 'admin', '2024-09-27 11:41:00', '', '2024-09-27 11:50:50');
INSERT INTO `gen_table_column`
VALUES (28, 3, 'id', '分类id', 'bigint', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1,
        'admin', '2024-09-27 11:41:00', '', NULL);
INSERT INTO `gen_table_column`
VALUES (29, 3, 'name', '分类名称', 'varchar(50)', 'String', 'name', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input',
        '', 2, 'admin', '2024-09-27 11:41:00', '', NULL);
INSERT INTO `gen_table_column`
VALUES (30, 3, 'image_url', NULL, 'varchar(200)', 'String', 'imageUrl', '0', '0', NULL, '1', '1', '1', '1', 'EQ',
        'input', '', 3, 'admin', '2024-09-27 11:41:00', '', NULL);
INSERT INTO `gen_table_column`
VALUES (31, 3, 'parent_id', '父分类id', 'bigint', 'Long', 'parentId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input',
        '', 4, 'admin', '2024-09-27 11:41:00', '', NULL);
INSERT INTO `gen_table_column`
VALUES (32, 3, 'status', '是否显示[0-不显示，1显示]', 'tinyint', 'Long', 'status', '0', '0', NULL, '1', '1', '1', '1',
        'EQ', 'radio', '', 5, 'admin', '2024-09-27 11:41:00', '', NULL);
INSERT INTO `gen_table_column`
VALUES (33, 3, 'order_num', '排序', 'int', 'Long', 'orderNum', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6,
        'admin', '2024-09-27 11:41:00', '', NULL);
INSERT INTO `gen_table_column`
VALUES (34, 3, 'create_time', '创建时间', 'timestamp', 'Date', 'createTime', '0', '0', '1', '1', NULL, NULL, NULL, 'EQ',
        'datetime', '', 7, 'admin', '2024-09-27 11:41:00', '', NULL);
INSERT INTO `gen_table_column`
VALUES (35, 3, 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ',
        'input', '', 8, 'admin', '2024-09-27 11:41:00', '', NULL);
INSERT INTO `gen_table_column`
VALUES (36, 3, 'update_time', '更新时间', 'timestamp', 'Date', 'updateTime', '0', '0', '1', '1', '1', NULL, NULL, 'EQ',
        'datetime', '', 9, 'admin', '2024-09-27 11:41:00', '', NULL);
INSERT INTO `gen_table_column`
VALUES (37, 3, 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ',
        'input', '', 10, 'admin', '2024-09-27 11:41:00', '', NULL);
INSERT INTO `gen_table_column`
VALUES (38, 3, 'del_flag', '删除标志（0代表存在 2代表删除）', 'char(1)', 'String', 'delFlag', '0', '0', '1', '1', NULL,
        NULL, NULL, 'EQ', 'input', '', 11, 'admin', '2024-09-27 11:41:00', '', NULL);
INSERT INTO `gen_table_column`
VALUES (39, 3, 'remark', '备注', 'varchar(255)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input',
        '', 12, 'admin', '2024-09-27 11:41:00', '', NULL);

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`
(
    `id`            bigint                                                        NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `name`          varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL     DEFAULT NULL COMMENT '商品名称',
    `brand_id`      bigint                                                        NULL     DEFAULT NULL COMMENT '品牌ID',
    `category1_id`  bigint                                                        NULL     DEFAULT NULL COMMENT '一级分类id',
    `category2_id`  bigint                                                        NULL     DEFAULT NULL COMMENT '二级分类id',
    `category3_id`  bigint                                                        NULL     DEFAULT NULL COMMENT '三级分类id',
    `unit_name`     varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci  NULL     DEFAULT NULL COMMENT '计量单位',
    `slider_urls`   text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci         NULL COMMENT '轮播图',
    `spec_value`    varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL     DEFAULT NULL COMMENT '商品规格json',
    `status`        tinyint                                                       NOT NULL DEFAULT 0 COMMENT '线上状态：0-初始值，1-上架，-1-自主下架',
    `audit_status`  tinyint                                                       NOT NULL DEFAULT 0 COMMENT '审核状态：0-初始值，1-通过，-1-未通过',
    `audit_message` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL     DEFAULT NULL COMMENT '审核信息',
    `create_time`   timestamp                                                     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `create_by`     varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NULL     DEFAULT NULL COMMENT '创建者',
    `update_time`   timestamp                                                     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `update_by`     varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NULL     DEFAULT NULL COMMENT '更新者',
    `del_flag`      char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci      NOT NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
    `remark`        varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL     DEFAULT NULL COMMENT '备注',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 5
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci COMMENT = '商品'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product`
VALUES (1, '小米 红米Note101 5G手机', 2, 1, 2, 3, '个',
        'http://139.198.127.41:9000/spzx/20230525/665832167-5_u_1.jpg,http://139.198.127.41:9000/spzx/20230525/665832167-6_u_1.jpg,http://139.198.127.41:9000/spzx/20230525/665832167-4_u_1.jpg,http://139.198.127.41:9000/spzx/20230525/665832167-1_u_1.jpg,http://139.198.127.41:9000/spzx/20230525/665832167-5_u_1 (1).jpg,http://139.198.127.41:9000/spzx/20230525/665832167-3_u_1.jpg\n',
        '[{\"key\":\"颜色\",\"valueList\":[\"白色\",\"红色\",\"黑色\"]},{\"key\":\"内存\",\"valueList\":[\"8G\",\"18G\"]}]',
        1, 1, '审批通过', '2023-05-25 22:21:07', 'admin', '2024-11-05 21:11:36', 'admin', '0', NULL);
INSERT INTO `product`
VALUES (2, '华为笔记本', 1, 1, 2, 3, '个',
        'http://139.198.127.41:9000/spzx/20230525/4b5a68a9bfbd0795.jpg.avif,http://139.198.127.41:9000/spzx/20230525/13beb824e9dcfc88.jpg.avif,http://139.198.127.41:9000/spzx/20230525/3976e9cfaf7c6ceb.jpg.avif,http://139.198.127.41:9000/spzx/20230525/35b3b7e2e67b98b2.jpg.avif,http://139.198.127.41:9000/spzx/20230525/c8f2eae0d36b6270.jpg.avif',
        '[{\"key\":\"内存\",\"valueList\":[\"8G\",\"16G\",\"32G\"]}]', 1, 1, '审批通过', '2023-05-25 23:18:28', 'admin',
        '2024-11-05 21:11:36', 'admin', '0', NULL);
INSERT INTO `product`
VALUES (3, '小米手机2000', 6, 1, 2, 3, '个',
        'http://139.198.127.41:9000/spzx/2024/02/28/665832167-5_u_1_20240228132712A025.jpg,http://139.198.127.41:9000/spzx/2024/02/28/665832167-4_u_1_20240228132712A024.jpg,http://139.198.127.41:9000/spzx/2024/02/28/665832167-3_u_1_20240228132712A021.jpg,http://139.198.127.41:9000/spzx/2024/02/28/665832167-5_u_1 (1)_20240228132712A023.jpg,http://139.198.127.41:9000/spzx/2024/02/28/665832167-1_u_1_20240228132712A022.jpg',
        '[{\"key\":\"颜色\",\"valueList\":[\"白色\",\"红色\",\"黑色\"]},{\"key\":\"内存\",\"valueList\":[\"8G\",\"18G\"]}]',
        1, 1, '审批通过', '2024-09-21 15:25:19', 'admin', '2024-11-05 21:11:36', 'admin', '0', NULL);
INSERT INTO `product`
VALUES (4, '小霸王手机款学习机', 20, 1, 2, 3, '台',
        'http://192.168.6.100:9000/spzx/2024/11/06/0557e788e2d733db_20241106091841A004.jpg,http://192.168.6.100:9000/spzx/2024/11/06/3631bce316fec01d_20241106091841A002.jpg,http://192.168.6.100:9000/spzx/2024/11/06/61fa03c5fb829dea_20241106091841A003.jpg,http://192.168.6.100:9000/spzx/2024/11/06/145fea11d00060b7_20241106091841A006.jpg,http://192.168.6.100:9000/spzx/2024/11/06/7a936d38e1447233_20241106091841A005.jpg',
        '[{\"key\":\"大小\",\"valueList\":[\"大款式\",\"中款式\",\"迷你款\"]},{\"key\":\"颜色\",\"valueList\":[\"白色\",\"黑色\"]}]',
        1, 1, '审批通过', '2024-11-06 09:20:38', 'admin', '2024-11-06 09:21:46', NULL, '0', NULL);

-- ----------------------------
-- Table structure for product_details
-- ----------------------------
DROP TABLE IF EXISTS `product_details`;
CREATE TABLE `product_details`
(
    `id`          bigint                                                        NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `product_id`  bigint                                                        NULL     DEFAULT NULL COMMENT '商品id',
    `image_urls`  text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci         NULL COMMENT '详情图片地址',
    `create_time` timestamp                                                     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `create_by`   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NULL     DEFAULT NULL COMMENT '创建者',
    `update_time` timestamp                                                     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `update_by`   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NULL     DEFAULT NULL COMMENT '更新者',
    `del_flag`    char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci      NOT NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
    `remark`      varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL     DEFAULT NULL COMMENT '备注',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 5
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci COMMENT = '商品sku属性表'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_details
-- ----------------------------
INSERT INTO `product_details`
VALUES (1, 1,
        'http://139.198.127.41:9000/spzx/20230525/665832167-5_u_1.jpg,http://139.198.127.41:9000/spzx/20230525/665832167-6_u_1.jpg,http://139.198.127.41:9000/spzx/20230525/665832167-4_u_1.jpg,http://139.198.127.41:9000/spzx/20230525/665832167-1_u_1.jpg,http://139.198.127.41:9000/spzx/20230525/665832167-5_u_1 (1).jpg,http://139.198.127.41:9000/spzx/20230525/665832167-3_u_1.jpg',
        '2023-05-25 22:21:07', NULL, '2023-05-25 22:24:46', NULL, '0', NULL);
INSERT INTO `product_details`
VALUES (2, 2,
        'http://139.198.127.41:9000/spzx/20230525/3976e9cfaf7c6ceb.jpg.avif,http://139.198.127.41:9000/spzx/20230525/f1d7433dbe88c25e.jpg.avif,http://139.198.127.41:9000/spzx/20230525/13beb824e9dcfc88.jpg.avif,http://139.198.127.41:9000/spzx/20230525/4b5a68a9bfbd0795.jpg.avif,http://139.198.127.41:9000/spzx/20230525/35b3b7e2e67b98b2.jpg.avif,http://139.198.127.41:9000/spzx/20230525/c8f2eae0d36b6270.jpg.avif,http://139.198.127.41:9000/spzx/20230525/fd5c6bfa6f3c4d43.jpg.avif',
        '2023-05-25 23:18:28', NULL, '2024-09-21 15:36:04', NULL, '0', NULL);
INSERT INTO `product_details`
VALUES (3, 3,
        'http://192.168.6.100:9000/spzx/2024/11/05/61fa03c5fb829dea_20241105213600A004.jpg,http://192.168.6.100:9000/spzx/2024/11/05/3631bce316fec01d_20241105213600A002.jpg,http://192.168.6.100:9000/spzx/2024/11/05/0557e788e2d733db_20241105213600A005.jpg,http://192.168.6.100:9000/spzx/2024/11/05/7a936d38e1447233_20241105213600A001.jpg,http://192.168.6.100:9000/spzx/2024/11/05/145fea11d00060b7_20241105213600A003.jpg',
        '2024-09-21 15:25:19', NULL, '2024-09-21 15:36:04', NULL, '0', NULL);
INSERT INTO `product_details`
VALUES (4, 4,
        'http://192.168.6.100:9000/spzx/2024/11/06/61fa03c5fb829dea_20241106092035A013.jpg,http://192.168.6.100:9000/spzx/2024/11/06/3631bce316fec01d_20241106092035A015.jpg,http://192.168.6.100:9000/spzx/2024/11/06/145fea11d00060b7_20241106092035A014.jpg,http://192.168.6.100:9000/spzx/2024/11/06/0557e788e2d733db_20241106092035A016.jpg,http://192.168.6.100:9000/spzx/2024/11/06/7a936d38e1447233_20241106092035A017.jpg',
        '2024-11-06 09:20:38', NULL, '2024-11-06 09:20:38', NULL, '0', NULL);

-- ----------------------------
-- Table structure for product_sku
-- ----------------------------
DROP TABLE IF EXISTS `product_sku`;
CREATE TABLE `product_sku`
(
    `id`           bigint                                                        NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `sku_code`     varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci  NULL     DEFAULT NULL COMMENT '商品编号',
    `sku_name`     varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL     DEFAULT NULL,
    `product_id`   bigint                                                        NULL     DEFAULT NULL COMMENT '商品ID',
    `thumb_img`    varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL     DEFAULT NULL COMMENT '缩略图路径',
    `sale_price`   decimal(10, 2)                                                NULL     DEFAULT NULL COMMENT '售价',
    `market_price` decimal(10, 2)                                                NULL     DEFAULT NULL COMMENT '市场价',
    `cost_price`   decimal(10, 2)                                                NULL     DEFAULT NULL COMMENT '成本价',
    `sku_spec`     varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL     DEFAULT '' COMMENT 'sku规格信息json',
    `weight`       decimal(10, 2)                                                NULL     DEFAULT NULL COMMENT '重量',
    `volume`       decimal(10, 2)                                                NULL     DEFAULT NULL COMMENT '体积',
    `status`       tinyint                                                       NULL     DEFAULT NULL COMMENT '线上状态：0-初始值，1-上架，-1-自主下架',
    `create_time`  timestamp                                                     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `create_by`    varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NULL     DEFAULT NULL COMMENT '创建者',
    `update_time`  timestamp                                                     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `update_by`    varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NULL     DEFAULT NULL COMMENT '更新者',
    `del_flag`     char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci      NOT NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
    `remark`       varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL     DEFAULT NULL COMMENT '备注',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 22
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci COMMENT = '商品sku'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_sku
-- ----------------------------
INSERT INTO `product_sku`
VALUES (1, '1_0', '小米 红米Note10 5G手机 白色 + 8G', 1, 'http://139.198.127.41:9000/spzx/20230525/665832167-5_u_1.jpg',
        96.00, 2019.00, 1599.00, '白色 + 8G', 1.00, 1.00, 1, '2023-05-25 22:21:07', NULL, '2024-10-14 15:33:54', NULL,
        '0', NULL);
INSERT INTO `product_sku`
VALUES (2, '1_1', '小米 红米Note10 5G手机 白色 + 18G', 1,
        'http://139.198.127.41:9000/spzx/20230525/665832167-6_u_1.jpg', 2990.00, 3019.00, 2599.00, '白色 + 18G', 1.00,
        1.00, 1, '2023-05-25 22:21:07', NULL, '2024-01-22 23:39:47', NULL, '0', NULL);
INSERT INTO `product_sku`
VALUES (3, '1_2', '小米 红米Note10 5G手机 红色 + 8G', 1, 'http://139.198.127.41:9000/spzx/20230525/665832167-4_u_1.jpg',
        1999.00, 2019.00, 1599.00, '红色 + 8G', 1.00, 1.00, 1, '2023-05-25 22:21:07', NULL, '2024-01-12 17:39:52', NULL,
        '0', NULL);
INSERT INTO `product_sku`
VALUES (4, '1_3', '小米 红米Note10 5G手机 红色 + 18G', 1,
        'http://139.198.127.41:9000/spzx/20230525/665832167-5_u_1%20(1).jpg', 2999.00, 3019.00, 2599.00, '红色 + 18G',
        1.00, 1.00, 1, '2023-05-25 22:21:07', NULL, '2024-01-12 17:39:52', NULL, '0', NULL);
INSERT INTO `product_sku`
VALUES (5, '1_4', '小米 红米Note10 5G手机 黑色 + 8G', 1, 'http://139.198.127.41:9000/spzx/20230525/665832167-1_u_1.jpg',
        1999.00, 2019.00, 1599.00, '黑色 + 8G', 1.00, 1.00, 1, '2023-05-25 22:21:07', NULL, '2024-01-12 17:39:53', NULL,
        '0', NULL);
INSERT INTO `product_sku`
VALUES (6, '1_5', '小米 红米Note10 5G手机 黑色 + 18G', 1,
        'http://139.198.127.41:9000/spzx/20230525/665832167-3_u_1.jpg', 2999.00, 3019.00, 2599.00, '黑色 + 18G', 1.00,
        1.00, 1, '2023-05-25 22:21:07', NULL, '2024-01-12 17:39:54', NULL, '0', NULL);
INSERT INTO `product_sku`
VALUES (7, '2_0', '华为笔记本 8G', 2, 'http://139.198.127.41:9000/spzx/20230525/4b5a68a9bfbd0795.jpg.avif', 3999.00,
        3999.00, 3999.00, '8G', 1.00, 2.00, 1, '2023-05-25 23:18:28', NULL, '2024-09-21 15:36:11', NULL, '0', NULL);
INSERT INTO `product_sku`
VALUES (8, '2_1', '华为笔记本 16G', 2, 'http://139.198.127.41:9000/spzx/20230525/35b3b7e2e67b98b2.jpg.avif', 4999.00,
        4999.00, 4999.00, '16G', 1.00, 2.00, 1, '2023-05-25 23:18:28', NULL, '2024-09-21 15:36:11', NULL, '0', NULL);
INSERT INTO `product_sku`
VALUES (9, '2_2', '华为笔记本 32G', 2, 'http://139.198.127.41:9000/spzx/20230525/c8f2eae0d36b6270.jpg.avif', 5999.00,
        5999.00, 5999.00, '32G', 1.00, 2.00, 1, '2023-05-25 23:18:28', NULL, '2024-09-21 15:36:11', NULL, '0', NULL);
INSERT INTO `product_sku`
VALUES (10, '5_0', '小米手机10 白色 + 8G', 3,
        'http://192.168.6.100:9000/spzx/2024/11/05/3631bce316fec01d_20241105213620A006.jpg', 1000.00, 2199.00, 1000.00,
        '白色 + 8G', 10.00, 10.00, 1, '2024-09-21 15:25:19', NULL, '2024-10-08 12:00:53', NULL, '0', NULL);
INSERT INTO `product_sku`
VALUES (11, '5_1', '小米手机10 白色 + 18G', 3,
        'http://192.168.6.100:9000/spzx/2024/11/05/d77eb2eebce172ce_20241105213625A007.jpg', 2000.00, 3199.00, 2000.00,
        '白色 + 18G', 1.00, 1.00, 1, '2024-09-21 15:25:19', NULL, '2024-10-08 12:00:53', NULL, '0', NULL);
INSERT INTO `product_sku`
VALUES (12, '5_2', '小米手机10 红色 + 8G', 3,
        'http://139.198.127.41:9000/spzx/2024/02/28/665832167-3_u_1_20240228132939A029.jpg', 3999.00, 2199.00, 1000.00,
        '红色 + 8G', 1.00, 1.00, 1, '2024-09-21 15:25:19', NULL, '2024-10-08 12:00:53', NULL, '0', NULL);
INSERT INTO `product_sku`
VALUES (13, '5_3', '小米手机10 红色 + 18G', 3,
        'http://139.198.127.41:9000/spzx/2024/02/28/665832167-5_u_1 (1)_20240228132943A030.jpg', 4999.00, 3199.00,
        2000.00, '红色 + 18G', 1.00, 1.00, 1, '2024-09-21 15:25:19', NULL, '2024-10-08 12:00:53', NULL, '0', NULL);
INSERT INTO `product_sku`
VALUES (14, '5_4', '小米手机10 黑色 + 8G', 3,
        'http://139.198.127.41:9000/spzx/2024/02/28/665832167-5_u_1_20240228132946A031.jpg', 5999.00, 2199.00, 1000.00,
        '黑色 + 8G', 1.00, 1.00, 1, '2024-09-21 15:25:19', NULL, '2024-10-08 12:00:53', NULL, '0', NULL);
INSERT INTO `product_sku`
VALUES (15, '5_5', '小米手机10 黑色 + 18G', 3,
        'http://139.198.127.41:9000/spzx/2024/02/28/665832167-1_u_1_20240228132950A032.jpg', 6999.00, 3199.00, 2000.00,
        '黑色 + 18G', 1.00, 1.00, 1, '2024-09-21 15:25:19', NULL, '2024-10-08 12:00:53', NULL, '0', NULL);
INSERT INTO `product_sku`
VALUES (16, '4_0', '小霸王手机款学习机 大款式 + 白色', 4,
        'http://192.168.6.100:9000/spzx/2024/11/06/7a936d38e1447233_20241106091958A007.jpg', 1.00, 1.00, 1.00,
        '大款式 + 白色', 1.00, 1.00, 0, '2024-11-06 09:20:38', NULL, '2024-11-06 09:20:38', NULL, '0', NULL);
INSERT INTO `product_sku`
VALUES (17, '4_1', '小霸王手机款学习机 大款式 + 黑色', 4,
        'http://192.168.6.100:9000/spzx/2024/11/06/145fea11d00060b7_20241106092004A008.jpg', 1.00, 1.00, 1.00,
        '大款式 + 黑色', 1.00, 1.00, 0, '2024-11-06 09:20:38', NULL, '2024-11-06 09:20:38', NULL, '0', NULL);
INSERT INTO `product_sku`
VALUES (18, '4_2', '小霸王手机款学习机 中款式 + 白色', 4,
        'http://192.168.6.100:9000/spzx/2024/11/06/3631bce316fec01d_20241106092009A009.jpg', 1.00, 1.00, 1.00,
        '中款式 + 白色', 1.00, 1.00, 0, '2024-11-06 09:20:38', NULL, '2024-11-06 09:20:38', NULL, '0', NULL);
INSERT INTO `product_sku`
VALUES (19, '4_3', '小霸王手机款学习机 中款式 + 黑色', 4,
        'http://192.168.6.100:9000/spzx/2024/11/06/c95379363744dd62_20241106092014A010.jpg', 1.00, 1.00, 1.00,
        '中款式 + 黑色', 1.00, 1.00, 0, '2024-11-06 09:20:38', NULL, '2024-11-06 09:20:38', NULL, '0', NULL);
INSERT INTO `product_sku`
VALUES (20, '4_4', '小霸王手机款学习机 迷你款 + 白色', 4,
        'http://192.168.6.100:9000/spzx/2024/11/06/5fcdce071193d65e_20241106092020A011.jpg', 1.00, 1.00, 1.00,
        '迷你款 + 白色', 1.00, 1.00, 0, '2024-11-06 09:20:38', NULL, '2024-11-06 09:20:38', NULL, '0', NULL);
INSERT INTO `product_sku`
VALUES (21, '4_5', '小霸王手机款学习机 迷你款 + 黑色', 4,
        'http://192.168.6.100:9000/spzx/2024/11/06/d77eb2eebce172ce_20241106092025A012.jpg', 1.00, 1.00, 1.00,
        '迷你款 + 黑色', 1.00, 1.00, 0, '2024-11-06 09:20:38', NULL, '2024-11-06 09:20:38', NULL, '0', NULL);

-- ----------------------------
-- Table structure for product_spec
-- ----------------------------
DROP TABLE IF EXISTS `product_spec`;
CREATE TABLE `product_spec`
(
    `id`          bigint                                                        NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `category_id` bigint                                                        NULL     DEFAULT NULL COMMENT '分类id',
    `spec_name`   varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL     DEFAULT NULL COMMENT '规格名称',
    `spec_value`  text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci         NULL COMMENT '规格值：\"[{\"key\":\"颜色\",\"valueList\":[\"蓝\",\"白\",\"红\"]]\"',
    `create_time` timestamp                                                     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `create_by`   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NULL     DEFAULT NULL COMMENT '创建者',
    `update_time` timestamp                                                     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `update_by`   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NULL     DEFAULT NULL COMMENT '更新者',
    `del_flag`    char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci      NOT NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
    `remark`      varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL     DEFAULT NULL COMMENT '备注',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 13
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci COMMENT = '商品规格'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_spec
-- ----------------------------
INSERT INTO `product_spec`
VALUES (1, 3, '小米手机',
        '[{\"key\":\"颜色\",\"valueList\":[\"白色\",\"红色\",\"黑色\"]},{\"key\":\"内存\",\"valueList\":[\"8G\",\"18G\"]}]',
        '2023-05-06 20:40:22', NULL, '2024-02-21 00:03:01', 'admin', '0', NULL);
INSERT INTO `product_spec`
VALUES (2, 42, '笔记本电脑', '[{\"key\":\"内存\",\"valueList\":[\"8G\",\"16G\",\"32G\"]}]', '2023-05-06 20:56:08', NULL,
        '2024-02-20 17:19:06', 'admin', '0', NULL);
INSERT INTO `product_spec`
VALUES (10, 42, ' 华为手机2', '[{\"key\":\"内存大小\",\"valueList\":[\"128G\",\"256G\"]}]', '2024-09-20 16:51:56', '',
        '2024-09-20 16:52:57', '', '2', NULL);
INSERT INTO `product_spec`
VALUES (11, 3, '荣耀手机',
        '[{\"key\":\"颜色\",\"valueList\":[\"白色\",\"红色\",\"黑色\"]},{\"key\":\"内存\",\"valueList\":[\"8G\",\"16G\"]}]',
        '2024-09-25 09:23:17', 'admin', '2024-09-25 09:23:17', NULL, '0', NULL);
INSERT INTO `product_spec`
VALUES (12, 3, '小霸王学习机',
        '[{\"key\":\"大小\",\"valueList\":[\"大款式\",\"中款式\",\"迷你款\"]},{\"key\":\"颜色\",\"valueList\":[\"白色\",\"黑色\"]}]',
        '2024-11-06 09:17:54', 'admin', '2024-11-06 09:17:54', NULL, '0', NULL);

-- ----------------------------
-- Table structure for product_unit
-- ----------------------------
DROP TABLE IF EXISTS `product_unit`;
CREATE TABLE `product_unit`
(
    `id`          bigint                                                        NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `name`        varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL     DEFAULT NULL COMMENT '名称',
    `create_time` timestamp                                                     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `create_by`   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NULL     DEFAULT NULL COMMENT '创建者',
    `update_time` timestamp                                                     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `update_by`   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NULL     DEFAULT NULL COMMENT '更新者',
    `del_flag`    char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci      NOT NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
    `remark`      varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL     DEFAULT NULL COMMENT '备注',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 8
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci COMMENT = '商品单位'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_unit
-- ----------------------------
INSERT INTO `product_unit`
VALUES (1, '个', '2023-05-12 18:43:17', NULL, '2023-05-12 18:43:17', NULL, '0', NULL);
INSERT INTO `product_unit`
VALUES (2, '台', '2023-06-06 17:47:17', NULL, '2023-06-06 17:47:17', NULL, '0', NULL);
INSERT INTO `product_unit`
VALUES (3, '包', '2023-06-06 17:47:21', NULL, '2023-06-06 17:47:21', NULL, '0', NULL);
INSERT INTO `product_unit`
VALUES (4, '打', '2023-06-06 17:47:26', NULL, '2023-06-06 17:47:26', NULL, '0', NULL);
INSERT INTO `product_unit`
VALUES (5, '带', '2023-06-06 17:47:43', NULL, '2023-06-06 17:47:43', NULL, '0', NULL);

-- ----------------------------
-- Table structure for sku_stock
-- ----------------------------
DROP TABLE IF EXISTS `sku_stock`;
CREATE TABLE `sku_stock`
(
    `id`            bigint                                                        NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `sku_id`        bigint                                                        NULL     DEFAULT NULL COMMENT '商品ID',
    `total_num`     int                                                           NULL     DEFAULT NULL COMMENT '总库存数',
    `lock_num`      int                                                           NULL     DEFAULT NULL COMMENT '锁定库存',
    `available_num` int                                                           NULL     DEFAULT NULL COMMENT '可用库存',
    `sale_num`      int                                                           NULL     DEFAULT NULL COMMENT '销量',
    `status`        tinyint                                                       NULL     DEFAULT NULL COMMENT '线上状态：0-初始值，1-上架，-1-自主下架',
    `create_time`   timestamp                                                     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `create_by`     varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NULL     DEFAULT NULL COMMENT '创建者',
    `update_time`   timestamp                                                     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `update_by`     varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NULL     DEFAULT NULL COMMENT '更新者',
    `del_flag`      char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci      NOT NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
    `remark`        varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL     DEFAULT NULL COMMENT '备注',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `uni_sku_id` (`sku_id` ASC) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 22
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci COMMENT = '商品sku库存表'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sku_stock
-- ----------------------------
INSERT INTO `sku_stock`
VALUES (1, 1, 97, 0, 97, 3, NULL, '2024-01-16 22:02:04', NULL, '2024-10-18 15:49:07', NULL, '0', NULL);
INSERT INTO `sku_stock`
VALUES (2, 2, 100, 0, 100, 0, NULL, '2024-01-16 22:02:08', NULL, '2024-02-28 16:29:16', NULL, '0', NULL);
INSERT INTO `sku_stock`
VALUES (3, 3, 100, 0, 100, 0, NULL, '2024-01-16 22:02:16', NULL, '2024-01-22 23:32:28', NULL, '0', NULL);
INSERT INTO `sku_stock`
VALUES (4, 4, 100, 0, 100, 0, NULL, '2024-01-16 22:02:17', NULL, '2024-02-28 16:29:22', NULL, '0', NULL);
INSERT INTO `sku_stock`
VALUES (5, 5, 100, 1, 99, 0, NULL, '2024-01-16 22:02:20', NULL, '2024-02-28 16:29:35', NULL, '0', NULL);
INSERT INTO `sku_stock`
VALUES (6, 6, 100, 0, 100, 0, NULL, '2024-01-16 22:02:21', NULL, '2024-01-17 23:28:39', NULL, '0', NULL);
INSERT INTO `sku_stock`
VALUES (7, 7, 100, 2, 98, 0, NULL, '2024-01-16 22:02:24', NULL, '2024-09-21 15:36:15', NULL, '0', NULL);
INSERT INTO `sku_stock`
VALUES (8, 8, 100, 0, 100, 0, NULL, '2024-01-16 22:02:26', NULL, '2024-09-21 15:36:15', NULL, '0', NULL);
INSERT INTO `sku_stock`
VALUES (9, 9, 100, 0, 100, 0, NULL, '2024-01-16 22:02:28', NULL, '2024-09-21 15:36:15', NULL, '0', NULL);
INSERT INTO `sku_stock`
VALUES (10, 10, 1100, 0, 1100, 0, NULL, '2024-09-21 15:25:19', NULL, '2024-09-21 15:36:15', NULL, '0', NULL);
INSERT INTO `sku_stock`
VALUES (11, 11, 1100, 0, 1100, 0, NULL, '2024-09-21 15:25:19', NULL, '2024-09-21 15:36:15', NULL, '0', NULL);
INSERT INTO `sku_stock`
VALUES (12, 12, 1100, 0, 1100, 0, NULL, '2024-09-21 15:25:19', NULL, '2024-09-21 15:36:15', NULL, '0', NULL);
INSERT INTO `sku_stock`
VALUES (13, 13, 1100, 0, 1100, 0, NULL, '2024-09-21 15:25:19', NULL, '2024-09-21 15:36:15', NULL, '0', NULL);
INSERT INTO `sku_stock`
VALUES (14, 14, 1100, 0, 1100, 0, NULL, '2024-09-21 15:25:19', NULL, '2024-09-21 15:36:15', NULL, '0', NULL);
INSERT INTO `sku_stock`
VALUES (15, 15, 1100, 0, 1100, 0, NULL, '2024-09-21 15:25:19', NULL, '2024-09-21 15:36:15', NULL, '0', NULL);
INSERT INTO `sku_stock`
VALUES (16, 16, 100, 0, 100, 0, NULL, '2024-11-06 09:20:38', NULL, '2024-11-06 09:20:38', NULL, '0', NULL);
INSERT INTO `sku_stock`
VALUES (17, 17, 100, 0, 100, 0, NULL, '2024-11-06 09:20:38', NULL, '2024-11-06 09:20:38', NULL, '0', NULL);
INSERT INTO `sku_stock`
VALUES (18, 18, 100, 0, 100, 0, NULL, '2024-11-06 09:20:38', NULL, '2024-11-06 09:20:38', NULL, '0', NULL);
INSERT INTO `sku_stock`
VALUES (19, 19, 100, 0, 100, 0, NULL, '2024-11-06 09:20:38', NULL, '2024-11-06 09:20:38', NULL, '0', NULL);
INSERT INTO `sku_stock`
VALUES (20, 20, 100, 0, 100, 0, NULL, '2024-11-06 09:20:38', NULL, '2024-11-06 09:20:38', NULL, '0', NULL);
INSERT INTO `sku_stock`
VALUES (21, 21, 100, 0, 100, 0, NULL, '2024-11-06 09:20:38', NULL, '2024-11-06 09:20:38', NULL, '0', NULL);

SET FOREIGN_KEY_CHECKS = 1;
