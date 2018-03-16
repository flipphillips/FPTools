(* stuff that works with my version.json stuff *)

$versioningFile = "version.json";

FPVersionInformation[path_] := Module[{vp},
  vp = FileNameJoin[{path, $versioningFile}];
  If[FileExistsQ[vp],
   Association[Import[vp]],
   None]]

FPVersionString[path_, OptionsPattern[{"Build" -> False}]] := 
 Module[{vi, vs},
  vi = FPVersionInformation[path];
  If[vi === None, Return[""]];
  
  vs = StringJoin[
    Riffle[ToString /@ 
      vi /@ {"major_version", "minor_version", "revision_number"}, 
     "."]];
  
  If[OptionValue["Build"], 
   vs <> " build " <> ToString[vi["build_number"]],
   vs]]

FPBuildString[path_] := 
  Module[{vi},
    vi = FPVersionInformation[path];
    If[vi === None, "",ToString[vi["build_number"]]]
  ]

FPWriteVersionInformation[path_, vi_] := Module[{vp, vvi = vi},
  vp = FileNameJoin[{path, $versioningFile}];
  If[FileExistsQ[vp], DeleteFile[vp]];
  vvi["date"] = DateString[];
  Export[vp, vvi]]

FPVersionBumpBuild[path_] := Module[{vi},
  vi = FPVersionInformation[path];
  If[vi === None, Return[{}]];
  vi["build_number"] += 1;
  FPWriteVersionInformation[path, vi]]

UpdatePacletFile[ppath_, vpath_] := Module[{peepee, fn},
  fn = FileNameJoin[{ppath, "PacletInfo.m"}];
  
  peepee = Import[fn, "Text"];
  
  Export[fn,
   StringReplace[peepee,
    {RegularExpression["(?m)^(\\s*)Version\\s*->\\s*\"(.*)\""] -> 
      "$1Version -> \"" <> FPVersionString[vpath] <> "\"",
     RegularExpression["(?m)^(\\s*)BuildNumber\\s*->\\s*\"(.*)\""] -> 
      "$1BuildNumber -> \"" <> FPBuildString[vpath] <> "\""}], "Text"]]
