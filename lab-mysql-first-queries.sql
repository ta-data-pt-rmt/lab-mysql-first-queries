SELECT *
FROM first_query_lab.applestore;


/*1. Which are the different genres?*/

SELECT DISTINCT prime_genre
FROM first_query_lab.applestore;


/*2. Which is the genre with more apps rated?*/

SELECT prime_genre, SUM(rating_count_tot)
FROM first_query_lab.applestore
GROUP BY  prime_genre
ORDER BY MAX(rating_count_tot) DESC;

/*3. Which is the genre with more apps?*/

SELECT prime_genre, COUNT(track_name) AS total
FROM first_query_lab.applestore
GROUP BY  prime_genre
ORDER BY total DESC;

/*4. Which is the one with less?*/

SELECT prime_genre, COUNT(track_name) AS total
FROM first_query_lab.applestore
GROUP BY  prime_genre
ORDER BY total ASC
LIMIT 1;

/*5. Take the 10 apps most rated.*/

SELECT track_name, rating_count_tot
FROM first_query_lab.applestore
ORDER BY rating_count_tot DESC
LIMIT 10;



/*6. Take the 10 apps best rated by users.*/
SELECT track_name, user_rating, rating_count_tot
FROM first_query_lab.applestore
ORDER BY user_rating DESC 
LIMIT 10;


/*7. Take a look on the data you retrieved in the question 5. Give some insights.*/
/* These are the most famous apps. The more famous the app, the more ratings it can get.*/

/*8. Take a look on the data you retrieved in the question 6. Give some insights.*/
/* We get the apps that got a perfect rating, but some of them got it with 3 votes, and some of them with thousands, which we can't compare against. The apps that got a perfect score with more ratings, would be the best apps. */

/*9. Now compare the data from questions 5 and 6. What do you see?*/
/* The first represent the most famous apps, and the secod gets all 5 stars rated apps but without an order */


/*10. How could you take the top 3 regarding the user ratings but also the number of votes?*/
SELECT track_name, user_rating, rating_count_tot
FROM first_query_lab.applestore
ORDER BY user_rating DESC, rating_count_tot DESC
LIMIT 10;


/*11. Does people care about the price? Do some queries, comment why are you doing them and the results you retrieve. What is your conclusion? */
SELECT 
  CASE 
    WHEN price <= 0.99 THEN 'Under $1'
    WHEN price <= 1.99 THEN '$1-$1.99'
    WHEN price <= 2.99 THEN '$2-$2.99'
    WHEN price <= 4.99 THEN '$3-$4.99'
    ELSE 'Over $5'
  END AS price_range,
  AVG(rating_count_tot) AS number_ratings_avg,
  AVG(user_rating) AS ratings_avg,
  COUNT(track_name) AS number_of_apps,
  (AVG(user_rating) / AVG(rating_count_tot))*1000 AS score

FROM first_query_lab.applestore
GROUP BY price_range
ORDER BY ratings_avg DESC;

/* I grouped the prices by similar amount of number of apps in those intervals.
I calculated the averages of number of ratings and value of those ratings and got an score. The higher, the better ratio rating over number of apps.
We can see that the apps that have a price range between $2 and $3 have a great rating average, but the ones between $3 and $4 have better ratio overall.
Cheap apps have the worst score and poor ratings.
The most expensive ones are not particularly better, as we can see.