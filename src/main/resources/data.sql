SET GLOBAL FOREIGN_KEY_CHECKS=0;

delete from location;

INSERT INTO location (id, district) values ('1','Distric 1');
INSERT INTO location (id, district) values ('2','Distric 2');
INSERT INTO location (id, district) values ('3','Distric 3');
INSERT INTO location (id, district) values ('4','Distric 4');
INSERT INTO location (id, district) values ('5','Distric 5');
INSERT INTO location (id, district) values ('6','Distric 6');
INSERT INTO location (id, district) values ('7','Distric 7');
INSERT INTO location (id, district) values ('8','Distric 8');
INSERT INTO location (id, district) values ('9','Distric 9');
INSERT INTO location (id, district) values ('10','Distric 10');
INSERT INTO location (id, district) values ('11','Distric 11');
INSERT INTO location (id, district) values ('12','Distric 12');
INSERT INTO location (id, district) values ('13','Binh Thanh District');
INSERT INTO location (id, district) values ('14','Go Vap District');
INSERT INTO location (id, district) values ('15','Thu Duc Distric');
INSERT INTO location (id, district) values ('16','Phu Nhuan District');
INSERT INTO location (id, district) values ('17','Tan Binh District');
INSERT INTO location (id, district) values ('18','Tan Phu District');
INSERT INTO location (id, district) values ('19','Binh Tan District');

delete from users;

INSERT INTO users (id, first_name, last_name, phone, email, username, password) VALUES ('1','Luan','Bui Hoang','0123456789','luan@test.com','luan','$2a$10$3WQPws9o2zN4E1XAs1nKc.vWKUTtV/uRgvOAJ6foqrHcs/rqmWjLi');
INSERT INTO users (id, first_name, last_name, phone, email, username, password) VALUES ('2','Quang','Vo Ho Nhat Quang','0123456789','quang@test.com','quang','$2a$10$PX0HS/Lbb2M9Kw/yRhaYuOgRXKbA4KGARvdFZHRsAp2.nX6Fzm9je');
INSERT INTO users (id, first_name, last_name, phone, email, username, password) VALUES ('3','Trien','Le Khue','0123456789','trien@test.com','trien','$2a$10$kpUWFMHUOEuwTYX9gZMX1Ow0kEb7doAHJKt3akPEwZeBpuO0eGzRW');
INSERT INTO users (id, first_name, last_name, phone, email, username, password) VALUES ('4','USER_TEST_1','','','user1@test.com','user1','$2a$10$l8AUEdN0kyAdiuRuUbVT7OkC7WXDBIR.ClAPSH5CjYrnm4da5DfxC');
INSERT INTO users (id, first_name, last_name, phone, email, username, password) VALUES ('5','USER_TEST_2','','','user2@test.com','user2','$2a$10$QssIrlqAkbXohRrWBcWPMOZwSIxWZTwX8ztc5vyN/NUmBfLEmwE.y');

delete from user_role;

INSERT INTO user_role (user_id, role_id) VALUES ('1','2');
INSERT INTO user_role (user_id, role_id) VALUES ('2','2');
INSERT INTO user_role (user_id, role_id) VALUES ('3','2');
INSERT INTO user_role (user_id, role_id) VALUES ('4','1');
INSERT INTO user_role (user_id, role_id) VALUES ('5','1');

delete from category;

INSERT INTO category (id, category_name) VALUES ('1','Buffet');
INSERT INTO category (id, category_name) VALUES ('2','BBQ');
INSERT INTO category (id, category_name) VALUES ('3','Korean');
INSERT INTO category (id, category_name) VALUES ('4','Shushi');
INSERT INTO category (id, category_name) VALUES ('5','Pizza');
INSERT INTO category (id, category_name) VALUES ('6','Seafood');
INSERT INTO category (id, category_name) VALUES ('7','Lounge');
INSERT INTO category (id, category_name) VALUES ('8','Bar');
INSERT INTO category (id, category_name) VALUES ('9','Salad');
INSERT INTO category (id, category_name) VALUES ('10','Fish');
INSERT INTO category (id, category_name) VALUES ('11','Family');
INSERT INTO category (id, category_name) VALUES ('12','Dimsum');
INSERT INTO category (id, category_name) VALUES ('13','Vietnamese');
INSERT INTO category (id, category_name) VALUES ('14','Dessert');
INSERT INTO category (id, category_name) VALUES ('15','Hamburger');
INSERT INTO category (id, category_name) VALUES ('16','Coffee');
INSERT INTO category (id, category_name) VALUES ('17','Sandwich');
INSERT INTO category (id, category_name) VALUES ('18','Steak');
INSERT INTO category (id, category_name) VALUES ('19','Luxury');
INSERT INTO category (id, category_name) VALUES ('20','Chinese');
INSERT INTO category (id, category_name) VALUES ('21','Japanese');

delete from restaurant ;

INSERT INTO restaurant (id, address, img, name, phone) VALUES ('1','2 Phan Van Chuong St, Tan Phu Ward, District 7, HCM city', '/images/restaurants/red-chilli-seafood/','Red Chilli Seafood Buffet','(028) 3829.5334');
INSERT INTO restaurant (id, address, img, name, phone) VALUES ('2','148 Hai Ba Trung St, Da Kao Ward, District 1, HCM city', '','Hoang Yen Buffet','');
INSERT INTO restaurant (id, address, img, name, phone) VALUES ('3','235 Nguyen Van Cu St, Nguyen Cu Trinh Ward, District 1, HCM city', '','Ming Court','(028) 3929 5520');
INSERT INTO restaurant (id, address, img, name, phone) VALUES ('4','195-197 Phan Xich Long St, Phu Nhuan District, HCM city', '','San Fu Lou','(028) 35176168');
INSERT INTO restaurant (id, address, img, name, phone) VALUES ('5','52 Mac Dinh Chi St, Da Kao Ward, District 1, HCM city', '','Pachi Pachi','(028) 6295 9294');

delete from restaurant_category;

INSERT INTO restaurant_category (restaurant_id, category_id) VALUES ('1','6');
INSERT INTO restaurant_category (restaurant_id, category_id) VALUES ('1','1');
INSERT INTO restaurant_category (restaurant_id, category_id) VALUES ('2','1');
INSERT INTO restaurant_category (restaurant_id, category_id) VALUES ('2','11');
INSERT INTO restaurant_category (restaurant_id, category_id) VALUES ('2','13');
INSERT INTO restaurant_category (restaurant_id, category_id) VALUES ('3','11');
INSERT INTO restaurant_category (restaurant_id, category_id) VALUES ('3','19');
INSERT INTO restaurant_category (restaurant_id, category_id) VALUES ('3','20');
INSERT INTO restaurant_category (restaurant_id, category_id) VALUES ('4','12');
INSERT INTO restaurant_category (restaurant_id, category_id) VALUES ('4','20');
INSERT INTO restaurant_category (restaurant_id, category_id) VALUES ('4','11');
INSERT INTO restaurant_category (restaurant_id, category_id) VALUES ('5','2');
INSERT INTO restaurant_category (restaurant_id, category_id) VALUES ('5','19');
INSERT INTO restaurant_category (restaurant_id, category_id) VALUES ('5','21');

