SELECT * FROM applestore LIMIT 20;
/*1. Which are the different genres?*/
USE new_schema;
SELECT DISTINCT prime_genre
FROM applestore;

/*2. Which is the genre with more apps rated?*/
SELECT prime_genre, MAX(rating_count_tot) 
FROM applestore;

/*3. Which is the genre with more apps?*/
SELECT MAX(prime_genre)
FROM applestore;

/*4. Which is the one with less?*/
SELECT MIN(prime_genre)
FROM applestore;

/* 5.Take the 10 apps most rated.*/
SELECT rating_count_tot, track_name
FROM applestore
ORDER BY rating_count_tot DESC LIMIT 10; 

/*6. Take the 10 apps best rated by users.*/
SELECT track_name, user_rating
FROM applestore
ORDER BY user_rating DESC LIMIT 10;

/*7. Take a look on the data you retrieved in the question 5. Give some insights.
Here we have retrieved the most rated apps in this dataset, including from best to worst.*/

/*8. Take a look on the data you retrieved in the question 6. Give some insights.
Here we have retrieved the best 10 rated of all apps in the dataset by using ORDER BY DESC LIMIT 10 */

/*9. Now compare the data from questions 5 and 6. What do you see?
The most rated apps are not part of the best rated apps 

/* 10. How could you take the top 3 regarding the user ratings but also the number of votes?*/
SELECT track_name, user_rating, rating_count_tot
FROM applestore
ORDER BY user_rating DESC, rating_count_tot DESC LIMIT 3;

/*11. Does people care about the price? Do some queries, comment why are you doing them and the results you retrieve. What is your conclusion?*/
SELECT price, user_rating, rating_count_tot
FROM applestore
ORDER BY price DESC LIMIT 20;

I would say that Price is not influencing the dataset so much, I can see a lot of pricey apps with 
a high number of ratings
