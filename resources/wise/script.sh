# Connect to Ostania
echo nameserver 192.168.122.1 > /etc/resolv.conf

# Install bind9 (DNS Server)
apt-get update
apt-get install bind9 -y
