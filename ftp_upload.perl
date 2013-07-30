#!/usr/bin/perl -w

use strict;
use warnings;

use File::Basename;
use Net::FTP;

my $host ='XX.XX.XX.XX';
my $user = 'User';
my $pw   = 'Psw';

my ($year, $month, $day) = (localtime(time - 1 * 24 * 60 * 60))[5,4,3];
$year += 1900;
if($day < 10) {
$day = "0".$day;
}
$month += 1;
if($month < 10) {
$month = "0".$month;
}
my $date = "$year-$month-$day";


my $file ='Z:\temp\CMS1_WU_RIG_'.$date.'.txt';
my $path ="";

my $ftp = Net::FTP->new($host, Debug => 1) ;

$ftp->login($user, $pw) ;
$ftp->cwd($path) ;
$ftp->ls;
$ftp->binary;


$ftp->put($file) 
    or die die sprintf "Could not login: %s", $ftp->message;
$ftp->site("chmod 600 $file");
