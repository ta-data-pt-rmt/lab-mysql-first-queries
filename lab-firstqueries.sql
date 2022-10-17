SELECT * FROM my_firstqueries.applestore2;

/*1. Which are the different genres?*/

SELECT DISTINCT prime_genre
FROM my_firstqueries.applestore2;

/*2. 2. Which is the genre with more apps rated?*/

SELECT prime_genre, rating_count_tot
FROM my_firstqueries.applestore2
ORDER BY rating_count_tot DESC;

/*3. Which is the genre with more apps? */

SELECT prime_genre, COUNT(prime_genre)
FROM my_firstqueries.applestore2
GROUP BY prime_genre
ORDER BY prime_genre DESC;

/*4. Which is the one with less?*/

SELECT prime_genre, COUNT(prime_genre)
FROM my_firstqueries.applestore2
GROUP BY prime_genre
ORDER BY prime_genre ASC;

/*5.Take the 10 apps most rated. */

SELECT prime_genre
FROM my_firstqueries.applestore2
ORDER BY rating_count_tot DESC
LIMIT 10;

/*6.Take the 10 apps most rated by users. */

SELECT prime_genre
FROM my_firstqueries.applestore2
ORDER BY user_rating DESC
LIMIT 10;

/*7. Take a look on the data you retrieved in the question 5. Give some insights. */
/* Social media apps + games are the most popular apps, briefly followed by music apps*/

/*8. Take a look on the data you retrieved in the question 6. Give some insights. */
/* Users rate games category best. */

/*9. Now compare the data from questions 5 and 6. What do you see? */
/* Social media is very popular but doesn't get best user ratings*/

/*10. How could you take the top 3 regarding the user ratings but also the number of votes? */

SELECT prime_genre
FROM my_firstqueries.applestore2
ORDER BY user_rating DESC, rating_count_tot DESC
LIMIT 3;

/*11. Do people care about the price? Do some queries, comment why are you doing them and the results you retrieve. What is your conclusion? */

SELECT track_name, price, user_rating, prime_genre
FROM my_firstqueries.applestore2
ORDER BY user_rating DESC 
LIMIT 20;

/* yes they do, after running this query it shows almost all apps with higher rating are either free or under 4 dollars*/









