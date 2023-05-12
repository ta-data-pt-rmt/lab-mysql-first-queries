USE first_queries_lab;

SELECT *
FROM applestore; 



SELECT DISTINCT prime_genre
FROM applestore;
/* QUESTION 1: */ -- The different types of values in the 'prime_genre' column are:
-- 'Games', 'Productivity', 'Weather', 'Shopping', 'Reference', 'Finance', 'Music', 'Utilities',
-- 'Travel', 'Social Networking', 'Sports', 'Business', 'Health & Fitness', 'Entertainment',
-- 'Photo & Video', 'Navigation', 'Education', 'Lifestyle', 'Food & Drink', 'News', 'Book', 'Medical',
-- 'Catalogs'


SELECT prime_genre, SUM(rating_count_tot) AS total_ratings
FROM applestore
GROUP BY prime_genre
ORDER BY total_ratings DESC
LIMIT 1;
/* QUESTION 2: */ -- The genre with more apps rated is: 'Games', '52630139'


SELECT prime_genre, COUNT(*) AS num_apps
FROM applestore
GROUP BY prime_genre
ORDER BY num_apps DESC
LIMIT 1;
/* QUESTION 3: */ -- The genre with more apps rated is: 'Games', '3808'


SELECT prime_genre, COUNT(*) AS num_apps
FROM applestore
GROUP BY prime_genre
ORDER BY num_apps ASC
LIMIT 1;
/* QUESTION 4: */ -- The genre with less apps is: 'Catalogs', '10'


SELECT track_name, SUM(rating_count_tot) AS total_ratings
FROM applestore
GROUP BY track_name
ORDER BY total_ratings DESC
LIMIT 10;
/* QUESTION 5: */ -- The 10 apps most rated are: */
-- 'Facebook'
-- 'Instagram'
-- 'Clash of Clans'
-- 'Temple Run'
-- 'Pandora - Music & Radio'
-- 'Pinterest'
-- 'Bible'
-- 'Candy Crush Saga'
-- 'Spotify Music'
-- 'Angry Birds'


SELECT track_name, AVG(user_rating) AS Best_Ratings
FROM applestore
GROUP BY track_name
ORDER BY Best_Ratings DESC
LIMIT 10;
/* QUESTION 6: */ -- the 10 apps best rated by users are: */
-- 'Escape the Sweet Shop Series'
-- 'Laurie Hernandez the Human Emoji'
-- 'Room Escape Game - Santa\'s Room'
-- 'CTFxCmoji'
-- '4x4 Dirt Track Trials Forest Driving Parking Sim'
-- 'Blink Health'
-- 'VPN Go - Safe Fast & Stable VPN Proxy'
-- 'Stickman Base Jumper 2'
-- 'Honest App: Shop baby & diaper products'
-- 'DELISH KITCHEN - ????????????????????????????????????'


/* QUESTION 7: */ -- the data suggests that social media, (...) 
-- gaming and music apps are the most popular among users and are (...)
-- likely to continue to be in high demand (the exception in the top 10 is the Bible, a religious app).


/* QUESTION 8: */  -- the data provides a list of the 10 best-rated apps, (...)
-- which includes a mix of newer and niche apps such as escape room games, emoji apps, health apps, VPNs, and shopping apps. 
-- These apps seem to cater to specific needs and interests of users.


/* QUESTION 9: */  -- Overall, the two lists offer different insights into user preferences (...)
 -- and trends in the mobile app industry. While the most rated apps are likely to have a broader appeal (...)
 -- and more significant user base, the best-rated apps may provide more specific and tailored experiences for users.
 

SELECT track_name, user_rating, rating_count_tot
FROM applestore
ORDER BY user_rating DESC, rating_count_tot DESC
LIMIT 3;
/* QUESTION 10: */ -- the top 3 apps regarding the user ratings but also the number of votes are:
-- 'Head Soccer'
-- 'Plants vs. Zombies'
-- 'Sniper 3D Assassin: Shoot to Kill Gun Game'


SELECT AVG(rating_count_tot) AS avg_rating_count, AVG(user_rating) AS avg_user_rating
FROM applestore
WHERE price > 0;

SELECT AVG(rating_count_tot) AS avg_rating_count, AVG(user_rating) AS avg_user_rating
FROM applestore
WHERE price = 0;

/* QUESTION 11: */ -- The average rating count for apps that are free is 19,751, while the average rating count for apps with a price greater than 0 is 4,063. This suggests that apps that are free receive significantly more ratings on average than those with a price.
-- In terms of user rating, the average user rating for apps that are free is 3.38, while the average user rating for apps with a price greater than 0 is 3.73. This suggests that users tend to rate free apps slightly lower on average than paid apps.



