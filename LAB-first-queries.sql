USE firstqueries_lab;

-- 1. Which are the different genres?

SELECT * FROM applestore2;
SELECT DISTINCT prime_genre FROM applestore2;

-- 2. Which is the genre with more apps rated?

SELECT prime_genre, SUM(rating_count_tot) AS total_rating
FROM applestore2
GROUP BY prime_genre
ORDER BY total_rating DESC; 

-- 3. Which is the genre with more apps?

SELECT prime_genre, COUNT(track_name) AS count_apps
FROM applestore2
GROUP BY prime_genre
ORDER BY count_apps DESC;

-- 4. Which is the one with less?

SELECT prime_genre, COUNT(track_name) AS count_apps
FROM applestore2
GROUP BY prime_genre
ORDER BY count_apps ASC;

-- 5. Take the 10 apps most rated.

SELECT track_name,rating_count_tot 
FROM applestore2
ORDER BY rating_count_tot DESC
LIMIT 10;

-- 6. Take the 10 apps best rated by users.

SELECT track_name, user_rating 
FROM applestore2
ORDER BY user_rating DESC
LIMIT 10;

-- 7. Take a look on the data you retrieved in the question 5. Give some insights.

/* We can see that the most rated apps are Facebook, Instagram and Clash Of Clans. We can also see that Facebook has a lot more ratings than the rest of the apps. */ 

-- 8. Take a look on the data you retrieved in the question 6. Give some insights.

/* The data retrieved is not really relevant because there are more than 10 apps with a 5 stars rating. To have a better analysis, we would need to also take into account the amount of ratings. It is easier to have 5/5 on two reviews than on 1000. */

-- 9. Now compare the data from questions 5 and 6. What do you see?

/* We should take both criterias to analyse the apps as mentioned in the previous question. */

-- 10. How could you take the top 3 regarding the user ratings but also the number of votes?

SELECT track_name, (user_rating * rating_count_tot) / (rating_count_tot) AS weighted_rating
FROM applestore2
ORDER BY weighted_rating DESC
LIMIT 3;

/* we can use the weighted rating to take both into account. */

-- 11. Does people care about the price? Do some queries, comment why are you doing them and the results you retrieve. What is your conclusion?

/* average user rating for apps grouped by their price*/

SELECT AVG(user_rating) AS avg_user_rating, price
FROM applestore2
GROUP BY price;

/* total number of ratings for apps grouped by their price.*/

SELECT SUM(rating_count_tot) AS total_ratings, price
FROM applestore2
GROUP BY price;





