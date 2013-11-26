CREATE TABLE Users
(
    userID varchar(30) NOT NULL,
    PRIMARY KEY (userID),
    firstName varchar(40) NOT NULL,
    lastName varchar(40) NOT NULL,
    cardNumber char(16) NOT NULL,
    passwordHash char(64) NOT NULL
);

CREATE TABLE PrivilegedUser
(
    adminLevel INTEGER,
    userID varchar(30) NOT NULL,
    FOREIGN KEY (userID) REFERENCES Users
);

CREATE TABLE User_IsIn
(
    address varchar(100) NOT NULL,
    userID varchar(30) NOT NULL,
    distance INTEGER,
    FOREIGN KEY (userID) REFERENCES Users,
    CONSTRAINT location_id PRIMARY KEY (address,userID)
);

CREATE TABLE PizzaOrder
(
    oid INTEGER,
    PRIMARY KEY (oid),
    deliveryMethod varchar(20) NOT NULL,
    pizzaType varchar(20) NOT NULL,
    isDelivered INTEGER,
    userID varchar(30) NOT NULL,
    FOREIGN KEY (userID) REFERENCES Users,
    address varchar(100) NOT NULL,
    FOREIGN KEY (address,userID) REFERENCES User_IsIn
);

CREATE TABLE Pizza
(
    pizzaType varchar(50) NOT NULL,
    PRIMARY KEY (pizzaType),
    price DOUBLE PRECISION
);
