# 🕵️‍♂️ Forensic SQL Case Analysis — "Who Killed Roland Greene?"

This project is a forensic investigation using SQL to identify the killer in a fictional high-profile murder case involving Roland Greene, an art collector found dead at his estate.

## 🧠 Problem Statement

Roland Greene was murdered at 8:00 PM in the Vault Room. 30 guests attended a private estate auction. Every guest had an alibi. However, one was lying.

Using SQL and structured forensic data, I identified the killer by analyzing:

- Door access logs
- Call records
- Suspect profiles
- Forensic event timelines

## 🗃️ Data Sources

The database contains four tables:
- `access_logs`: Who accessed which room and when.
- `call_records`: Who made calls, to whom, and their relationship.
- `suspects`: Personal info, relationship to victim, roles, and alibis.
- `forensic_events`: Timeline of key forensic occurrences (e.g., gunshot, security feed cutoff).

## 🛠️ Key SQL Skills Demonstrated

- Joins across multiple tables
- Time-based filtering and analysis
- Forensic event reconstruction
- Contradiction detection (alibi vs. logs)
- Logical deduction using relational data

## 🔍 Key Findings

- Jamie Bennett accessed the Vault Room **at 20:00**, the exact time of the gunshot.
- He accessed the **Office** shortly after — coinciding with the **security feed cutoff**.
- His **alibi claims he was at home**, which is **proven false** by access logs.
- Jamie also called the **victim directly at 19:55**, five minutes before the murder.

**💥 Conclusion: Jamie Bennett is the likely killer.**

## 📂 Files Included

- `forensic_analysis.sql`: All SQL queries used in the investigation
- `summary_report.md`: Case summary with conclusion
- `data/`: four csv data files

## 👨‍💻 Author

Yusuf Olayinka  
Data Analyst
yusufolayinka92@gmail.com

