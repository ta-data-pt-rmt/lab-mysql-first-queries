SELECT * FROM applestore.applestore2;

/* QUESTION 1*/
SELECT DISTINCT prime_genre 
FROM applestore.applestore2;

/* QUESTION 2*/
SELECT DISTINCT prime_genre, rating_count_tot 
FROM applestore.applestore2
ORDER BY rating_count_tot DESC;
/* Answer: Social Networking with 2974776 ratings*/

/* QUESTION 3*/
SELECT prime_genre, COUNT(track_name) AS num_apps
FROM applestore.applestore2
GROUP BY prime_genre
HAVING COUNT(track_name) > 1
ORDER BY num_apps DESC;
/* Answer: Games with 3808 apps*/

/* QUESTION 4*/
SELECT prime_genre, COUNT(track_name) AS num_apps
FROM applestore.applestore2
GROUP BY prime_genre
HAVING COUNT(track_name) > 1
ORDER BY num_apps ASC;
/* Answer: Catalogs with 10 apps*/

/* QUESTION 5*/
SELECT track_name, rating_count_tot
FROM applestore.applestore2
ORDER BY rating_count_tot DESC
LIMIT 10;
/* Answer: Facebook, Instagram, Clash of Clans, Temple Run, Pandora, Pinterest, Bible, Candy Crush, Spotify and Angry Birds.*/

/* QUESTION 6*/
SELECT track_name AS app_name , user_rating
FROM applestore.applestore2
ORDER BY user_rating DESC
LIMIT 10;

/* Answer:
1- LINE Moments - Capture Your Fun Moments
2- Cafe Story - Play Cooking & Farming Game
3- Grumpy Cat's Worst Game Ever
4- Fitness Sync for Fitbit to Apple Health
5- Stickman Base Jumper 2
6- Dungeons of Chaos UNITY EDITION
7- DELISH KITCHEN - ????????????????????????????????????
8- ????????????IV:????????????
9- LINE RUSH !
10- Able Black*/

/*Question 7*/
/* The 10 most rated apps are probably the most downloaded and used apps, but also the ones that people wanted to complain about bugs. These are the most popular apps, not necessarily the best ones.*/

/*Question 8*/
/* These can not be the most popular apps, but they are probably the ones that people like the most.*/

/*Question 9*/
/* None of the most popular apps are the ones that people like the most*/ /*life lesson*/

/*Question 10*/
SELECT track_name AS app_name, user_rating, rating_count_tot
FROM applestore.applestore2
ORDER BY user_rating DESC, rating_count_tot DESC
LIMIT 3;
/* Answer:
Head Soccer
Plants vs. Zombies
Sniper 3D Assassin: Shoot to Kill Gun Game	
*/

/* After seen all columns, i´ll select yhe ones that I think its the more relevant ones*/
SELECT track_name AS app_name, price, user_rating, rating_count_tot
FROM applestore.applestore2
ORDER BY price DESC, user_rating DESC, rating_count_tot DESC

/* now checking without ordering by price*/
SELECT track_name AS app_name, price, user_rating, rating_count_tot
FROM applestore.applestore2
ORDER BY price, user_rating DESC, rating_count_tot DESC

/*Checking the apps where the price is bigger then 0*/
/* After seen all columns, i´ll select yhe ones that I think its the more relevant ones*/
SELECT track_name AS app_name, price, user_rating, rating_count_tot
FROM applestore.applestore2
WHERE price > 0 
ORDER BY price ASC, user_rating DESC, rating_count_tot DESC

/*Checking the apps where the price is bigger then 0*/
/* After seen all columns, i´ll select yhe ones that I think its the more relevant ones*/
SELECT track_name AS app_name, price, user_rating, rating_count_tot
FROM applestore.applestore2
WHERE price > 9
ORDER BY price ASC, user_rating DESC, rating_count_tot DESC



/* I´m not able to tell regarding the purchase precisely since we don't have the numbers of Downloads or active users
but considering that the users that actually rated had to download and use the app at least once, 
we can see from the app Head Soccer, that has 481564 number of ratings, with a 5 star rating.and it
is free, comparing to the best rated (5*) app that costs 0,99 (the minimun cost) it drops 11.42% to 426463 ratings, 
and comparing to the first 5* rating app that costs 1.99 it drops 37% to 266440 ratings, and finally comparing to
the most expensive app (299,99), it hs only 41 ratings, 99.98% drop, so yes, we can see a correlation
between price and usage, and the ones that are the most expensive, are not the most likes ones since they 
dont have 5*, the more pricey, more demanding for quality will be the user. 