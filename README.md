# Windows DNS Ping Script

This PowerShell script pings a list of IP addresses extracted from a DNS export file and categorizes them as reachable or unreachable. The results are saved into separate text files for further analysis.

## Features

- Extracts IPv4 addresses from a DNS export file.
- Removes duplicate IP addresses.
- Pings each IP address to check its reachability.
- Retrieves the hostname for each IP address, if available.
- Saves the results to `reachable_ips.txt` and `unreachable_ips.txt`.

## Prerequisites

- Windows operating system
- PowerShell 5.0 or later
- DNS export file (`dns_entries.txt`) containing the list of DNS entries.

## Usage

1. Clone the repository or download the script `ping_dns_entries.ps1` to your local machine.
2. Ensure the DNS export file is named `dns_entries.txt` and is in the same directory as the script.
3. Open PowerShell and navigate to the directory containing the script and the DNS export file.
4. Run the script:
   ```powershell
   .\ping_dns_entries.ps1
   ```
5. After execution, check the generated files `reachable_ips.txt` and `unreachable_ips.txt` for the results.

## File Structure

- **dns_entries.txt**: Input file containing the DNS entries.
- **reachable_ips.txt**: Output file listing IP addresses that are reachable.
- **unreachable_ips.txt**: Output file listing IP addresses that are not reachable.

## Example

### DNS Export File (`dns_entries.txt`)

```
example.com 192.168.1.1
anotherexample.com 192.168.1.2
example.net 192.168.1.3
```

### Reachable IPs (`reachable_ips.txt`)

```
192.168.1.1 | example.com | reachable
```

### Unreachable IPs (`unreachable_ips.txt`)

```
192.168.1.2 | anotherexample.com | not reachable
192.168.1.3 | example.net | not reachable
```

## Development and Testing

This script was developed and tested using Cloudflare DNS exports. It should work with any similar DNS export format. On Projects with large DNS it helped me to clean the DNS.

## License

This project is licensed under the MIT License.
