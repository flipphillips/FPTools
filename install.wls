#!/usr/bin/env wolframscript
#
# paclet installer
#

(* gerbils *)
$packageName="FPTools";
$versionFile="version.json";
$globalsFile="Globals.wl";

directory = Directory[];
pacletDirectory = FileNameJoin[{directory, $packageName}];

Print["Installing from: ", directory];

paclets = PacletFind[$packageName];
Print["Found the following old paclets (uninstalling): ", Map[ #["Location"]&, paclets]];
Map[ PacletUninstall, paclets ];

(* install new paclet *)
Print["Installing new paclet"]
PacletInstall[FileNames["*.paclet", directory], IgnoreVersion -> True];

Print["Done"]
