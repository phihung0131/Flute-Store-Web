DROP DATABASE IF EXISTS dbshop;

-- Create the database
CREATE DATABASE dbshop;
USE dbshop;

-- Create the Member table
CREATE TABLE Member (
    memberId INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50),
    password VARCHAR(50),
    fullName VARCHAR(100),
    birth DATE,
    phoneNumber VARCHAR(15)
);

-- Create the Administrator table
CREATE TABLE Administrator (
    adminId INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50),
    password VARCHAR(50),
    fullName VARCHAR(100),
    birth DATE,
    phoneNumber VARCHAR(15)
);

-- Create the AdminActionHistory table
CREATE TABLE AdminAction_History (
    actionId INT AUTO_INCREMENT PRIMARY KEY,
    adminId INT,
    action TEXT
);

-- Create the MemberPhoneNumber table
CREATE TABLE Member_Phone_Number (
    memberId INT,
    phoneNumberId INT,
    phoneNumber VARCHAR(15),
    PRIMARY KEY (memberId, phoneNumberId)
);

-- Create the MemberAddress table
CREATE TABLE Member_Address (
    memberId INT,
    addressId INT,
    address VARCHAR(255),
    PRIMARY KEY (memberId, addressId)
);

-- Create the Cart table
CREATE TABLE Cart (
    cartId INT AUTO_INCREMENT PRIMARY KEY,
    createDay DATE,
    memberId INT
);

-- Create the Include table (association between Cart and Product)
CREATE TABLE Include (
    cartId INT,
    productId INT,
    PRIMARY KEY (cartId, productId)
);

-- Create the Product table
CREATE TABLE Product (
    productId INT AUTO_INCREMENT PRIMARY KEY,
    productName VARCHAR(100),
    price DECIMAL(10, 2),
    image VARCHAR(255),
    description TEXT
);

-- Create the Order table
CREATE TABLE `Order` (
    orderId INT AUTO_INCREMENT PRIMARY KEY,
    payStatus VARCHAR(50),
    dayBooking DATE,
    Reciever VARCHAR(50),
    shipStatus VARCHAR(50),
    address VARCHAR(255),
    phoneNumber VARCHAR(15),
    memberId INT,
    cartId INT
);

-- Create the Payment table
CREATE TABLE Payment (
    memberId INT,
    cartId INT,
    orderId INT,
    PRIMARY KEY (memberId, cartId, orderId)
);

-- Create the ViewHistory table
CREATE TABLE View_History (
    memberId INT,
    productId INT,
    time TIMESTAMP,
    PRIMARY KEY (memberId, productId)
);

-- Create the Feedback table
CREATE TABLE Feedback (
    memberId INT,
    productId INT,
    comment TEXT,
    rating INT,
    PRIMARY KEY (memberId, productId)
);

-- Create the Token table
CREATE TABLE Token (
    id INT AUTO_INCREMENT,
    memberId INT,
    adminId INT,
    token VARCHAR(255),
    expiryTime TIMESTAMP,
    PRIMARY KEY (id)
);

CREATE TABLE OrderDirect (
    orderId INT,
    productId INT,
    quantity INT DEFAULT 1,
    PRIMARY KEY (orderId, productId),
    FOREIGN KEY (orderId) REFERENCES `Order`(orderId),
    FOREIGN KEY (productId) REFERENCES Product(productId)
);

CREATE TABLE Action (
    actionId INT AUTO_INCREMENT PRIMARY KEY,
    action ENUM(
        'create_user',
        'create_product', 
        'product_buy',
        'create_order',
        'order_success',
        'create_rating',
        'rating_good'
    ),
    count INT DEFAULT 0,
    date DATE,
    UNIQUE KEY action_date (action, date)
);

-- Add explicit foreign key constraints
ALTER TABLE OrderDirect
ADD CONSTRAINT fk_order_direct_order
FOREIGN KEY (orderId) REFERENCES `Order`(orderId),
ADD CONSTRAINT fk_order_direct_product
FOREIGN KEY (productId) REFERENCES Product(productId);

-- Alter the Token table to add foreign key
ALTER TABLE Token
ADD CONSTRAINT fk_token_member
FOREIGN KEY (memberId) REFERENCES Member(memberId);

ALTER TABLE Token
ADD CONSTRAINT fk_token_admin
FOREIGN KEY (adminId) REFERENCES Administrator(adminId);

-- Alter the tables to add foreign keys

-- Foreign key for Member table referencing Cart
ALTER TABLE Cart
ADD CONSTRAINT fk_memberId
FOREIGN KEY (memberId) REFERENCES Member(memberId);

-- Foreign key for AdminActionHistory referencing Administrator
ALTER TABLE AdminAction_History
ADD CONSTRAINT fk_admin_action_history_admin
FOREIGN KEY (adminId) REFERENCES Administrator(adminId);

-- Foreign key for MemberPhoneNumber referencing Member
ALTER TABLE Member_Phone_Number
ADD CONSTRAINT fk_member_phone_number_member
FOREIGN KEY (memberId) REFERENCES Member(memberId);

-- Foreign key for MemberAddress referencing Member
ALTER TABLE Member_Address
ADD CONSTRAINT fk_member_address_member
FOREIGN KEY (memberId) REFERENCES Member(memberId);

-- Foreign key for Include referencing Cart and Product
ALTER TABLE Include
ADD CONSTRAINT fk_include_cart
FOREIGN KEY (cartId) REFERENCES Cart(cartId),
ADD CONSTRAINT fk_include_product
FOREIGN KEY (productId) REFERENCES Product(productId);

-- Foreign key for Order referencing Cart
ALTER TABLE `Order`
ADD CONSTRAINT fk_order_cart
FOREIGN KEY (cartId) REFERENCES Cart(cartId);

-- Foreign key for Payment referencing Member, Cart, and Order
ALTER TABLE Payment
ADD CONSTRAINT fk_payment_member
FOREIGN KEY (memberId) REFERENCES Member(memberId),
ADD CONSTRAINT fk_payment_cart
FOREIGN KEY (cartId) REFERENCES Cart(cartId),
ADD CONSTRAINT fk_payment_order
FOREIGN KEY (orderId) REFERENCES `Order`(orderId);

-- Foreign key for ViewHistory referencing Member and Product
ALTER TABLE View_History
ADD CONSTRAINT fk_view_history_member
FOREIGN KEY (memberId) REFERENCES Member(memberId),
ADD CONSTRAINT fk_view_history_product
FOREIGN KEY (productId) REFERENCES Product(productId);

-- Foreign key for Feedback referencing Member and Product
ALTER TABLE Feedback
ADD CONSTRAINT fk_feedback_member
FOREIGN KEY (memberId) REFERENCES Member(memberId),
ADD CONSTRAINT fk_feedback_product
FOREIGN KEY (productId) REFERENCES Product(productId);


-- ================================================================


-- Insert into Member
INSERT INTO Member (memberId, username, password, fullName, birth, phoneNumber)
VALUES 
(1, 'johndoe', 'password123', 'John Doe', '1990-05-15', '1234567890'),
(2, 'janedoe', 'password456', 'Jane Doe', '1992-08-22', '0987654321');

-- Insert into Administrator
INSERT INTO Administrator (adminId, username, password, fullName, birth, phoneNumber)
VALUES 
(1, 'admin01', 'adminpass1', 'Admin One', '1985-02-17', '1111111111'),
(2, 'admin02', 'adminpass2', 'Admin Two', '1987-07-11', '2222222222');

-- Insert into AdminActionHistory
INSERT INTO AdminAction_History (actionId, adminId, action)
VALUES 
(1, 1, 'Updated product prices'),
(2, 2, 'Added new products'),
(3, 1, 'Removed a user account');

-- Insert into MemberPhoneNumber
INSERT INTO Member_Phone_Number (memberId, phoneNumberId, phoneNumber)
VALUES 
(1, 1, '1234567890'),
(2, 1, '0987654321'),
(1, 2, '1122334455');

-- Insert into MemberAddress
INSERT INTO Member_Address (memberId, addressId, address)
VALUES 
(1, 1, '123 Main St, City A'),
(2, 1, '456 Elm St, City B'),
(1, 2, '789 Oak St, City C');

-- Insert into Cart
INSERT INTO Cart (cartId, createDay, memberId)
VALUES 
(1, '2024-10-01', 1),
(2, '2024-10-05', 2);

-- Insert into Product
INSERT INTO Product (productId, productName, price, image, description)
VALUES
(1, 'Sáo Trúc A', 15.99, 'https://saotrucdaoduy.com/wp-content/uploads/2022/07/z3532944604603_c7f4c10d5f37d4c987fa30260fa6620c.jpg', 'Sáo trúc loại A, âm thanh rõ ràng.'),
(2, 'Sáo Trúc B', 18.49, 'https://saotrucdaoduy.com/wp-content/uploads/2022/07/z3532942324485_165582f4ee548f8806ec4b9179c05e67.jpg', 'Sáo trúc loại B, âm thanh trong trẻo.'),
(3, 'Sáo Trúc C', 20.99, 'https://saotrucdaoduy.com/wp-content/uploads/2022/07/z3532933467119_e3e8bd3d6a49b9cd74e0b93684605b9e.jpg', 'Sáo trúc loại C, thiết kế tinh xảo.'),
(4, 'Sáo Trúc D', 22.99, 'https://saotrucdaoduy.com/wp-content/uploads/2021/11/2021_11_20_14_41_IMG_6716.jpg', 'Sáo trúc loại D, âm thanh ấm áp.'),
(5, 'Sáo Trúc E', 17.49, 'https://saotrucdaoduy.com/wp-content/uploads/2021/06/z2584514545497_c1b473464a406373d93bc757c06a6772-1.jpg', 'Sáo trúc loại E, thiết kế đơn giản.'),
(6, 'Sáo Trúc F', 19.99, 'https://saotrucdaoduy.com/wp-content/uploads/2023/10/z4752907868779_9984f1bb72aecc85280c12b67285a506.jpg', 'Sáo trúc loại F, kiểu dáng thanh lịch.'),
(7, 'Sáo Trúc G', 21.49, 'https://saotrucdaoduy.com/wp-content/uploads/2023/09/z4693578216819_8577b7657bf3edd8da4ab28197e6d2e1.jpg', 'Sáo trúc loại G, âm thanh mạnh mẽ.'),
(8, 'Sáo Trúc H', 16.99, 'https://saotrucdaoduy.com/wp-content/uploads/2021/01/z3037624443887_d2730a0540e04ced821525cb3bcf14cf-scaled.jpg', 'Sáo trúc loại H, thiết kế nhẹ nhàng.'),
(9, 'Sáo Trúc I', 24.99, 'https://saotrucdaoduy.com/wp-content/uploads/2021/01/z3037624435429_c7611bac80c8f67b9294c51afaa0aac9-scaled.jpg', 'Sáo trúc loại I, chất liệu cao cấp.'),
(10, 'Sáo Trúc J', 18.79, 'https://saotrucdaoduy.com/wp-content/uploads/2020/02/z3030993965290_89e9f0d5d6c7833436a688e30c689e79-scaled.jpg', 'Sáo trúc loại J, âm thanh sâu lắng.'),
(11, 'Sáo Trúc K', 14.99, 'https://saotrucdaoduy.com/wp-content/uploads/2022/07/z3532944604603_c7f4c10d5f37d4c987fa30260fa6620c.jpg', 'Sáo trúc loại K, âm sắc cao vút.'),
(12, 'Sáo Trúc L', 17.49, 'https://saotrucdaoduy.com/wp-content/uploads/2022/07/z3532942324485_165582f4ee548f8806ec4b9179c05e67.jpg', 'Sáo trúc loại L, thiết kế mạnh mẽ.'),
(13, 'Sáo Trúc M', 22.99, 'https://saotrucdaoduy.com/wp-content/uploads/2022/07/z3532933467119_e3e8bd3d6a49b9cd74e0b93684605b9e.jpg', 'Sáo trúc loại M, chất liệu gỗ tự nhiên.'),
(14, 'Sáo Trúc N', 16.49, 'https://saotrucdaoduy.com/wp-content/uploads/2021/11/2021_11_20_14_41_IMG_6716.jpg', 'Sáo trúc loại N, thiết kế cổ điển.'),
(15, 'Sáo Trúc O', 19.99, 'https://saotrucdaoduy.com/wp-content/uploads/2021/06/z2584514545497_c1b473464a406373d93bc757c06a6772-1.jpg', 'Sáo trúc loại O, phù hợp cho người mới bắt đầu.'),
(16, 'Sáo Trúc P', 23.49, 'https://saotrucdaoduy.com/wp-content/uploads/2023/10/z4752907868779_9984f1bb72aecc85280c12b67285a506.jpg', 'Sáo trúc loại P, âm thanh tinh tế.'),
(17, 'Sáo Trúc Q', 25.99, 'https://saotrucdaoduy.com/wp-content/uploads/2023/09/z4693578216819_8577b7657bf3edd8da4ab28197e6d2e1.jpg', 'Sáo trúc loại Q, phong cách hiện đại.'),
(18, 'Sáo Trúc R', 18.49, 'https://saotrucdaoduy.com/wp-content/uploads/2021/01/z3037624443887_d2730a0540e04ced821525cb3bcf14cf-scaled.jpg', 'Sáo trúc loại R, âm thanh truyền cảm.'),
(19, 'Sáo Trúc S', 21.99, 'https://saotrucdaoduy.com/wp-content/uploads/2021/01/z3037624435429_c7611bac80c8f67b9294c51afaa0aac9-scaled.jpg', 'Sáo trúc loại S, thiết kế tỉ mỉ.'),
(20, 'Sáo Trúc T', 15.49, 'https://saotrucdaoduy.com/wp-content/uploads/2020/02/z3030993965290_89e9f0d5d6c7833436a688e30c689e79-scaled.jpg', 'Sáo trúc loại T, âm sắc rõ ràng.'),
(21, 'Sáo Trúc U', 24.99, 'https://saotrucdaoduy.com/wp-content/uploads/2022/07/z3532944604603_c7f4c10d5f37d4c987fa30260fa6620c.jpg', 'Sáo trúc loại U, chất liệu bền bỉ.'),
(22, 'Sáo Trúc V', 19.49, 'https://saotrucdaoduy.com/wp-content/uploads/2022/07/z3532942324485_165582f4ee548f8806ec4b9179c05e67.jpg', 'Sáo trúc loại V, âm thanh trung tính.'),
(23, 'Sáo Trúc W', 18.99, 'https://saotrucdaoduy.com/wp-content/uploads/2022/07/z3532933467119_e3e8bd3d6a49b9cd74e0b93684605b9e.jpg', 'Sáo trúc loại W, chất liệu tre cao cấp.'),
(24, 'Sáo Trúc X', 21.49, 'https://saotrucdaoduy.com/wp-content/uploads/2021/11/2021_11_20_14_41_IMG_6716.jpg', 'Sáo trúc loại X, kiểu dáng thanh nhã.'),
(25, 'Sáo Trúc Y', 23.99, 'https://saotrucdaoduy.com/wp-content/uploads/2021/06/z2584514545497_c1b473464a406373d93bc757c06a6772-1.jpg', 'Sáo trúc loại Y, âm sắc êm dịu.'),
(26, 'Sáo Trúc Z', 20.99, 'https://saotrucdaoduy.com/wp-content/uploads/2023/10/z4752907868779_9984f1bb72aecc85280c12b67285a506.jpg', 'Sáo trúc loại Z, phong cách trẻ trung.'),
(27, 'Sáo Trúc AA', 16.49, 'https://saotrucdaoduy.com/wp-content/uploads/2023/09/z4693578216819_8577b7657bf3edd8da4ab28197e6d2e1.jpg', 'Sáo trúc loại AA, phù hợp cho biểu diễn.'),
(28, 'Sáo Trúc AB', 17.99, 'https://saotrucdaoduy.com/wp-content/uploads/2021/01/z3037624443887_d2730a0540e04ced821525cb3bcf14cf-scaled.jpg', 'Sáo trúc loại AB, âm thanh nhẹ nhàng.'),
(29, 'Sáo Trúc AC', 21.99, 'https://saotrucdaoduy.com/wp-content/uploads/2021/01/z3037624435429_c7611bac80c8f67b9294c51afaa0aac9-scaled.jpg', 'Sáo trúc loại AC, thiết kế chắc chắn.'),
(30, 'Sáo Trúc AD', 19.49, 'https://saotrucdaoduy.com/wp-content/uploads/2020/02/z3030993965290_89e9f0d5d6c7833436a688e30c689e79-scaled.jpg', 'Sáo trúc loại AD, âm thanh nổi bật.');


-- Insert into Include
INSERT INTO Include (cartId, productId)
VALUES 
(1, 1),
(1, 2),
(2, 3);

-- Insert into Order
INSERT INTO `Order` (orderId, payStatus, dayBooking,Reciever, shipStatus, address, phoneNumber, memberId, cartId)
VALUES 
(1, 'Paid', '2024-10-06', 'Ronaldo','Shipped', '123 Main St, City A', '1234567890',1, 1),
(2, 'Pending', '2024-10-08', 'Messi','Processing', '456 Elm St, City B', '0987654321',2, 2);

-- Insert into Payment
INSERT INTO Payment (memberId, cartId, orderId)
VALUES 
(1, 1, 1),
(2, 2, 2);

-- Insert into ViewHistory
INSERT INTO View_History (memberId, productId, time)
VALUES 
(1, 1, '2024-10-02 10:00:00'),
(1, 2, '2024-10-02 11:00:00'),
(2, 3, '2024-10-06 09:30:00');

-- Insert into Feedback
INSERT INTO Feedback (memberId, productId, comment, rating)
VALUES 
(1, 1, 'Great product!', 5),
(1, 2, 'Good value for the price.', 4),
(2, 3, 'Not as expected.', 2);

-- Insert into token
INSERT INTO token (id, memberId, adminId, token, expiryTime)
VALUES 
(1, NULL, 1, '  ', '2030-10-15 12:00:00');

-- Insert sample data into OrderDirect
INSERT INTO OrderDirect (orderId, productId, quantity) VALUES 
(1, 1, 2),  -- Order 1 has 2 of Product 1
(1, 2, 1),  -- Order 1 has 1 of Product 2
(1, 3, 3),  -- Order 1 has 3 of Product 3
(2, 4, 1),  -- Order 2 has 1 of Product 4
(2, 5, 2),  -- Order 2 has 2 of Product 5
(2, 6, 1);  -- Order 2 has 1 of Product 6

INSERT INTO Action (action, count, date) VALUES
('create_user', 0, CURDATE()),
('create_product', 0, CURDATE()),
('product_buy', 0, CURDATE()),
('create_order', 0, CURDATE()),
('order_success', 0, CURDATE()),
('create_rating', 0, CURDATE()),
('rating_good', 0, CURDATE());

