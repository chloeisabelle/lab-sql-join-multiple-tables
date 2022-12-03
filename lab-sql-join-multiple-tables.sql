-- Write a query to display for each store its store ID, city, and country.

select store_id, city, country from store S
join address A on (S.address_id=A.address_id)
join city C on (A.city_id=C.city_id)
join country z on (c.country_id=z.country_id);

-- Write a query to display how much business, in dollars, each store brought in.

select store_id, sum(amount) from payment P
join staff S on (P.staff_id=S.staff_id)
group by store_id;


-- What is the average running time of films by category?

select category_id, avg(length) from sakila.film
join sakila.film_category using(film_id)
group by category_id;


-- Which film categories are longest?

select category_id, avg(length) from sakila.film
join sakila.film_category using(film_id)
group by category_id
order by (length) desc;


-- Display the most frequently rented movies in descending order.

select title, rental_rate from sakila.film
group by title
order by (rental_rate) desc;

-- List the top five genres in gross revenue in descending order.

select category.name as category_name, sum(payment.amount) as gross_revenue
from category 
left join film_category 
on category.category_id = film_category.category_id
left join film 
on film_category.film_id = film.film_id
left join inventory 
on film.film_id = inventory.film_id
left join rental 
on inventory.inventory_id = rental.inventory_id
left join payment 
on rental.rental_id = payment.rental_id
Group by category.name
ORDER BY gross_revenue desc
limit 5;


-- Is "Academy Dinosaur" available for rent from Store 1?  

select *
from film a INNER JOIN inventory b ON b.film_id = a.film_id
where b.store_id = 1 and a.title = "Academy Dinosaur";

