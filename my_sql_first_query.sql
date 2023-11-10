USE w6d2lab;

SELECT * 
FROM applestore2;

-- **1. Which are the different genres?**
SELECT DISTINCT prime_genre 
FROM applestore2;

-- **2. Which is the genre with more apps rated?**
SELECT prime_genre, rating_count_tot
FROM applestore2
ORDER BY rating_count_tot DESC
LIMIT 1;

-- **3. Which is the genre with more apps?**
SELECT prime_genre, COUNT(*) AS number_of_tracks
FROM applestore2
GROUP BY prime_genre
ORDER BY number_of_tracks DESC
LIMIT 1;

-- **4. Which is the one with less?**
SELECT prime_genre, COUNT(*) AS number_of_tracks
FROM applestore2
GROUP BY prime_genre
ORDER BY number_of_tracks ASC
LIMIT 1;

-- **5. Take the 10 apps most rated.**
SELECT track_name, rating_count_tot
FROM applestore2
ORDER BY rating_count_tot DESC
LIMIT 10;

-- **6. Take the 10 apps best rated by users.**
SELECT track_name, user_rating
FROM applestore2
ORDER BY user_rating DESC
LIMIT 10;

-- **7. Take a look on the data you retrieved in the question 5. Give some insights.**
-- UNCLEAR INSTRUCTION
-- top 10 are the most popular like FB, Insta, Pinterest etc.


-- **8. Take a look on the data you retrieved in the question 6. Give some insights.**
-- UNCLEAR INSTRUCTION
-- people like those games

-- **9. Now compare the data from questions 5 and 6. What do you see?**
-- top 10 best rated by users are not those top 10 most rated


-- **10. How could you take the top 3 regarding the user ratings but also the number of votes?**
SELECT track_name, user_rating, rating_count_tot
FROM applestore2
ORDER BY user_rating DESC, rating_count_tot DESC
LIMIT 3;

-- **11. Does people care about the price?** Do some queries, comment why are you doing them and the results you retrieve. What is your conclusion?
-- It's unclear if there is a column representing number of downloads, so assume every download was rated. Checking average price against max number of ratings we can see that the most rated tasks are not expensive, so seems people do care about the price.
-- However, people purchased expensive tasks may not rate them
SELECT AVG(price) AS average_price, COUNT(*) AS total_ratings
FROM applestore2
ORDER BY price DESC;


