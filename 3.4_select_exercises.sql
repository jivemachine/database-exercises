SELECT * FROM albums;

SELECT NAME FROM albums
WHERE artist = "Pink Floyd";

SELECT release_date FROM albums
WHERE NAME = "Sgt. Pepper's Lonely Hearts Club Band";

SELECT genre FROM albums
WHERE NAME = "Nevermind";

SELECT NAME FROM albums 
WHERE release_date BETWEEN 1990 AND 1999;

SELECT NAME FROM albums 
WHERE sales < 20;

SELECT NAME FROM albums
WHERE genre = "rock";

SELECT NAME FROM albums
WHERE genre = "hard rock";

SELECT NAME FROM albums
WHERE genre = "progressive rock";

-- because VARCHARS have to be searched exactly as they were 
-- originally inputted