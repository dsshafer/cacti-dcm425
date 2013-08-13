cacti-dcm425
============

Cacti script for Thomson/RCA DCM425 cable modem

Usage
-----
__dcm425.pl [address]__

Copy to an appropriate location, such as /usr/local/share/cacti/scripts/.

Returns a space-separated list of attribute:value pairs as expected by Cacti, for example:

__$ ./dcm425.pl__

_down_ber:0.042 down_power:1.3 down_snr:35.8 up_power:48.7_


### Arguments

_address_ Address of the cable modem to check (defaults to 192.168.100.1)


### Outputs

_down_snr_ Downstream signal-to-noise ratio (dB)

_down_ber_ Downstream bit error rate (percentage)

_down_power_ Downstream power level (dBmV)

_up_power_ Upstream power level (dBmV)
