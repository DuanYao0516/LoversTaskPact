
-- 初始化数据
INSERT INTO `User` (`username`, `password_hash`, `email`, `phone_number`, `role`, `profile_picture`, `created_at`, `updated_at`)
VALUES
  ('甲用户', 'hashed_password_甲', 'jia@example.com', '1234567890', '甲', NULL, NOW(), NOW()),
  ('乙用户', 'hashed_password_乙', 'yi@example.com', '0987654321', '乙', NULL, NOW(), NOW());