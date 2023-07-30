--query 1 : Berapa rata-rata umur customer jika dilihat dari marital statusnya ?

SELECT "Marital Status" , AVG("age") AS "rata_rata_umur"
FROM "Customer" c 
WHERE "Marital Status" IS NOT NULL
GROUP BY "Marital Status" ;

--query 2 : Berapa rata-rata umur customer jika dilihat dari gender nya ?

SELECT
    CASE 
        WHEN "gender" = 0 THEN 'Wanita'
        WHEN "gender" = 1 THEN 'Pria'
    END AS "gender",
    AVG("age") AS "rata_rata_umur"
FROM
    "Customer" c
WHERE
    "age" IS NOT NULL
GROUP BY
    "gender";

--query 3 : Tentukan nama store dengan total quantity terbanyak!
--Menampilkan 5 nama store teratas

SELECT s.storename , SUM(t.qty) AS qty
FROM "Transaction" t
JOIN "Store" s ON t.storeid = s.storeid 
GROUP BY s.storename 
ORDER BY qty DESC
LIMIT 5; 

--query 4 : Tentukan nama produk terlaris dengan total amount terbanyak!
--Menampilkan 5 nama produk teratas

SELECT p."Product Name" , SUM(t.totalamount) AS total_amount
FROM "Transaction" t
JOIN "Product" p ON t.productid  = p.productid 
GROUP BY p."Product Name" 
ORDER BY total_amount DESC
LIMIT 5;

