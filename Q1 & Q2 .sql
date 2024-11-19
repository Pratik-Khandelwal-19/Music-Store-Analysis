
use practice;

select * from employee
where levels = 'L6';

select billing_country from invoice
group by billing_country
order by billing_country desc
Limit 1;

select max(total) from invoice
group by total
order by max(total) desc
limit 3;

select billing_city,sum(total) from invoice
group by billing_city
order by sum(total) desc
limit 1;

select customer_id,first_name,last_name from customers
where customer_id = (select customer_id from invoice
group by customer_id
order by sum(total) desc
limit 1);



select customer_id,first_name,last_name,email from customers
where email like 'A%' AND customer_id in (select customer_id from invoice
where invoice_id in (select invoice_id from invoice_line
where track_id in (select track_id from track
where genre_id = (select genre_id from genre
where name = 'Rock'))));

select composer,count(album_id) from track
where genre_id = (select genre_id from genre
where name = 'Rock')
group by composer
order by count(album_id) desc
limit 10;

select name,milliseconds from track
where milliseconds > (select avg(milliseconds) from track)
order by milliseconds desc;
