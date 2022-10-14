SELECT * FROM specific_name.applestore;

# 1. Which are the different genres?/*
SELECT DISTINCT prime_genre
FROM specific_name.applestore;

# 2. Which is the genre with more apps rated?/*
SELECT prime_genre, rating_count_tot
FROM specific_name.applestore
GROUP BY prime_genre
ORDER BY rating_count_tot DESC;

# 3. Which is the genre with more apps?/*
SELECT prime_genre, COUNT(*) user_rating
FROM specific_name.applestore
GROUP BY prime_genre
ORDER BY user_rating DESC
LIMIT 20;

# 4. Which is the one with less?/*
SELECT prime_genre, COUNT(*) track_name
FROM specific_name.applestore
GROUP BY prime_genre
ORDER BY track_name;

# 5. Take the 10 apps most rated/*
SELECT track_name, rating_count_tot
FROM specific_name.applestore 
ORDER BY rating_count_tot DESC
LIMIT 10;

# 6. Take the 10 apps best rated by users/*
SELECT track_name, user_rating_ver
FROM specific_name.applestore
ORDER BY user_rating_ver DESC
LIMIT 10;

# 7. Take a look on the data you retrieved in the question 5. Give some insights
/* The game with highest rating count is Facebook, with almost 3 Million reviews*/

# 8. Take a look on the data you retrieved in the question 6. Give some insights.
/* The game with highest rating by user is Putty 3D, with a user rating of 5 stars. People really like 3D Building */

# 9. Now compare the data from questions 5 and 6. What do you see?
/* What it suggests to me is that not the most rated app has necessarly to be the highest rated app. In fact, the highest the number of ratings, the higher the possibilities to obtain bad reviews */

# 10. How could you take the top 3 regarding the user ratings but also the number of votes?
SELECT track_name, user_rating, rating_count_tot
FROM specific_name.applestore 
ORDER BY user_rating DESC, rating_count_tot DESC
LIMIT 3;

# 11. Does people care about the price? Do some queries, comment why are you doing them and the results you retrieve. What is your conclusion?
SELECT price, rating_count_tot
FROM specific_name.applestore 
ORDER BY price, rating_count_tot DESC
LIMIT 20;
/* I would says it does influence, since the highest rated apps are for free*/