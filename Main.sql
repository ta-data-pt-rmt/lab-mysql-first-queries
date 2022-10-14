SELECT * FROM apple_store.applestore2;

/*1. Which are the different genres?*/
SELECT DISTINCT prime_genre
FROM applestore2;


/*2. Which is the genre with more apps rated?*/

SELECT prime_genre, COUNT(user_rating) AS num_app_rated
FROM applestore2
GROUP BY prime_genre
ORDER BY num_app_rated DESC;


/*3. Which is the genre with more apps?*/

SELECT prime_genre, COUNT(track_name) AS num_app
FROM applestore2
GROUP BY prime_genre
ORDER BY num_app DESC;


/*4. Which is the one with less?*/

SELECT prime_genre, COUNT(track_name) AS num_app
FROM applestore2
GROUP BY prime_genre
ORDER BY num_app ASC;

/*5. Take the 10 apps most rated.*/

SELECT track_name,rating_count_tot,user_rating
FROM applestore2
ORDER BY rating_count_tot desc limit 10;


/*6. Take the 10 apps best rated by users.*/

SELECT track_name,user_rating,rating_count_tot
FROM applestore2
ORDER BY user_rating desc limit 10;


/*7. Take a look on the data you retrieved in the question 5. Give some insights.

All the applications that appear are the best known applications in the world, 
so the data we are getting makes sense, they are the highest rated because they are the ones that have the most people.*/


/*8. Take a look on the data you retrieved in the question 6. Give some insights.

These applications are not known, or there are even errors, showing the total number of times scored, 
we realise that they are applications that have been scored few times, so they may have the maximum score, 
but it is not representative.*/


/*9. Now compare the data from questions 5 and 6. What do you see?

You can see how the most voted applications are not the ones with the highest scores and vice versa, 
so having the highest scores in applications that are used by a large number of people, 
is very rare because due to the parity of the votes makes the values are very different.*/



/*10. How could you take the top 3 regarding the user ratings but also the number of votes?

The first thing would be to get a good positioning of the app, 
to get the maximum number of possible downloads, to get good scores we have no choice but to develop a good app,
 so that this is well valued by customers, periodic surveys of punctuation as they are improving the same, could improve the rating.*/


/*11. Does people care about the price?** Do some queries, comment why are you doing them and the results you retrieve. What is your conclusion?*/

SELECT track_name,price,rating_count_tot,user_rating,prime_genre
FROM applestore2
ORDER BY price desc limit 20;

/* In this first query you can see how the most expensive apps are not the most demanded, 
they tend to have average scores, and they are not for mass consumption, 
they tend to be educational, so this type of app is only downloaded by people who have a specific need.*/


SELECT track_name,price,rating_count_tot,user_rating,prime_genre
FROM applestore2
WHERE price < 5 AND price >0
ORDER BY rating_count_tot DESC;


/* Between prices of 1 to 5 dollars, downloads multiply exponentially, 
at these prices there are already many more people willing to pay for an application, 
although they are applications dedicated to video games, so making a video game app at these prices can be very lucrative.*/

SELECT price,rating_count_tot,user_rating,prime_genre
FROM applestore2
WHERE price < 5 AND price >0
GROUP BY prime_genre;

/* Here we can see the price distribution in the price range*/

SELECT price,rating_count_tot,user_rating,prime_genre
FROM applestore2
WHERE price = 0;


/* The free downloads are the ones that, as it is normal,
 have more downloads, but taking out the top 10, the number of scores is quite equal 
 with the app priced between 1 and 5 dollars, so we can think that people are very reluctant 
 to pay large amounts of money for app, but in the range of 1 to 5 dollars, if the app is good, people are willing to have it.*/




































