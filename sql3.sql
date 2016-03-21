#유저별 매출 수

DROP TEMPORARY TABLE IF EXISTS first_rental;
CREATE TEMPORARY TABLE first_rental

SELECT
  r.customer_id,
  MIN(r.rental_date) first_time
FROM 
  rental r
GROUP BY 1
;

SELECT *
FROM first_rental
;

#cohort에 포함된 유저 수 

DROP TEMPORARY TABLE IF EXISTS cohort_size;
CREATE TEMPORARY TABLE cohort_size

SELECT
  LEFT(first_time, 7) Month,
  COUNT(*) Num
FROM
  first_rental
GROUP BY 1
;

SELECT *
FROM cohort_size
;