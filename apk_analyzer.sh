#!/bin/bash

# Reset
Off='\033[0m'        # Text Reset

# Regular Colors
Black='\033[0;30m'       # Black
Red='\033[0;31m'         # Red
Green='\033[0;32m'       # Green
Yellow='\033[0;33m'      # Yellow
Blue='\033[0;34m'        # Blue
Purple='\033[0;35m'      # Purple
Cyan='\033[0;36m'        # Cyan
White='\033[0;37m'       # White

# Bold
BBlack='\033[1;30m'      # Black
BRed='\033[1;31m'        # Red
BGreen='\033[1;32m'      # Green
BYellow='\033[1;33m'     # Yellow
BBlue='\033[1;34m'       # Blue
BPurple='\033[1;35m'     # Purple
BCyan='\033[1;36m'       # Cyan
BWhite='\033[1;37m'      # White

# Underline
UWhite='\033[4;37m'      # White

# Function: Usage Instructions
banner="
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠂⠐⠈⠀⠈⠐⢀⠂⡐⠠⢀⠀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠀⠄⢀⠀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⣠⣴⣼⣿⣿⣿⣿⣿⣿⣷⣶⣤⣄⣁⠂⠔⣀⠂⡁⠠⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣄⣤⣤⣤⣤⣀⣉⠐⠠⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⣠⣶⣿⣿⣿⣿⡿⠿⠿⠿⠿⣿⣿⣿⣿⣿⣿⣷⣦⣄⠑⠤⡁⢂⠡⠐⠀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡠⠐⠊⠀⠀⠀⠀⠀⠀⠉⠛⠿⣿⣦⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⢀⣼⣿⣿⠿⠋⡉⢄⠐⠒⢂⠓⠲⠰⢤⣉⠛⠿⣿⣿⣿⣿⣿⣦⡐⠂⡄⠁⠂⠄⡐⠀⡀⠀⠀⠀⠀⠀⠀⡀⢀⠠⠀⠀⠠⠄⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠐⠀⠠⠙⣿⣯⣆⠀⠀⠀⠀⠀⠀⠀
⠀⠀⢠⣾⣿⠟⠁⠀⠀⢀⠂⠌⡐⢀⠊⢁⠒⡠⢀⠋⠱⢢⡙⠻⣿⣿⣿⣿⣦⡀⢃⠀⢆⠠⢁⠠⠐⠀⠠⠀⢀⠔⠠⢀⠂⠀⠌⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠁⠌⠻⣿⣧⡄⠀⠀⠀⠀⠀
⠐⠀⣾⣿⠃⠀⠀⠀⠠⠀⠐⠠⢀⠂⠌⡀⢂⠁⠆⡡⢂⠀⠘⠱⣌⠹⢿⣿⣿⣿⣦⠐⣈⠒⡄⢂⠌⠠⠁⡰⢈⠄⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢆⠻⣿⣷⡄⠀⠀⠀⠀
⠀⢸⣿⡏⠀⠀⠀⠈⠀⠠⠀⠐⠀⡀⢂⠐⠠⢈⠐⠠⢁⠒⡠⠀⠈⠱⣌⠹⣿⣿⣿⣷⣄⠱⡐⡈⠆⢁⠴⡁⢎⠀⡰⠈⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠠⠄⢿⣿⣷⠀⠀⠀⠀
⠁⢨⣿⠀⠀⠀⠀⠀⠀⠀⠀⠂⠀⢀⠀⠄⠁⠠⢈⠐⠠⢁⠰⢁⠂⢀⠈⠓⡌⢻⣿⣿⣿⣶⡘⠐⣠⢋⠖⡩⠀⠐⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠀⠀⠀⢂⢸⣿⣿⠄⠀⠀⠀
⠄⢘⣿⡀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠀⠀⢀⠈⠀⠄⠈⡐⢀⠂⠄⠉⠤⠀⠀⠙⢢⠙⣿⣿⣻⡿⠀⠏⡈⠎⢠⠂⠀⠌⠠⠐⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠄⠀⠀⠐⠀⢨⢘⣿⣿⠃⠀⠀⠀
⠂⠈⢿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠠⠀⠂⠀⠠⢀⠈⠄⠀⠣⠐⠀⠀⠑⡈⠻⠟⣠⡏⠅⠀⠐⠁⢠⠉⠄⠡⢀⠂⢀⠐⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠀⠄⠀⠠⠁⠀⠀⠀⢸⣿⣿⠁⠀⠀⠀
⠐⠀⠘⣿⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠠⠀⠡⠐⡉⢄⡀⠄⢠⡴⠞⠁⡦⠁⣸⣄⠘⡀⢘⠨⡐⠠⠐⠀⡀⠠⠐⠀⠀⠂⠀⠀⠀⠐⠀⢀⠀⠀⠠⠐⠀⠀⠀⠀⠀⢀⣿⣿⡏⠀⠀⠀⠀
⠀⠡⠀⠘⢷⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠁⠀⠡⠐⡀⠆⢀⡴⠏⡀⠀⠡⠁⣾⣿⣿⣷⣄⠂⢀⠰⠁⠌⡐⢀⠐⢀⠀⠂⢀⠈⠀⠄⠀⡀⠀⠂⠀⠄⠂⠀⠀⢀⠈⣼⣿⡿⠀⠀⠀⠀⠀
⠀⠀⠂⢀⠈⠻⣦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡀⠡⠀⠁⣠⠴⠋⡄⠆⠁⠀⠈⠤⡙⢿⣿⣿⣿⣷⣄⠃⢆⡈⠐⠠⢈⠀⡐⠀⠂⠀⠄⠂⢀⠀⠐⠀⠁⠀⢠⠈⢀⣾⣿⡿⠁⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠂⠀⠈⠛⢶⣤⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⡠⠴⠋⢠⠐⡱⠈⠀⠀⠠⠀⠀⠑⢢⠙⢿⣿⣿⣿⣷⣦⣈⠱⢀⠆⡐⡀⠡⠈⠄⢂⠐⡀⢈⠀⡄⢢⠉⢂⣴⣿⣿⠟⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠁⠠⠀⠀⠀⠉⠛⠒⠶⠤⠤⠤⠤⠤⠦⠔⠚⠉⠁⠀⠄⡐⢂⠡⠀⠁⠀⠀⠁⠂⠄⠀⠀⠉⠆⡙⠿⣿⣿⣿⣿⣷⣶⣬⣁⣈⡁⠣⠄⠒⠄⠃⣘⣠⣴⣾⣿⡿⠟⠁⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠈⠀⠄⠀⠠⠀⢀⠀⡀⠀⠀⠀⠀⠠⠀⠂⠁⠐⠀⠀⠀⠀⠀⠀⠀⠀⠀⠠⠈⠀⡀⠀⠐⠠⢈⠙⠿⣿⣿⣿⣿⣿⣿⣟⣿⣿⣿⣿⣿⣻⣿⡿⠿⠛⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠄⠀⡈⠙⠛⠛⠟⠿⢻⠛⠟⠋⠛⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀

"
usage() {
    echo -e "${Off}${banner}${Off}"
    echo -e "${BBlue}Usage:${Off}"
    echo -e "${BGreen}$(basename "$0") -f <apk_file_path>${Off}"
    echo
    echo -e "${BBlue}Description:${Off}"
    echo -e "This script performs static analysis on an Android APK file to check for potential security vulnerabilities."
    echo
    echo -e "${BBlue}Arguments:${Off}"
    echo -e "  -f, --file     Path to the APK file to analyze (required)"
    echo -e "  -h, --help     Display this help message"
    echo
    echo -e "${BBlue}Examples:${Off}"
    echo -e "  ${BGreen}$(basename "$0") -f /path/to/your/app.apk${Off}   # Analyze the specified APK file"
    echo -e "  ${BGreen}$(basename "$0") --file /path/to/your/app.apk${Off}   # Analyze the APK file using the long option"
    echo
    exit 0
}


# Check if user has required tools installed (aapt, unzip, grep, strings)
check_dependencies() {
    local dependencies=("aapt" "unzip" "grep" "strings")
    for dep in "${dependencies[@]}"; do
        if ! command -v "$dep" &> /dev/null; then
            echo -e "${BRed}Error: $dep is not installed. Please install it.${Off}"
            exit 1
        fi
    done
}

# Extract APK information using aapt
extract_apk_info() {
    echo -e "${BGreen}[*] Extracting APK information...${Off}"
    aapt dump badging "$apk_file" | grep "package:\|application-label:\|uses-permission:"
    echo -e ""
}

# Vulnerability: Hardcoded Secrets
check_hardcoded_secrets() {
    echo -e  "${BWhite}1) Scanning Hardcoded Secrets: ${Off}Searching for API keys, passwords, etc."
    echo -n -e "${Cyan}Hardcoded Secrets - ${Off}"
    result=$(unzip -p "$apk_file" | strings | grep -Ei 'api[_]?key|secret|password|token|username')
    if [ -n "$result" ]; then
        echo -e "${BRed}Vulnerable${Off}"
    else
        echo -e "${BGreen}Not Vulnerable${Off}"
    fi
    echo -e "\n"
}

# Vulnerability: APK Debuggable
check_debuggable_apk() {
    echo -e "${BWhite}2) Scanning APK Debuggable: ${Off}Checking if the APK is built in debug mode."
    echo -n -e "${Cyan}APK Debuggable - ${Off}"
    result=$(aapt dump badging "$apk_file" | grep "application-debuggable")
    if [ -n "$result" ]; then
        echo -e "${BRed}Vulnerable${Off}"
    else
        echo -e "${BGreen}Not Vulnerable${Off}"
    fi
    echo -e "\n"
}

# Vulnerability: Allow Backup
check_allow_backup() {
    echo -e "${BWhite}3) Scanning Allow Backup Enabled: ${Off}Checking if the allowBackup flag is set to true (potentially insecure)."
    echo -n -e "${Cyan}Allow Backup Enabled - ${Off}"
    result=$(unzip -p "$apk_file" AndroidManifest.xml | strings | grep -i "android:allowBackup=\"true\"")
    if [ -n "$result" ]; then
        echo -e "${BRed}Vulnerable${Off}"
    else
        echo -e "${BGreen}Not Vulnerable${Off}"
    fi
    echo -e "\n"
}

# Vulnerability: Exported Activities
check_exported_activities() {
    echo -e "${BWhite}4) Scanning Exported Activities: ${Off}Looking for activities marked as exported=\"true\"."
    echo -n -e "${Cyan}Exported Activities - ${Off}"
    result=$(unzip -p "$apk_file" AndroidManifest.xml | strings | grep -i 'android:exported="true"')
    if [ -n "$result" ]; then
        echo -e "${BRed}Vulnerable${Off}"
    else
        echo -e "${BGreen}Not Vulnerable${Off}"
    fi
    echo -e "\n"
}

# Vulnerability: Insecure Permissions
check_insecure_permissions() {
    echo -e "${BWhite}5) Scanning Insecure Permissions: ${Off}Checking for permissions like INTERNET, ACCESS_NETWORK_STATE, and READ_EXTERNAL_STORAGE which could be misused."
    echo -n -e "${Cyan}Insecure Permissions - ${Off}"
    result=$(aapt dump permissions "$apk_file" | grep -E 'INTERNET|ACCESS_NETWORK_STATE|READ_EXTERNAL_STORAGE')
    if [ -n "$result" ]; then
        echo -e "${BRed}Vulnerable${Off}"
    else
        echo -e "${BGreen}Not Vulnerable${Off}"
    fi
    echo -e "\n"
}

# Vulnerability: Unencrypted SharedPreferences
check_shared_preferences() {
    echo -e "${BWhite}6) Scanning Unencrypted SharedPreferences: ${Off}Identifying whether SharedPreferences are used without encryption."
    echo -n -e "${Cyan}Unencrypted SharedPreferences - ${Off}"
    result=$(unzip -l "$apk_file" | grep -i "shared_prefs")
    if [ -n "$result" ]; then
        echo -e "${BRed}Vulnerable${Off}"
    else
        echo -e "${BGreen}Not Vulnerable${Off}"
    fi
    echo -e "\n"
}

# Vulnerability: Presence of ProGuard Mapping
check_proguard() {
    echo -e "${BWhite}7) Scanning ProGuard Mapping: ${Off}Checking if the APK contains a ProGuard mapping.txt file (lack of it may indicate no obfuscation)."
    echo -n -e "${Cyan}ProGuard Mapping File - ${Off}"
    result=$(unzip -l "$apk_file" | grep -i "mapping.txt")
    if [ -n "$result" ]; then
        echo -e "${BGreen}Not Vulnerable (ProGuard present)${Off}"
    else
        echo -e "${BRed}Vulnerable (No ProGuard)${Off}"
    fi
    echo -e "\n"
}

# Vulnerability: Clear Text Traffic Allowed
check_cleartext_traffic() {
    echo -e "${BWhite}8) Scanning Clear Text Traffic Allowed: ${Off}Checking if usesCleartextTraffic is set to true in the manifest."
    echo -n -e "${Cyan}Clear Text Traffic Allowed - ${Off}"
    result=$(unzip -p "$apk_file" AndroidManifest.xml | strings | grep -i 'android:usesCleartextTraffic="true"')
    if [ -n "$result" ]; then
        echo -e "${BRed}Vulnerable${Off}"
    else
        echo -e "${BGreen}Not Vulnerable${Off}"
    fi
    echo -e "\n"
}

# Vulnerability: Weak Encryption (AES in ECB mode)
check_weak_encryption() {
    echo -e "${BWhite}9) Scanning Weak Encryption (AES in ECB): ${Off}Identifying use of weak encryption algorithms such as AES in ECB mode."
    echo -n -e "${Cyan}Weak Encryption (AES/ECB) - ${Off}"
    result=$(unzip -p "$apk_file" | strings | grep -i "AES/ECB")
    if [ -n "$result" ]; then
        echo -e "${BRed}Vulnerable${Off}"
    else
        echo -e "${BGreen}Not Vulnerable${Off}"
    fi
    echo -e "\n"
}

# Vulnerability: WebView SSL Validation Disabled
check_webview_ssl_validation() {
    echo -e "${BWhite}10) Scanning WebView SSL Validation: ${Off}Checking if SSL validation in WebViews is disabled, which can lead to MITM attacks."
    echo -n -e "${Cyan}WebView SSL Validation Disabled - ${Off}"
    result=$(unzip -p "$apk_file" | strings | grep -i "setWebViewClient")
    if [ -n "$result" ]; then
        echo -e "${BRed}Vulnerable${Off}"
    else
        echo -e "${BGreen}Not Vulnerable${Off}"
    fi
    echo -e "\n"
}
# Vulnerability: SSL Certificate Pinning
check_ssl_certificate_pinning() {
    echo -e "${BWhite}11) Scanning SSL Certificate Pinning: ${Off}Check if SSL certificate pinning is implemented to prevent man-in-the-middle attacks."
    echo -n -e "${Cyan}SSL Certificate Pinning - ${Off}"
    result=$(unzip -p "$apk_file" | strings | grep -i "CertificatePinner")
    if [ -n "$result" ]; then
        echo -e "${BGreen}Not Vulnerable (SSL Pinning Present)${Off}"
    else
        echo -e "${BRed}Vulnerable (No SSL Pinning)${Off}"
    fi
    echo -e "\n"
}

# Vulnerability: JavaScript Interfaces in WebViews
check_javascript_interfaces() {
    echo -e "${BWhite}12) Scanning Presence of JavaScript Interfaces in WebViews: ${Off}Check if any JavaScript interfaces are exposed to WebView, which can lead to JavaScript injection vulnerabilities."
    echo -n -e "${Cyan}JavaScript Interfaces in WebViews - ${Off}"
    result=$(unzip -p "$apk_file" | strings | grep -i "addJavascriptInterface")
    if [ -n "$result" ]; then
        echo -e "${BRed}Vulnerable (JavaScript Interfaces Present)${Off}"
    else
        echo -e "${BGreen}Not Vulnerable${Off}"
    fi
    echo -e "\n"
}

# Vulnerability: Use of Deprecated APIs
check_deprecated_apis() {
    echo -e "${BWhite}13) Scanning Deprecated APIs: ${Off}Check for any deprecated APIs that could lead to security vulnerabilities."
    echo -n -e "${Cyan}Use of Deprecated APIs - ${Off}"
    result=$(unzip -p "$apk_file" | grep -i "deprecated")
    if [ -n "$result" ]; then
        echo -e "${BRed}Vulnerable (Deprecated APIs Found)${Off}"
    else
        echo -e "${BGreen}Not Vulnerable${Off}"
    fi
    echo -e "\n"
}

# Vulnerability: Presence of Native Code
check_native_code() {
    echo -e "${BWhite}14) Scanning Presence of Native Code: ${Off}Check if there are native libraries included, which may be less secure than Java code."
    echo -n -e "${Cyan}Presence of Native Code - ${Off}"
    result=$(unzip -l "$apk_file" | grep -i "\.so")
    if [ -n "$result" ]; then
        echo -e "${BRed}Potential Risk (Native Libraries Present)${Off}"
    else
        echo -e "${BGreen}Not Vulnerable${Off}"
    fi
    echo -e "\n"
}

# Vulnerability: Sensitive Data in Shared Preferences
check_sensitive_data_shared_preferences() {
    echo -e "${BWhite}15) Scanning Sensitive Data in Shared Preferences: ${Off}Check if sensitive data is stored in shared preferences without encryption."
    echo -n -e "${Cyan}Sensitive Data in Shared Preferences - ${Off}"
    result=$(unzip -p "$apk_file" | strings | grep -Ei "password|token|secret" | grep -i "shared_prefs")
    if [ -n "$result" ]; then
        echo -e "${BRed}Vulnerable (Sensitive Data Found)${Off}"
    else
        echo -e "${BGreen}Not Vulnerable${Off}"
    fi
    echo -e "\n"
}

# Vulnerability: Excessive Permissions
check_excessive_permissions() {
    echo -e "${BWhite}16) Scanning Excessive Permissions: ${Off}Check for permissions that are not necessary for the app's functionality."
    echo -n -e "${Cyan}Excessive Permissions - ${Off}"
    result=$(aapt dump permissions "$apk_file" | grep -E 'RECEIVE_BOOT_COMPLETED|READ_SMS|WRITE_SMS|ACCESS_FINE_LOCATION')
    if [ -n "$result" ]; then
        echo -e "${BRed}Vulnerable (Excessive Permissions Found)${Off}"
    else
        echo -e "${BGreen}Not Vulnerable${Off}"
    fi
    echo -e "\n"
}


# Parse command line arguments
while getopts ":f:" opt; do
    case $opt in
        f)
            apk_file="$OPTARG"
            ;;
        *)
            usage
            ;;
    esac
done

# Ensure APK file path is provided
if [ -z "$apk_file" ]; then
    usage
fi

# Check if the APK file exists
if [ ! -f "$apk_file" ]; then
    echo -e "${BRed}Error: APK file not found!${Off}"
    exit 1
fi

# Check dependencies
check_dependencies

# Perform static analysis
echo -e "${BGreen}[*] Starting APK static analysis...${Off}"
extract_apk_info
check_hardcoded_secrets
check_debuggable_apk
check_allow_backup
check_exported_activities
check_insecure_permissions
check_shared_preferences
check_proguard
check_cleartext_traffic
check_weak_encryption
check_webview_ssl_validation
check_ssl_certificate_pinning
check_javascript_interfaces
check_deprecated_apis
check_native_code
check_sensitive_data_shared_preferences
check_excessive_permissions
echo -e ""
echo -e "${BGreen}[*] Analysis complete!${Off}"
