USE lab_test;

SELECT * from applestore2;

/*1. Which are the different genres? */

SELECT DISTINCT prime_genre
FROM lab_test.applestore2;

/*2. Which is the genre with more apps rated? */
SELECT prime_genre, rating_count_tot
FROM lab_test.applestore2
ORDER BY rating_count_tot DESC;

/*3. Which is the genre with more apps? */
SELECT prime_genre, COUNT(prime_genre)
FROM lab_test.applestore2
GROUP BY prime_genre
ORDER BY COUNT(prime_genre) DESC;

/*4. Which is the one with less? */
SELECT prime_genre, COUNT(prime_genre)
FROM lab_test.applestore2
GROUP BY prime_genre
ORDER BY COUNT(prime_genre) ASC;

/*5. Take the 10 apps most rated. */
SELECT track_name, rating_count_tot
FROM lab_test.applestore2
ORDER BY rating_count_tot DESC
LIMIT 10;

/*6. Take the 10 apps best rated by users. */
SELECT track_name, user_rating
FROM lab_test.applestore2
ORDER BY user_rating DESC
LIMIT 10;

/*7. Take a look on the data you retrieved in the question 5. Give some insights. */
/* Social media apps and games are the most popular apps*/
/*8. Take a look on the data you retrieved in the question 6. Give some insights. */
/* Most best rated apps are games */
/*9. Now compare the data from questions 5 and 6. What do you see? */

/*10. How could you take the top 3 regarding the user ratings but also the number of votes? */
SELECT track_name, user_rating, rating_count_tot
FROM lab_test.applestore2
ORDER BY user_rating DESC, rating_count_tot DESC
LIMIT 10;

/*11. Does people care about the price? Do some queries, comment why are you doing them and the results you retrieve. What is your conclusion? */

SELECT track_name,price,user_rating,prime_genre
FROM lab_test.applestore2
ORDER BY user_rating DESC 
LIMIT 20;

/* almost all apps with higher rating are either free or under 5 dollars*/

SELECT price, prime_genre, AVG(user_rating), AVG(user_rating_ver)
FROM lab_test.applestore2
GROUP BY price
ORDER BY AVG(user_rating) DESC, AVG(user_rating_ver) DESC;

/*People might be willing to pay more for music apps, games and medical apps, and they also seem better ranked than free apps