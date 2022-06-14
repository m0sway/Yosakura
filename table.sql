#用户信息表
CREATE TABLE `user` (
                        `id` tinyint(4) NOT NULL AUTO_INCREMENT,
                        `username` varchar(16) NOT NULL,
                        `password` varchar(64) NOT NULL,
                        `nikeName` varchar(32) NOT NULL,
                        `createTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
                        `updateTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
                        PRIMARY KEY (`id`),
                        UNIQUE KEY `username` (`username`) USING BTREE,
                        UNIQUE KEY `nikename` (`nikename`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#任务表
CREATE TABLE `task` (
                          `id` int NOT NULL AUTO_INCREMENT,
                          `taskName` varchar(32) NOT NULL,
                          `domain` varchar(32) NOT NULL,
                          `user` varchar(32) NOT NULL,
                          `note` text,
                          `createTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
                          PRIMARY KEY (`id`),
                          UNIQUE KEY `domain` (`domain`) USING BTREE
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

#域名表
CREATE TABLE `domain` (
                          `id` int NOT NULL AUTO_INCREMENT,
                          `domain` varchar(32) NOT NULL,
                          `type` varchar(16) NOT NULL,
                          `icon_hash` varchar(32),
                          `createTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
                          PRIMARY KEY (`id`),
                          UNIQUE KEY `domain` (`domain`) USING BTREE
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

#Whois表
CREATE TABLE `whois` (
                         `id` int NOT NULL AUTO_INCREMENT,
                          `domain` varchar(32) NOT NULL,
                          `whois` text NOT NULL,
                          `createTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
                          PRIMARY KEY (`id`),
                          UNIQUE KEY `domain` (`domain`) USING BTREE
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

#子域名表
CREATE TABLE `subdomain` (
                             `id` int NOT NULL AUTO_INCREMENT,
                             `domain` varchar(32) NOT NULL,
                             `subdomain` varchar(64) NOT NULL,
                             `type` varchar(16) NOT NULL,
                             `cdn`  bool DEFAULT true,
                             `ip` varchar(16) DEFAULT 'wait',
                             `createTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
                             PRIMARY KEY (`id`),
                             UNIQUE KEY `domain` (`subdomain`) USING BTREE
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

#域名执行记录表
CREATE TABLE `domainrecord` (
                             `id` int NOT NULL AUTO_INCREMENT,
                             `domain` varchar(32) NOT NULL,
                             `whois` bool DEFAULT false,
                             `icon` bool DEFAULT false,
                             `subdomain` bool DEFAULT false,
                             `cdn` bool DEFAULT false,
                             `ipscan` bool DEFAULT false,
                             `finger` bool DEFAULT false,
                             `siteDirectory`  bool DEFAULT false,
                             `workStatus`  bool DEFAULT true,
                             `createTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
                             PRIMARY KEY (`id`),
                             UNIQUE KEY `domain` (`domain`) USING BTREE
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

#URL表
CREATE TABLE `url` (
                            `id` int NOT NULL AUTO_INCREMENT,
                             `domain` varchar(32) NOT NULL,
                             `url` varchar(64) NOT NULL,
                             `type` varchar(16) NOT NULL,
                             `finger` varchar(32) DEFAULT 'wait',
                             `title` varchar(32) DEFAULT 'wait',
                             `createTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
                             PRIMARY KEY (`id`),
                             UNIQUE KEY `domain` (`url`) USING BTREE
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

#icon表
CREATE TABLE `icon` (
                       `id` int NOT NULL AUTO_INCREMENT,
                       `domain` varchar(32) NOT NULL,
                       `icon` text NOT NULL,
                       `createTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
                       PRIMARY KEY (`id`),
                       UNIQUE KEY `domain` (`domain`) USING BTREE
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

#IP表
CREATE TABLE `ip` (
                       `id` int NOT NULL AUTO_INCREMENT,
                       `ip` varchar(16) NOT NULL,
                       `domain` varchar(32) NOT NULL,
                       `port` varchar(256) DEFAULT 'wait',
                       `createTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
                       PRIMARY KEY (`id`),
                       UNIQUE KEY `ip` (`ip`) USING BTREE
)ENGINE=InnoDB DEFAULT CHARSET=utf8;