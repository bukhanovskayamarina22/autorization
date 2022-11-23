-- INSERT

    --TEST DATA
    INSERT INTO Users (email, password) 
        VALUES 
        ("name@gmail.com", "password"),
        ("johndoe@example.com", "asdfasdf"),
        ("a@a.a", "aaaaaaaa");

    --ADD NEW USER  
    INSERT INTO Users (email, password) 
        VALUES 
        ("$email", "$password");

-- QUERY

    --SELECT BY EMAIL
    SELECT * FROM Users 
        WHERE email = "$email";

    --SELECT PASSWORD BY EMAIL
    SELECT password FROM Users 
        WHERE email = "$email";

-- UPDATE

    -- UPDATE PASSWORD BY EMAIL
    UPDATE Users
        SET password = "$new_password"
        WHERE email = "$email";

    -- UPDATE EMAIL BY OLD_EMAIL
    UPDATE Users
        SET email = "$new_email"
        WHERE email = "$email";

-- DELETE

    -- DELETE BY EMAIL
    DELETE FROM Users
	    WHERE email = "$email";

