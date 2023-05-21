SELECT * 
FROM applestore_data.applestore2
LIMIT 10;

/* 1. Which are the different genres? */
SELECT DISTINCT prime_genre
FROM applestore_data.applestore2;

/*2. Which is the genre with more apps rated?*/
SELECT prime_genre, 
	SUM(rating_count_tot) AS total_ratings
FROM applestore_data.applestore2
GROUP BY prime_genre
ORDER BY total_ratings DESC;

/*3. Which is the genre with more apps?*/
SELECT prime_genre, 
	COUNT(track_name) AS total_apps
FROM applestore_data.applestore2
GROUP BY prime_genre
ORDER BY total_apps DESC;

/*4. Which is the one with less?*/
SELECT prime_genre, 
	COUNT(track_name) AS total_apps
FROM applestore_data.applestore2
GROUP BY prime_genre
ORDER BY total_apps ASC;

/*5. Take the 10 apps most rated.*/
SELECT track_name, 
	rating_count_tot
FROM applestore_data.applestore2
ORDER BY rating_count_tot DESC
LIMIT 10;

/*6. Take the 10 apps best rated by users.*/
SELECT track_name, 
	AVG(user_rating) AS user_given_ratings, 
	COUNT(rating_count_tot)
FROM applestore_data.applestore2
GROUP BY track_name
ORDER BY user_given_ratings DESC
LIMIT 10;


/*Questions */
/*7. Take a look on the data you retrieved in the question 5. Give some insights.
These are definitely the most popular apps, so it makes sense that they have the biggest quantity of ratings */

/* 8. Take a look on the data you retrieved in the question 6. Give some insights.
This are the "best rated" but only because they only have one imput, we should take in consideration the quantity of the ratings given*/

/*9. Now compare the data from questions 5 and 6. What do you see?
As indicated before, the ratings are impacted by the amout of users that are giving them, so we should compare using a wighted average.*/

/*10. How could you take the top 3 regarding the user ratings but also the number of votes?*/

SELECT track_name, 
       SUM(user_rating * rating_count_tot) / SUM(rating_count_tot) AS normalized_rating,
       SUM(rating_count_tot) AS total_votes
FROM applestore_data.applestore2
GROUP BY track_name
ORDER BY normalized_rating DESC, total_votes DESC
LIMIT 3;

/*11. Does people care about the price? 
Do some queries, comment why are you doing them and the results you retrieve. What is your conclusion?*/

/*a. Let's see first for what genre are people more inclined to pay an app
for this exercise purpose, we assume here that each rating is an user, but is importatn to note that not all users rate the apps they use*/
SELECT prime_genre, 
	SUM(rating_count_tot) AS total_users
FROM applestore_data.applestore2
WHERE price <> 0
GROUP BY prime_genre
ORDER BY total_users DESC
LIMIT 3;
/*the top 3 of this list are "Games","Photo & Video" and "Entertainment"*/

/*b. But which apps are the most downloaded? regardless of the price*/
SELECT prime_genre, 
	SUM(rating_count_tot) AS total_users
FROM applestore_data.applestore2
GROUP BY prime_genre
ORDER BY total_users DESC
LIMIT 3;
/*the top 3 of this list are "Games","Social Networking" and "Photo & Video"
So, in terms of users, we see that "Games" is the genre where no matter if the app is paid or not, it is always number 1*/

/*c. Now let's check for what type of apps the users are willing to pay a higher price*/
SELECT prime_genre, 
	AVG(price) AS avg_price,
	SUM(rating_count_tot) AS total_users
FROM applestore_data.applestore2
GROUP BY prime_genre
ORDER BY  avg_price DESC, total_users DESC
LIMIT 3;
/*Users are more inclined to pay higher prices for "Medical","Business" and "Reference" apps
To determine if there is a correlation between prices and ratings, it would be better to use python and and analyze the data in detail. */

