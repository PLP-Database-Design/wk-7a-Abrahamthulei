-- answers.sql
-- Assignment: Database Normalization (1NF and 2NF)
-- Student Name: Abraham Thulei

-- ------------------------------------------
-- Question 1: Achieving First Normal Form (1NF)
-- ------------------------------------------

-- The original ProductDetail table has a multivalued Products column.
-- To achieve 1NF, we create a new table where each product is on a separate row.

CREATE TABLE ProductDetail_1NF (
    OrderID INT,
    CustomerName VARCHAR(100),
    Product VARCHAR(100)
);

-- Inserting normalized data (atomic values only)
INSERT INTO ProductDetail_1NF VALUES (101, 'John Doe', 'Laptop');
INSERT INTO ProductDetail_1NF VALUES (101, 'John Doe', 'Mouse');
INSERT INTO ProductDetail_1NF VALUES (102, 'Jane Smith', 'Tablet');
INSERT INTO ProductDetail_1NF VALUES (102, 'Jane Smith', 'Keyboard');
INSERT INTO ProductDetail_1NF VALUES (102, 'Jane Smith', 'Mouse');
INSERT INTO ProductDetail_1NF VALUES (103, 'Emily Clark', 'Phone');

-- ------------------------------------------
-- Question 2: Achieving Second Normal Form (2NF)
-- ------------------------------------------

-- The original OrderDetails table has a partial dependency: CustomerName depends only on OrderID.
-- To achieve 2NF, we separate the data into two tables: Orders and OrderDetails_2NF.

-- Step 1: Create Orders table to hold OrderID and CustomerName
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(100)
);

-- Insert unique order entries
INSERT INTO Orders VALUES (101, 'John Doe');
INSERT INTO Orders VALUES (102, 'Jane Smith');
INSERT INTO Orders VALUES (103, 'Emily Clark');

-- Step 2: Create OrderDetails_2NF table with full dependency on the composite key
CREATE TABLE OrderDetails_2NF (
    OrderID INT,
    Product VARCHAR(100),
    Quantity INT,
    PRIMARY KEY (OrderID, Product),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- Insert detailed product quantities
INSERT INTO OrderDetails_2NF VALUES (101, 'Laptop', 2);
INSERT INTO OrderDetails_2NF VALUES (101, 'Mouse', 1);
INSERT INTO OrderDetails_2NF VALUES (102, 'Tablet', 3);
INSERT INTO OrderDetails_2NF VALUES (102, 'Keyboard', 1);
INSERT INTO OrderDetails_2NF VALUES (102, 'Mouse', 2);
INSERT INTO OrderDetails_2NF VALUES (103, 'Phone', 1);
