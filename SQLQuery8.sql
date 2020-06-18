CREATE DATABASE db_Library
GO

USE db_Library
GO

CREATE TABLE tbl_Library_Branch (
	BranchID INT PRIMARY KEY NOT NULL IDENTITY(1000,100),
	BranchName VARCHAR(50) NOT NULL,
	BranchAddress VARCHAR(100) NOT NULL
);

CREATE TABLE tbl_Publisher (
	PublisherName VARCHAR(255) PRIMARY KEY NOT NULL,
	PublisherAddress VARCHAR(255) NOT NULL,
	PublisherPhone VARCHAR(50) NOT NULL
);

CREATE TABLE tbl_Books (
	BookID INT PRIMARY KEY NOT NULL IDENTITY(100,10),
	Title VARCHAR(255) NOT NULL,
	PublisherName VARCHAR(255) NOT NULL CONSTRAINT fk_PublisherID FOREIGN KEY REFERENCES tbl_Publisher(PublisherName) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE tbl_Book_Copies (
	BookID INT NOT NULL CONSTRAINT fk_CopiesID FOREIGN KEY REFERENCES tbl_Books(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
	BranchID INT NOT NULL CONSTRAINT fk_BranchID FOREIGN KEY REFERENCES tbl_Library_Branch(BranchID) ON UPDATE CASCADE ON DELETE CASCADE,
	Number_Of_Copies INT NOT NULL 
);

CREATE TABLE tbl_Book_Authors (
	BookID INT NOT NULL CONSTRAINT fk_AuthorsID FOREIGN KEY REFERENCES tbl_Books(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
	Author_fName VARCHAR(255),
	Author_lName VARCHAR(255)
);

CREATE TABLE tbl_Borrower (
	CardNo INT PRIMARY KEY NOT NULL IDENTITY(1,1),
	fName VARCHAR(255) NOT NULL,
	lName VARCHAR(255) NOT NULL,
	BorrowerAddress VARCHAR(255) NOT NULL,
	BorrowerPhone VARCHAR(50) NOT NULL
);

CREATE TABLE tbl_Book_Check_Out (
	BookID INT NOT NULL CONSTRAINT fk_Book_CheckoutID FOREIGN KEY REFERENCES tbl_Books(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
	BranchID INT NOT NULL CONSTRAINT fk_Book_BranchID FOREIGN KEY REFERENCES tbl_Library_Branch(BranchID) ON UPDATE CASCADE ON DELETE CASCADE,
	CardNo INT NOT NULL CONSTRAINT fk_CardNo FOREIGN KEY REFERENCES tbl_Borrower(CardNo) ON UPDATE CASCADE ON DELETE CASCADE,
	DateOut  VARCHAR(50) NOT NULL,
	DateDue VARCHAR(50) NOT NULL
);

INSERT INTO tbl_Library_Branch
	(BranchName, BranchAddress)
	VALUES
	('Salt Lake City Downtown', '135 N Main St.'),
	('Bountiful', '6724 Bountiful St.'),
	('Layton', '89 N. Prairie Drive'),
	('American Fork', '810 S. 600 N.'),
	('Draper', '450 Bicycle Lane'),
	('Sharpstown', '620 Where is this Town')
;

INSERT INTO tbl_Publisher
	(PublisherName, PublisherAddress, PublisherPhone)
	VALUES
	('Alfreds Books', '335 Book Lane', '775-463-2122'),
	('Farrar, Straus & Giroux', 'New York Times', '602-444-5129'),
	('Doubleday Printers', '2019 Forrest Street', '656-554-8195'),
	('Yale University Press', '484 Boston University Lane', '800-468-2100'),
	('Grove Press', '123 French Quarter Blvd', '800-668-1000'),
	('Bloomsbury Publishing', '456 Bloomingburg Street', '690-480-3456'),
	('Simon & Schuster', '6950 Schuster List View', '888-690-5491'),
	('Create Space', '1234 Bases Loaded Road', '864-222-1483'),
	('Fox News', 'Channel 13 TV Nightly', '800-432-1234'),
	('The Washington Post', '140 Capitol Street', '800-765-1111')
;

INSERT INTO tbl_Books
	(Title, PublisherName)
	VALUES
	('Disappearing Earth', 'Alfreds Books'),
	('The Topeka School', 'Farrar, Straus & Giroux'),
	('Exhalation', 'Alfreds Books'),
	('Lost Children Archive', 'Alfreds Books'),
	('Night Boat to Tangier', 'Doubleday Printers'),
	('Say Nothing', 'Doubleday Printers'),
	('The Club', 'Yale University Press'),
	('The Yellow House', 'Grove Press'),
	('No Visible Bruises', 'Bloomsbury Publishing'),
	('Midnight in Chernobyl', 'Simon & Schuster'),
	('The Lost Tribe', 'Create Space'),
	('Unfreedom of the Press', 'Fox News'),
	('Howard Stern Comes Again', 'Fox News'),
	('You are a Badass', 'Bloomsbury Publishing'),
	('The Mueller Report', 'The Washington Post'),
	('Strengths Finder 2.0', 'Doubleday Printers'),
	('It is not Supposed to be this Way', 'Doubleday Printers'),
	('The Meltdown', 'Grove Press'),
	('The Woman in the Window', 'Farrar, Straus & Giroux'),
	('The Life-Changing Magic of Tidying Up', 'Doubleday Printers')
;

INSERT INTO tbl_Book_Copies
	(BookID, BranchID, Number_Of_Copies)
	VALUES
	(100, 1000, 8),
	(100, 1100, 4),
	(100, 1200, 16),
	(100, 1300, 5),
	(100, 1400, 11),
	(100, 1500, 6),
	(110, 1000, 8),
	(110, 1100, 4),
	(110, 1200, 16),
	(110, 1300, 5),
	(110, 1400, 11),
	(110, 1500, 6),
	(120, 1000, 8),
	(120, 1100, 4),
	(120, 1200, 16),
	(120, 1300, 5),
	(120, 1400, 11),
	(120, 1500, 6),
	(130, 1000, 8),
	(130, 1100, 4),
	(130, 1200, 16),
	(130, 1300, 5),
	(130, 1400, 11),
	(130, 1500, 6),
	(140, 1000, 8),
	(140, 1100, 4),
	(140, 1200, 16),
	(140, 1300, 5),
	(140, 1400, 11),
	(140, 1500, 6),
	(150, 1000, 8),
	(150, 1100, 4),
	(150, 1200, 16),
	(150, 1300, 5),
	(150, 1400, 11),
	(150, 1500, 6),
	(160, 1000, 8),
	(160, 1100, 4),
	(160, 1200, 16),
	(160, 1300, 5),
	(160, 1400, 11),
	(160, 1500, 6),
	(170, 1000, 8),
	(170, 1100, 4),
	(170, 1200, 16),
	(170, 1300, 5),
	(170, 1400, 11),
	(170, 1500, 6),
	(180, 1000, 8),
	(180, 1100, 4),
	(180, 1200, 16),
	(180, 1300, 5),
	(180, 1400, 11),
	(180, 1500, 6),
	(190, 1000, 8),
	(190, 1100, 4),
	(190, 1200, 16),
	(190, 1300, 5),
	(190, 1400, 11),
	(190, 1500, 6),
	(200, 1000, 8),
	(200, 1100, 4),
	(200, 1200, 16),
	(200, 1300, 5),
	(200, 1400, 11),
	(200, 1500, 6),
	(210, 1000, 8),
	(210, 1100, 4),
	(210, 1200, 16),
	(210, 1300, 5),
	(210, 1400, 11),
	(210, 1500, 6),
	(220, 1000, 8),
	(220, 1100, 4),
	(220, 1200, 16),
	(220, 1300, 5),
	(220, 1400, 11),
	(220, 1500, 6),
	(230, 1000, 8),
	(230, 1100, 4),
	(230, 1200, 16),
	(230, 1300, 5),
	(230, 1400, 11),
	(230, 1500, 6),
	(240, 1000, 8),
	(240, 1100, 4),
	(240, 1200, 16),
	(240, 1300, 5),
	(240, 1400, 11),
	(240, 1500, 6),
	(250, 1000, 8),
	(250, 1100, 4),
	(250, 1200, 16),
	(250, 1300, 5),
	(250, 1400, 11),
	(250, 1500, 6),
	(260, 1000, 8),
	(260, 1100, 4),
	(260, 1200, 16),
	(260, 1300, 5),
	(260, 1400, 11),
	(260, 1500, 6),
	(270, 1000, 8),
	(270, 1100, 4),
	(270, 1200, 16),
	(270, 1300, 5),
	(270, 1400, 11),
	(270, 1500, 6),
	(280, 1000, 8),
	(280, 1100, 4),
	(280, 1200, 16),
	(280, 1300, 5),
	(280, 1400, 11),
	(280, 1500, 6),
	(290, 1000, 8),
	(290, 1100, 4),
	(290, 1200, 16),
	(290, 1300, 5),
	(290, 1400, 11),
	(290, 1500, 6)
;

INSERT INTO tbl_Book_Authors
	(BookID, Author_fName, Author_lName)
	VALUES
	(100, 'Julia', 'Phillips'),
	(110, 'Ben', 'Lerner'),
	(120, 'Ted', 'Chiang'),
	(130, 'Valeria', 'Luiselli'),
	(140, 'Kevin', 'Barry'),
	(150, 'Patrick Radden', 'Keefe'),
	(160, 'Leo', 'Damrosch'),
	(170, 'Sarah M.', 'Broom'),
	(180, 'Rachel Louise', 'Snyder'),
	(190, 'Adam', 'Higginbotham'),
	(200, 'Matthew', 'Caldwell'),
	(210, 'Mark R.', 'Levin'),
	(220, 'Howard', 'Stern'),
	(230, 'Jen', 'Sincero'),
	(240, 'Rosalinf S.', 'Helderman'),
	(250, 'Don', 'Clifton'),
	(260, 'Lysa', 'Terkeurst'),
	(270, 'Jeff', 'Kinney'),
	(280, 'A. J.', 'Finn'),
	(290, 'Marie', 'Kondo')
;

INSERT INTO tbl_Borrower
	(fName, lName, BorrowerAddress, BorrowerPhone)
	VALUES
	('Jason Derek', 'Brown', '140 Yale Street', '901-586-4422'),
	('Robert William', 'Fisher', '600 Go Fishing Lane', '944-623-1586'),
	('Chetanbhai Patel', 'Bhadreshkumar', '563 Checklo USA', '865-443-1287'),
	('Alejandro Rosales', 'Castillo', '6759 Pamela Lane', '669-4391-6943'),
	('Arnold', 'Jiminez', '789 Book Reader Road', '685-493-4330'),
	('Yaser Abdel', 'Said', '9954 Isreal', '564-943-0013'),
	('Alexis', 'Flores', '60934 Highway 24', '884-333-0184'),
	('Eugene', 'Palmer', '9504 Cowboy Lane', '492-330-1500')
;
INSERT INTO tbl_Book_Check_Out
	(BookID, BranchID, CardNo, DateOut, DateDue)
	VALUES
	(100, 1000, 1, '05/15/2020', '06/15/2020'),
	(100, 1000, 2, '05/15/2020', '06/15/2020'),
	(120, 1200, 3, '05/17/2020', '06/17/2020'),
	(130, 1400, 4, '05/18/2020', '06/18/2020'),
	(140, 1400, 4, '05/18/2020', '06/18/2020'),
	(110, 1400, 4, '05/18/2020', '06/18/2020'),
	(150, 1100, 5, '05/20/2020', '06/20/2020'),
	(110, 1000, 6, '05/22/2020', '06/22/2020'),
	(100, 1500, 8, '05/22/2020', '06/22/2020'),
	(140, 1300, 7, '05/23/2020', '06/23/2020')
;

SELECT * FROM tbl_Book_Check_Out 
FULL OUTER JOIN tbl_Borrower ON tbl_Book_Check_Out.CardNo = tbl_Borrower.CardNo
FULL OUTER JOIN tbl_Books ON tbl_Book_Check_Out.BookID = tbl_Books.BookID

SELECT Title, Author_lName, Author_fName
FROM tbl_Books
INNER JOIN tbl_Book_Authors
ON tbl_Books.BookID = tbl_Book_Authors.BookID

SELECT Title, BranchName, Number_Of_Copies
FROM tbl_Books
INNER JOIN tbl_Book_Copies ON tbl_Books.BookID = tbl_Book_Copies.BookID
INNER JOIN tbl_Library_Branch ON tbl_Book_Copies.BranchID = tbl_Library_Branch.BranchID
WHERE Title = 'The Lost Tribe' AND BranchName = 'Sharpstown'

SELECT Title, BranchName, Number_Of_Copies
FROM tbl_Books
INNER JOIN tbl_Book_Copies ON tbl_Books.BookID = tbl_Book_Copies.BookID
INNER JOIN tbl_Library_Branch ON tbl_Book_Copies.BranchID = tbl_Library_Branch.BranchID
WHERE Title = 'The Lost Tribe'

