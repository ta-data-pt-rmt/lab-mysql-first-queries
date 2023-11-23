SELECT * FROM AppleStore.AppDetails;

#1. Which are the different genres?
SELECT DISTINCT prime_genre
FROM AppleStore.AppDetails;

#2. Which is the genre with more apps rated?
SELECT SUM(rating_count_tot) as total_ratings, prime_genre
FROM AppleStore.AppDetails
WHERE rating_count_tot >= 0
GROUP BY prime_genre
ORDER BY total_ratings DESC
LIMIT 1;

#3. Which is the genre with more apps?
SELECT COUNT(*), prime_genre
FROM AppleStore.AppDetails
GROUP BY prime_genre
ORDER BY COUNT(*) DESC
LIMIT 1;

#4. Which is the one with less?
SELECT COUNT(*), prime_genre
FROM AppleStore.AppDetails
GROUP BY prime_genre
ORDER BY COUNT(*) ASC
LIMIT 1;

#5. Take the 10 apps most rated.
SELECT * 
FROM AppleStore.AppDetails
ORDER BY AppleStore.AppDetails.rating_count_tot DESC
LIMIT 10;

#6. Take the 10 apps best rated by users.
SELECT * 
FROM AppleStore.AppDetails
ORDER BY AppleStore.AppDetails.user_rating DESC
LIMIT 10;

#7. Take a look on the data you retrieved in the question 5. Give some insights.
# Top two are social medias (FB, IG), the rest are games and music app.
#In general, top 10 app are about games, music and photo/videos sharing app

#8. Take a look on the data you retrieved in the question 6. Give some insights.
# Top 10 app rated by users are more utilitaries app (scan, flashlight, learn a langage app).
# There is also more than the half that are games.

#9. Now compare the data from questions 5 and 6. What do you see?
#The most rated app are big companies we all know, but the best rated app by users
#are more utilitaries and game not so well known. However, some app in the top 10 rated by users have only 3 reviews so
#it does not give enough overview if the app is very good or not.

#10. How could you take the top 3 regarding the user ratings but also the number of votes?
SELECT * 
FROM AppleStore.AppDetails
ORDER BY AppleStore.AppDetails.user_rating DESC, rating_count_tot DESC
LIMIT 3;

#11. Does people care about the price? Do some queries, comment why are you doing them and the results you retrieve. What is your conclusion?

#Yes it seems they care about the price. They tend to give better rate to expensives app than the free ones.
#avg 3.3 for user_rating for free app vs. 3.75 for user_rating for expensive apps
SELECT
    AVG(CASE WHEN price = 0 THEN user_rating END) AS avg_user_rating_free,
    AVG(CASE WHEN price > 45 THEN user_rating END) AS avg_user_rating_expensive
FROM AppleStore.AppDetails;

#Also the rating_count_tot is way more higher for free app than the most expensive ones
SELECT
    AVG(CASE WHEN price = 0 THEN rating_count_tot END) AS avg_rating_count_free_app,
    AVG(CASE WHEN price > 45 THEN rating_count_tot END) AS avg_rating_count_expensive_app
FROM AppleStore.AppDetails;


