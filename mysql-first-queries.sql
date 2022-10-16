SELECT * FROM apple_lab.applestore;

/* 1. Which are the different genres? */

SELECT DISTINCT prime_genre 
FROM apple_lab.applestore;

/* 2. Which is the genre with more apps rated? */

SELECT prime_genre, rating_count_tot
FROM apple_lab.applestore
ORDER BY rating_count_tot DESC;

/* 3. Which is the genre with more apps? */

SELECT prime_genre, COUNT(prime_genre) AS Apps_Number
FROM apple_lab.applestore
GROUP BY prime_genre
ORDER BY Apps_Number DESC;

/* 4. Which is the one with less? */

SELECT prime_genre, COUNT(prime_genre) AS Apps_Number
FROM apple_lab.applestore
GROUP BY prime_genre
ORDER BY Apps_Number ASC;

/* 5. Take the 10 apps most rated. */

SELECT track_name, rating_count_tot
FROM apple_lab.applestore
ORDER BY rating_count_tot DESC
LIMIT 10; 

/* 6. Take the 10 apps best rated by users. */

/* SOLUTION: Best rated by users has to be followed by another variable e.g. number of ratings. If not, we can find apps rated as 5 out of 5 but with only 1 rating.
Example here: 

SELECT track_name, user_rating, rating_count_tot
FROM apple_lab.applestore
ORDER BY user_rating DESC
LIMIT 10;  

Thus, for this exercise we take into account the top 10 best rated according to number of ratings. As I consider that having a 5 star app with 1M comments
is better than a 5 star app with 1000 ratings.
*/

SELECT track_name, user_rating, rating_count_tot
FROM apple_lab.applestore
ORDER BY user_rating DESC, rating_count_tot DESC
LIMIT 10; 

/* 7. Take a look on the data you retrieved in the question 5. Give some insights.*/

/* SOLUTION: The top 10 Apps more rated are the most popular ones, most of them being either social media apps or well-known games. It's interesting to see the 
bible as the only book in the top 10 and Pandora (a music app from the US) with more ratings than Spotify (more known in Europe)
*/

/* 8. Take a look on the data you retrieved in the question 6. Give some insights.*/

/* SOLUTION: If we don't take into account the rating_count_tot then we see only apps with a few ratings and not known at all. With the rating_count_tot
in the analysis, we see more interesting apps in the Top 10, also with a 5 stars rating. In this case, most of them are games with the exception of Domino's Pizza
*/

/* 9. Now compare the data from questions 5 and 6. What do you see? */

/* SOLUTION: The most known apps in the world are the ones that receive the biggest amount of votes (Instagram, Facebook) because of their huge amount of daily users. 
However, people tend to critise them way more so the rating is not as high as other less known apps. Ratings in games are higher than in social media, probably because
social media apps are more complex and being an active user doesn't mean that you like a 100% of the app. If you play a game you really like, it's more likely
to rate this well than a social media app. */

/* 10. How could you take the top 3 regarding the user ratings but also the number of votes? */

/* I haven't read this question before, so I have already done it for question 6. This would be the code I'd use: */

SELECT track_name, user_rating, rating_count_tot
FROM apple_lab.applestore
ORDER BY user_rating DESC, rating_count_tot DESC
LIMIT 3; 

/* 11. Does people care about the price? Do some queries, comment why are you doing them and the results you retrieve. What is your conclusion? */

/* I first checked the most rated apps to see if the most popular ones where for free. Looking at the first 100 results we can see that there is a
clear pattern, most of the apps have a price = 0 USD  */
SELECT track_name, price, rating_count_tot
FROM apple_lab.applestore
ORDER BY rating_count_tot DESC, price DESC
LIMIT 100;

/* In order to have a better insight of the data, I calculated the total number of ratings for specific prices. We can now see clearly that people are
more interested in apps that are 0 USD (80M ratings) than pricey apps */

SELECT SUM(rating_count_tot) AS Sum_0_Rating FROM apple_lab.applestore WHERE price = 0;
/* Result  80M */

SELECT SUM(rating_count_tot) AS Sum_3_Rating FROM apple_lab.applestore WHERE price >0 AND price <3;
/* Result  9M */

SELECT SUM(rating_count_tot) AS Sum_6_Rating FROM apple_lab.applestore WHERE price >3 AND price <6;
/* Result  1.8M */

SELECT SUM(rating_count_tot) AS Sum_6_Rating FROM apple_lab.applestore WHERE price >=6;
/* Result  1.4M */