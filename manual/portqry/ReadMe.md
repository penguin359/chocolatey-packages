# <img src="https://cdn.jsdelivr.net/gh/chtof/chocolatey-packages/manual/portqry/portqry.png" width="48" height="48"/> [PortQry Command Line Port Scanner](https://chocolatey.org/packages/portqry)

Portqry.exe reports the status of a TCP/IP port in one of the following three ways:
- Listening

A process is listening on the port on the computer that you selected. Portqry.exe received a response from the port.

- Not Listening

No process is listening on the target port on the target system. Portqry.exe received an Internet Control Message Protocol (ICMP) "Destination Unreachable - Port Unreachable" message back from the target UDP port. Or if the target port is a TCP port, Portqry received a TCP acknowledgement packet with the Reset flag set.

- Filtered

The port on the computer that you selected is being filtered. Portqry.exe did not receive a response from the port. A process may or may not be listening on the port. By default, TCP ports are queried three times, and UDP ports are queried one time before a report indicates that the port is filtered.
Portqry.exe can query a single port, an ordered list of ports, or a sequential range of ports.

## Examples
The following command tries to resolve "reskit.com" to an IP address and then queries TCP port 25 on the corresponding host:

`portqry -n reskit.com -p tcp -e 25`



The following command tries to resolve "169.254.0.11" to a host name and then queries TCP ports 143,110, and 25 (in that order) on the host that you selected. This command also creates a log file (Portqry.log) that contains a log of the command that you ran and its output.

`portqry -n 169.254.0.11 -p tcp -o 143,110,25 -l portqry.log`



The following command tries to resolve
my_server to an IP address and then queries the specified range of UDP ports (135-139) in sequential order on the corresponding host. This command also creates a log file (my_server.txt) that contains a log of the command that you ran and its output.

`portqry -n my_server -p udp -r 135:139 -l my_server.txt`

![screenshot](https://cdn.jsdelivr.net/gh/chtof/chocolatey-packages/manual/portqry/screenshot.png)