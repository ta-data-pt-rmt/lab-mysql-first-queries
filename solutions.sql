USE applestore2; 

SELECT * 
FROM applestore2; 

/* 1. Which are the different genres? */ 

SELECT DISTINCT prime_genre 
FROM applestore2; 

/* 'Games', 'Productivity', 'Weather', 'Shopping', 'Reference', 'Finance', 'Music', 'Utilities', 'Travel'
'Social Networking', 'Sports', 'Business', 'Health & Fitness', 'Entertainment', 'Photo & Video', 'Navigation'
'Education', 'Lifestyle', 'Food & Drink', 'News', 'Book', 'Medical', 'Catalogs' */

/* 2. Which is the genre with more apps rated?*/ 

SELECT prime_genre, MAX(rating_count_tot) as highest_rating
FROM applestore2
GROUP BY prime_genre;

/* The genre with more apps rated is "Games"*/

/* 3. Which is the genre with more apps?*/ 

SELECT prime_genre, COUNT(*) as num_apps
FROM applestore2
GROUP BY prime_genre
ORDER BY num_apps DESC
LIMIT 1;

/* The genre with more apps is "Games"*/ 

/* 4. Which is the one with less?*/ 

SELECT prime_genre, COUNT(*) as num_apps
FROM applestore2
GROUP BY prime_genre
ORDER BY num_apps ASC
LIMIT 1;

/* The genre with less apps is "Catalogs" */ 

/* 5. Take the 10 apps most rated.*/ 
SELECT track_name, rating_count_tot
FROM applestore2
ORDER BY rating_count_tot DESC;
/* The 10 most rated apps are: Facebook, Instagram, Clash of Clans, Temple Run, Pandora - Music&Radio, Pinterest, Bible, Candy Crush Saga, Spotify Music, Angry Birds*/ 

/* 6. Take the 10 apps best rated by users. */ 

SELECT track_name, user_rating 
FROM applestore2 
ORDER BY user_rating DESC;

/* The 10 best rated apps by users are: Simple Camera - Fast Minimal Design, Fitness - Gym...., Seattle GameDay..., Lanota, ?????????????????? ????????????????????????, Slots: DoubleUp Free Slot Games - Slot Machines,
Steelers Live GameDay Nation Radio - Pittsburgh Football & Sports App Edition, Dungeons of Chaos UNITY EDITION, ????????????IV:????????????, Boston GameDay Radio for Live New England Sports, News, and Music ??? Patriots and Celtics Edition */ 

SELECT price, rating_count_tot
FROM applestore2

/* Yes people care about the price, the apps that have more rates therefore the ones 
that probably have been more downloaded are the free apps, the ones with 0 price.*/ 
