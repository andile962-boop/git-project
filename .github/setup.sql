USE master;
GO

-- Create database if not exists
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = 'AutoTest')
BEGIN
    CREATE DATABASE AutoTest;
    PRINT 'Database AutoTest created successfully.';
END
ELSE
BEGIN
    PRINT 'Database AutoTest already exists.';
END
GO

USE AutoTest;
GO

-- Create stored procedure for complete setup
CREATE OR ALTER PROCEDURE InsertUser
AS
BEGIN
    -- Create user table if not exists
    IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'user')
    BEGIN
        CREATE TABLE [User] (
            [Name] NVARCHAR(100) NOT NULL,
            [Surname] NVARCHAR(100) NOT NULL,
            [Email] NVARCHAR(255) PRIMARY KEY
        );
        PRINT 'Table user created successfully.';
        
        -- Insert sample data
        INSERT INTO [user] (Name, Surname, Email)
        VALUES 
            ('John', 'Doe', 'john.doe@example.com'),
            ('Jane', 'Smith', 'jane.smith@example.com'),
            ('Admin', 'User', 'admin@autotest.com');
        PRINT 'Sample data inserted successfully.';
    END
    ELSE
    BEGIN
        PRINT 'Table user already exists.';
    END
    
    -- Additional setup logic can be added here
END
GO

-- Execute the stored procedure
EXEC InsertUser;
GO
GO
