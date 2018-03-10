#!/usr/bin/env wolframscript

Print[];
directory = DirectoryName[$InputFileName];
Print["Using directory: ", directory];
files = FileNames["*.paclet", directory];
Print["Found paclets (to be deleted): ", files];
DeleteFile /@ files;
Print["Building new paclet"];
paclet = PackPaclet[FileNameJoin[{directory, "FPTools"}]];
Print["New paclet: ", paclet];

Print[];

(* uninstall old paclets first *)
paclets = PacletFind["FPTools"];
Print["Found the following old paclets (uninstalling): ", Map[ #["Location"]&, paclets]];
Map[ PacletUninstall, paclets ];

(* install new version *)
directory = DirectoryName[$InputFileName];
Print["Using directory: ", directory];
files = FileNames["*.paclet", directory];
Print["Paclet file(s) found: ", files];
paclet = Last @ Sort @ files;
Print["Selecting paclet: ",paclet];
PacletInstall[paclet, IgnoreVersion -> True];
