/*
 Navicat Premium Data Transfer

 Source Server         : 192.168.6.100_spzx_3306
 Source Server Type    : MySQL
 Source Server Version : 80030
 Source Host           : 192.168.6.100:3306
 Source Schema         : spzx-system

 Target Server Type    : MySQL
 Target Server Version : 80030
 File Encoding         : 65001

 Date: 06/11/2024 11:53:47
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- 切库
use `spzx-system`;

-- ----------------------------
-- Table structure for QRTZ_BLOB_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_BLOB_TRIGGERS`;
CREATE TABLE `QRTZ_BLOB_TRIGGERS`
(
    `sched_name`    varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
    `trigger_name`  varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
    `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
    `blob_data`     blob                                                          NULL COMMENT '存放持久化Trigger对象',
    PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
    CONSTRAINT `QRTZ_BLOB_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = 'Blob类型的触发器表'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_BLOB_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_CALENDARS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_CALENDARS`;
CREATE TABLE `QRTZ_CALENDARS`
(
    `sched_name`    varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
    `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '日历名称',
    `calendar`      blob                                                          NOT NULL COMMENT '存放持久化calendar对象',
    PRIMARY KEY (`sched_name`, `calendar_name`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '日历信息表'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_CALENDARS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_CRON_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_CRON_TRIGGERS`;
CREATE TABLE `QRTZ_CRON_TRIGGERS`
(
    `sched_name`      varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
    `trigger_name`    varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
    `trigger_group`   varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
    `cron_expression` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'cron表达式',
    `time_zone_id`    varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '时区',
    PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
    CONSTRAINT `QRTZ_CRON_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = 'Cron类型的触发器表'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_CRON_TRIGGERS
-- ----------------------------
INSERT INTO `QRTZ_CRON_TRIGGERS`
VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', '0/10 * * * * ?', 'Asia/Shanghai');
INSERT INTO `QRTZ_CRON_TRIGGERS`
VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', '0/15 * * * * ?', 'Asia/Shanghai');
INSERT INTO `QRTZ_CRON_TRIGGERS`
VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', '0/20 * * * * ?', 'Asia/Shanghai');

-- ----------------------------
-- Table structure for QRTZ_FIRED_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_FIRED_TRIGGERS`;
CREATE TABLE `QRTZ_FIRED_TRIGGERS`
(
    `sched_name`        varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
    `entry_id`          varchar(95) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL COMMENT '调度器实例id',
    `trigger_name`      varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
    `trigger_group`     varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
    `instance_name`     varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度器实例名',
    `fired_time`        bigint                                                        NOT NULL COMMENT '触发的时间',
    `sched_time`        bigint                                                        NOT NULL COMMENT '定时器制定的时间',
    `priority`          int                                                           NOT NULL COMMENT '优先级',
    `state`             varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL COMMENT '状态',
    `job_name`          varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '任务名称',
    `job_group`         varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '任务组名',
    `is_nonconcurrent`  varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci   NULL DEFAULT NULL COMMENT '是否并发',
    `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci   NULL DEFAULT NULL COMMENT '是否接受恢复执行',
    PRIMARY KEY (`sched_name`, `entry_id`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '已触发的触发器表'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_FIRED_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_JOB_DETAILS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_JOB_DETAILS`;
CREATE TABLE `QRTZ_JOB_DETAILS`
(
    `sched_name`        varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
    `job_name`          varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务名称',
    `job_group`         varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务组名',
    `description`       varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '相关介绍',
    `job_class_name`    varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '执行任务类名称',
    `is_durable`        varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci   NOT NULL COMMENT '是否持久化',
    `is_nonconcurrent`  varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci   NOT NULL COMMENT '是否并发',
    `is_update_data`    varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci   NOT NULL COMMENT '是否更新数据',
    `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci   NOT NULL COMMENT '是否接受恢复执行',
    `job_data`          blob                                                          NULL COMMENT '存放持久化job对象',
    PRIMARY KEY (`sched_name`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '任务详细信息表'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_JOB_DETAILS
-- ----------------------------
INSERT INTO `QRTZ_JOB_DETAILS`
VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', NULL, 'com.spzx.job.util.QuartzDisallowConcurrentExecution',
        '0', '1', '0', '0',
        0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001A636F6D2E73707A782E6A6F622E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E00097872002A636F6D2E73707A782E636F6D6D6F6E2E636F72652E7765622E646F6D61696E2E42617365456E7469747900000000000000010200094C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C000764656C466C616771007E00094C0002696471007E000A4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B5974190300007870770800000192025EB088787070707400007070707400013174000E302F3130202A202A202A202A203F74001172795461736B2E72794E6F506172616D7374000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000001740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E697A0E58F82EFBC8974000133740001317800);
INSERT INTO `QRTZ_JOB_DETAILS`
VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', NULL, 'com.spzx.job.util.QuartzDisallowConcurrentExecution',
        '0', '1', '0', '0',
        0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001A636F6D2E73707A782E6A6F622E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E00097872002A636F6D2E73707A782E636F6D6D6F6E2E636F72652E7765622E646F6D61696E2E42617365456E7469747900000000000000010200094C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C000764656C466C616771007E00094C0002696471007E000A4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B5974190300007870770800000192025EB088787070707400007070707400013174000E302F3135202A202A202A202A203F74001572795461736B2E7279506172616D7328277279272974000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000002740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E69C89E58F82EFBC8974000133740001317800);
INSERT INTO `QRTZ_JOB_DETAILS`
VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', NULL, 'com.spzx.job.util.QuartzDisallowConcurrentExecution',
        '0', '1', '0', '0',
        0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001A636F6D2E73707A782E6A6F622E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E00097872002A636F6D2E73707A782E636F6D6D6F6E2E636F72652E7765622E646F6D61696E2E42617365456E7469747900000000000000010200094C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C000764656C466C616771007E00094C0002696471007E000A4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B5974190300007870770800000192025EB088787070707400007070707400013174000E302F3230202A202A202A202A203F74003872795461736B2E72794D756C7469706C65506172616D7328277279272C20747275652C20323030304C2C203331362E3530442C203130302974000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000003740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E5A49AE58F82EFBC8974000133740001317800);

-- ----------------------------
-- Table structure for QRTZ_LOCKS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_LOCKS`;
CREATE TABLE `QRTZ_LOCKS`
(
    `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
    `lock_name`  varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL COMMENT '悲观锁名称',
    PRIMARY KEY (`sched_name`, `lock_name`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '存储的悲观锁信息表'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_LOCKS
-- ----------------------------
INSERT INTO `QRTZ_LOCKS`
VALUES ('RuoyiScheduler', 'STATE_ACCESS');
INSERT INTO `QRTZ_LOCKS`
VALUES ('RuoyiScheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for QRTZ_PAUSED_TRIGGER_GRPS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_PAUSED_TRIGGER_GRPS`;
CREATE TABLE `QRTZ_PAUSED_TRIGGER_GRPS`
(
    `sched_name`    varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
    `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
    PRIMARY KEY (`sched_name`, `trigger_group`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '暂停的触发器表'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_PAUSED_TRIGGER_GRPS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_SCHEDULER_STATE
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SCHEDULER_STATE`;
CREATE TABLE `QRTZ_SCHEDULER_STATE`
(
    `sched_name`        varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
    `instance_name`     varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '实例名称',
    `last_checkin_time` bigint                                                        NOT NULL COMMENT '上次检查时间',
    `checkin_interval`  bigint                                                        NOT NULL COMMENT '检查间隔时间',
    PRIMARY KEY (`sched_name`, `instance_name`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '调度器状态表'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_SCHEDULER_STATE
-- ----------------------------
INSERT INTO `QRTZ_SCHEDULER_STATE`
VALUES ('RuoyiScheduler', 'atguigu1730852853592', 1730865215309, 15000);

-- ----------------------------
-- Table structure for QRTZ_SIMPLE_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SIMPLE_TRIGGERS`;
CREATE TABLE `QRTZ_SIMPLE_TRIGGERS`
(
    `sched_name`      varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
    `trigger_name`    varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
    `trigger_group`   varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
    `repeat_count`    bigint                                                        NOT NULL COMMENT '重复的次数统计',
    `repeat_interval` bigint                                                        NOT NULL COMMENT '重复的间隔时间',
    `times_triggered` bigint                                                        NOT NULL COMMENT '已经触发的次数',
    PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
    CONSTRAINT `QRTZ_SIMPLE_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '简单触发器的信息表'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_SIMPLE_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_SIMPROP_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SIMPROP_TRIGGERS`;
CREATE TABLE `QRTZ_SIMPROP_TRIGGERS`
(
    `sched_name`    varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
    `trigger_name`  varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
    `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
    `str_prop_1`    varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第一个参数',
    `str_prop_2`    varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第二个参数',
    `str_prop_3`    varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第三个参数',
    `int_prop_1`    int                                                           NULL DEFAULT NULL COMMENT 'int类型的trigger的第一个参数',
    `int_prop_2`    int                                                           NULL DEFAULT NULL COMMENT 'int类型的trigger的第二个参数',
    `long_prop_1`   bigint                                                        NULL DEFAULT NULL COMMENT 'long类型的trigger的第一个参数',
    `long_prop_2`   bigint                                                        NULL DEFAULT NULL COMMENT 'long类型的trigger的第二个参数',
    `dec_prop_1`    decimal(13, 4)                                                NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第一个参数',
    `dec_prop_2`    decimal(13, 4)                                                NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第二个参数',
    `bool_prop_1`   varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci   NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第一个参数',
    `bool_prop_2`   varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci   NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第二个参数',
    PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
    CONSTRAINT `QRTZ_SIMPROP_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '同步机制的行锁表'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_SIMPROP_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_TRIGGERS`;
CREATE TABLE `QRTZ_TRIGGERS`
(
    `sched_name`     varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
    `trigger_name`   varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '触发器的名字',
    `trigger_group`  varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '触发器所属组的名字',
    `job_name`       varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_job_details表job_name的外键',
    `job_group`      varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_job_details表job_group的外键',
    `description`    varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '相关介绍',
    `next_fire_time` bigint                                                        NULL DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
    `prev_fire_time` bigint                                                        NULL DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
    `priority`       int                                                           NULL DEFAULT NULL COMMENT '优先级',
    `trigger_state`  varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL COMMENT '触发器状态',
    `trigger_type`   varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci   NOT NULL COMMENT '触发器的类型',
    `start_time`     bigint                                                        NOT NULL COMMENT '开始时间',
    `end_time`       bigint                                                        NULL DEFAULT NULL COMMENT '结束时间',
    `calendar_name`  varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '日程表名称',
    `misfire_instr`  smallint                                                      NULL DEFAULT NULL COMMENT '补偿执行的策略',
    `job_data`       blob                                                          NULL COMMENT '存放持久化job对象',
    PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
    INDEX `sched_name` (`sched_name` ASC, `job_name` ASC, `job_group` ASC) USING BTREE,
    CONSTRAINT `QRTZ_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `QRTZ_JOB_DETAILS` (`sched_name`, `job_name`, `job_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '触发器详细信息表'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_TRIGGERS
-- ----------------------------
INSERT INTO `QRTZ_TRIGGERS`
VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', 'TASK_CLASS_NAME1', 'DEFAULT', NULL, 1730852860000, -1, 5,
        'PAUSED', 'CRON', 1730852855000, 0, NULL, 2, '');
INSERT INTO `QRTZ_TRIGGERS`
VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', 'TASK_CLASS_NAME2', 'DEFAULT', NULL, 1730852865000, -1, 5,
        'PAUSED', 'CRON', 1730852855000, 0, NULL, 2, '');
INSERT INTO `QRTZ_TRIGGERS`
VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', 'TASK_CLASS_NAME3', 'DEFAULT', NULL, 1730852860000, -1, 5,
        'PAUSED', 'CRON', 1730852855000, 0, NULL, 2, '');

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`
(
    `table_id`          bigint                                                         NOT NULL AUTO_INCREMENT COMMENT '编号',
    `table_name`        varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT '' COMMENT '表名称',
    `table_comment`     varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT '' COMMENT '表描述',
    `sub_table_name`    varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci   NULL DEFAULT NULL COMMENT '关联子表的表名',
    `sub_table_fk_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci   NULL DEFAULT NULL COMMENT '子表关联的外键名',
    `class_name`        varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT '' COMMENT '实体类名称',
    `tpl_category`      varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
    `tpl_web_type`      varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci   NULL DEFAULT '' COMMENT '前端模板类型（element-ui模版 element-plus模版）',
    `package_name`      varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '生成包路径',
    `module_name`       varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci   NULL DEFAULT NULL COMMENT '生成模块名',
    `business_name`     varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci   NULL DEFAULT NULL COMMENT '生成业务名',
    `function_name`     varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci   NULL DEFAULT NULL COMMENT '生成功能名',
    `function_author`   varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci   NULL DEFAULT NULL COMMENT '生成功能作者',
    `gen_type`          char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci       NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
    `gen_path`          varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
    `options`           varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '其它生成选项',
    `create_by`         varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci   NULL DEFAULT '' COMMENT '创建者',
    `create_time`       datetime                                                       NULL DEFAULT NULL COMMENT '创建时间',
    `update_by`         varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci   NULL DEFAULT '' COMMENT '更新者',
    `update_time`       datetime                                                       NULL DEFAULT NULL COMMENT '更新时间',
    `remark`            varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '备注',
    PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '代码生成业务表'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table
-- ----------------------------

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`
(
    `column_id`      bigint                                                        NOT NULL AUTO_INCREMENT COMMENT '编号',
    `table_id`       bigint                                                        NULL DEFAULT NULL COMMENT '归属表编号',
    `column_name`    varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '列名称',
    `column_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '列描述',
    `column_type`    varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '列类型',
    `java_type`      varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
    `java_field`     varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
    `is_pk`          char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci      NULL DEFAULT NULL COMMENT '是否主键（1是）',
    `is_increment`   char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci      NULL DEFAULT NULL COMMENT '是否自增（1是）',
    `is_required`    char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci      NULL DEFAULT NULL COMMENT '是否必填（1是）',
    `is_insert`      char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci      NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
    `is_edit`        char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci      NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
    `is_list`        char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci      NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
    `is_query`       char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci      NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
    `query_type`     varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
    `html_type`      varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
    `dict_type`      varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典类型',
    `sort`           int                                                           NULL DEFAULT NULL COMMENT '排序',
    `create_by`      varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT '' COMMENT '创建者',
    `create_time`    datetime                                                      NULL DEFAULT NULL COMMENT '创建时间',
    `update_by`      varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT '' COMMENT '更新者',
    `update_time`    datetime                                                      NULL DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '代码生成业务表字段'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`
(
    `config_id`    int                                                           NOT NULL AUTO_INCREMENT COMMENT '参数主键',
    `config_name`  varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '参数名称',
    `config_key`   varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '参数键名',
    `config_value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '参数键值',
    `config_type`  char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci      NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
    `create_by`    varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT '' COMMENT '创建者',
    `create_time`  datetime                                                      NULL DEFAULT NULL COMMENT '创建时间',
    `update_by`    varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT '' COMMENT '更新者',
    `update_time`  datetime                                                      NULL DEFAULT NULL COMMENT '更新时间',
    `remark`       varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
    PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 100
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '参数配置表'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config`
VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2024-09-18 07:43:33', '',
        NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config`
VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2024-09-18 07:43:33', '', NULL,
        '初始化密码 123456');
INSERT INTO `sys_config`
VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2024-09-18 07:43:33', '', NULL,
        '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config`
VALUES (4, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2024-09-18 07:43:33',
        '', NULL, '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config`
VALUES (5, '用户登录-黑名单列表', 'sys.login.blackIPList', '', 'Y', 'admin', '2024-09-18 07:43:33', '', NULL,
        '设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`
(
    `dept_id`     bigint                                                       NOT NULL AUTO_INCREMENT COMMENT '部门id',
    `parent_id`   bigint                                                       NULL DEFAULT 0 COMMENT '父部门id',
    `ancestors`   varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '祖级列表',
    `dept_name`   varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '部门名称',
    `order_num`   int                                                          NULL DEFAULT 0 COMMENT '显示顺序',
    `leader`      varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '负责人',
    `phone`       varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系电话',
    `email`       varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱',
    `status`      char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci     NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
    `del_flag`    char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci     NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
    `create_by`   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
    `create_time` datetime                                                     NULL DEFAULT NULL COMMENT '创建时间',
    `update_by`   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
    `update_time` datetime                                                     NULL DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 200
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '部门表'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept`
VALUES (100, 0, '0', '若依科技', 0, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-09-18 07:43:32', '',
        NULL);
INSERT INTO `sys_dept`
VALUES (101, 100, '0,100', '深圳总公司', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin',
        '2024-09-18 07:43:32', '', NULL);
INSERT INTO `sys_dept`
VALUES (102, 100, '0,100', '长沙分公司', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin',
        '2024-09-18 07:43:32', '', NULL);
INSERT INTO `sys_dept`
VALUES (103, 101, '0,100,101', '研发部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin',
        '2024-09-18 07:43:32', '', NULL);
INSERT INTO `sys_dept`
VALUES (104, 101, '0,100,101', '市场部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin',
        '2024-09-18 07:43:32', '', NULL);
INSERT INTO `sys_dept`
VALUES (105, 101, '0,100,101', '测试部门', 3, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin',
        '2024-09-18 07:43:32', '', NULL);
INSERT INTO `sys_dept`
VALUES (106, 101, '0,100,101', '财务部门', 4, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin',
        '2024-09-18 07:43:32', '', NULL);
INSERT INTO `sys_dept`
VALUES (107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin',
        '2024-09-18 07:43:32', '', NULL);
INSERT INTO `sys_dept`
VALUES (108, 102, '0,100,102', '市场部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin',
        '2024-09-18 07:43:32', '', NULL);
INSERT INTO `sys_dept`
VALUES (109, 102, '0,100,102', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin',
        '2024-09-18 07:43:32', '', NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`
(
    `dict_code`   bigint                                                        NOT NULL AUTO_INCREMENT COMMENT '字典编码',
    `dict_sort`   int                                                           NULL DEFAULT 0 COMMENT '字典排序',
    `dict_label`  varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典标签',
    `dict_value`  varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典键值',
    `dict_type`   varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典类型',
    `css_class`   varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
    `list_class`  varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '表格回显样式',
    `is_default`  char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci      NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
    `status`      char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci      NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
    `create_by`   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT '' COMMENT '创建者',
    `create_time` datetime                                                      NULL DEFAULT NULL COMMENT '创建时间',
    `update_by`   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT '' COMMENT '更新者',
    `update_time` datetime                                                      NULL DEFAULT NULL COMMENT '更新时间',
    `remark`      varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
    PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 100
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '字典数据表'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data`
VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2024-09-18 07:43:33', '', NULL, '性别男');
INSERT INTO `sys_dict_data`
VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2024-09-18 07:43:33', '', NULL, '性别女');
INSERT INTO `sys_dict_data`
VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2024-09-18 07:43:33', '', NULL, '性别未知');
INSERT INTO `sys_dict_data`
VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2024-09-18 07:43:33', '', NULL,
        '显示菜单');
INSERT INTO `sys_dict_data`
VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2024-09-18 07:43:33', '', NULL,
        '隐藏菜单');
INSERT INTO `sys_dict_data`
VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2024-09-18 07:43:33', '', NULL,
        '正常状态');
INSERT INTO `sys_dict_data`
VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2024-09-18 07:43:33', '', NULL,
        '停用状态');
INSERT INTO `sys_dict_data`
VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2024-09-18 07:43:33', '', NULL,
        '正常状态');
INSERT INTO `sys_dict_data`
VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2024-09-18 07:43:33', '', NULL,
        '停用状态');
INSERT INTO `sys_dict_data`
VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2024-09-18 07:43:33', '', NULL,
        '默认分组');
INSERT INTO `sys_dict_data`
VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2024-09-18 07:43:33', '', NULL,
        '系统分组');
INSERT INTO `sys_dict_data`
VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2024-09-18 07:43:33', '', NULL,
        '系统默认是');
INSERT INTO `sys_dict_data`
VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2024-09-18 07:43:33', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data`
VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2024-09-18 07:43:33', '', NULL,
        '通知');
INSERT INTO `sys_dict_data`
VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2024-09-18 07:43:33', '', NULL,
        '公告');
INSERT INTO `sys_dict_data`
VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2024-09-18 07:43:33', '', NULL,
        '正常状态');
INSERT INTO `sys_dict_data`
VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2024-09-18 07:43:33', '', NULL,
        '关闭状态');
INSERT INTO `sys_dict_data`
VALUES (18, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-09-18 07:43:33', '', NULL,
        '其他操作');
INSERT INTO `sys_dict_data`
VALUES (19, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-09-18 07:43:33', '', NULL,
        '新增操作');
INSERT INTO `sys_dict_data`
VALUES (20, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-09-18 07:43:33', '', NULL,
        '修改操作');
INSERT INTO `sys_dict_data`
VALUES (21, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-09-18 07:43:33', '', NULL,
        '删除操作');
INSERT INTO `sys_dict_data`
VALUES (22, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2024-09-18 07:43:33', '', NULL,
        '授权操作');
INSERT INTO `sys_dict_data`
VALUES (23, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-09-18 07:43:33', '', NULL,
        '导出操作');
INSERT INTO `sys_dict_data`
VALUES (24, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-09-18 07:43:33', '', NULL,
        '导入操作');
INSERT INTO `sys_dict_data`
VALUES (25, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-09-18 07:43:33', '', NULL,
        '强退操作');
INSERT INTO `sys_dict_data`
VALUES (26, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-09-18 07:43:33', '', NULL,
        '生成操作');
INSERT INTO `sys_dict_data`
VALUES (27, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-09-18 07:43:33', '', NULL,
        '清空操作');
INSERT INTO `sys_dict_data`
VALUES (28, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2024-09-18 07:43:33', '', NULL,
        '正常状态');
INSERT INTO `sys_dict_data`
VALUES (29, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2024-09-18 07:43:33', '', NULL,
        '停用状态');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`
(
    `dict_id`     bigint                                                        NOT NULL AUTO_INCREMENT COMMENT '字典主键',
    `dict_name`   varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典名称',
    `dict_type`   varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典类型',
    `status`      char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci      NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
    `create_by`   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT '' COMMENT '创建者',
    `create_time` datetime                                                      NULL DEFAULT NULL COMMENT '创建时间',
    `update_by`   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT '' COMMENT '更新者',
    `update_time` datetime                                                      NULL DEFAULT NULL COMMENT '更新时间',
    `remark`      varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
    PRIMARY KEY (`dict_id`) USING BTREE,
    UNIQUE INDEX `dict_type` (`dict_type` ASC) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 100
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '字典类型表'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type`
VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2024-09-18 07:43:33', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type`
VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2024-09-18 07:43:33', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type`
VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2024-09-18 07:43:33', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type`
VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2024-09-18 07:43:33', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type`
VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2024-09-18 07:43:33', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type`
VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2024-09-18 07:43:33', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type`
VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2024-09-18 07:43:33', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type`
VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2024-09-18 07:43:33', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type`
VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2024-09-18 07:43:33', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type`
VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2024-09-18 07:43:33', '', NULL, '登录状态列表');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`
(
    `job_id`          bigint                                                        NOT NULL AUTO_INCREMENT COMMENT '任务ID',
    `job_name`        varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL DEFAULT '' COMMENT '任务名称',
    `job_group`       varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
    `invoke_target`   varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调用目标字符串',
    `cron_expression` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL     DEFAULT '' COMMENT 'cron执行表达式',
    `misfire_policy`  varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL     DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
    `concurrent`      char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci      NULL     DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
    `status`          char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci      NULL     DEFAULT '0' COMMENT '状态（0正常 1暂停）',
    `create_by`       varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL     DEFAULT '' COMMENT '创建者',
    `create_time`     datetime                                                      NULL     DEFAULT NULL COMMENT '创建时间',
    `update_by`       varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL     DEFAULT '' COMMENT '更新者',
    `update_time`     datetime                                                      NULL     DEFAULT NULL COMMENT '更新时间',
    `remark`          varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL     DEFAULT '' COMMENT '备注信息',
    PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 100
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '定时任务调度表'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job`
VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin',
        '2024-09-18 07:43:33', 'admin', '2024-09-27 16:05:13', '');
INSERT INTO `sys_job`
VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin',
        '2024-09-18 07:43:33', 'admin', '2024-09-27 16:05:09', '');
INSERT INTO `sys_job`
VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?',
        '3', '1', '1', 'admin', '2024-09-18 07:43:33', 'admin', '2024-09-27 16:05:07', '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`
(
    `job_log_id`     bigint                                                         NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
    `job_name`       varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci   NOT NULL COMMENT '任务名称',
    `job_group`      varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci   NOT NULL COMMENT '任务组名',
    `invoke_target`  varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL COMMENT '调用目标字符串',
    `job_message`    varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '日志信息',
    `status`         char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci       NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
    `exception_info` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '异常信息',
    `create_time`    datetime                                                       NULL DEFAULT NULL COMMENT '创建时间',
    PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 24
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '定时任务调度日志表'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------
INSERT INTO `sys_job_log`
VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '系统默认（无参） 总共耗时：4毫秒', '0', '',
        '2024-09-27 16:02:31');
INSERT INTO `sys_job_log`
VALUES (2, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '系统默认（无参） 总共耗时：0毫秒', '0', '',
        '2024-09-27 16:02:41');
INSERT INTO `sys_job_log`
VALUES (3, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '系统默认（无参） 总共耗时：0毫秒', '0', '',
        '2024-09-27 16:02:51');
INSERT INTO `sys_job_log`
VALUES (4, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '系统默认（无参） 总共耗时：1毫秒', '0', '',
        '2024-09-27 16:03:01');
INSERT INTO `sys_job_log`
VALUES (5, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '系统默认（无参） 总共耗时：0毫秒', '0', '',
        '2024-09-27 16:03:11');
INSERT INTO `sys_job_log`
VALUES (6, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '系统默认（无参） 总共耗时：0毫秒', '0', '',
        '2024-09-27 16:03:21');
INSERT INTO `sys_job_log`
VALUES (7, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '系统默认（无参） 总共耗时：0毫秒', '0', '',
        '2024-09-27 16:03:31');
INSERT INTO `sys_job_log`
VALUES (8, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '系统默认（无参） 总共耗时：1毫秒', '0', '',
        '2024-09-27 16:03:41');
INSERT INTO `sys_job_log`
VALUES (9, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '系统默认（无参） 总共耗时：0毫秒', '0', '',
        '2024-09-27 16:03:51');
INSERT INTO `sys_job_log`
VALUES (10, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '系统默认（无参） 总共耗时：0毫秒', '0', '',
        '2024-09-27 16:04:01');
INSERT INTO `sys_job_log`
VALUES (11, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '系统默认（有参） 总共耗时：1毫秒', '0', '',
        '2024-09-27 16:04:01');
INSERT INTO `sys_job_log`
VALUES (12, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '系统默认（无参） 总共耗时：0毫秒', '0', '',
        '2024-09-27 16:04:11');
INSERT INTO `sys_job_log`
VALUES (13, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '系统默认（有参） 总共耗时：1毫秒', '0', '',
        '2024-09-27 16:04:16');
INSERT INTO `sys_job_log`
VALUES (14, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '系统默认（无参） 总共耗时：0毫秒', '0', '',
        '2024-09-27 16:04:21');
INSERT INTO `sys_job_log`
VALUES (15, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '系统默认（无参） 总共耗时：0毫秒', '0', '',
        '2024-09-27 16:04:31');
INSERT INTO `sys_job_log`
VALUES (16, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '系统默认（有参） 总共耗时：0毫秒', '0', '',
        '2024-09-27 16:04:31');
INSERT INTO `sys_job_log`
VALUES (17, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '系统默认（无参） 总共耗时：0毫秒', '0', '',
        '2024-09-27 16:04:41');
INSERT INTO `sys_job_log`
VALUES (18, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '系统默认（有参） 总共耗时：1毫秒', '0', '',
        '2024-09-27 16:04:46');
INSERT INTO `sys_job_log`
VALUES (19, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '系统默认（无参） 总共耗时：0毫秒', '0', '',
        '2024-09-27 16:04:51');
INSERT INTO `sys_job_log`
VALUES (20, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '系统默认（无参） 总共耗时：1毫秒', '0', '',
        '2024-09-27 16:05:01');
INSERT INTO `sys_job_log`
VALUES (21, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '系统默认（有参） 总共耗时：0毫秒', '0', '',
        '2024-09-27 16:05:01');
INSERT INTO `sys_job_log`
VALUES (22, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)',
        '系统默认（多参） 总共耗时：2毫秒', '0', '', '2024-09-27 16:05:01');
INSERT INTO `sys_job_log`
VALUES (23, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '系统默认（无参） 总共耗时：0毫秒', '0', '',
        '2024-09-27 16:05:11');

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`
(
    `info_id`     bigint                                                        NOT NULL AUTO_INCREMENT COMMENT '访问ID',
    `user_name`   varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT '' COMMENT '用户账号',
    `ipaddr`      varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '登录IP地址',
    `status`      char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci      NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
    `msg`         varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '提示信息',
    `access_time` datetime                                                      NULL DEFAULT NULL COMMENT '访问时间',
    PRIMARY KEY (`info_id`) USING BTREE,
    INDEX `idx_sys_logininfor_s` (`status` ASC) USING BTREE,
    INDEX `idx_sys_logininfor_lt` (`access_time` ASC) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 189
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '系统访问记录'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor`
VALUES (100, 'admin', '127.0.0.1', '0', '登录成功', '2024-09-18 08:36:19');
INSERT INTO `sys_logininfor`
VALUES (101, 'admin', '127.0.0.1', '0', '退出成功', '2024-09-18 08:42:16');
INSERT INTO `sys_logininfor`
VALUES (102, 'admin', '127.0.0.1', '0', '登录成功', '2024-09-18 08:46:03');
INSERT INTO `sys_logininfor`
VALUES (103, 'admin', '127.0.0.1', '0', '退出成功', '2024-09-19 01:40:13');
INSERT INTO `sys_logininfor`
VALUES (104, 'admin', '127.0.0.1', '0', '登录成功', '2024-09-19 01:40:18');
INSERT INTO `sys_logininfor`
VALUES (105, 'admin', '127.0.0.1', '0', '登录成功', '2024-09-21 15:52:46');
INSERT INTO `sys_logininfor`
VALUES (106, 'admin', '127.0.0.1', '0', '登录成功', '2024-09-23 08:42:55');
INSERT INTO `sys_logininfor`
VALUES (107, 'admin', '127.0.0.1', '0', '退出成功', '2024-09-23 09:47:44');
INSERT INTO `sys_logininfor`
VALUES (108, 'admin', '127.0.0.1', '0', '退出成功', '2024-09-23 10:03:11');
INSERT INTO `sys_logininfor`
VALUES (109, 'admin', '127.0.0.1', '0', '登录成功', '2024-09-23 10:03:16');
INSERT INTO `sys_logininfor`
VALUES (110, 'admin', '127.0.0.1', '0', '登录成功', '2024-09-24 08:38:26');
INSERT INTO `sys_logininfor`
VALUES (111, 'admin', '127.0.0.1', '0', '登录成功', '2024-09-24 11:17:16');
INSERT INTO `sys_logininfor`
VALUES (112, 'admin', '127.0.0.1', '0', '登录成功', '2024-09-25 08:36:17');
INSERT INTO `sys_logininfor`
VALUES (113, 'admin', '127.0.0.1', '0', '退出成功', '2024-09-25 16:15:31');
INSERT INTO `sys_logininfor`
VALUES (114, 'admin', '127.0.0.1', '0', '退出成功', '2024-09-25 16:16:26');
INSERT INTO `sys_logininfor`
VALUES (115, 'admin', '127.0.0.1', '0', '退出成功', '2024-09-25 16:16:47');
INSERT INTO `sys_logininfor`
VALUES (116, 'admin', '127.0.0.1', '0', '登录成功', '2024-09-25 16:17:09');
INSERT INTO `sys_logininfor`
VALUES (117, 'admin', '127.0.0.1', '0', '退出成功', '2024-09-25 16:21:00');
INSERT INTO `sys_logininfor`
VALUES (118, 'admin', '127.0.0.1', '0', '退出成功', '2024-09-25 16:23:02');
INSERT INTO `sys_logininfor`
VALUES (119, 'admin', '127.0.0.1', '0', '退出成功', '2024-09-25 16:23:02');
INSERT INTO `sys_logininfor`
VALUES (120, 'admin', '127.0.0.1', '0', '登录成功', '2024-09-25 16:23:15');
INSERT INTO `sys_logininfor`
VALUES (121, 'admin', '127.0.0.1', '0', '退出成功', '2024-09-25 16:54:00');
INSERT INTO `sys_logininfor`
VALUES (122, 'zhangsan', '127.0.0.1', '0', '登录成功', '2024-09-25 16:54:11');
INSERT INTO `sys_logininfor`
VALUES (123, 'zhangsan', '127.0.0.1', '0', '退出成功', '2024-09-25 16:54:50');
INSERT INTO `sys_logininfor`
VALUES (124, 'admin', '127.0.0.1', '0', '登录成功', '2024-09-25 16:54:55');
INSERT INTO `sys_logininfor`
VALUES (125, 'admin', '127.0.0.1', '0', '退出成功', '2024-09-25 16:55:17');
INSERT INTO `sys_logininfor`
VALUES (126, 'zhangsan', '127.0.0.1', '0', '登录成功', '2024-09-25 16:55:29');
INSERT INTO `sys_logininfor`
VALUES (127, 'admin', '127.0.0.1', '1', '登录用户不存在', '2024-09-27 08:52:57');
INSERT INTO `sys_logininfor`
VALUES (128, 'admin', '127.0.0.1', '0', '登录成功', '2024-09-27 08:53:11');
INSERT INTO `sys_logininfor`
VALUES (129, 'admin', '127.0.0.1', '0', '退出成功', '2024-09-27 09:39:34');
INSERT INTO `sys_logininfor`
VALUES (130, 'zhangsan', '127.0.0.1', '0', '登录成功', '2024-09-27 09:39:46');
INSERT INTO `sys_logininfor`
VALUES (131, 'zhangsan', '127.0.0.1', '0', '退出成功', '2024-09-27 09:40:36');
INSERT INTO `sys_logininfor`
VALUES (132, 'admin', '127.0.0.1', '0', '登录成功', '2024-09-27 09:40:46');
INSERT INTO `sys_logininfor`
VALUES (133, 'admin', '127.0.0.1', '0', '退出成功', '2024-09-27 09:41:45');
INSERT INTO `sys_logininfor`
VALUES (134, 'zhangsan', '127.0.0.1', '0', '登录成功', '2024-09-27 09:41:54');
INSERT INTO `sys_logininfor`
VALUES (135, 'zhangsan', '127.0.0.1', '0', '退出成功', '2024-09-27 10:05:00');
INSERT INTO `sys_logininfor`
VALUES (136, 'admin', '127.0.0.1', '0', '登录成功', '2024-09-27 10:05:06');
INSERT INTO `sys_logininfor`
VALUES (137, 'admin', '127.0.0.1', '0', '登录成功', '2024-10-08 08:48:50');
INSERT INTO `sys_logininfor`
VALUES (138, 'admin', '127.0.0.1', '0', '退出成功', '2024-10-09 13:52:28');
INSERT INTO `sys_logininfor`
VALUES (139, 'admin', '127.0.0.1', '0', '登录成功', '2024-10-09 13:52:36');
INSERT INTO `sys_logininfor`
VALUES (140, 'admin', '127.0.0.1', '0', '退出成功', '2024-10-10 18:00:33');
INSERT INTO `sys_logininfor`
VALUES (141, 'admin', '127.0.0.1', '0', '退出成功', '2024-10-10 18:00:33');
INSERT INTO `sys_logininfor`
VALUES (142, 'admin', '127.0.0.1', '0', '登录成功', '2024-10-10 18:00:39');
INSERT INTO `sys_logininfor`
VALUES (143, 'admin', '127.0.0.1', '0', '登录成功', '2024-10-12 08:31:09');
INSERT INTO `sys_logininfor`
VALUES (144, '13700032456', '127.0.0.1', '0', '登录成功', '2024-10-12 13:57:41');
INSERT INTO `sys_logininfor`
VALUES (145, '13700032456', '127.0.0.1', '0', '注册成功', '2024-10-12 14:25:40');
INSERT INTO `sys_logininfor`
VALUES (146, '13700032456', '127.0.0.1', '1', '用户密码不在指定范围', '2024-10-12 14:34:29');
INSERT INTO `sys_logininfor`
VALUES (147, '13700032456', '127.0.0.1', '1', '用户密码不在指定范围', '2024-10-12 14:34:32');
INSERT INTO `sys_logininfor`
VALUES (148, '13700032456', '127.0.0.1', '1', '用户密码不在指定范围', '2024-10-12 14:34:34');
INSERT INTO `sys_logininfor`
VALUES (149, '13700032456', '127.0.0.1', '1', '用户密码不在指定范围', '2024-10-12 14:35:11');
INSERT INTO `sys_logininfor`
VALUES (150, '13700032456', '127.0.0.1', '1', '密码输入错误1次', '2024-10-12 14:35:19');
INSERT INTO `sys_logininfor`
VALUES (151, '13700032456', '127.0.0.1', '1', '密码输入错误2次', '2024-10-12 14:35:31');
INSERT INTO `sys_logininfor`
VALUES (152, '13700032456', '127.0.0.1', '1', '密码输入错误3次', '2024-10-12 14:35:43');
INSERT INTO `sys_logininfor`
VALUES (153, '13700032456', '127.0.0.1', '1', '密码输入错误4次', '2024-10-12 14:35:56');
INSERT INTO `sys_logininfor`
VALUES (154, '13700032456', '127.0.0.1', '1', '密码输入错误5次', '2024-10-12 14:35:58');
INSERT INTO `sys_logininfor`
VALUES (155, '13700032456', '127.0.0.1', '1', '密码输入错误5次，帐户锁定10分钟', '2024-10-12 14:36:16');
INSERT INTO `sys_logininfor`
VALUES (156, '13700032456', '127.0.0.1', '1', '密码输入错误5次，帐户锁定10分钟', '2024-10-12 14:36:20');
INSERT INTO `sys_logininfor`
VALUES (157, '13700032456', '127.0.0.1', '0', '登录成功', '2024-10-12 14:41:18');
INSERT INTO `sys_logininfor`
VALUES (158, '13700032456', '127.0.0.1', '0', '登录成功', '2024-10-12 14:45:54');
INSERT INTO `sys_logininfor`
VALUES (159, '13700032456', '127.0.0.1', '0', '登录成功', '2024-10-13 11:00:35');
INSERT INTO `sys_logininfor`
VALUES (160, '13700032456', '127.0.0.1', '0', '登录成功', '2024-10-13 14:54:15');
INSERT INTO `sys_logininfor`
VALUES (161, 'admin', '127.0.0.1', '0', '登录成功', '2024-10-14 10:07:09');
INSERT INTO `sys_logininfor`
VALUES (162, '13700032456', '127.0.0.1', '0', '登录成功', '2024-10-14 11:31:17');
INSERT INTO `sys_logininfor`
VALUES (163, 'admin', '127.0.0.1', '0', '登录成功', '2024-10-17 08:34:09');
INSERT INTO `sys_logininfor`
VALUES (164, '13700032456', '127.0.0.1', '0', '登录成功', '2024-10-17 08:34:15');
INSERT INTO `sys_logininfor`
VALUES (165, '13700032456', '127.0.0.1', '0', '登录成功', '2024-10-18 11:33:49');
INSERT INTO `sys_logininfor`
VALUES (166, '13700032456', '127.0.0.1', '0', '登录成功', '2024-10-18 15:52:24');
INSERT INTO `sys_logininfor`
VALUES (167, 'admin', '127.0.0.1', '0', '登录成功', '2024-11-04 15:39:17');
INSERT INTO `sys_logininfor`
VALUES (168, 'admin', '127.0.0.1', '0', '登录成功', '2024-11-04 15:44:35');
INSERT INTO `sys_logininfor`
VALUES (169, 'admin', '127.0.0.1', '0', '登录成功', '2024-11-04 15:55:13');
INSERT INTO `sys_logininfor`
VALUES (170, 'admin', '127.0.0.1', '0', '退出成功', '2024-11-04 17:06:54');
INSERT INTO `sys_logininfor`
VALUES (171, 'admin', '127.0.0.1', '0', '登录成功', '2024-11-04 17:07:03');
INSERT INTO `sys_logininfor`
VALUES (172, '13700032456', '127.0.0.1', '0', '登录成功', '2024-11-04 17:11:21');
INSERT INTO `sys_logininfor`
VALUES (173, 'admin', '127.0.0.1', '0', '退出成功', '2024-11-05 08:48:08');
INSERT INTO `sys_logininfor`
VALUES (174, 'admin', '127.0.0.1', '0', '登录成功', '2024-11-05 08:48:16');
INSERT INTO `sys_logininfor`
VALUES (175, 'admin', '127.0.0.1', '0', '退出成功', '2024-11-05 08:48:58');
INSERT INTO `sys_logininfor`
VALUES (176, 'admin', '127.0.0.1', '0', '登录成功', '2024-11-05 09:02:44');
INSERT INTO `sys_logininfor`
VALUES (177, '13700032456', '127.0.0.1', '1', '密码输入错误1次', '2024-11-05 11:19:15');
INSERT INTO `sys_logininfor`
VALUES (178, '13700032456', '127.0.0.1', '0', '登录成功', '2024-11-05 11:19:18');
INSERT INTO `sys_logininfor`
VALUES (179, 'admin', '127.0.0.1', '0', '退出成功', '2024-11-05 15:24:51');
INSERT INTO `sys_logininfor`
VALUES (180, 'ry', '127.0.0.1', '0', '登录成功', '2024-11-05 15:25:06');
INSERT INTO `sys_logininfor`
VALUES (181, 'ry', '127.0.0.1', '0', '退出成功', '2024-11-05 15:28:42');
INSERT INTO `sys_logininfor`
VALUES (182, 'admin', '127.0.0.1', '0', '登录成功', '2024-11-05 15:28:48');
INSERT INTO `sys_logininfor`
VALUES (183, 'admin', '127.0.0.1', '0', '退出成功', '2024-11-05 21:34:29');
INSERT INTO `sys_logininfor`
VALUES (184, 'admin', '127.0.0.1', '0', '登录成功', '2024-11-05 21:34:37');
INSERT INTO `sys_logininfor`
VALUES (185, '13700032456', '127.0.0.1', '0', '登录成功', '2024-11-05 21:39:11');
INSERT INTO `sys_logininfor`
VALUES (186, 'admin', '127.0.0.1', '0', '退出成功', '2024-11-06 08:44:25');
INSERT INTO `sys_logininfor`
VALUES (187, 'admin', '127.0.0.1', '0', '登录成功', '2024-11-06 08:44:38');
INSERT INTO `sys_logininfor`
VALUES (188, '13700032456', '127.0.0.1', '0', '登录成功', '2024-11-06 08:49:04');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`
(
    `menu_id`     bigint                                                        NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
    `menu_name`   varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL COMMENT '菜单名称',
    `parent_id`   bigint                                                        NULL DEFAULT 0 COMMENT '父菜单ID',
    `order_num`   int                                                           NULL DEFAULT 0 COMMENT '显示顺序',
    `path`        varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '路由地址',
    `component`   varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组件路径',
    `query`       varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '路由参数',
    `is_frame`    int                                                           NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
    `is_cache`    int                                                           NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
    `menu_type`   char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci      NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
    `visible`     char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci      NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
    `status`      char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci      NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
    `perms`       varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '权限标识',
    `icon`        varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '#' COMMENT '菜单图标',
    `create_by`   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT '' COMMENT '创建者',
    `create_time` datetime                                                      NULL DEFAULT NULL COMMENT '创建时间',
    `update_by`   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT '' COMMENT '更新者',
    `update_time` datetime                                                      NULL DEFAULT NULL COMMENT '更新时间',
    `remark`      varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
    PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 2032
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '菜单权限表'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu`
VALUES (1, '系统管理', 0, 1, 'system', NULL, '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2024-09-18 07:43:32', '',
        NULL, '系统管理目录');
INSERT INTO `sys_menu`
VALUES (2, '系统监控', 0, 2, 'monitor', NULL, '', 1, 0, 'M', '0', '0', '', 'monitor', 'admin', '2024-09-18 07:43:32',
        '', NULL, '系统监控目录');
INSERT INTO `sys_menu`
VALUES (3, '系统工具', 0, 3, 'tool', NULL, '', 1, 0, 'M', '0', '0', '', 'tool', 'admin', '2024-09-18 07:43:32', '',
        NULL, '系统工具目录');
INSERT INTO `sys_menu`
VALUES (4, '若依官网', 0, 4, 'http://spzx.vip', NULL, '', 0, 0, 'M', '0', '0', '', 'guide', 'admin',
        '2024-09-18 07:43:32', '', NULL, '若依官网地址');
INSERT INTO `sys_menu`
VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user',
        'admin', '2024-09-18 07:43:32', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu`
VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', '', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples',
        'admin', '2024-09-18 07:43:32', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu`
VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', '', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table',
        'admin', '2024-09-18 07:43:32', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu`
VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', '', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree',
        'admin', '2024-09-18 07:43:32', '', NULL, '部门管理菜单');
INSERT INTO `sys_menu`
VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', '', 1, 0, 'C', '0', '0', 'system:post:list', 'post',
        'admin', '2024-09-18 07:43:32', '', NULL, '岗位管理菜单');
INSERT INTO `sys_menu`
VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', '', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict',
        'admin', '2024-09-18 07:43:32', '', NULL, '字典管理菜单');
INSERT INTO `sys_menu`
VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', '', 1, 0, 'C', '0', '0', 'system:config:list', 'edit',
        'admin', '2024-09-18 07:43:32', '', NULL, '参数设置菜单');
INSERT INTO `sys_menu`
VALUES (107, '通知公告', 1, 8, 'notice', 'system/notice/index', '', 1, 0, 'C', '0', '0', 'system:notice:list',
        'message', 'admin', '2024-09-18 07:43:32', '', NULL, '通知公告菜单');
INSERT INTO `sys_menu`
VALUES (108, '日志管理', 1, 9, 'log', '', '', 1, 0, 'M', '0', '0', '', 'log', 'admin', '2024-09-18 07:43:32', '', NULL,
        '日志管理菜单');
INSERT INTO `sys_menu`
VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', '', 1, 0, 'C', '0', '0', 'monitor:online:list',
        'online', 'admin', '2024-09-18 07:43:32', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu`
VALUES (110, '定时任务', 2, 2, 'job', 'monitor/job/index', '', 1, 0, 'C', '0', '0', 'monitor:job:list', 'job', 'admin',
        '2024-09-18 07:43:32', '', NULL, '定时任务菜单');
INSERT INTO `sys_menu`
VALUES (111, 'Sentinel控制台', 2, 3, 'http://localhost:8718', '', '', 0, 0, 'C', '0', '0', 'monitor:sentinel:list',
        'sentinel', 'admin', '2024-09-18 07:43:32', '', NULL, '流量控制菜单');
INSERT INTO `sys_menu`
VALUES (112, 'Nacos控制台', 2, 4, 'http://localhost:8848/nacos', '', '', 0, 0, 'C', '0', '0', 'monitor:nacos:list',
        'nacos', 'admin', '2024-09-18 07:43:32', '', NULL, '服务治理菜单');
INSERT INTO `sys_menu`
VALUES (113, 'Admin控制台', 2, 5, 'http://localhost:9100/login', '', '', 0, 0, 'C', '0', '0', 'monitor:server:list',
        'server', 'admin', '2024-09-18 07:43:32', '', NULL, '服务监控菜单');
INSERT INTO `sys_menu`
VALUES (114, '表单构建', 3, 1, 'build', 'tool/build/index', '', 1, 0, 'C', '0', '0', 'tool:build:list', 'build',
        'admin', '2024-09-18 07:43:32', '', NULL, '表单构建菜单');
INSERT INTO `sys_menu`
VALUES (115, '代码生成', 3, 2, 'gen', 'tool/gen/index', '', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', 'admin',
        '2024-09-18 07:43:32', '', NULL, '代码生成菜单');
INSERT INTO `sys_menu`
VALUES (116, '系统接口', 3, 3, 'http://localhost:8080/swagger-ui/index.html', '', '', 0, 0, 'C', '0', '0',
        'tool:swagger:list', 'swagger', 'admin', '2024-09-18 07:43:32', '', NULL, '系统接口菜单');
INSERT INTO `sys_menu`
VALUES (500, '操作日志', 108, 1, 'operlog', 'system/operlog/index', '', 1, 0, 'C', '0', '0', 'system:operlog:list',
        'form', 'admin', '2024-09-18 07:43:32', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu`
VALUES (501, '登录日志', 108, 2, 'logininfor', 'system/logininfor/index', '', 1, 0, 'C', '0', '0',
        'system:logininfor:list', 'logininfor', 'admin', '2024-09-18 07:43:32', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu`
VALUES (1000, '用户查询', 100, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin',
        '2024-09-18 07:43:32', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1001, '用户新增', 100, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin',
        '2024-09-18 07:43:32', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1002, '用户修改', 100, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin',
        '2024-09-18 07:43:32', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1003, '用户删除', 100, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin',
        '2024-09-18 07:43:32', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1004, '用户导出', 100, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin',
        '2024-09-18 07:43:32', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1005, '用户导入', 100, 6, '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin',
        '2024-09-18 07:43:32', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1006, '重置密码', 100, 7, '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin',
        '2024-09-18 07:43:32', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1007, '角色查询', 101, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin',
        '2024-09-18 07:43:32', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1008, '角色新增', 101, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin',
        '2024-09-18 07:43:32', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1009, '角色修改', 101, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin',
        '2024-09-18 07:43:32', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1010, '角色删除', 101, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin',
        '2024-09-18 07:43:32', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1011, '角色导出', 101, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin',
        '2024-09-18 07:43:32', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1012, '菜单查询', 102, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin',
        '2024-09-18 07:43:32', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1013, '菜单新增', 102, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin',
        '2024-09-18 07:43:32', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1014, '菜单修改', 102, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin',
        '2024-09-18 07:43:32', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1015, '菜单删除', 102, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin',
        '2024-09-18 07:43:32', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1016, '部门查询', 103, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin',
        '2024-09-18 07:43:32', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1017, '部门新增', 103, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin',
        '2024-09-18 07:43:32', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1018, '部门修改', 103, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin',
        '2024-09-18 07:43:32', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1019, '部门删除', 103, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin',
        '2024-09-18 07:43:32', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1020, '岗位查询', 104, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 'admin',
        '2024-09-18 07:43:32', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1021, '岗位新增', 104, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 'admin',
        '2024-09-18 07:43:32', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1022, '岗位修改', 104, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 'admin',
        '2024-09-18 07:43:32', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1023, '岗位删除', 104, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 'admin',
        '2024-09-18 07:43:32', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1024, '岗位导出', 104, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 'admin',
        '2024-09-18 07:43:32', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1025, '字典查询', 105, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin',
        '2024-09-18 07:43:32', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1026, '字典新增', 105, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin',
        '2024-09-18 07:43:32', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1027, '字典修改', 105, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin',
        '2024-09-18 07:43:32', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1028, '字典删除', 105, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin',
        '2024-09-18 07:43:32', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1029, '字典导出', 105, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin',
        '2024-09-18 07:43:32', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1030, '参数查询', 106, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin',
        '2024-09-18 07:43:32', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1031, '参数新增', 106, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin',
        '2024-09-18 07:43:32', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1032, '参数修改', 106, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin',
        '2024-09-18 07:43:32', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1033, '参数删除', 106, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin',
        '2024-09-18 07:43:32', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1034, '参数导出', 106, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin',
        '2024-09-18 07:43:32', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1035, '公告查询', 107, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 'admin',
        '2024-09-18 07:43:32', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1036, '公告新增', 107, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 'admin',
        '2024-09-18 07:43:32', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1037, '公告修改', 107, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 'admin',
        '2024-09-18 07:43:32', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1038, '公告删除', 107, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 'admin',
        '2024-09-18 07:43:32', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1039, '操作查询', 500, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:operlog:query', '#', 'admin',
        '2024-09-18 07:43:32', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1040, '操作删除', 500, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:operlog:remove', '#', 'admin',
        '2024-09-18 07:43:32', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1041, '日志导出', 500, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:operlog:export', '#', 'admin',
        '2024-09-18 07:43:32', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1042, '登录查询', 501, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:logininfor:query', '#', 'admin',
        '2024-09-18 07:43:32', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1043, '登录删除', 501, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:logininfor:remove', '#', 'admin',
        '2024-09-18 07:43:32', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1044, '日志导出', 501, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:logininfor:export', '#', 'admin',
        '2024-09-18 07:43:32', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1045, '账户解锁', 501, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:logininfor:unlock', '#', 'admin',
        '2024-09-18 07:43:32', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1046, '在线查询', 109, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 'admin',
        '2024-09-18 07:43:32', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1047, '批量强退', 109, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin',
        '2024-09-18 07:43:32', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1048, '单条强退', 109, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin',
        '2024-09-18 07:43:32', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1049, '任务查询', 110, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:query', '#', 'admin',
        '2024-09-18 07:43:32', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1050, '任务新增', 110, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:add', '#', 'admin',
        '2024-09-18 07:43:32', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1051, '任务修改', 110, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:edit', '#', 'admin',
        '2024-09-18 07:43:32', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1052, '任务删除', 110, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:remove', '#', 'admin',
        '2024-09-18 07:43:32', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1053, '状态修改', 110, 5, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin',
        '2024-09-18 07:43:32', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1054, '任务导出', 110, 6, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:export', '#', 'admin',
        '2024-09-18 07:43:32', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1055, '生成查询', 115, 1, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 'admin',
        '2024-09-18 07:43:32', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1056, '生成修改', 115, 2, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 'admin',
        '2024-09-18 07:43:32', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1057, '生成删除', 115, 3, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 'admin',
        '2024-09-18 07:43:32', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1058, '导入代码', 115, 2, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 'admin',
        '2024-09-18 07:43:32', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1059, '预览代码', 115, 4, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 'admin',
        '2024-09-18 07:43:32', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1060, '生成代码', 115, 5, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 'admin',
        '2024-09-18 07:43:32', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (2000, '会员列表', 3, 1, 'userInfo', 'user/userInfo/index', NULL, 1, 0, 'C', '0', '0', 'user:userInfo:list', '#',
        'admin', '2024-09-18 07:43:33', '', NULL, '会员菜单');
INSERT INTO `sys_menu`
VALUES (2001, '会员查询', 2000, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'user:userInfo:query', '#', 'admin',
        '2024-09-18 07:43:33', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (2002, '会员新增', 2000, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'user:userInfo:add', '#', 'admin',
        '2024-09-18 07:43:33', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (2003, '会员修改', 2000, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'user:userInfo:edit', '#', 'admin',
        '2024-09-18 07:43:33', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (2004, '会员删除', 2000, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'user:userInfo:remove', '#', 'admin',
        '2024-09-18 07:43:33', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (2005, '会员导出', 2000, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'user:userInfo:export', '#', 'admin',
        '2024-09-18 07:43:33', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (2006, '商品管理', 0, 5, 'product', NULL, NULL, 1, 0, 'M', '0', '0', NULL, 'date', 'admin',
        '2024-09-21 15:58:30', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (2007, '品牌管理', 2006, 1, 'brand', 'product/brand/index', NULL, 1, 0, 'C', '0', '0', 'product:brand:list',
        'guide', 'admin', '2024-09-21 16:03:37', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (2008, '基础数据', 0, 6, 'base', NULL, NULL, 1, 0, 'M', '0', '0', '', 'dict', 'admin', '2024-09-23 13:52:24',
        'admin', '2024-09-23 13:53:23', '');
INSERT INTO `sys_menu`
VALUES (2009, '单位管理', 2008, 1, 'productUnit', 'base/productUnit/index', NULL, 1, 0, 'C', '0', '0',
        'base:productUnit:list', 'monitor', 'admin', '2024-09-23 13:54:14', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (2010, '商品分类', 2006, 2, 'category', 'product/category/index', NULL, 1, 0, 'C', '0', '0',
        'product:category:list', 'drag', 'admin', '2024-09-24 10:08:00', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (2011, '分类品牌', 2006, 3, 'categoryBrand', 'product/categoryBrand/index', NULL, 1, 0, 'C', '0', '0',
        'product:categoryBrand:list', 'color', 'admin', '2024-09-24 11:03:57', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (2012, '商品规格', 2006, 4, 'productSpec', 'product/productSpec/index', NULL, 1, 0, 'C', '0', '0',
        'product:productSpec:list', 'education', 'admin', '2024-09-24 11:07:12', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (2013, '商品列表', 2006, 5, 'product', 'product/product/index', NULL, 1, 0, 'C', '0', '0',
        'product:product:list', 'table', 'admin', '2024-09-24 11:12:26', 'admin', '2024-09-24 11:25:22', '');
INSERT INTO `sys_menu`
VALUES (2014, '品牌查询', 2007, 1, '', NULL, NULL, 1, 0, 'F', '0', '0', 'product:brand:query', '#', 'admin',
        '2024-09-27 09:27:50', 'admin', '2024-09-27 09:28:48', '');
INSERT INTO `sys_menu`
VALUES (2016, '品牌添加', 2007, 2, '', NULL, NULL, 1, 0, 'F', '0', '0', 'product:brand:add', '#', 'admin',
        '2024-09-27 09:29:04', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (2017, '品牌修改', 2007, 3, '', NULL, NULL, 1, 0, 'F', '0', '0', 'product:brand:edit', '#', 'admin',
        '2024-09-27 09:29:29', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (2018, '品牌删除', 2007, 4, '', NULL, NULL, 1, 0, 'F', '0', '0', 'product:brand:remove', '#', 'admin',
        '2024-09-27 09:29:52', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (2019, '品牌列表', 2007, 5, '', NULL, NULL, 1, 0, 'F', '0', '0', 'product:brand:list', '#', 'admin',
        '2024-09-27 09:31:02', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (2020, '会员管理', 0, 7, 'userplus', NULL, NULL, 1, 0, 'M', '0', '0', NULL, 'client', 'admin',
        '2024-09-27 14:29:12', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (2021, '会员', 2020, 1, 'userInfo', 'user/userInfo/index', NULL, 1, 0, 'C', '0', '0', 'user:userInfo:list', '#',
        'admin', '2024-09-27 14:31:36', '', NULL, '会员菜单');
INSERT INTO `sys_menu`
VALUES (2022, '会员查询', 2021, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'user:userInfo:query', '#', 'admin',
        '2024-09-27 14:33:10', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (2023, '会员新增', 2021, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'user:userInfo:add', '#', 'admin',
        '2024-09-27 14:33:10', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (2024, '会员修改', 2021, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'user:userInfo:edit', '#', 'admin',
        '2024-09-27 14:33:10', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (2025, '会员删除', 2021, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'user:userInfo:remove', '#', 'admin',
        '2024-09-27 14:33:10', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (2026, '会员导出', 2021, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'user:userInfo:export', '#', 'admin',
        '2024-09-27 14:33:10', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (2027, '地区管理', 2008, 2, 'region', 'base/region/index', NULL, 1, 0, 'C', '0', '0', 'user:region:list', 'tab',
        'admin', '2024-09-27 16:21:46', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (2028, '订单管理', 0, 8, 'order', NULL, NULL, 1, 0, 'M', '0', '0', NULL, 'chart', 'admin', '2024-09-27 16:23:50',
        '', NULL, '');
INSERT INTO `sys_menu`
VALUES (2029, '订单列表', 2028, 1, 'orderInfo', 'order/orderInfo/index', NULL, 1, 0, 'C', '0', '0',
        'order:orderInfo:list', '#', 'admin', '2024-09-27 16:24:29', '', NULL, '订单菜单');
INSERT INTO `sys_menu`
VALUES (2030, '订单查询', 2029, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'order:orderInfo:query', '#', 'admin',
        '2024-09-27 16:24:39', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (2031, '订单导出', 2029, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'order:orderInfo:export', '#', 'admin',
        '2024-09-27 16:24:39', '', NULL, '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`
(
    `notice_id`      int                                                           NOT NULL AUTO_INCREMENT COMMENT '公告ID',
    `notice_title`   varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL COMMENT '公告标题',
    `notice_type`    char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci      NOT NULL COMMENT '公告类型（1通知 2公告）',
    `notice_content` longblob                                                      NULL COMMENT '公告内容',
    `status`         char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci      NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
    `create_by`      varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT '' COMMENT '创建者',
    `create_time`    datetime                                                      NULL DEFAULT NULL COMMENT '创建时间',
    `update_by`      varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT '' COMMENT '更新者',
    `update_time`    datetime                                                      NULL DEFAULT NULL COMMENT '更新时间',
    `remark`         varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
    PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 10
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '通知公告表'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice`
VALUES (1, '温馨提醒：2018-07-01 若依新版本发布啦', '2', 0xE696B0E78988E69CACE58685E5AEB9, '0', 'admin',
        '2024-09-18 07:43:33', '', NULL, '管理员');
INSERT INTO `sys_notice`
VALUES (2, '维护通知：2018-07-01 若依系统凌晨维护', '1', 0xE7BBB4E68AA4E58685E5AEB9, '0', 'admin', '2024-09-18 07:43:33',
        '', NULL, '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`
(
    `oper_id`        bigint                                                         NOT NULL AUTO_INCREMENT COMMENT '日志主键',
    `title`          varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci   NULL DEFAULT '' COMMENT '模块标题',
    `business_type`  int                                                            NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
    `method`         varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT '' COMMENT '方法名称',
    `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci   NULL DEFAULT '' COMMENT '请求方式',
    `operator_type`  int                                                            NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
    `oper_name`      varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci   NULL DEFAULT '' COMMENT '操作人员',
    `dept_name`      varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci   NULL DEFAULT '' COMMENT '部门名称',
    `oper_url`       varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT '' COMMENT '请求URL',
    `oper_ip`        varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT '' COMMENT '主机地址',
    `oper_location`  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT '' COMMENT '操作地点',
    `oper_param`     varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '请求参数',
    `json_result`    varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '返回参数',
    `status`         int                                                            NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
    `error_msg`      varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '错误消息',
    `oper_time`      datetime                                                       NULL DEFAULT NULL COMMENT '操作时间',
    `cost_time`      bigint                                                         NULL DEFAULT 0 COMMENT '消耗时间',
    PRIMARY KEY (`oper_id`) USING BTREE,
    INDEX `idx_sys_oper_log_bt` (`business_type` ASC) USING BTREE,
    INDEX `idx_sys_oper_log_s` (`status` ASC) USING BTREE,
    INDEX `idx_sys_oper_log_ot` (`oper_time` ASC) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 156
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '操作日志记录'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log`
VALUES (100, '菜单管理', 1, 'com.spzx.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu',
        '127.0.0.1', '',
        '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"date\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"商品管理\",\"menuType\":\"M\",\"orderNum\":5,\"params\":{},\"parentId\":0,\"path\":\"product\",\"status\":\"0\",\"visible\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-21 15:58:30', 30);
INSERT INTO `sys_oper_log`
VALUES (101, '菜单管理', 1, 'com.spzx.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu',
        '127.0.0.1', '',
        '{\"children\":[],\"component\":\"product/brand/index\",\"createBy\":\"admin\",\"icon\":\"guide\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"品牌管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2006,\"path\":\"brand\",\"perms\":\"product:brand:list\",\"status\":\"0\",\"visible\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-21 16:03:37', 25);
INSERT INTO `sys_oper_log`
VALUES (102, '菜单管理', 1, 'com.spzx.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu',
        '127.0.0.1', '',
        '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"dict\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"基础数据\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":2006,\"path\":\"base\",\"status\":\"0\",\"visible\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-23 13:52:24', 30);
INSERT INTO `sys_oper_log`
VALUES (103, '菜单管理', 2, 'com.spzx.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu',
        '127.0.0.1', '',
        '{\"children\":[],\"createTime\":\"2024-09-23 13:52:24\",\"icon\":\"dict\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2008,\"menuName\":\"基础数据\",\"menuType\":\"M\",\"orderNum\":6,\"params\":{},\"parentId\":0,\"path\":\"base\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-23 13:53:23', 12);
INSERT INTO `sys_oper_log`
VALUES (104, '菜单管理', 1, 'com.spzx.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu',
        '127.0.0.1', '',
        '{\"children\":[],\"component\":\"base/productUnit/index\",\"createBy\":\"admin\",\"icon\":\"monitor\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"单位管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2008,\"path\":\"productUnit\",\"perms\":\"base:productUnit:list\",\"status\":\"0\",\"visible\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-23 13:54:14', 13);
INSERT INTO `sys_oper_log`
VALUES (105, '菜单管理', 1, 'com.spzx.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu',
        '127.0.0.1', '',
        '{\"children\":[],\"component\":\"product/category/index\",\"createBy\":\"admin\",\"icon\":\"drag\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"商品分类\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2006,\"path\":\"category\",\"perms\":\"product:category:list\",\"status\":\"0\",\"visible\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-24 10:08:01', 31);
INSERT INTO `sys_oper_log`
VALUES (106, '菜单管理', 1, 'com.spzx.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu',
        '127.0.0.1', '',
        '{\"children\":[],\"component\":\"product/categoryBrand/index\",\"createBy\":\"admin\",\"icon\":\"color\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"分类品牌\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":2006,\"path\":\"categoryBrand\",\"perms\":\"product:categoryBrand:list\",\"status\":\"0\",\"visible\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-24 11:03:57', 23);
INSERT INTO `sys_oper_log`
VALUES (107, '菜单管理', 1, 'com.spzx.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu',
        '127.0.0.1', '',
        '{\"children\":[],\"component\":\"product/productSpec/index\",\"createBy\":\"admin\",\"icon\":\"education\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"商品规格\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":2006,\"path\":\"productSpec\",\"perms\":\"product:productSpec:list\",\"status\":\"0\",\"visible\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-24 11:07:12', 11);
INSERT INTO `sys_oper_log`
VALUES (108, '菜单管理', 1, 'com.spzx.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu',
        '127.0.0.1', '',
        '{\"children\":[],\"component\":\"product/product/index.vue\",\"createBy\":\"admin\",\"icon\":\"table\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"商品列表\",\"menuType\":\"C\",\"orderNum\":5,\"params\":{},\"parentId\":2006,\"path\":\"product\",\"perms\":\"product:product:list\",\"status\":\"0\",\"visible\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-24 11:12:26', 12);
INSERT INTO `sys_oper_log`
VALUES (109, '菜单管理', 2, 'com.spzx.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu',
        '127.0.0.1', '',
        '{\"children\":[],\"component\":\"product/product/index\",\"createTime\":\"2024-09-24 11:12:26\",\"icon\":\"table\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2013,\"menuName\":\"商品列表\",\"menuType\":\"C\",\"orderNum\":5,\"params\":{},\"parentId\":2006,\"path\":\"product\",\"perms\":\"product:product:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-24 11:25:23', 30);
INSERT INTO `sys_oper_log`
VALUES (110, '用户管理', 1, 'com.spzx.system.controller.SysUserController.add()', 'POST', 1, 'admin', NULL, '/user',
        '127.0.0.1', '',
        '{\"admin\":false,\"createBy\":\"admin\",\"deptId\":103,\"nickName\":\"张三\",\"params\":{},\"postIds\":[],\"roleIds\":[],\"status\":\"0\",\"userId\":100,\"userName\":\"zhangsan\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-25 16:51:17', 177);
INSERT INTO `sys_oper_log`
VALUES (111, '用户管理', 4, 'com.spzx.system.controller.SysUserController.insertAuthRole()', 'PUT', 1, 'admin', NULL,
        '/user/authRole', '127.0.0.1', '', '{\"roleIds\":\"2\",\"userId\":\"100\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-25 16:51:31', 19);
INSERT INTO `sys_oper_log`
VALUES (112, '角色管理', 2, 'com.spzx.system.controller.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/role',
        '127.0.0.1', '',
        '{\"admin\":false,\"createTime\":\"2024-09-18 07:43:32\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[3,2006,1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114,115,1055,1056,1058,1057,1059,1060,116,4,2007],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-25 16:52:07', 55);
INSERT INTO `sys_oper_log`
VALUES (113, '角色管理', 2, 'com.spzx.system.controller.SysRoleController.dataScope()', 'PUT', 1, 'admin', NULL,
        '/role/dataScope', '127.0.0.1', '',
        '{\"admin\":false,\"createTime\":\"2024-09-18 07:43:32\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"deptIds\":[100,101,103,105],\"flag\":false,\"menuCheckStrictly\":true,\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-25 16:53:31', 24);
INSERT INTO `sys_oper_log`
VALUES (114, '用户管理', 1, 'com.spzx.system.controller.SysUserController.add()', 'POST', 1, 'admin', NULL, '/user',
        '127.0.0.1', '',
        '{\"admin\":false,\"createBy\":\"admin\",\"deptId\":105,\"nickName\":\"李四\",\"params\":{},\"postIds\":[],\"roleIds\":[],\"status\":\"0\",\"userId\":101,\"userName\":\"lisi\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-25 16:53:54', 137);
INSERT INTO `sys_oper_log`
VALUES (115, '角色管理', 2, 'com.spzx.system.controller.SysRoleController.dataScope()', 'PUT', 1, 'admin', NULL,
        '/role/dataScope', '127.0.0.1', '',
        '{\"admin\":false,\"createTime\":\"2024-09-18 07:43:32\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"deptIds\":[100,101,103],\"flag\":false,\"menuCheckStrictly\":true,\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-25 16:55:12', 22);
INSERT INTO `sys_oper_log`
VALUES (116, '菜单管理', 1, 'com.spzx.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu',
        '127.0.0.1', '',
        '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"新增\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2007,\"perms\":\"product:brand:query\",\"status\":\"0\",\"visible\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-27 09:27:50', 32);
INSERT INTO `sys_oper_log`
VALUES (117, '菜单管理', 2, 'com.spzx.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu',
        '127.0.0.1', '',
        '{\"children\":[],\"createTime\":\"2024-09-27 09:27:50\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2014,\"menuName\":\"商品查询\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2007,\"path\":\"\",\"perms\":\"product:brand:query\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-27 09:28:03', 16);
INSERT INTO `sys_oper_log`
VALUES (118, '菜单管理', 1, 'com.spzx.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu',
        '127.0.0.1', '',
        '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"品牌新增\",\"menuType\":\"F\",\"orderNum\":2,\"params\":{},\"parentId\":2014,\"perms\":\"product:brand:add\",\"status\":\"0\",\"visible\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-27 09:28:25', 12);
INSERT INTO `sys_oper_log`
VALUES (119, '菜单管理', 3, 'com.spzx.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL,
        '/menu/2015', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-27 09:28:38', 24);
INSERT INTO `sys_oper_log`
VALUES (120, '菜单管理', 2, 'com.spzx.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu',
        '127.0.0.1', '',
        '{\"children\":[],\"createTime\":\"2024-09-27 09:27:50\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2014,\"menuName\":\"品牌查询\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2007,\"path\":\"\",\"perms\":\"product:brand:query\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-27 09:28:48', 11);
INSERT INTO `sys_oper_log`
VALUES (121, '菜单管理', 1, 'com.spzx.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu',
        '127.0.0.1', '',
        '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"品牌添加\",\"menuType\":\"F\",\"orderNum\":2,\"params\":{},\"parentId\":2007,\"perms\":\"product:brand:add\",\"status\":\"0\",\"visible\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-27 09:29:04', 10);
INSERT INTO `sys_oper_log`
VALUES (122, '菜单管理', 1, 'com.spzx.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu',
        '127.0.0.1', '',
        '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"品牌修改\",\"menuType\":\"F\",\"orderNum\":3,\"params\":{},\"parentId\":2007,\"perms\":\"product:brand:edit\",\"status\":\"0\",\"visible\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-27 09:29:29', 22);
INSERT INTO `sys_oper_log`
VALUES (123, '菜单管理', 1, 'com.spzx.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu',
        '127.0.0.1', '',
        '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"品牌删除\",\"menuType\":\"F\",\"orderNum\":4,\"params\":{},\"parentId\":2007,\"perms\":\"product:brand:remove\",\"status\":\"0\",\"visible\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-27 09:29:52', 10);
INSERT INTO `sys_oper_log`
VALUES (124, '菜单管理', 1, 'com.spzx.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu',
        '127.0.0.1', '',
        '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"品牌列表\",\"menuType\":\"F\",\"orderNum\":5,\"params\":{},\"parentId\":2007,\"perms\":\"product:brand:list\",\"status\":\"0\",\"visible\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-27 09:31:02', 13);
INSERT INTO `sys_oper_log`
VALUES (125, '角色管理', 2, 'com.spzx.system.controller.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/role',
        '127.0.0.1', '',
        '{\"admin\":false,\"createTime\":\"2024-09-18 07:43:32\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[3,2006,2007,1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114,115,1055,1056,1058,1057,1059,1060,116,4,2014,2016,2019],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-27 09:39:28', 62);
INSERT INTO `sys_oper_log`
VALUES (126, '角色管理', 2, 'com.spzx.system.controller.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/role',
        '127.0.0.1', '',
        '{\"admin\":false,\"createTime\":\"2024-09-18 07:43:32\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2006,2007,2014,2016,2017,2018,2019,2010,2011,2012,2013,2008,2009],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-27 09:41:41', 25);
INSERT INTO `sys_oper_log`
VALUES (127, '品牌管理', 1, 'com.spzx.product.controller.BrandController.save()', 'POST', 1, 'admin', NULL, '/brand',
        '127.0.0.1', '',
        '{\"createBy\":\"admin\",\"id\":19,\"logo\":\"http://192.168.6.121:9000/spzx/2024/09/27/atguigu_20240927105739A001.jpg\",\"name\":\"硅谷\",\"params\":{}}',
        '{\"msg\":\"操作成功\",\"code\":200,\"data\":1}', 0, NULL, '2024-09-27 10:57:43', 55);
INSERT INTO `sys_oper_log`
VALUES (128, '代码生成', 3, 'com.spzx.gen.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/gen/1',
        '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-27 11:39:26', 86);
INSERT INTO `sys_oper_log`
VALUES (129, '代码生成', 6, 'com.spzx.gen.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL,
        '/gen/importTable', '127.0.0.1', '', '{\"tables\":\"brand,category\"}', '{\"msg\":\"操作成功\",\"code\":200}',
        0, NULL, '2024-09-27 11:41:00', 178);
INSERT INTO `sys_oper_log`
VALUES (130, '代码生成', 8, 'com.spzx.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL,
        '/gen/batchGenCode', '127.0.0.1', '', '{\"tables\":\"brand,category\"}', NULL, 0, NULL, '2024-09-27 11:42:57',
        510);
INSERT INTO `sys_oper_log`
VALUES (131, '代码生成', 8, 'com.spzx.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL,
        '/gen/batchGenCode', '127.0.0.1', '', '{\"tables\":\"brand\"}', NULL, 0, NULL, '2024-09-27 11:43:07', 140);
INSERT INTO `sys_oper_log`
VALUES (132, '代码生成', 2, 'com.spzx.gen.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/gen',
        '127.0.0.1', '',
        '{\"businessName\":\"brand\",\"className\":\"Brand\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"ID\",\"columnId\":19,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2024-09-27 11:41:00\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"品牌名称\",\"columnId\":20,\"columnName\":\"name\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-27 11:41:00\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Logo\",\"columnComment\":\"品牌图标\",\"columnId\":21,\"columnName\":\"logo\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-27 11:41:00\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"imageUpload\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"logo\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CreateTime\",\"columnComment\":\"创建时间\",\"columnId\":22,\"columnName\":\"create_time\",\"columnType\":\"timestamp\",\"createBy\":\"admin\",\"createTime\":\"2024-09-27 11:41:00\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"0\",\"isRequired\":\"1\",\"javaField\":\"createTime\",\"javaType\":\"Date\",\"list\":false,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"requ',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-27 11:50:50', 81);
INSERT INTO `sys_oper_log`
VALUES (133, '代码生成', 8, 'com.spzx.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL,
        '/gen/batchGenCode', '127.0.0.1', '', '{\"tables\":\"brand,category\"}', NULL, 0, NULL, '2024-09-27 11:51:00',
        300);
INSERT INTO `sys_oper_log`
VALUES (134, '代码生成', 6, 'com.spzx.gen.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL,
        '/gen/importTable', '127.0.0.1', '', '{\"tables\":\"user_info,user_address\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-27 14:19:56', 295);
INSERT INTO `sys_oper_log`
VALUES (135, '代码生成', 2, 'com.spzx.gen.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/gen',
        '127.0.0.1', '',
        '{\"businessName\":\"userInfo\",\"className\":\"UserInfo\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"id\",\"columnId\":18,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2024-09-27 14:19:56\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Username\",\"columnComment\":\"用户名\",\"columnId\":19,\"columnName\":\"username\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-27 14:19:56\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"username\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Password\",\"columnComment\":\"密码\",\"columnId\":20,\"columnName\":\"password\",\"columnType\":\"varchar(500)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-27 14:19:56\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"textarea\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"0\",\"isPk\":\"0\",\"isQuery\":\"0\",\"javaField\":\"password\",\"javaType\":\"String\",\"list\":false,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"NickName\",\"columnComment\":\"昵称\",\"columnId\":21,\"columnName\":\"nick_name\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-27 14:19:56\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"nickName\",\"javaType\":\"String\",\"list\":true,\"params',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-27 14:24:41', 112);
INSERT INTO `sys_oper_log`
VALUES (136, '代码生成', 8, 'com.spzx.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL,
        '/gen/batchGenCode', '127.0.0.1', '', '{\"tables\":\"user_address,user_info\"}', NULL, 0, NULL,
        '2024-09-27 14:24:49', 559);
INSERT INTO `sys_oper_log`
VALUES (137, '菜单管理', 1, 'com.spzx.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu',
        '127.0.0.1', '',
        '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"client\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"会员管理\",\"menuType\":\"M\",\"orderNum\":7,\"params\":{},\"parentId\":0,\"path\":\"userplus\",\"status\":\"0\",\"visible\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-27 14:29:12', 11);
INSERT INTO `sys_oper_log`
VALUES (138, '会员', 5, 'com.spzx.user.controller.UserInfoController.export()', 'POST', 1, 'admin', NULL,
        '/userInfo/export', '127.0.0.1', '', '{\"pageSize\":\"10\",\"pageNum\":\"1\",\"username\":\"13700032456\"}',
        NULL, 0, NULL, '2024-09-27 14:36:17', 1225);
INSERT INTO `sys_oper_log`
VALUES (139, '会员', 1, 'com.spzx.user.controller.UserInfoController.add()', 'POST', 1, 'admin', NULL, '/userInfo',
        '127.0.0.1', '',
        '{\"avatar\":\"1\",\"delFlag\":\"1\",\"id\":2,\"lastLoginIp\":\"1\",\"lastLoginTime\":\"2024-09-27\",\"memo\":\"1\",\"nickName\":\"小丽\",\"openId\":\"1\",\"params\":{},\"phone\":\"12345678900\",\"remark\":\"1\",\"unionId\":\"1\",\"username\":\"xiaoli\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-27 14:37:30', 41);
INSERT INTO `sys_oper_log`
VALUES (140, '会员', 2, 'com.spzx.user.controller.UserInfoController.edit()', 'PUT', 1, 'admin', NULL, '/userInfo',
        '127.0.0.1', '',
        '{\"avatar\":\"http://139.198.127.41:9000/sph/20230505/default_handsome.jpg\",\"createTime\":\"2023-05-12 17:14:03\",\"delFlag\":\"0\",\"id\":1,\"lastLoginIp\":\"127.0.0.1\",\"lastLoginTime\":\"2024-02-28\",\"memo\":\"test\",\"nickName\":\"晴天22\",\"params\":{},\"phone\":\"13700032456\",\"sex\":1,\"status\":0,\"updateTime\":\"2024-02-29 01:23:42\",\"username\":\"13700032456\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-27 14:38:22', 31);
INSERT INTO `sys_oper_log`
VALUES (141, '会员', 3, 'com.spzx.user.controller.UserInfoController.remove()', 'DELETE', 1, 'admin', NULL,
        '/userInfo/1', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-27 14:38:26',
        30);
INSERT INTO `sys_oper_log`
VALUES (142, '定时任务', 2, 'com.spzx.job.controller.SysJobController.edit()', 'PUT', 1, 'admin', NULL, '/job',
        '127.0.0.1', '',
        '{\"concurrent\":\"1\",\"createBy\":\"admin\",\"createTime\":\"2024-09-18 07:43:33\",\"cronExpression\":\"0/10 * * * * ?\",\"invokeTarget\":\"ryTask.ryNoParams\",\"jobGroup\":\"DEFAULT\",\"jobId\":1,\"jobName\":\"系统默认（无参）\",\"misfirePolicy\":\"3\",\"nextValidTime\":\"2024-09-27 16:02:10\",\"params\":{},\"remark\":\"\",\"status\":\"0\",\"updateBy\":\"admin\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-27 16:02:09', 125);
INSERT INTO `sys_oper_log`
VALUES (143, '定时任务', 2, 'com.spzx.job.controller.SysJobController.edit()', 'PUT', 1, 'admin', NULL, '/job',
        '127.0.0.1', '',
        '{\"concurrent\":\"1\",\"createBy\":\"admin\",\"createTime\":\"2024-09-18 07:43:33\",\"cronExpression\":\"0/15 * * * * ?\",\"invokeTarget\":\"ryTask.ryParams(\'ry\')\",\"jobGroup\":\"DEFAULT\",\"jobId\":2,\"jobName\":\"系统默认（有参）\",\"misfirePolicy\":\"3\",\"nextValidTime\":\"2024-09-27 16:04:00\",\"params\":{},\"remark\":\"\",\"status\":\"0\",\"updateBy\":\"admin\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-27 16:03:49', 60);
INSERT INTO `sys_oper_log`
VALUES (144, '定时任务', 2, 'com.spzx.job.controller.SysJobController.edit()', 'PUT', 1, 'admin', NULL, '/job',
        '127.0.0.1', '',
        '{\"concurrent\":\"1\",\"createBy\":\"admin\",\"createTime\":\"2024-09-18 07:43:33\",\"cronExpression\":\"0/20 * * * * ?\",\"invokeTarget\":\"ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)\",\"jobGroup\":\"DEFAULT\",\"jobId\":3,\"jobName\":\"系统默认（多参）\",\"misfirePolicy\":\"3\",\"nextValidTime\":\"2024-09-27 16:05:00\",\"params\":{},\"remark\":\"\",\"status\":\"0\",\"updateBy\":\"admin\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-27 16:04:54', 45);
INSERT INTO `sys_oper_log`
VALUES (145, '定时任务', 2, 'com.spzx.job.controller.SysJobController.changeStatus()', 'PUT', 1, 'admin', NULL,
        '/job/changeStatus', '127.0.0.1', '', '{\"jobId\":3,\"misfirePolicy\":\"0\",\"params\":{},\"status\":\"1\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-27 16:05:07', 20);
INSERT INTO `sys_oper_log`
VALUES (146, '定时任务', 2, 'com.spzx.job.controller.SysJobController.changeStatus()', 'PUT', 1, 'admin', NULL,
        '/job/changeStatus', '127.0.0.1', '', '{\"jobId\":2,\"misfirePolicy\":\"0\",\"params\":{},\"status\":\"1\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-27 16:05:09', 20);
INSERT INTO `sys_oper_log`
VALUES (147, '定时任务', 2, 'com.spzx.job.controller.SysJobController.changeStatus()', 'PUT', 1, 'admin', NULL,
        '/job/changeStatus', '127.0.0.1', '', '{\"jobId\":1,\"misfirePolicy\":\"0\",\"params\":{},\"status\":\"1\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-27 16:05:13', 24);
INSERT INTO `sys_oper_log`
VALUES (148, '菜单管理', 1, 'com.spzx.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu',
        '127.0.0.1', '',
        '{\"children\":[],\"component\":\"base/region/index\",\"createBy\":\"admin\",\"icon\":\"tab\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"地区管理\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2008,\"path\":\"region\",\"perms\":\"user:region:list\",\"status\":\"0\",\"visible\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-27 16:21:46', 10);
INSERT INTO `sys_oper_log`
VALUES (149, '菜单管理', 1, 'com.spzx.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu',
        '127.0.0.1', '',
        '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"chart\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"订单管理\",\"menuType\":\"M\",\"orderNum\":8,\"params\":{},\"parentId\":0,\"path\":\"order\",\"status\":\"0\",\"visible\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-27 16:23:50', 8);
INSERT INTO `sys_oper_log`
VALUES (150, '订单', 5, 'com.spzx.order.controller.OrderInfoController.export()', 'POST', 1, 'admin', NULL,
        '/orderInfo/export', '127.0.0.1', '', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL,
        '2024-09-27 16:42:29', 1122);
INSERT INTO `sys_oper_log`
VALUES (151, '代码生成', 6, 'com.spzx.gen.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL,
        '/gen/importTable', '127.0.0.1', '', '{\"tables\":\"order_log\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0,
        NULL, '2024-10-14 11:19:52', 180);
INSERT INTO `sys_oper_log`
VALUES (152, '代码生成', 6, 'com.spzx.gen.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL,
        '/gen/importTable', '127.0.0.1', '', '{\"tables\":\"payment_info\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0,
        NULL, '2024-10-17 15:57:51', 193);
INSERT INTO `sys_oper_log`
VALUES (153, '订单', 5, 'com.spzx.order.controller.OrderInfoController.export()', 'POST', 1, 'admin', NULL,
        '/orderInfo/export', '127.0.0.1', '', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL,
        '2024-11-04 17:07:18', 1184);
INSERT INTO `sys_oper_log`
VALUES (154, '会员', 5, 'com.spzx.user.controller.UserInfoController.export()', 'POST', 1, 'admin', NULL,
        '/userInfo/export', '127.0.0.1', '', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL,
        '2024-11-05 09:59:14', 1285);
INSERT INTO `sys_oper_log`
VALUES (155, '品牌管理', 1, 'com.spzx.product.controller.BrandController.save()', 'POST', 1, 'admin', NULL, '/brand',
        '127.0.0.1', '',
        '{\"createBy\":\"admin\",\"id\":20,\"logo\":\"http://192.168.6.100:9000/spzx/2024/11/06/3631bce316fec01d_20241106091406A001.jpg\",\"name\":\"小霸王\",\"params\":{}}',
        '{\"msg\":\"操作成功\",\"code\":200,\"data\":1}', 0, NULL, '2024-11-06 09:14:08', 55);

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`
(
    `post_id`     bigint                                                        NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
    `post_code`   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL COMMENT '岗位编码',
    `post_name`   varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL COMMENT '岗位名称',
    `post_sort`   int                                                           NOT NULL COMMENT '显示顺序',
    `status`      char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci      NOT NULL COMMENT '状态（0正常 1停用）',
    `create_by`   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT '' COMMENT '创建者',
    `create_time` datetime                                                      NULL DEFAULT NULL COMMENT '创建时间',
    `update_by`   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT '' COMMENT '更新者',
    `update_time` datetime                                                      NULL DEFAULT NULL COMMENT '更新时间',
    `remark`      varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
    PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 5
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '岗位信息表'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post`
VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2024-09-18 07:43:32', '', NULL, '');
INSERT INTO `sys_post`
VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2024-09-18 07:43:32', '', NULL, '');
INSERT INTO `sys_post`
VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2024-09-18 07:43:32', '', NULL, '');
INSERT INTO `sys_post`
VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2024-09-18 07:43:32', '', NULL, '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`
(
    `role_id`             bigint                                                        NOT NULL AUTO_INCREMENT COMMENT '角色ID',
    `role_name`           varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL COMMENT '角色名称',
    `role_key`            varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色权限字符串',
    `role_sort`           int                                                           NOT NULL COMMENT '显示顺序',
    `data_scope`          char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci      NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
    `menu_check_strictly` tinyint(1)                                                    NULL DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
    `dept_check_strictly` tinyint(1)                                                    NULL DEFAULT 1 COMMENT '部门树选择项是否关联显示',
    `status`              char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci      NOT NULL COMMENT '角色状态（0正常 1停用）',
    `del_flag`            char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci      NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
    `create_by`           varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT '' COMMENT '创建者',
    `create_time`         datetime                                                      NULL DEFAULT NULL COMMENT '创建时间',
    `update_by`           varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT '' COMMENT '更新者',
    `update_time`         datetime                                                      NULL DEFAULT NULL COMMENT '更新时间',
    `remark`              varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
    PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 100
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '角色信息表'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role`
VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2024-09-18 07:43:32', '', NULL, '超级管理员');
INSERT INTO `sys_role`
VALUES (2, '普通角色', 'common', 2, '2', 1, 1, '0', '0', 'admin', '2024-09-18 07:43:32', 'admin', '2024-09-27 09:41:41',
        '普通角色');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`
(
    `role_id` bigint NOT NULL COMMENT '角色ID',
    `dept_id` bigint NOT NULL COMMENT '部门ID',
    PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '角色和部门关联表'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept`
VALUES (2, 100);
INSERT INTO `sys_role_dept`
VALUES (2, 101);
INSERT INTO `sys_role_dept`
VALUES (2, 103);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`
(
    `role_id` bigint NOT NULL COMMENT '角色ID',
    `menu_id` bigint NOT NULL COMMENT '菜单ID',
    PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '角色和菜单关联表'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu`
VALUES (2, 2006);
INSERT INTO `sys_role_menu`
VALUES (2, 2007);
INSERT INTO `sys_role_menu`
VALUES (2, 2008);
INSERT INTO `sys_role_menu`
VALUES (2, 2009);
INSERT INTO `sys_role_menu`
VALUES (2, 2010);
INSERT INTO `sys_role_menu`
VALUES (2, 2011);
INSERT INTO `sys_role_menu`
VALUES (2, 2012);
INSERT INTO `sys_role_menu`
VALUES (2, 2013);
INSERT INTO `sys_role_menu`
VALUES (2, 2014);
INSERT INTO `sys_role_menu`
VALUES (2, 2016);
INSERT INTO `sys_role_menu`
VALUES (2, 2017);
INSERT INTO `sys_role_menu`
VALUES (2, 2018);
INSERT INTO `sys_role_menu`
VALUES (2, 2019);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`
(
    `user_id`     bigint                                                        NOT NULL AUTO_INCREMENT COMMENT '用户ID',
    `dept_id`     bigint                                                        NULL DEFAULT NULL COMMENT '部门ID',
    `user_name`   varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL COMMENT '用户账号',
    `nick_name`   varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL COMMENT '用户昵称',
    `user_type`   varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci   NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
    `email`       varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT '' COMMENT '用户邮箱',
    `phonenumber` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT '' COMMENT '手机号码',
    `sex`         char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci      NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
    `avatar`      varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '头像地址',
    `password`    varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '密码',
    `status`      char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci      NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
    `del_flag`    char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci      NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
    `login_ip`    varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '最后登录IP',
    `login_date`  datetime                                                      NULL DEFAULT NULL COMMENT '最后登录时间',
    `create_by`   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT '' COMMENT '创建者',
    `create_time` datetime                                                      NULL DEFAULT NULL COMMENT '创建时间',
    `update_by`   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT '' COMMENT '更新者',
    `update_time` datetime                                                      NULL DEFAULT NULL COMMENT '更新时间',
    `remark`      varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
    PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 102
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '用户信息表'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user`
VALUES (1, 103, 'admin', '若依', '00', 'ry@163.com', '15888888888', '1', '',
        '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2024-09-18 07:43:32',
        'admin', '2024-09-18 07:43:32', '', NULL, '管理员');
INSERT INTO `sys_user`
VALUES (2, 105, 'ry', '若依', '00', 'ry@qq.com', '15666666666', '1', '',
        '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2024-09-18 07:43:32',
        'admin', '2024-09-18 07:43:32', '', NULL, '测试员');
INSERT INTO `sys_user`
VALUES (100, 103, 'zhangsan', '张三', '00', '', '', '0', '',
        '$2a$10$Nkelf5VeePS5Z5DYGvk63OzjWevDvzd4g3X3JMA/GsxZYKEi5huFy', '0', '0', '', NULL, 'admin',
        '2024-09-25 16:51:17', '', NULL, NULL);
INSERT INTO `sys_user`
VALUES (101, 105, 'lisi', '李四', '00', '', '', '0', '', '$2a$10$QvNoZ4ELXQGtdd20MG1bLeLlD7HhMxIJ8MIeTHQe10jIxD3bNVZy.',
        '0', '0', '', NULL, 'admin', '2024-09-25 16:53:54', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`
(
    `user_id` bigint NOT NULL COMMENT '用户ID',
    `post_id` bigint NOT NULL COMMENT '岗位ID',
    PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '用户与岗位关联表'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post`
VALUES (1, 1);
INSERT INTO `sys_user_post`
VALUES (2, 2);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`
(
    `user_id` bigint NOT NULL COMMENT '用户ID',
    `role_id` bigint NOT NULL COMMENT '角色ID',
    PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '用户和角色关联表'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role`
VALUES (1, 1);
INSERT INTO `sys_user_role`
VALUES (2, 2);
INSERT INTO `sys_user_role`
VALUES (100, 2);

SET FOREIGN_KEY_CHECKS = 1;
