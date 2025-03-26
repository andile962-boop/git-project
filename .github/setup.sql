-- Create the database AutoTest
CREATE DATABASE AutoTest;
GO

-- Use the AutoTest database
USE AutoTest;
GO

-- Create the user table
CREATE TABLE [user] (
    Name NVARCHAR(100),
    Surname NVARCHAR(100),
    Email NVARCHAR(100) UNIQUE
);
GO

-- Create the login for Auto_user
CREATE LOGIN Auto_user WITH PASSWORD = 'StrongPassword123';
GO

-- Create the user for the Auto_user login
CREATE USER Auto_user FOR LOGIN Auto_user;
GO

-- Add Auto_user to the db_owner role for full access
ALTER ROLE db_owner ADD MEMBER Auto_user;
GO

-- Create a stored procedure to insert a new user
CREATE PROCEDURE InsertUser
    @Name NVARCHAR(100),
    @Surname NVARCHAR(100),
    @Email NVARCHAR(100)
AS
BEGIN
    INSERT INTO [user] (Name, Surname, Email)
    VALUES (@Name, @Surname, @Email);
END;
GO
