/*Ejercicio 1: Stored Procedure - Actualización de descuentos
o Crea un stored procedure llamado sp_ActualizarDescuentos que simule una
actualización de descuentos de los productos basándose en su stock y ventas
recientes.*/
CREATE PROCEDURE sp_ActualizarDescuentos
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE Products
    SET Discount = 
        CASE 
            WHEN UnitsInStock < 20 THEN 0.1 
            WHEN UnitsInStock >= 20 AND UnitsInStock <= 50 THEN 0.05 
            ELSE 0.0 
        END
    WHERE ProductID IN 
        (SELECT DISTINCT od.ProductID 
         FROM [Order Details] od
         INNER JOIN Orders o ON od.OrderID = o.OrderID
         WHERE o.OrderDate >= DATEADD(MONTH, -3, GETDATE()));  
END;

/*
• Ejercicio 2: Stored Procedure - Reporte de ventas por categoría
o Crea un stored procedure llamado sp_ReporteVentasPorCategoria que simule un
generador de un reporte de ventas por categoría de producto.*/

CREATE PROCEDURE sp_ReporteVentasPorCategoria
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        Categories.CategoryName,
        SUM([Order Details].Quantity * [Order Details].UnitPrice) AS TotalVentas
    FROM 
        Categories
    INNER JOIN 
        Products ON Categories.CategoryID = Products.CategoryID
    INNER JOIN 
        [Order Details] ON Products.ProductID = [Order Details].ProductID
    GROUP BY 
        Categories.CategoryName
    ORDER BY 
        TotalVentas DESC;
END;


/*
• Ejercicio 3: Trigger - Actualización de inventario
o Crea un trigger llamado tr_ActualizarInventario que se active después de insertar
un nuevo pedido en la tabla Orders.*/

CREATE TRIGGER tr_ActualizarInventario
ON Orders
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE Products
    SET UnitsInStock = UnitsInStock - od.Quantity
    FROM Products p
    INNER JOIN [Order Details] od ON p.ProductID = od.ProductID
    INNER JOIN Inserted i ON i.OrderID = od.OrderID;
END;


/* Ejercicio 4: Trigger - Control de precios
o Crea un trigger llamado tr_ControlPrecios que se active antes de actualizar los
precios en la tabla Products. */ CREATE TRIGGER tr_ControlPrecios
ON Products
INSTEAD OF UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @NewPrice MONEY, @OldPrice MONEY;

    SELECT @NewPrice = i.UnitPrice, @OldPrice = p.UnitPrice
    FROM Inserted i
    INNER JOIN Products p ON i.ProductID = p.ProductID;

    IF @NewPrice > @OldPrice * 1.20
    BEGIN
        RAISERROR ('No se puede incrementar el precio en más del 20%%.', 16, 1);
    END
    ELSE
    BEGIN
        UPDATE Products
        SET UnitPrice = @NewPrice
        FROM Inserted i
        WHERE Products.ProductID = i.ProductID;
    END;
END;
