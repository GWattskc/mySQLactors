USE sakila;

SELECT first_name, last_name from actor;

SELECT CONCAT(first_name," ", last_name) AS ActorName from actor;

SELECT actor_id, last_name, first_name FROM actor
       WHERE first_name LIKE "Joe";
       
select last_name from actor
		WHERE last_name like "%Gen%";
         
select first_name, last_name from actor
		WHERE last_name like "%LI%" order by last_name, first_name;

select country_id, country from country Where country IN ("Afghanistan", "Bangladesh", "China");

alter table actor 
	add description blob;
    
alter table actor
	drop column description;

select last_name, count(last_name) from actor group by(last_name);

select last_name, count(last_name) from actor group by(last_name) having count(last_name) >=2;

update actor
set first_name="Harpo" where first_name="Groucho" and last_name="Williams";

update actor
set first_name="Groucho" where first_name="Harpo" and last_name="Williams";

show columns from address; 

select first_name, last_name, address from staff join address on (staff.address_id=address.address_id);

select first_name, last_name, sum(payment.amount) from staff join payment on (staff.staff_id=payment.staff_id) where payment.payment_date between "2005-08-01" and "2005-08-31" group by payment.staff_id;

select title, count(actor_id) from film inner join film_actor on (film.film_id=film_actor.film_id) group by film.film_id;

select count(*) from inventory where film_id=(select film_id from film where title = "Hunchback Impossible");

select first_name, last_name, sum(amount) from payment p inner join customer c on (p.customer_id = c.customer_id) group by p.customer_id;

create view top5genres as
	select c.name as "Top Five Genres", sum(p.amount) as "Gross Revenue" from category c
    join film_category fc on (c.category_id = fc.category_id)
    join inventory i on (fc.film_id = i.film_id)
    join rental r on (i.inventory_id = r.inventory_id)
    join payment p on (r.rental_id = p.rental_id)
    group by c.name order by sum(p.amount) Desc limit 5;
    
select * from top5genres;

drop view top5genres;
    
