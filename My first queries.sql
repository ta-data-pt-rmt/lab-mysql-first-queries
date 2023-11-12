-- use BootCamps;

-- 1. Which are the different genres?
SELECT *
FROM AppleStore2;

SELECT DISTINCT prime_genre
FROM AppleStore2;

-- 2. Which is the genre with more apps rated?

SELECT prime_genre, COUNT(*) AS app_count, SUM(rating_count_tot) AS total_rating_count
FROM AppleStore2
GROUP BY prime_genre
ORDER BY total_rating_count DESC;

/* Game is the genre that has the highest app rate which is 105260278 rating. */

-- 3. Which is the genre with more apps?

SELECT prime_genre, COUNT(*) AS app_count
FROM AppleStore2
GROUP BY prime_genre
ORDER BY app_count DESC;

/* Game has the most app count which is 7616 applications.*/

-- 4. Which is the one with less?

SELECT prime_genre, COUNT(*) AS app_count
FROM AppleStore2
GROUP BY prime_genre
ORDER BY app_count ASC;

/* The genre that has less app is Catalogs which is only 20 (if Catalogs is not being count as
a genre, then Medical will be the one that has less number of app which is 46*/

-- 5. Take the 10 apps most rated.

SELECT DISTINCT id, track_name, rating_count_tot 
FROM AppleStore2
ORDER BY rating_count_tot DESC
LIMIT 10;

-- 6. Take the 10 apps best rated by users.
SELECT DISTINCT id, track_name, user_rating
FROM AppleStore2
ORDER BY user_rating DESC
LIMIT 10;


-- 7. Take a look on the data you retrieved in the question 5. Give some insights.
/*there are some unknown track name showing as ???????? this could be a charater encoding issue
for example data contains charaters fromd different languages that not being supported by 
database. It could also be because of a character limit that cause data truncation*/

-- 8. Take a look on the data you retrieved in the question 6. Give some insights.
/* There are some duplications in the data set. This could lead to misterpreting the data. 
I use "DISTINCT" function to eliminate duplicated rows. It is alos posssible to "GROUP BY" function.*/

-- 9. Now compare the data from questions 5 and 6. What do you see?
/* Question 5 focuses on user rating while question 6 focuses on the total rating count. */


-- 10. How could you take the top 3 regarding the user ratings but also the number of votes?
SELECT DISTINCT id, track_name, user_rating, rating_count_tot
FROM AppleStore2
ORDER BY user_rating DESC, rating_count_tot DESC
LIMIT 3;

-- 11. Does people care about the price? Do some queries, comment why are you doing them and the results you retrieve. What is your conclusion?

SELECT AVG(user_rating), price
FROM AppleStore2
GROUP BY price 
ORDER BY price ASC;
/* This query calulates the average user rating and check if there is a correlation between
pricing (free or paid) and user satisfaction.
Price may have an influence on customer rating. However, the highest user rating is a paid app.
We need to further analyse how strong the influence of the price (free or paid app) has on the
user rating. */

SELECT prime_genre, AVG (price) AS avg_price
FROM AppleStore2
GROUP BY prime_genre
ORDER BY avg_price ASC;
/* This query calulates the average price per each genre to analyse price difference 
per genres. 
We can assume that type of genres has an influence on pricing. The higher app price are 
somewhat more serious type of genre such as medical and business. It might be used for 
business related. While lower price app are more for indivisual interestss 
such as social networking, sports etc. */


SELECT price, COUNT(*) as app_count
FROM AppleStore2
GROUP BY price
ORDER by price ASC;
/* This query checks price distribution, how many apps fall in different price ranges. 
It gives insights of the pricing structure. 
There are more number of free apps and lower price apps. When the app price is higher than 
10, customer like not download them (unless it's neccessary for the user, of course). */

SELECT COUNT(*) as app_count, prime_genre, user_rating, AVG (price) as avg_price
FROM AppleStore2
GROUP BY prime_genre, user_rating
ORDER by user_rating DESC, avg_price ASC;

/* There is a correlation between price and customer rating but the result is not clear 
clear enough to conclude that the free apps have the highest customer rating. 
There are number of paid apps that have high customer rating. It's neccesary to futher analyse
if there are other aspects that drive higher rating such as corresponding time, 
overall customerexperience, app features and benefits matching customer expectation. */
