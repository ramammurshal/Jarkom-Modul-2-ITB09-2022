# Connect to Ostania IP
echo nameserver 192.168.122.1 > /etc/resolv.conf

# Update package
apt-get update

# Install web server requirement
apt-get install apache2 -y # To start: service apache2 start
apt-get install php -y
apt-get install libapache2-mod-php7.0

# Command to run apache2 web server: service apache2 start.
# Or to restart: service apache2 restart

# Additional tools
apt-get install wget
