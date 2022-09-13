CREATE VIEW VENDEDORES AS SELECT V_NAME AS NOMBRE FROM VENDOR

SELECT * FROM VENDEDORES

/* Guardar en una vista el nombre y c�digo de todos aquellos vendedores que no han realizado ninguna venta. Mostrarlos invocando la vista creada.*/
DECLARE @TABLA TABLE(
CODIGO INT
);

INSERT INTO @TABLA SELECT V_CODE FROM VENDOR EXCEPT SELECT V_CODE FROM PRODUCT

SELECT * FROM @TABLA, VENDOR WHERE VENDOR.V_CODE = CODIGO

CREATE VIEW VEN AS SELECT V_CODE FROM VENDOR EXCEPT SELECT V_CODE FROM PRODUCT

SELECT * FROM VEN 

/*Cree una vista que guarde la informaci�n de la tabla productos y la tabla vendor. Luego, en esta seleccione la descripci�n de los art�culos vendidos 
por el vendedor ORDVA.Inc.*/

CREATE VIEW ORDVA AS SELECT PRODUCT.P_CODE,PRODUCT.P_DESCRIPT,PRODUCT.P_DISCOUNT, PRODUCT.P_INDATE, PRODUCT.P_MIN, PRODUCT.P_PRICE, PRODUCT.P_QOH, PRODUCT.V_CODE AS COD, VENDOR.*  FROM PRODUCT,VENDOR

SELECT * FROM ORDVA

SELECT P_DESCRIPT FROM ORDVA WHERE COD = (SELECT V_CODE FROM ORDVA WHERE V_NAME = 'ORDVA, INC.' GROUP BY V_CODE) GROUP BY P_DESCRIPT  

/*Cree y muestre una lista de los clientes que poseen el mismo nombre y apellido de alg�n empleado.*/

SELECT * FROM EMPLOYEE

SELECT * FROM CUSTOMER


CREATE VIEW NAMES AS SELECT EMPLOYEE.EMP_FNAME, EMPLOYEE.EMP_LNAME FROM EMPLOYEE,CUSTOMER WHERE EMP_FNAME = CUS_FNAME AND EMP_LNAME = CUS_LNAME

SELECT * FROM NAMES

/*Cree y muestre una vista con los n�meros de las facturas (INV_NUMBER) de los clientes que poseen balance en cero (CUS_BALANCE).*/

SELECT * FROM CUSTOMER

CREATE VIEW FACT AS SELECT INV_NUMBER FROM CUSTOMER, INVOICE WHERE CUS_BALANCE = 0 GROUP BY INV_NUMBER

SELECT * FROM FACT

/*Cree y muestre una vista con el n�mero de factura, nombre y contacto del vendedor y balance del cliente diferente de cero. La informaci�n a mostrar ser� la siguiente:*/

CREATE VIEW FACTU AS SELECT INV_NUMBER, V_NAME, V_CONTACT, CUS_BALANCE FROM INVOICE, VENDOR, CUSTOMER WHERE CUS_BALANCE >0 GROUP BY CUS_BALANCE,INV_NUMBER

SELECT * FROM FACTU