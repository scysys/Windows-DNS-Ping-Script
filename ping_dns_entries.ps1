# Path to the DNS export file
$dnsFile = "dns_entries.txt"

# Result files
$reachableFile = "reachable_ips.txt"
$unreachableFile = "unreachable_ips.txt"

# Clear or create files
Clear-Content -Path $reachableFile -ErrorAction SilentlyContinue
Clear-Content -Path $unreachableFile -ErrorAction SilentlyContinue

# Read the DNS export file
$dnsEntries = Get-Content $dnsFile

# Extract IPv4 addresses and remove duplicates
$ipv4Addresses = $dnsEntries | Select-String -Pattern "\b\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}\b" | ForEach-Object { $_.Matches.Value } | Sort-Object -Unique

# Ping addresses and save results
foreach ($ip in $ipv4Addresses) {
    $hostname = "UNKNOWN"
    try {
        # Get the hostname for the IP address
        $hostname = [System.Net.Dns]::GetHostEntry($ip).HostName
    }
    catch {
        # If hostname is not found or an error occurs, keep it as UNKNOWN
    }

    # Ping the IP address
    if (Test-Connection -ComputerName $ip -Count 1 -Quiet) {
        Add-Content -Path $reachableFile -Value "$ip | $hostname | reachable"
    } else {
        Add-Content -Path $unreachableFile -Value "$ip | $hostname | not reachable"
    }
}

Write-Host "Ping test completed. Check reachable_ips.txt and unreachable_ips.txt for results."
