#![Ironhack logo](https://i.imgur.com/1QgrNNw.png)

# Lab | My first queries


#**Please, import the .csv database called *AppleStore.csv*. Use the *data* table to query the data about Apple Store Apps and answer the following questions: 
SELECT * FROM applestore;

/*
table info:
'rating_count_tot' refers to the total number of ratings all versions of the app considered 
'rating_count_ver' and "user_rating_ver" are associated to the current version of the app. 
cont_rating  is the content rating.
*/

/* QUESTION 1: */
#ANSWER QUERY
#**1. Which are the different genres?**
SELECT DISTINCT prime_genre FROM applestore;

/* QUESTION 2: */
#ANSWER QUERY
#**2. Which is the genre with more apps rated?** Games
SELECT prime_genre, SUM(rating_count_tot) AS Sum_rating_count_tot
FROM applestore
GROUP BY prime_genre
ORDER BY Sum_rating_count_tot DESC
LIMIT 1;


/* QUESTION 3: */
#ANSWER QUERY
#**3. Which is the genre with more apps?** Games
SELECT prime_genre, COUNT(ID) AS Num_of_Apps
FROM applestore
GROUP BY prime_genre
ORDER BY Num_of_Apps DESC
LIMIT 1;

/* QUESTION 4: */
#ANSWER QUERY
#**4. Which is the one with less?** Catalogs
SELECT prime_genre, COUNT(ID) AS Num_of_Apps
FROM applestore
GROUP BY prime_genre
ORDER BY Num_of_Apps ASC
LIMIT 1;

/* QUESTION 5: */
#ANSWER QUERY
#**5. Take the 10 apps most rated.**
SELECT track_name
FROM applestore
ORDER BY rating_count_tot DESC
LIMIT 10;

/* QUESTION 6: */
#ANSWER QUERY
#**6. Take the 10 apps best rated by users.**
SELECT track_name
FROM applestore
ORDER BY user_rating DESC
LIMIT 10;

/* QUESTION 7: */
#ANSWER QUERY
#**7. Take a look on the data you retrieved in the question 5. Give some insights.**
/*
table info:
'rating_count_tot' refers to the total number of ratings all versions of the app considered 
'rating_count_ver' and "user_rating_ver" are associated to the current version of the app. 
cont_rating  is the content rating.
*/
#**5. Take the 10 apps most rated.**
#Top 10 apps with more rates: 
SELECT track_name
FROM applestore
ORDER BY rating_count_tot DESC
LIMIT 10;

#Top 10 apps with better user rate for all versions: 
#This query is not very specific:
SELECT * #track_name
FROM applestore
ORDER BY user_rating DESC
LIMIT 10;
#The issue is that there are 490 rows with user rate = 5, so top 10 in query above is jsut a coincidence:
SELECT * #track_name
FROM applestore
where user_rating=5 #returns 490 rows

#Top 10 apps with better user rate for current version: 
SELECT * #track_name
FROM applestore
where user_rating_ver=5 #returns 961 rows

# 961 apps with user rate = 5 for current version, so top 10 order by user_rating_ver would be quite random:
SELECT track_name
FROM applestore
ORDER BY user_rating_ver DESC
LIMIT 10;

/* QUESTION 8: */
#ANSWER QUERY
#**8. Take a look on the data you retrieved in the question 6. Give some insights.**

#**6. Take the 10 apps best rated by users.**
SELECT track_name
FROM applestore
ORDER BY user_rating DESC
LIMIT 10;
#As I was seying in question above. this is not very usseful to know top ten rated apps. There are 490 apps 
#rated with 5 points, so ordering by that and showing only top 10 would be quite random
#This would be a bad practice to get best rated apps.

/* QUESTION 9: */
#ANSWER QUERY
#**9. Now compare the data from questions 5 and 6. What do you see?**
#If we retrieve both queries from query 5 and 6, we can see that they are not the same apps. 
#I considerar that querey 5 is a better aproach. As I said there are many apps rated with a 5 by users, so top 10 is pretty random.

#**5. Take the 10 apps most rated.**
SELECT * # track_name
FROM applestore
ORDER BY rating_count_tot DESC
LIMIT 10;

#**6. Take the 10 apps best rated by users.**
SELECT * # track_name
FROM applestore
ORDER BY user_rating DESC
LIMIT 10;

/* QUESTION 10: */
#ANSWER QUERY
#**10. How could you take the top 3 regarding the user ratings but also the number of votes?**
# this is a better aproach of how to display top 10 most rated apps by user:
SELECT * # track_name
FROM applestore
ORDER BY user_rating DESC, rating_count_tot  DESC
LIMIT 10;

/* QUESTION 11: */
#ANSWER QUERY
#**11. Does people care about the price?** Do some queries, comment why are you doing them and the results you retrieve. What is your conclusion?
#Are they all paid in USD? Yes, all is tracked in USD. So we can compare them.
SELECT DISTINCT currency
FROM applestore;

#lets take a look to the data first: from most expensive to cheapest:
#We can see that most expensive apps aren't rate with a 5 by user. Meaning users that paid more for the app are much more exigents with it:
SELECT track_name, price, rating_count_tot, user_rating,user_rating_ver,cont_rating
FROM applestore
ORDER BY price  DESC;

#We can see taht best ratted apps by user with biggest number of rates are those apps that are free o super cheap: 
SELECT track_name, price, rating_count_tot, user_rating,user_rating_ver,cont_rating
FROM applestore
ORDER BY user_rating DESC, rating_count_tot  DESC
LIMIT 10;

#most expensive reated apps by user: We can see that those apps don't have too many rating counts compared to ones above:
SELECT track_name, price, rating_count_tot, user_rating,user_rating_ver,cont_rating
FROM applestore
ORDER BY price DESC, user_rating DESC, rating_count_tot  DESC
LIMIT 10;

#Summary, as we can all image, people care about the app price.
#The more the user paid for the app, the more he/she expects. That is a reasin why most expensive have don't have a punctuation on 5 on users rating. 



