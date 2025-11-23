--Q1Display all columns for all transactions.
--Expected output: All columns
Select
    *
from
    data;
--Q2.Display only the Transaction ID, Date, and Customer ID for all records.
    --Expected output: Transaction ID, Date, Customer ID
select
    transaction_id,
    date,
    customer_id
from
    data;
--Q3. Display all the distinct product categories in the dataset.
    --Expected output: Product Category
SELECT
    distinct product_category
From
    data;
--Q4.Display all the distinct gender values in the dataset.
    --Expected output: Gender
Select
    distinct GENDER
from
    data;
--Q5. Display all transactions where the Age is greater than 40.
    --Expected output: All columns
select
    *
from
    data
where
    age > 40;
--Q6. Display all transactions where the Price per Unit is between 100 and 500.
    --Expected output: All columns
select
    *
from
    data
where
    price_per_unit BETWEEN 10
    AND 500;
--Q7. Display all transactions where the Product Category is either 'Beauty' or
    --'Electronics'.
    --Expected output: All columns
select
    *
from
    data
where
    product_category = 'Beauty'
    or PRODUCT_CATEGORY = 'Electronics';
--Q8. Display all transactions where the Product Category is not 'Clothing'.
    --Expected output: All columns
select
    *
from
    data
where
    product_category != 'Clothing';
--Q9. Display all transactions where the Quantity is greater than or equal to 3.
    --Expected output: All columns
select
    *
from
    data
WHERE
    QUANTITY >= 3;
--Q10. Count the total number of transactions.
    --Expected output: Total_Transactions
select
    count (TRANSACTION_ID) as total_transaction
from
    data;
--Q11. Find the average Age of customers.
    --Expected output: Average_Age
select
    avg (age) as Average_Age
from
    data;
--Q12. Find the total quantity of products sold.
    --Expected output: Total_Quantity
select
    sum(quantity) as Total_Quantity
from
    data;
--Q13. Find the maximum Total Amount spent in a single transaction.
    --Expected output: Max_Total_Amount
select
    max(Total_amount) as Max_Total_Amount
from
    data;
--Q14. Find the minimum Price per Unit in the dataset.
    --Expected output: Min_Price_per_Unit
select
    min (Price_Per_unit) as min_price_per_unit
from
    data;
--Q15. Find the number of transactions per Product Category.
    --Expected output: Product Category, Transaction_Count
select
    product_category,
    count(Transaction_id) as TRANSACTION_count
from
    data
group by
    product_category;
--Q16. Find the total revenue (Total Amount) per gender.
    --Expected output: Gender, Total_Revenue
select
    gender,
    sum(total_amount) as Total_Revenue
from
    data
Group by
    gender;
--Q17. Find the average Price per Unit per product category.
    --Expected output: Product Category, Average_Price
select
    product_category,
    AVG(Price_per_unit) AS Average_Price
from
    DATA
GROUP by
    product_category;
--Q18. Find the total revenue per product category where total revenue is greater than
    --10,000.
    --Expected output: Product Category, Total_Revenue
select
    product_category,
    sum(Total_amount) as Total_Revenue
from
    data
group by
    PRODUCT_CATEGORY
HAVING
    total_revenue > 10000;
-- Q19. Find the average quantity per product category where the average is more than 2.
    --Expected output: Product Category, Average_Quantity
select
    Product_Category,
    AVG (quantity) as Average_Quantity
from
    data
group by
    product_category
HAVING
    Average_Quantity > 2;
--Q20. Display a column called Spending_Level that shows 'High' if Total Amount > 1000,
    --otherwise 'Low'.
    --Expected output: Transaction ID, Total Amount, Spending_Level
select
    Transaction_id,
    Total_amount,
    case
        when Total_amount > 1000 then 'High'
        else 'Low'
    end as Spending_Level
from
    data;
--Q21. Display a new column called Age_Group that labels customers as:
    --• 'Youth' if Age < 30
    --• 'Adult' if Age is between 30 and 59
    --• 'Senior' if Age >= 60
    --Expected output: Customer ID, Age, Age_Group
select
    customer_id,
    Age,
    case
        when Age < 30 then 'Youth'
        when Age BETWEEN 30
        and 59 then 'Adult'
        Else 'Senior'
    END as Age_Group
From
    data;
