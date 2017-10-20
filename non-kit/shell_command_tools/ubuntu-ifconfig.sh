# interfaces(5) file used by ifup(8) and ifdown(8)
auto lo
iface lo inet loopback

#config static ip for chassis
auto eno1
iface eno1 inet static
address 192.168.0.3
netmask 255.255.255.0

以上是auto config，如果临时手动config

sudo ifconfig eno1 192.168.0.5 netmask 255.255.255.0
