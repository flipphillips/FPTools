#!/usr/bin/env wolframscript
#
# paclet installer
#

(* gerbils *)
$globalsFile="Globals.wl";
$directory = Directory[];
$packageName = VersionInformation[$directory]["name"];

Print["Installing ", $packageName, " from: ", directory];

paclets = PacletFind[$packageName];
Print["Found the following old paclets (uninstalling): ", Map[ #["Location"]&, paclets]];
Map[ PacletUninstall, paclets ];

(* install new paclet *)
Print["Installing new paclet"]
PacletInstall[FileNames["*.paclet", $directory], IgnoreVersion -> True];

Print["Done"]
