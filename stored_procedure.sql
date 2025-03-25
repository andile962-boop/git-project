USE AutoTest;
GO

-- Create a stored procedure to insert data into the user table
CREATE PROCEDURE InsertUser
    @Name VARCHAR(50),
    @Surname VARCHAR(50),
    @Email VARCHAR(100)
AS
BEGIN
    INSERT INTO [user] (Name, Surname, Email)
    VALUES (@Name, @Surname, @Email);
END;
GO

-- Execute the stored procedure with sample data
EXEC InsertUser 'John', 'Doe', 'john.doe@example.com';
EXEC InsertUser 'Jane', 'Smith', 'jane.smith@example.com';
GO

-- Verify the data
SELECT * FROM [user];
GO