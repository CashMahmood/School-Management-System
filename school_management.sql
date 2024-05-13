-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 13, 2024 at 09:04 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `school_management`
--

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE `attendance` (
  `attendance_id` int(11) NOT NULL,
  `date` date DEFAULT NULL,
  `student_id` int(11) DEFAULT NULL,
  `class_id` int(11) DEFAULT NULL,
  `is_present` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `attendance`
--

INSERT INTO `attendance` (`attendance_id`, `date`, `student_id`, `class_id`, `is_present`) VALUES
(1, '2024-05-12', 1, 1, 1),
(2, '2024-05-12', 2, 1, 1),
(3, '2024-05-12', 3, 2, 1),
(4, '2024-05-12', 4, 2, 0),
(5, '2024-05-12', 5, 3, 1),
(6, '2024-05-12', 6, 3, 0),
(7, '2024-05-12', 7, 4, 1),
(8, '2024-05-12', 8, 4, 1),
(9, '2024-05-12', 9, 5, 1),
(10, '2024-05-12', 10, 5, 1),
(11, '2024-05-12', 11, 6, 1),
(12, '2024-05-12', 12, 6, 0),
(13, '2024-05-12', 13, 7, 1),
(14, '2024-05-12', 14, 7, 1),
(15, '2024-05-12', 15, 8, 1);

-- --------------------------------------------------------

--
-- Table structure for table `classes`
--

CREATE TABLE `classes` (
  `class_id` int(11) NOT NULL,
  `class_name` varchar(50) DEFAULT NULL,
  `section` varchar(50) DEFAULT NULL,
  `teacher_id` int(11) DEFAULT NULL,
  `room_number` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `classes`
--

INSERT INTO `classes` (`class_id`, `class_name`, `section`, `teacher_id`, `room_number`) VALUES
(1, 'Nursery', 'A', 10, '101'),
(2, 'Nursery', 'B', 10, '102'),
(3, 'KG', 'A', 10, '103'),
(4, 'KG', 'B', 10, '104'),
(5, 'Class 1', 'A', 9, '105'),
(6, 'Class 1', 'B', 9, '106'),
(7, 'Class 2', 'A', 8, '201'),
(8, 'Class 2', 'B', 8, '202'),
(9, 'Class 3', 'A', 7, '203'),
(10, 'Class 3', 'B', 7, '204'),
(11, 'Class 4', 'A', 6, '207'),
(12, 'Class 4', 'B', 6, '208'),
(13, 'Class 5', 'A', 5, '301'),
(14, 'Class 5', 'B', 5, '302');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `employee_id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `date_of_birth` date NOT NULL,
  `gender` enum('Male','Female','Other') NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `designation` varchar(100) DEFAULT NULL,
  `salary` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`employee_id`, `first_name`, `last_name`, `date_of_birth`, `gender`, `email`, `designation`, `salary`) VALUES
(1, 'Ashraf', 'Khan', '1984-02-17', 'Male', 'ashrafkhan@example.com', 'Principal', 80000.00),
(2, 'Anika', 'Akter', '1992-06-21', 'Female', 'anikaakter@example.com', 'Vice Principal', 70000.00),
(3, 'Fahim', 'Ahmed', '1979-09-05', 'Male', 'fahimahmed@example.com', 'Administrator', 60000.00),
(4, 'Sabina', 'Rahman', '1988-04-12', 'Female', 'sabinarahman@example.com', 'Accountant', 55000.00),
(5, 'Rafiq', 'Islam', '1983-11-28', 'Male', 'rafiqislam@example.com', 'Head Teacher', 60000.00),
(6, 'Nadia', 'Begum', '1995-07-08', 'Female', 'nadiabegum@example.com', 'Counselor', 50000.00),
(7, 'Imran', 'Chowdhury', '1981-03-15', 'Male', 'imranchowdhury@example.com', 'IT Manager', 65000.00),
(8, 'Farhana', 'Akhter', '1990-10-25', 'Female', 'farhanaakhter@example.com', 'Librarian', 55000.00),
(9, 'Rakib', 'Hossain', '1986-12-30', 'Male', 'rakibhossain@example.com', 'Head of Security', 60000.00),
(10, 'Shirin', 'Khatun', '1989-08-07', 'Female', 'shirinkhatun@example.com', 'HR Manager', 65000.00),
(11, 'Aminul', 'Islam', '1977-05-20', 'Male', 'aminulislam@example.com', 'Transport Manager', 60000.00),
(12, 'Nazia', 'Begum', '1993-01-10', 'Female', 'naziabegum@example.com', 'Event Coordinator', 55000.00),
(13, 'Arif', 'Rahman', '1985-09-18', 'Male', 'arifrahman@example.com', 'Maintenance Supervisor', 60000.00),
(14, 'Nasrin', 'Akhter', '1980-11-14', 'Female', 'nasrinakhter@example.com', 'Admissions Officer', 55000.00),
(15, 'Sohel', 'Khan', '1987-07-02', 'Male', 'sohelkhan@example.com', 'Sports Coordinator', 60000.00),
(16, 'Hasina', 'Begum', '1983-03-25', 'Female', 'hasinabegum@example.com', 'Cleaner', 30000.00),
(17, 'Jahangir', 'Miah', '1975-08-12', 'Male', 'jahangirmiah@example.com', 'Security Guard', 35000.00),
(18, 'Nilufar', 'Begum', '1986-12-05', 'Female', 'nilufarbegum@example.com', 'Cafeteria Staff', 32000.00);

-- --------------------------------------------------------

--
-- Table structure for table `exams`
--

CREATE TABLE `exams` (
  `exam_id` int(11) NOT NULL,
  `exam_name` varchar(100) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `time` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `exams`
--

INSERT INTO `exams` (`exam_id`, `exam_name`, `date`, `time`) VALUES
(1, 'Midterm Exam', '2024-06-15', '09:00:00'),
(2, 'Final Exam', '2024-12-10', '10:30:00'),
(3, 'Unit Test 1', '2024-09-20', '11:00:00'),
(4, 'Unit Test 2', '2024-11-15', '10:00:00'),
(5, 'Unit Test 3', '2025-02-25', '09:30:00');

-- --------------------------------------------------------

--
-- Table structure for table `result`
--

CREATE TABLE `result` (
  `result_id` int(11) NOT NULL,
  `exam_id` int(11) DEFAULT NULL,
  `class_id` int(11) DEFAULT NULL,
  `teacher_id` int(11) DEFAULT NULL,
  `student_id` int(11) DEFAULT NULL,
  `subject_code` int(11) DEFAULT NULL,
  `score` decimal(5,2) DEFAULT NULL,
  `grade` varchar(5) DEFAULT NULL,
  `date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `result`
--

INSERT INTO `result` (`result_id`, `exam_id`, `class_id`, `teacher_id`, `student_id`, `subject_code`, `score`, `grade`, `date`) VALUES
(1, 1, 1, 10, 1, 101, 85.50, 'A', '2024-06-15'),
(2, 1, 1, 10, 1, 102, 80.25, 'A', '2024-06-15'),
(3, 1, 1, 10, 1, 103, 90.00, 'A', '2024-06-15'),
(4, 1, 1, 10, 1, 104, 85.75, 'A', '2024-06-15'),
(5, 1, 1, 10, 1, 105, 95.00, 'A+', '2024-06-15'),
(8, 2, 2, 2, 2, 101, 80.00, 'A+', '2024-02-02');

-- --------------------------------------------------------

--
-- Table structure for table `room`
--

CREATE TABLE `room` (
  `room_number` varchar(10) NOT NULL,
  `capacity` int(11) DEFAULT NULL,
  `room_type` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `room`
--

INSERT INTO `room` (`room_number`, `capacity`, `room_type`) VALUES
('101', 30, 'Classroom'),
('102', 25, 'Classroom'),
('103', 20, 'Classroom'),
('104', 30, 'Classroom'),
('105', 25, 'Teachers Room'),
('106', 20, 'Library'),
('107', 30, 'Canteen'),
('108', 25, 'Office'),
('201', 30, 'Classroom'),
('202', 25, 'Classroom'),
('203', 20, 'Computer Lab'),
('204', 30, 'Multipurpose Hall'),
('205', 25, 'Office'),
('206', 20, 'Classroom'),
('207', 30, 'Classroom'),
('208', 25, 'Classroom'),
('301', 30, 'Classroom'),
('302', 25, 'Classroom'),
('303', 20, 'Science Lab'),
('304', 30, 'Art Room'),
('305', 25, 'Classroom'),
('306', 20, 'Classroom'),
('307', 30, 'Classroom'),
('308', 25, 'Library');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `student_id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `date_of_birth` date NOT NULL,
  `gender` enum('Male','Female','Other') NOT NULL,
  `guardian_name` varchar(100) DEFAULT NULL,
  `guardian_contact_info` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`student_id`, `first_name`, `last_name`, `date_of_birth`, `gender`, `guardian_name`, `guardian_contact_info`) VALUES
(1, 'Mahmud', 'Rahman', '2005-05-05', 'Male', 'Abdul Rahman', '+8801XXXXXXXXX'),
(2, 'Nusrat', 'Akhter', '2006-07-15', 'Female', 'Rahim Khan', '+8801XXXXXXXXX'),
(3, 'Sohel', 'Hossain', '2007-10-25', 'Male', 'Kamal Hossain', '+8801XXXXXXXXX'),
(4, 'Tasnim', 'Begum', '2008-02-10', 'Female', 'Shakil Ahmed', '+8801XXXXXXXXX'),
(5, 'Rakib', 'Islam', '2009-06-20', 'Male', 'Farida Begum', '+8801XXXXXXXXX'),
(6, 'Nazma', 'Khatun', '2010-09-30', 'Female', 'Anwar Khan', '+8801XXXXXXXXX'),
(7, 'Shafiq', 'Ahmed', '2011-03-12', 'Male', 'Monira Akhter', '+8801XXXXXXXXX'),
(8, 'Tanjina', 'Begum', '2012-07-08', 'Female', 'Rahmat Ali', '+8801XXXXXXXXX'),
(9, 'Abdul', 'Chowdhury', '2013-10-15', 'Male', 'Salma Begum', '+8801XXXXXXXXX'),
(10, 'Rina', 'Islam', '2014-01-20', 'Female', 'Aminul Islam', '+8801XXXXXXXXX'),
(11, 'Hasan', 'Miah', '2015-04-01', 'Male', 'Fatima Akhter', '+8801XXXXXXXXX'),
(12, 'Farhana', 'Akhter', '2016-08-05', 'Female', 'Jamil Khan', '+8801XXXXXXXXX'),
(13, 'Rahim', 'Hossain', '2017-11-10', 'Male', 'Nadia Begum', '+8801XXXXXXXXX'),
(14, 'Nadia', 'Begum', '2018-02-15', 'Female', 'Shahidul Islam', '+8801XXXXXXXXX'),
(15, 'Jamil', 'Rahman', '2019-05-25', 'Male', 'Nargis Akhter', '+8801XXXXXXXXX'),
(16, 'Shirin', 'Akhter', '2020-08-30', 'Female', 'Kamal Hossain', '+8801XXXXXXXXX'),
(17, 'Kamal', 'Islam', '2021-12-05', 'Male', 'Taslima Begum', '+8801XXXXXXXXX'),
(18, 'Tania', 'Begum', '2022-03-10', 'Female', 'Shafiq Ahmed', '+8801XXXXXXXXX'),
(19, 'Rafi', 'Miah', '2023-06-15', 'Male', 'Nazma Akhter', '+8801XXXXXXXXX'),
(20, 'Fahmida', 'Begum', '2024-09-20', 'Female', 'Mahmud Chowdhury', '+8801XXXXXXXXX');

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

CREATE TABLE `subjects` (
  `subject_code` int(11) NOT NULL,
  `subject_name` varchar(100) DEFAULT NULL,
  `teacher_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `subjects`
--

INSERT INTO `subjects` (`subject_code`, `subject_name`, `teacher_id`) VALUES
(101, 'Bangla 1st Paper', 1),
(102, 'Bangla 2nd Paper', 1),
(103, 'English 1st Paper', 5),
(104, 'English 2nd Paper', 5),
(105, 'Mathematics', 9),
(106, 'General Science', 6),
(107, 'Social Science', 4),
(108, 'Religion and Moral Education', 2),
(109, 'Physical Education and Health', 7);

-- --------------------------------------------------------

--
-- Table structure for table `teacher`
--

CREATE TABLE `teacher` (
  `teacher_id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `date_of_birth` date NOT NULL,
  `gender` enum('Male','Female','Other') NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `salary` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `teacher`
--

INSERT INTO `teacher` (`teacher_id`, `first_name`, `last_name`, `date_of_birth`, `gender`, `email`, `salary`) VALUES
(1, 'Rahim', 'Ali', '1985-03-15', 'Male', 'rahimali@example.com', 50000.00),
(2, 'Fatima', 'Akter', '1990-07-20', 'Female', 'fatimaakter@example.com', 55000.00),
(3, 'Kamal', 'Hossain', '1978-11-02', 'Male', 'kamalhossain@example.com', 60000.00),
(4, 'Nusrat', 'Khan', '1982-05-10', 'Female', 'nusratkhan@example.com', 48000.00),
(5, 'Jamil', 'Islam', '1987-09-25', 'Male', 'jamilislam@example.com', 52000.00),
(6, 'Taslima', 'Begum', '1975-12-12', 'Female', 'taslimabegum@example.com', 58000.00),
(7, 'Shafiq', 'Ahmed', '1980-04-30', 'Male', 'shafiqahmed@example.com', 56000.00),
(8, 'Nazma', 'Akhter', '1993-01-08', 'Female', 'nazmaakhter@example.com', 54000.00),
(9, 'Mahmud', 'Chowdhury', '1973-08-18', 'Male', 'mahmudchowdhury@example.com', 62000.00),
(10, 'Nargis', 'Begum', '1988-06-05', 'Female', 'nargisbegum@example.com', 59000.00);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`attendance_id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `class_id` (`class_id`);

--
-- Indexes for table `classes`
--
ALTER TABLE `classes`
  ADD PRIMARY KEY (`class_id`),
  ADD KEY `teacher_id` (`teacher_id`),
  ADD KEY `room_number` (`room_number`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`employee_id`);

--
-- Indexes for table `exams`
--
ALTER TABLE `exams`
  ADD PRIMARY KEY (`exam_id`);

--
-- Indexes for table `result`
--
ALTER TABLE `result`
  ADD PRIMARY KEY (`result_id`),
  ADD KEY `exam_id` (`exam_id`),
  ADD KEY `class_id` (`class_id`),
  ADD KEY `teacher_id` (`teacher_id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `subject_code` (`subject_code`);

--
-- Indexes for table `room`
--
ALTER TABLE `room`
  ADD PRIMARY KEY (`room_number`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`student_id`);

--
-- Indexes for table `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`subject_code`),
  ADD KEY `teacher_id` (`teacher_id`);

--
-- Indexes for table `teacher`
--
ALTER TABLE `teacher`
  ADD PRIMARY KEY (`teacher_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attendance`
--
ALTER TABLE `attendance`
  MODIFY `attendance_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `classes`
--
ALTER TABLE `classes`
  MODIFY `class_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `employee_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `exams`
--
ALTER TABLE `exams`
  MODIFY `exam_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `result`
--
ALTER TABLE `result`
  MODIFY `result_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `student`
--
ALTER TABLE `student`
  MODIFY `student_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `teacher`
--
ALTER TABLE `teacher`
  MODIFY `teacher_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `attendance`
--
ALTER TABLE `attendance`
  ADD CONSTRAINT `attendance_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`),
  ADD CONSTRAINT `attendance_ibfk_2` FOREIGN KEY (`class_id`) REFERENCES `classes` (`class_id`);

--
-- Constraints for table `classes`
--
ALTER TABLE `classes`
  ADD CONSTRAINT `classes_ibfk_1` FOREIGN KEY (`teacher_id`) REFERENCES `teacher` (`teacher_id`),
  ADD CONSTRAINT `classes_ibfk_2` FOREIGN KEY (`room_number`) REFERENCES `room` (`room_number`);

--
-- Constraints for table `result`
--
ALTER TABLE `result`
  ADD CONSTRAINT `result_ibfk_1` FOREIGN KEY (`exam_id`) REFERENCES `exams` (`exam_id`),
  ADD CONSTRAINT `result_ibfk_2` FOREIGN KEY (`class_id`) REFERENCES `classes` (`class_id`),
  ADD CONSTRAINT `result_ibfk_3` FOREIGN KEY (`teacher_id`) REFERENCES `teacher` (`teacher_id`),
  ADD CONSTRAINT `result_ibfk_4` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`),
  ADD CONSTRAINT `result_ibfk_5` FOREIGN KEY (`subject_code`) REFERENCES `subjects` (`subject_code`);

--
-- Constraints for table `subjects`
--
ALTER TABLE `subjects`
  ADD CONSTRAINT `subjects_ibfk_1` FOREIGN KEY (`teacher_id`) REFERENCES `teacher` (`teacher_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
