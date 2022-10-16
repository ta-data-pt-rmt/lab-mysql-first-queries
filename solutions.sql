-- Active: 1665807211711@@127.0.0.1@3306@lab-mysql-first-queries

USE `lab-mysql-first-queries`;

SELECT *
FROM applestore;

/* QUESTION 1: */
/* Which are the different genres? */
SELECT DISTINCT prime_genre AS genre
FROM applestore;

/* QUESTION 2: */
/* Which is the genre with more apps rated? */
SELECT prime_genre AS genre, SUM(rating_count_tot) as total_ratings
FROM applestore
GROUP BY genre
ORDER BY total_ratings DESC
LIMIT 1;

/* QUESTION 3: */
/* Which is the genre with more apps? */
SELECT prime_genre AS genre, COUNT(track_name) as apps
FROM applestore
GROUP BY genre
ORDER BY apps DESC
LIMIT 1;

/* QUESTION 4: */
/* Which is the one with less? */
SELECT prime_genre AS genre, COUNT(track_name) as apps
FROM applestore
GROUP BY genre
ORDER BY apps ASC
LIMIT 1;

/* QUESTION 5: */
/* Take the 10 apps most rated. */
SELECT track_name AS app, rating_count_tot AS ratings
FROM applestore
ORDER BY ratings DESC
LIMIT 10;

/* QUESTION 6: */
/* Take the 10 apps best rated by users. */
SELECT track_name AS app, user_rating AS total_rating, rating_count_tot AS ratings
FROM applestore
ORDER BY total_rating DESC, ratings DESC
LIMIT 10;

/* QUESTION 7: */
/* Take a look on the data you retrieved in the question 5. Give some insights. */
/* Assuming that the apps with the most ratings are also the most popular, the download-charts are ruled by 'Social Media', 'Games' and 'Music' apps (in that order). A religion app was the only outsider to make it into the top 10. */

/* QUESTION 8: */
/* Take a look on the data you retrieved in the question 6. Give some insights. */
/* You can't determine the ten best apps based solely on user ratings - there are too many with five stars. To achieve this, you can also consider the number of ratings over which the 5-star-rating could be maintained. The apps with the best ratings are almost exclusively game apps. As the only outsider, a pizza service made it into the top 10. */

/* QUESTION 9: */
/* Now compare the data from questions 5 and 6. What do you see? */
/* The most popular apps are not automatically the best-rated. Social media apps are sometimes viewed critically and evaluated based on user experience. The best performers are recreational apps (e.g. games). */

/* QUESTION 10: */
/* How could you take the top 3 regarding the user ratings but also the number of votes? */
SELECT track_name AS app, user_rating AS total_rating, rating_count_tot AS ratings
FROM applestore
ORDER BY total_rating DESC, ratings DESC
LIMIT 3;

/* QUESTION 11: */
/* Do people care about the price? */

/* Most expensive apps */
SELECT track_name AS app, price
FROM applestore
ORDER BY price DESC;

/* Mean app price */
SELECT AVG(price)
FROM applestore;

/* App prices - most rated apps */
SELECT track_name AS app, rating_count_tot AS ratings, price
FROM applestore
ORDER BY ratings DESC
LIMIT 10;

/* App prices - best user ratings */
SELECT track_name AS app, user_rating AS total_rating, rating_count_tot AS ratings, price
FROM applestore
ORDER BY total_rating DESC, ratings DESC
LIMIT 10;

/* CONCLUSION */
/* I don't think people pay attention to cost a priori unless there are obvious outliers. Among the most popular and widespread apps, there are hardly any that you have to buy. That is why the argument is difficult to prove with the available data. Consumers pay social media apps with their data and by consuming advertising. In addition to advertising, game apps are often financed through micro-transactions that quickly add up. */
