USE lab1;

SELECT * FROM lab1.applestore2;

/* QUESTION 1: */
SELECT DISTINCT prime_genre
FROM applestore2;

/* QUESTION 2: */
SELECT prime_genre, SUM(rating_count_tot)
FROM applestore2
GROUP BY prime_genre;

/* QUESTION 3: */
SELECT prime_genre, COUNT(id) AS id_count
FROM applestore2
GROUP BY prime_genre
ORDER BY id_count DESC;

/* QUESTION 4: */
SELECT prime_genre, COUNT(id) AS id_count
FROM applestore2
GROUP BY prime_genre
ORDER BY id_count ASC;

/* QUESTION 5: */
SELECT id, track_name, rating_count_tot
FROM applestore2
GROUP BY id
ORDER BY rating_count_tot DESC
LIMIT 10;

/* QUESTION 6: */
SELECT id, track_name, user_rating
FROM applestore2
GROUP BY id
ORDER BY user_rating DESC
LIMIT 10;

/* QUESTION 7: */
/* Facebook is the moste rated app, followed by Instagram and Clash of Clans */

/* QUESTION 8: */
/* There are multiple apps that have the highest possible rating. As the rating scale is relativly small,
there are a lot of apps with the same rating, like e.g. the highest rating of 5. */

/* QUESTION 9: */ 
/* The data from question 5 is easier to compare as those are numerical data, while in question 6 categorical data is compared.
Also the values from question 5 are more divers and have a wider range, which makes them easier to compare. */

/* QUESTION 10: */ 
SELECT id, track_name, user_rating, rating_count_tot
FROM applestore2
GROUP BY id
ORDER BY user_rating DESC, rating_count_tot DESC
LIMIT 3;

/* QUESTION 11: */ 
/* The following query checks the average rating per price segment. This is done to check if the average price
and the rating segment are decreasing/increasing alike. */
SELECT price, AVG(user_rating)
FROM applestore2
GROUP BY price
ORDER BY price DESC;

/* The following query checks the average price per rating segment. This is done to check if the average price and
the rating segment are decreasing/increasing alike, but in a different way than the query before. */
SELECT user_rating, AVG(price) AS avg_price
FROM applestore2
GROUP BY user_rating
ORDER BY user_rating DESC, avg_price DESC;

/* It seams that people don't care about the app price, as the price of an app appears to be unconnected to the app's rating. */
