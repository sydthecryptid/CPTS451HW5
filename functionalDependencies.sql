-- part b 
--running queries to identify functional dependencies, try to identify patterns

--month determines discount?
SELECT month
FROM MySales
GROUP BY month
HAVING COUNT(DISTINCT discount) > 1;

--does name determine discount?
SELECT pname
FROM MySales
GROUP BY pname
HAVING COUNT(DISTINCT discount) > 1;

--name determines price - returns true
SELECT pname, price, COUNT(*)
FROM MySales
GROUP BY pname, price
ORDER BY pname, price;

-- check if discount determines month
SELECT discount
FROM MySales
GROUP BY discount
HAVING COUNT(DISTINCT month) > 1;

-- Is (pname, month) unique / a candidate key?
SELECT pname, month, COUNT(*)
FROM MySales
GROUP BY pname, month
HAVING COUNT(*) > 1;

--functional dependencies found:
-- name determines price, month determines discount, (name, month) is a candidate key