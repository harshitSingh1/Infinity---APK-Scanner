# APK Vulnerability Scanner

![banner](https://github.com/user-attachments/assets/23ce7c70-d7e7-4af6-9262-e6e70398e435)
*A comprehensive tool for static analysis of Android APK files to detect 16 potential security vulnerabilities.*

---

## 📋 Table of Contents
1. [Introduction](#introduction)
2. [Features](#features)
3. [Installation](#installation)
4. [Usage](#usage)
5. [Project Structure](#project-structure)
6. [Vulnerabilities Detected](#vulnerabilities-detected)
7. [Results and Performance](#results-and-performance)
8. [Screenshots](#screenshots)
9. [Contributing](#contributing)

---

## 💡 Introduction

**APK Vulnerability Scanner** is a static analysis tool designed to enhance the security of Android applications by identifying potential vulnerabilities in APK files. This tool scans APKs for misconfigurations, security loopholes, and poor coding practices that might expose sensitive data or functionalities.

---

## ✨ Features

- **16 Vulnerabilities Detected**: Including hardcoded secrets, insecure permissions, weak encryption, and more.
- **CSV Report Generation**: Generates detailed scanning results in a `.csv` file for further analysis.
- **Ease of Use**: Operates through a simple command-line interface.
- **Batch Processing**: Supports analyzing multiple APK files in one go.
- **Customizable**: Modify the scripts to add new vulnerability checks as needed.

---

## 🛠 Installation

1. Clone this repository to your local machine:
   ```bash
   git clone https://github.com/harshitSingh1/Infinity---APK-Scanner.git
   cd Infinity---APK-Scanner
   ```
2. Install dependencies:
   ```bash
   sudo apt-get install aapt unzip grep
   ```
3. Make the script executable:
   ```bash
   chmod +x apk_analyzer.sh
   ```
   
---

## 🚀 Usage
4. To analyze a single APK file:
   ```bash
   ./apk_analyzer.sh -f /path/to/your.apk
   ```
5. To analyze multiple APKs, place them in the Apk_files directory and run:
   ```bash
   python3 csv_generate.py
   ```
6. To generate graphs:
   ```bash
   python3 graph.py
   ```

---

## 📂 Project Structure
```bash
📂 APK_Vulnerability_Scanner
├── 📂 Apk_files
│   └── 📂 80+ APK files
├── apk_analyzer.sh
├── csv_generate.py
├── scanning_results.csv
└── graph.py
```

---

## 🛡 Vulnerabilities Detected
1. Hardcoded Secrets
2. APK Debuggable Mode Enabled
3. Allow Backup Enabled
4. Exported Activities
5. Insecure Permissions
6. Unencrypted SharedPreferences
7. ProGuard Mapping File Missing
8. Cleartext Traffic Allowed
9. Weak Encryption (AES/ECB)
10. WebView SSL Validation Disabled
11. Lack of SSL Certificate Pinning
12. JavaScript Interfaces in WebViews
13. Use of Deprecated APIs
14. Presence of Native Code
15. World-Readable/Writable Files
16. Excessive Permissions

---

## 📊 Results and Performance
- Total Scanning Time: 43.92 seconds for 80 APK files.
- Average Scanning Time: 0.59 seconds per APK.
- Output: Scanning results are saved in scanning_results.csv for easy reference.

---

## 🖼 Screenshots
1. APK Scanning Tool
![Screenshot 2024-11-17 183302](https://github.com/user-attachments/assets/3a0807b3-8af5-44d3-b620-5d04a27fa1df)

2. List of APK Files
![Screenshot 2024-11-17 184534](https://github.com/user-attachments/assets/414b8843-99cf-4bdf-a5c5-6a606f4a708e)

3. Bar Graph: Vulnerabilities vs Number of APKs
![Screenshot 2024-11-17 211957](https://github.com/user-attachments/assets/b10de408-14d2-42d1-8bd6-ed73564585ec)

4. Pie Chart: Vulnerability Distribution
![Screenshot 2024-11-17 212305](https://github.com/user-attachments/assets/06097c05-9faa-4a93-935c-2580191836a7)

---

## 💌 Contributing
Contributions are welcome! If you have ideas for improving this project or adding new features, feel free to fork this repository and submit a pull request.


