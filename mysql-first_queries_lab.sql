USE my_first_queries;

SELECT * FROM applestore2;


/*1. Which are the different genres?*/
SELECT DISTINCT prime_genre
FROM applestore2; 

/*2. Which is the genre with more apps rated?*/
SELECT DISTINCT prime_genre, SUM(rating_count_tot)
FROM applestore2
GROUP BY prime_genre;

/*3. Which is the genre with more apps?*/
SELECT prime_genre, COUNT(id)
FROM applestore2
GROUP BY prime_genre
ORDER BY COUNT(id) DESC;

/*4. Which is the one with less?*/
SELECT prime_genre, COUNT(id)
FROM applestore
GROUP BY prime_genre
ORDER BY COUNT(id) ASC

/*5. Take the 10 apps most rated.*/
SELECT track_name, rating_count_tot
FROM applestore2
ORDER BY rating_count_tot DESC
LIMIT 10;

/*6. Take the 10 apps best rated by users.*/
SELECT track_name, user_rating
FROM applestore2
ORDER BY user_rating DESC
LIMIT 10;

/*7. Take a look on the data you retrieved in the question 5. Give some insights.*/
/*The results for question 5 are more insightful because have different ratings between the apps, therefore shows the more popular apps*/

/*8. Take a look on the data you retrieved in the question 6. Give some insights.*/
/*Most probably there are more apps rated with 5, so not very insightful*/

/*9. Now compare the data from questions 5 and 6. What do you see?*/
SELECT track_name, user_rating, rating_count_tot
FROM applestore2
ORDER BY user_rating DESC, rating_count_tot DESC;

/*10. How could you take the top 3 regarding the user ratings but also the number of votes?*/
SELECT track_name, user_rating, rating_count_tot
FROM applestore2
ORDER BY user_rating DESC, rating_count_tot DESC
Limit 3;

/*11. Do people care about the price?*/
SELECT track_name, user_rating, rating_count_tot, price
FROM applestore2
ORDER BY user_rating DESC, rating_count_tot DESC
LIMIT 10;

/*The top 10 rating count apps show the prices 0 to 1, which shows it didn't affect the quality of the apps. However, given that free or cheap apps are downloaded the 
most also means that the expectations are lower than the more expensive apps*/