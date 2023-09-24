/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
select p.Name "Products Name", c.Name "Categories Name"
from products as p
inner join categories as c 
on c.CategoryId = p.CategoryId
where c.Name = 'Computers';

/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
select p.Name, p.price, r.rating
from products as p
inner join reviews as r 
on r.ProductID = p.ProductID
Where r.rating = 5;
 
/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
select e.firstname, e.LastName, Sum(s.Quantity) as total
from sales as s
inner join employees as e 
on e.EmployeeID = s.EmployeeID
group by e.EmployeeID
order by total desc;

/* joins: find the name of the department, and the name of the category for Appliances and Games */
Select d.Name as DepartmentName, c.Name as CategoryName
from departments as d
inner join categories as c
on c.DepartmentID = d.DepartmentID
where c.Name = "Appliances" Or c.Name = "Games";

/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
 select p.Name, Sum(s.Quantity) as Total_Sold, Sum(s.Quantity * s.PricePerUnit) as Total_Price
 from products as p
 inner join sales as s
 on s.ProductID = p.ProductID
 where p.name = "Eagles: Hotel California";
 

/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
select p.Name, r.Reviewer, r.Rating, r.Comment
from products as p
inner join reviews as r
on r.ProductID = p.ProductID
where p.ProductID = 857 and r.Rating = 1;

-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return:
-  the employeeID
-  the employee's first and last name
-  the name of each product
-  and how many of that product they sold */
Select e.EmployeeID, e.FirstName, e.LastName, p.Name, Sum(s.Quantity) as Total
from sales as s 
inner join employees as e on e.EmployeeID = s.EmployeeID
inner join products as p on p.ProductID = s.ProductID
group by e.EmployeeID, p.ProductID
order by e.FirstName;



