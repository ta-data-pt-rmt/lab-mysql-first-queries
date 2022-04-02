USE applestore2

SELECT *
FROM applestore2
LIMIT 100
## 1. Which are the different genres? 

SELECT DISTINCT prime_genre
FROM applestore2;

## Response:
Games
Productivity
Weather
Shopping
Reference
Finance
Music
Utilities
Travel
Social Networking
Sports
Business
Health & Fitness
Entertainment
Photo & Video
Navigation
Education
Lifestyle
Food & Drink
News
Book
Medical
Catalogs

## 2. Which is the genre with more apps rated?

SELECT MAX(rating_count_tot), prime_genre
FROM applestore2;

## Response:
Games

## 3. Which is the genre with more apps?

SELECT prime_genre, COUNT(track_name) AS count_apps
FROM applestore2
GROUP BY prime_genre
ORDER BY count_apps DESC

## Response: Games

## 4. Which is the one with less?

SELECT prime_genre, COUNT(track_name) AS count_apps
FROM applestore2
GROUP BY prime_genre
ORDER BY count_apps ASC

## Response: Catalogs

## 5. Take the 10 apps most rated

SELECT track_name AS apps, rating_count_tot
FROM applestore2
ORDER BY rating_count_tot DESC
LIMIT 10

## Response:
Facebook
Instagram
Clash of Clans
Temple Run
Pandora - Music & Radio
Pinterest
Bible
Candy Crush Saga
Spotify Music
Angry Birds

## 6. Take the 10 apps best rated by users.

SELECT COUNT(user_rating), user_rating
FROM applestore2
GROUP BY user_rating
ORDER BY user_rating DESC

## Response: there are more than 10 apps (490 to be exact) rated as 5, which is the highest score they can get

## 7. Take a look on the data you retrieved in the question 5. Give some insights.

SELECT track_name AS apps, rating_count_tot
FROM applestore2
ORDER BY rating_count_tot DESC
LIMIT 10

## Response: The top most rated apps are either social media, games or music sevices, plus the Bible

## 8. Take a look on the data you retrieved in the question 6. Give some insights.

SELECT COUNT(user_rating), user_rating
FROM applestore2
GROUP BY user_rating
ORDER BY user_rating DESC

## Response: there majority of the opinions are in the good range of the rating (between 4 and 5) with 4.5 being the most chosen option.

## 9. Now compare the data from questions 5 and 6. What do you see?

## Response:  the data is either not comparable or I did something wrong for questions 5 & 6

## 10. How could you take the top 3 regarding the user ratings but also the number of votes?

SELECT track_name AS apps, rating_count_tot, user_rating
FROM applestore2
ORDER BY rating_count_tot DESC, user_rating DESC
LIMIT 3

## Response:
Facebook	2974676	3.5
Instagram	2161558	4.5
Clash of Clans	2130805	4.5

## 11. Does people care about the price?
SELECT COUNT(track_name), rating_count_tot, price
FROM applestore2
GROUP BY price
ORDER BY rating_count_tot DESC, price ASC

## insight #1 - the majority of apps are free; these free apps have the highest number of ratings

SELECT rating_count_tot / (COUNT(track_name)), price
FROM applestore2
GROUP BY price
ORDER BY (rating_count_tot / (COUNT(track_name))) DESC, price ASC

## insight #2 - the ratio of rating_count_tot to number of apps at a given price suggest that most paying users are more opinionated than the ones that use a free app

SELECT DISTINCT cont_rating
FROM applestore2

## insight #3 - I thought of exploring the influence of the price in the content rating; the assumption was that users paying a higher price would have higher expectactions in terms of content; the cont_rating values however seems very random
## and I can't interpret them
