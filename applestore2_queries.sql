USE sakila;
SELECT * FROM applestore2;

/* 1. Which are the different genres? */
SELECT DISTINCT prime_genre
FROM applestore2;

/* Which is the genre with more apps rated? */
SELECT prime_genre, SUM(rating_count_tot) AS Sum_rating_count_tot
FROM applestore2
GROUP BY prime_genre
ORDER BY Sum_rating_count_tot DESC
LIMIT 10;

/* 3. Which is the genre with more apps? */
SELECT prime_genre, COUNT(id) AS count_id
from applestore2
GROUP BY prime_genre
ORDER BY count_id DESC;

/* 4. Which is the one with less? */
SELECT prime_genre, COUNT(id) AS count_id
from applestore2
GROUP BY prime_genre
ORDER BY count_id ASC;

/* 5. Take the 10 apps most rated. */
SELECT id, SUM(rating_count_tot) AS most_rated
FROM applestore2
GROUP BY id
ORDER BY most_rated DESC
LIMIT 10;

/* 6. Take the 10 apps best rated by users.*/
SELECT id, user_rating, rating_count_tot FROM applestore2
ORDER BY user_rating DESC, rating_count_tot DESC
LIMIT 10;

/* 7. Take a look on the data you retrieved in the question. Give some insights.*/
SELECT id, SUM(rating_count_tot) AS most_rated
FROM applestore2
GROUP BY id
ORDER BY most_rated DESC
LIMIT 10;
/* I assume id would be the unique identifier of each app. Then we SUM the total number of ratings
to find out which app has the most ratings and then order by the SUM of the ratings to find out the top ids   */

/* 8. Take a look on the data you retrieved in the question 6. Give some insights.*/
SELECT id, user_rating, rating_count_tot FROM applestore2
ORDER BY user_rating DESC, rating_count_tot DESC
LIMIT 10;
/* id is the unique identifier of each app. I first took the user_rating and sorted the results by DESC. It turned out
that a lot of app had a rating of 5 and could not determine the top 10. Then I added the rating_count_tot for each
app as a second desciding factor on the top 10. Now the top 10 is determined by the highest user_rating with the 
highest rating_count_tot DESC*/

/* 9. Now compare the data from questions 5 and 6. What do you see?

The most rated apps are not the top rated apps? */

/* 10. How could you take the top 3 regarding the user ratings but also the number of votes?*/
SELECT id, user_rating, rating_count_tot FROM applestore2
ORDER BY user_rating DESC, rating_count_tot DESC
LIMIT 10;
/*This way? */

/* 11. Does people care about the price? */
SELECT * FROM applestore2;
/* selecting the data for analysis */
SELECT currency FROM applestore2
GROUP BY currency 
/* First checked if there is more than one currency in the databse */
SELECT id, price, rating_count_tot, user_rating FROM applestore2
ORDER BY price DESC;
/* ordering columns of interest by price DESC. I will explore the rating_count_tot.
the user_does not seem to be */
SELECT id, user_rating, rating_count_tot, price FROM applestore2
ORDER BY user_rating DESC, rating_count_tot DESC
LIMIT 20;
/* It seems that the top 20 best rated apps are either free or under 1 USD price */
SELECT id, rating_count_tot, user_rating, price
FROM applestore2
WHERE price > 0
ORDER BY user_rating DESC, rating_count_tot DESC
LIMIT 20;
/* selected and ordered all paid apps to see the rating_count_tot*/

SELECT id, rating_count_tot, user_rating, price
FROM applestore2
WHERE price < 1
ORDER BY user_rating DESC, rating_count_tot DESC
LIMIT 20;
/* selected and ordered all paid apps < 1 USD to see the rating_count_tot
Comparing the above statements it seems that the price and the rating_count_tot are correlated: higher price leads to
less ratings, which would lead us to conclude that there might be less downloads associated with higher priced apps
*/
