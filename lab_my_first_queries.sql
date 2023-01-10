/* QUESTION 1 */
SELECT DISTINCT prime_genre
FROM `lab-mysql-first-queries`.applestore

/* QUESTION 2*/
SELECT prime_genre, SUM(rating_count_tot)
FROM `lab-mysql-first-queries`.applestore
GROUP BY prime_genre
/*A: Games */

/* QUESTION 3 & 4*/
SELECT prime_genre, COUNT(prime_genre)
FROM `lab-mysql-first-queries`.applestore
GROUP BY prime_genre
ORDER BY COUNT(prime_genre) DESC
/*A: Games & Catalogs */

/* QUESTION 5: */
SELECT track_name, rating_count_tot
FROM `lab-mysql-first-queries`.applestore
ORDER BY rating_count_tot DESC
LIMIT 10;

/* QUESTION 6: */
SELECT track_name, user_rating
FROM `lab-mysql-first-queries`.applestore
ORDER BY user_rating DESC
LIMIT 10;

/* QUESTION 7 & 8*/
SELECT track_name, user_rating
FROM `lab-mysql-first-queries`.applestore
GROUP BY track_name
ORDER BY user_rating DESC
/*A: The result of Q#5 is the only considerable top 10.*/

/* QUESTION 9 & 10*/
SELECT track_name, user_rating, rating_count_tot
FROM `lab-mysql-first-queries`.applestore
ORDER BY user_rating DESC, rating_count_tot DESC
LIMIT 3;

/* QUESTION 11*/
SELECT price, user_rating, SUM(rating_count_tot)
FROM `lab-mysql-first-queries`.applestore
GROUP BY price
ORDER BY price DESC

SELECT AVG(price)
FROM `lab-mysql-first-queries`.applestore
WHERE price<>0;

SELECT track_name, rating_count_tot, price
FROM `lab-mysql-first-queries`.applestore
ORDER BY rating_count_tot DESC
LIMIT 5;
/* Note: The top 5 are all free apps. */
/*A: Seems like the lower the price, more people tend to rate it; & viceversa. I might assume that apps that have lower/no price tend to be more used or downloaded that the ones with a higher pricetag.*/