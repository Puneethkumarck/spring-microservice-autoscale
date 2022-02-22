DROP TABLE IF EXISTS `customer`;

CREATE TABLE customer  (
    id  INTEGER  NOT NULL PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(20),
    last_name VARCHAR(20)
);
