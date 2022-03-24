select *
from AppleStore
limit 5; 

-- QUESTION 1: Which are the different genres?
SELECT DISTINCT prime_genre 
FROM AppleStore; 
-- QUESTION 2: Which is the genre with more apps rated?
SELECT prime_genre, SUM(rating_count_tot) as apps_rated
FROM AppleStore
GROUP BY prime_genre
ORDER BY apps_rated DESC;
-- QUESTION 3: Which is the genre with more apps?
SELECT prime_genre, COUNT(track_name) as apps
FROM AppleStore
GROUP BY prime_genre
ORDER BY apps DESC 
LIMIT 1; 

-- QUESTION 4:  Which is the one with less?
SELECT prime_genre, COUNT(track_name) as apps 
FROM AppleStore
GROUP BY prime_genre
ORDER BY apps
LIMIT 1; 

-- QUESTION 5: Take the 10 apps most rated.
SELECT track_name, SUM(rating_count_tot) as rated 
FROM AppleStore
GROUP BY track_name 
ORDER BY rated DESC
LIMIT 10;   

-- QUESTION 6: Take the 10 apps best rated by users.
SELECT track_name, AVG(user_rating) as user_rating 
FROM AppleStore
GROUP BY track_name 
ORDER BY user_rating DESC
LIMIT 10;  

SELECT track_name, user_rating -- same without grouping by app
FROM AppleStore
ORDER BY user_rating DESC
LIMIT 10;  

-- QUESTION 7: Take a look on the data you retrieved in the question 5. Give some insights.
-- The top 10 apps rated are mainly Social Networking & Gaming apps: Facebook, Instagram, Clash of Clans, Temple Run, Pandora - Music & Radio, Pinterest, Bible, Candy Crush Saga, Spotify, Angry Birds

-- QUESTION 8:  Take a look on the data you retrieved in the question 6. Give some insights.
-- The top 10 apps by user ratings are mostly Gaming apps: Stickman Base Jumper 2, Love You To Bits, Urlaubspiraten, X-Tactics, 我叫MT3-回合制魔幻世界 大型公会副本开荒, Runtastic Push Ups PRO: Workouts, Trainer, Counter, 我的密码-极简账号备忘录，安全记录管家, Balvinmoji, ねこみっけ - おもしろい人気無料ゲーム, Bar Oasis 2 Aftertaste 01	

-- QUESTION 9: Now compare the data from questions 5 and 6. What do you see?
-- The ones with more ratings aren't neccesarily the ones with best average rating of users. Games genre is the most crowded for all the metrics. Social Networking is big driver of volume on rating counts.

-- QUESTION 10: How could you take the top 3 regarding the user ratings but also the number of votes?

SELECT track_name, user_rating, rating_count_tot
FROM AppleStore 
ORDER BY user_rating DESC, rating_count_tot DESC
limit 3;

-- QUESTION 11: Does people care about the price? Do some queries, comment why are you doing them and the results you retrieve. What is your conclusion?

SELECT prime_genre, track_name, sum(price) as price, sum(rating_count_tot) as rated, avg(user_rating) as user_rating 
FROM AppleStore 
GROUP BY prime_genre, track_name 
ORDER BY rated desc

SELECT prime_genre, track_name, sum(price) as price, sum(rating_count_tot) as rated, avg(user_rating) as user_rating 
FROM AppleStore 
GROUP BY prime_genre, track_name 
ORDER BY user_rating  desc

SELECT prime_genre, track_name, sum(price) as price, sum(rating_count_tot) as rated, avg(user_rating) as user_rating 
FROM AppleStore 
GROUP BY prime_genre, track_name 
ORDER BY price  desc

SELECT price, ROUND(avg(rating_count_tot),2) as avg_rating
FROM applestore
GROUP BY price
ORDER BY price asc;

--The most rated apps are FREE, but the better rated apps are not neccesarily the most rated. 
--While the most expensive apps are not neccesarily the most rated nor even the better rating apps, the free apps are almost 3x times more downloaded than the 0.99 apps
-- Based on the previous queries, the more users an app has, the more ratings it might get, usually these are free apps. So users might considering this as a filter for deciding whether to download an app or not. 


