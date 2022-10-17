SELECT * FROM apple_store.applestore2;
/* 1. Which are the different genres? */
select distinct prime_genre from apple_store.applestore2;
/* 2. Which is the genre with more apps rated? -> book*/
select prime_genre, rating_count_tot 
from apple_store.applestore2 
order by prime_genre, rating_count_tot desc;
/* 3. Which is the genre with more apps? -> games*/
SELECT prime_genre 
from apple_store.applestore2 
group by prime_genre 
order by count(*) desc
limit 1;
/*4. Which is the one with less? catalogs*/
SELECT prime_genre 
from apple_store.applestore2 
group by prime_genre 
order by count(*) asc
limit 1;
/*5. Take the 10 apps most rated.*/
select track_name, rating_count_tot 
from apple_store.applestore2 
order by rating_count_tot desc
limit 10;
/*6. Take the 10 apps best rated by users.*/
select track_name, user_rating 
from apple_store.applestore2 
order by user_rating desc
limit 10; 
/*7. Take a look on the data you retrieved in the 
question 5. Give some insights.
the most rated apps don´t belong to the apps that 
are in the top genres*/


/*8. Take a look on the data you retrieved in the 
question 6. Give some insights.
users mostly rate the apps that belong to the 
favorite genres (games)*/

/*9. Now compare the data from questions 5 and 6. 
What do you see?
the most rated apps don´t belong to the favorites
apps of the users (tbh I am not sure what the goal is 
in these three tasks)*/

/*10. How could you take the top 3 regarding the user ratings
 but also the number of votes?*/
 select track_name, user_rating, rating_count_tot
 from apple_store.applestore2 
 order by user_rating desc, rating_count_tot desc
 limit 3; 
 
 /*11. Do people care about the price?*/
 select track_name, user_rating, price, rating_count_tot, prime_genre
 from apple_store.applestore2 
 order by user_rating desc, price desc;
/*well the most expensive apps have a 5 start rating 
but are also not in the most rated apps. I can assume 
that they get bought less often then apps that are for 
free as the rating count for apps for free is higher
on the other side people are happy with the expensive apps.
I would say it depends on the genre. For games people enjoy
more free apps (You can confirm through the previous questions)
for hobbies like music, photographic or education people
don´t care about the price (5 star rating)*/







