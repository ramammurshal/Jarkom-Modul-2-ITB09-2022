;
; BIND data file for local loopback interface
;
$TTL    604800
@       IN      SOA     operation.wise.itb09.com. root.operation.wise.itb09.com. (
                        2022102601      ; Serial
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                         604800 )       ; Negative Cache TTL
;
@               IN      NS      operation.wise.itb09.com.
@               IN      A       10.49.2.3       ; Eden IP
www             IN      CNAME   operation.wise.itb09.com.
strix           IN      A       10.49.2.3       ; Eden IP
www.strix       IN      CNAME   operation.wise.itb09.com.