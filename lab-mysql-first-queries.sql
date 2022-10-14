USE AppleStore;

/* QUESTION 1. Which are the different genres? */

SELECT DISTINCT prime_genre
  FROM applestore;
  
/*QUESTION 2. Which is the genre with more apps rated? */

SELECT prime_genre, COUNT(id) AS apps
  FROM applestore
  WHERE rating_count_tot > 0
  GROUP BY prime_genre
  ORDER BY COUNT(id) DESC
  LIMIT 1;
  
/* QUESTION 3. Which is the genre with more apps? */

SELECT prime_genre, COUNT(id) AS apps
  FROM applestore
  GROUP BY prime_genre
  ORDER BY COUNT(id) DESC
  LIMIT 1;
  
/* QUESTION 4. Which is the one with less? */

SELECT prime_genre, COUNT(id) AS apps
  FROM applestore
  GROUP BY prime_genre
  ORDER BY COUNT(id) ASC
  LIMIT 1;
  
/* QUESTION 5. Take the 10 apps most rated. */

SELECT track_name, rating_count_tot
  FROM applestore
  ORDER BY rating_count_tot DESC
  LIMIT 10;
  
/* QUESTION 6. Take the 10 apps best rated by users. */

SELECT track_name, user_rating, rating_count_tot 
  FROM applestore
  ORDER BY user_rating DESC, rating_count_tot DESC
  LIMIT 10;
  
/* QUESTION 7. Take a look on the data you retrieved in the question 5. Give some insights. */

SELECT *
  FROM applestore
  ORDER BY rating_count_tot DESC
  LIMIT 10;

/* ANSWER 7. All of them are free, don't have price. Most of them are apps (Social Networking, Mucis, Photo, ...), only 4 of them are games */

/* QUESTION 8. Take a look on the data you retrieved in the question 6. Give some insights. */

SELECT *
  FROM applestore
  ORDER BY user_rating DESC, rating_count_tot DESC
  LIMIT 10;
  
/* ANSWER 8. All of them but 1 are games, the remaining is an app to order food. There are 4 with prices*/

/* QUESTION 9. Now compare the data from questions 5 and 6. What do you see? */

SELECT *
  FROM applestore
  ORDER BY rating_count_tot DESC
  LIMIT 10;
  
SELECT *
  FROM applestore
  ORDER BY user_rating DESC, rating_count_tot DESC
  LIMIT 10;
  
/* ANSWER 9. The apps with better user rating are not the same as the apps more rated, Most of the apps don't have price. 
Also can see that within the games with higher ratings, maybe the age rating is lower */
 
/* QUESTION 10. How could you take the top 3 regarding the user ratings but also the number of votes? */

SELECT track_name, user_rating, rating_count_tot
  FROM applestore
  ORDER BY user_rating DESC, rating_count_tot DESC
  LIMIT 3;

/* QUESTION 11. Does people care about the price? */

SELECT track_name, price, rating_count_tot, user_rating
  FROM applestore
  ORDER BY price DESC;
  
/*ANSWER 11. The apps with highest prices have very few ratings, compared with the most rated*/

SELECT COUNT(id), SUM(rating_count_tot), SUM(rating_count_tot)/COUNT(id) AS ratings_app_without_price
  FROM applestore
  WHERE price = 0;

SELECT COUNT(id), SUM(rating_count_tot), SUM(rating_count_tot)/COUNT(id) AS ratings_app_with_price
  FROM applestore
  WHERE price <> 0;
  
/*ANSWER 11. The ratings per app on the apps with prices are very few compared with the ratings per app on the apps without prices,
  the difference is x5 without prices over with prices */ 
