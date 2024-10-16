#!/bin/bash

# Define the list of potentially malicious extensions
EXTENSIONS=(
    "exe" "bat" "cmd" "com" "msi" "dll" "scr" "vbs" "ps1"
    "sh" "bash" "py" "pl" "rb" "php" "js" "jsp" "asp" "hta" "wsf" "psm1"
    "zip" "rar" "7z" "tar.gz" "iso"
    "docm" "xlsm" "pptm" "doc" "xls"
    "jar" "class" "pyc" "apk" "iso" "lnk" "bin" "reg" "inf" "sys" "drv" "ocx" "psd1"
    "sql" "csv"
    "html" "php" "cgi" "jsp" "aspx" "json"
)

# Function to scan a directory for files with the specified extensions
scan_directory() {
    local DIR=$1
    echo "Scanning directory: $DIR"
    for EXT in "${EXTENSIONS[@]}"; do
        # Find files with the current extension and print them
        find "$DIR" -type f -name "*.$EXT" -print
    done
}

# Check if a directory is provided, otherwise use the current directory
if [ -z "$1" ]; then
    DIRECTORY="."
else
    DIRECTORY="$1"
fi

# Check if the directory exists
if [ -d "$DIRECTORY" ]; then
    scan_directory "$DIRECTORY"
else
    echo "Error: Directory $DIRECTORY does not exist."
    exit 1
fi

echo "Scan complete."
