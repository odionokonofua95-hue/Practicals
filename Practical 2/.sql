-- 1. Find all records where Size is missing and the purchase_amount is greater than 50.
--Expected Columns: Customer ID, Size, purchase_amount, Item_Purchased

select CUSTOMER_ID,Size,purchase_amount, Item_purchased
from shoping_trends
where size is null and purchase_amount>50;

--List the total number of purchases grouped by Season, treating NULL values as 'Unknown Season'.
--Expected Columns: Season, Total Purchases

select count (*) as total_purchase,
coalesce (season, 'Uknown season') as season
from shoping_trends
group by season;

--3. Count how many customers used each Payment Method, treating NULLs as 'Not Provided'.
--Expected Columns: Payment Method, Customer Count

select coalesce (payment_method,'Not provied') AS payment_method,
count (customer_id) as customer_count
from shoping_trends
group by payment_method;

--4.Show customers where Promo Code Used is NULL and Review Rating is below 3.0.
--Expected Columns: Customer ID, Promo Code Used, Review Rating, Item Purchased

select customer_id, promo_code_used, review_rating, Item_purchased
from shoping_trends
WHERE promo_code_used is NULL AND review_rating <3;


--5.Group customers by Shipping Type, and return the average purchase_amount, treating missing values as 0.
--Expected Columns: Shipping Type, Average purchase_amount

select shipping_type,
 avg (COALESCE(purchase_amount, 0)) as Average_purchase_amount
from shoping_trends
group by shipping_type;

--6. Display the number of purchases per Location only for those with more than 5 purchases and no NULL Payment Method.
--Expected Columns: Location, Total Purchases

Select location,
count(*) as total_purchases
from shoping_trends
WHERE PAYMENT_METHOD IS not null
group by location
Having total_purchases>5;

--7. Create a column Spender Category that classifies customers using CASE:
--'High' if amount > 80, 'Medium' if BETWEEN 50 AND 80,
--'Low' otherwise. Replace NULLs in purchase_amount with 0.
--Expected Columns: Customer ID, purchase_amount, Spender Category
SELECT customer_id, 
coalesce (purchase_amount,0) AS PURCHASE_AMOUNT,
Case
when purchase_amount>80 THEN 'High'
when purchase_amount between 50 And 80 Then 'Medium'
else 'Low'
end as spender_category
from shoping_trends;
 
--Q8.Find customers who have no Previous Purchases value but whose Color is not NULL.
--Expected Columns: Customer ID, Color, Previous Purchases

select customer_id,
color,
previous_purchases,
from shoping_trends
where color is not null AND previous_purchases is null;
--9. Group records by Frequency of
--Purchases and show the total amount spent per group, treating NULL frequencies as 'Unknown'.
--Expected Columns: Frequency of Purchases, Total purchase_amount

select ifnull (frequency_of_purchases,'Uknown'),
sum(purchase_amount) as total_purchase_amount
from shoping_trends
group by frequency_of_purchases;

--10.Display a list of all Category values with the number of times each was purchased,
--excluding rows where Categoryis NULL.
--Expected Columns: Category, Total Purchases

select category,
count(*) total_purchases
from shoping_trends
where category is not null
group by category;

--11.Return the top5 Locations with the highest total purchase_amount, replacing NULLs in amount with 0.
--Expected Columns: Location, Total purchase_amount

select top 5 location,
Sum(ifnull (purchase_amount, 0)) as Total_purchase_amount
from shoping_trends
group by location
order by Total_purchase_amount desc;

--12.Group customers by Gender and Size, and count how many entries have a NULL Color.
--Expected Columns: Gender, Size, Null Color Count

select gender, size,
count(*) as Null_color_count
from shoping_trends
Where color is null
group by gender, size;

--13.Identify all Item Purchased where more than 3 purchases had NULL Shipping Type.
--Expected Columns: Item Purchased, NULL Shipping Type Count

select item_purchased,
count(*) as Null_shipping_Type_Count
from shoping_trends
WHERE shipping_type is null
group by item_purchased
Having Null_shipping_Type_count >3;

--14.Show a count of how many customers per Payment Method have NULL Review Rating.
--Expected Columns: Payment Method, Missing Review Rating Count
select payment_method,
count (*) as missing_review_rating_count
from shoping_trends
Where review_rating is null
group by payment_method;

--15.Group by Category and return the average Review Rating, replacing NULLs with 0, 
--and filter only where average is greater than 3.5.
--Expected Columns: Category, Average Review Rating

select category,
avg(coalesce(review_rating, 0)) as average_review_rating
from shoping_trends
group by category
Having average_review_rating>3.5;

--16. List all Colors that are missing (NULL) in at least 2 rows and the average Age of customers for those rows.
--Expected Columns: Color, Average Age
select color,
avg(age) as average_age
from shoping_trends
where color is null
group by color
having average_age>=2;

--17.Use CASE to create a column Delivery Speed: 'Fast' if Shipping Type is 'Express' or
--'Next Day Air', 'Slow' if 'Standard',
--'Other' for all else including NULL. Then count how many customers fall into each category.
-- Expected Columns: Delivery Speed, Customer Count
select 
case
when shipping_type='Express' or shipping_type='Next Day Air' then 'fast'
when shipping_type ='Standard' then 'slow'
else 'other'
end as delivery_speed,
count (customer_id) as customer_count
from shoping_trends
Group by delivery_speed;

--18.Find customers whose purchase_amount is NULL and whose Promo Code Used is'Yes'.
--Expected Columns: Customer ID, purchase_amount, Promo Code Used
select customer_id,
purchase_amount,
promo_code_used
from shoping_trends
where purchase_amount is null and promo_code_used ='Yes';

--19.Group by Location and show the maximum Previous
--Purchases, replacing NULLs with 0, only where the average rating is above 4.0.
--Expected Columns: Location, Max Previous Purchases, Average Review Rating
Select location,
Max(IFNULL(previous_purchases,0)) as Max_previous_purchases,
AVG(Review_rating) as average_review_rating
from shoping_trends
group by location
Having average_review_rating>4;
--20.Show customers who have a NULL Shipping
--Type but made a purchase in the range of 30 to 70 USD.
--Expected Columns: Customer ID, Shipping
--Type, purchase_amount, Item Purchased
Select Customer_id, shipping_Type,purchase_amount, item_purchased
from shoping_trends
Where shipping_type is null and purchase_amount between 30 and 70;

-- Q.2

SELECT 
    COALESCE(season, 'Unknown Season') AS Season,
    COUNT(*) AS Total_Purchases
FROM shoping_trends
GROUP BY COALESCE(season, 'Unknown Season');

--Q.5
SELECT 
    shipping_type,
    AVG(COALESCE(purchase_amount, 0)) AS avg_amount
FROM shoping_trends
GROUP BY shipping_type;

--Q
