/*1.1.-* Seleccione todos los productos de la tabla PRODUCT ordenados por precio en forma descendente.*/

SELECT * FROM PRODUCT ORDER BY P_PRICE DESC

/*1.2.- Elabore una consulta que indique el número de códigos de área que hay en la tabla CUSTOMER.*/

SELECT COUNT(CUS_AREACODE) AS NCOD FROM CUSTOMER

SELECT CUS_AREACODE FROM CUSTOMER GROUP BY CUS_AREACODE

/*1.3.-En una sola consulta seleccione de la tabla PRODUCT el producto de mayor y menor precio.*/

SELECT * FROM PRODUCT ORDER BY P_PRICE ASC

SELECT * FROM PRODUCT WHERE P_PRICE = (SELECT MAX(P_PRICE) FROM PRODUCT) OR P_PRICE =(SELECT MIN(P_PRICE) FROM PRODUCT) 

/*1.4.-Elabore una consulta que indique la cantidad de códigos de área diferentes y cuántos registros hay por código de área.*/

SELECT CUS_AREACODE AS CODIGO, COUNT (CUS_AREACODE) AS REGISTRO  FROM CUSTOMER GROUP BY CUS_AREACODE

/*1.5.-Seleccione de la tabla PRODUCT los cinco primeros productos de mayor precio ordenados en forma ascendente.*/

DECLARE @TEMP TABLE(
P_CODE NVARCHAR(10),
P_DESCRIP NVARCHAR(35),
P_INDATE DATETIME,
P_QOH SMALLINT,
P_MIN SMALLINT,
P_PRICE REAL,
P_DISCOUNT FLOAT,
V_CODE INT
);

INSERT @TEMP SELECT TOP 5 * FROM PRODUCT ORDER BY P_PRICE DESC

SELECT * FROM @TEMP ORDER BY P_PRICE ASC

/*1.6.-Siendo que la tabla PRODUCT posee los códigos de vendedores que realizaron la venta, y la tabla VENDOR posee los códigos de todos los vendedores, 
realice una consulta que muestre aquellos vendedores que no han realizado ninguna venta.*/

DECLARE @TABLA TABLE(
CODIGO INT
);

INSERT INTO @TABLA SELECT V_CODE FROM VENDOR EXCEPT SELECT V_CODE FROM PRODUCT

SELECT * FROM @TABLA, VENDOR WHERE VENDOR.V_CODE = CODIGO

