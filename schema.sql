--DATABASE DESIGN--

-- USERS TABLE
CREATE TABLE users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(15),
    college VARCHAR(100),
    branch VARCHAR(50),
    semester INT,
    skills TEXT,
    bio TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- POSTS TABLE
CREATE TABLE posts (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    content TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

-- COMMENTS TABLE
CREATE TABLE comments (
    id INT PRIMARY KEY AUTO_INCREMENT,
    post_id INT,
    user_id INT,
    comment_text TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (post_id) REFERENCES posts(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

-- LIKES TABLE
CREATE TABLE likes (
    id INT PRIMARY KEY AUTO_INCREMENT,
    post_id INT,
    user_id INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (post_id) REFERENCES posts(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

-- FUTURE MARKETPLACE TABLE
CREATE TABLE marketplace_items (
    id INT PRIMARY KEY AUTO_INCREMENT,
    seller_id INT,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    price DECIMAL(10,2),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (seller_id) REFERENCES users(id)
);


-- DESIGN DECISION FOR FUTURE MARKETPLACE

-- Marketplace items are linked directly to users
-- through seller_id. This allows any existing user
-- account to become a seller without creating a
-- separate seller table, making future marketplace
-- integration easier and reducing data duplication.
--Marketplace items are linked to users through seller_id. This allows any existing user account to become a seller without requiring a separate seller table, reducing redundancy and simplifying future marketplace integration