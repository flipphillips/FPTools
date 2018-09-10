(* stuff that works with my version.json stuff *)

$versioningFile = "version.json";

VersionInformation[path_] := Module[{vp},
  vp = FileNameJoin[{path, $versioningFile}];
  If[FileExistsQ[vp],
   Association[Import[vp]],
   None]]

VersionString[path_, OptionsPattern[{"Build"->False,"Prerelease"->False}]] := 
 Module[{vi, vs},
  vi = VersionInformation[path];
  If[vi === None, Return[""]];
  
  vs = StringJoin[
    Riffle[ToString /@ 
      vi /@ {"major_version", "minor_version", "revision_number"}, 
     "."]];
  
  vs = If[OptionValue["Prerelease"]&&vi["prerelease"],vs<>"pre",vs];

  If[OptionValue["Build"], 
   vs <> " build " <> ToString[vi["build_number"]],
   vs]]

VersionBuildString[path_] := 
  Module[{vi},
    vi = VersionInformation[path];
    If[vi === None, "",ToString[vi["build_number"]]]
  ]

VersionWriteInformation[path_, vi_] := Module[{vp, vvi = vi},
  vp = FileNameJoin[{path, $versioningFile}];
  If[FileExistsQ[vp], DeleteFile[vp]];
  vvi["date"] = DateString[];
  Export[vp, vvi]]

VersionBumpBuild[path_] := Module[{vi},
  vi = VersionInformation[path];
  If[vi === None, Return[{}]];
  vi["build_number"] += 1;
  VersionWriteInformation[path, vi]]

UpdatePacletFile[ppath_, vpath_] := Module[{peepee, fn},
  fn = FileNameJoin[{ppath, "PacletInfo.m"}];
  
  peepee = Import[fn, "Text"];
  
  Export[fn,
   StringReplace[peepee,
    {RegularExpression["(?m)^(\\s*)Version\\s*->\\s*\"(.*)\""] -> 
      "$1Version -> \"" <> VersionString[vpath] <> "\"",
     RegularExpression["(?m)^(\\s*)BuildNumber\\s*->\\s*\"(.*)\""] -> 
      "$1BuildNumber -> \"" <> VersionBuildString[vpath] <> "\""}], "Text"]]
