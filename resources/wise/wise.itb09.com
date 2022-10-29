3.49.10.in-addr.arpa  cp-wise  wise.itb09.com
root@WISE:~/wise# cat wise.itb09.com 
;
; BIND data file for local loopback interface
;
$TTL    604800
@       IN      SOA     wise.itb09.com. root.wise.itb09.com. (
                        2022102601      ; Serial
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                         604800 )       ; Negative Cache TTL
;
@               IN      NS      wise.itb09.com.
@               IN      A       10.49.3.2
www             IN      CNAME   wise.itb09.com.
eden            IN      A       10.49.2.3               ; IP Eden
www.eden        IN      CNAME   eden.wise.itb09.com.
ns1             IN      A       10.49.2.2               ; IP Berlint
operation       IN      NS      ns1
@               IN      AAAA    ::1
