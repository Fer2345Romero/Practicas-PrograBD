USE NORTHWND
GO

--EJERCICIO 1

WITH cte_TopProducts AS (
	SELECT TOP 5 ProductName, UnitPrice
	FROM Products
	ORDER BY UnitPrice DESC
)
SELECT * FROM cte_TopProducts

--Ejercicios 2
WITH cte_CategorySales AS(
	SELECT c.CategoryName, SUM(od.Quantity * od.UnitPrice) AS 'TotalSales'
	FROM Categories c
	INNER JOIN Products p ON c.CategoryID = p.CategoryID
	INNER JOIN [Order Details] od ON p.ProductID = od.ProductID
	GROUP BY c.CategoryName
)
SELECT CategoryName, TotalSales
FROM cte_CategorySales
ORDER BY TotalSales DESC

--Ejercicios 3
WITH EmployeeHierarchy AS (
    SELECT EmployeeID, FirstName, LastName, ReportsTo, 0 AS Level
    FROM Employees
    WHERE ReportsTo IS NULL
    
    UNION ALL
    
    SELECT e.EmployeeID, e.FirstName, e.LastName, e.ReportsTo, eh.Level + 1
    FROM Employees e
    INNER JOIN EmployeeHierarchy eh ON e.ReportsTo = eh.EmployeeID
)
SELECT 
    EmployeeID,
    FirstName + ' ' + LastName AS FullName,
    Level
FROM EmployeeHierarchy
ORDER BY Level, EmployeeID;

--Ejercicios 4

WITH cte_EmployeesSales(EmployeesID, FullName, TotalSales, NumberOrders)
AS(
	SELECT
			e.EmployeeID, e.FirstName + ' ' + e.LastName AS 'FullName',
			SUM(od.Quantity * od.UnitPrice * (1 - od.Discount) ),
			COUNT(DISTINCT o.OrderID)
	FROM Employees e
	INNER JOIN Orders o ON e.EmployeeID = o.EmployeeID
	INNER JOIN [Order Details] od ON o.OrderID = od.OrderID
	GROUP BY e.EmployeeID, e.FirstName, e.LastName
)

SELECT EmployeesID, FullName, FORMAT(TotalSales, 'C') AS 'TotalSales', NumberOrders
FROM cte_EmployeesSales
ORDER BY TotalSales DESC