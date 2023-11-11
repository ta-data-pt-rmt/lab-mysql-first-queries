USE Lab1;

SELECT * 
FROM applestore2
LIMIT 20;

-- 1. Which are the different genres?

SELECT DISTINCT prime_genre
FROM applestore2;

-- 2. Which is the genre with more apps rated?

SELECT prime_genre, SUM(rating_count_tot)
FROM applestore2
GROUP BY prime_genre
ORDER by SUM(rating_count_tot) DESC;

# Games with 52630139


-- 3. Which is the genre with more apps?
SELECT prime_genre, COUNT(track_name)
FROM applestore2
GROUP BY prime_genre
ORDER BY COUNT(track_name) DESC;

#Games with 3808

-- 4. Which is the one with less?

SELECT prime_genre, COUNT(track_name)
FROM applestore2
GROUP BY prime_genre
ORDER BY COUNT(track_name) ASC;

#Catalogs with 10

-- 5. Take the 10 apps most rated.
SELECT id, track_name, user_rating, rating_count_tot
FROM applestore2
ORDER BY rating_count_tot DESC
LIMIT 10;

#Facebook, Instagram, Clash of Clans, Temple Run, Pandora, Pinterest, Bible, Candy Crush Saga, Spotify Mucis & Angry Birds


-- 6. Take the 10 apps best rated by users.

SELECT id, track_name, user_rating, rating_count_tot
FROM applestore2
ORDER BY user_rating DESC, rating_count_tot DESC
LIMIT 10;

-- 7. Take a look on the data you retrieved in the question 5. Give some insights.

#Huge Gap in the TOP3 with Facebook, IG and Clash of Clans dominating the total of reviews. Social media and game apps account for the most ratings

-- 8. Take a look on the data you retrieved in the question 6. Give some insights.

# There is some apps with a 5 rating and more than 400k reviews which is impressive (Head Soccer and Plants vs Zombies)
-- 9. Now compare the data from questions 5 and 6. What do you see?

-- 10. How could you take the top 3 regarding the user ratings but also the number of votes?

#I did it before in question 6 since it was not relevant apps with low amount of reviews/number of votes
SELECT track_name, user_rating, rating_count_tot
FROM applestore2
ORDER BY user_rating DESC, rating_count_tot DESC
LIMIT 10;

-- 11. Does people care about the price? Do some queries, comment why are you doing them and the results you retrieve. What is your conclusion?

SELECT track_name, price, rating_count_tot, prime_genre
FROM applestore2
ORDER BY rating_count_tot DESC
LIMIT 20;

#In the TOP20 most rated apps there is 3 paid gaming apps

#LEt's explore the paid apps
SELECT track_name, price, rating_count_tot, prime_genre, (rating_count_tot*price) as sales  
FROM applestore2
WHERE price <>0
ORDER BY rating_count_tot DESC
LIMIT 20;

#4/20 of the TOP20 rated apps have a price over 3$, so certain users are up to pay for gaming apps (Minecraft, Draw something, COD and Scrabble)

#Conclusion: there some market for the Game developer to make out a living out of the apps through a marketstore (App Store or Playstore)


