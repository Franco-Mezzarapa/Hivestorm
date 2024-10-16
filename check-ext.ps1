# Define the list of potentially malicious extensions
$extensions = @(
    ".exe", ".bat", ".cmd", ".com", ".msi", ".dll", ".scr", ".vbs", ".ps1",
    ".sh", ".bash", ".py", ".pl", ".rb", ".php", ".js", ".jsp", ".asp", ".hta", ".wsf", ".psm1",
    ".zip", ".rar", ".7z", ".tar.gz", ".iso",
    ".docm", ".xlsm", ".pptm", ".doc", ".xls",
    ".jar", ".class", ".pyc", ".apk", ".iso", ".lnk", ".bin", ".reg", ".inf", ".sys", ".drv", ".ocx", ".psd1",
    ".sql", ".csv",
    ".html", ".php", ".cgi", ".jsp", ".aspx", ".json"
)

# Function to scan the directory for potentially malicious files
function Scan-Directory {
    param (
        [string]$Path
    )

    if (Test-Path $Path) {
        Write-Host "Scanning directory: $Path"
        foreach ($ext in $extensions) {
            # Find and list all files with the specified extensions
            Get-ChildItem -Path $Path -Recurse -Include *$ext -ErrorAction SilentlyContinue | ForEach-Object {
                Write-Host $_.FullName
            }
        }
    }
    else {
        Write-Host "Error: Directory '$Path' does not exist."
    }
}

# Check if a directory is provided as an argument, else use the current directory
$directory = $args[0]
if (-not $directory) {
    $directory = Get-Location
}

# Scan the directory
Scan-Directory -Path $directory

Write-Host "Scan complete."
