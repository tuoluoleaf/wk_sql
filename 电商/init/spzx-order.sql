/*
 Navicat Premium Data Transfer

 Source Server         : 192.168.6.100_spzx_3306
 Source Server Type    : MySQL
 Source Server Version : 80030
 Source Host           : 192.168.6.100:3306
 Source Schema         : spzx-order

 Target Server Type    : MySQL
 Target Server Version : 80030
 File Encoding         : 65001

 Date: 06/11/2024 11:54:35
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- 切库
use `spzx-order`;

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
VALUES (1, 'order_info', '订单', NULL, NULL, 'OrderInfo', 'crud', 'element-plus', 'com.spzx.user', 'user', 'orderInfo',
        '订单', 'atguigu', '0', '/', NULL, 'admin', '2024-02-22 08:55:07', '', NULL, NULL);
INSERT INTO `gen_table`
VALUES (2, 'order_item', '订单项信息', NULL, NULL, 'OrderItem', 'crud', 'element-plus', 'com.spzx.user', 'user',
        'orderItem', '订单项信息', 'atguigu', '0', '/', NULL, 'admin', '2024-02-22 08:55:10', '', NULL, NULL);
INSERT INTO `gen_table`
VALUES (3, 'order_log', '订单操作日志记录', NULL, NULL, 'OrderLog', 'crud', 'element-plus', 'com.spzx.order', 'order',
        'orderLog', '订单操作日志记录', 'atguigu', '0', '/', NULL, 'admin', '2024-10-14 11:19:51', '', NULL, NULL);

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
  AUTO_INCREMENT = 53
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci COMMENT = '代码生成业务表字段'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column`
VALUES (1, 1, 'id', 'id', 'bigint(20)', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1,
        'admin', '2024-02-22 08:55:07', '', NULL);
INSERT INTO `gen_table_column`
VALUES (2, 1, 'user_id', '会员_id', 'bigint(20)', 'Long', 'userId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input',
        '', 2, 'admin', '2024-02-22 08:55:07', '', NULL);
INSERT INTO `gen_table_column`
VALUES (3, 1, 'nick_name', '昵称', 'varchar(200)', 'String', 'nickName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE',
        'input', '', 3, 'admin', '2024-02-22 08:55:08', '', NULL);
INSERT INTO `gen_table_column`
VALUES (4, 1, 'order_no', '订单号', 'char(64)', 'String', 'orderNo', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input',
        '', 4, 'admin', '2024-02-22 08:55:08', '', NULL);
INSERT INTO `gen_table_column`
VALUES (5, 1, 'coupon_id', '使用的优惠券', 'bigint(20)', 'Long', 'couponId', '0', '0', NULL, '1', '1', '1', '1', 'EQ',
        'input', '', 5, 'admin', '2024-02-22 08:55:08', '', NULL);
INSERT INTO `gen_table_column`
VALUES (6, 1, 'total_amount', '订单总额', 'decimal(10,2)', 'BigDecimal', 'totalAmount', '0', '0', '1', '1', '1', '1',
        '1', 'EQ', 'input', '', 6, 'admin', '2024-02-22 08:55:08', '', NULL);
INSERT INTO `gen_table_column`
VALUES (7, 1, 'coupon_amount', '优惠券', 'decimal(10,2)', 'BigDecimal', 'couponAmount', '0', '0', '1', '1', '1', '1',
        '1', 'EQ', 'input', '', 7, 'admin', '2024-02-22 08:55:08', '', NULL);
INSERT INTO `gen_table_column`
VALUES (8, 1, 'original_total_amount', '原价金额', 'decimal(10,2)', 'BigDecimal', 'originalTotalAmount', '0', '0', '1',
        '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2024-02-22 08:55:08', '', NULL);
INSERT INTO `gen_table_column`
VALUES (9, 1, 'feight_fee', '运费', 'decimal(10,2)', 'BigDecimal', 'feightFee', '0', '0', '1', '1', '1', '1', '1', 'EQ',
        'input', '', 9, 'admin', '2024-02-22 08:55:08', '', NULL);
INSERT INTO `gen_table_column`
VALUES (10, 1, 'order_status', '订单状态【0->待付款；1->待发货；2->已发货；3->待用户收货，已完成；-1->已取消】', 'tinyint(4)',
        'Integer', 'orderStatus', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'radio', '', 10, 'admin',
        '2024-02-22 08:55:08', '', NULL);
INSERT INTO `gen_table_column`
VALUES (11, 1, 'receiver_name', '收货人姓名', 'varchar(100)', 'String', 'receiverName', '0', '0', NULL, '1', '1', '1',
        '1', 'LIKE', 'input', '', 11, 'admin', '2024-02-22 08:55:08', '', NULL);
INSERT INTO `gen_table_column`
VALUES (12, 1, 'receiver_phone', '收货人电话', 'varchar(32)', 'String', 'receiverPhone', '0', '0', NULL, '1', '1', '1',
        '1', 'EQ', 'input', '', 12, 'admin', '2024-02-22 08:55:08', '', NULL);
INSERT INTO `gen_table_column`
VALUES (13, 1, 'receiver_tag_name', '收货人地址标签', 'varchar(32)', 'String', 'receiverTagName', '0', '0', NULL, '1',
        '1', '1', '1', 'LIKE', 'input', '', 13, 'admin', '2024-02-22 08:55:08', '', NULL);
INSERT INTO `gen_table_column`
VALUES (14, 1, 'receiver_province', '省份/直辖市', 'varchar(10)', 'String', 'receiverProvince', '0', '0', NULL, '1',
        '1', '1', '1', 'EQ', 'input', '', 14, 'admin', '2024-02-22 08:55:08', '', NULL);
INSERT INTO `gen_table_column`
VALUES (15, 1, 'receiver_city', '城市', 'varchar(10)', 'String', 'receiverCity', '0', '0', NULL, '1', '1', '1', '1',
        'EQ', 'input', '', 15, 'admin', '2024-02-22 08:55:09', '', NULL);
INSERT INTO `gen_table_column`
VALUES (16, 1, 'receiver_district', '区', 'varchar(10)', 'String', 'receiverDistrict', '0', '0', NULL, '1', '1', '1',
        '1', 'EQ', 'input', '', 16, 'admin', '2024-02-22 08:55:09', '', NULL);
INSERT INTO `gen_table_column`
VALUES (17, 1, 'receiver_address', '详细地址', 'varchar(200)', 'String', 'receiverAddress', '0', '0', NULL, '1', '1',
        '1', '1', 'EQ', 'input', '', 17, 'admin', '2024-02-22 08:55:09', '', NULL);
INSERT INTO `gen_table_column`
VALUES (18, 1, 'payment_time', '支付时间', 'datetime', 'Date', 'paymentTime', '0', '0', NULL, '1', '1', '1', '1', 'EQ',
        'datetime', '', 18, 'admin', '2024-02-22 08:55:09', '', NULL);
INSERT INTO `gen_table_column`
VALUES (19, 1, 'delivery_time', '发货时间', 'datetime', 'Date', 'deliveryTime', '0', '0', NULL, '1', '1', '1', '1',
        'EQ', 'datetime', '', 19, 'admin', '2024-02-22 08:55:09', '', NULL);
INSERT INTO `gen_table_column`
VALUES (20, 1, 'receive_time', '确认收货时间', 'datetime', 'Date', 'receiveTime', '0', '0', NULL, '1', '1', '1', '1',
        'EQ', 'datetime', '', 20, 'admin', '2024-02-22 08:55:09', '', NULL);
INSERT INTO `gen_table_column`
VALUES (21, 1, 'cancel_time', '取消订单时间', 'datetime', 'Date', 'cancelTime', '0', '0', NULL, '1', '1', '1', '1',
        'EQ', 'datetime', '', 21, 'admin', '2024-02-22 08:55:09', '', NULL);
INSERT INTO `gen_table_column`
VALUES (22, 1, 'cancel_reason', '取消订单原因', 'varchar(255)', 'String', 'cancelReason', '0', '0', NULL, '1', '1', '1',
        '1', 'EQ', 'input', '', 22, 'admin', '2024-02-22 08:55:09', '', NULL);
INSERT INTO `gen_table_column`
VALUES (23, 1, 'create_time', '创建时间', 'timestamp', 'Date', 'createTime', '0', '0', '1', '1', NULL, NULL, NULL, 'EQ',
        'datetime', '', 23, 'admin', '2024-02-22 08:55:09', '', NULL);
INSERT INTO `gen_table_column`
VALUES (24, 1, 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ',
        'input', '', 24, 'admin', '2024-02-22 08:55:09', '', NULL);
INSERT INTO `gen_table_column`
VALUES (25, 1, 'update_time', '更新时间', 'timestamp', 'Date', 'updateTime', '0', '0', '1', '1', '1', NULL, NULL, 'EQ',
        'datetime', '', 25, 'admin', '2024-02-22 08:55:09', '', NULL);
INSERT INTO `gen_table_column`
VALUES (26, 1, 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ',
        'input', '', 26, 'admin', '2024-02-22 08:55:09', '', NULL);
INSERT INTO `gen_table_column`
VALUES (27, 1, 'del_flag', '删除标志（0代表存在 2代表删除）', 'char(1)', 'String', 'delFlag', '0', '0', '1', '1', NULL,
        NULL, NULL, 'EQ', 'input', '', 27, 'admin', '2024-02-22 08:55:10', '', NULL);
INSERT INTO `gen_table_column`
VALUES (28, 1, 'remark', '订单备注', 'varchar(500)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ',
        'textarea', '', 28, 'admin', '2024-02-22 08:55:10', '', NULL);
INSERT INTO `gen_table_column`
VALUES (29, 2, 'id', 'id', 'bigint(20)', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1,
        'admin', '2024-02-22 08:55:10', '', NULL);
INSERT INTO `gen_table_column`
VALUES (30, 2, 'order_id', 'order_id', 'bigint(20)', 'Long', 'orderId', '0', '0', NULL, '1', '1', '1', '1', 'EQ',
        'input', '', 2, 'admin', '2024-02-22 08:55:10', '', NULL);
INSERT INTO `gen_table_column`
VALUES (31, 2, 'sku_id', '商品sku编号', 'bigint(20)', 'Long', 'skuId', '0', '0', NULL, '1', '1', '1', '1', 'EQ',
        'input', '', 3, 'admin', '2024-02-22 08:55:10', '', NULL);
INSERT INTO `gen_table_column`
VALUES (32, 2, 'sku_name', '商品sku名字', 'varchar(255)', 'String', 'skuName', '0', '0', NULL, '1', '1', '1', '1',
        'LIKE', 'input', '', 4, 'admin', '2024-02-22 08:55:10', '', NULL);
INSERT INTO `gen_table_column`
VALUES (33, 2, 'thumb_img', '商品sku图片', 'varchar(500)', 'String', 'thumbImg', '0', '0', NULL, '1', '1', '1', '1',
        'EQ', 'textarea', '', 5, 'admin', '2024-02-22 08:55:10', '', NULL);
INSERT INTO `gen_table_column`
VALUES (34, 2, 'sku_price', '商品sku价格', 'decimal(10,2)', 'BigDecimal', 'skuPrice', '0', '0', NULL, '1', '1', '1',
        '1', 'EQ', 'input', '', 6, 'admin', '2024-02-22 08:55:10', '', NULL);
INSERT INTO `gen_table_column`
VALUES (35, 2, 'sku_num', '商品购买的数量', 'int(11)', 'Long', 'skuNum', '0', '0', NULL, '1', '1', '1', '1', 'EQ',
        'input', '', 7, 'admin', '2024-02-22 08:55:10', '', NULL);
INSERT INTO `gen_table_column`
VALUES (36, 2, 'create_time', '创建时间', 'timestamp', 'Date', 'createTime', '0', '0', '1', '1', NULL, NULL, NULL, 'EQ',
        'datetime', '', 8, 'admin', '2024-02-22 08:55:10', '', NULL);
INSERT INTO `gen_table_column`
VALUES (37, 2, 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ',
        'input', '', 9, 'admin', '2024-02-22 08:55:10', '', NULL);
INSERT INTO `gen_table_column`
VALUES (38, 2, 'update_time', '更新时间', 'timestamp', 'Date', 'updateTime', '0', '0', '1', '1', '1', NULL, NULL, 'EQ',
        'datetime', '', 10, 'admin', '2024-02-22 08:55:11', '', NULL);
INSERT INTO `gen_table_column`
VALUES (39, 2, 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ',
        'input', '', 11, 'admin', '2024-02-22 08:55:11', '', NULL);
INSERT INTO `gen_table_column`
VALUES (40, 2, 'del_flag', '删除标志（0代表存在 2代表删除）', 'char(1)', 'String', 'delFlag', '0', '0', '1', '1', NULL,
        NULL, NULL, 'EQ', 'input', '', 12, 'admin', '2024-02-22 08:55:11', '', NULL);
INSERT INTO `gen_table_column`
VALUES (41, 2, 'remark', '备注', 'varchar(255)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input',
        '', 13, 'admin', '2024-02-22 08:55:11', '', NULL);
INSERT INTO `gen_table_column`
VALUES (42, 3, 'id', NULL, 'bigint', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin',
        '2024-10-14 11:19:51', '', NULL);
INSERT INTO `gen_table_column`
VALUES (43, 3, 'order_id', '订单id', 'bigint', 'Long', 'orderId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '',
        2, 'admin', '2024-10-14 11:19:51', '', NULL);
INSERT INTO `gen_table_column`
VALUES (44, 3, 'operate_user', '操作人：用户；系统；后台管理员', 'varchar(100)', 'String', 'operateUser', '0', '0', NULL,
        '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2024-10-14 11:19:51', '', NULL);
INSERT INTO `gen_table_column`
VALUES (45, 3, 'process_status', '订单状态', 'int', 'Long', 'processStatus', '0', '0', NULL, '1', '1', '1', '1', 'EQ',
        'radio', '', 4, 'admin', '2024-10-14 11:19:51', '', NULL);
INSERT INTO `gen_table_column`
VALUES (46, 3, 'note', '备注', 'varchar(500)', 'String', 'note', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'textarea',
        '', 5, 'admin', '2024-10-14 11:19:51', '', NULL);
INSERT INTO `gen_table_column`
VALUES (47, 3, 'create_time', '创建时间', 'timestamp', 'Date', 'createTime', '0', '0', '1', '1', NULL, NULL, NULL, 'EQ',
        'datetime', '', 6, 'admin', '2024-10-14 11:19:51', '', NULL);
INSERT INTO `gen_table_column`
VALUES (48, 3, 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ',
        'input', '', 7, 'admin', '2024-10-14 11:19:51', '', NULL);
INSERT INTO `gen_table_column`
VALUES (49, 3, 'update_time', '更新时间', 'timestamp', 'Date', 'updateTime', '0', '0', '1', '1', '1', NULL, NULL, 'EQ',
        'datetime', '', 8, 'admin', '2024-10-14 11:19:51', '', NULL);
INSERT INTO `gen_table_column`
VALUES (50, 3, 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ',
        'input', '', 9, 'admin', '2024-10-14 11:19:51', '', NULL);
INSERT INTO `gen_table_column`
VALUES (51, 3, 'del_flag', '删除标志（0代表存在 2代表删除）', 'char(1)', 'String', 'delFlag', '0', '0', '1', '1', NULL,
        NULL, NULL, 'EQ', 'input', '', 10, 'admin', '2024-10-14 11:19:51', '', NULL);
INSERT INTO `gen_table_column`
VALUES (52, 3, 'remark', '备注', 'varchar(255)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input',
        '', 11, 'admin', '2024-10-14 11:19:51', '', NULL);

-- ----------------------------
-- Table structure for order_info
-- ----------------------------
DROP TABLE IF EXISTS `order_info`;
CREATE TABLE `order_info`
(
    `id`                    bigint                                                        NOT NULL AUTO_INCREMENT COMMENT 'id',
    `user_id`               bigint                                                        NOT NULL DEFAULT 0 COMMENT '会员_id',
    `nick_name`             varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL     DEFAULT NULL COMMENT '昵称',
    `order_no`              char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci     NOT NULL DEFAULT '' COMMENT '订单号',
    `coupon_id`             bigint                                                        NULL     DEFAULT NULL COMMENT '使用的优惠券',
    `total_amount`          decimal(10, 2)                                                NOT NULL DEFAULT 0.00 COMMENT '订单总额',
    `coupon_amount`         decimal(10, 2)                                                NOT NULL DEFAULT 0.00 COMMENT '优惠券',
    `original_total_amount` decimal(10, 2)                                                NOT NULL DEFAULT 0.00 COMMENT '原价金额',
    `feight_fee`            decimal(10, 2)                                                NOT NULL DEFAULT 0.00 COMMENT '运费',
    `order_status`          tinyint                                                       NOT NULL DEFAULT 0 COMMENT '订单状态【0->待付款；1->待发货；2->已发货；3->待用户收货，已完成；-1->已取消】',
    `receiver_name`         varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL     DEFAULT NULL COMMENT '收货人姓名',
    `receiver_phone`        varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NULL     DEFAULT NULL COMMENT '收货人电话',
    `receiver_tag_name`     varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NULL     DEFAULT NULL COMMENT '收货人地址标签',
    `receiver_province`     varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NULL     DEFAULT NULL COMMENT '省份/直辖市',
    `receiver_city`         varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NULL     DEFAULT NULL COMMENT '城市',
    `receiver_district`     varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NULL     DEFAULT NULL COMMENT '区',
    `receiver_address`      varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL     DEFAULT NULL COMMENT '详细地址',
    `payment_time`          datetime                                                      NULL     DEFAULT NULL COMMENT '支付时间',
    `delivery_time`         datetime                                                      NULL     DEFAULT NULL COMMENT '发货时间',
    `receive_time`          datetime                                                      NULL     DEFAULT NULL COMMENT '确认收货时间',
    `cancel_time`           datetime                                                      NULL     DEFAULT NULL COMMENT '取消订单时间',
    `cancel_reason`         varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL     DEFAULT NULL COMMENT '取消订单原因',
    `create_time`           timestamp                                                     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `create_by`             varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NULL     DEFAULT NULL COMMENT '创建者',
    `update_time`           timestamp                                                     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `update_by`             varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NULL     DEFAULT NULL COMMENT '更新者',
    `del_flag`              char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci      NOT NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
    `remark`                varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL     DEFAULT NULL COMMENT '订单备注',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 16
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci COMMENT = '订单'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_info
-- ----------------------------
INSERT INTO `order_info`
VALUES (1, 1, '13700032456', 'e9e4e8f2d92d49888e5d5a18df3f18df', NULL, 8998.00, 0.00, 8998.00, 0.00, 0, '晴天',
        '15023656352', '家', '110000', '110100', '110101', '北京市北京市东城区东直门1号', NULL, NULL, NULL, NULL, NULL,
        '2024-02-27 19:00:44', NULL, '2024-02-27 19:00:44', NULL, '0', NULL);
INSERT INTO `order_info`
VALUES (2, 1, '13700032456', 'f1866bad38bc4627958542d72a15ca9c', NULL, 9997.00, 0.00, 9997.00, 0.00, 0, '晴天',
        '15023656352', '家', '110000', '110100', '110101', '北京市北京市东城区东直门1号', NULL, NULL, NULL, NULL, NULL,
        '2024-02-28 16:29:36', NULL, '2024-02-28 16:29:36', NULL, '0', NULL);
INSERT INTO `order_info`
VALUES (3, 1, '13700032456', 'debcf15eccef4f96908c4d2aa053ac38', NULL, 3278.00, 0.00, 3278.00, 0.00, 0, '晴天',
        '15023656352', '家', '110000', '110100', '110101', '北京市北京市东城区东直门1号', NULL, NULL, NULL,
        '2024-10-15 17:08:15', '未支付自动取消', '2024-10-14 15:37:26', NULL, '2024-11-05 21:03:31', NULL, '0', '');

-- ----------------------------
-- Table structure for order_item
-- ----------------------------
DROP TABLE IF EXISTS `order_item`;
CREATE TABLE `order_item`
(
    `id`          bigint                                                        NOT NULL AUTO_INCREMENT COMMENT 'id',
    `order_id`    bigint                                                        NULL     DEFAULT NULL COMMENT 'order_id',
    `sku_id`      bigint                                                        NULL     DEFAULT NULL COMMENT '商品sku编号',
    `sku_name`    varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL     DEFAULT NULL COMMENT '商品sku名字',
    `thumb_img`   varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL     DEFAULT NULL COMMENT '商品sku图片',
    `sku_price`   decimal(10, 2)                                                NULL     DEFAULT NULL COMMENT '商品sku价格',
    `sku_num`     int                                                           NULL     DEFAULT NULL COMMENT '商品购买的数量',
    `create_time` timestamp                                                     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `create_by`   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NULL     DEFAULT NULL COMMENT '创建者',
    `update_time` timestamp                                                     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `update_by`   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NULL     DEFAULT NULL COMMENT '更新者',
    `del_flag`    char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci      NOT NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
    `remark`      varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL     DEFAULT NULL COMMENT '备注',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 19
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci COMMENT = '订单项信息'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_item
-- ----------------------------
INSERT INTO `order_item`
VALUES (1, 1, 9, '华为笔记本 32G', 'http://139.198.127.41:9000/spzx/20230525/c8f2eae0d36b6270.jpg.avif', 5999.00, 1,
        '2024-02-27 00:30:28', NULL, '2024-02-27 00:30:28', NULL, '0', NULL);
INSERT INTO `order_item`
VALUES (2, 1, 4, '小米 红米Note10 5G手机 红色 + 18G',
        'http://139.198.127.41:9000/spzx/20230525/665832167-5_u_1%20(1).jpg', 2999.00, 1, '2024-02-27 00:30:25', NULL,
        '2024-02-27 00:30:25', NULL, '0', NULL);
INSERT INTO `order_item`
VALUES (3, 2, 5, '小米 红米Note10 5G手机 黑色 + 8G', 'http://139.198.127.41:9000/spzx/20230525/665832167-1_u_1.jpg',
        1999.00, 1, '2024-02-28 16:27:41', NULL, '2024-02-28 16:27:41', NULL, '0', NULL);
INSERT INTO `order_item`
VALUES (4, 2, 7, '华为笔记本 8G', 'http://139.198.127.41:9000/spzx/20230525/4b5a68a9bfbd0795.jpg.avif', 3999.00, 2,
        '2024-02-28 16:27:48', NULL, '2024-02-28 16:27:48', NULL, '0', NULL);
INSERT INTO `order_item`
VALUES (5, 3, 1, '小米 红米Note10 5G手机 白色 + 8G', 'http://139.198.127.41:9000/spzx/20230525/665832167-5_u_1.jpg',
        96.00, 3, '2024-10-13 14:52:42', NULL, '2024-10-14 15:35:18', NULL, '0', NULL);
INSERT INTO `order_item`
VALUES (6, 3, 2, '小米 红米Note10 5G手机 白色 + 18G', 'http://139.198.127.41:9000/spzx/20230525/665832167-6_u_1.jpg',
        2990.00, 1, '2024-10-13 14:58:08', NULL, '2024-10-14 15:35:18', NULL, '0', NULL);

-- ----------------------------
-- Table structure for order_log
-- ----------------------------
DROP TABLE IF EXISTS `order_log`;
CREATE TABLE `order_log`
(
    `id`             bigint                                                        NOT NULL AUTO_INCREMENT,
    `order_id`       bigint                                                        NULL     DEFAULT NULL COMMENT '订单id',
    `operate_user`   varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL     DEFAULT NULL COMMENT '操作人：用户；系统；后台管理员',
    `process_status` int                                                           NULL     DEFAULT NULL COMMENT '订单状态',
    `note`           varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL     DEFAULT NULL COMMENT '备注',
    `create_time`    timestamp                                                     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `create_by`      varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NULL     DEFAULT NULL COMMENT '创建者',
    `update_time`    timestamp                                                     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `update_by`      varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NULL     DEFAULT NULL COMMENT '更新者',
    `del_flag`       char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci      NOT NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
    `remark`         varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL     DEFAULT NULL COMMENT '备注',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 23
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci COMMENT = '订单操作日志记录'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_log
-- ----------------------------
INSERT INTO `order_log`
VALUES (1, 1, '用户', 0, '提交订单', '2024-02-27 19:00:44', NULL, '2024-11-05 21:02:00', NULL, '0', NULL);
INSERT INTO `order_log`
VALUES (2, 2, '用户', 0, '提交订单', '2024-02-28 16:29:36', NULL, '2024-11-05 21:02:00', NULL, '0', NULL);
INSERT INTO `order_log`
VALUES (3, 3, '用户', -1, '系统取消订单', '2024-10-14 15:37:26', NULL, '2024-10-15 17:08:15', NULL, '0', NULL);

SET FOREIGN_KEY_CHECKS = 1;
