USE Appstore;

-- 1. Which are the different genres?
SELECT * 
FROM applestore2;
SELECT DISTINCT prime_genre 
FROM applestore2;

-- 2. Which is the genre with more apps rated?
SELECT prime_genre, SUM(rating_count_tot) AS total_rating
FROM applestore2
GROUP BY prime_genre
ORDER BY total_rating DESC
LIMIT 1;

-- 3. Which is the genre with more apps?
SELECT prime_genre, COUNT(*) AS app_count
FROM applestore2
GROUP BY prime_genre
ORDER BY app_count DESC
LIMIT 1;

-- 4. Which is the one with less?
SELECT prime_genre, COUNT(*) AS app_count
FROM applestore2
GROUP BY prime_genre
ORDER BY app_count ASC
LIMIT 1;

-- 5. Take the 10 apps most rated.
SELECT *
FROM applestore2
ORDER BY rating_count_tot DESC
LIMIT 10;

-- 6. Take the 10 apps best rated by users.
SELECT *
FROM applestore2
ORDER BY user_rating DESC
LIMIT 10;

-- 7. Take a look on the data you retrieved in the question 5. Give some insights.
-- The results indicate that the most highly rated apps belong to the 'Social Networking,' 'Games,' and 'Music' categories.

-- 8. Take a look on the data you retrieved in the question 6. Give some insights.
-- The results indicate that the apps with the highest user ratings belong to various categories, including 'Games,' 'Business,' 'Food and Drink,' and 'Social Networking'.

-- 9. Now compare the data from questions 5 and 6. What do you see?
-- Despite 'Social Networking' apps being the most rated, users do not give them high ratings. 
-- The reason could be that as more people use an app, the number of ratings increases; however, this might lead to a decrease in the given ratings for the app.

-- 10. How could you take the top 3 regarding the user ratings but also the number of votes?
SELECT track_name, user_rating, rating_count_tot
FROM applestore2
ORDER BY user_rating DESC, rating_count_tot DESC
LIMIT 3;

-- 11. Does people care about the price? Do some queries, comment why are you doing them and the results you retrieve. What is your conclusion?
SELECT track_name, price/rating_count_tot AS price_per_user_count
FROM applestore2
ORDER BY price_per_user_count DESC
LIMIT 100;
-- I believe there should be positive correlation between rating_count and user_count (which is not given by data)
-- I divided the price by the rating_count to calculate the price_per_user_count and then sorted the results in descending order.
-- I checked the results and observed that only two apps have a price_per_user_count in the range of 25-27 USD. Afterward, this amount suddenly decreases to 7.
-- I believe this indicates that people care about the price of the app. However, to make a conclusive determination, we should conduct a more detailed analysis.