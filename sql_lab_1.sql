USE `lab-mysql-first-queries`;
SELECT * FROM `lab-mysql-first-queries`.applestore2;

/*1. Which are the different genres?*/
SELECT distinct prime_genre
 FROM `lab-mysql-first-queries`.applestore2;
 
/*2. Which is the genre with more apps rated?*/
SELECT prime_genre,max( rating_count_tot)
 FROM `lab-mysql-first-queries`.applestore2;
 
/*3. Which is the genre with more apps?*/
SELECT  prime_genre,count(track_name) 
 FROM `lab-mysql-first-queries`.applestore2
  GROUP BY  prime_genre
  ORDER BY count(track_name)  DESC 
 LIMIT 1;

 
SELECT distinct track_name,prime_genre,COUNT(track_name)
FROM `lab-mysql-first-queries`.applestore2
GROUP BY  prime_genre ;
  
/*4. Which is the one with less?*/
SELECT  prime_genre,count(track_name) 
 FROM `lab-mysql-first-queries`.applestore2
  GROUP BY  prime_genre
  ORDER BY count(track_name)  ASC 
 LIMIT 1;
 
 /*5. Take the 10 apps most rated.*/
SELECT track_name,rating_count_tot
 FROM `lab-mysql-first-queries`.applestore2
 ORDER BY rating_count_tot DESC 
 LIMIT 10;

/*6. Take the 10 apps best rated by users.*/
SELECT track_name,user_rating
 FROM `lab-mysql-first-queries`.applestore2
 ORDER BY user_rating DESC
 LIMIT 10;
/*7. Take a look on the data you retrieved in the question 5. Give some insights.*/
/*Facebook,Instagram,Clash of Clans,Temple Run,Pandora - Music & Radio,Pinterest,Bible,Candy Crush Saga,Spotify Music,Angry Birds.*/
/*8. Take a look on the data you retrieved in the question 6. Give some insights.*/
/*Highly rates apps by users are mostlt fitness,cafe..etc*/

/*9. Now compare the data from questions 5 and 6. What do you see?*/

/*10. How could you take the top 3 regarding the user ratings but also the number of votes?*/

 SELECT track_name,user_rating,rating_count_tot
 FROM `lab-mysql-first-queries`.applestore2
 ORDER BY user_rating DESC,rating_count_tot DESC
 LIMIT 3;
/*11. Does people care about the price? Do some queries, comment why are you doing them and the results you retrieve. What is your conclusion?
sELECT track_name,price,user_rating
 FROM `lab-mysql-first-queries`.applestore2
 ORDER BY price DESC
 LIMIT 10;
