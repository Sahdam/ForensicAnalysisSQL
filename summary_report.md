# 🕵️ Forensic Case Report: The Murder of Roland Greene

## 🎯 Case Overview

**Victim:** Roland Greene — a renowned art collector  
**Incident:** Found dead at exactly **8:00 PM** in the **Vault Room** of his private estate  
**Date:** During a private estate auction with ~30 guests  
**Key Evidence:**  
- Gunshot heard at 20:00  
- Phone call received by the victim at 19:55  
- Security feed cut off shortly after 20:00  
- All guests claimed alibis

---

## 🔍 Objective

Use digital forensic data (SQL-accessible) to:
1. Identify inconsistencies in alibis
2. Track access movement to restricted rooms
3. Cross-reference call history with timeline
4. Determine the likely killer

---

## 🗂️ Data Summary

| Table             | Description                                        |
|------------------|----------------------------------------------------|
| `access_logs`     | Logs of door access attempts (time, success, room)|
| `call_records`    | Call time, duration, recipient relation            |
| `suspects`        | Suspect profiles, alibis, and victim relations    |
| `forensic_events` | Timeline of key forensic events (e.g., gunshot)   |

---

## 📈 Methodology

- Separated `date` and `time` from `datetime` fields for granular analysis
- Focused time window: **19:40 – 20:10** (events before and after the murder)
- Isolated door entries to the **Vault Room** and **Office**
- Checked for **calls made to the victim**
- Cross-referenced **alibis** with **access logs**

---

## 👤 Key Suspect: Jamie Bennett

| Detail                          | Evidence                                                                 |
|----------------------------------|--------------------------------------------------------------------------|
| **Access Time (Vault Room)**     | Entered **Vault Room at 20:00** — exact time of gunshot                 |
| **Access Time (Office)**         | Accessed **Office shortly after 20:00** — likely cut security feed      |
| **Alibi**                        | Claimed to be **at home** during murder                                 |
| **Contradiction**               | Access logs place him **inside the estate at time of death**            |
| **Call Activity**                | Made a call to the **victim at 19:55**, 5 minutes before death          |

---

## 🧠 Conclusion

- **Jamie Bennett** is the only individual who:
  - Entered the **Vault Room at the time of the gunshot**
  - Was in the **Office when the security feed went down**
  - Lied about his **alibi**
  - Had a **recent, direct call** with the victim

**🔒 Verdict: Jamie Bennett is the prime suspect and likely the killer.**

---

## 👨‍💻 Analyst

**Yusuf Olayinka**  
Forensic Data Analyst  
yusufolayinka92@gmail.com

Add summary report for forensic SQL analysis
