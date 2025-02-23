-- 用户表
CREATE TABLE IF NOT EXISTS `User` (
  `user_id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(255) NOT NULL,
  `password_hash` VARCHAR(255) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `phone_number` VARCHAR(20) NOT NULL,
  `role` ENUM('甲', '乙') NOT NULL,
  `profile_picture` VARCHAR(255) DEFAULT NULL,
  `points_balance` INT NOT NULL DEFAULT 0,
  `points_update_time` DATETIME NOT NULL,
  `created_at` DATETIME NOT NULL,
  `updated_at` DATETIME NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- 任务表
CREATE TABLE IF NOT EXISTS `Task` (
  `task_id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(255) NOT NULL,
  `description` TEXT NOT NULL,
  `initiator_id` INT NOT NULL,
  `assignee_id` INT NOT NULL,
  `due_date` DATETIME NOT NULL,
  `points` INT NOT NULL,
  `category` VARCHAR(100) NOT NULL,
  `status` ENUM('待确认', '进行中', '已完成', '已失败') NOT NULL,
  `created_at` DATETIME NOT NULL,
  `updated_at` DATETIME NOT NULL,
  PRIMARY KEY (`task_id`),
  FOREIGN KEY (`initiator_id`) REFERENCES `User`(`user_id`) ON DELETE CASCADE,
  FOREIGN KEY (`assignee_id`) REFERENCES `User`(`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 任务确认表
CREATE TABLE IF NOT EXISTS `Task_Confirmation` (
  `confirmation_id` INT NOT NULL AUTO_INCREMENT,
  `task_id` INT NOT NULL,
  `confirming_user_id` INT NOT NULL,
  `confirmation_type` ENUM('第一次确认', '第二次确认') NOT NULL,
  `status` ENUM('已确认', '已拒绝') NOT NULL,
  `comments` TEXT DEFAULT NULL,
  `created_at` DATETIME NOT NULL,
  PRIMARY KEY (`confirmation_id`),
  FOREIGN KEY (`task_id`) REFERENCES `Task`(`task_id`) ON DELETE CASCADE,
  FOREIGN KEY (`confirming_user_id`) REFERENCES `User`(`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 任务证据表
CREATE TABLE IF NOT EXISTS `Task_Evidence` (
  `evidence_id` INT NOT NULL AUTO_INCREMENT,
  `task_id` INT NOT NULL,
  `evidence_type` ENUM('照片', '视频') NOT NULL,
  `evidence_url` VARCHAR(255) NOT NULL,
  `created_at` DATETIME NOT NULL,
  PRIMARY KEY (`evidence_id`),
  FOREIGN KEY (`task_id`) REFERENCES `Task`(`task_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 任务评论表
CREATE TABLE IF NOT EXISTS `Task_Comment` (
  `comment_id` INT NOT NULL AUTO_INCREMENT,
  `task_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `content` TEXT NOT NULL,
  `created_at` DATETIME NOT NULL,
  PRIMARY KEY (`comment_id`),
  FOREIGN KEY (`task_id`) REFERENCES `Task`(`task_id`) ON DELETE CASCADE,
  FOREIGN KEY (`user_id`) REFERENCES `User`(`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 评论回复表
-- 二级评论表
CREATE TABLE IF NOT EXISTS `Comment_Reply` (
  `reply_id` INT NOT NULL AUTO_INCREMENT,
  `comment_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `content` TEXT NOT NULL,
  `created_at` DATETIME NOT NULL,
  PRIMARY KEY (`reply_id`),
  FOREIGN KEY (`comment_id`) REFERENCES `Task_Comment`(`comment_id`) ON DELETE CASCADE,
  FOREIGN KEY (`user_id`) REFERENCES `User`(`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 服务券表
CREATE TABLE IF NOT EXISTS `Service_Coupon` (
  `coupon_id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(255) NOT NULL,
  `description` TEXT NOT NULL,
  `required_points` INT NOT NULL,
  `stock_quantity` INT NOT NULL,
  `status` ENUM('上架', '下架') NOT NULL,
  `creator_id` INT NOT NULL,
  `created_at` DATETIME NOT NULL,
  `updated_at` DATETIME NOT NULL,
  PRIMARY KEY (`coupon_id`),
  FOREIGN KEY (`creator_id`) REFERENCES `User`(`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- 用户服务券表
-- 服务券库存表
CREATE TABLE IF NOT EXISTS `Coupon_Inventory` (
  `inventory_id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `coupon_id` INT NOT NULL,
  `quantity` INT NOT NULL,
  `created_at` DATETIME NOT NULL,
  `updated_at` DATETIME NOT NULL,
  PRIMARY KEY (`inventory_id`),
  FOREIGN KEY (`user_id`) REFERENCES `User`(`user_id`) ON DELETE CASCADE,
  FOREIGN KEY (`coupon_id`) REFERENCES `Service_Coupon`(`coupon_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 服务券使用记录表
CREATE TABLE IF NOT EXISTS `Coupon_Usage_Record` (
  `usage_id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `coupon_id` INT NOT NULL,
  `usage_date` DATETIME NOT NULL,
  `status` ENUM('已使用', '已过期') NOT NULL,
  PRIMARY KEY (`usage_id`),
  FOREIGN KEY (`user_id`) REFERENCES `User`(`user_id`) ON DELETE CASCADE,
  FOREIGN KEY (`coupon_id`) REFERENCES `Service_Coupon`(`coupon_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


