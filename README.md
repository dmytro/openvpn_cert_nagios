openvpn_cert_nagios
===================

Nagios plugin to check OpenVPN certificates expiration


CLI options
======================

- -w <days> WARNING

- -c <days> CRITICAL

- -d <PATH> - UNIX path to OpenVPN EasyRSA keys directory (should be readable by process running Nagios)

- -e - send warning email to the address found in certicate subject.

Author
-----------

Dmytro Kovalov, dmytro.kovalov@gmail.com, 2015
