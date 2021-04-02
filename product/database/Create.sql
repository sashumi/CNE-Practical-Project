--CREATE DATABASE testdb;
-- the test stage fails if the above is active. commenting out until resolution.
CREATE DATABASE users;
USE users;

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `userName` varchar(30) NOT NULL
);

INSERT INTO `users` VALUES ('Bob'),('Jay'),('Matt'),('Ferg'),('Mo');