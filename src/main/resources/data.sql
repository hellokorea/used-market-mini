-- 외래 키 제약 조건 비활성화
SET FOREIGN_KEY_CHECKS = 0;

truncate comment;
truncate address;
truncate board;
truncate member;
truncate group_code;
truncate code;

-- 외래 키 제약 조건 다시 활성화
SET FOREIGN_KEY_CHECKS = 1;


-- Insert statements for Users
INSERT INTO member (id, email, nickname, password, code, group_code) VALUES (1, 'jeongdong@google.com', 'jeongdong', '$2a$10$KyM8TTg2dL6tWzudPjfqvuas3I6dwUZ2dbVeUSQSxu4YhoJU1Ox7y', '010','020');
INSERT INTO member (id, email, nickname, password, code, group_code) VALUES (2, 'youngchul@google.com', 'youngchul', '$2a$10$KyM8TTg2dL6tWzudPjfqvuas3I6dwUZ2dbVeUSQSxu4YhoJU1Ox7y', '010','020');
INSERT INTO member (id, email, nickname, password, code, group_code) VALUES (3, 'sieun@google.com', 'sieun', '$2a$10$KyM8TTg2dL6tWzudPjfqvuas3I6dwUZ2dbVeUSQSxu4YhoJU1Ox7y', '010','020');
INSERT INTO member (id, email, nickname, password, code, group_code) VALUES (4, 'minah@naver.com', 'minah', '$2a$10$KyM8TTg2dL6tWzudPjfqvuas3I6dwUZ2dbVeUSQSxu4YhoJU1Ox7y', '010','020');
INSERT INTO member (id, email, nickname, password, code, group_code) VALUES (5, 'seunghee@naver.com', 'seunghee', '$2a$10$KyM8TTg2dL6tWzudPjfqvuas3I6dwUZ2dbVeUSQSxu4YhoJU1Ox7y', '010','020');
INSERT INTO member (id, email, nickname, password, code, group_code) VALUES (6, 'asdf@asdf.com', 'asdf', '$2a$10$KyM8TTg2dL6tWzudPjfqvuas3I6dwUZ2dbVeUSQSxu4YhoJU1Ox7y', '010','020');

-- Insert statements for Addresses
INSERT INTO address (member_id, detail, street, zipcode) VALUES (1, '1동 203호', '서울특별시 종로구 세종대로 175', '03172');
INSERT INTO address (member_id, detail, street, zipcode) VALUES (2, '2동 203호', '서울특별시 중구 명동길 20', '04536');
INSERT INTO address (member_id, detail, street, zipcode) VALUES (3, '3동 203호', '서울특별시 강남구 테헤란로 521', '06164');
INSERT INTO address (member_id, detail, street, zipcode) VALUES (4, '4동 203호', '부산광역시 해운대구 해운대로 620', '48093');
INSERT INTO address (member_id, detail, street, zipcode) VALUES (5, '5동 203호', '대구광역시 중구 달구벌대로 2077', '41911');
INSERT INTO address (member_id, detail, street, zipcode) VALUES (6, '6동 101호', '서울특별시 서초구 강남대로 373', '06524');

-- Insert statements for Boards
INSERT INTO board (id, created_at, updated_at, code, group_code, content, price, title, member_id) VALUES (1, '2024-09-01 00:00:00', '2024-09-01 00:00:00', '010', '010', '이 가격에 이 물건은 정말 저렴합니다.', 55000, '물품 1 판매', 3);
INSERT INTO board (id, created_at, updated_at, code, group_code, content, price, title, member_id) VALUES (2, '2024-09-01 11:25:42', '2024-09-19 17:01:50', '020', '010', '가격을 낮췄습니다. 빠른 거래 원해요.', 83000, '물품 2 판매', 3);
INSERT INTO board (id, created_at, updated_at, code, group_code, content, price, title, member_id) VALUES (3, '2024-09-01 22:51:25', '2024-09-02 00:36:25', '020', '010', '가격을 낮췄습니다. 빠른 거래 원해요.', 21000, '물품 3 판매', 2);
INSERT INTO board (id, created_at, updated_at, code, group_code, content, price, title, member_id) VALUES (4, '2024-09-02 10:17:08', '2024-09-02 12:58:08', '020', '010', '직거래만 가능합니다. 안전하게 거래해요.', 7000, '물품 4 판매', 4);
INSERT INTO board (id, created_at, updated_at, code, group_code, content, price, title, member_id) VALUES (5, '2024-09-02 21:42:51', '2024-09-19 16:51:50', '020', '010', '급하게 처분합니다. 상태는 양호합니다.', 79000, '물품 5 판매', 4);
INSERT INTO board (id, created_at, updated_at, code, group_code, content, price, title, member_id) VALUES (6, '2024-09-03 09:08:34', '2024-09-03 09:08:34', '010', '010', '이 물품은 사용한 지 1년밖에 되지 않았습니다.', 30000, '물품 6 판매', 3);
INSERT INTO board (id, created_at, updated_at, code, group_code, content, price, title, member_id) VALUES (7, '2024-09-03 20:34:16', '2024-09-03 23:00:16', '020', '010', '이 가격에 이 물건은 정말 저렴합니다.', 27000, '물품 7 판매', 3);
INSERT INTO board (id, created_at, updated_at, code, group_code, content, price, title, member_id) VALUES (8, '2024-09-04 07:59:59', '2024-09-04 07:59:59', '010', '010', '상태는 매우 좋습니다. 직접 확인 가능합니다.', 75000, '물품 8 판매', 4);
INSERT INTO board (id, created_at, updated_at, code, group_code, content, price, title, member_id) VALUES (9, '2024-09-04 19:25:42', '2024-09-04 22:08:42', '020', '010', '직거래만 가능합니다. 안전하게 거래해요.', 66000, '물품 9 판매', 1);
INSERT INTO board (id, created_at, updated_at, code, group_code, content, price, title, member_id) VALUES (10, '2024-09-05 06:51:25', '2024-09-05 09:30:25', '020', '010', '급하게 처분합니다. 상태는 양호합니다.', 97000, '물품 10 판매', 5);
INSERT INTO board (id, created_at, updated_at, code, group_code, content, price, title, member_id) VALUES (11, '2024-09-05 18:17:08', '2024-09-05 18:17:08', '010', '010', '관심 있으신 분은 메시지 주세요.', 23000, '물품 11 판매', 1);
INSERT INTO board (id, created_at, updated_at, code, group_code, content, price, title, member_id) VALUES (12, '2024-09-06 05:42:51', '2024-09-06 08:20:51', '020', '010', '직거래만 가능합니다. 안전하게 거래해요.', 52000, '물품 12 판매', 3);
INSERT INTO board (id, created_at, updated_at, code, group_code, content, price, title, member_id) VALUES (13, '2024-09-06 17:08:33', '2024-09-06 17:08:33', '010', '010', '상태는 매우 좋습니다. 직접 확인 가능합니다.', 54000, '물품 13 판매', 1);
INSERT INTO board (id, created_at, updated_at, code, group_code, content, price, title, member_id) VALUES (14, '2024-09-07 04:34:16', '2024-09-19 17:06:50', '020', '010', '거의 새것입니다. 관심 있으시면 연락 주세요.', 28000, '물품 14 판매', 1);
INSERT INTO board (id, created_at, updated_at, code, group_code, content, price, title, member_id) VALUES (15, '2024-09-07 15:59:59', '2024-09-07 15:59:59', '010', '010', '구매 후 몇 번 쓰지 않았습니다.', 45000, '물품 15 판매', 3);
INSERT INTO board (id, created_at, updated_at, code, group_code, content, price, title, member_id) VALUES (16, '2024-09-08 03:25:42', '2024-09-08 03:25:42', '010', '010', '관심 있으신 분은 메시지 주세요.', 39000, '물품 16 판매', 1);
INSERT INTO board (id, created_at, updated_at, code, group_code, content, price, title, member_id) VALUES (17, '2024-09-08 14:51:25', '2024-09-08 17:02:25', '020', '010', '상태는 매우 좋습니다. 직접 확인 가능합니다.', 9000, '물품 17 판매', 3);
INSERT INTO board (id, created_at, updated_at, code, group_code, content, price, title, member_id) VALUES (18, '2024-09-09 02:17:08', '2024-09-19 16:31:50', '020', '010', '가격을 낮췄습니다. 빠른 거래 원해요.', 80000, '물품 18 판매', 3);
INSERT INTO board (id, created_at, updated_at, code, group_code, content, price, title, member_id) VALUES (19, '2024-09-09 13:42:50', '2024-09-09 16:17:50', '020', '010', '거의 새것입니다. 관심 있으시면 연락 주세요.', 20000, '물품 19 판매', 2);
INSERT INTO board (id, created_at, updated_at, code, group_code, content, price, title, member_id) VALUES (20, '2024-09-10 01:08:33', '2024-09-10 01:08:33', '010', '010', '관심 있으신 분은 메시지 주세요.', 29000, '물품 20 판매', 3);
INSERT INTO board (id, created_at, updated_at, code, group_code, content, price, title, member_id) VALUES (21, '2024-09-10 12:34:16', '2024-09-19 16:41:50', '020', '010', '거의 새것입니다. 관심 있으시면 연락 주세요.', 33000, '물품 21 판매', 1);
INSERT INTO board (id, created_at, updated_at, code, group_code, content, price, title, member_id) VALUES (22, '2024-09-10 23:59:59', '2024-09-10 23:59:59', '010', '010', '이 가격에 이 물건은 정말 저렴합니다.', 46000, '물품 22 판매', 5);
INSERT INTO board (id, created_at, updated_at, code, group_code, content, price, title, member_id) VALUES (23, '2024-09-11 11:25:42', '2024-09-11 11:25:42', '010', '010', '가격을 낮췄습니다. 빠른 거래 원해요.', 31000, '물품 23 판매', 3);
INSERT INTO board (id, created_at, updated_at, code, group_code, content, price, title, member_id) VALUES (24, '2024-09-11 22:51:25', '2024-09-12 01:18:25', '020', '010', '급하게 처분합니다. 상태는 양호합니다.', 17000, '물품 24 판매', 2);
INSERT INTO board (id, created_at, updated_at, code, group_code, content, price, title, member_id) VALUES (25, '2024-09-12 10:17:07', '2024-09-12 10:17:07', '010', '010', '사용감이 있지만, 성능에 문제는 없습니다.', 82000, '물품 25 판매', 1);
INSERT INTO board (id, created_at, updated_at, code, group_code, content, price, title, member_id) VALUES (26, '2024-09-12 21:42:50', '2024-09-19 16:36:50', '020', '010', '직거래만 가능합니다. 안전하게 거래해요.', 63000, '물품 26 판매', 4);
INSERT INTO board (id, created_at, updated_at, code, group_code, content, price, title, member_id) VALUES (27, '2024-09-13 09:08:33', '2024-09-13 09:08:33', '010', '010', '사용감이 있지만, 성능에 문제는 없습니다.', 62000, '물품 27 판매', 5);
INSERT INTO board (id, created_at, updated_at, code, group_code, content, price, title, member_id) VALUES (28, '2024-09-13 20:34:16', '2024-09-13 20:34:16', '010', '010', '거의 새것입니다. 관심 있으시면 연락 주세요.', 19000, '물품 28 판매', 3);
INSERT INTO board (id, created_at, updated_at, code, group_code, content, price, title, member_id) VALUES (29, '2024-09-14 07:59:59', '2024-09-14 07:59:59', '010', '010', '이 물품은 사용한 지 1년밖에 되지 않았습니다.', 65000, '물품 29 판매', 2);
INSERT INTO board (id, created_at, updated_at, code, group_code, content, price, title, member_id) VALUES (30, '2024-09-14 19:25:42', '2024-09-14 20:39:42', '020', '010', '이 물품은 사용한 지 1년밖에 되지 않았습니다.', 42000, '물품 30 판매', 2);
INSERT INTO board (id, created_at, updated_at, code, group_code, content, price, title, member_id) VALUES (31, '2024-09-15 06:51:24', '2024-09-19 16:26:50', '020', '010', '이 가격에 이 물건은 정말 저렴합니다.', 31000, '물품 31 판매', 1);
INSERT INTO board (id, created_at, updated_at, code, group_code, content, price, title, member_id) VALUES (32, '2024-09-15 18:17:07', '2024-09-15 18:17:07', '010', '010', '급하게 처분합니다. 상태는 양호합니다.', 73000, '물품 32 판매', 4);
INSERT INTO board (id, created_at, updated_at, code, group_code, content, price, title, member_id) VALUES (33, '2024-09-16 05:42:50', '2024-09-16 05:42:50', '010', '010', '가격을 낮췄습니다. 빠른 거래 원해요.', 45000, '물품 33 판매', 3);
INSERT INTO board (id, created_at, updated_at, code, group_code, content, price, title, member_id) VALUES (34, '2024-09-16 17:08:33', '2024-09-16 17:08:33', '010', '010', '이 물품은 사용한 지 1년밖에 되지 않았습니다.', 24000, '물품 34 판매', 1);
INSERT INTO board (id, created_at, updated_at, code, group_code, content, price, title, member_id) VALUES (35, '2024-09-17 04:34:16', '2024-09-17 07:01:16', '020', '010', '가격을 낮췄습니다. 빠른 거래 원해요.', 40000, '물품 35 판매', 3);
INSERT INTO board (id, created_at, updated_at, code, group_code, content, price, title, member_id) VALUES (36, '2024-09-17 15:59:59', '2024-09-17 15:59:59', '010', '010', '거의 새것입니다. 관심 있으시면 연락 주세요.', 76000, '물품 36 판매', 2);
INSERT INTO board (id, created_at, updated_at, code, group_code, content, price, title, member_id) VALUES (37, '2024-09-18 03:25:41', '2024-09-18 06:03:41', '020', '010', '직거래만 가능합니다. 안전하게 거래해요.', 42000, '물품 37 판매', 3);
INSERT INTO board (id, created_at, updated_at, code, group_code, content, price, title, member_id) VALUES (38, '2024-09-18 14:51:24', '2024-09-18 14:51:24', '010', '010', '관심 있으신 분은 메시지 주세요.', 72000, '물품 38 판매', 5);
INSERT INTO board (id, created_at, updated_at, code, group_code, content, price, title, member_id) VALUES (39, '2024-09-19 02:17:07', '2024-09-19 04:42:07', '020', '010', '이 가격에 이 물건은 정말 저렴합니다.', 88000, '물품 39 판매', 5);
INSERT INTO board (id, created_at, updated_at, code, group_code, content, price, title, member_id) VALUES (40, '2024-09-19 13:42:50', '2024-09-19 16:16:50', '020', '010', '관심 있으신 분은 메시지 주세요.', 59000, '물품 40 판매', 4);
INSERT INTO board (id, created_at, updated_at, code, group_code, content, price, title, member_id) VALUES (41, '2024-09-20 01:08:33', '2024-09-20 01:08:33', '010', '010', '이 물품은 사용한 지 1년밖에 되지 않았습니다.', 18000, '물품 41 판매', 6);
INSERT INTO board (id, created_at, updated_at, code, group_code, content, price, title, member_id) VALUES (42, '2024-09-20 12:34:16', '2024-09-20 15:19:16', '020', '010', '가격을 낮췄습니다. 빠른 거래 원해요.', 50000, '물품 42 판매', 6);
INSERT INTO board (id, created_at, updated_at, code, group_code, content, price, title, member_id) VALUES (43, '2024-09-20 12:34:16', '2024-09-20 15:19:16', '020', '010', '가격을 낮췄습니다. 빠른 거래 원해요.', 50000, '물품 42 판매', 6);
INSERT INTO board (id, created_at, updated_at, code, group_code, content, price, title, member_id) VALUES (44, '2024-09-20 12:34:16', '2024-09-20 15:19:16', '020', '010', '가격을 낮췄습니다. 빠른 거래 원해요.', 50000, '물품 42 판매', 6);
INSERT INTO board (id, created_at, updated_at, code, group_code, content, price, title, member_id) VALUES (45, '2024-09-20 12:34:16', '2024-09-20 15:19:16', '020', '010', '가격을 낮췄습니다. 빠른 거래 원해요.', 50000, '물품 42 판매', 6);
INSERT INTO board (id, created_at, updated_at, code, group_code, content, price, title, member_id) VALUES (46, '2024-09-20 12:34:16', '2024-09-20 15:19:16', '020', '010', '가격을 낮췄습니다. 빠른 거래 원해요.', 50000, '물품 42 판매', 6);
INSERT INTO board (id, created_at, updated_at, code, group_code, content, price, title, member_id) VALUES (47, '2024-09-20 12:34:16', '2024-09-20 15:19:16', '020', '010', '가격을 낮췄습니다. 빠른 거래 원해요.', 50000, '물품 42 판매', 6);
INSERT INTO board (id, created_at, updated_at, code, group_code, content, price, title, member_id) VALUES (48, '2024-09-20 12:34:16', '2024-09-20 15:19:16', '020', '010', '가격을 낮췄습니다. 빠른 거래 원해요.', 50000, '물품 42 판매', 6);
INSERT INTO board (id, created_at, updated_at, code, group_code, content, price, title, member_id) VALUES (49, '2024-09-20 12:34:16', '2024-09-20 15:19:16', '020', '010', '가격을 낮췄습니다. 빠른 거래 원해요.', 50000, '물품 42 판매', 6);
INSERT INTO board (id, created_at, updated_at, code, group_code, content, price, title, member_id) VALUES (50, '2024-09-20 12:34:16', '2024-09-20 15:19:16', '020', '010', '가격을 낮췄습니다. 빠른 거래 원해요.', 50000, '물품 42 판매', 6);

-- Insert statements for Comments
INSERT INTO comment (id, created_at, updated_at, content, board_id, member_id) VALUES (1, '2024-09-01 00:22:00', '2024-09-01 00:22:00', '사진 좀 더 올려주세요.', 1, 3);
INSERT INTO comment (id, created_at, updated_at, content, board_id, member_id) VALUES (2, '2024-09-01 00:24:00', '2024-09-01 00:24:00', '빠른 거래 원합니다.', 1, 1);
INSERT INTO comment (id, created_at, updated_at, content, board_id, member_id) VALUES (3, '2024-09-01 00:29:00', '2024-09-01 00:29:00', '가격 흥정 가능한가요?', 1, 1);
INSERT INTO comment (id, created_at, updated_at, content, board_id, member_id) VALUES (4, '2024-09-01 00:47:00', '2024-09-01 00:47:00', '사진 좀 더 올려주세요.', 1, 1);
INSERT INTO comment (id, created_at, updated_at, content, board_id, member_id) VALUES (5, '2024-09-01 00:52:00', '2024-09-01 00:52:00', '빠른 거래 원합니다.', 1, 3);
INSERT INTO comment (id, created_at, updated_at, content, board_id, member_id) VALUES (6, '2024-09-01 01:10:00', '2024-09-01 01:10:00', '좋아 보이네요!', 1, 2);
INSERT INTO comment (id, created_at, updated_at, content, board_id, member_id) VALUES (7, '2024-09-01 01:15:00', '2024-09-01 01:15:00', '상품 상태가 궁금합니다.', 1, 5);
INSERT INTO comment (id, created_at, updated_at, content, board_id, member_id) VALUES (8, '2024-09-01 01:33:00', '2024-09-01 01:33:00', '사진 좀 더 올려주세요.', 1, 4);
INSERT INTO comment (id, created_at, updated_at, content, board_id, member_id) VALUES (9, '2024-09-01 01:38:00', '2024-09-01 01:38:00', '사진 좀 더 올려주세요.', 1, 5);
INSERT INTO comment (id, created_at, updated_at, content, board_id, member_id) VALUES (10, '2024-09-01 01:43:00', '2024-09-01 01:43:00', '예약 가능한가요?', 1, 4);
INSERT INTO comment (id, created_at, updated_at, content, board_id, member_id) VALUES (11, '2024-09-01 13:01:42', '2024-09-01 13:01:42', '가격 흥정 가능한가요?', 2, 4);
INSERT INTO comment (id, created_at, updated_at, content, board_id, member_id) VALUES (12, '2024-09-01 23:36:25', '2024-09-01 23:36:25', '빠른 거래 원합니다.', 3, 4);
INSERT INTO comment (id, created_at, updated_at, content, board_id, member_id) VALUES (13, '2024-09-02 11:53:08', '2024-09-02 11:53:08', '문의드렸습니다. 확인 부탁드려요.', 4, 1);
INSERT INTO comment (id, created_at, updated_at, content, board_id, member_id) VALUES (14, '2024-09-02 11:58:08', '2024-09-02 11:58:08', '빠른 거래 원합니다.', 4, 5);
INSERT INTO comment (id, created_at, updated_at, content, board_id, member_id) VALUES (15, '2024-09-03 10:27:34', '2024-09-03 10:27:34', '빠른 거래 원합니다.', 6, 5);
INSERT INTO comment (id, created_at, updated_at, content, board_id, member_id) VALUES (16, '2024-09-03 10:32:34', '2024-09-03 10:32:34', '사진 좀 더 올려주세요.', 6, 2);
INSERT INTO comment (id, created_at, updated_at, content, board_id, member_id) VALUES (17, '2024-09-03 21:34:16', '2024-09-03 21:34:16', '직거래 가능한가요?', 7, 2);
INSERT INTO comment (id, created_at, updated_at, content, board_id, member_id) VALUES (18, '2024-09-03 22:00:16', '2024-09-03 22:00:16', '문의드렸습니다. 확인 부탁드려요.', 7, 4);
INSERT INTO comment (id, created_at, updated_at, content, board_id, member_id) VALUES (19, '2024-09-04 09:24:59', '2024-09-04 09:24:59', '예약 가능한가요?', 8, 5);
INSERT INTO comment (id, created_at, updated_at, content, board_id, member_id) VALUES (20, '2024-09-04 21:03:42', '2024-09-04 21:03:42', '배송도 가능한가요?', 9, 4);
INSERT INTO comment (id, created_at, updated_at, content, board_id, member_id) VALUES (21, '2024-09-04 21:08:42', '2024-09-04 21:08:42', '배송도 가능한가요?', 9, 4);
INSERT INTO comment (id, created_at, updated_at, content, board_id, member_id) VALUES (22, '2024-09-05 08:20:25', '2024-09-05 08:20:25', '좋아 보이네요!', 10, 3);
INSERT INTO comment (id, created_at, updated_at, content, board_id, member_id) VALUES (23, '2024-09-05 08:25:25', '2024-09-05 08:25:25', '배송도 가능한가요?', 10, 4);
INSERT INTO comment (id, created_at, updated_at, content, board_id, member_id) VALUES (24, '2024-09-05 08:30:25', '2024-09-05 08:30:25', '사진 좀 더 올려주세요.', 10, 5);
INSERT INTO comment (id, created_at, updated_at, content, board_id, member_id) VALUES (25, '2024-09-05 19:42:08', '2024-09-05 19:42:08', '좋아 보이네요!', 11, 1);
INSERT INTO comment (id, created_at, updated_at, content, board_id, member_id) VALUES (26, '2024-09-06 07:20:51', '2024-09-06 07:20:51', '배송도 가능한가요?', 12, 3);
INSERT INTO comment (id, created_at, updated_at, content, board_id, member_id) VALUES (27, '2024-09-06 18:44:33', '2024-09-06 18:44:33', '문의드렸습니다. 확인 부탁드려요.', 13, 5);
INSERT INTO comment (id, created_at, updated_at, content, board_id, member_id) VALUES (28, '2024-09-06 18:49:33', '2024-09-06 18:49:33', '가격 흥정 가능한가요?', 13, 2);
INSERT INTO comment (id, created_at, updated_at, content, board_id, member_id) VALUES (29, '2024-09-06 18:54:33', '2024-09-06 18:54:33', '배송도 가능한가요?', 13, 1);
INSERT INTO comment (id, created_at, updated_at, content, board_id, member_id) VALUES (30, '2024-09-07 05:02:16', '2024-09-07 05:02:16', '사진 좀 더 올려주세요.', 14, 1);
INSERT INTO comment (id, created_at, updated_at, content, board_id, member_id) VALUES (31, '2024-09-07 17:33:59', '2024-09-07 17:33:59', '좋아 보이네요!', 15, 3);
INSERT INTO comment (id, created_at, updated_at, content, board_id, member_id) VALUES (32, '2024-09-08 04:07:42', '2024-09-08 04:07:42', '사진 좀 더 올려주세요.', 16, 4);
INSERT INTO comment (id, created_at, updated_at, content, board_id, member_id) VALUES (33, '2024-09-08 04:23:42', '2024-09-08 04:23:42', '사진 좀 더 올려주세요.', 16, 5);
INSERT INTO comment (id, created_at, updated_at, content, board_id, member_id) VALUES (34, '2024-09-08 15:57:25', '2024-09-08 15:57:25', '예약 가능한가요?', 17, 4);
INSERT INTO comment (id, created_at, updated_at, content, board_id, member_id) VALUES (35, '2024-09-08 16:02:25', '2024-09-08 16:02:25', '사진 좀 더 올려주세요.', 17, 3);
INSERT INTO comment (id, created_at, updated_at, content, board_id, member_id) VALUES (36, '2024-09-09 02:44:08', '2024-09-09 02:44:08', '빠른 거래 원합니다.', 18, 1);
INSERT INTO comment (id, created_at, updated_at, content, board_id, member_id) VALUES (37, '2024-09-09 15:17:50', '2024-09-09 15:17:50', '예약 가능한가요?', 19, 3);
INSERT INTO comment (id, created_at, updated_at, content, board_id, member_id) VALUES (38, '2024-09-10 02:05:33', '2024-09-10 02:05:33', '좋아 보이네요!', 20, 3);
INSERT INTO comment (id, created_at, updated_at, content, board_id, member_id) VALUES (39, '2024-09-10 12:53:16', '2024-09-10 12:53:16', '사진 좀 더 올려주세요.', 21, 2);
INSERT INTO comment (id, created_at, updated_at, content, board_id, member_id) VALUES (40, '2024-09-10 12:57:16', '2024-09-10 12:57:16', '사진 좀 더 올려주세요.', 21, 2);
INSERT INTO comment (id, created_at, updated_at, content, board_id, member_id) VALUES (41, '2024-09-10 13:02:16', '2024-09-10 13:02:16', '문의드렸습니다. 확인 부탁드려요.', 21, 5);
INSERT INTO comment (id, created_at, updated_at, content, board_id, member_id) VALUES (42, '2024-09-11 00:20:59', '2024-09-11 00:20:59', '상품 상태가 궁금합니다.', 22, 3);
INSERT INTO comment (id, created_at, updated_at, content, board_id, member_id) VALUES (43, '2024-09-11 01:33:59', '2024-09-11 01:33:59', '좋아 보이네요!', 22, 2);
INSERT INTO comment (id, created_at, updated_at, content, board_id, member_id) VALUES (44, '2024-09-11 12:19:42', '2024-09-11 12:19:42', '문의드렸습니다. 확인 부탁드려요.', 23, 3);
INSERT INTO comment (id, created_at, updated_at, content, board_id, member_id) VALUES (45, '2024-09-11 12:40:42', '2024-09-11 12:40:42', '좋아 보이네요!', 23, 2);
INSERT INTO comment (id, created_at, updated_at, content, board_id, member_id) VALUES (46, '2024-09-11 12:45:42', '2024-09-11 12:45:42', '배송도 가능한가요?', 23, 3);
INSERT INTO comment (id, created_at, updated_at, content, board_id, member_id) VALUES (47, '2024-09-12 00:13:25', '2024-09-12 00:13:25', '빠른 거래 원합니다.', 24, 5);
INSERT INTO comment (id, created_at, updated_at, content, board_id, member_id) VALUES (48, '2024-09-12 00:18:25', '2024-09-12 00:18:25', '상품 상태가 궁금합니다.', 24, 2);
INSERT INTO comment (id, created_at, updated_at, content, board_id, member_id) VALUES (49, '2024-09-12 11:05:07', '2024-09-12 11:05:07', '빠른 거래 원합니다.', 25, 2);
INSERT INTO comment (id, created_at, updated_at, content, board_id, member_id) VALUES (50, '2024-09-12 11:10:07', '2024-09-12 11:10:07', '상품 상태가 궁금합니다.', 25, 5);
INSERT INTO comment (id, created_at, updated_at, content, board_id, member_id) VALUES (51, '2024-09-12 11:15:07', '2024-09-12 11:15:07', '구매 의사 있습니다.', 25, 1);
INSERT INTO comment (id, created_at, updated_at, content, board_id, member_id) VALUES (52, '2024-09-12 22:15:50', '2024-09-12 22:15:50', '문의드렸습니다. 확인 부탁드려요.', 26, 3);
INSERT INTO comment (id, created_at, updated_at, content, board_id, member_id) VALUES (53, '2024-09-12 22:24:50', '2024-09-12 22:24:50', '좋아 보이네요!', 26, 1);
INSERT INTO comment (id, created_at, updated_at, content, board_id, member_id) VALUES (54, '2024-09-12 22:29:50', '2024-09-12 22:29:50', '빠른 거래 원합니다.', 26, 3);
INSERT INTO comment (id, created_at, updated_at, content, board_id, member_id) VALUES (55, '2024-09-13 09:46:33', '2024-09-13 09:46:33', '가격 흥정 가능한가요?', 27, 3);
INSERT INTO comment (id, created_at, updated_at, content, board_id, member_id) VALUES (56, '2024-09-13 10:15:33', '2024-09-13 10:15:33', '구매 의사 있습니다.', 27, 2);
INSERT INTO comment (id, created_at, updated_at, content, board_id, member_id) VALUES (57, '2024-09-13 10:45:33', '2024-09-13 10:45:33', '예약 가능한가요?', 27, 2);
INSERT INTO comment (id, created_at, updated_at, content, board_id, member_id) VALUES (58, '2024-09-14 09:35:59', '2024-09-14 09:35:59', '구매 의사 있습니다.', 29, 2);
INSERT INTO comment (id, created_at, updated_at, content, board_id, member_id) VALUES (59, '2024-09-14 09:40:59', '2024-09-14 09:40:59', '구매 의사 있습니다.', 29, 5);
INSERT INTO comment (id, created_at, updated_at, content, board_id, member_id) VALUES (60, '2024-09-14 19:39:42', '2024-09-14 19:39:42', '사진 좀 더 올려주세요.', 30, 4);
INSERT INTO comment (id, created_at, updated_at, content, board_id, member_id) VALUES (61, '2024-09-15 07:45:24', '2024-09-15 07:45:24', '직거래 가능한가요?', 31, 3);
INSERT INTO comment (id, created_at, updated_at, content, board_id, member_id) VALUES (62, '2024-09-15 07:50:24', '2024-09-15 07:50:24', '상품 상태가 궁금합니다.', 31, 1);
INSERT INTO comment (id, created_at, updated_at, content, board_id, member_id) VALUES (63, '2024-09-15 07:55:24', '2024-09-15 07:55:24', '가격 흥정 가능한가요?', 31, 3);
INSERT INTO comment (id, created_at, updated_at, content, board_id, member_id) VALUES (64, '2024-09-15 18:31:07', '2024-09-15 18:31:07', '사진 좀 더 올려주세요.', 32, 4);
INSERT INTO comment (id, created_at, updated_at, content, board_id, member_id) VALUES (65, '2024-09-15 19:52:07', '2024-09-15 19:52:07', '예약 가능한가요?', 32, 4);
INSERT INTO comment (id, created_at, updated_at, content, board_id, member_id) VALUES (66, '2024-09-15 19:57:07', '2024-09-15 19:57:07', '가격 흥정 가능한가요?', 32, 3);
INSERT INTO comment (id, created_at, updated_at, content, board_id, member_id) VALUES (67, '2024-09-16 18:25:33', '2024-09-16 18:25:33', '예약 가능한가요?', 34, 2);
INSERT INTO comment (id, created_at, updated_at, content, board_id, member_id) VALUES (68, '2024-09-16 18:40:33', '2024-09-16 18:40:33', '좋아 보이네요!', 34, 1);
INSERT INTO comment (id, created_at, updated_at, content, board_id, member_id) VALUES (69, '2024-09-17 05:56:16', '2024-09-17 05:56:16', '배송도 가능한가요?', 35, 2);
INSERT INTO comment (id, created_at, updated_at, content, board_id, member_id) VALUES (70, '2024-09-17 06:01:16', '2024-09-17 06:01:16', '배송도 가능한가요?', 35, 2);
INSERT INTO comment (id, created_at, updated_at, content, board_id, member_id) VALUES (71, '2024-09-17 17:31:59', '2024-09-17 17:31:59', '예약 가능한가요?', 36, 3);
INSERT INTO comment (id, created_at, updated_at, content, board_id, member_id) VALUES (72, '2024-09-18 03:41:41', '2024-09-18 03:41:41', '구매 의사 있습니다.', 37, 5);
INSERT INTO comment (id, created_at, updated_at, content, board_id, member_id) VALUES (73, '2024-09-18 04:50:41', '2024-09-18 04:50:41', '구매 의사 있습니다.', 37, 2);
INSERT INTO comment (id, created_at, updated_at, content, board_id, member_id) VALUES (74, '2024-09-18 05:03:41', '2024-09-18 05:03:41', '배송도 가능한가요?', 37, 5);
INSERT INTO comment (id, created_at, updated_at, content, board_id, member_id) VALUES (75, '2024-09-18 15:32:24', '2024-09-18 15:32:24', '가격 흥정 가능한가요?', 38, 1);
INSERT INTO comment (id, created_at, updated_at, content, board_id, member_id) VALUES (76, '2024-09-19 03:37:07', '2024-09-19 03:37:07', '예약 가능한가요?', 39, 3);
INSERT INTO comment (id, created_at, updated_at, content, board_id, member_id) VALUES (77, '2024-09-19 03:42:07', '2024-09-19 03:42:07', '빠른 거래 원합니다.', 39, 2);
INSERT INTO comment (id, created_at, updated_at, content, board_id, member_id) VALUES (78, '2024-09-19 15:06:50', '2024-09-19 15:06:50', '사진 좀 더 올려주세요.', 40, 1);
INSERT INTO comment (id, created_at, updated_at, content, board_id, member_id) VALUES (79, '2024-09-19 15:11:50', '2024-09-19 15:11:50', '배송도 가능한가요?', 40, 2);
INSERT INTO comment (id, created_at, updated_at, content, board_id, member_id) VALUES (80, '2024-09-19 15:16:50', '2024-09-19 15:16:50', '사진 좀 더 올려주세요.', 40, 1);
INSERT INTO comment (id, created_at, updated_at, content, board_id, member_id) VALUES (81, '2024-09-19 15:21:50', '2024-09-19 15:21:50', '빠른 거래 원합니다.', 1, 6);
INSERT INTO comment (id, created_at, updated_at, content, board_id, member_id) VALUES (82, '2024-09-19 15:26:50', '2024-09-19 15:26:50', '예약 가능한가요?', 31, 6);
INSERT INTO comment (id, created_at, updated_at, content, board_id, member_id) VALUES (83, '2024-09-19 15:31:50', '2024-09-19 15:31:50', '사진 좀 더 올려주세요.', 18, 6);
INSERT INTO comment (id, created_at, updated_at, content, board_id, member_id) VALUES (84, '2024-09-19 15:36:50', '2024-09-19 15:36:50', '예약 가능한가요?', 26, 6);
INSERT INTO comment (id, created_at, updated_at, content, board_id, member_id) VALUES (85, '2024-09-19 15:41:50', '2024-09-19 15:41:50', '빠른 거래 원합니다.', 21, 6);
INSERT INTO comment (id, created_at, updated_at, content, board_id, member_id) VALUES (86, '2024-09-19 15:46:50', '2024-09-19 15:46:50', '좋아 보이네요!', 33, 6);
INSERT INTO comment (id, created_at, updated_at, content, board_id, member_id) VALUES (87, '2024-09-19 15:51:50', '2024-09-19 15:51:50', '예약 가능한가요?', 5, 6);
INSERT INTO comment (id, created_at, updated_at, content, board_id, member_id) VALUES (88, '2024-09-19 15:56:50', '2024-09-19 15:56:50', '직거래 가능한가요?', 34, 6);
INSERT INTO comment (id, created_at, updated_at, content, board_id, member_id) VALUES (89, '2024-09-19 16:01:50', '2024-09-19 16:01:50', '배송도 가능한가요?', 2, 6);
INSERT INTO comment (id, created_at, updated_at, content, board_id, member_id) VALUES (90, '2024-09-19 16:06:50', '2024-09-19 16:06:50', '배송도 가능한가요?', 14, 6);
INSERT INTO comment (id, created_at, updated_at, content, board_id, member_id) VALUES (91, '2024-09-20 01:36:33', '2024-09-20 01:36:33', '사진 좀 더 올려주세요.', 41, 4);
INSERT INTO comment (id, created_at, updated_at, content, board_id, member_id) VALUES (92, '2024-09-20 12:49:16', '2024-09-20 12:49:16', '예약 가능한가요?', 42, 2);
INSERT INTO comment (id, created_at, updated_at, content, board_id, member_id) VALUES (93, '2024-09-20 12:54:16', '2024-09-20 12:54:16', '빠른 거래 원합니다.', 41, 3);
INSERT INTO comment (id, created_at, updated_at, content, board_id, member_id) VALUES (94, '2024-09-20 13:12:16', '2024-09-20 13:12:16', '예약 가능한가요?', 42, 3);
INSERT INTO comment (id, created_at, updated_at, content, board_id, member_id) VALUES (95, '2024-09-20 13:17:16', '2024-09-20 13:17:16', '좋아 보이네요!', 41, 4);
INSERT INTO comment (id, created_at, updated_at, content, board_id, member_id) VALUES (96, '2024-09-20 13:59:16', '2024-09-20 13:59:16', '빠른 거래 원합니다.', 42, 2);
INSERT INTO comment (id, created_at, updated_at, content, board_id, member_id) VALUES (97, '2024-09-20 14:04:16', '2024-09-20 14:04:16', '배송도 가능한가요?', 41, 4);
INSERT INTO comment (id, created_at, updated_at, content, board_id, member_id) VALUES (98, '2024-09-20 14:09:16', '2024-09-20 14:09:16', '예약 가능한가요?', 42, 3);
INSERT INTO comment (id, created_at, updated_at, content, board_id, member_id) VALUES (99, '2024-09-20 14:14:16', '2024-09-20 14:14:16', '상품 상태가 궁금합니다.', 41, 6);
INSERT INTO comment (id, created_at, updated_at, content, board_id, member_id) VALUES (100, '2024-09-20 14:19:16', '2024-09-20 14:19:16', '예약 가능한가요?', 42, 4);

-- Insert statements for Like
INSERT INTO likes (board_id, member_id) VALUE (48, 6);
INSERT INTO likes (board_id, member_id) VALUE (49, 6);
INSERT INTO likes (board_id, member_id) VALUE (50, 6);

-- code
INSERT INTO group_code (group_code, group_code_desc, group_code_name) VALUES ('010', '판매 상태를 알리는 코드', '판매상태');

INSERT INTO code (order_no, code, code_name, code_name_brief, group_code) VALUES (1, '010', '판매중', 'sale', '010');
INSERT INTO code (order_no, code, code_name, code_name_brief, group_code) VALUES (2, '020', '판매완료', 'done', '010');

INSERT INTO group_code (group_code, group_code_desc, group_code_name) VALUES ('020', '회원 등급을 알리는 코드', '회원등급');

INSERT INTO code (order_no, code, code_name, code_name_brief, group_code) VALUES (1, '010', '실버', 'silver', '020');
INSERT INTO code (order_no, code, code_name, code_name_brief, group_code) VALUES (2, '020', '골드', 'gold', '020');
INSERT INTO code (order_no, code, code_name, code_name_brief, group_code) VALUES (3, '030', 'VIP', 'vip', '020');