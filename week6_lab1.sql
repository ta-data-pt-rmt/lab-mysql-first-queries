/* 1. Which are the different genres? */
SELECT DISTINCT prime_genre
FROM applestore;
/* 2. Which is the genre with more apps rated? */
SELECT prime_genre, SUM(rating_count_tot)
FROM applestore
GROUP BY prime_genre
ORDER BY SUM(rating_count_tot) DESC;
/* 3. Which is the genre with more apps? */
SELECT prime_genre, COUNT(Column1) 
FROM applestore
GROUP BY prime_genre
ORDER BY COUNT(Column1) DESC;
/* 4. Which is the one with less? */
SELECT prime_genre, COUNT(Column1) 
FROM applestore
GROUP BY prime_genre
ORDER BY COUNT(Column1) ASC;
/* 5. Take the 10 apps most rated. */
SELECT track_name, rating_count_tot	
FROM applestore
ORDER BY rating_count_tot DESC
LIMIT 10; 
/* 6. Take the 10 apps best rated by users.? */
SELECT track_name, user_rating	
FROM applestore
ORDER BY user_rating DESC
LIMIT 10;
/* 7. Take a look on the data you retrieved in the question 5. Give some insights. */
/* Apps for social networking and games are quite popular /*
/* 8. Take a look on the data you retrieved in the question 6. Give some insights. */
/* Apps with best user rating are not necessary those that are most rated /*
/* 9. Now compare the data from questions 5 and 6. What do you see? */
/* Apps with best user rating are not necessary those that are most rated /*
/* 10. How could you take the top 3 regarding the user ratings but also the number of votes? */
SELECT track_name, rating_count_tot, user_rating
FROM applestore
ORDER BY rating_count_tot DESC, user_rating DESC
LIMIT 3;
/* Does people care about the price? Do some queries, comment why are you doing them and the results you retrieve. What is your conclusion? */
SELECT track_name, price, rating_count_tot, rating_count_tot/price
FROM applestore
ORDER BY rating_count_tot/price DESC