USE myfirstsql;
SELECT * FROM applestore2 LIMIT 10;
-- 1. Which are the different genres?
SELECT DISTINCT prime_genre FROM applestore2;
-- 2. Which is the genre with more apps rated?
SELECT SUM(rating_count_tot), prime_genre FROM applestore2 GROUP BY prime_genre ORDER BY SUM(rating_count_tot) DESC;
-- 3. Which is the genre with more apps?
SELECT COUNT(*), prime_genre FROM applestore2 GROUP bY prime_genre ORDER BY COUNT(*) DESC;
-- 4. Which is the one with less?
SELECT COUNT(*), prime_genre FROM applestore2 GROUP bY prime_genre ORDER BY COUNT(*) ASC;
-- 5. Take the 10 apps most rated.
SELECT track_name, rating_count_tot FROM applestore2 ORDER BY rating_count_tot DESC LIMIT 10;
-- 6. Take the 10 apps best rated by users.
SELECT track_name, user_rating FROM applestore2 ORDER BY user_rating DESC LIMIT 10;
-- 7. Take a look on the data you retrieved in the question 5. Give some insights.
SELECT track_name, rating_count_tot, prime_genre FROM applestore2 ORDER BY rating_count_tot DESC LIMIT 10;
-- The most rated apps are most distributed in the genre of Games. Music and social networking also play a very important role.alter
-- Besides, they are also very very known and have existed for a long time
-- 8. Take a look on the data you retrieved in the question 6. Give some insights.
SELECT track_name, user_rating, rating_count_tot FROM applestore2 ORDER BY user_rating DESC LIMIT 10;
-- The best rated apps are very likely to be the ones less popular which means less rated
-- 9. Now compare the data from questions 5 and 6. What do you see?
-- To understand if the app is a highly rated popular app, the two queries can be combined
-- 10. How could you take the top 3 regarding the user ratings but also the number of votes?
SELECT track_name, user_rating, rating_count_tot FROM applestore2 ORDER BY user_rating DESC, rating_count_tot DESC LIMIT 3;
-- 11. Does people care about the price? Do some queries, comment why are you doing them and the results you retrieve. What is your conclusion?
SELECT track_name, price, rating_count_tot FROM applestore2 ORDER BY rating_count_tot DESC LIMIT 50;
-- The majority of the top 50 rated apps are for free
SELECT track_name, price, rating_count_tot, user_rating FROM applestore2 ORDER BY user_rating DESC, rating_count_tot DESC LIMIT 50;
-- The top 50 highly rated apps with decent amount of audience also do not tend to charge
SELECT track_name, price, rating_count_tot, user_rating FROM applestore2 ORDER BY price DESC, rating_count_tot DESC LIMIT 50;
-- Compared to the results generated from the last two queries, it is definitely ture that top 50 pricy apps do not get voted a lot
-- Conclusion, people are not prone to pay for apps
