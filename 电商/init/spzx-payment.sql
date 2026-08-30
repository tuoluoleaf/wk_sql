/*
 Navicat Premium Data Transfer

 Source Server         : 192.168.6.100_spzx_3306
 Source Server Type    : MySQL
 Source Server Version : 80030
 Source Host           : 192.168.6.100:3306
 Source Schema         : spzx-payment

 Target Server Type    : MySQL
 Target Server Version : 80030
 File Encoding         : 65001

 Date: 06/11/2024 11:54:27
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- 切库
use `spzx-payment`;

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
    `tpl_web_type`      varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci   NULL DEFAULT 'element-plus' COMMENT '前端模板类型（element-ui模版 element-plus模版）',
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
VALUES (3, 'payment_info', '付款信息表', NULL, NULL, 'PaymentInfo', 'crud', 'element-plus', 'com.spzx.payment',
        'payment', 'paymentInfo', '付款信息', 'atguigu', '0', '/', NULL, 'admin', '2024-10-17 15:57:50', '', NULL,
        NULL);

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
  AUTO_INCREMENT = 58
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci COMMENT = '代码生成业务表字段'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column`
VALUES (42, 3, 'id', 'id', 'bigint', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin',
        '2024-10-17 15:57:50', '', NULL);
INSERT INTO `gen_table_column`
VALUES (43, 3, 'user_id', '用户id', 'bigint', 'Long', 'userId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '',
        2, 'admin', '2024-10-17 15:57:50', '', NULL);
INSERT INTO `gen_table_column`
VALUES (44, 3, 'order_no', '订单号', 'varchar(50)', 'String', 'orderNo', '0', '0', '1', '1', '1', '1', '1', 'EQ',
        'input', '', 3, 'admin', '2024-10-17 15:57:50', '', NULL);
INSERT INTO `gen_table_column`
VALUES (45, 3, 'pay_type', '付款方式：1-微信 2-支付宝', 'tinyint', 'Long', 'payType', '0', '0', '1', '1', '1', '1', '1',
        'EQ', 'select', '', 4, 'admin', '2024-10-17 15:57:50', '', NULL);
INSERT INTO `gen_table_column`
VALUES (46, 3, 'trade_no', '交易编号（微信或支付）', 'varchar(50)', 'String', 'tradeNo', '0', '0', NULL, '1', '1', '1',
        '1', 'EQ', 'input', '', 5, 'admin', '2024-10-17 15:57:50', '', NULL);
INSERT INTO `gen_table_column`
VALUES (47, 3, 'amount', '支付金额', 'decimal(10,2)', 'BigDecimal', 'amount', '0', '0', NULL, '1', '1', '1', '1', 'EQ',
        'input', '', 6, 'admin', '2024-10-17 15:57:50', '', NULL);
INSERT INTO `gen_table_column`
VALUES (48, 3, 'content', '交易内容', 'varchar(200)', 'String', 'content', '0', '0', NULL, '1', '1', '1', '1', 'EQ',
        'editor', '', 7, 'admin', '2024-10-17 15:57:50', '', NULL);
INSERT INTO `gen_table_column`
VALUES (49, 3, 'payment_status', '支付状态：0-未支付 1-已支付 -1-关闭', 'char(4)', 'String', 'paymentStatus', '0', '0',
        NULL, '1', '1', '1', '1', 'EQ', 'radio', '', 8, 'admin', '2024-10-17 15:57:50', '', NULL);
INSERT INTO `gen_table_column`
VALUES (50, 3, 'callback_time', '回调时间', 'datetime', 'Date', 'callbackTime', '0', '0', NULL, '1', '1', '1', '1',
        'EQ', 'datetime', '', 9, 'admin', '2024-10-17 15:57:50', '', NULL);
INSERT INTO `gen_table_column`
VALUES (51, 3, 'callback_content', '回调信息', 'text', 'String', 'callbackContent', '0', '0', NULL, '1', '1', '1', '1',
        'EQ', 'editor', '', 10, 'admin', '2024-10-17 15:57:50', '', NULL);
INSERT INTO `gen_table_column`
VALUES (52, 3, 'create_time', '创建时间', 'timestamp', 'Date', 'createTime', '0', '0', '1', '1', NULL, NULL, NULL, 'EQ',
        'datetime', '', 11, 'admin', '2024-10-17 15:57:50', '', NULL);
INSERT INTO `gen_table_column`
VALUES (53, 3, 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ',
        'input', '', 12, 'admin', '2024-10-17 15:57:50', '', NULL);
INSERT INTO `gen_table_column`
VALUES (54, 3, 'update_time', NULL, 'timestamp', 'Date', 'updateTime', '0', '0', '1', '1', '1', NULL, NULL, 'EQ',
        'datetime', '', 13, 'admin', '2024-10-17 15:57:50', '', NULL);
INSERT INTO `gen_table_column`
VALUES (55, 3, 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ',
        'input', '', 14, 'admin', '2024-10-17 15:57:50', '', NULL);
INSERT INTO `gen_table_column`
VALUES (56, 3, 'del_flag', '删除标志（0代表存在 2代表删除）', 'char(1)', 'String', 'delFlag', '0', '0', '1', '1', NULL,
        NULL, NULL, 'EQ', 'input', '', 15, 'admin', '2024-10-17 15:57:50', '', NULL);
INSERT INTO `gen_table_column`
VALUES (57, 3, 'remark', '备注', 'varchar(255)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input',
        '', 16, 'admin', '2024-10-17 15:57:50', '', NULL);

-- ----------------------------
-- Table structure for payment_info
-- ----------------------------
DROP TABLE IF EXISTS `payment_info`;
CREATE TABLE `payment_info`
(
    `id`               bigint                                                        NOT NULL AUTO_INCREMENT COMMENT 'id',
    `user_id`          bigint                                                        NULL     DEFAULT NULL COMMENT '用户id',
    `order_no`         varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NOT NULL DEFAULT '' COMMENT '订单号',
    `pay_type`         tinyint                                                       NOT NULL DEFAULT 0 COMMENT '付款方式：1-微信 2-支付宝',
    `trade_no`         varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NULL     DEFAULT NULL COMMENT '交易编号（微信或支付）',
    `amount`           decimal(10, 2)                                                NULL     DEFAULT NULL COMMENT '支付金额',
    `content`          varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL     DEFAULT NULL COMMENT '交易内容',
    `payment_status`   char(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci      NULL     DEFAULT NULL COMMENT '支付状态：0-未支付 1-已支付 -1-关闭',
    `callback_time`    datetime                                                      NULL     DEFAULT NULL COMMENT '回调时间',
    `callback_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci         NULL COMMENT '回调信息',
    `create_time`      timestamp                                                     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `create_by`        varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NULL     DEFAULT NULL COMMENT '创建者',
    `update_time`      timestamp                                                     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `update_by`        varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NULL     DEFAULT NULL COMMENT '更新者',
    `del_flag`         char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci      NOT NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
    `remark`           varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL     DEFAULT NULL COMMENT '备注',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 7
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci COMMENT = '付款信息表'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of payment_info
-- ----------------------------
INSERT INTO `payment_info`
VALUES (1, 1, 'e9e4e8f2d92d49888e5d5a18df3f18df', 0, NULL, 0.01, '小米 红米Note10 5G手机 白色 + 8G;', '0', NULL, NULL,
        '2024-10-18 11:37:02', NULL, '2024-11-05 21:05:49', NULL, '0', NULL);
INSERT INTO `payment_info`
VALUES (2, 1, 'f1866bad38bc4627958542d72a15ca9c', 0, '2024101822001488791430237461', 0.01,
        '小米 红米Note10 5G手机 白色 + 8G;', '1', '2024-10-18 15:28:50',
        '{\"gmt_create\":\"2024-10-18 15:28:50\",\"charset\":\"utf-8\",\"seller_email\":\"zhuchangqing@atguigu.com\",\"subject\":\"小米 红米Note10 5G手机 白色   8G;\",\"buyer_id\":\"2088502182688796\",\"invoice_amount\":\"0.01\",\"notify_id\":\"2024101801222152851088791463886821\",\"fund_bill_list\":\"[{\\\"amount\\\":\\\"0.01\\\",\\\"fundChannel\\\":\\\"ALIPAYACCOUNT\\\"}]\",\"notify_type\":\"trade_status_sync\",\"trade_status\":\"TRADE_SUCCESS\",\"receipt_amount\":\"0.01\",\"buyer_pay_amount\":\"0.01\",\"app_id\":\"2021001163617452\",\"seller_id\":\"2088831489324244\",\"gmt_payment\":\"2024-10-18 15:28:50\",\"notify_time\":\"2024-10-18 15:28:51\",\"version\":\"1.0\",\"out_trade_no\":\"7fc705d22d3446d4b2abef3d46d4519d\",\"total_amount\":\"0.01\",\"trade_no\":\"2024101822001488791430237461\",\"auth_app_id\":\"2021001163617452\",\"buyer_logon_id\":\"jls***@163.com\",\"point_amount\":\"0.00\"}',
        '2024-10-18 15:25:39', NULL, '2024-11-05 21:08:01', NULL, '0', NULL);
INSERT INTO `payment_info`
VALUES (3, 1, 'debcf15eccef4f96908c4d2aa053ac38', 2, '2024101822001488791430237461', 0.01,
        '小米 红米Note10 5G手机 白色 + 8G;', '-1', NULL, '', '2024-10-18 15:28:06', NULL, '2024-11-05 21:10:37', NULL,
        '0', NULL);

SET FOREIGN_KEY_CHECKS = 1;
