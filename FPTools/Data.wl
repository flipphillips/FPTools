(* ::Package:: *)

(* dataset stuff *)


ImportAsDataset[f_, 
  OptionsPattern[{"ImportOptions" -> None, "Header" -> True, 
    "RowNames" -> False}]] := Module[{header, data, raw, iv},
  raw = If[(iv = OptionValue["ImportOptions"]) =!= None,
    Import[f, iv],
    Import[f]];
  
  Which[
   OptionValue["Header"] && OptionValue["RowNames"],
   (header = Rest[First[raw]];
    data = <|ToString[
          If[NumberQ[First[#]], Round[First[#]], First[#]]] -> 
         Rest[#] & /@ Rest[raw]|>;
    Dataset[Association[Thread[Rule[header, #]]] & /@ data]),
   
   OptionValue["Header"],
   (header = First[raw];
    data = Rest[raw];
    Dataset[Association[Thread[Rule[header, #]]] & /@ data]),
   
   OptionValue["RowNames"],
   Dataset[<|ToString[
         If[NumberQ[First[#]], Round[First[#]], First[#]]] -> 
        Rest[#] & /@ raw|>],
   
   True,
   Dataset[raw]]]


(* a possible addition to findpeaks, etc. *)
(* from https://mathematica.stackexchange.com/questions/10640/find-zero-crossing-in-a-list *)

FindZeroCrossings[l_List] := Module[{t, u, v},
    t = {Sign[l], Range[Length[l]]} // Transpose;(*List of-1,0,1 only*)
    u = Select[t, First[#] != 0 &];(*Ignore zeros*)
    v = SplitBy[u, First];(*Group into runs of+and-values*){Most[Max[#[[All, 2]]] & /@ v], 
    Rest[Min[#[[All, 2]]] & /@ v]} // Transpose]


(* ::Subsection:: *)
(*ffmpeg things*)


$FFMpegPath = "/usr/local/bin/ffmpeg";


ImportMP4Frame[f_, frame_] := Module[{command, fx},
  fx = FileNameJoin[{$TemporaryDirectory,"aframe.png"}];

  command = 
   $FFMpegPath<>" -i \"" <> f <> "\" -vf \"select=gte(n\," <> 
    ToString[frame] <> ")\" -vframes 1 -y " <> fx;

  If[Run[command] == 0, Import[fx], None]]

ImportWebFrame[url_] := Module[{command,fx},
  fx = FileNameJoin[{$TemporaryDirectory,"aframe.png"}];
  
  command = 
   $FFMpegPath<>" -y -i " <> url <> " -vframes 1  " <> fx;

  If[Run[command] == 0, Import[fx], None]
]

ImportMP4Frames[f_, startTime_, duration_, rate_:1] := Module[{command, fx},
	fx = FileNameJoin[{$TemporaryDirectory,"ImportFrames"}];
	Quiet[DeleteDirectory[fx, DeleteContents -> True]];
	CreateDirectory[fx];

	command = $FFMpegPath<>" -i \""<>f<>"\" -ss "<>ToString[startTime]<>" -t "<>ToString[duration]<>" -r "<>ToString[rate]<>" "<>FileNameJoin[{fx,"%04d.png"}];

	If[Run[command] == 0, Import/@FileNames[FileNameJoin[{fx,"*.png"}]], None]]
(* 
outdir = FileNameJoin[{$TemporaryDirectory, "cappyPorts2"}];
Quiet[DeleteDirectory[outdir, DeleteContents -> True]];
CreateDirectory[outdir]

url = "http://wms-east1.wetmet.net/live/157-02-01/Playlist.m3u8";

url = "http://wms-prod-2.wetmet.net/live/153-05-01/playlist.m3u8";

cmd = "/usr/local/bin/ffmpeg -i " <> url <> 
  " -t 30:00 -vf fps=1/30 " <> FileNameJoin[{outdir, "out%03d.png"}] <>
   "&"
*)
