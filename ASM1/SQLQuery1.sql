CREATE DATABASE ASM_java3_Fall2025;
GO

USE ASM_java3_Fall2025;
GO


CREATE TABLE Categories (
    Id VARCHAR(20) PRIMARY KEY,
    Name NVARCHAR(100) NOT NULL
);


INSERT INTO Categories (Id, Name)
VALUES 
('POL', N'Chính trị'),
('TEC', N'Công nghệ'),
('SPO', N'Thể thao');





CREATE TABLE Users (
    Id VARCHAR(50) PRIMARY KEY,
    Password VARCHAR(100) NOT NULL,
    Fullname NVARCHAR(100) NOT NULL,
    Birthday DATE NULL,
    Gender BIT NOT NULL,  -- 1=Nam, 0=Nữ
    Mobile VARCHAR(20),
    Email VARCHAR(100),
    Role BIT NOT NULL      -- 1=Admin, 0=Reporter
);

INSERT INTO Users (Id, Password, Fullname, Birthday, Gender, Mobile, Email, Role)
VALUES 
('admin', '123', N'Quản Trị Viên', '1990-01-01', 1, '0123456789', 'admin@gmail.com', 1),
('pv01', '123', N'Phóng Viên A', '1995-05-10', 1, '0987654321', 'pv01@gmail.com', 0);





CREATE TABLE News (
    Id VARCHAR(20) PRIMARY KEY,
    Title NVARCHAR(255) NOT NULL,
    Content NVARCHAR(MAX) NOT NULL,
    Image VARCHAR(255),
    PostedDate DATE DEFAULT GETDATE(),
    Author VARCHAR(50) NOT NULL,
    ViewCount INT DEFAULT 0,
    CategoryId VARCHAR(20) NOT NULL,
    Home BIT DEFAULT 0,

    CONSTRAINT FK_NEWS_AUTHOR FOREIGN KEY (Author)
        REFERENCES Users(Id),

    CONSTRAINT FK_NEWS_CAT FOREIGN KEY (CategoryId)
        REFERENCES Categories(Id)
);


INSERT INTO News (Id, Title, Content, Image, Author, CategoryId, Home)
VALUES 
('N001', N'Tin Công Nghệ 1', N'Nội dung tin...', 'img1.jpg', 'pv01', 'TEC', 1),
('N002', N'Tin Thể Thao 1', N'Nội dung tin...', 'img2.jpg', 'pv01', 'SPO', 0);






CREATE TABLE Newsletters (
    Email VARCHAR(100) PRIMARY KEY,
    Enabled BIT DEFAULT 1
);
