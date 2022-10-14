SELECT * FROM apple_store.applestore2;

USE apple_store;

/*1. Which are the different genres?*/
SELECT DISTINCT prime_genre
FROM applestore2;
/*Games,Productiviy,Weather,Shopping,Reference,Finance,Music,Utilities,Travel,Social Networking,Sports,Business,Health & Fitness,Entertainment,Photo & Video,Navigation,Education,Lifestyle,Food & Drink,News,Book,Medical,Catalogs*/

/*2. Which is the genre with more apps rated?*/
SELECT prime_genre, SUM(rating_count_tot)
FROM applestore2
GROUP BY prime_genre
ORDER BY rating_count_tot DESC;
/*Social Networking with 7.598.316 ratings*/

/*3. Which is the genre with more apps?*/
SELECT prime_genre, COUNT(track_name)
FROM applestore2
GROUP BY prime_genre
ORDER BY COUNT(track_name) DESC;
/*Games with 3.808 apps*/

/*4. Which is the one with less?*/
SELECT prime_genre, COUNT(track_name)
FROM applestore2
GROUP BY prime_genre
ORDER BY COUNT(track_name) ASC;
/*Catalogs with 10 apps*/

/*5. Take the 10 apps most rated.*/
SELECT track_name, rating_count_tot
FROM applestore2
ORDER BY rating_count_tot DESC
LIMIT 10;
/*Facebook, Instagram, Clash of Clans, Temple Run, Pandora, Pinterest, Bible, Candy Crush Saga, Spotify Mucis & Angry Birds*/

/*6. Take the 10 apps best rated by users.*/
SELECT track_name, user_rating
FROM applestore2
ORDER BY user_rating DESC 
LIMIT 10;

/*7. Take a look on the data you retrieved in the question 5. Give some insights.*/
/* These is a difference between the TOP3 and the rest, the TOP3 have double ratings than 4th on wards*/

/*8. Take a look on the data you retrieved in the question 6. Give some insights.*/
/*The is some missing characters in some names. I can see that there are more 5 rates but do not appear on the list. Must use some more info to find the real top rated apps */

/*9. Now compare the data from questions 5 and 6. What do you see?*/
/*They are not the same. We should find a balance between more rated and higher rates*/

/*10. How could you take the top 3 regarding the user ratings but also the number of votes?*/
SELECT track_name, user_rating, rating_count_tot
FROM applestore2
ORDER BY user_rating DESC, rating_count_tot DESC
LIMIT 10;

/*11. Does people care about the price?*/
SELECT price, AVG(rating_count_tot), AVG(user_rating), AVG(rating_count_tot)*AVG(user_rating) AS total_score
FROM applestore2
GROUP BY price
ORDER BY total_score DESC;
/*Yes, I think price is important, more expensive games are less played, but may of them have good ratings. This could mean that cheaper games are more attractive to players to try.*/
