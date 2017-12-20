#!/usr/bin/perl
# Ip Geolocation 
#By Ben
# Demo : https://youtu.be/wH8HozCLmHw
#
# API documentation - http://ip-api.com/docs/
# you can see you external ip using this Bash script :
# read COUNTRY IP <<< $(wget -qO- http://ip-api.com/line/?fields=countryCode,query); echo $IP $COUNTRY
# Now let's start :

use Socket;
use Term::ANSIColor;
use WWW::Mechanize;
use JSON;


 
print color 'bold bright_blue';
 
print q{

         -------------------====+====-------------------
                              {_| |_}
                            /| _|_|_ |\
                           ( |/_____\| )
                        |--`/_/  |  \_\'--|
                    ____   //( ) |    \\   ____
                   | ++ |==|\___/ \___/|==| ++ |
                    \__/   |  ___ ___  |   \__/
                          __\/oo X []\/__
                         || [\__/_\__/] ||
                        ~~~~           ~~~~ 
                ______  _____    ___  ___  _________
                 | |__)  | |     | |  | |   | |___
                 | |__)  | |_-|  | ```' |   | |_____
                ~~~~~~~ ~~~~~~~   ~~~~~~   ~~~~~~~~~
 _________ _____ _____ ___  ___ ____  ___ _______  _________ _______
 |_/| |\_|  | |___| |  | |  | |  ||\.. ||  | | \ \  | |___    | |__ )
    | |     | |---| |  | ```' |  || `'\||  | |_/ /  | |_____  | |``|\_
   ~~~~~   ~~~~  ~~~~~  ~~~~~~  ~~~~  ~~~ ~~~~~~~  ~~~~~~~~~ ~~~~  ~~~~


Ip Geolocation Tool  
By: #Ben (TSB)

------------------------------------
};
 
print color 'reset';
@iphost=$ARGV[0] || die "Usage : ./Iplocation.pl [host] [ip] [domain] \n\nEx:  ./Iplocation.pl  www.google.com \n     ./Iplocation.pl  216.58.210.206\n \n";
my @ip = inet_ntoa(scalar gethostbyname("@iphost")or die "IP or Host invalid!\n");
my @hn = scalar gethostbyaddr(inet_aton(@ip),AF_INET);
 
my $GET=WWW::Mechanize->new();
    $GET->get("http://ip-api.com/json/@ip"); # JSON API OF IP-API.COM
    my $json = $GET->content();
 
 
my $info = decode_json($json);
# Json API Response :
# A successful request will return, by default, the following:
#{
#    "status": "success",
#    "country": "COUNTRY",
#    "countryCode": "COUNTRY CODE",
#    "region": "REGION CODE",
#    "regionName": "REGION NAME",
#    "city": "CITY",
#    "zip": "ZIP CODE",
#    "lat": LATITUDE,
#    "lon": LONGITUDE,
#    "timezone": "TIME ZONE",
#    "isp": "ISP NAME",
#    "org": "ORGANIZATION NAME",
#    "as": "AS NUMBER / NAME",
#   "query": "IP ADDRESS USED FOR QUERY"
# }
# INFOS OF JSON API ...
 
print "  [!] IP: ", $info->{'query'}, "\n";
print "------------------------------------\n"; 
print "  [+] ORG: ", $info->{'as'}, "\n";
print "  [+] ISP: ", $info->{'isp'}, "\n";
print "  [+] Country: ", $info->{'country'}," - ", $info->{'countryCode'}, "\n";
print "  [+] City: ", $info->{'city'}, "\n";
print "  [+] Region: ", $info->{'regionName'}, " - " , $info->{'region'}, "\n";
print "  [+] Geo: ", "Lat: " , $info->{'lat'}, " - Long: ", $info->{'lon'}, "\n";
print "  [+] Geo: ", "Latitude: " , $info->{'lat'}, " - Long: ", $info->{'lat'}, "\n";
print "  [+] Time: ", "timezone: " , $info->{'timezone'}, " - Long: ", $info->{'timezone'}, "\n";
print "  [+] As number/name: ", "as: " , $info->{'as'}, " - Long: ", $info->{'as'}, "\n";
print "  [+] ORG: ", $info->{'as'}, "\n";
print "  [+] Country code: ", $info->{'countryCode'}, "\n"; 
print "  [+] Status: ", $info->{'status'}, "\n"; 
print "\n";
# EOF
