CREATE DATABASE Forensic_db

-- OVERALL VIEW OF THE ACCESS LOGS AND ALSO SPLITING DATE AND TIME COLUMN INTO SEPARATE COLUMNS
SELECT *
FROM Forensic_db.dbo.access_logs

SELECT log_id, suspect_id, CAST(access_time AS date) AS date, 
CAST(access_time AS Time) AS time,door_accessed,success_flag
FROM Forensic_db.dbo.access_logs

-- OVERALL VIEW OF THE CALL RECORDS AND ALSO SPLITING DATE AND TIME COLUMN INTO SEPARATE COLUMNS
SELECT *
FROM Forensic_db.dbo.call_records

SELECT call_id,suspect_id, CAST(call_time AS date) AS date, 
CAST(call_time AS Time) AS time, call_duration, recipient_relation
FROM Forensic_db.dbo.call_records

--  OVERALL VIEW OF THE SUSPECTS DATA
SELECT *
FROM Forensic_db.dbo.suspects

--  OVERALL VIEW OF THE FORENSIC EVENTS AND ALSO SPLITING DATE AND TIME COLUMN INTO SEPARATE COLUMNS
SELECT *
FROM Forensic_db.dbo.forensic_events

SELECT CAST(event_time AS date) AS date,CAST(event_time AS Time) AS time,event_description
FROM Forensic_db.dbo.forensic_events

-- ANALYSIS ACCESS TIME WITHIN THE FORENSIC EVENT WINDOW AND ALSO CALLS WITH VICTIM AS RECIPIENT
SELECT A.log_id, A.suspect_id,
CAST(access_time AS Time) AS accesstime,
S.name,S.relation_to_victim,
S.role,S.alibi,
CAST(C.call_time AS Time) AS calltime,
call_duration,C.recipient_relation,success_flag,door_accessed
FROM Forensic_db.dbo.access_logs A
LEFT JOIN Forensic_db.dbo.suspects S
ON 
	A.suspect_id = S.suspect_id
LEFT JOIN Forensic_db.dbo.call_records C
ON 
	S.suspect_id = C.suspect_id
WHERE CAST(access_time AS Time) BETWEEN '19:40:00.0000000' AND '20:10:00.0000000'
AND CAST(C.call_time AS Time) BETWEEN '19:40:00.0000000' AND '19:57:00.0000000'
--AND door_accessed = 'Vault Room'
AND success_flag = 1
AND recipient_relation = 'Victim'
ORDER BY CAST(access_time AS Time)

--ANALYSING ACCESS TIME WITHIN THE FORENSIC EVENT WINDOW AND SUSPECTS THAT SUCCESSFULLY ACCESSED THE VAULT ROOM
SELECT A.log_id, A.suspect_id,
CAST(access_time AS Time) AS accesstime,
S.name,S.relation_to_victim,
S.role,S.alibi,
CAST(C.call_time AS Time) AS calltime,
call_duration,C.recipient_relation,success_flag,door_accessed
FROM Forensic_db.dbo.access_logs A
LEFT JOIN Forensic_db.dbo.suspects S
ON 
	A.suspect_id = S.suspect_id
LEFT JOIN Forensic_db.dbo.call_records C
ON 
	S.suspect_id = C.suspect_id
WHERE CAST(access_time AS Time) BETWEEN '19:40:00.0000000' AND '20:10:00.0000000'
AND door_accessed = 'Vault Room'
AND success_flag = 1
ORDER BY CAST(access_time AS Time)

--NARROWING DOWN ANALYSIS TO WHEN THE GUNSHOT WAS HEARD; ONLY ONE NAME CAME UP: 'JAMIE BENNETT'---> LIKELY SUSPECT
SELECT A.log_id, A.suspect_id,
CAST(access_time AS Time) AS accesstime,
S.name,S.relation_to_victim,
S.role,S.alibi,
CAST(C.call_time AS Time) AS calltime,
call_duration,C.recipient_relation,success_flag,door_accessed
FROM Forensic_db.dbo.access_logs A
LEFT JOIN Forensic_db.dbo.suspects S
ON 
	A.suspect_id = S.suspect_id
LEFT JOIN Forensic_db.dbo.call_records C
ON 
	S.suspect_id = C.suspect_id
WHERE CAST(access_time AS Time) = '20:00:00.0000000'
AND door_accessed = 'Vault Room'
AND success_flag = 1
ORDER BY CAST(access_time AS Time)

-- ALSO LOOKING AT SUSPECT THAT HAVE ACCESS TO THE OFFICE, LIKELY WHERE THE SECURITY FEED WAS CUT OFF, WITHIN THE GUNSHOT AND CUT OFF WINDOW; 'JAMIE BENNETT' SHOW UP AGAIN
SELECT A.log_id, A.suspect_id,
CAST(access_time AS Time) AS accesstime,
S.name,S.relation_to_victim,
S.role,S.alibi,
CAST(C.call_time AS Time) AS calltime,
call_duration,C.recipient_relation,success_flag,door_accessed
FROM Forensic_db.dbo.access_logs A
LEFT JOIN Forensic_db.dbo.suspects S
ON 
	A.suspect_id = S.suspect_id
LEFT JOIN Forensic_db.dbo.call_records C
ON 
	S.suspect_id = C.suspect_id
WHERE CAST(access_time AS Time) BETWEEN '20:00:00.0000000' AND '20:07:00.0000000'
AND door_accessed = 'Office'
AND success_flag = 1
ORDER BY CAST(access_time AS Time)

-- TAKING A CLOSER LOOK AT 'JAMIE BENNETT'; ACCESS TIME, DOOR ACCESSED AND ALIBI. 
--JAMIE BENNETT SHOULD FURTHER INVESTIGATED AS HE LIED HE WAS AT HOME, WHILE RECORDS SHOWS HE WAS AT CRIME SCENE DURING THE MURDER
SELECT A.log_id,A.access_time,A.suspect_id,S.name,A.door_accessed,S.role,S.alibi,A.success_flag
FROM Forensic_db.dbo.access_logs A
LEFT JOIN Forensic_db.dbo.suspects S
ON A.suspect_id = S.suspect_id
WHERE S.name LIKE 'Jamie B%'


/* Conclusion: Jamie Bennett accessed the Vault Room at 20:00 — the exact time of the gunshot — and was later in the Office, likely cutting off the security feed.
He falsely claimed to be at home, contradicting his access logs. He is the only suspect matching this evidence profile. Therefore, Jamie Bennett is the likely killer. */
