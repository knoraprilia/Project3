CREATE DATABASE Project3

SELECT 
	ord.[order_id], 
	CONCAT(cus.[first_name],' ', cus.[last_name]) as pelanggan,
	cus.[city], cus.[state],
	ord.[order_date],
	itm.[list_price],
	prod.[product_name],
	cat.[category_name],
	stor.[store_name],
	brand.[brand_name],
	CONCAT(staff.[first_name],' ', staff.[last_name]) as Nama_Staff,
	SUM(itm.[quantity]) as 'Banyak',
	SUM(itm.[quantity] * itm.[list_price]) as 'Total'
FROM [sales].[orders] as ord
JOIN [sales].[customers] as cus
ON ord.[customer_id] = cus.[customer_id]
JOIN [sales].[order_items] as itm
ON ord.[order_id] = itm.[order_id]
JOIN [production].[products] as prod
ON itm.[product_id] = prod.[product_id]
JOIN [production].[categories] as cat
ON cat.[category_id] = prod.[category_id]
JOIN [sales].[stores] as stor
ON stor.[store_id] = ord.[store_id]
JOIN [sales].[staffs] as staff
ON staff.[staff_id] = ord.[staff_id]
JOIN [production].[brands] as brand
ON brand.[brand_id] = prod.[brand_id]
GROUP BY
	ord.[order_id], 
	cus.[first_name],
	cus.[last_name],
	cus.[city], cus.[state],
	ord.[order_date],
	itm.[list_price],
	prod.[product_name],
	cat.[category_name],
	stor.[store_name],
	staff.[first_name],
	staff.[last_name],
	brand.[brand_name]
