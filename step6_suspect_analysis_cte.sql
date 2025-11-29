SELECT ev.evidence_id, ev.description, ev.found_time,
       k.log_id, k.employee_id, e.name, k.entry_time, k.exit_time
FROM evidence ev
LEFT JOIN keycard_logs k
  ON ev.room = k.room
     AND k.entry_time <= ev.found_time
     AND (k.exit_time IS NULL OR k.exit_time >= ev.found_time)
LEFT JOIN employees e ON k.employee_id = e.employee_id
WHERE ev.room = 'CEO Office'
ORDER BY ev.found_time;
