-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 23, 2024 at 07:38 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `techblog`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `cid` int(12) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`cid`, `name`, `description`) VALUES
(1, 'Java Programming', 'Java is one of the most popular programming language'),
(2, 'Python Programming', 'Python is one of the most popular in machine learning'),
(3, 'Web Technology', 'used mostly for developing websites'),
(4, 'Database', 'used for store data in tables.'),
(6, 'Data Science', '123\r\n'),
(7, 'App Devlopment', 'app');

-- --------------------------------------------------------

--
-- Table structure for table `like_post`
--

CREATE TABLE `like_post` (
  `lid` int(20) NOT NULL,
  `pid` int(11) NOT NULL,
  `uid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `like_post`
--

INSERT INTO `like_post` (`lid`, `pid`, `uid`) VALUES
(13, 29, 1);

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `pid` int(12) NOT NULL,
  `pTitle` varchar(150) NOT NULL,
  `pContent` longtext DEFAULT NULL,
  `pCode` longtext DEFAULT NULL,
  `pPic` varchar(100) DEFAULT NULL,
  `pDate` timestamp NULL DEFAULT current_timestamp(),
  `catId` int(12) NOT NULL,
  `userId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`pid`, `pTitle`, `pContent`, `pCode`, `pPic`, `pDate`, `catId`, `userId`) VALUES
(28, 'What is Class in Java?', 'Class is collection of methods and properties.', 'package com.tech.blog.entities;\r\n\r\npublic class User {\r\n    private int id;\r\n    private String name;\r\n    private String email;\r\n    private String password;\r\n    private String gender;\r\n    private String about;\r\n    \r\n    public User() {\r\n    }\r\n    \r\n    public User(int id, String name, String email, String password, String gender, String about) {\r\n        this.id = id;\r\n        this.name = name;\r\n        this.email = email;\r\n        this.password = password;\r\n        this.gender = gender;\r\n        this.about = about;\r\n    }\r\n\r\n    public User(String name, String email, String password, String gender, String about) {\r\n        this.name = name;\r\n        this.email = email;\r\n        this.password = password;\r\n        this.gender = gender;\r\n        this.about = about;\r\n    }\r\n    \r\n    //    getter and setter\r\n    public int getId() {\r\n        return id;\r\n    }\r\n\r\n    public void setId(int id) {\r\n        this.id = id;\r\n    }\r\n\r\n    public String getName() {\r\n        return name;\r\n    }\r\n\r\n    public void setName(String name) {\r\n        this.name = name;\r\n    }\r\n\r\n    public String getEmail() {\r\n        return email;\r\n    }\r\n\r\n    public void setEmail(String email) {\r\n        this.email = email;\r\n    }\r\n\r\n    public String getPassword() {\r\n        return password;\r\n    }\r\n\r\n    public void setPassword(String password) {\r\n        this.password = password;\r\n    }\r\n\r\n    public String getGender() {\r\n        return gender;\r\n    }\r\n\r\n    public void setGender(String gender) {\r\n        this.gender = gender;\r\n    }\r\n\r\n    public String getAbout() {\r\n        return about;\r\n    }\r\n\r\n    public void setAbout(String about) {\r\n        this.about = about;\r\n    }\r\n\r\n    @Override\r\n    public String toString() {\r\n        return \"User{\" + \"name=\" + name + \", email=\" + email + \", password=\" + password + \", gender=\" + gender + \", about=\" + about + \'}\';\r\n    }\r\n}\r\n', '7.png', '2024-06-23 17:03:41', 1, 1),
(29, 'What is Object in Java?', 'Object is instance of class.', '// Create a Post object and save it to the database\r\n            Post p = new Post(pTitle, pContent, pCode, fileName, null, cid, user.getId());\r\n            PostDao dao = new PostDao(ConnectionProvider.getConnection());\r\n            ', '1.png', '2024-06-23 17:05:19', 1, 1),
(30, 'What is Collection in java?', 'Collection is pre-defined generic data varibles.', '', '1.png', '2024-06-23 17:07:08', 1, 1),
(31, 'What is Website?', 'Website is collections of Web pages.', '', 'Screenshot (53).png', '2024-06-23 17:08:14', 3, 1),
(32, 'What is Bootstrap?', 'Bootstrap is framework used for easily design websites.', '', '', '2024-06-23 17:09:14', 3, 1),
(33, 'Responsive WebSite', 'Responsive website ', '', 'Screenshot (51).png', '2024-06-23 17:10:04', 3, 1),
(34, 'What is Database?', 'Database is collection of Tables.', '', '4.jpeg', '2024-06-23 17:10:50', 4, 1),
(35, 'What is DataGrid in Database?', 'DataGridView', '', '8.jpeg', '2024-06-23 17:11:28', 4, 1),
(36, 'What is Python Programming?', 'Python is programming language used for machine learning.', '', '2.png', '2024-06-23 17:12:44', 2, 1),
(37, 'What is Table?', 'Table is Collection of rows and columns', '', '', '2024-06-23 17:30:58', 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(80) NOT NULL,
  `password` varchar(50) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `about` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `email`, `password`, `gender`, `about`) VALUES
(1, 'parth Vekariya', 'parth123@gmail.com', '12345', 'male', 'my name is parth vekariya.\r\n                                        '),
(2, 'admin', 'sample@gmail.com', '12345', 'male', 'hello world'),
(3, 'rohan', 'rohan123@gmail.com', '12345', 'male', 'hello world'),
(5, 'hjk', 'p123@gmail.com', '1235', 'male', 'moj'),
(6, 'hdsjkab', 'p1shicah3@gmail.com', '1235skajc', 'female', 'mojjkhxcjh'),
(7, 'ncjkbsd', 'ndcjksc@gmail.com', '3543135', 'female', 'nhjvgh'),
(8, 'mdklsxj', 'd.skjvibhb@gmail.com', 'dhvcsyjsnsk', 'female', 'dsmckljnd'),
(9, 'dshjxbhcn', 'sdxjkchbm@gmail.com', 'jdcihvnk', 'female', 'sjiuychdj'),
(10, 'hardik', 'hk123@gmail.com', '', 'male', 'hii');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`cid`);

--
-- Indexes for table `like_post`
--
ALTER TABLE `like_post`
  ADD PRIMARY KEY (`lid`),
  ADD KEY `pid` (`pid`),
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`pid`),
  ADD KEY `posts_ibfk_1` (`catId`),
  ADD KEY `posts_ibfk_2` (`userId`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `cid` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `like_post`
--
ALTER TABLE `like_post`
  MODIFY `lid` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `pid` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `like_post`
--
ALTER TABLE `like_post`
  ADD CONSTRAINT `like_post_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `posts` (`pid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `like_post_ibfk_2` FOREIGN KEY (`uid`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`catId`) REFERENCES `categories` (`cid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `posts_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
