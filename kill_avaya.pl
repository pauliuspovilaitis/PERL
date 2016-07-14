#!/usr/bin/perl

use strict;
use warnings;


system('taskkill /F /IM acsApp.exe >nul 2>&1');
system('taskkill /F /IM acsCNTRL.exe >nul 2>&1');
system('taskkill /F /IM avsApp.exe >nul 2>&1');
system('taskkill /F /IM avsCNTRL.exe >nul 2>&1');
