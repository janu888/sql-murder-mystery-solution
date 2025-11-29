🕵️‍♀️ SQL Murder Mystery — Capstone Project
21 Days SQL Challenge by Indian Data Club

This repository contains my complete solution to the SQL Murder Mystery: Who Killed the CEO?, the capstone project for the 21 Days SQL Challenge conducted by Indian Data Club (IDC).

The challenge transforms SQL into a detective investigation where every table acts as a clue — from keycard logs to alibis and call records.
Using structured SQL queries, I identified who killed the CEO, when, where, and how.

📁 Project Structure
sql-murder-mystery-solution/
│
├── queries/
│     ├── step1_crime_evidence_overview.sql
│     ├── step2_ceo_office_access_logs.sql
│     ├── step3_alibi_verification.sql
│     ├── step4_call_activity_analysis.sql
│     ├── step5_evidence_movement_correlation.sql
│     ├── step6_suspect_analysis_cte.sql
│     ├── step7_final_case_solved.sql
│
├── screenshots/
│     └── (MySQL Workbench outputs)
│
└── README.md

📊 Database Tables Involved
1. employees

Stores employee details.
Fields: employee_id, name, department, role

2. keycard_logs

Tracks room entry/exit.
Fields: log_id, employee_id, room, entry_time, exit_time

3. calls

Phone call history.
Fields: caller_id, receiver_id, call_time, duration_sec

4. alibis

Records claimed locations during the crime window.
Fields: employee_id, claimed_location, claim_time

5. evidence

All physical evidence found at the scene.
Fields: room, description, found_time

🧠 Investigation Steps
🟦 Step 1 — Identify Crime Timeline

Extract evidence timestamps and determine the crime window.

🟩 Step 2 — Check Access to CEO Office

Find who entered or exited the CEO’s office around the time of the incident.

🟨 Step 3 — Verify Alibis

Cross-check claimed locations with real movement data.

🟧 Step 4 — Analyze Suspicious Phone Calls

Review calls made around the crime time.

🟥 Step 5 — Match Evidence With Movements

Correlate fingerprint logs, room access, and unusual activity.

🟪 Step 6 — Build Final Suspect Profile (CTEs)

Combine all findings using CTEs to narrow down the culprit.

🟫 Step 7 — Case Solved

Final SQL query to reveal the killer:

SELECT name AS killer FROM last_person;

🎯 Final Verdict:
The killer is: David Kumar

(identified as the last person to exit the CEO Office just before the crime evidence timestamps)

🛠️ How to Run

Import the SQL dataset into MySQL 8+

Open .sql files under the /queries folder

Run each step sequentially

Observe how the clues connect

Run the final query to reveal the killer

🙌 Acknowledgments

A huge thank you to Indian Data Club and DPDZero for organizing this challenge.
The structured tasks and capstone project offered a real-world, hands-on SQL learning experience that will greatly support my future data journey.
