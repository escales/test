# Prompt the user for the CIDR range
$cidr_range = Read-Host "Enter the CIDR range: "

# Generate a list of IP addresses from the CIDR range
$ip_list = Get-NetIPAddress -AddressFamily IPv4 -PrefixLength 24 -NetworkAddress $cidr_range | Select-Object -ExpandProperty IPAddress

# Set the table header
Write-Output "IP Address      Status"

# Loop through the list of IP addresses and ping each one
foreach ($ip in $ip_list) {
  # Ping the IP address and check the status
  $result = Test-Connection -ComputerName $ip -Count 1 -Quiet
  if ($result) {
    # If the ping was successful, print "Alive"
    Write-Output "$ip      Alive"
  } else {
    # If the ping was unsuccessful, print "Dead"
    Write-Output "$ip      Dead"
  }
}
