Create database RealEstate
on primary(Name='RealEstate_data',FileName='D:\Sql trainig cases\Case\RealEstate.mdf')
log on(Name='RealEstate_log',filename='D:\Sql trainig cases\Case\RealEstate.ldf')

USE REALESTATE

CREATE TABLE PROJECT_TYPE
(
TYPEID INT PRIMARY KEY,
TYPETITLE NVARCHAR(30)
)
INSERT INTO PROJECT_TYPE VALUES
(100,'Resedential'),
(200,'Commercial')
--------=================================================
CREATE TABLE PROJECTS
(
PROJECT_ID INT PRIMARY KEY IDENTITY(5,5),
PROJECT_TITLE NVARCHAR(30),
PROJECT_LOCATION NVARCHAR(30),
PROJECT_TYPE INT, FOREIGN KEY (PROJECT_TYPE) REFERENCES PROJECT_TYPE(TYPEID)
)
INSERT INTO PROJECTS VALUES
('Meamar Elmorshdi','Cairo',100),
('Blurry Eye','Alexandria',200),
('Sosimari','Damietta',100),
('Joevana','Hurghada',200),
('Maryana','SharmElshiekh',200),
('Buri Tower','Aswan',100)

----======================================================
CREATE TABLE BUILDINGS
(
BUILDING_ID INT PRIMARY KEY IDENTITY(10,10),
BULDING_TITLE NVARCHAR(30),
NUMBER_OF_FLOORS INT,
PROJECT INT, FOREIGN KEY (PROJECT) REFERENCES PROJECTS(PROJECT_ID)
)
INSERT INTO BUILDINGS VALUES
('Savi',5,5),
('Tami',7,5),
('fasho',4,10),
('Selmana',4,10),
('Ramino',9,15),
('Lelyvana',7,15),
('Taitojay',9,20),
('Saqiqi',5,20),
('Lam3ana',8,25),
('Latif',3,25),
('Saher',2,30),
('Mashahel',4,30)

--========================================================
CREATE TABLE ITEM_TYPES
(
TYPEID INT PRIMARY KEY,
TYPETITLE NVARCHAR(30)
)
INSERT INTO ITEM_TYPES VALUES
(300,'Aappartment'),
(400,'Shop')
--========================================================
CREATE TABLE ITEM_STATUS
(
STATUS_ID INT PRIMARY KEY,
STATUS_TITLE NVARCHAR(30)
)
INSERT INTO ITEM_STATUS VALUES
(500,'Available'),
(600,'Sold'),
(700,'Reserved')

--=========================================================
CREATE TABLE ITEMS
(
ITEM_ID INT PRIMARY KEY IDENTITY(100,100),
ITEM_TYPE INT, FOREIGN KEY (ITEM_TYPE) REFERENCES ITEM_TYPES(TYPEID),
ITEM_STATUS INT, FOREIGN KEY (ITEM_STATUS) REFERENCES ITEM_STATUS(STATUS_ID),
BUILDING INT,FOREIGN KEY(BUILDING) REFERENCES BUILDINGS(BUILDING_ID),
OWNER_ID INT, FOREIGN KEY (OWNER_ID) REFERENCES OWNERS(OWNER_ID),
FLOOR_NUM INT,
AREA VARCHAR(20)
)
INSERT INTO ITEMS
(ITEM_TYPE,ITEM_STATUS,BUILDING,OWNER_ID,FLOOR_NUM,AREA)
VALUES
(300, 500, 10, 1000, 3, '150 sqm'), 
(300, 500, 20, 1000, 2, '200 sqm'), 
(300, 600, 30, 2000, 5, '300 sqm'),
(400, 600, 40, 2000, 3, '150 sqm'), 
(400, 700, 50, 3000, 2, '200 sqm'), 
(400, 700, 60, 3000, 5, '300 sqm');

--===========================================================================
CREATE TABLE OWNERS
(
OWNER_ID INT PRIMARY KEY,
OWNER_NAME NVARCHAR(30),
OWNER_MAIL NVARCHAR(30)
)
INSERT INTO OWNERS VALUES
(1000,'Kirollos Samer','kiro@ex.com'),
(2000,'Jana Amr','jana@ex.com'),
(3000,'Osama samy','osama@ex.com'),
(4000,'Sara Mohamed','sara@ex.com')

--==================================================================
SELECT B.BUILDING_ID,p.PROJECT_ID FROM BUILDINGS B
JOIN PROJECTS P
ON B.PROJECT=P.PROJECT_ID
WHERE P.PROJECT_ID =10

--=================================================================
SELECT B.BUILDING_ID,I.ITEM_ID FROM ITEMS I
JOIN BUILDINGS B
ON I.BUILDING=B.BUILDING_ID
WHERE B.BUILDING_ID=10
--================================================================

SELECT O.OWNER_id,O.OWNER_MAIL,O.OWNER_NAME, I.ITEM_ID FROM OWNERS O
JOIN ITEMS I
ON O.OWNER_ID=I.OWNER_ID
WHERE ITEM_ID=200
