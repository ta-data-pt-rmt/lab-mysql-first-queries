SELECT * FROM ironhack.applestore2;
/* QUESTION 1: Which are the different genres? */ 


/* QUESTION 2: Which is the genre with more apps rated? */ 
select prime_genre, rating_count_tot from ironhack.applestore2
order by rating_count_tot DESC;
/* QUESTION 3: Which is the genre with more apps? */ 
select count(track_name), prime_genre from ironhack.applestore2
group by prime_genre;
/* QUESTION 4: 4. Which is the one with less? */ 
select count(track_name) as app, prime_genre from ironhack.applestore2
group by prime_genre
order by app ASC;
/* QUESTION 5. Take the 10 apps most rated. */ 
select * from ironhack.applestore2
order by rating_count_tot DESC
LIMIT 10;
/* QUESTION 6. Take the 10 apps best rated by users. */ 
select * from ironhack.applestore2
order by user_rating_ver DESC
LIMIT 10;
/* QUESTION 7. Take a look on the data you retrieved in the question 5. Give some insights.*/ 
/* The most app rated is not the best rated by users */
/* 8. Take a look on the data you retrieved in the question 6. Give some insights.*/ 
/* The apps best rated are major games, some are payed*/
/* QUESTION 9. Now compare the data from questions 5 and 6. What do you see?*/ 
/* 10. How could you take the top 3 regarding the user ratings but also the number of votes?*/ 
SELECT * from ironhack.applestore2
order by rating_count_tot DESC, user_rating DESC
limit 3;
/* 11. Does people care about the price? Do some queries, comment why are you doing them and the results you retrieve. What is your conclusion?*/ 
SELECT track_name, price, rating_count_tot, user_rating, prime_genre from ironhack.applestore2
order by rating_count_tot DESC, user_rating DESC
;
#the most rated apps are free but at the same time they are not the best rated
SELECT track_name, price, rating_count_tot, user_rating, prime_genre from ironhack.applestore2
order by user_rating DESC, rating_count_tot DESC
;
#if we invert the order, we can see that the better rated apps are free in the majority, and games
SELECT track_name, price, rating_count_tot, user_rating, prime_genre from ironhack.applestore2
order by price DESC
;
#the most expensive apps are low rated
select avg(price), avg(rating_count_tot), avg(user_rating), prime_genre from ironhack.applestore2
group by prime_genre
order by avg(price) DESC
#the highest average user rating, has average price of $4.33, but the average rating is low in comparison with other apps
#Basically will depend of the app genre. Specific genres the users will buy apps, otherwise the users will go for free os cheap apps.