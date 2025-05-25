REM   Script: smartPublisher_DB
REM   The system is an electronic platform that connects publishers and bookstores, ensuring a smooth book distribution process.

CREATE TABLE Publisher ( 
Publisher_ID INT PRIMARY KEY, 
Name VARCHAR(100) UNIQUE, 
Contact_Info VARCHAR(100), 
Address VARCHAR(255), 
Establishment_Date DATE 
);

CREATE TABLE Stores ( 
Store_ID INT PRIMARY KEY, 
Name VARCHAR(100) UNIQUE, 
ContactInfo VARCHAR(100), 
Location VARCHAR(255), 
StoreType VARCHAR(50) 
);

CREATE TABLE Books ( 
BookID INT PRIMARY KEY, 
Title VARCHAR(150), 
Author VARCHAR(100), 
Price DECIMAL(10,2), 
Stock INT, 
PublisherID INT, 
FOREIGN KEY (PublisherID) REFERENCES Publisher(Publisher_ID) 
);

CREATE TABLE Orders ( 
OrderID INT PRIMARY KEY, 
StoreID INT, 
OrderDate DATE, 
Status VARCHAR(50), 
PaymentMethod VARCHAR(50), 
FOREIGN KEY (StoreID) REFERENCES Stores(Store_ID) 
);

CREATE TABLE Order_Details ( 
OrderDetailID INT PRIMARY KEY, 
OrderID INT, 
BookID INT, 
Quantity INT, 
Subtotal DECIMAL(10,2), 
FOREIGN KEY (OrderID) REFERENCES Orders(OrderID), 
FOREIGN KEY (BookID) REFERENCES Books(BookID) 
);

CREATE TABLE Order_Books ( 
OrderDetailID INT, 
BookID INT, 
PRIMARY KEY (OrderDetailID, BookID), 
FOREIGN KEY (OrderDetailID) REFERENCES Order_Details(OrderDetailID), 
FOREIGN KEY (BookID) REFERENCES Books(BookID) 
);

INSERT INTO Stores (Store_ID, Name, ContactInfo, Location, StoreType)  
VALUES (1, 'Jarir Bookstore', '920000089', 'Saudi Arabia', 'Library');

INSERT INTO Stores (Store_ID, Name, ContactInfo, Location, StoreType)  
VALUES (2, 'Virgin Bookstore', '8002448855', 'Saudi Arabia', 'Library');

INSERT INTO Stores (Store_ID, Name, ContactInfo, Location, StoreType)  
VALUES (3, 'Aafaq Bookstore', '055443969', 'Saudi Arabia', 'Library');

INSERT INTO Stores (Store_ID, Name, ContactInfo, Location, StoreType)  
VALUES (4, 'Alrushd Bookstore', '0500286429', 'Saudi Arabia', 'Library');

INSERT INTO Stores (Store_ID, Name, ContactInfo, Location, StoreType)  
VALUES (5, 'Ithra Library', '8001221224', 'Saudi Arabia', 'Library');

INSERT INTO Publisher (Publisher_ID, Name, Contact_Info, Address, Establishment_Date) VALUES 
(1, 'Tashkeel Publishing House', '0533222262', 'Abu Bakir As Sidiq Street, Riyadh, Saudi Arabia', NULL);

INSERT INTO Publisher (Publisher_ID, Name, Contact_Info, Address, Establishment_Date) VALUES 
(2, 'Al-Ra’idiyah Publishing House', 0550767000, '7781 Ibn Abi Maktum Street, Al Jubail, Saudi Arabia', NULL);

INSERT INTO Publisher (Publisher_ID, Name, Contact_Info, Address, Establishment_Date) VALUES 
(3, 'Takween Publishing House', '0565304966', 'Hobby District, King Fahd Branch Road,Riyadh, Saudi Arabia', TO_DATE('2016-03-01', 'YYYY-MM-DD'));

INSERT INTO Publisher (Publisher_ID, Name, Contact_Info, Address, Establishment_Date) VALUES 
(4, 'Irfa’a Publishing House', 0561212002, NULL, NULL);

INSERT INTO Publisher (Publisher_ID, Name, Contact_Info, Address, Establishment_Date) VALUES 
(5, 'Athar Publishing House', '0553978117', '7589 Prince Majid Road, Jeddah 22252, Saudi Arabia', TO_DATE('2010-01-01', 'YYYY-MM-DD'));

INSERT INTO Books (BookID, Title, Author, Price, Stock, PublisherID) 
VALUES (1, 'تعافيت', 'Ali Mousa', 45.00, 10, 1);

INSERT INTO Books (BookID, Title, Author, Price, Stock, PublisherID) 
VALUES (2, 'استخارة', 'Nouf Abdulkarim', 35.00, 8, 2);

INSERT INTO Books (BookID, Title, Author, Price, Stock, PublisherID) 
VALUES (3, 'باهر', 'Raghad Ahmed', 50.00, 12, 3);

INSERT INTO Books (BookID, Title, Author, Price, Stock, PublisherID) 
VALUES (4, 'لانك فان', 'Aya Bukhari', 40.00, 7, 4);

INSERT INTO Books (BookID, Title, Author, Price, Stock, PublisherID) 
VALUES (5, 'إدارة', 'Thamer Ali', 55.00, 9, 5);

INSERT INTO Books (BookID, Title, Author, Price, Stock, PublisherID) 
VALUES (6, 'روح', 'Hajar Ahmed', 38.00, 6, 1);

INSERT INTO Books (BookID, Title, Author, Price, Stock, PublisherID) 
VALUES (1, 'تعافيت', 'Ali Mousa', 45.00, 10, 1);

INSERT INTO Books (BookID, Title, Author, Price, Stock, PublisherID) 
VALUES (2, 'استخارة', 'Nouf Abdulkarim', 35.00, 8, 2);

INSERT INTO Books (BookID, Title, Author, Price, Stock, PublisherID) 
VALUES (3, 'باهر', 'Raghad Ahmed', 50.00, 12, 3);

INSERT INTO Books (BookID, Title, Author, Price, Stock, PublisherID) 
VALUES (4, 'لانك فان', 'Aya Bukhari', 40.00, 7, 4);

INSERT INTO Books (BookID, Title, Author, Price, Stock, PublisherID) 
VALUES (5, 'إدارة', 'Thamer Ali', 55.00, 9, 5);

INSERT INTO Books (BookID, Title, Author, Price, Stock, PublisherID) 
VALUES (6, 'روح', 'Hajar Ahmed', 38.00, 6, 1);

INSERT INTO Orders (OrderID, StoreID, OrderDate, Status, PaymentMethod) VALUES 
(1, 1, TO_DATE('2025-04-01', 'YYYY-MM-DD'), 'Shipped', 'Credit Card');

INSERT INTO Orders (OrderID, StoreID, OrderDate, Status, PaymentMethod) VALUES 
(2, 2, TO_DATE('2025-04-03', 'YYYY-MM-DD'), 'Delivered', 'Cash');

INSERT INTO Orders (OrderID, StoreID, OrderDate, Status, PaymentMethod) VALUES 
(3, 3, TO_DATE('2025-05-01', 'YYYY-MM-DD'), 'Processing', 'Bank Transfer');

INSERT INTO Orders (OrderID, StoreID, OrderDate, Status, PaymentMethod) VALUES 
(4, 4, TO_DATE('2025-05-08', 'YYYY-MM-DD'), 'Cancelled', 'Credit Card');

INSERT INTO Orders (OrderID, StoreID, OrderDate, Status, PaymentMethod) VALUES 
(5, 5, TO_DATE('2025-06-10', 'YYYY-MM-DD'), 'Pending', 'Cash');

INSERT INTO Order_Details (OrderDetailID, OrderID, BookID, Quantity, Subtotal) 
VALUES (1, 1, 1, 2, 90.00);

INSERT INTO Order_Details (OrderDetailID, OrderID, BookID, Quantity, Subtotal) 
VALUES (2, 1, 2, 1, 35.00);

INSERT INTO Order_Details (OrderDetailID, OrderID, BookID, Quantity, Subtotal) 
VALUES (3, 2, 3, 1, 50.00);

INSERT INTO Order_Details (OrderDetailID, OrderID, BookID, Quantity, Subtotal) 
VALUES (4, 3, 4, 3, 120.00);

INSERT INTO Order_Details (OrderDetailID, OrderID, BookID, Quantity, Subtotal) 
VALUES (5, 4, 5, 1, 55.00);

INSERT INTO Order_Details (OrderDetailID, OrderID, BookID, Quantity, Subtotal) 
VALUES (6, 5, 6, 2, 76.00);

INSERT INTO Order_Books (OrderDetailID, BookID) 
VALUES (1, 1);

INSERT INTO Order_Books (OrderDetailID, BookID) 
VALUES (2, 2);

INSERT INTO Order_Books (OrderDetailID, BookID) 
VALUES (3, 3);

INSERT INTO Order_Books (OrderDetailID, BookID) 
VALUES (4, 4);

INSERT INTO Order_Books (OrderDetailID, BookID) 
VALUES (5, 5);

INSERT INTO Order_Books (OrderDetailID, BookID) 
VALUES (6, 6);

SELECT Title, Author, Price 
FROM Books 
WHERE Price > 50 
ORDER BY Price DESC;

SELECT PublisherID, COUNT(*) AS TotalBooks, AVG(Price) AS AveragePrice 
FROM Books 
GROUP BY PublisherID;

SELECT s.Name AS StoreName, o.OrderID, o.OrderDate 
FROM Stores s 
JOIN Orders o ON s.Store_ID = o.StoreID 
WHERE o.OrderID IN ( 
SELECT OrderID FROM Order_Details WHERE Quantity >= 5 
);

SELECT s.Name AS StoreName, o.OrderID, o.OrderDate 
FROM Stores s 
JOIN Orders o ON s.Store_ID = o.StoreID 
WHERE o.OrderID IN ( 
SELECT OrderID FROM Order_Details WHERE Quantity >= 2 
);

SELECT b.Title, od.Quantity, od.Subtotal, o.OrderDate, s.Name AS StoreName 
FROM Order_Details od 
JOIN Books b ON od.BookID = b.BookID 
JOIN Orders o ON od.OrderID = o.OrderID 
JOIN Stores s ON o.StoreID = s.Store_ID;

EXEC GetBooksByPublisher(1)


CREATE OR REPLACE PROCEDURE GetBooksByPublisher(pub_id IN NUMBER) 
AS 
BEGIN 
    FOR r IN ( 
        SELECT BookID, Title, Author, Price, Stock 
        FROM Books 
        WHERE PublisherID = pub_id 
    ) LOOP 
        DBMS_OUTPUT.PUT_LINE( 
            'BookID: ' || r.BookID || ', Title: ' || r.Title || 
            ', Author: ' || r.Author || ', Price: ' || r.Price || 
            ', Stock: ' || r.Stock 
        ); 
    END LOOP; 
END; 
/

EXEC GetBooksByPublisher(1)


CREATE OR REPLACE PROCEDURE UpdateBookPrice(  
    book_id IN NUMBER,  
    new_price IN NUMBER  
) AS  
BEGIN  
    UPDATE Books  
    SET Price = new_price  
    WHERE BookID = book_id; 
 
    DBMS_OUTPUT.PUT_LINE('Price updated for BookID: ' || book_id); 
END; 
/

EXEC UpdateBookPrice(10, 99.99)


