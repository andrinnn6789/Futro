-- Erstelle die Datenbank FutroDb
IF NOT EXISTS(SELECT * FROM sys.databases WHERE name = 'FutroDb')
	BEGIN
		CREATE DATABASE FutroDb
	END
GO

USE FutroDb
GO

DROP TABLE IF EXISTS dbo.Registrations
GO
DROP TABLE IF EXISTS dbo.Representatives
GO
DROP TABLE IF EXISTS dbo.Participants
GO
DROP TABLE IF EXISTS dbo.Addresses
GO

-- Erstelle die Tabelle Addresses
CREATE TABLE Addresses (
    Id INT PRIMARY KEY,
    Street NVARCHAR(MAX) NOT NULL,
    City NVARCHAR(MAX) NOT NULL,
    PostalCode NVARCHAR(MAX) NOT NULL
);

-- Erstelle die Tabelle Participants
CREATE TABLE  Participants (
    Id INT PRIMARY KEY,
    FirstName NVARCHAR(MAX) NOT NULL,
    LastName NVARCHAR(MAX) NOT NULL,
    Gender INT,
    Birthdate NVARCHAR(MAX) NOT NULL,
    Club NVARCHAR(MAX),
    Height NVARCHAR(MAX),
    PlaysInClub INT,
    TShirtSize INT
);

-- Erstelle die Tabelle Representatives
CREATE TABLE Representatives (
    Id INT PRIMARY KEY,
    FirstName NVARCHAR(MAX) NOT NULL,
    LastName NVARCHAR(MAX) NOT NULL,
    Gender INT,
    AddressId INT,
    Camp NVARCHAR(MAX),
    Email NVARCHAR(MAX),
    PhoneNumber NVARCHAR(MAX),
    FOREIGN KEY (AddressId) REFERENCES Addresses(Id)
);

-- Erstelle die Tabelle Registrations
CREATE TABLE Registrations (
    Id INT PRIMARY KEY,
    ParticipantId INT,
    RepresentativeId INT,
    FOREIGN KEY (ParticipantId) REFERENCES Participants(Id),
    FOREIGN KEY (RepresentativeId) REFERENCES Representatives(Id)
)
GO

-- Füge Testdaten in die Tabelle Addresses ein
INSERT INTO Addresses (Id, Street, City, PostalCode)
VALUES
    (1, '123 Main Street', 'City1', '12345'),
    (2, '456 Oak Avenue', 'City2', '67890');

-- Füge Testdaten in die Tabelle Participants ein
INSERT INTO Participants (Id, FirstName, LastName, Gender, Birthdate, Club, Height, PlaysInClub, TShirtSize)
VALUES
    (1, 'John', 'Doe', 1, '1990-01-15', 'ClubA', '180 cm', 3, 2),
    (2, 'Jane', 'Smith', 2, '1985-05-20', 'ClubB', '170 cm', 5, 1);

-- Füge Testdaten in die Tabelle Representatives ein
INSERT INTO Representatives (Id, FirstName, LastName, Gender, AddressId, Camp, Email, PhoneNumber)
VALUES
    (1, 'Alice', 'Johnson', 2, 1, 'Camp1', 'alice@example.com', '123-456-7890'),
    (2, 'Bob', 'Williams', 1, 2, 'Camp2', 'bob@example.com', '987-654-3210');

-- Füge Testdaten in die Tabelle Registrations ein
INSERT INTO Registrations (Id, ParticipantId, RepresentativeId)
VALUES
    (1, 1, 1),
    (2, 2, 2);
    
GO