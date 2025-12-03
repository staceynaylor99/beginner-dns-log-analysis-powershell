# Beginner Cybersecurity Project — DNS Log Analysis & PowerShell Automation  
**Environment:** Windows 11 VM (Parallels), Logs collected from `Microsoft-Windows-DNS-Client/Operational`

---

## **Goal of the Project**
The objective of this project is to practice basic log analysis using Windows Event Viewer and to automate DNS event collection using a PowerShell script. These are foundational skills for SOC analysts, blue team defenders, and anyone working with system-level telemetry.

---

## **What I Did**
### **1. Enabled DNS Client Logging**
- Navigated to Event Viewer → Applications and Services Logs → Microsoft → Windows → **DNS Client Events** → *Operational*
- Confirmed the log was active and began generating new DNS events.

### **2. Generated DNS Activity**
To create meaningful log entries:
- Opened Microsoft Edge
- Browsed multiple websites (`bing.com`, `wikipedia.org`, `msn.com`)
- Returned to the log and refreshed to confirm events populated (Event IDs like **3008**, **3010**, **3011**, **3020**)

### **3. Filtered the Log Manually**
- Used **Filter Current Log…**
- Focused on DNS-related event IDs: `3008, 3010, 3011, 3012, 3020`
- Verified that DNS queries showed domains, reverse DNS lookups, options, and query results

### **4. Wrote and Executed a PowerShell Script**
- Created `Get-DnsEvents.ps1` inside the `/scripts` folder  
- The script:
  - Looks back a specified number of minutes  
  - Pulls DNS Client Events using `Get-WinEvent`  
  - Selects useful fields (timestamp, ID, provider, message)  
  - Saves output to a timestamped CSV under `/logs`  

### **5. Execution Issues and Fix**
- Initially hit PowerShell execution policy restrictions  
- Resolved by running:

  ```powershell
  Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
