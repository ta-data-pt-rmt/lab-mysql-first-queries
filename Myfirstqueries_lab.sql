
SELECT * FROM applestore2 ;

-- 1. Which are the different genres?
SELECT DISTINCT prime_genre
FROM applestore2; 

-- 2. Which is the genre with more apps rated?

SELECT  COUNT(*), prime_genre
FROM applestore2
WHERE rating_count_tot >0
GROUP BY prime_genre 
ORDER BY COUNT(*) DESC
LIMIT 1;



-- 3. Which is the genre with more apps?
SELECT  COUNT(*), prime_genre
FROM applestore2
GROUP BY prime_genre 
ORDER BY COUNT(*) DESC
LIMIT 1;


-- 4. Which is the one with less?
SELECT  COUNT(*), prime_genre
FROM applestore2
GROUP BY prime_genre 
ORDER BY COUNT(*) ASC
LIMIT 1;

-- 5. Take the 10 apps most rated.
SELECT  *
FROM applestore2
ORDER BY applestore2.rating_count_tot DESC
LIMIT 10;

-- 6. Take the 10 apps best rated by users.
SELECT * 
FROM applestore2 
ORDER BY applestore2.user_rating DESC
LIMIT 10;

-- 7. Take a look on the data you retrieved in the question 5. Give some insights. Facebook , IG, Pinterest, Spotify...
-- 8. Take a look on the data you retrieved in the question 6. Give some insights. Not pretty known apps ...
-- 9. Now compare the data from questions 5 and 6. What do you see? Different way to rate apps user vs. market 
-- 10. How could you take the top 3 regarding the user ratings but also the number of votes?
SELECT * 
FROM applestore2 
ORDER BY applestore2.user_rating DESC, rating_count_tot DESC
LIMIT 10;

-- 11. Does people care about the price? Do some queries, comment why are you doing them and the results you retrieve. What is your conclusion?
-- Yes, we obtain different results if we filter by price =0 , price>0 and we don't filter

SELECT track_name
FROM applestore2 
WHERE price = 0 
ORDER BY applestore2.user_rating DESC
LIMIT 10;

SELECT track_name
FROM applestore2 
ORDER BY applestore2.user_rating DESC
LIMIT 10;

SELECT track_name
FROM applestore2 
WHERE price > 0
ORDER BY applestore2.user_rating DESC
LIMIT 10;
