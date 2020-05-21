
--EXERCISE 1
CREATE DATABASE Minions

--EXERCISE 2
CREATE TABLE Minions(
Id INT NOT NULL,
[Name] NVARCHAR(35) NOT NULL,
Age INT NOT NULL
)

CREATE TABLE Towns(
Id INT NOT NULL,
[Name] NVARCHAR(35) NOT NULL
)

ALTER TABLE Minions
ADD CONSTRAINT PK_Minions PRIMARY KEY (Id)

ALTER TABLE Towns
ADD CONSTRAINT PK_Towns PRIMARY KEY (Id)

--EXERCISE 3
ALTER TABLE Minions
ADD TownId INT  NOT NULL

ALTER TABLE Minions
ADD FOREIGN KEY (TownId) REFERENCES Towns(Id)

--EXERCISE 4
ALTER TABLE Minions ALTER COLUMN Age INT NULL;

INSERT INTO Towns
VALUES(1, 'Sofia'),
	  (2, 'Plovdiv'),
	  (3, 'Varna')

INSERT INTO Minions
VALUES(1, 'Kevin', 22, 1),
	  (2, 'Bob', 15, 3),
	  (3, 'Steward',NULL ,2)
--EXERCISE 5
DELETE FROM Minions

--EXERCISE 6
DROP TABLE Minions
DROP TABLE Towns

--EXERCISE 7
CREATE TABLE People(
Id INT PRIMARY KEY IDENTITY NOT NULL,
[Name] NVARCHAR(200) NOT NULL,
Picture VARBINARY(MAX) ,
Height DECIMAL(18,2),
[Weight] DECIMAL(18,2), 
Gender CHAR(1) CHECK (Gender = 'm' OR Gender ='f') NOT NULL,
Birthday DATE NOT NULL,
Biography NTEXT 
)

INSERT INTO People
VALUES('Doncho', NULL, 155, 50, 'm', '1999-05-19', NULL),
	  ('Koko', NULL, NULL, NULL, 'm', '1997-03-17', 'HE WILL BE THE BEST PROGRAMMER'),
	  ('Petya', NULL, 145, 36,'f', '2003-08-10', NULL),
	  ('Svetlin', NULL, 180.53, 76.53,'m', '1980-08-10', 'LEGEND'),
	  ('Silvya', NULL, 155.555, 48,'f', '2000-05-1', NULL)

--EXERCISE 8
CREATE TABLE Users(
Id BIGINT NOT NULL PRIMARY KEY IDENTITY,
Username VARCHAR(30) UNIQUE NOT NULL,
Password VARCHAR(26)NOT NULL,
ProfilePicture VARBINARY(MAX), 
LastLoginTime DATETIME2 NOT NULL,
IsDeleted BIT NOT NULL,
)

INSERT INTO Users
VALUES('SeRQRWQRDker', 'ChDSADAo', NULL, '2018-06-23 23:59:59', 1),
	  ('KinSDADAgRagnar', 'rAGNARoK', NULL, '2O19-11-12 16:30:24', 0),
	  ('NabiKeyCXBGTHta', 'lfcFOREVER', NULL, '2020-05-20 17:30:00', 0),
	  ('BONHTEYENIEeM', 'NiayCho', NULL, '1900-01-01 00:00:00', 1),
	  ('BonJoREYREvi', 'ROCKWILLSAVETHEWORLD', NULL, '1900-01-01 00:00:00', 1)

--EXERCISE 9
ALTER TABLE Users
DROP CONSTRAINT PK__Users__3214EC072AFE1CAC;

ALTER TABLE Users
ADD CONSTRAINT PK_UsersPK PRIMARY KEY(Id, Username)

--EXERCISE 10
ALTER TABLE Users
ADD CHECK (LEN(Password) >= 5)

--EXERCISE 11
ALTER TABLE Users
ADD CONSTRAINT df_LastLogin
DEFAULT GETDATE() FOR LastLoginTime

--EXERCISE 12
ALTER TABLE Users 
DROP CONSTRAINT PK_UsersPK

ALTER TABLE Users
ADD CONSTRAINT PK_Users PRIMARY KEY(Id)

ALTER TABLE Users
ADD CHECK (LEN(Username) >=3)

