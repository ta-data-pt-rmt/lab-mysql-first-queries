USE applestore;
SELECT * FROM Applestore2;

/* QUESTION 1: Which are the different genres? */
SELECT DISTINCT prime_genre
FROM Applestore2; 

/* QUESTION 2: Which is the genre with more apps rated?
 GAMES */
SELECT prime_genre, SUM(rating_count_tot) AS sum_rating_count_tot
FROM  Applestore2
GROUP BY prime_genre
ORDER BY sum_rating_count_tot DESC;

/* QUESTION 3: Which is the genre with more apps? 
GAMES */
SELECT prime_genre, COUNT(track_name) AS count_track_name
FROM Applestore2
GROUP BY prime_genre
ORDER BY count_track_name DESC;

/* QUESTION 4: Which is the one with less?
CATALOGS */
SELECT prime_genre, COUNT(track_name) AS count_track_name
FROM Applestore2
GROUP BY prime_genre
ORDER BY count_track_name ASC;

/* QUESTION 5: Take the 10 apps most rated */
SELECT track_name, rating_count_tot
FROM Applestore2
ORDER BY rating_count_tot DESC
LIMIT 10;

/* QUESTION 6: Take the 10 apps best rated by users */
SELECT track_name, user_rating
FROM Applestore2
ORDER BY user_rating DESC
LIMIT 10;


/* QUESTION 7:  Take a look on the data you retrieved in the question 5. Give some insights */
/* The apps found there are quite famous ones in areas like gaming, social networks and so on */


/* QUESTION 8: Take a look on the data you retrieved in the question 6. Give some insights */
/* These apps are for me completelly unknown, and maybe that's also a reason to have 5 stars: only a few good votes can give a really good average */

/* QUESTION 9: Now compare the data from questions 5 and 6. What do you see? */
/* Famous ones vs unknown ones. If I would do a mix of both terms, choosing the best relation between downloads and rating */

/* QUESTION 10: How could you take the top 3 regarding the user ratings but also the number of votes? */
SELECT track_name, rating_count_tot, user_rating
FROM Applestore2
ORDER BY user_rating DESC, rating_count_tot DESC
LIMIT 3;

/*11. Does people care about the price? Do some queries, comment why are you doing them and the results you retrieve. What is your conclusion?*/
SELECT track_name, price, rating_count_tot, user_rating
FROM Applestore2
ORDER BY price DESC
LIMIT 20
/* The most expensive apps tend to have a fairly good user rating, but they aren't as popular as others */

SELECT track_name, price, rating_count_tot, user_rating
FROM Applestore2
WHERE price != 0
ORDER BY user_rating DESC
LIMIT 20
/* Here we can see the top 20 paid apps by user rating. Special mention to "Sky Guide: View Stars Night or Day" and ":) Sudoku +". Both of them having a decent amount of downloads.*/


SELECT price, rating_count_tot 
FROM Applestore2
ORDER BY rating_count_tot ASC
LIMIT 20;
/* Among the less rated (0) apps, there is a decent amount of paid apps */

/*With this, I can assume that the people preferes free software to paid software, but also, the paid ones tend to have good ratings */