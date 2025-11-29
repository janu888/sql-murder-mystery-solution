select k.log_id, k.employee_id, e.name, k.room, k.entry_time, k.exit_time
from keycard_logs k
join 
employees e on k.employee_id=e.employee_id
where k.room='CEO Office' and k.entry_time between '2025-10-15 20:40:00' AND '2025-10-15 21:10:00'
order by k.entry_time;