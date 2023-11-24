/*

**1. Which are the different genres?**

**2. Which is the genre with more apps rated?**

**3. Which is the genre with more apps?**

**4. Which is the one with less?**

**5. Take the 10 apps most rated.**

**6. Take the 10 apps best rated by users.**

**7. Take a look on the data you retrieved in the question 5. Give some insights.**

**8. Take a look on the data you retrieved in the question 6. Give some insights.**

**9. Now compare the data from questions 5 and 6. What do you see?**

**10. How could you take the top 3 regarding the user ratings but also the number of votes?**

**11. Does people care about the price?** Do some queries, comment why are you doing them and the results you retrieve. What is your conclusion?
/*

USE FirstQueries;
/* Q1*/
SELECT DISTINCT prime_genre FROM applestore2;
/*Q2 : Games with 52630139 ratings*/
SELECT prime_genre, SUM(rating_count_tot) AS total_ratings
FROM applestore2
GROUP BY prime_genre
ORDER BY total_ratings DESC
LIMIT 1;
/*Q3* : Ganes 3808*/
SELECT prime_genre, COUNT(track_name) AS total_apps
FROM applestore2
GROUP BY prime_genre
ORDER BY total_apps DESC
LIMIT 1;
/*Q4* :Catalog 10*/
SELECT prime_genre, COUNT(track_name) AS total_apps
FROM applestore2
GROUP BY prime_genre
ORDER BY total_apps ASC
LIMIT 1;
/*Q5 :*/

SELECT *
FROM applestore2
ORDER BY rating_count_tot DESC
LIMIT 10;
/*Q6 :*/
SELECT *
FROM applestore2
ORDER BY user_rating DESC
LIMIT 10;
/* Q7 :From data retrieve form Q5, the Social Net working is highly popular and the most rated, but not neccessaily high rating*?
/*Q8 : From data from Q6, Education and Utilities genre although not poular but highly rated within viewers
Q9 : THere is some overlap between Q5 and Q6 data, 
Q10 : connect the 2 table in Q5 and Q6 to take the top 3 */



CREATE TABLE most_rated AS
SELECT *
FROM applestore2
ORDER BY rating_count_tot DESC
LIMIT 10;
  
CREATE TABLE best_rated AS
SELECT *
FROM applestore2
ORDER BY user_rating DESC
LIMIT 10;

CREATE TABLE the_best AS
SELECT *
FROM most_rated
INNER JOIN best_rated ON most_rated.app_id = best_rated.app_id
ORDER BY most_rating.user_rated DESC, Best_rated.rating_count_tot DESC
LIMIT 3;

/*Q10*/
SELECT
    m.*,
    (SELECT MAX(price) FROM applestore) AS max_price,
    (SELECT MIN(price) FROM applestore) AS min_price
FROM
    most_rated m
ORDER BY
    m.rating_count_tot DESC, m.user_rating DESC;