/* QUESTION 1: Which are the different genres? */
SELECT distinct prime_genre FROM practice.applestore order by 1

/* QUESTION 2: Which is the genre with more apps rated? */
SELECT prime_genre, COUNT(id) as cnt 
FROM practice.applestore
WHERE rating_count_tot > 0
GROUP BY prime_genre
ORDER BY cnt DESC
limit 1;

/* QUESTION 3: Which is the genre with more apps */
SELECT prime_genre, COUNT(id) as cnt 
FROM practice.applestore
GROUP BY prime_genre
ORDER BY cnt DESC
limit 1;

/* QUESTION 4: Which is the one with less? */
SELECT prime_genre, COUNT(id) as cnt 
FROM practice.applestore
GROUP BY prime_genre
ORDER BY cnt ASC
limit 1;

/* QUESTION 5: Take the 10 apps most rated. */
SELECT track_name, rating_count_tot
FROM practice.applestore
ORDER BY rating_count_tot DESC
limit 10;

/* Question 6: Take the 10 apps best rated by users. */
SELECT track_name, user_rating, rating_count_tot
FROM practice.applestore
WHERE rating_count_tot > 100
ORDER BY user_rating DESC,rating_count_tot DESC
limit 10;

/* QUESTION 7: Take a look on the data you retrieved in the question 5. Give some insights. */
/*
For the most rated app, we looked at the apps with the most rating count. It is not a surprise that
popular social networking apps like Facebook and Instagram are on the top of the list
*/

/* QUESTION 8: Take a look on the data you retrieved in the question 6. Give some insights. */
/*
If we just look at user_rating, it will not be enough, as the apps with lower number of rates
might just show up on the top, like an app with single rating. To prevent this, it is better 
to filter the apps that has less rating than certain number (we used 100 as an example) and then
sort the apps by user_rating first, and rating count next. So an app that got rating of a 5 from
1000 users is better than an app with rating of 5 from 500 users.
*/

/* QUESTION  9: Now compare the data from questions 5 and 6. What do you see?*/
/* 
We already combined this in the previous answer. It is clear that top rated apps are not necessarily
have the highest rating (like Facebook is not the  best rated app, while it has most rating)
*/

/* QUESTION 10: How could you take the top 3 regarding the user ratings but also the number of votes? */
SELECT track_name, user_rating, rating_count_tot
FROM practice.applestore
WHERE rating_count_tot > 100
ORDER BY user_rating DESC,rating_count_tot DESC
limit 3;

/* QUESTION 11: Does people care about the price? */
/* In normal situation, you should clarify, what does it mean "People care about the price"
as it can have different meanings. Does it mean if people use those apps more, or
if they leave more rating about the app. Depending on that, the answer might be
very different!
Here, we assume the CARE means, they CARE to RATE the APP
 */

/* First running this query to see most expensive top rated apps */
SELECT track_name, rating_count_tot, user_rating, price
FROM practice.applestore
ORDER BY price desc, user_rating desc, rating_count_tot desc
limit 100;
/* Then running this query to see free top rated apps */
SELECT track_name, rating_count_tot, user_rating, price
FROM practice.applestore
ORDER BY price ASC, user_rating desc, rating_count_tot desc
limit 100;

/* if we take rating_count as a proxy of usage and user feedback, we can see that
free apps generate more rating, which could mean, higher usage and that means
it is easier for them to get discovered or promoted in the long run!
*/