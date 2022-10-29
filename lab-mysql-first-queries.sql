/* QUESTION 1 */
/*SELECT DISTINCT prime_genre
FROM mysql_first_queries.applestore2*/

/* QUESTION 2*/
/*SELECT prime_genre, SUM(rating_count_tot)
FROM mysql_first_queries.applestore2
GROUP BY prime_genre*/

/* QUESTION 3 and 4*/
/*SELECT prime_genre, COUNT(prime_genre)
FROM mysql_first_queries.applestore2
GROUP BY prime_genre
ORDER BY COUNT(prime_genre) DESC*/

/* QUESTION 5 and 7*/
/*SELECT track_name, rating_count_tot
FROM mysql_first_queries.applestore2
GROUP BY track_name
ORDER BY SUM(rating_count_tot) DESC

There are big differences between the count of ratings an app received. The most rated apps are Facebook and instagram, while facebook has over 800k more ratings than instagram*/

/* QUESTION 6 and 8*/
/*SELECT track_name, user_rating
FROM mysql_first_queries.applestore2
GROUP BY track_name
ORDER BY user_rating DESC

Ratings range form 0 to 5 stars. Most apps fall between 3 and 5.*/

/* QUESTION 9*/
/* Number of ratings does not say much about the overall rating of an app. No clear prediction can be made. */

/* QUESTION 11*/
/* SELECT price, user_rating, SUM(rating_count_tot)
FROM mysql_first_queries.applestore2
GROUP BY price
ORDER BY price DESC

The lower the price, the more people rate the app, which is likely connected to more people using cheaper apps. The higher the price, the less people use the app, the less reviews are written. 
There is no clear difference in user_rating, however, it could be said that pricier apps have slightly lower ratings, which possibly is connected to people having highe expectations for these apps.*/



