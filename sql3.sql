--1. List all customers who live in Texas (use JOINs) 5
select district, name
from address
inner join customer_list
on customer_list.address = address.address
where district = 'Texas'


--2. Get all payments above $6.99 with the Customer's Full Name
select amount, name
from payment
inner join customer_list
on customer_list.id = payment.customer_id
where amount >= 6.99

--3. Show all customers names who have made payments over $175(use subqueries) Eleanor, Karl, Marion, Rhonda, Clara, Tommy are the six.  
SELECT customer_id
FROM payment
GROUP BY customer_id
HAVING SUM(amount) > 175
ORDER BY SUM(amount) DESC;


--4. List all customers that live in Nepal (use the city table)
select name, country
from city as location_city
inner join customer_list
on location_city.city = customer_list.city
where country = 'Nepal'


--5. Which staff member had the most transactions? 1 had 8040 transactions
select count(staff_id), staff_id from rental
group by staff_id

--6. How many movies of each rating are there? R: 195, PG-13: 223, G: 178, PG: 194, NC-17: 210 
select count(rating), rating from film
group by rating

--7.Show all customers who have made a single payment above $6.99 (Use Subqueries)
select count(distinct customer_id)
from payment 
where amount >= 6.99

--8. How many free rentals did our stores give away? 24
select * from payment
where amount = 0;