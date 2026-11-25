-- Q1. Total bookings  (expected: 87228)
SELECT COUNT(*) AS total_bookings FROM bookings;

-- Q2. Overall cancellation %  (expected: 27.52)
SELECT ROUND(AVG(is_cancelled) * 100, 2) AS cancellation_pct FROM bookings;

-- Q3. Average ADR and lead time  (expected: 106 and 79.97)
SELECT ROUND(AVG(adr), 2) AS avg_adr,
       ROUND(AVG(lead_time), 2) AS avg_lead_time
FROM bookings;

-- Q4. Hotel-wise bookings and cancellation %  (expected: City 30.10, Resort 23.48)
SELECT _hotel, COUNT(*) AS bookings,
       ROUND(AVG(is_cancelled) * 100, 2) AS cancellation_pct
FROM bookings
GROUP BY _hotel;

-- Q5. Month-wise bookings
SELECT arrival_date_month, COUNT(*)bookings
FROM bookings
GROUP BY arrival_date_month, month_number
ORDER BY cast(month_number AS unsigned);

-- in which month the bookings are at peak
SELECT arrival_date_month,COUNT(*) as bookings
FROM bookings
GROUP BY arrival_date_month
ORDER BY bookings DESC
LIMIT 1;
-- Q6. Lead time vs cancellation
SELECT CASE WHEN lead_time <= 30  THEN '0-30'
            WHEN lead_time <= 90  THEN '31-90'
            ELSE '90+' 
				END AS lead_time_bucket,
       COUNT(*) AS bookings,
       ROUND(AVG(is_cancelled) * 100, 2) AS cancellation_pct
FROM bookings
GROUP BY lead_time_bucket
ORDER BY lead_time_bucket;

-- Q7. Top 10 countries
SELECT country, COUNT(*) AS bookings
FROM bookings
GROUP BY country
ORDER BY bookings DESC
LIMIT 10;

-- Q8. Market segment vs cancellation  (IMPORTANT: Excel chart se compare karna hai)
SELECT market_segment, COUNT(*) AS bookings,
       ROUND(AVG(is_cancelled) * 100, 2) AS cancellation_pct
FROM bookings
GROUP BY market_segment
ORDER BY bookings DESC;

-- Q9. ADR by month and hotel
SELECT arrival_date_month, _hotel, ROUND(AVG(adr), 2) AS avg_adr
FROM bookings
GROUP BY arrival_date_month, month_number, _hotel
ORDER BY month_number, _hotel;

-- Q10. Room type vs cancellation
SELECT reserved_room_type, COUNT(*) AS bookings,
       ROUND(AVG(is_cancelled) * 100, 2) AS cancellation_pct
FROM bookings
GROUP BY reserved_room_type
ORDER BY cancellation_pct DESC;

-- Q12. Customer type vs cancellation
SELECT customer_type, COUNT(*) AS bookings,
       ROUND(AVG(is_cancelled) * 100, 2) AS cancellation_pct
FROM bookings
GROUP BY customer_type;

-- Q13. Repeated guest vs new guest
SELECT is_repeated_guest, COUNT(*) AS bookings,
       ROUND(AVG(is_cancelled) * 100, 2) AS cancellation_pct
FROM bookings
GROUP BY is_repeated_guest;

-- Q14. Special requests vs cancellation
SELECT total_of_special_requests, COUNT(*) AS bookings,
       ROUND(AVG(is_cancelled) * 100, 2) AS cancellation_pct
FROM bookings
GROUP BY total_of_special_requests
ORDER BY total_of_special_requests;

-- Q15. Year-wise bookings and cancellation
SELECT arrival_date_year, COUNT(*) AS bookings,
       ROUND(AVG(is_cancelled) * 100, 2) AS cancellation_pct
FROM bookings
GROUP BY arrival_date_year
ORDER BY arrival_date_year;

