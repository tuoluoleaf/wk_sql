create table industry_category
(
    id            int auto_increment comment '主键id'
        primary key,
    industry_code varchar(10)                         null comment '行业代码',
    industry_name varchar(20)                         null comment '行业名称',
    create_time   timestamp default CURRENT_TIMESTAMP null comment '创建时间',
    create_user   varchar(20)                         null comment '创建人',
    update_time   timestamp                           null comment '更新时间',
    update_user   varchar(20)                         null comment '更新人'
)
    comment '行业分类';

INSERT INTO stock.industry_category (id, industry_code, industry_name, create_time, create_user, update_time, update_user) VALUES (69, '991337', '电子化学品', '2023-05-24 08:14:49', null, null, null);
INSERT INTO stock.industry_category (id, industry_code, industry_name, create_time, create_user, update_time, update_user) VALUES (70, '991329', '光伏设备', '2023-05-24 08:14:49', null, null, null);
INSERT INTO stock.industry_category (id, industry_code, industry_name, create_time, create_user, update_time, update_user) VALUES (71, '991344', '游戏', '2023-05-24 08:14:49', null, null, null);
INSERT INTO stock.industry_category (id, industry_code, industry_name, create_time, create_user, update_time, update_user) VALUES (72, '991334', '半导体', '2023-05-24 08:14:49', null, null, null);
INSERT INTO stock.industry_category (id, industry_code, industry_name, create_time, create_user, update_time, update_user) VALUES (73, '991027', '通用设备', '2023-05-24 08:14:49', null, null, null);
INSERT INTO stock.industry_category (id, industry_code, industry_name, create_time, create_user, update_time, update_user) VALUES (74, '991033', '仪器仪表', '2023-05-24 08:14:49', null, null, null);
INSERT INTO stock.industry_category (id, industry_code, industry_name, create_time, create_user, update_time, update_user) VALUES (75, '991308', '贵金属', '2023-05-24 08:14:49', null, null, null);
INSERT INTO stock.industry_category (id, industry_code, industry_name, create_time, create_user, update_time, update_user) VALUES (76, '991010', '公用事业', '2023-05-24 08:14:49', null, null, null);
INSERT INTO stock.industry_category (id, industry_code, industry_name, create_time, create_user, update_time, update_user) VALUES (77, '991300', '计算机设备', '2023-05-24 08:14:50', null, null, null);
INSERT INTO stock.industry_category (id, industry_code, industry_name, create_time, create_user, update_time, update_user) VALUES (78, '991137', '专业设备', '2023-05-24 08:14:50', null, null, null);
INSERT INTO stock.industry_category (id, industry_code, industry_name, create_time, create_user, update_time, update_user) VALUES (79, '991336', '光学光电子', '2023-05-24 08:14:50', null, null, null);
INSERT INTO stock.industry_category (id, industry_code, industry_name, create_time, create_user, update_time, update_user) VALUES (80, '991314', '通信设备', '2023-05-24 08:14:50', null, null, null);
INSERT INTO stock.industry_category (id, industry_code, industry_name, create_time, create_user, update_time, update_user) VALUES (81, '991015', '塑料制品', '2023-05-24 08:14:50', null, null, null);
INSERT INTO stock.industry_category (id, industry_code, industry_name, create_time, create_user, update_time, update_user) VALUES (82, '991335', '消费电子', '2023-05-24 08:14:50', null, null, null);
INSERT INTO stock.industry_category (id, industry_code, industry_name, create_time, create_user, update_time, update_user) VALUES (83, '991006', '电子元件', '2023-05-24 08:14:50', null, null, null);
INSERT INTO stock.industry_category (id, industry_code, industry_name, create_time, create_user, update_time, update_user) VALUES (84, '991147', '互联网服务', '2023-05-24 08:14:50', null, null, null);
INSERT INTO stock.industry_category (id, industry_code, industry_name, create_time, create_user, update_time, update_user) VALUES (85, '991321', '非金属材料', '2023-05-24 08:14:50', null, null, null);
INSERT INTO stock.industry_category (id, industry_code, industry_name, create_time, create_user, update_time, update_user) VALUES (86, '991328', '电机', '2023-05-24 08:14:50', null, null, null);
INSERT INTO stock.industry_category (id, industry_code, industry_name, create_time, create_user, update_time, update_user) VALUES (87, '991341', '专业服务', '2023-05-24 08:14:50', null, null, null);
INSERT INTO stock.industry_category (id, industry_code, industry_name, create_time, create_user, update_time, update_user) VALUES (88, '991312', '电网设备', '2023-05-24 08:14:50', null, null, null);
INSERT INTO stock.industry_category (id, industry_code, industry_name, create_time, create_user, update_time, update_user) VALUES (89, '991302', '玻璃玻纤', '2023-05-24 08:14:50', null, null, null);
INSERT INTO stock.industry_category (id, industry_code, industry_name, create_time, create_user, update_time, update_user) VALUES (90, '991011', '化学制品', '2023-05-24 08:14:50', null, null, null);
INSERT INTO stock.industry_category (id, industry_code, industry_name, create_time, create_user, update_time, update_user) VALUES (91, '991003', '电力', '2023-05-24 08:14:50', null, null, null);
INSERT INTO stock.industry_category (id, industry_code, industry_name, create_time, create_user, update_time, update_user) VALUES (92, '991332', '电源设备', '2023-05-24 08:14:50', null, null, null);
INSERT INTO stock.industry_category (id, industry_code, industry_name, create_time, create_user, update_time, update_user) VALUES (93, '991004', '软件开发', '2023-05-24 08:14:50', null, null, null);
INSERT INTO stock.industry_category (id, industry_code, industry_name, create_time, create_user, update_time, update_user) VALUES (94, '991320', '采掘行业', '2023-05-24 08:14:50', null, null, null);
INSERT INTO stock.industry_category (id, industry_code, industry_name, create_time, create_user, update_time, update_user) VALUES (95, '991002', '工程咨询服务', '2023-05-24 08:14:50', null, null, null);
INSERT INTO stock.industry_category (id, industry_code, industry_name, create_time, create_user, update_time, update_user) VALUES (96, '991032', '文化传媒', '2023-05-24 08:14:50', null, null, null);
INSERT INTO stock.industry_category (id, industry_code, industry_name, create_time, create_user, update_time, update_user) VALUES (97, '991331', '电池', '2023-05-24 08:14:50', null, null, null);
INSERT INTO stock.industry_category (id, industry_code, industry_name, create_time, create_user, update_time, update_user) VALUES (98, '991322', '化学原料', '2023-05-24 08:14:50', null, null, null);
INSERT INTO stock.industry_category (id, industry_code, industry_name, create_time, create_user, update_time, update_user) VALUES (99, '991325', '小金属', '2023-05-24 08:14:50', null, null, null);
INSERT INTO stock.industry_category (id, industry_code, industry_name, create_time, create_user, update_time, update_user) VALUES (100, '991310', '化纤类', '2023-05-24 08:14:50', null, null, null);
INSERT INTO stock.industry_category (id, industry_code, industry_name, create_time, create_user, update_time, update_user) VALUES (101, '991139', '环保行业', '2023-05-24 08:14:50', null, null, null);
INSERT INTO stock.industry_category (id, industry_code, industry_name, create_time, create_user, update_time, update_user) VALUES (102, '991140', '汽车零部件', '2023-05-24 08:14:50', null, null, null);
INSERT INTO stock.industry_category (id, industry_code, industry_name, create_time, create_user, update_time, update_user) VALUES (103, '991026', '交运设备', '2023-05-24 08:14:50', null, null, null);
INSERT INTO stock.industry_category (id, industry_code, industry_name, create_time, create_user, update_time, update_user) VALUES (104, '991135', '通信服务', '2023-05-24 08:14:50', null, null, null);
INSERT INTO stock.industry_category (id, industry_code, industry_name, create_time, create_user, update_time, update_user) VALUES (105, '991034', '有色', '2023-05-24 08:14:50', null, null, null);
INSERT INTO stock.industry_category (id, industry_code, industry_name, create_time, create_user, update_time, update_user) VALUES (106, '991142', '贸易行业', '2023-05-24 08:14:50', null, null, null);
INSERT INTO stock.industry_category (id, industry_code, industry_name, create_time, create_user, update_time, update_user) VALUES (107, '991035', '造纸印刷', '2023-05-24 08:14:50', null, null, null);
INSERT INTO stock.industry_category (id, industry_code, industry_name, create_time, create_user, update_time, update_user) VALUES (108, '991307', '家用轻工', '2023-05-24 08:14:50', null, null, null);
INSERT INTO stock.industry_category (id, industry_code, industry_name, create_time, create_user, update_time, update_user) VALUES (109, '991311', '农药兽药', '2023-05-24 08:14:50', null, null, null);
INSERT INTO stock.industry_category (id, industry_code, industry_name, create_time, create_user, update_time, update_user) VALUES (110, '991330', '风电设备', '2023-05-24 08:14:50', null, null, null);
INSERT INTO stock.industry_category (id, industry_code, industry_name, create_time, create_user, update_time, update_user) VALUES (111, '991324', '橡胶制品', '2023-05-24 08:14:50', null, null, null);
INSERT INTO stock.industry_category (id, industry_code, industry_name, create_time, create_user, update_time, update_user) VALUES (112, '991301', '包装材料', '2023-05-24 08:14:50', null, null, null);
INSERT INTO stock.industry_category (id, industry_code, industry_name, create_time, create_user, update_time, update_user) VALUES (113, '991141', '装修装饰', '2023-05-24 08:14:50', null, null, null);
INSERT INTO stock.industry_category (id, industry_code, industry_name, create_time, create_user, update_time, update_user) VALUES (114, '991143', '工程机械', '2023-05-24 08:14:50', null, null, null);
INSERT INTO stock.industry_category (id, industry_code, industry_name, create_time, create_user, update_time, update_user) VALUES (115, '991313', '水泥建材', '2023-05-24 08:14:50', null, null, null);
INSERT INTO stock.industry_category (id, industry_code, industry_name, create_time, create_user, update_time, update_user) VALUES (116, '991014', '家电类', '2023-05-24 08:14:51', null, null, null);
INSERT INTO stock.industry_category (id, industry_code, industry_name, create_time, create_user, update_time, update_user) VALUES (117, '991317', '珠宝首饰', '2023-05-24 08:14:51', null, null, null);
INSERT INTO stock.industry_category (id, industry_code, industry_name, create_time, create_user, update_time, update_user) VALUES (118, '991309', '航天航空', '2023-05-24 08:14:51', null, null, null);
INSERT INTO stock.industry_category (id, industry_code, industry_name, create_time, create_user, update_time, update_user) VALUES (119, '991326', '燃气', '2023-05-24 08:14:51', null, null, null);
INSERT INTO stock.industry_category (id, industry_code, industry_name, create_time, create_user, update_time, update_user) VALUES (120, '991021', '农牧饲渔', '2023-05-24 08:14:51', null, null, null);
INSERT INTO stock.industry_category (id, industry_code, industry_name, create_time, create_user, update_time, update_user) VALUES (121, '991008', '纺织服饰', '2023-05-24 08:14:51', null, null, null);
INSERT INTO stock.industry_category (id, industry_code, industry_name, create_time, create_user, update_time, update_user) VALUES (122, '991024', '装修建材', '2023-05-24 08:14:51', null, null, null);
INSERT INTO stock.industry_category (id, industry_code, industry_name, create_time, create_user, update_time, update_user) VALUES (123, '991028', '医疗服务', '2023-05-24 08:14:51', null, null, null);
INSERT INTO stock.industry_category (id, industry_code, industry_name, create_time, create_user, update_time, update_user) VALUES (124, '991327', '汽车整车', '2023-05-24 08:14:51', null, null, null);
INSERT INTO stock.industry_category (id, industry_code, industry_name, create_time, create_user, update_time, update_user) VALUES (125, '991025', '综合类', '2023-05-24 08:14:51', null, null, null);
INSERT INTO stock.industry_category (id, industry_code, industry_name, create_time, create_user, update_time, update_user) VALUES (126, '991304', '船舶制造', '2023-05-24 08:14:51', null, null, null);
INSERT INTO stock.industry_category (id, industry_code, industry_name, create_time, create_user, update_time, update_user) VALUES (127, '991339', '医疗器械', '2023-05-24 08:14:51', null, null, null);
INSERT INTO stock.industry_category (id, industry_code, industry_name, create_time, create_user, update_time, update_user) VALUES (128, '991144', '石油类', '2023-05-24 08:14:51', null, null, null);
INSERT INTO stock.industry_category (id, industry_code, industry_name, create_time, create_user, update_time, update_user) VALUES (129, '991319', '能源金属', '2023-05-24 08:14:51', null, null, null);
INSERT INTO stock.industry_category (id, industry_code, industry_name, create_time, create_user, update_time, update_user) VALUES (130, '991019', '煤炭', '2023-05-24 08:14:51', null, null, null);
INSERT INTO stock.industry_category (id, industry_code, industry_name, create_time, create_user, update_time, update_user) VALUES (131, '991306', '工程建设', '2023-05-24 08:14:51', null, null, null);
INSERT INTO stock.industry_category (id, industry_code, industry_name, create_time, create_user, update_time, update_user) VALUES (132, '991036', '券商类', '2023-05-24 08:14:51', null, null, null);
INSERT INTO stock.industry_category (id, industry_code, industry_name, create_time, create_user, update_time, update_user) VALUES (133, '991013', '食品饮料', '2023-05-24 08:14:51', null, null, null);
INSERT INTO stock.industry_category (id, industry_code, industry_name, create_time, create_user, update_time, update_user) VALUES (134, '991009', '钢铁类', '2023-05-24 08:14:51', null, null, null);
INSERT INTO stock.industry_category (id, industry_code, industry_name, create_time, create_user, update_time, update_user) VALUES (135, '991316', '化学制药', '2023-05-24 08:14:51', null, null, null);
INSERT INTO stock.industry_category (id, industry_code, industry_name, create_time, create_user, update_time, update_user) VALUES (136, '991305', '航运港口', '2023-05-24 08:14:51', null, null, null);
INSERT INTO stock.industry_category (id, industry_code, industry_name, create_time, create_user, update_time, update_user) VALUES (137, '991138', '化肥类', '2023-05-24 08:14:51', null, null, null);
INSERT INTO stock.industry_category (id, industry_code, industry_name, create_time, create_user, update_time, update_user) VALUES (138, '991333', '美容护理', '2023-05-24 08:14:51', null, null, null);
INSERT INTO stock.industry_category (id, industry_code, industry_name, create_time, create_user, update_time, update_user) VALUES (139, '991315', '教育', '2023-05-24 08:14:51', null, null, null);
INSERT INTO stock.industry_category (id, industry_code, industry_name, create_time, create_user, update_time, update_user) VALUES (140, '991342', '房地产服务', '2023-05-24 08:14:51', null, null, null);
INSERT INTO stock.industry_category (id, industry_code, industry_name, create_time, create_user, update_time, update_user) VALUES (141, '991289', '多元金融', '2023-05-24 08:14:51', null, null, null);
INSERT INTO stock.industry_category (id, industry_code, industry_name, create_time, create_user, update_time, update_user) VALUES (142, '991136', '物流行业', '2023-05-24 08:14:51', null, null, null);
INSERT INTO stock.industry_category (id, industry_code, industry_name, create_time, create_user, update_time, update_user) VALUES (143, '991031', '商业百货', '2023-05-24 08:14:51', null, null, null);
INSERT INTO stock.industry_category (id, industry_code, industry_name, create_time, create_user, update_time, update_user) VALUES (144, '991340', '医药商业', '2023-05-24 08:14:51', null, null, null);
INSERT INTO stock.industry_category (id, industry_code, industry_name, create_time, create_user, update_time, update_user) VALUES (145, '991343', '生物制品', '2023-05-24 08:14:51', null, null, null);
INSERT INTO stock.industry_category (id, industry_code, industry_name, create_time, create_user, update_time, update_user) VALUES (146, '991020', '酒类', '2023-05-24 08:14:51', null, null, null);
INSERT INTO stock.industry_category (id, industry_code, industry_name, create_time, create_user, update_time, update_user) VALUES (147, '991018', '旅游酒店', '2023-05-24 08:14:51', null, null, null);
INSERT INTO stock.industry_category (id, industry_code, industry_name, create_time, create_user, update_time, update_user) VALUES (148, '991338', '中药', '2023-05-24 08:14:51', null, null, null);
INSERT INTO stock.industry_category (id, industry_code, industry_name, create_time, create_user, update_time, update_user) VALUES (149, '991323', '汽车服务', '2023-05-24 08:14:51', null, null, null);
INSERT INTO stock.industry_category (id, industry_code, industry_name, create_time, create_user, update_time, update_user) VALUES (150, '991016', '铁路公路', '2023-05-24 08:14:51', null, null, null);
INSERT INTO stock.industry_category (id, industry_code, industry_name, create_time, create_user, update_time, update_user) VALUES (151, '991017', '银行类', '2023-05-24 08:14:51', null, null, null);
INSERT INTO stock.industry_category (id, industry_code, industry_name, create_time, create_user, update_time, update_user) VALUES (152, '991007', '房地产开发', '2023-05-24 08:14:51', null, null, null);
INSERT INTO stock.industry_category (id, industry_code, industry_name, create_time, create_user, update_time, update_user) VALUES (153, '991318', '航空机场', '2023-05-24 08:14:51', null, null, null);
INSERT INTO stock.industry_category (id, industry_code, industry_name, create_time, create_user, update_time, update_user) VALUES (154, '991255', '保险类', '2023-05-24 08:14:51', null, null, null);