#!/usr/bin/env wolframscript

(* directory = DirectoryName[$InputFileName]; *)
directory = Directory[];
pacletDirectory = FileNameJoin[{directory, "FPTools"}];

Print["Building from: ", directory];

FPVersionBumpBuild[directory];

files = FileNames["*.paclet", directory];
Print["Found paclets (to be deleted): ", files];
DeleteFile /@ files;

Print["Building new paclet"];
UpdatePacletFile[pacletDirectory,directory];
paclet = PackPaclet[pacletDirectory];
Print["New paclet: ", paclet];

Print[];

(* uninstall old paclets first *)
paclets = PacletFind["FPTools"];
Print["Found the following old paclets (uninstalling): ", Map[ #["Location"]&, paclets]];
Map[ PacletUninstall, paclets ];

(* install new version *)
files = FileNames["*.paclet", directory];
Print["Paclet file(s) found: ", files];
paclet = Last @ Sort @ files;
Print["Selecting paclet: ",paclet];
PacletInstall[paclet, IgnoreVersion -> True];
