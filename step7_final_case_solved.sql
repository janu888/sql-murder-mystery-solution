WITH crime_window AS (
    SELECT 
        MIN(found_time) AS crime_start,
        MAX(found_time) AS crime_end
    FROM evidence
    WHERE room = 'CEO Office'
),

ordered_people AS (
    SELECT 
        k.employee_id,
        e.name,
        k.exit_time
    FROM keycard_logs k
    JOIN employees e ON k.employee_id = e.employee_id
    JOIN crime_window cw
    WHERE k.room = 'CEO Office'
      AND k.exit_time <= cw.crime_end
    ORDER BY k.exit_time DESC
)

SELECT name AS killer
FROM ordered_people
LIMIT 1;
