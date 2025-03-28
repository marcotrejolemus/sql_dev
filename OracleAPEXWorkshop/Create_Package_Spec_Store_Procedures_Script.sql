create or replace package "MANAGE_ORDERS" as
PROCEDURE add_product(
	p_product IN NUMBER,
	p_quantity IN NUMBER);

PROCEDURE remove_product (
	p_product IN NUMBER
	);
	
FUNCTION Get_quantity
RETURN NUMBER;

FUNCTION Product_exists(
p_product IN NUMBER)
RETURN NUMBER;

PROCEDURE clear_cart;

FUNCTION Customer_exists(
p_customer_email IN VARCHAR2)
RETURN NUMBER;

PROCEDURE create_order (
	p_customer IN VARCHAR2 DEFAULT NULL,
	p_customer_email IN VARCHAR2,
	p_store IN NUMBER,
	p_order_id OUT orders.order_id%TYPE,
	p_customer_id OUT NUMBER);	

end "MANAGE_ORDERS";
/