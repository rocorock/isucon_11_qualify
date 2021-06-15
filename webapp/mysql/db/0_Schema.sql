-- TODO: 各カラムの varchar の大きさを調整する (#51)

DROP TABLE IF EXISTS `isu`;
CREATE TABLE `isu` (
  `jia_isu_uuid` CHAR(36) PRIMARY KEY,
  `name` VARCHAR(255) NOT NULL,
  `image` LONGBLOB,
  `character` VARCHAR(255) NOT NULL,
  `jia_catalog_id` VARCHAR(255) NOT NULL, -- TODO: jia_catalog_id の format 策定 (#50)
  `jia_user_id` VARCHAR(255) NOT NULL,
  `is_deleted` TINYINT(1) NOT NULL DEFAULT FALSE,
  `created_at` DATETIME(6) NOT NULL,
  `updated_at` DATETIME(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARACTER SET=utf8mb4;

DROP TABLE IF EXISTS `isu_log`;
CREATE TABLE `isu_log` (
  `jia_isu_uuid` CHAR(36),
  `timestamp` DATETIME,
  `condition` VARCHAR(255) NOT NULL,
  `message` VARCHAR(255) NOT NULL,
  `created_at` DATETIME(6) NOT NULL,
  PRIMARY KEY(`jia_isu_uuid`,`timestamp`)
) ENGINE=InnoDB DEFAULT CHARACTER SET=utf8mb4;

DROP TABLE IF EXISTS `graph`;
CREATE TABLE `graph` (
  `jia_isu_uuid` CHAR(36),
  `start_at` DATETIME,
  `data` JSON NOT NULL,
  `created_at` DATETIME(6) NOT NULL,
  `updated_at` DATETIME(6) NOT NULL,
  PRIMARY KEY(`jia_isu_uuid`,`start_at`)
) ENGINE=InnoDB DEFAULT CHARACTER SET=utf8mb4;

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `jia_user_id` VARCHAR(255) PRIMARY KEY,
  `created_at` DATETIME(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARACTER SET=utf8mb4;

DROP TABLE IF EXISTS `isu_association_config`;
CREATE TABLE `isu_association_config` (
  `name` VARCHAR(255) PRIMARY KEY,
  `url` VARCHAR(255) NOT NULL UNIQUE
) ENGINE=InnoDB DEFAULT CHARACTER SET=utf8mb4;