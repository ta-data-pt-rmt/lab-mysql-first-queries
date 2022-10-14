/*1. Which are the different genres?*/
SELECT DISTINCT prime_genre
FROM applestore2;

/*2. Which is the genre with more apps rated?*/
SELECT prime_genre, COUNT(DISTINCT track_name) as apps_count_rating
FROM applestore2
WHERE rating_count_tot > 0
GROUP BY 1
ORDER BY 2 DESC
LIMIT 1;

/*3. Which is the genre with more apps?*/
SELECT DISTINCT prime_genre, COUNT(DISTINCT track_name) as apps_count
FROM applestore2
GROUP BY 1
ORDER BY 2 DESC
LIMIT 1;

/*#4. Which is the one with less?*/
SELECT DISTINCT prime_genre, COUNT(DISTINCT track_name) as apps_count
FROM applestore2
GROUP BY 1
ORDER BY 2 ASC
LIMIT 1;

/*5. Take the 10 apps most rated.*/
SELECT track_name, user_rating, rating_count_tot
FROM applestore2
ORDER BY 3 DESC
LIMIT 10;

/*6. Take the 10 apps best rated by users.*/
SELECT track_name, user_rating, rating_count_tot
FROM applestore2
ORDER BY 2 DESC
LIMIT 10;

/*7. Take a look on the data you retrieved in the question 5. Give some insights.*/
SELECT track_name, prime_genre, price, user_rating, rating_count_tot
FROM applestore2
ORDER BY 5 DESC
LIMIT 10;
/* The most rated apps are free and are mainly related to (i) Social Networks and (ii) Games. */

/*8. Take a look on the data you retrieved in the question 6. Give some insights.*/
/*These are apps that have very few reviews, which explains the high user rating*/

/*9. Now compare the data from questions 5 and 6. What do you see?*/
/*The data in question 5 is more reliable than the one in question 6 as we have more user feedback on question 5. Question 6 results are very biased by the low amount of reviews*/

/*10. How could you take the top 3 regarding the user ratings but also the number of votes?*/
SELECT track_name, user_rating, rating_count_tot
FROM applestore2
WHERE user_rating = 5
ORDER BY rating_count_tot DESC
LIMIT 3;

/*11. Does people care about the price? Do some queries, comment why are you doing them and the results you retrieve. What is your conclusion?*/
SELECT price, AVG(rating_count_tot)
FROM applestore2
GROUP BY 1
ORDER BY 2 DESC
/*Yes, as seen in the above query, free apps have more ratings (which can be a proxy of usage). Also, as seen before, the most common apps are free*/