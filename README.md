openvpn_cert_nagios
===================

Nagios plugin to check OpenVPN certificates expiration

Plugin reads all certificates in the OpenRSA directory and sends WARNING or CRITICAL if finds one or more certs that are to be expired soon.


Usage
===========

    check_open_vpn_cert --path /etc/openvpn/easy-rsa/keys -w 30: -c 7:

Issues a critical alert if there are certs to be exired in less than a week, or warning if there are certs to be expired in less than 30 days.

CLI options
======================

- -w <days> WARNING

- -c <days> CRITICAL

- --path <PATH>, -P <PATH> - UNIX path to OpenVPN EasyRSA keys directory (should be readable by process running Nagios)

Both -w and -c options should be specified as `NUMBER:` according to Nagios ranges [format guidelines](https://nagios-plugins.org/doc/guidelines.html#THRESHOLDFORMAT)

LICENSE
-----------

MIT, see LICENSE file

Author
-----------

Dmytro Kovalov, dmytro.kovalov@gmail.com, 2015
