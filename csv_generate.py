import os
import csv
import subprocess
import time  # To track scanning times

# Path to the APK analyzer script
analyzer_script = "./apk_analyzer.sh"
# Path to the APK files folder
apk_folder = "./Apk_files"
# Output CSV file path
output_csv = "./scanning_results.csv"
# Vulnerability checks (as per the output from your script)
csv_header = [
    "file name", "Hardcoded Secrets", "APK Debuggable", "Allow Backup Enabled",
    "Exported Activities", "Insecure Permissions", "Unencrypted SharedPreferences",
    "ProGuard Mapping File", "Clear Text Traffic Allowed", "Weak Encryption (AES/ECB)",
    "WebView SSL Validation Disabled", "SSL Certificate Pinning", "JavaScript Interfaces in WebViews",
    "Use of Deprecated APIs", "Presence of Native Code", "Sensitive Data in Shared Preferences", "Excessive Permissions"
]
# List to store results for each APK
results_list = []
# Variables to track total and average scanning time
total_time = 0
scan_count = 0

# Iterate through APK files in the folder
for idx, apk_file in enumerate(os.listdir(apk_folder)):
    if apk_file.endswith(".apk"):
        apk_path = os.path.join(apk_folder, apk_file)
        
        # Print scanning progress
        print(f"{idx + 1}. Scanning {apk_file}....")
        
        # Start the timer for the scan
        start_time = time.time()
        
        # Run the APK analyzer script
        command = [analyzer_script, "-f", apk_path]
        result = subprocess.run(command, capture_output=True, text=True)
        result_lines = result.stdout.split("\n")
        
        # End the timer after the scan completes
        end_time = time.time()
        
        # Calculate the scanning time for this APK
        scan_time = end_time - start_time
        total_time += scan_time
        scan_count += 1
        
        # Initialize results for this APK
        apk_results = [apk_file]  # The first column will be the APK file name
        
        # Initialize flags for vulnerabilities
        vulnerability_flags = {header: "0" for header in csv_header[1:]}
        
        # Process the output lines
        for line in result_lines:
            # Check for each vulnerability
            if "Hardcoded Secrets" in line:
                vulnerability_flags["Hardcoded Secrets"] = "0" if "Not Vulnerable" in line else "1"
            elif "APK Debuggable" in line:
                vulnerability_flags["APK Debuggable"] = "0" if "Not Vulnerable" in line else "1"
            elif "Allow Backup Enabled" in line:
                vulnerability_flags["Allow Backup Enabled"] = "0" if "Not Vulnerable" in line else "1"
            elif "Exported Activities" in line:
                vulnerability_flags["Exported Activities"] = "0" if "Not Vulnerable" in line else "1"
            elif "Insecure Permissions - " in line:
                vulnerability_flags["Insecure Permissions"] = "0" if "Not Vulnerable" in line else "1"
            elif "Unencrypted SharedPreferences" in line:
                vulnerability_flags["Unencrypted SharedPreferences"] = "0" if "Not Vulnerable" in line else "1"
            elif "ProGuard Mapping File" in line:
                vulnerability_flags["ProGuard Mapping File"] = "0" if "Not Vulnerable" in line else "1"
            elif "Clear Text Traffic Allowed" in line:
                vulnerability_flags["Clear Text Traffic Allowed"] = "0" if "Not Vulnerable" in line else "1"
            elif "Weak Encryption (AES/ECB)" in line:
                vulnerability_flags["Weak Encryption (AES/ECB)"] = "0" if "Not Vulnerable" in line else "1"
            elif "WebView SSL Validation" in line:
                vulnerability_flags["WebView SSL Validation Disabled"] = "0" if "Not Vulnerable" in line else "1"
            elif "SSL Certificate Pinning" in line:
                vulnerability_flags["SSL Certificate Pinning"] = "0" if "Not Vulnerable" in line else "1"
            elif "JavaScript Interfaces in WebViews" in line:
                vulnerability_flags["JavaScript Interfaces in WebViews"] = "0" if "Not Vulnerable" in line else "1"
            elif "Use of Deprecated APIs" in line:
                vulnerability_flags["Use of Deprecated APIs"] = "0" if "Not Vulnerable" in line else "1"
            elif "Presence of Native Code" in line:
                vulnerability_flags["Presence of Native Code"] = "0" if "Not Vulnerable" in line else "1"
            elif "Sensitive Data in Shared Preferences - " in line:
                vulnerability_flags["Sensitive Data in Shared Preferences"] = "0" if "Not Vulnerable" in line else "1"
            elif "Excessive Permissions - " in line:
                vulnerability_flags["Excessive Permissions"] = "0" if "Not Vulnerable" in line else "1"
        
        # Append vulnerability flags to the results
        apk_results.extend([vulnerability_flags[header] for header in csv_header[1:]])
        results_list.append(apk_results)

# Write results to CSV file
with open(output_csv, "w", newline="") as csvfile:
    csv_writer = csv.writer(csvfile)
    csv_writer.writerow(csv_header)  # Write the CSV header
    csv_writer.writerows(results_list)  # Write the rows of results

# Calculate and display total and average scanning time
average_time = total_time / scan_count if scan_count > 0 else 0
print(f"\nCSV file generated: {output_csv}")
print(f"Total scanning time: {total_time:.2f} seconds")
print(f"Average scanning time: {average_time:.2f} seconds")
