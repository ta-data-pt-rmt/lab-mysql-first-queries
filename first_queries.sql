USE lab_first_queries;
SELECT *
FROM applestore2; 

-- 1. Which are the different genres?
SELECT DISTINCT prime_genre
FROM applestore2; 

-- 2. Which is the genre with more apps rated?
SELECT prime_genre, SUM(rating_count_tot) as total_ratings
FROM applestore2
GROUP BY prime_genre
ORDER BY total_ratings DESC
LIMIT 1;

-- 3. Which is the genre with more apps?
SELECT prime_genre, COUNT(*) as total_genre
FROM applestore2
GROUP BY prime_genre
ORDER BY total_genre DESC;

-- 4. Which is the one with less?
SELECT prime_genre, COUNT(*) as total_genre
FROM applestore2
GROUP BY prime_genre
ORDER BY total_genre ASC
LIMIT 1;

-- 5. Take the 10 apps most rated.
SELECT *
FROM applestore2
ORDER BY rating_count_tot DESC
LIMIT 10;

-- 6. Take the 10 apps best rated by users.
SELECT *
FROM applestore2
ORDER BY user_rating DESC
LIMIT 10;

-- 7. Take a look on the data you retrieved in the question 5. Give some insights.

-- 8. Take a look on the data you retrieved in the question 6. Give some insights.

-- 9. Now compare the data from questions 5 and 6. What do you see?

-- 10. How could you take the top 3 regarding the user ratings but also the number of votes?
SELECT *, user_rating, rating_count_ver
FROM applestore2
ORDER BY user_rating DESC, rating_count_ver DESC
LIMIT 3;


-- 11. Does people care about the price? Do some queries, comment why are you doing them and the results you retrieve. What is your conclusion?
SELECT *
FROM applestore2
ORDER BY price ASC, Rating_count_tot DESC;

SELECT track_name, SUM(rating_count_tot) as total_ratings
FROM applestore2
WHERE price = 0 
GROUP BY track_name
ORDER BY total_ratings DESC;

SELECT track_name, SUM(rating_count_tot) as total_ratings
FROM applestore2
WHERE price > 0
GROUP BY track_name
ORDER BY total_ratings DESC;

SELECT track_name, SUM(rating_count_tot) as total_ratings
FROM applestore2
WHERE price = 0
GROUP BY track_name
ORDER BY total_ratings DESC;

SELECT AVG(price) as avg_price
FROM applestore2


/*
I'm checking the lowest price (in that case 0) if they have a large total rating.
We can see that there is loads of apps with cost and had been voted by the users with a decent vote.
But if compared with no cost apps their total ratings doesnt come close, by a large margin.
So I believe users are caring more for the free apps but since its free its easily reachable by all the users, making an unfair comparasion since theres many users that didnt bought the apps with cost so they havent voted for them. 
*/


