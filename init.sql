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
('Какой интерфейс определяет порядок сортировки элементов в коллекциях Java?',
'Comparable',
'Comparator',
'Sortable',
'Orderable',
'b'),
('Что такое автобоксинг и анбоксинг в Java?',
'Автоматическая конвертация примитивных типов в объекты и наоборот',
'Процесс создания и удаления объектов',
'Механизм исключений',
'Особенности работы с коллекциями',
'a'),
('Какая из следующих операций не может быть выполнена с неизменяемыми строками (String) в Java?',
'Конкатенация',
'Сравнение',
'Изменение отдельного символа',
'Преобразование в массив символов',
'c'),
('Что такое маркеры интерфейсов (marker interfaces) в Java? Выберите один из примеров',
'Интерфейсы без методов, используемые для обозначения специальных свойств класса',
'Интерфейсы, реализующие определенные методы',
'Синтаксическая ошибка в Java',
'Интерфейсы, используемые только для создания абстрактных классов',
'a'),
('Какая коллекция лучше всего подходит для хранения уникальных элементов в порядке их добавления?',
'ArrayList',
'HashSet',
'LinkedList',
'TreeMap',
'b'),
('Что такое метод equals() в Java и как он связан с методом hashCode()?',
'Определяет равенство объектов. hashCode() используется для оптимизации поиска',
'Определяет порядок сортировки объектов',
'Используется для клонирования объектов',
'Не имеет отношения к hashCode()',
'a'),
('Какая ключевое слово используется для создания абстрактного класса в Java?',
'abstract',
'interface',
'virtual',
'abstract class',
'a'),
('Что такое исключение (exception) в Java?',
'Ошибка, которая приводит к прерыванию выполнения программы',
'Способ передачи данных между методами',
'Синтаксическая ошибка в коде',
'Механизм для создания многопоточных приложений',
'a'),
('Какая из следующих коллекций лучше всего подходит для хранения элементов в порядке возрастания ключей?',
'HashMap',
'HashSet',
'TreeMap',
'LinkedHashMap',
'c'),
('Что такое сериализация в Java и зачем она используется?',
'Процесс преобразования объекта в последовательность байтов для сохранения или передачи',
'Способ создания многопоточных приложений',
'Механизм для создания графического интерфейса',
'Оптимизация работы с коллекциями',
'a');

-- Таблица для хранения игровых сессий
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

-- Таблица для хранения детальных ответов пользователя
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

-- Таблица для хранения статистики пользователей
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

-- Индексы для оптимизации запросов
CREATE INDEX idx_session_user ON quiz_sessions(user_id);
CREATE INDEX idx_answer_session ON user_answers(session_id);
CREATE INDEX idx_answer_question ON user_answers(question_id);
CREATE INDEX idx_stats_user ON user_statistics(user_id);