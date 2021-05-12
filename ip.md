# CIDR notation
allow block for 24 bits
ie (in essence or that is: càd) 
mask is 255.255.255.0
deny 91.212.45.0/24;

## allow block for 16 bits
mask is 255.255.0.0
deny 191.53.21.0/16;

## on 20 bits
mask is 255.255.0.0 - 255.255.128.0
deny 195.53.21.0/20;

allow an IP range such as 45.43.23.0 – 45.43.23.255 ???
deny 45.43.23.0/24;


* https://www.ipaddressguide.com/cidr
* https://en.wikipedia.org/wiki/Classless_Inter-Domain_Routing
