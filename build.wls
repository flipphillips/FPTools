#!/usr/bin/env wolframscript
#
# paclet builder
#

(* gerbils *)
$globalsFile="Globals.wl";
$directory = Directory[];
$packageName = VersionInformation[$directory]["name"];

pacletDirectory = FileNameJoin[{$directory, $packageName}];

Print["Building ",$packageName, " from: ", $directory];

(* bump build *)
VersionBumpBuild[$directory];

(* globals *)
Unprotect[{$MonitorUtilitiesDebug,$MonitorUtilitiesVersion}]
$MonitorUtilitiesDebug=False;
$MonitorUtilitiesVersion=VersionString[$directory,"Build"->True];

(* create global file *)
gfile=FileNameJoin[{$directory,$packageName,$globalsFile}];
If[FileExistsQ[gfile], DeleteFile[gfile]];
Save[gfile, {$MonitorUtilitiesDebug, $MonitorUtilitiesVersion}];

(* delete old paclet *)
files = FileNames["*.paclet", $directory];
Print["Found paclets (to be deleted): ", files];
DeleteFile /@ files;

(* build new paclet *)
Print["Building new paclet"];
UpdatePacletFile[pacletDirectory,$directory];
paclet = PackPaclet[pacletDirectory];
Print["New paclet: ", paclet];

paclets = PacletFind[$packageName];
Print["Found the following old paclets (uninstalling): ", Map[ #["Location"]&, paclets]];
Map[ PacletUninstall, paclets ];

(* install new paclet *)
Print["Installing new paclet"]
PacletInstall[paclet, IgnoreVersion -> True];

(* Build wiki docs *)
wikidir=FileNameJoin[{"..",$packageName<>".wiki"}];
If[DirectoryQ[wikidir],
    Print["Building wiki at ",wikidir];
    BuildWikiDocumentation[wikidir,$packageName]];

Print["Done"]
