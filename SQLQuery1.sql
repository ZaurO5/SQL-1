CREATE DATABASE MyApp;
GO

USE MyApp;
GO

CREATE TABLE Users (
    Id INT PRIMARY KEY IDENTITY (1, 1),
    [Name] NVARCHAR(50) NOT NULL,
    Surname NVARCHAR(50) NOT NULL,
    Email NVARCHAR(50) UNIQUE,
    RegistrationDate DATE DEFAULT GETDATE() CONSTRAINT CHK_RegistrationDate CHECK (RegistrationDate <= GETDATE()),
    ContactNumber VARCHAR(20) DEFAULT '+994XXXXXXXXX',
    Age INT CHECK (Age >= 18),
    Address NVARCHAR(100)
);
GO

INSERT INTO Users ([Name], Surname, Email, RegistrationDate, ContactNumber, Age, Address) VALUES
(
    'Zaur',
    'Huseynov',
    'Z.HUS@GMAIL.COM',
    '2024-06-22',
    '+994123456789',
    20,
    'BAKU AZERBAIJAN'
);
GO

CREATE TABLE Categories (
    Id INT PRIMARY KEY IDENTITY,
    Name VARCHAR(255) NOT NULL,
    Slug VARCHAR(255) UNIQUE NOT NULL,
    CreatedAt DATETIME NOT NULL DEFAULT GETDATE() CHECK (CreatedAt <= GETDATE()),
    IsActive BIT NOT NULL
);
GO

INSERT INTO Categories (Name, Slug, CreatedAt, IsActive) VALUES
    ('Windows', 'windows', GETDATE(), 1),
    ('Math', 'math', GETDATE(), 1),
    ('BMW', 'bmw', GETDATE(), 1);
GO

SELECT [Name], Surname, Email
FROM Users;
GO

SELECT Name, IsActive
FROM Categories;
GO
