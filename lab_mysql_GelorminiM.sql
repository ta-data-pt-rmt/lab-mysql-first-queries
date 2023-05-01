/* Creating the new database, into which we will import the data from the .csv file */

CREATE DATABASE AppleStore;

/* Explore the database */

SELECT * FROM applestore2;

/* 1. Which are the different genres? */
SELECT prime_genre AS Genre, COUNT(prime_genre) AS Count 
FROM applestore2
GROUP BY prime_genre
ORDER BY COUNT(prime_genre) DESC;

/* 2. Which is the genre with more apps rated? */

SELECT  prime_genre AS Genre, COUNT(track_name) AS Apps_rated
FROM applestore2
WHERE applestore2.rating_count_tot >0
GROUP BY prime_genre
ORDER BY COUNT(track_name) DESC;

/* 3. Which is the genre with more apps? */

SELECT  prime_genre AS Genre, COUNT(track_name) AS Number_of_apps
FROM applestore2
GROUP BY prime_genre
ORDER BY COUNT(track_name) DESC;

/* 4. Which is the one with less? */

SELECT  prime_genre AS Genre, COUNT(track_name) AS Number_of_apps
FROM applestore2
GROUP BY prime_genre
ORDER BY COUNT(track_name) ASC;

/* 5. Take the 10 apps most rated */

SELECT track_name as App, sum(rating_count_tot) as Sum_rating
FROM applestore2
GROUP BY track_name
ORDER BY sum(rating_count_tot) DESC
LIMIT 10;

/* 6. Take the 10 apps best rated by users. */

SELECT track_name as App, AVG(user_rating) as Average_rating
FROM applestore2
GROUP BY track_name
ORDER BY AVG(user_rating) DESC
LIMIT 10;

/* 7. Take a look on the data you retrieved in the question 5. Give some insights. */

SELECT track_name as App, prime_genre as Genre, sum(rating_count_tot) as Sum_rating
FROM applestore2
GROUP BY track_name, prime_genre
ORDER BY sum(rating_count_tot) DESC
LIMIT 10;

/* The apps with most ratings include some of the most populat apps for communicating (Facebook and Instagram). The rest of the chart
is mostly populated by apps dedicated to gaming */

/* 8. Take a look on the data you retrieved in the question 6. Give some insights. */

SELECT track_name as App, prime_genre as Genre, AVG(user_rating) as Average_rating
FROM applestore2
GROUP BY track_name, prime_genre
ORDER BY AVG(user_rating) DESC
LIMIT 10;

/* The majority of these apps are dedicated to gaming */

/* 9. Now compare the data from questions 5 and 6. What do you see? */

SELECT track_name as App, prime_genre as Genre, AVG(user_rating) as Average_rating, SUM(rating_count_tot) as Sum_rating
FROM applestore2
GROUP BY track_name, prime_genre
ORDER BY AVG(user_rating) DESC
LIMIT 10;

SELECT track_name as App, prime_genre as Genre, AVG(user_rating) as Average_rating, SUM(rating_count_tot) as Sum_rating
FROM applestore2
GROUP BY track_name, prime_genre
ORDER BY SUM(rating_count_tot) DESC
LIMIT 10;

/* It appears that the main difference in results is due to the criteria for ordering the results. When we take into account only the 
average ratings, we obtained on the top apps that have very high ratings (5 out of 5) but very few reviews. For the most popular apps, those
that have many reviews, the average ratings go down, since there is higher variation in terms of the rating given by customers. */

/* 10. How could you take the top 3 regarding the user ratings but also the number of votes? */

SELECT track_name AS App, prime_genre AS Genre, AVG(user_rating) AS Average_rating, SUM(rating_count_tot) AS Sum_rating
FROM applestore2
GROUP BY track_name, prime_genre
ORDER BY AVG(user_rating) DESC, SUM(rating_count_tot) DESC
LIMIT 3;

/* 11. Does people care about the price? Do some queries, comment why are you doing them and the results you retrieve. What is your conclusion? */

SELECT track_name AS App, prime_genre AS Genre, price AS Price, SUM(rating_count_tot) AS Sum_rating
FROM applestore2
GROUP BY App, Genre, Price
ORDER BY SUM(rating_count_tot) DESC
LIMIT 10;

/* We start by looking at the price of the 10 apps most rated, a proxy for the most downloaded, at it is evident that price is a factor. All 
of these apps are free. This might mean that customers do care about the price. At the same time, it could just mean that, given the high amount of
users, the company producing these apps can afford to make them available for free, and charge customers differently. So the business model is
completetely different */

SELECT track_name AS App, prime_genre AS Genre, price AS Price, SUM(rating_count_tot) AS Sum_rating
FROM applestore2
GROUP BY App, Genre, Price
ORDER BY Price DESC
LIMIT 20;

/* When looking at the 20 most expensive apps, we can see that they have much less ratings and their genre is more niche. This means that
for specific tasks and sectors, users are willing to pay the price */