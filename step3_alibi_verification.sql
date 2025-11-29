SELECT a.alibi_id, a.employee_id, emp.name, a.claimed_location, a.claim_time
FROM alibis a
JOIN employees emp ON a.employee_id = emp.employee_id
WHERE a.claim_time BETWEEN '2025-10-15 20:40:00' AND '2025-10-15 21:10:00'
ORDER BY a.claim_time;