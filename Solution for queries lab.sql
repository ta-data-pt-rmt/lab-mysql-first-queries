USE first_queries_lab;

SELECT *
FROM first_queries_lab.applestore2;


/* QUESTION 1 :Which are the different genres?*/
SELECT DISTINCT prime_genre
FROM applestore2


/*QUESTION 2: Which is the genre with more apps rated?*/
SELECT DISTINCT track_name as app, prime_genre, rating_count_tot
FROM applestore2
ORDER BY rating_count_tot DESC; 
/*don't really understand the question*/


/*QUESTION 3: Which is the genre with more apps?*/
SELECT COUNT(track_name) as app_count, prime_genre
FROM applestore2
GROUP BY prime_genre 
ORDER BY app_count DESC
LIMIT 1; 


/*QUESTION 4: Which is the one with less?*/
SELECT COUNT(track_name) as app_count, prime_genre
FROM applestore2
GROUP BY prime_genre 
ORDER BY app_count ASC
LIMIT 1; 

/*QUESTION 5: Take the 10 apps most rated.*/
SELECT DISTINCT track_name AS app , prime_genre, rating_count_tot
FROM applestore2
ORDER BY rating_count_tot DESC
LIMIT 10;

/*QUESTION 6:  Take the 10 apps best rated by users.*/
SELECT  track_name as app, prime_genre, user_rating
FROM applestore2
ORDER BY user_rating DESC
LIMIT 10; 

 /* QUESTION 7: Take a look on the data you retrieved in the question 5. Give some insights.*/
 /* 1. we observed only 5 genres are falling in highest top 10 rating of apps.*/  
 /* 2. people tend to prioritize social networking then photos and videos sharing then playing games and then listening or streaming music. 
 /* 3. genre 'Reference' might be an outlier.*/
 
 /* QUESTIONG 8: Take a look on the data you retrieved in the question 6. Give some insights.*/
 /* 1. since with just app and user rating there wasn't enough clarity so we chose to add prime_genre column as well.*/ 
 /* 2. it shows under top 10 apps by user rating are from 3 genres i.e. Productivity, Games and Photos & Videos.*/ 
 /* 3. 'Games' is the most popular genre with 8 times repetation. */ 
 /* 4. Top 10 user rating falls under 5 star rating only.*/
 
/* QUESTIONG 9: Take a look on the data you retrieved in the question 6. Give some insights.*/*/
 /*1. as per overall rating there are 5 popular genres which are Social Networking, Photos & Videos, Games, Music and Reference, wherein as per user rating 3 genres are popular.*/
 /*2. 'Games' and 'Photos & Videos' genre is comon in both data analysis.*/ 
 /*3. 'Games' has repetation in overall rating and user rating analysis.*/  


/* QUESTION 10: How could you take the top 3 regarding the user ratings but also the number of votes?*/
 
 
 /* QUESTION 11: Does people care about the price? Do some queries, comment why are you doing them and the results you retrieve. What is your conclusion?*/
/* ANSWER: Yes, people do care about the prices as per the user_rating. if an app costs more than 30$ its impossible to get a 5 star rating, if the price increases over 30$ the rating descreases to 4.5,
and if price further increases over 100$ then the max user_rating drops to 4. so there is negative corelation between price and user_Rating.  */
 
 SELECT DISTINCT track_name as app, prime_genre, price, user_rating
 FROM applestore2
 WHERE applestore2.user_rating in (4)
 ORDER BY price DESC


 
 