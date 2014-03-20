#!/usr/bin/perl
use strict;
use warnings;

BEGIN { die "You must define \$RT_HOME\n"
          unless exists $ENV{RT_HOME} };
use lib "$ENV{RT_HOME}/lib";

use RT;
RT::LoadConfig();
RT::Init();

use RT::Interface::CLI qw(GetCurrentUser loc);
use RT::Tickets;

my $CurrentUser = GetCurrentUser();
die loc("No RT user found.\n") unless ($CurrentUser->Id);
die "2 arguments are needed, Name & Email\n" unless ($#ARGV==1);
my $UserName=shift @ARGV;
my $Email=shift @ARGV;

my $User = RT::User->new($CurrentUser);
my ($id,$Message)=$User->Create(Name=>$UserName,EmailAddress=>$Email,Privileged=>1,Password=>'xxxxxxxxx');
if ($id){
        print $Message."\n";
   }
   else{
        print"Error!\n$Message\n";
   }


