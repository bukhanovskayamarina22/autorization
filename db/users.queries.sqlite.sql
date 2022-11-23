-- INSERT

    --TEST DATA
    INSERT INTO Users (email, password) VALUES 
        ("name@gmail.com", "password"),
        ("johndoe@example.com", "asdfasdf"),
        ("a@a.a", "aaaaaaaa");

    --ADD NEW USER  
    INSERT INTO Users (email, password) VALUES 
        ("$email", "$password");

-- QUERY
    
    --SELECT BY EMAIL
    SELECT * FROM Users WHERE email = "$email";

    --SELECT PASSWORD BY EMAIL
    SELECT password FROM Users WHERE email = "$email";

-- UPDATE

-- DELETE