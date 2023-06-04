USE first_queries_lab;
/* QUESTION 1: */
SELECT DISTINCT prime_genre
FROM applestore2;
/* QUESTION 2 */
SELECT prime_genre, SUM(rating_count_tot) AS total_rating_count
FROM applestore2
GROUP BY prime_genre
ORDER BY total_rating_count DESC
LIMIT 1;
/* QUESTION 3 */
SELECT prime_genre, COUNT(*) AS app_count
FROM applestore2
GROUP BY prime_genre
ORDER BY app_count DESC
LIMIT 1;
/* QUESTION 4 */
SELECT prime_genre, COUNT(*) AS app_count
FROM applestore2
GROUP BY prime_genre
ORDER BY app_count ASC
LIMIT 1;
/* QUESTION 5 */
SELECT *
FROM applestore2
ORDER BY rating_count_tot DESC
LIMIT 10;
/* QUESTION 6 */
SELECT *
FROM applestore2
ORDER BY user_rating DESC
LIMIT 10;
/* QUESTION 7 */
/* Most of the findings are related to Games genre, afterwards comes music and social networking. Despite having the 
most rating count, the user rating is still not the best. For facebook it's even quite low */
/* QUESTION 8 */
/* The main genre here is also Games, however if we take a look at the rating count, we can see that not many people 
have made given their feedbacks, meaning that user_rating might decrease if more people would give feedback. */
/* QUESTION 9 */
/* Both have Games genre as the most popular. The more rating count is, the less user_rating. The majority of apps 
that have low rating_count_tot but top user_rating are not free whereas the highest rating_count_tot apps are free. */
 /* QUESTION 10 */
SELECT *
FROM applestore2
ORDER BY user_rating * rating_count_tot DESC
LIMIT 3;
/* QUESTION 11 */
SELECT price, AVG(user_rating) AS avg_rating
FROM applestore2
GROUP BY price
ORDER BY avg_rating DESC;
/* I would not say that price has much to do with the rating. The only thing is that free apps have more users, as it
is free and everyone has access to it. Some apps that cost more than $50 still have better rating than some of the
free apps where the user count is more, meaning people who buy it stay pleased with the product. */





