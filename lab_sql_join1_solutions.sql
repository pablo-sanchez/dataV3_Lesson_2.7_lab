use sakila;
-- 1.How many films are there for each of the categories in the category table. Use appropriate join to write this query.
select * from category; -- category_id, name (of the category)
select * from film; -- film_id
select * from film_category; -- category_id, film_id

-- The previous queries was to plan the joins, the following query is the solution:
select c.name, fm.category_id, count(f.film_id) as number_of_films from film as f
join film_category as fm
on f.film_id = fm.film_id
join category as c
on fm.category_id = c.category_id
group by c.name
order by number_of_films desc;

-- 2.Display the total amount rung up by each staff member in August of 2005.
select * from payment;-- staff_id, amount, payment_date
select * from staff;-- staff_id, first_name, last_name

select s.first_name, s.last_name, sum(p.amount) as total_amount_rung_up from payment as p
join staff as s
on p.staff_id = s.staff_id
where month(p.payment_date) = 8 and year(p.payment_date) = 2005
group by s.first_name, s.last_name;


-- 3.Which actor has appeared in the most films?
select * from film_actor;-- film_id, actor_id
select * from actor; -- actor_id, first_name, last_name

select a.first_name, a.last_name, count(fa.actor_id) as total_number_of_appearances from actor as a
join film_actor as fa
on a.actor_id = fa.actor_id
group by a.first_name, a.last_name
order by total_number_of_appearances desc limit 1;

-- 4.Most active customer (the customer that has rented the most number of films).
select * from customer;
select * from payment;

select c.first_name, c.last_name, count(p.customer_id) as total_of_rentals from payment as p
join customer as c
on p.customer_id = c.customer_id
group by c.first_name, c.last_name
order by total_of_rentals desc limit 1;

-- 5.Display the first and last names, as well as the address, of each staff member.
select * from staff; -- first_name, last_name, adress_id
select * from address; -- address, address_id

select s.first_name, s.last_name, a.address from staff as s
left join address as a
on s.address_id = a.address_id;

-- 6.List each film and the number of actors who are listed for that film.
select * from film; -- title, film_id
select * from film_actor;-- film_id, actor_id

select f.title, count(fa.actor_id) as number_of_actors from film as f
join film_actor as fa
on f.film_id = fa.film_id
group by f.title
order by number_of_actors desc;

-- 7.Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name.
select * from customer; -- fist_name, last_name, customer_id
select * from payment; -- customer_id, amount

select c.first_name, c.last_name, sum(p.amount) as total_paid from payment as p
join customer as c
on p.customer_id = c.customer_id
group by c.first_name, c.last_name
order by c.last_name;

-- 8.List number of films per category.
select * from category; -- category_id, name (of the category)
select * from film; -- film_id
select * from film_category; -- category_id, film_id

select c.name, fm.category_id, count(f.film_id) as number_of_films from film as f
join film_category as fm
on f.film_id = fm.film_id
join category as c
on fm.category_id = c.category_id
group by c.name
order by c.category_id;