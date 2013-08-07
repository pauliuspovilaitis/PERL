#!/usr/bin/perl

use strict;
use warnings;

use Win32::OLE qw(in with);
use Win32::OLE::Const;
use Win32::OLE::Const 'Microsoft Excel';
$Win32::OLE::Warn = 3;

system('taskkill /F /IM EXCEL.exe >nul 2>&1');

my $filename = 'D:\Scripts\Croatia_IDP_Daily\CRO_IDP_Macro.xlsm';
my $Excel = Win32::OLE->GetActiveObject('Excel.Application') || Win32::OLE->new('Excel.Application', 'Quit');  

my $Book = $Excel->Workbooks->Open( $filename );
$Excel->Run("Main_Work");
$Book->Close;

system('taskkill /F /IM EXCEL.exe >nul 2>&1');
