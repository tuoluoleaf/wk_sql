/*
 Navicat Premium Data Transfer

 Source Server         : 192.168.6.100_spzx_3306
 Source Server Type    : MySQL
 Source Server Version : 80030
 Source Host           : 192.168.6.100:3306
 Source Schema         : spzx-config

 Target Server Type    : MySQL
 Target Server Version : 80030
 File Encoding         : 65001

 Date: 06/11/2024 11:54:45
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;


-- 切库
use `spzx-config`;

-- ----------------------------
-- Table structure for config_info
-- ----------------------------
DROP TABLE IF EXISTS `config_info`;
CREATE TABLE `config_info`
(
    `id`                 bigint                                                 NOT NULL AUTO_INCREMENT COMMENT 'id',
    `data_id`            varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'data_id',
    `group_id`           varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL     DEFAULT NULL,
    `content`            longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_bin     NOT NULL COMMENT 'content',
    `md5`                varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin  NULL     DEFAULT NULL COMMENT 'md5',
    `gmt_create`         datetime                                               NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `gmt_modified`       datetime                                               NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
    `src_user`           text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin         NULL COMMENT 'source user',
    `src_ip`             varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin  NULL     DEFAULT NULL COMMENT 'source ip',
    `app_name`           varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL     DEFAULT NULL,
    `tenant_id`          varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL     DEFAULT '' COMMENT '租户字段',
    `c_desc`             varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL     DEFAULT NULL,
    `c_use`              varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin  NULL     DEFAULT NULL,
    `effect`             varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin  NULL     DEFAULT NULL,
    `type`               varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin  NULL     DEFAULT NULL,
    `c_schema`           text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin         NULL,
    `encrypted_data_key` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin         NULL COMMENT '秘钥',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `uk_configinfo_datagrouptenant` (`data_id` ASC, `group_id` ASC, `tenant_id` ASC) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 29
  CHARACTER SET = utf8mb3
  COLLATE = utf8mb3_bin COMMENT = 'config_info'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of config_info
-- ----------------------------
INSERT INTO `config_info`
VALUES (20, 'application-dev.yml', 'DEFAULT_GROUP',
        'spring:\n  autoconfigure:\n    exclude: com.alibaba.druid.spring.boot.autoconfigure.DruidDataSourceAutoConfigure\n  mvc:\n    pathmatch:\n      matching-strategy: ant_path_matcher\n  cloud:\n    openfeign:\n      lazy-attributes-resolution: true #开启懒加载，否则启动报错\n      client:\n        config:\n          default:\n            connectTimeout: 30000\n            readTimeout: 30000\n            loggerLevel: basic\n# feign 配置\nfeign:\n  sentinel:\n    enabled: true\n\n# 暴露监控端点\nmanagement:\n  endpoints:\n    web:\n      exposure:\n        include: \'*\'\n',
        '615dc817b8b886a880db33cbce9e7bbf', '2024-01-29 02:47:42', '2024-02-29 00:32:56', '', '0:0:0:0:0:0:0:1', '', '',
        '', '', '', 'yaml', '', '');
INSERT INTO `config_info`
VALUES (21, 'sentinel-spzx-gateway', 'DEFAULT_GROUP',
        '[\r\n    {\r\n        \"resource\": \"ruoyi-auth\",\r\n        \"count\": 500,\r\n        \"grade\": 1,\r\n        \"limitApp\": \"default\",\r\n        \"strategy\": 0,\r\n        \"controlBehavior\": 0\r\n    },\r\n	{\r\n        \"resource\": \"ruoyi-system\",\r\n        \"count\": 1000,\r\n        \"grade\": 1,\r\n        \"limitApp\": \"default\",\r\n        \"strategy\": 0,\r\n        \"controlBehavior\": 0\r\n    },\r\n	{\r\n        \"resource\": \"ruoyi-gen\",\r\n        \"count\": 200,\r\n        \"grade\": 1,\r\n        \"limitApp\": \"default\",\r\n        \"strategy\": 0,\r\n        \"controlBehavior\": 0\r\n    },\r\n	{\r\n        \"resource\": \"ruoyi-job\",\r\n        \"count\": 300,\r\n        \"grade\": 1,\r\n        \"limitApp\": \"default\",\r\n        \"strategy\": 0,\r\n        \"controlBehavior\": 0\r\n    }\r\n]',
        '9f3a3069261598f74220bc47958ec252', '2024-01-29 02:47:42', '2024-01-29 02:47:42', NULL, '0:0:0:0:0:0:0:1', '',
        '', NULL, NULL, NULL, 'text', NULL, '');
INSERT INTO `config_info`
VALUES (22, 'spzx-auth-dev.yml', 'DEFAULT_GROUP',
        'spring:\n  data:\n    redis:\n      host: localhost\n      port: 6379\n      password:\n',
        '5d8bafabaff2585e2b9b235c65f89b9f', '2024-01-29 02:47:42', '2024-01-29 02:47:42', NULL, '0:0:0:0:0:0:0:1', '',
        '', NULL, NULL, NULL, 'yaml', NULL, '');
INSERT INTO `config_info`
VALUES (23, 'spzx-file-dev.yml', 'DEFAULT_GROUP',
        '# 本地文件上传    \nfile:\n    domain: http://127.0.0.1:9300\n    path: D:/ruoyi/uploadPath\n    prefix: /statics\n\n# FastDFS配置\nfdfs:\n  domain: http://8.129.231.12\n  soTimeout: 3000\n  connectTimeout: 2000\n  trackerList: 8.129.231.12:22122\n\n# Minio配置\nminio:\n  url: http://139.198.127.41:9000\n  accessKey: admin\n  secretKey: admin123456\n  bucketName: spzx',
        '87276494b6b2070dedd63cc16170bf80', '2024-01-29 02:47:42', '2024-01-29 02:47:42', NULL, '0:0:0:0:0:0:0:1', '',
        '', NULL, NULL, NULL, 'yaml', NULL, '');
INSERT INTO `config_info`
VALUES (24, 'spzx-gateway-dev.yml', 'DEFAULT_GROUP',
        'spring:\n  data:\n    redis:\n      host: localhost\n      port: 6379\n      password:\n  cloud:\n    gateway:\n      discovery:\n        locator:\n          lowerCaseServiceId: true\n          enabled: true\n      globalcors:\n        cors-configurations:\n          \'[/**]\':\n            allowedOriginPatterns: \"*\"\n            # 允许请求中携带的头信息\n            allowedHeaders: \"*\"\n            # 运行跨域的请求方式\n            allowedMethods: \"*\"\n            # 跨域检测的有效期,单位s\n            maxAge: 36000\n      routes:\n        # 认证中心\n        - id: spzx-auth\n          uri: lb://spzx-auth\n          predicates:\n            - Path=/auth/**\n          filters:\n            # 验证码处理\n            - CacheRequestFilter\n            - ValidateCodeFilter\n            - StripPrefix=1\n        # 代码生成\n        - id: spzx-gen\n          uri: lb://spzx-gen\n          predicates:\n            - Path=/code/**\n          filters:\n            - StripPrefix=1\n        # 定时任务\n        - id: spzx-job\n          uri: lb://spzx-job\n          predicates:\n            - Path=/schedule/**\n          filters:\n            - StripPrefix=1\n        # 系统模块\n        - id: spzx-system\n          uri: lb://spzx-system\n          predicates:\n            - Path=/system/**\n          filters:\n            - StripPrefix=1\n        # 文件服务\n        - id: spzx-file\n          uri: lb://spzx-file\n          predicates:\n            - Path=/file/**\n          filters:\n            - StripPrefix=1\n\n# 安全配置\nsecurity:\n  # 验证码\n  captcha:\n    enabled: true\n    type: math\n  # 防止XSS攻击\n  xss:\n    enabled: true\n    excludeUrls:\n      - /system/notice\n  # 不校验白名单\n  ignore:\n    whites:\n      - /auth/logout\n      - /auth/login\n      - /auth/register\n      - /*/v2/api-docs\n      - /csrf\n',
        '85ace0500f7bd885deb131bbf45fde18', '2024-01-29 02:47:42', '2024-01-29 07:01:19', '', '0:0:0:0:0:0:0:1', '', '',
        '', '', '', 'yaml', '', '');
INSERT INTO `config_info`
VALUES (25, 'spzx-gen-dev.yml', 'DEFAULT_GROUP',
        '# spring配置\nspring:\n  data:\n    redis:\n      host: localhost\n      port: 6379\n      password:\n  datasource:\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    url: jdbc:mysql://localhost:3306/spzx-system?useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=true&serverTimezone=GMT%2B8\n    username: root\n    password: root\n\nmybatis-plus:\n  mapper-locations: classpath*:mapper/**/*Mapper.xml\n  type-aliases-package: com.spzx.**.domain\n  configuration:\n    log-impl: org.apache.ibatis.logging.stdout.StdOutImpl # 查看日志\n  global-config:\n    db-config:\n      logic-delete-field: flag # 全局逻辑删除的实体字段名(since 3.3.0,配置后可以忽略不配置步骤2)\n      logic-delete-value: 2 # 逻辑已删除值(默认为 1)\n      logic-not-delete-value: 0 # 逻辑未删除值(默认为 0)\n\n# 代码生成\ngen:\n  # 作者\n  author: atguigu\n  # 默认生成包路径 system 需改成自己的模块名称 如 system monitor tool\n  packageName: com.spzx.product\n  # 自动去除表前缀，默认是false\n  autoRemovePre: false\n  # 表前缀（生成类名不会包含表前缀，多个用逗号分隔）\n  tablePrefix: \n',
        '02c1463988dfe7e047d49c347e502ff3', '2024-01-29 02:47:42', '2024-01-29 07:00:15', '', '0:0:0:0:0:0:0:1', '', '',
        '', '', '', 'yaml', '', '');
INSERT INTO `config_info`
VALUES (26, 'spzx-job-dev.yml', 'DEFAULT_GROUP',
        '# spring配置\nspring:\n  data:\n    redis:\n      host: localhost\n      port: 6379\n      password: \n  datasource:\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    url: jdbc:mysql://localhost:3306/spzx-system?characterEncoding=utf-8&useSSL=false\n    username: root\n    password: root\n\n# mybatis-plus配置\nmybatis-plus:\n  mapper-locations: classpath*:mapper/**/*Mapper.xml\n  type-aliases-package: com.ruoyi.**.domain\n  configuration:\n    log-impl: org.apache.ibatis.logging.stdout.StdOutImpl # 查看日志\n  global-config:\n    db-config:\n      logic-delete-field: flag # 全局逻辑删除的实体字段名(since 3.3.0,配置后可以忽略不配置步骤2)\n      logic-delete-value: 2 # 逻辑已删除值(默认为 1)\n      logic-not-delete-value: 0 # 逻辑未删除值(默认为 0)\n',
        '15a6a47c3354d73caf339b36b572d7d0', '2024-01-29 02:47:42', '2024-01-29 02:47:42', NULL, '0:0:0:0:0:0:0:1', '',
        '', NULL, NULL, NULL, 'yaml', NULL, '');
INSERT INTO `config_info`
VALUES (27, 'spzx-monitor-dev.yml', 'DEFAULT_GROUP',
        '# spring\nspring:\n  security:\n    user:\n      name: ruoyi\n      password: 123456\n  boot:\n    admin:\n      ui:\n        title: 若依服务状态监控\n',
        '6f122fd2bfb8d45f858e7d6529a9cd44', '2024-01-29 02:47:42', '2024-01-29 02:47:42', NULL, '0:0:0:0:0:0:0:1', '',
        '', NULL, NULL, NULL, 'yaml', NULL, '');
INSERT INTO `config_info`
VALUES (28, 'spzx-system-dev.yml', 'DEFAULT_GROUP',
        'mybatis-plus:\n  mapper-locations: classpath*:mapper/**/*Mapper.xml\n  type-aliases-package: com.spzx.**.domain\n  configuration:\n    log-impl: org.apache.ibatis.logging.stdout.StdOutImpl # 查看日志\n  global-config:\n    db-config:\n      logic-delete-field: flag # 全局逻辑删除的实体字段名(since 3.3.0,配置后可以忽略不配置步骤2)\n      logic-delete-value: 2 # 逻辑已删除值(默认为 1)\n      logic-not-delete-value: 0 # 逻辑未删除值(默认为 0)\n# spring配置\nspring:\n  data:\n    redis:\n      host: localhost\n      port: 6379\n      password:\n  datasource:\n    type: com.zaxxer.hikari.HikariDataSource\n    driver-class-name: com.mysql.jdbc.Driver\n    url: jdbc:mysql://localhost:3306/spzx-system?characterEncoding=utf-8&useSSL=false\n    username: root\n    password: root\n    hikari:\n      connection-test-query: SELECT 1\n      connection-timeout: 60000\n      idle-timeout: 500000\n      max-lifetime: 540000\n      maximum-pool-size: 10\n      minimum-idle: 5\n      pool-name: GuliHikariPool',
        '05ae136e1e2f2dbfe7452e22c3b35b4a', '2024-01-29 02:47:42', '2024-01-29 02:50:37', '', '0:0:0:0:0:0:0:1', '', '',
        '', '', '', 'yaml', '', '');

-- ----------------------------
-- Table structure for config_info_aggr
-- ----------------------------
DROP TABLE IF EXISTS `config_info_aggr`;
CREATE TABLE `config_info_aggr`
(
    `id`           bigint                                                 NOT NULL AUTO_INCREMENT COMMENT 'id',
    `data_id`      varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'data_id',
    `group_id`     varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'group_id',
    `datum_id`     varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'datum_id',
    `content`      longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_bin     NOT NULL COMMENT '内容',
    `gmt_modified` datetime                                               NOT NULL COMMENT '修改时间',
    `app_name`     varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
    `tenant_id`    varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '' COMMENT '租户字段',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `uk_configinfoaggr_datagrouptenantdatum` (`data_id` ASC, `group_id` ASC, `tenant_id` ASC, `datum_id` ASC) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8mb3
  COLLATE = utf8mb3_bin COMMENT = '增加租户字段'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of config_info_aggr
-- ----------------------------

-- ----------------------------
-- Table structure for config_info_beta
-- ----------------------------
DROP TABLE IF EXISTS `config_info_beta`;
CREATE TABLE `config_info_beta`
(
    `id`                 bigint                                                  NOT NULL AUTO_INCREMENT COMMENT 'id',
    `data_id`            varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin  NOT NULL COMMENT 'data_id',
    `group_id`           varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin  NOT NULL COMMENT 'group_id',
    `app_name`           varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin  NULL     DEFAULT NULL COMMENT 'app_name',
    `content`            longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_bin      NOT NULL COMMENT 'content',
    `beta_ips`           varchar(1024) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL     DEFAULT NULL COMMENT 'betaIps',
    `md5`                varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin   NULL     DEFAULT NULL COMMENT 'md5',
    `gmt_create`         datetime                                                NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `gmt_modified`       datetime                                                NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
    `src_user`           text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin          NULL COMMENT 'source user',
    `src_ip`             varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin   NULL     DEFAULT NULL COMMENT 'source ip',
    `tenant_id`          varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin  NULL     DEFAULT '' COMMENT '租户字段',
    `encrypted_data_key` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin          NULL COMMENT '秘钥',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `uk_configinfobeta_datagrouptenant` (`data_id` ASC, `group_id` ASC, `tenant_id` ASC) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8mb3
  COLLATE = utf8mb3_bin COMMENT = 'config_info_beta'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of config_info_beta
-- ----------------------------

-- ----------------------------
-- Table structure for config_info_tag
-- ----------------------------
DROP TABLE IF EXISTS `config_info_tag`;
CREATE TABLE `config_info_tag`
(
    `id`           bigint                                                 NOT NULL AUTO_INCREMENT COMMENT 'id',
    `data_id`      varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'data_id',
    `group_id`     varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'group_id',
    `tenant_id`    varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL     DEFAULT '' COMMENT 'tenant_id',
    `tag_id`       varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'tag_id',
    `app_name`     varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL     DEFAULT NULL COMMENT 'app_name',
    `content`      longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_bin     NOT NULL COMMENT 'content',
    `md5`          varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin  NULL     DEFAULT NULL COMMENT 'md5',
    `gmt_create`   datetime                                               NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `gmt_modified` datetime                                               NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
    `src_user`     text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin         NULL COMMENT 'source user',
    `src_ip`       varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin  NULL     DEFAULT NULL COMMENT 'source ip',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `uk_configinfotag_datagrouptenanttag` (`data_id` ASC, `group_id` ASC, `tenant_id` ASC, `tag_id` ASC) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8mb3
  COLLATE = utf8mb3_bin COMMENT = 'config_info_tag'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of config_info_tag
-- ----------------------------

-- ----------------------------
-- Table structure for config_tags_relation
-- ----------------------------
DROP TABLE IF EXISTS `config_tags_relation`;
CREATE TABLE `config_tags_relation`
(
    `id`        bigint                                                 NOT NULL COMMENT 'id',
    `tag_name`  varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'tag_name',
    `tag_type`  varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin  NULL DEFAULT NULL COMMENT 'tag_type',
    `data_id`   varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'data_id',
    `group_id`  varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'group_id',
    `tenant_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '' COMMENT 'tenant_id',
    `nid`       bigint                                                 NOT NULL AUTO_INCREMENT,
    PRIMARY KEY (`nid`) USING BTREE,
    UNIQUE INDEX `uk_configtagrelation_configidtag` (`id` ASC, `tag_name` ASC, `tag_type` ASC) USING BTREE,
    INDEX `idx_tenant_id` (`tenant_id` ASC) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8mb3
  COLLATE = utf8mb3_bin COMMENT = 'config_tag_relation'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of config_tags_relation
-- ----------------------------

-- ----------------------------
-- Table structure for group_capacity
-- ----------------------------
DROP TABLE IF EXISTS `group_capacity`;
CREATE TABLE `group_capacity`
(
    `id`                bigint UNSIGNED                                        NOT NULL AUTO_INCREMENT COMMENT '主键ID',
    `group_id`          varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '' COMMENT 'Group ID，空字符表示整个集群',
    `quota`             int UNSIGNED                                           NOT NULL DEFAULT 0 COMMENT '配额，0表示使用默认值',
    `usage`             int UNSIGNED                                           NOT NULL DEFAULT 0 COMMENT '使用量',
    `max_size`          int UNSIGNED                                           NOT NULL DEFAULT 0 COMMENT '单个配置大小上限，单位为字节，0表示使用默认值',
    `max_aggr_count`    int UNSIGNED                                           NOT NULL DEFAULT 0 COMMENT '聚合子配置最大个数，，0表示使用默认值',
    `max_aggr_size`     int UNSIGNED                                           NOT NULL DEFAULT 0 COMMENT '单个聚合数据的子配置大小上限，单位为字节，0表示使用默认值',
    `max_history_count` int UNSIGNED                                           NOT NULL DEFAULT 0 COMMENT '最大变更历史数量',
    `gmt_create`        datetime                                               NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `gmt_modified`      datetime                                               NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `uk_group_id` (`group_id` ASC) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8mb3
  COLLATE = utf8mb3_bin COMMENT = '集群、各Group容量信息表'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of group_capacity
-- ----------------------------

-- ----------------------------
-- Table structure for his_config_info
-- ----------------------------
DROP TABLE IF EXISTS `his_config_info`;
CREATE TABLE `his_config_info`
(
    `id`                 bigint UNSIGNED                                        NOT NULL,
    `nid`                bigint UNSIGNED                                        NOT NULL AUTO_INCREMENT,
    `data_id`            varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
    `group_id`           varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
    `app_name`           varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL     DEFAULT NULL COMMENT 'app_name',
    `content`            longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_bin     NOT NULL,
    `md5`                varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin  NULL     DEFAULT NULL,
    `gmt_create`         datetime                                               NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `gmt_modified`       datetime                                               NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `src_user`           text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin         NULL,
    `src_ip`             varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin  NULL     DEFAULT NULL,
    `op_type`            char(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin     NULL     DEFAULT NULL,
    `tenant_id`          varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL     DEFAULT '' COMMENT '租户字段',
    `encrypted_data_key` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin         NULL COMMENT '秘钥',
    PRIMARY KEY (`nid`) USING BTREE,
    INDEX `idx_gmt_create` (`gmt_create` ASC) USING BTREE,
    INDEX `idx_gmt_modified` (`gmt_modified` ASC) USING BTREE,
    INDEX `idx_did` (`data_id` ASC) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8mb3
  COLLATE = utf8mb3_bin COMMENT = '多租户改造'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of his_config_info
-- ----------------------------

-- ----------------------------
-- Table structure for permissions
-- ----------------------------
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions`
(
    `role`     varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL,
    `resource` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
    `action`   varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci   NOT NULL,
    UNIQUE INDEX `uk_role_permission` (`role` ASC, `resource` ASC, `action` ASC) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of permissions
-- ----------------------------

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles`
(
    `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
    `role`     varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
    UNIQUE INDEX `idx_user_role` (`username` ASC, `role` ASC) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles`
VALUES ('nacos', 'ROLE_ADMIN');

-- ----------------------------
-- Table structure for tenant_capacity
-- ----------------------------
DROP TABLE IF EXISTS `tenant_capacity`;
CREATE TABLE `tenant_capacity`
(
    `id`                bigint UNSIGNED                                        NOT NULL AUTO_INCREMENT COMMENT '主键ID',
    `tenant_id`         varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '' COMMENT 'Tenant ID',
    `quota`             int UNSIGNED                                           NOT NULL DEFAULT 0 COMMENT '配额，0表示使用默认值',
    `usage`             int UNSIGNED                                           NOT NULL DEFAULT 0 COMMENT '使用量',
    `max_size`          int UNSIGNED                                           NOT NULL DEFAULT 0 COMMENT '单个配置大小上限，单位为字节，0表示使用默认值',
    `max_aggr_count`    int UNSIGNED                                           NOT NULL DEFAULT 0 COMMENT '聚合子配置最大个数',
    `max_aggr_size`     int UNSIGNED                                           NOT NULL DEFAULT 0 COMMENT '单个聚合数据的子配置大小上限，单位为字节，0表示使用默认值',
    `max_history_count` int UNSIGNED                                           NOT NULL DEFAULT 0 COMMENT '最大变更历史数量',
    `gmt_create`        datetime                                               NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `gmt_modified`      datetime                                               NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `uk_tenant_id` (`tenant_id` ASC) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8mb3
  COLLATE = utf8mb3_bin COMMENT = '租户容量信息表'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tenant_capacity
-- ----------------------------

-- ----------------------------
-- Table structure for tenant_info
-- ----------------------------
DROP TABLE IF EXISTS `tenant_info`;
CREATE TABLE `tenant_info`
(
    `id`            bigint                                                 NOT NULL AUTO_INCREMENT COMMENT 'id',
    `kp`            varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'kp',
    `tenant_id`     varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '' COMMENT 'tenant_id',
    `tenant_name`   varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '' COMMENT 'tenant_name',
    `tenant_desc`   varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT 'tenant_desc',
    `create_source` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin  NULL DEFAULT NULL COMMENT 'create_source',
    `gmt_create`    bigint                                                 NOT NULL COMMENT '创建时间',
    `gmt_modified`  bigint                                                 NOT NULL COMMENT '修改时间',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `uk_tenant_info_kptenantid` (`kp` ASC, `tenant_id` ASC) USING BTREE,
    INDEX `idx_tenant_id` (`tenant_id` ASC) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8mb3
  COLLATE = utf8mb3_bin COMMENT = 'tenant_info'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tenant_info
-- ----------------------------

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`
(
    `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL,
    `password` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
    `enabled`  tinyint(1)                                                    NOT NULL,
    PRIMARY KEY (`username`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users`
VALUES ('nacos', '$2a$10$EuWPZHzz32dJN7jexM34MOeYirDdFAZm2kuWj7VEOJhhZkDrxfvUu', 1);

SET FOREIGN_KEY_CHECKS = 1;
