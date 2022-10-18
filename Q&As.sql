/* 1. Which are the different genres? */
SELECT DISTINCT(prime_genre) FROM data

/* 2. Which is the genre with more apps rated? */
SELECT prime_genre, max(rating_count_tot) FROM data GROUP BY(prime_genre) LIMIT 1

/* 3. Which is the genre with more apps? */
SELECT prime_genre, COUNT(track_name) FROM data GROUP BY prime_genre LIMIT 1 

/* Which is the one with less? */
SELECT prime_genre, COUNT(track_name) FROM data GROUP BY prime_genre ORDER BY 2 ASC LIMIT 1

/* 5. Take the 10 apps most rated. */
SELECT track_name, rating_count_tot FROM data ORDER BY 2 DESC LIMIT 10

/*6. Take the 10 apps best rated by users.*/
SELECT track_name, user_rating  FROM data ORDER BY 2 DESC LIMIT 10

/*7. Take a look on the data you retrieved in the question 5. Give some insights.
We can observe that Facebook is the most rated app, followed by IG, and Clash of Clans.
*/

/*8. Take a look on the data you retrieved in the question 6. Give some insights.
Here we have a problem, because of the user rating being in a scale from 1-5 we have way to many apps rated 5, the best would be to actually either segregate them by genre, or apply other filters, knowing that even within a genre the number of rated 5 apps will be big.
*/

/*9. Now compare the data from questions 5 and 6. What do you see?
The data won't match, based on the fact that the on question 5 we have retrieved the top 10 most rated looking in the number of ratings, on question number 6 we looked into user rating, which will put many apps on the same level. The two question look at different measures.
*/

/*10. How could you take the top 3 regarding the user ratings but also the number of votes?*/
SELECT track_name, rating_count_tot, user_rating FROM data WHERE user_rating = 5 ORDER BY rating_count_tot DESC LIMIT 3


/*11. Does people care about the price?** Do some queries, comment why are you doing them and the results you retrieve. What is your conclusion? */
SELECT * FROM data ORDER BY rating_count_tot DESC /* Facebook is the app with most ratings, followed by another 10 which are all free, so people do preffer care about price. */


