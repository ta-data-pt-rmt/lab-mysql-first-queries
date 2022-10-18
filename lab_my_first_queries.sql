USE lab_w6d2_mifirstqueries;

/* QUESTION 1: */
SELECT DISTINCT prime_genre
FROM applestore;

/* QUESTION 2: */
SELECT DISTINCT prime_genre, SUM(rating_count_tot)
FROM applestore
GROUP BY prime_genre;

/* QUESTION 3: */
SELECT prime_genre, COUNT(id)
FROM applestore
GROUP BY prime_genre
ORDER BY COUNT(id) DESC;

/* QUESTION 4: */
SELECT prime_genre, COUNT(id)
FROM applestore
GROUP BY prime_genre
ORDER BY COUNT(id) ASC;

/* QUESTION 5: */
SELECT track_name, rating_count_tot
FROM applestore
ORDER BY rating_count_tot DESC
LIMIT 10;

/* QUESTION 6: */
SELECT track_name, user_rating
FROM applestore
ORDER BY user_rating DESC
LIMIT 10;

/* QUESTION 7:  Question 5 is a real top 10 because number of ratings are different between them, so it makes sense. Very popular apps */

/* QUESTION 8:  Question 6 not a real top 10 because we will probably have many apps rated with a 5 */

/* QUESTION 9 and 10: */

SELECT track_name, user_rating, rating_count_tot
FROM applestore
ORDER BY user_rating DESC, rating_count_tot DESC
LIMIT 3;

/* QUESTION 11: */
SELECT track_name, user_rating, rating_count_tot, price
FROM applestore
ORDER BY user_rating DESC, rating_count_tot DESC
LIMIT 10;
/* We see that from the top 10 rating+count there are six with a price = 0 */

SELECT count(id)
FROM applestore
WHERE user_rating = 5 AND price = 0;
/* 255 of the rating=5 are for free */

SELECT count(id), AVG(price)
FROM applestore
WHERE user_rating = 5 AND price <> 0;
/* 235 of the rating=5 are paid with an avg of 3,41 */

SELECT AVG(price)
FROM applestore
WHERE price<>0;
/* The average of the paid apps is 3,88 */

SELECT track_name, rating_count_tot, price
FROM applestore
ORDER BY rating_count_tot DESC
LIMIT 10;
/* The top 10 most rated are free apps*/

/* People seems not to care so much about the price when it comes to well rated (high quality) apps. It would be interesting to see the number of downloads, because probably the most downloaded will be the same as the most rated which are all for free.*/