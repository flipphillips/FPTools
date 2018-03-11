(* stuff that works with my version.json stuff *)

$versioningFile = "version.json";

FPVersionInfo[path_] := Module[{vp},
  vp = FileNameJoin[{path, $versioningFile}];
  If[FileExistsQ[vp],
   Association[Import[vp]],
   {}]]

FPVersionString[path_, OptionsPattern[{"Build" -> False}]] := 
 Module[{vi, vs},
  vi = FPVersionInfo[path];
  If[vi === None, Return[""]];
  
  vs = StringJoin[
    Riffle[ToString /@ 
      vi /@ {"major_version", "minor_version", "revision_number"}, 
     "."]];
  
  If[OptionValue["Build"], 
   vs <> " build " <> ToString[vi["build_number"]],
   vs]]

FPWriteVersionInfo[path_, vi_] := Module[{vp, vvi = vi},
  vp = FileNameJoin[{path, $versioningFile}];
  If[FileExistsQ[vp], DeleteFile[vp]];
  vvi["date"] = DateString[];
  Export[vp, vvi]]

FPVersionBumpBuild[path_] := Module[{vi},
  vi = FPVersionInfo[path];
  If[vi === None, Return[{}]];
  vi["build_number"] += 1;
  FPWriteVersionInfo[path, vi]]