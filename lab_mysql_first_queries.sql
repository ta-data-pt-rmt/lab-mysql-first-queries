USE lab1_my_first_queries;

SELECT * 
FROM applestore2;

/*1 Which are the different genres?*/
SELECT DISTINCT  prime_genre
FROM applestore2;

SELECT prime_genre
FROM applestore2
GROUP BY prime_genre
;

/*2. Which is the genre with more apps rated?*/
SELECT prime_genre, SUM(rating_count_tot) AS total_apps_rated
FROM applestore2
GROUP BY prime_genre
ORDER BY total_apps_rated DESC
LIMIT 1

SELECT prime_genre, SUM(rating_count_tot) AS total_apps_rated
FROM applestore2
GROUP BY prime_genre
HAVING total_apps_rated = (SELECT MAX(total_apps_rated) FROM applestore2)

/*I coulndt filter by MAX if total_apps_rated */

/* 3. Which is the genre with more apps?*/

SELECT prime_genre, COUNT(id) AS total_app
FROM applestore2
GROUP BY prime_genre
ORDER BY total_app DESC
LIMIT 1

/* 4. Which is the one with less?*/
SELECT prime_genre, COUNT(id) AS total_app
FROM applestore2
GROUP BY prime_genre
ORDER BY total_app ASC
LIMIT 1

/* 5. Take the 10 apps most rated.*/
SELECT track_name AS app_name, rating_count_tot AS total_apps_rated
FROM applestore2
ORDER BY total_apps_rated DESC
LIMIT 10

SELECT *
FROM applestore2

/* 6. Take the 10 apps best rated by users.*/

SELECT track_name,user_rating_ver
FROM applestore2
ORDER BY user_rating_ver DESC
limit 10

/* 7. Take a look on the data you retrieved in the question 5. Give some insights.*/
SELECT track_name AS app_name, rating_count_tot AS total_apps_rated, prime_genre
FROM applestore2
ORDER BY total_apps_rated DESC
LIMIT 10
/* GROUP BY prime_genre
HAVING COUNT(prime_genre) */
/* Im not able to group by, the las part. One insight is that the most prime_genre is Games followed by Music and Social Networking */

/* 8.Take a look on the data you retrieved in the question 6. Give some insights.*/
SELECT track_name,user_rating_ver
FROM applestore2
ORDER BY user_rating_ver DESC
limit 11
/* There are more than ten apps best rated by users, I used to limit it to 10 but there are more, and for example 1 has a weard name, not sure if
it really an app  */

/*9. Now compare the data from questions 5 and 6. What do you see?.*/
/*The 5 is asking for the apps MOST rated so we need get a sum to get the info on the contratry the 6 is BEST rated by users so we need to classify filter*/

/*10. How could you take the top 3 regarding the user ratings but also the number of votes?*/

/* 5. adding a column to see the other column, or adding a condition to see it but not sure how.*/
SELECT track_name AS app_name, rating_count_tot AS total_apps_rated,user_rating_ver
FROM applestore2
ORDER BY total_apps_rated DESC 
LIMIT 3


/*11. Does people care about the price? Do some queries, comment why are you doing them and the results you retrieve. What is your conclusion? */
SELECT *
FROM applestore2

SELECT price,SUM(rating_count_tot) AS total_rating ,AVG(user_rating)
FROM applestore2
GROUP BY price
ORDER BY total_rating DESC
/* I see peaople cares about price, the chepest ones are the wones with more rating_count_tot */
SELECT price, AVG(price/user_rating),SUM(rating_count_tot)
FROM applestore2
GROUP BY price
ORDER BY SUM(rating_count_tot) DESC
/* We can se that as the price increases the price/user_rating increase but not the qty of rating count_tot so the apps are price sensitive */