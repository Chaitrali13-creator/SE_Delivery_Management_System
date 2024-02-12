# Creating a new DB
CREATE DATABASE IF NOT EXISTS knock_knock;
USE knock_knock; 

CREATE TABLE IF NOT EXISTS UserTypes(    
	user_type_id INT AUTO_INCREMENT,
	user_type_description VARCHAR(255) NOT NULL,
	PRIMARY KEY (user_type_id)
);

CREATE TABLE IF NOT EXISTS Users(
    user_id INT AUTO_INCREMENT,
    user_type_id INT,
    user_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    mobile VARCHAR(255) NOT NULL,
	gender VARCHAR(255) ,
    dob date,
    address_line1 VARCHAR(255) NOT NULL,
	address_line2 VARCHAR(255),
	city VARCHAR(255) NOT NULL,
    state VARCHAR(255) NOT NULL,
    zip VARCHAR(255) NOT NULL,
    PRIMARY KEY (user_id),
    FOREIGN KEY (user_type_id)
        REFERENCES UserTypes (user_type_id)
        ON UPDATE RESTRICT ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS User(
	id VARCHAR(255) NOT NUll,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    PRIMARY KEY (id)
);

# Inserting data into usertypes table
-- Insert into UserTypes (user_type_description) values('Admin');
-- Insert into UserTypes (user_type_description) values('Driver');
-- Insert into UserTypes (user_type_description) values('Customer');

# Inserting dummy admin user into users table
-- Insert into Users (user_type_id,user_name,email,mobile,address_line1,city,state,zip) 
-- values(1,'Admin User 1','knock_knock_admin@iu.edu','8123456789','IMU Building','Bloomington','Indiana','47405');

CREATE TABLE IF NOT EXISTS UserLogins(    
	login_id INT AUTO_INCREMENT,
	user_id INT NOT NULL,
	user_passkey VARCHAR(255) NOT NULL,
    	is_active boolean,
	PRIMARY KEY (login_id),
	FOREIGN KEY (user_id)
        REFERENCES Users (user_id)
        ON UPDATE RESTRICT ON DELETE CASCADE
);


CREATE TABLE IF NOT EXISTS Orders(
    order_id INT AUTO_INCREMENT,
    user_id INT,
    sender_name VARCHAR(255) ,
    sender_mobile VARCHAR(255) ,
    sender_email VARCHAR(255) ,
	receiver_name VARCHAR(255) ,
    tracking_id VARCHAR(255),
    order_status VARCHAR(255),
    PRIMARY KEY (order_id),
    FOREIGN KEY (user_id)
        REFERENCES Users (user_id)
        ON UPDATE RESTRICT ON DELETE CASCADE
);


CREATE TABLE IF NOT EXISTS OrderDetails(
    orderdetail_id INT AUTO_INCREMENT,
    order_id INT NOT NULL,
	order_price float,
    from_line1 VARCHAR(255) ,
    from_line2 VARCHAR(255) ,
    from_city VARCHAR(255) ,
    from_state VARCHAR(255) ,
    from_zip VARCHAR(255) ,
    to_line1 VARCHAR(255) ,
    to_line2 VARCHAR(255) ,
    to_city VARCHAR(255) ,
    to_state VARCHAR(255) ,
    to_zip VARCHAR(255) ,
    PRIMARY KEY (orderdetail_id),
    FOREIGN KEY (order_id)
        REFERENCES Orders (order_id)
        ON UPDATE RESTRICT ON DELETE CASCADE
);


