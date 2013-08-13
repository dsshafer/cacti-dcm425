#!/usr/bin/perl
# Retrieve signal diagnostics from an RCA DCM425 cable modem
# for use with Cacti
#
# Copy to an appropriate location, e.g. /usr/local/share/cacti/scripts/

use strict;

my %data;
my $hostname;

# Default to '192.168.100.1' if no hostname specified
if ($ARGV[0] ne '')
  {
    $hostname = $ARGV[0];
  }
else
  {
    $hostname = '192.168.100.1';
  }

my $URL='http://' . $hostname . '/diagnostics_page.asp';

# Fetch data
my $_ = `GET $URL`;

# Downstream SNR
if (/DSSnrInfo.*value='([0-9\.]*) dB'/) {
  $data{'down_snr'} = $1;
}

# Downstream Power Level
if (/DSSigInfo.*value='([0-9\.]*) dBmV'/) {
  $data{'down_power'} = $1;
}

# Downstream Bit Error Rate
if (/DSErrInfo.*value='([0-9\.]*) %'/) {
  $data{'down_ber'} = $1;
}

# Upstream Power Level
if (/USPwrInfo.*value='([0-9\.]*) dBmV/) {
  $data{'up_power'} = $1;
}

# Output
my @pairs;
foreach my $key (sort keys %data)
  {
    push @pairs, "$key:$data{$key}";
  }
print join " ", @pairs;
