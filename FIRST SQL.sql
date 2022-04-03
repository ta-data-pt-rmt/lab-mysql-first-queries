USE apple

SELECT *
FROM applestore2;

/* QUESTION 1: 1. Which are the different genres? Games
Productivity
Weather
Shopping
Reference
Finance
Music
Utilities
Travel
Social Networking
Sports
Business
Health & Fitness
Entertainment
Photo & Video
Navigation
Education
Lifestyle
Food & Drink
News
Book
Medical
Catalogs*/

SELECT DISTINCT prime_genre
FROM applestore2;

/*2. Which is the genre with more apps rated? Answer: Social Networking*/
SELECT prime_genre,rating_count_tot
FROM applestore2
ORDER BY rating_count_tot DESC;

/*3. Which is the genre with more apps? Answer: Games */
SELECT prime_genre,count(id)
FROM applestore2
GROUP BY prime_genre
ORDER BY count(id) DESC;

/*4. Which is the one with less? Answer: Catalogs*/
SELECT prime_genre,count(id)
FROM applestore2
GROUP BY prime_genre
ORDER BY count(id) ASC;

SELECT *
FROM applestore2;
/*5. Take the 10 apps most rated. Facebook
Instagram
Clash of Clans
Temple Run
Pandora - Music & Radio
Pinterest
Bible
Candy Crush Saga
Spotify Music
Angry Birds*/
SELECT track_name 
FROM applestore2 
ORDER BY rating_count_tot DESC
limit 10; 

/*6. Take the 10 apps best rated by users.Head Soccer
Plants vs. Zombies
Sniper 3D Assassin: Shoot to Kill Gun Game
Geometry Dash Lite
Infinity Blade
Geometry Dash
Domino's Pizza USA
CSR Racing 2
Pictoword: Fun 2 Pics Guess What's the Word Trivia
Plants vs. Zombies HD*/
SELECT track_name, user_rating, rating_count_tot
FROM applestore2
ORDER BY user_rating DESC, rating_count_tot DESC
LIMIT 10; 

/*7. Take a look on the data you retrieved in the question 5. Give some insights.*/
/*Answer: rating count helps to know the popularity of the app, */


/*8. Take a look on the data you retrieved in the question 6. Give some insights.*/
/*Answer: Games seems to drive the most of highest rates */ 

/*9. Now compare the data from questions 5 and 6. What do you see?*/
/*Answer: Highest count total  and Highest rating are not correlated */ 

/*10. How could you take the top 3 regarding the user ratings but also the number of votes? 
Head Soccer
Plants vs. Zombies
Sniper 3D Assassin: Shoot to Kill Gun Game*/
SELECT track_name, user_rating, rating_count_tot
FROM applestore2
ORDER BY user_rating DESC, rating_count_tot DESC
LIMIT 3;

/*11. Does people care about the price?*/ 
/*Do some queries, comment why are you doing them and the results you retrieve. What is your conclusion?*/
/* We can see that filtering by top price vs number of rating count, we can see that most expensive apps don´t drive much
interectation while running a new query with Ascending rating count shows most of intereraction are concentrated in the free ap */

SELECT price, rating_count_tot
FROM applestore2
GROUP BY price
ORDER BY price DESC;

SELECT price, rating_count_tot
FROM applestore2
GROUP BY price
ORDER BY price ASC;
 
 
