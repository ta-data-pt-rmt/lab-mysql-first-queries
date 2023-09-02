USE applestore;

/*Excercise 1 : 1. Which are the different genres?*/

SELECT DISTINCT  prime_genre FROM applestore2;


/*Excercise 2 : 1. Which is the genre with more apps rated?*/

SELECT * FROM applestore2 LIMIT 10;

SELECT prime_genre, SUM(rating_count_tot) FROM applestore2 GROUP BY prime_genre order by sum(rating_count_tot) DESC;


/*Excercise 3 : 1. Which is the genre with more apps?*/

SELECT prime_genre, COUNT(prime_genre) FROM applestore2 group by prime_genre order by count(prime_genre) DESC;



/*Excercise 4 : 1. Which is the one with less?*/

SELECT prime_genre, COUNT(prime_genre) FROM applestore2 group by prime_genre order by count(prime_genre) ASC;


/*Excercise 5 : 1.  Take the 10 apps most rated.*/

SELECT track_name, rating_count_tot
FROM applestore2
ORDER BY rating_count_tot DESC
LIMIT 10;

/*Excercise 6 : 1.  Take the 10 apps best rated by users.*/

SELECT track_name, user_rating
FROM applestore2
ORDER BY user_rating DESC
LIMIT 10;


/*Exercise 7 Take a look on the data you retrieved in the question 5. Give some insights*/

/*it looks like the top 10 are the most downloaded apps that is why the have the most ratings*/ 


/*Exercise 8  Take a look on the data you retrieved in the question 6. Give some insights.*/

/* the way the query is built it takes into consideration only user rating without considering either the amount of downloads or the total user ratings*/

/*Exercise 9   Now compare the data from questions 5 and 6. What do you see?*/

/* None of the 10 most rated apps appear on the list of the 10 best rated apps */

/*Exercise 10    How could you take the top 3 regarding the user ratings but also the number of votes?*/

SELECT track_name, user_rating * rating_count_tot
FROM applestore2
ORDER BY user_rating * rating_count_tot DESC
LIMIT 3

/*Exercise 11    How could you take the top 3 regarding the user ratings but also the number of votes?*/