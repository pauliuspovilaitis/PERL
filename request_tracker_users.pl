#main function


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


#main function end

#usage of this 

#!/bin/bash
export RT_HOME=/usr/share/request-tracker4
U1=userlist.csv
while read zeile; do
        set -- $zeile
        echo "adding user: "$1 $2
        /usr/bin/perl creatertuser.pl $1 $2
done<$U1


#need to create a simple csv file userlist.csv containing: username email
#to run this using power shell: perl usagefile.pl
