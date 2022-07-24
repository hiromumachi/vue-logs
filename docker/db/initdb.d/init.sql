DROP DATABASE IF EXISTS acrovision_e_learning;
CREATE DATABASE acrovision_e_learning;
USE acrovision_e_learning;
DROP TABLE IF EXISTS test;
 
CREATE TABLE test (
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
test TEXT NOT NULL
)DEFAULT CHARACTER SET=utf8;
 
INSERT INTO test (test) VALUES ("test1"),("test2"),("test3");