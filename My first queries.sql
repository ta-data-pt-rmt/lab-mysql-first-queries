SELECT * FROM `w6 d2`.applestore;

USE w6 d2

/* 1. Which are the different genres? */
SELECT DISTINCT prime_genre
FROM `w6 d2`.applestore;

/* 2. Which is the genre with more apps rated? */

SELECT prime_genre AS Genre, COUNT(user_rating) AS Rated_Apps
FROM `w6 d2`.applestore
GROUP BY prime_genre
ORDER BY COUNT(user_rating) DESC
LIMIT 1;

/* 3. Which is the genre with more apps? */ 

SELECT prime_genre AS Genre, COUNT(track_name) AS Qty_Apps
FROM `w6 d2`.applestore
GROUP BY prime_genre
ORDER BY COUNT(track_name) DESC
LIMIT 1;

/* 4. Which is the one with less? */

SELECT prime_genre AS Genre, COUNT(track_name) AS Qty_Apps
FROM `w6 d2`.applestore
GROUP BY prime_genre
ORDER BY COUNT(track_name) ASC
LIMIT 1;

/* 5. Take the 10 apps most rated. */

SELECT Column1, id,  track_name AS name, rating_count_tot AS Total_Rating
FROM `w6 d2`.applestore
ORDER BY Total_Rating DESC
LIMIT 10;

/* 6. Take the 10 apps best rated by users. */

SELECT Column1, id,  track_name AS name, user_rating
FROM `w6 d2`.applestore
GROUP BY track_name
ORDER BY user_rating DESC, rating_count_ver DESC
LIMIT 10;

/* 7. Take a look on the data you retrieved in the question 5. Give some insights. */

/* It seems the 1st BEST rated apps are social apps (Facebook, Instagram), then 
a some games and then a music app (Pandora) */

/* 8. Take a look on the data you retrieved in the question 6. Give some insights. */

/* We can see there aren't the same apps than before, and even some of them 
seems to be table issues (for example Id.1096695328), so MOST rated doesn't 
mean necesarily BEST rated. */

/* 9. Now compare the data from questions 5 and 6. What do you see? */

/* The BEST rated are mainly games, and the MOST rated could be games 
or not (also social apps) */

/* 10. How could you take the top 3 regarding the user ratings but also the number of votes? */

SELECT Column1, id, track_name AS name, user_rating, rating_count_tot
FROM `w6 d2`.applestore
ORDER BY user_rating DESC, rating_count_tot DESC
LIMIT 3;

/* 11. Does people care about the price? Do some queries, comment why are you doing them and the results you retrieve. 
What is your conclusion? */

/* CONCLUSION 1 : In this table we see the BEST and MOST rated apps are low price */
SELECT Column1, id, track_name AS name, user_rating, rating_count_tot, price
FROM `w6 d2`.applestore
ORDER BY user_rating DESC, rating_count_tot DESC
LIMIT 100;

/* CONCLUSION 2 : In this table we see the MOST expensive apps have a good rate
but very low total counting rating, so they are not "popular" */
SELECT Column1, id, track_name AS name, user_rating, rating_count_tot, price
FROM `w6 d2`.applestore
ORDER BY price DESC
LIMIT 20;

/* Baed on the previous info, it seems this market is price sensitive, and people care about it. */