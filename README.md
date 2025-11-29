🕵️‍♀️ SQL Murder Mystery — Complete Case Solved

Welcome to the official repository of the SQL Murder Mystery Capstone Project.
This project walks through a complete crime investigation using SQL — analyzing evidence, verifying alibis, and tracking digital footprints to uncover who killed the CEO.

The investigation is broken down into 7 steps, each supported with queries, findings, and case notes.

Dive in, detective. Let’s crack this case. 🔍

🔧 Folder Structure
sql-murder-mystery-solution/
│
├── README.md
│
├── step1_crime_evidence_overview.sql
├── step2_ceo_office_access_logs.sql
├── step3_alibi_verification.sql
├── step4_call_activity_analysis.sql
├── step5_evidence_movement_correlation.sql
├── step6_suspect_analysis_cte.sql
├── step7_final_case_solved.sql
│
├── screenshots/
│   ├── evidence_overview.png
│   ├── keycard_logs.png
│   ├── alibi_records.png
│   ├── call_activity.png
│   ├── evidence_correlation.png
│   ├── suspect_cte_analysis.png
│   ├── final_verdict.png
│
└── SQL_Murder_Mystery.sql   ← (dataset file)


(You can add your screenshots later inside the screenshots/ folder.)

🕵️ 1. Introduction

This project simulates a real-world data investigation where the CEO of TechNova Inc. is found dead in their office.
Using SQL queries alone, we uncover:

When and where the crime occurred

Who was present around the crime time

Who lied in alibis

Suspicious call activities

Movement patterns

Final suspect matching all evidence

By the end of the investigation, we identify the killer with strong SQL-backed proof.

🗂️ 2. Scenario Summary

On October 15, 2025, around 9:00 PM, the CEO was murdered inside the CEO Office.
All investigation clues were stored in database tables:

employees

keycard_logs

calls

alibis

evidence

Your job as the lead analyst?
Use SQL to reconstruct the timeline and uncover the murderer.

🗃️ 3. Database Used

All tables were created using the dataset file:

📄 SQL_Murder_Mystery.sql

This file contains:

Table creation scripts

Insert statements for all evidence, logs, and metadata

🧩 4. Investigation Steps

Below is the full investigation, step-by-step.

🕵️ Step 1 — Crime Evidence Overview
✔️ What we are doing

Identify where, when, and what evidence was found to establish the crime timeline.

📝 Query
SELECT evidence_id, room, description, found_time
FROM evidence
ORDER BY found_time;

🔍 Findings

First evidence found at 21:05 → fingerprint on desk

Second evidence at 21:10 → keycard swipe mismatch

Both inside CEO Office

👉 Crime occurred shortly before 21:00, inside the CEO Office.

🕵️ Step 2 — CEO Office Access Logs
✔️ What we are doing

Check who accessed the CEO Office between 20:40 and 21:10.

📝 Query
select k.log_id, k.employee_id, e.name, k.room, k.entry_time, k.exit_time
from keycard_logs k
join employees e on k.employee_id = e.employee_id
where k.room='CEO Office' 
  and k.entry_time between '2025-10-15 20:40:00' AND '2025-10-15 21:10:00'
order by k.entry_time;

🔍 Findings

Only David Kumar entered the CEO Office (20:50–21:00)

👉 He is the only person physically present during the crime window.

🕵️ Step 3 — Alibi Verification
✔️ What we are doing

Check if David's claimed alibi conflicts with keycard logs.

📝 Query
SELECT a.alibi_id, a.employee_id, emp.name, a.claimed_location, a.claim_time
FROM alibis a
JOIN employees emp ON a.employee_id = emp.employee_id
WHERE a.claim_time BETWEEN '2025-10-15 20:40:00' AND '2025-10-15 21:10:00'
ORDER BY a.claim_time;

🔍 Findings

David claimed he was in the Server Room at 20:50

But keycard logs show he was in CEO Office at 20:50

👉 False alibi detected.

🕵️ Step 4 — Call Activity Analysis
✔️ What we are doing

Check if any suspicious calls were made during the crime window.

📝 Query
SELECT c.call_id, c.caller_id, caller.name AS caller_name,
       c.receiver_id, receiver.name AS receiver_name,
       c.call_time, c.duration_sec
FROM calls c
JOIN employees caller ON c.caller_id = caller.employee_id
JOIN employees receiver ON c.receiver_id = receiver.employee_id
WHERE c.call_time BETWEEN '2025-10-15 20:50:00' AND '2025-10-15 21:00:00'
ORDER BY c.call_time;

🔍 Findings

David made a call at 20:55 while inside the CEO Office

👉 His phone activity places him inside the crime scene during the murder window.

🕵️ Step 5 — Evidence Movement Correlation
✔️ What we are doing

Match evidence timestamps with people present in the room during those moments.

📝 Query
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

🔍 Findings

No one was inside at 21:05 or 21:10, meaning the killer left before discovery

Last person before evidence? David Kumar, who left at 21:00

👉 He was the last known person inside before evidence surfaced.

🕵️ Step 6 — Suspect Timeline CTE Analysis
✔️ What we are doing

Use CTE to identify the last person to leave the crime room before evidence was found.

📝 Query
WITH crime_window AS (
    SELECT 
        MIN(found_time) AS crime_start,
        MAX(found_time) AS crime_end
    FROM evidence
    WHERE room = 'CEO Office'
),

last_person AS (
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
    LIMIT 1
)

SELECT name AS killer
FROM last_person;

🔍 Findings

Final query reveals the killer: David Kumar

👉 His exit time (21:00) is the most recent before the evidence timestamps (21:05–21:10).

🕵️ Step 7 — Final Case Solved
✔️ What we are doing

Confirm the killer using all combined evidence.

📝 Query

(Already in step7_final_case_solved.sql — final verdict query)

🔍 Final Findings

David had:

Exclusive access

A false alibi

A call inside the crime scene

Was last to leave

Fingerprint evidence in the room

🔥 Final Verdict — David Kumar is the Killer

Based on evidence timing, movement logs, call activity, and contradictory alibis, all investigative paths lead to a single conclusion:

David Kumar murdered the CEO.

Case closed. 🕵️‍♂️🗂️
