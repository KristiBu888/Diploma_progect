CREATE DATABASE IF NOT EXISTS db_quiz_game;

USE db_quiz_game;

DROP TABLE IF EXISTS users;
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    birthdate DATE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

DROP TABLE IF EXISTS questions;
CREATE TABLE questions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    question_text VARCHAR(255) NOT NULL,
    answer_a VARCHAR(255),
    answer_b VARCHAR(255),
    answer_c VARCHAR(255),
    answer_d VARCHAR(255),
    correct_answer CHAR(1)
);

INSERT INTO questions (question_text, answer_a, answer_b, answer_c, answer_d, correct_answer)
VALUES
('Which interface defines the sorting order of elements in Java collections?',
'Comparable',
'Comparator',
'Sortable',
'Orderable',
'b'),
('What is autoboxing and unboxing in Java?',
'Automatic conversion of primitive types to objects and vice versa',
'Process of creating and deleting objects',
'Exception handling mechanism',
'Features of working with collections',
'a'),
('Which of the following operations cannot be performed with immutable strings (String) in Java?',
'Concatenation',
'Comparison',
'Changing a single character',
'Conversion to a character array',
'c'),
('What are marker interfaces in Java? Choose one example',
'Interfaces without methods, used to denote special properties of a class',
'Interfaces implementing specific methods',
'Syntax error in Java',
'Interfaces used only for creating abstract classes',
'a'),
('Which collection is best suited for storing unique elements in the order they were added?',
'ArrayList',
'HashSet',
'LinkedList',
'TreeMap',
'b'),
('What is the equals() method in Java and how is it related to the hashCode() method?',
'Determines object equality. hashCode() is used for search optimization',
'Determines the sorting order of objects',
'Used for cloning objects',
'Has no relation to hashCode()',
'a'),
('Which keyword is used to create an abstract class in Java?',
'abstract',
'interface',
'virtual',
'abstract class',
'a'),
('What is an exception in Java?',
'An error that interrupts the execution of a program',
'A way to transfer data between methods',
'A syntax error in the code',
'A mechanism for creating multithreaded applications',
'a'),
('Which of the following collections is best suited for storing elements in ascending key order?',
'HashMap',
'HashSet',
'TreeMap',
'LinkedHashMap',
'c'),
('What is serialization in Java and why is it used?',
'The process of converting an object into a sequence of bytes for storage or transmission',
'A way to create multithreaded applications',
'A mechanism for creating a graphical interface',
'Optimization of working with collections',
'a');

-- Table for storing game sessions
DROP TABLE IF EXISTS quiz_sessions;
CREATE TABLE quiz_sessions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    start_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    end_time TIMESTAMP NULL,
    total_questions INT,
    remaining_lives INT,
    remaining_time INT,
    score INT,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

-- Table for storing detailed user answers
DROP TABLE IF EXISTS user_answers;
CREATE TABLE user_answers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    session_id INT,
    question_id INT,
    selected_answer CHAR(1),
    is_correct BOOLEAN,
    answer_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (session_id) REFERENCES quiz_sessions(id),
    FOREIGN KEY (question_id) REFERENCES questions(id)
);

-- Table for storing user statistics
DROP TABLE IF EXISTS user_statistics;
CREATE TABLE user_statistics (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    total_games INT DEFAULT 0,
    total_correct_answers INT DEFAULT 0,
    total_questions_attempted INT DEFAULT 0,
    best_score INT DEFAULT 0,
    average_time_per_question INT DEFAULT 0,
    last_played_date TIMESTAMP NULL,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

-- Indexes for query optimization
CREATE INDEX idx_session_user ON quiz_sessions(user_id);
CREATE INDEX idx_answer_session ON user_answers(session_id);
CREATE INDEX idx_answer_question ON user_answers(question_id);
CREATE INDEX idx_stats_user ON user_statistics(user_id);