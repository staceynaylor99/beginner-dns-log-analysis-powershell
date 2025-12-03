# Beginner Cybersecurity Project — DNS Log Analysis & PowerShell Script

This project focuses on analyzing Windows DNS Client logs and automating the collection of DNS events using a custom PowerShell script. It demonstrates foundational skills used in security operations (SOC), detection engineering, and log analysis.

---

##  Project Overview

This lab walks through:
- Enabling Windows DNS Client event logging  
- Generating DNS activity through normal browsing  
- Filtering DNS events using Event Viewer  
- Automating DNS event collection using a PowerShell script  
- Exporting results into a timestamped CSV for future analysis  

This is a realistic entry-level project suitable for building a cybersecurity portfolio.

---

##  Environment

- **Windows 11 VM** (running in Parallels on macOS)
- **Event Source:** `Microsoft-Windows-DNS-Client/Operational`
- **Tools Used:**  
  - Windows Event Viewer  
  - PowerShell (Get-WinEvent, Export-Csv)  
  - Notepad (script creation)  

---

##  Project Structure

