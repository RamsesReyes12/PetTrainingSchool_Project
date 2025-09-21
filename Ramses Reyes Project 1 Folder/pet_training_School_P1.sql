CREATE DATABASE PetTrainingSchool;
USE PetTrainingSchool;
-- Owner table
CREATE TABLE Owner (
    owner_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    phone VARCHAR(20),
    email VARCHAR(100),
    address VARCHAR(200)
);

-- Pet table
CREATE TABLE Pet (
    pet_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    species VARCHAR(50),
    breed VARCHAR(50),
    age INT,
    owner_id INT,
    FOREIGN KEY (owner_id) REFERENCES Owner(owner_id)
);

-- Trainer table
CREATE TABLE Trainer (
    trainer_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    specialty VARCHAR(50),
    phone VARCHAR(20),
    email VARCHAR(100)
);

-- Class table
CREATE TABLE Class (
    class_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    schedule VARCHAR(100),
    cost DECIMAL(8,2),
    trainer_id INT,
    FOREIGN KEY (trainer_id) REFERENCES Trainer(trainer_id)
);

-- Session table
CREATE TABLE Session (
    session_id INT AUTO_INCREMENT PRIMARY KEY,
    class_id INT,
    session_date DATE,
    session_time TIME,
    FOREIGN KEY (class_id) REFERENCES Class(class_id)
);

-- Enrollment table (associative table for M:N Pet-Class)
CREATE TABLE Enrollment (
    enrollment_id INT AUTO_INCREMENT PRIMARY KEY,
    pet_id INT,
    class_id INT,
    enrollment_date DATE,
    FOREIGN KEY (pet_id) REFERENCES Pet(pet_id),
    FOREIGN KEY (class_id) REFERENCES Class(class_id)
);

-- ProgressReport table (associative table for M:N Pet-Session)
CREATE TABLE ProgressReport (
    report_id INT AUTO_INCREMENT PRIMARY KEY,
    pet_id INT,
    session_id INT,
    notes TEXT,
    grade VARCHAR(10),
    FOREIGN KEY (pet_id) REFERENCES Pet(pet_id),
    FOREIGN KEY (session_id) REFERENCES Session(session_id)
);

-- Payment table
CREATE TABLE Payment (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    owner_id INT,
    amount DECIMAL(8,2),
    payment_date DATE,
    method VARCHAR(50),
    FOREIGN KEY (owner_id) REFERENCES Owner(owner_id)
);
