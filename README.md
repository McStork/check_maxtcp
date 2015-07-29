# check_maxtcp
Script to determine the max TCP connections allowed for one client

Usage : check_maxtcp.rb <host> <port>

Useful to test for DOS vulnerability of a service when caused by a high number of max connections allowed for one client.
Example : CVE-2010-5107
