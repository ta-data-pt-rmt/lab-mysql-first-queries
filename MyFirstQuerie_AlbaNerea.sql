USE sakila;
SELECT * FROM Applestore2;

/* QUESTION 1: Which are the different genres? */
SELECT DISTINCT prime_genre
FROM Applestore2;  

/* QUESTION 2: Which is the genre with more apps rated? Answer: "GAMES" */
SELECT prime_genre, SUM(rating_count_tot) AS sum_rating_count_tot
FROM  Applestore2
GROUP BY prime_genre
ORDER BY sum_rating_count_tot DESC;

/* QUESTION 3: Which is the genre with more apps? Answer: "GAMES" */
SELECT prime_genre, COUNT(track_name) AS count_track_name
FROM Applestore2
GROUP BY prime_genre
ORDER BY count_track_name DESC;

/* QUESTION 4: Which is the one with less? Answer: "Catalogs" */
SELECT prime_genre, COUNT(track_name) AS count_track_name
FROM Applestore2
GROUP BY prime_genre
ORDER BY count_track_name ASC;

/* QUESTION 5: Take the 10 apps most rated */
SELECT track_name, rating_count_tot
FROM Applestore2
ORDER BY rating_count_tot DESC
LIMIT 10;

/* QUESTION 6: Take the 10 apps best rated by users */
SELECT track_name, user_rating
FROM Applestore2
ORDER BY user_rating DESC
LIMIT 10;

/* QUESTION 7:  Take a look on the data you retrieved in the question 5. Give some insights */
/*Between the most rated apps we can find social networks apps like Facebook, Instagram or Pinterest, gaming apps and apps related to music */

/* QUESTION 8: Take a look on the data you retrieved in the question 6. Give some insights */
/* We don't have clear results because there are a lot of apps with a 5 as rating so if we take the top 10, the conclusions are not accurate*/

/* QUESTION 9: Now compare the data from questions 5 and 6. What do you see? */
/* From my point of view, both questions are complementary because if we want to find the better app we should take into account both: the app best rated and the app most rated

/* QUESTION 10: How could you take the top 3 regarding the user ratings but also the number of votes? */
SELECT track_name, rating_count_tot, user_rating
FROM Applestore2
ORDER BY user_rating DESC, rating_count_tot DESC
LIMIT 3;

/* QUESTION 11: Does people care about the price? Do some queries, comment why are you doing them and the results you retrieve. What is your conclusion? */
/* What are the most expensive genders? Education, Productivity, Navigation and business */
SELECT price, prime_genre,rating_count_tot
FROM Applestore2
ORDER BY price DESC
LIMIT 10;
/*What are the most rated apps that are not free?*/
SELECT price, prime_genre,rating_count_tot
FROM Applestore2
WHERE price !=0
ORDER BY rating_count_tot DESC, price DESC;
/* Are the top 10 most rated apps free? Yes */
SELECT price, rating_count_tot
FROM Applestore2
ORDER BY rating_count_tot DESC
LIMIT 10;
/* Are the top 10 less rated apps not free? Most of them are not free */
SELECT price, rating_count_tot 
FROM Applestore2
ORDER BY rating_count_tot ASC
LIMIT 10;
/* Number of ratings in the most expensive apps */
SELECT price, rating_count_tot 
FROM Applestore2
ORDER BY price DESC
LIMIT 10;
/* CONCLUSION: 
If we assume that the number of ratings is related to the number of dowloads and we observe the apps that are not free: the cheapest ones are the most rated -> so people tend to pay for the cheapest apps (gaming, entertainement apps).
The most expensive genders are realted to Education, productivity, navigation and business. 
Free apps have the highest number of ratings because people usually download them with more frequency. 
The most expensive apps have a lower number of ratings than free apps, so I assume that the number of dowloads is very low as well because of the price.
Based on previous information, we can conclude that people tend to dowload free apps or if they are not free, people tend to pay for the cheapest ones. For this reason we can conclude that people care about the price. */