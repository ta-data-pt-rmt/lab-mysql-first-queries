/* 1 QUESTION */
SELECT DISTINCT PRIME_GENRE FROM APPLESTORE;

/* 2 QUESTION */
SELECT PRIME_GENRE AS PRIME_GENRE, COUNT(RATING_COUNT_VER) AS COUNT_APPS_RATED
FROM APPLESTORE 
GROUP BY PRIME_GENRE
ORDER BY COUNT_APPS_RATED DESC;

/* 3 QUESTION */
SELECT PRIME_GENRE AS PRIME_GENRE, COUNT(PRIME_GENRE) AS COUNT
FROM APPLESTORE 
GROUP BY PRIME_GENRE
ORDER BY COUNT DESC;

/* 4 QUESTION */
SELECT PRIME_GENRE AS PRIME_GENRE, COUNT(PRIME_GENRE) AS COUNT
FROM APPLESTORE 
GROUP BY PRIME_GENRE
ORDER BY COUNT ASC;

/* 5 QUESTION */
SELECT TRACK_NAME, RATING_COUNT_TOT 
FROM APPLESTORE 
ORDER BY RATING_COUNT_TOT DESC 
LIMIT 10;

/* 6 QUESTION */
SELECT TRACK_NAME, RATING_COUNT_TOT, USER_RATING 
FROM APPLESTORE
ORDER BY USER_RATING DESC
LIMIT 10;

/* 7 QUESTION */
/* We can see apps with the highest amount of ratings, We can see that social media apps are dominating, taking the first two places. We can see also a strong presence of music apps and games.
Interesting is the placing of the Bible also. But the biggest area is as expected entertainment.*/

/* 8 QUESTION */
/* The data are completely messy, we can see that some of he names are not correct. I filtered also the counting of the ratings, because we can see in some cases here is only one vote. User_rating
isnt the best indicator when it comes to the most favourite app, would recommend some kind of algorythm that also takes into notice the number of the ratings not the rating only by itself. */

/* 9 QUESTION */
/* As i said previously, the data from question 5 are much cleaner which is the cause of more votes. Fewer votes means that even some apps that are not proven can make it through the filtering. */

/* 10 QUESTION */
SELECT TRACK_NAME, RATING_COUNT_TOT, USER_RATING /* First we choose which columns we want to see */
FROM APPLESTORE
ORDER BY USER_RATING DESC, RATING_COUNT_TOT DESC /* First order by user_rating, then order by the number of votes, both desc from high to low. */
LIMIT 3 /* First 3 */;

/* 11 QUESTION */
SELECT TRACK_NAME, RATING_COUNT_TOT, USER_RATING, PRICE /* the best indicator i think is the rating_count_tot, that really shows how many people are interested in the app */
FROM APPLESTORE
ORDER BY RATING_COUNT_TOT DESC 
LIMIT 60; /* lets see few rows. */

/* just by simply looking at the data we can clearly see that people care about the price. Once in a while there is an app that has to be paid for, but that is more an exception. 
People enjoy and prefer apps that are for free */