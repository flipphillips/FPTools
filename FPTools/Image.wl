(* ::Package:: *)

ImageIdentifyFP[image_Image,n_:5]:=ImageIdentify[image, All, n, "Probability"]


Options[BlurFaces] = {Method->Automatic,"FilterRadius"->Automatic};

(* Options are "Box" (default), "Disk", "Outline", "Eyes", "FaceParts" for now *)

BlurFaces[i_Image,OptionsPattern[]]:=Module[{how,fboxs,polys,ff},
	fboxs= FindFaces[i];

	polys=Switch[OptionValue[Method]/.Automatic->"Box",
		"Box",fboxs,

		"Disk",RectangleToDisk/@fboxs,

		"Outline",(BoundingRegion[#["OutlinePoints"],"MinConvexPolygon"]["BoundaryPolygons"]&)/@FacialFeatures[i,"Landmarks"],

		"Eyes", ff = FacialFeatures[i,"Landmarks"]; 
			{Thick, (BoundingRegion[Join[#["RightEyePoints"], #["LeftEyePoints"], #["RightEyePoints"], #["RightEyebrowPoints"]], "MinConvexPolygon"]["BoundaryPolygons"] &) /@ ff},

		"FaceParts", ff = FacialFeatures[i, "Landmarks"];
			{Thick, Join[
				(BoundingRegion[Join[#["LeftEyePoints"], #["LeftEyebrowPoints"], #["RightEyePoints"], #["RightEyebrowPoints"]], "MinConvexPolygon"]["BoundaryPolygons"] &) /@ ff,
				(BoundingRegion[#["NosePoints"], "MinConvexPolygon"]["BoundaryPolygons"] &) /@ ff,
				(BoundingRegion[#["MouthExternalPoints"], "MinConvexPolygon"]["BoundaryPolygons"] &) /@ ff]},

		(* panic *)
		_,fboxs
	];

	If[OptionValue["FilterRadius"]===Automatic,
		HighlightImage[i, {"Blur", polys}],
		HighlightImage[i, {{"Blur",OptionValue["FilterRadius"]}, polys}]]]


AddAlphaChannel[i_Image] := SetAlphaChannel[i,Image[ConstantArray[1, Reverse@ImageDimensions[i]]]]




(* ::Subsection:: *)
(*ffmpeg things*)


$FFMpegPath = "/usr/local/bin/ffmpeg";

(* from https://stackoverflow.com/questions/10957412/fastest-way-to-extract-frames-using-ffmpeg *)

ImportMP4Frame[f_, sec_] := Module[{command,fx,fn},
	fx = FileNameJoin[{$TemporaryDirectory,"ImportFrames"}];
	Quiet[DeleteDirectory[fx, DeleteContents -> True]];
	CreateDirectory[fx];

	fn = FileNameJoin[{fx,"aframe"<>ToString[sec]<>".bmp"}];

	command =
		StringRiffle[{$FFMpegPath,"-y","-accurate_seek","-ss",ToString[sec],"-i",StringReplace[f," "->"\\ "],"-frames:v 1", fn}," "];

	If[Run[command] == 0, Import[fn], None]]


ImportMP4Frames[f_, startTime_, duration_, rate_:1] :=
	Table[ImportMP4Frame[f,t],{t,startTime,startTime+duration,rate}]
	
ImportWebFrame[url_] := Module[{command,fx},
  fx = FileNameJoin[{$TemporaryDirectory,"aframe.png"}];
  
  command = 
   $FFMpegPath<>" -y -i " <> url <> " -vframes 1  " <> fx;

  If[Run[command] == 0, Import[fx], None]
]

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


(* 
time for i in {0..39} ; do ffmpeg -accurate_seek -ss `echo $i*60.0 | bc` -i input.mp4   -frames:v 1 period_down_$i.bmp ; done
*)