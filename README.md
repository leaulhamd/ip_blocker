# IP Blocker Tool

## Overview
The **IP Blocker Tool** is a defensive script designed to protect systems by blocking suspicious or malicious IP addresses. This tool, developed by Moeen, leverages `iptables` to deny communication from specific IPs or IP ranges. It helps secure your system by allowing you to manage and monitor blocked IPs effectively.

---

## Features
- Block individual or multiple IP addresses and IP ranges.
- Display all currently blocked IPs.
- Log blocked IPs to a report file for reference.
- Easy-to-use interactive menu.

---

## Instructions for Running
1. **Download or Clone the Script**: Save the script file as `ip_blocker.sh` in your desired directory.

2. **Grant Execution Permissions**:
   ```bash
   chmod +x ip_blocker.sh
   ```

3. **Run the Script with Root Privileges**:
   ```bash
   sudo ./ip_blocker.sh
   ```

4. **Follow the On-Screen Menu**:
   - Input the IPs or ranges to block (comma-separated).
   - View blocked IPs or add more IPs to the blocklist.

---

## Dependencies and Prerequisites
- **Linux Environment**: Tested on Kali Linux.
- **Root Access**: Required for executing `iptables` commands.
- **iptables**: Pre-installed on most Linux distributions.

---

## Files Generated
- **`ip_block_report.log`**: A log file saved in the script's directory that records all blocked IPs.

---

## Example Usage
### Blocking IPs
- Enter single or multiple IPs (e.g., `192.168.0.1, 203.0.113.0/24`).
- The script will execute `iptables` commands to block these IPs and log the results.

### Viewing Blocked IPs
- Choose the option to display all currently blocked IPs. The script will retrieve and show the `DROP` rules from `iptables`.

---

## Note
- Use the script responsibly to avoid unintended network disruptions.
- Ensure you understand the implications of blocking IP ranges on your system's connectivity.

---

Developed by Moeen.

