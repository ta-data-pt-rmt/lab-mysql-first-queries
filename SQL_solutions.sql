USE first_queris_lab;

/* Exercise 1. Which are the different genres? */

SELECT * 
FROM applestore
LIMIT 10;

SELECT DISTINCT prime_genre
FROM first_queris_lab.applestore;


/* Exercise 2. Which is the genre with more apps rated? */

SELECT prime_genre, SUM(rating_count_tot) as total_ratings
FROM applestore
GROUP BY prime_genre
ORDER BY total_ratings DESC
LIMIT 1;


/* Exercise 3. Which is the genre with more apps? - Games */

SELECT prime_genre, COUNT(*) as total_apps
FROM applestore
GROUP BY prime_genre
ORDER BY total_apps DESC
LIMIT 1;


/*Exercise 4. Which is the one with less? - Catalogs */

SELECT prime_genre, COUNT(*) as total_apps
FROM applestore
GROUP BY prime_genre
ORDER BY total_apps ASC
LIMIT 1;


/*Exercise 5. Take the 10 apps most rated. */

SELECT track_name, rating_count_tot
FROM applestore
ORDER BY rating_count_tot DESC
LIMIT 10;


/* Exercise 6. Take the 10 apps best rated by users. */

SELECT track_name, user_rating
FROM applestore
ORDER BY user_rating DESC
LIMIT 10;


/* Exercise 7. Take a look on the data you retrieved in the question 5. Give some insights.*/
	/*ANSWER: The top 2 most rated apps are facebook and Instagram. This sugests that social media apps are the most popular in the apple store. 
	However, most of the apps in the list are games, showing that this genre is very popular. Most of the apps in the list are free, showing
	that users are more likely to download and rate free apps. */
 
 
 /* Exercise 8. Take a look on the data you retrieved in the question 6. Give some insights. */
	/* ANSWER: The best rated apps are very different from the most rated apps. This indicates that high quality apps are not the most popular. */


/* Exercise 9. Now compare the data from questions 5 and 6. What do you see? */
	/* ANSWER: Comparing the data from questions 5 and 6, we can see that there are some significant differences in the apps that appear on the 
    list of the 10 most rated apps and the 10 best rated apps by users. The genres of the apps in the two lists are quite different.
    It also suggests that high user ratings may not necessarily correlate with high download numbers (popularity) */


/* Exrecise 10. How could you take the top 3 regarding the user ratings but also the number of votes? */

SELECT track_name, rating_count_tot, user_rating
FROM applestore
ORDER BY user_rating DESC, rating_count_tot DESC
LIMIT 3;


/* Exercise 11. Does people care about the price? */

/* Check the price for the 10 most rated apps*/
SELECT track_name, rating_count_tot, price
FROM applestore
ORDER BY rating_count_tot DESC
LIMIT 10;
/* From this query we can see that the top 10 most rated apps are all free. */


/* Check the price for the 10 best rated apps by users */
SELECT track_name, user_rating, price
FROM applestore
ORDER BY user_rating DESC
LIMIT 10;
/* From this query we can see that some of the top 10 best rated apps by users are free, but most are payed. */

/*CONCLUSION: As seen above, the price of the apps in the two lists is different. All of the most rated apps are free, 
whereas a number of the best rated apps have a price tag. This suggests that users are willing to pay for high-quality apps 
that meet their needs, and that price may not be the most important factor in determining the success of an app. */

