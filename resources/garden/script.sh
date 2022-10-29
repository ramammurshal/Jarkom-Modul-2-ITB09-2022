# Connect to Ostania for downloading
echo "nameserver 192.168.122.1" > /etc/resolv.conf

# Update package
apt-get update

# Install DNS utils
apt-get install dnsutils

# Install Lynx
apt-get install lynx -y

# Connect to WISE and Eden
echo -e "nameserver 10.49.3.2\nnameserver 10.49.2.2" > /etc/resolv.conf