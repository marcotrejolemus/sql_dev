create or replace package body "MANAGE_ORDERS" as
PROCEDURE add_product(
	p_product IN NUMBER,
	p_quantity IN NUMBER)

IS 
BEGIN
	IF NOT apex_collection.collection_exists(p_collection_name => 'PRODUCTS')
		THEN 
		apex_collection.create_collection(p_collection_name => 'PRODUCTS');
	END IF;
	
	apex_collection.add_member(p_collection_name => 'PRODUCTS',
	p_n001 => p_product,
	p_n002 => p_quantity);
END add_product;

PROCEDURE remove_product (p_product IN NUMBER)
IS 
l_id NUMBER;
BEGIN
	IF apex_collection.Collection_exists(p_collection_name => 'PRODUCTS')
	THEN
		SELECT seq_id
		INTO l_id
		FROM apex_collections a
		WHERE collection_name = 'PRODUCTS'
		AND a.n001 = p_product;
		
		apex_collection.delete_member(p_collection_name => 'PRODUCTS', p_seq => l_id);
	END IF;
END remove_product;	
	
FUNCTION get_quantity
RETURN NUMBER
IS
	l_items NUMBER := 0;
BEGIN
	IF apex_collection.collection_exists(p_collection_name => 'PRODUCTS')
	THEN
		SELECT SUM(n002)
		INTO l_items
		FROM apex_collections a
		WHERE collection_name = 'PRODUCTS';
	END IF;
	RETURN l_items;
END get_quantity;

FUNCTION product_exists(p_product IN NUMBER)
RETURN NUMBER
IS
	l_quantity NUMBER;
BEGIN
		IF apex_collection.collection_exists(p_collection_name => 'PRODUCTS')
			THEN
				SELECT a.n002
				INTO l_quantity
				FROM apex_collections a
				WHERE collection_name = 'PRODUCTS'
				AND a.n001 = p_product;
			RETURN l_quantity;
		ELSE 
			RETURN 0;
		END IF;
	EXCEPTION 
		WHEN OTHERS THEN
			RETURN 0;
END product_exists;

PROCEDURE clear_cart
IS
BEGIN
		IF apex_collection.collection_exists(p_collection_name => 'PRODUCTS')
			THEN
				apex_collection.truncate_collection(p_collection_name => 'PRODUCTS');
		END IF;
END clear_cart;

FUNCTION customer_exists(p_customer_email IN VARCHAR2)
RETURN NUMBER
IS
	l_customer customers.customer_id%TYPE;
BEGIN
	SELECT 	customer_id
	INTO	l_customer
	FROM	customers
	WHERE	email_address = p_customer_email;
	
	RETURN l_customer;
	EXCEPTION
		WHEN no_data_found 
		THEN 
			RETURN 0;
END customer_exists;

PROCEDURE create_order (p_customer IN VARCHAR2 DEFAULT NULL,
						p_customer_email IN VARCHAR2,
						p_store IN NUMBER,
						p_order_id OUT orders.order_id%TYPE,
						p_customer_id OUT NUMBER)	
IS
BEGIN
	p_customer_id := customer_exists(p_customer_email);
	
	IF p_customer_id = 0
		THEN
		INSERT INTO customers( full_name, email_address)
		VALUES	(p_customer, p_customer_email)
		returning customer_id INTO p_customer_id;
	END IF;
	
	INSERT INTO orders (order_datetime, customer_id,store_id, order_status)
	VALUES (SYSDATE, p_customer_id, p_store,'OPEN')
	returning order_id INTO p_order_id;
	
		IF apex_collection.collection_exists(p_collection_name => 'PRODUCTS')
			THEN
				INSERT INTO order_items(order_id,
										line_item_id,
										product_id,
										unit_price,
										quantity)
				SELECT 	p_order_id,
						seq_id,
						p.product_id,
						p.unit_price,
						n002
				FROM apex_collections a,
					products p
				WHERE collection_name = 'PRODUCTS'
				AND p.product_id = a.n001;
		END IF;
		
		apex_collection.delete_collection(p_collection_name => 'PRODUCTS');				
END create_order;

end "MANAGE_ORDERS";
/