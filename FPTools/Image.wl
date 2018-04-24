(* ::Package:: *)

(* ::Subsection:: *)
(*ImageID sugar*)


ImageIdentifyFP[image_Image,n_:5]:=ImageIdentify[image, All, n, "Probability"]


(* ::Subsection:: *)
(*face blurer*)


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

FindFaceImages[img_, scale_: 1.0, opts : OptionsPattern[FindFaces]] :=
  Module[{scaledRectangle, r, r2},
  r = FindFaces[img, opts];
  
  scaledRectangle[r_Rectangle, s_] := 
   r /. x_ :> 
	 Rectangle[x[[1]] - (Abs[x[[1]] - x[[2]]]/2) (s - 1), 
	  x[[2]] + (Abs[x[[1]] - x[[2]]]/2) (s - 1)];
  
  r2 = scaledRectangle[#, scale] & /@ r;
  ImageCrop[HighlightImage[img, {White, #}, "Remove"]] & /@ r2]


(* ::Subsection:: *)
(*Alpha Channel*)


AddAlphaChannel[i_Image] := SetAlphaChannel[i,Image[ConstantArray[1, Reverse@ImageDimensions[i]]]]


(* ::Subsection:: *)
(*ffmpeg things*)


ImportMP4Frame::noex = "Can't find ffmpeg executable.";


$FFMpegPath=None;


FindFFMPEG[] := Module[{deflocs},
	Unprotect[$FFMpegPath];
	$FFMpegPath = Which[
		$FFMpegPath=!=None,$FFMpegPath,
		FileExistsQ["/usr/local/bin/ffmpeg"],"/usr/local/bin/ffmpeg",
		FileExistsQ["/usr/bin/ffmpeg"],"/usr/bin/ffmpeg",
		True, Message[ImportMP4Frame::noex];None
	]
]


(* from https://stackoverflow.com/questions/10957412/fastest-way-to-extract-frames-using-ffmpeg *)


ImportMP4Frame[f_, sec_] := Module[{command,fx,fn,run},
	If[$FFMpegPath===None,If[FindFFMPEG[]==None,Return[{}]]];
	
	fx = FileNameJoin[{$TemporaryDirectory,"ImportFrames"}];
	(*Quiet[DeleteDirectory[fx, DeleteContents -> True]];*)
	Quiet[CreateDirectory[fx]];

	fn = FileNameJoin[{fx,"aframe"<>ToString[sec]<>".bmp"}];

	command={$FFMpegPath,"-y","-accurate_seek","-ss",ToString[sec],"-i",f,"-frames:v","1", fn};
	run=RunProcess[command,ProcessEnvironment-><||>];
	If[run["ExitCode"]==0, Import[fn], If[$FPToolsDebug,run,None]]
]


ImportMP4Frames[f_, startTime_, duration_, rate_:1] :=
	Table[ImportMP4Frame[f,t],{t,startTime,startTime+duration,rate}]


ImportWebFrame[url_] := Module[{command,fx,run},
	If[$FFMpegPath===None,If[FindFFMPEG[]==None,Return[{}]]];
	fx = FileNameJoin[{$TemporaryDirectory,"aframe.png"}];
	
	command={$FFMpegPath,"-y","-i",url,"-vframes","1",fx};
	run=RunProcess[command,ProcessEnvironment-><||>];
	If[run["ExitCode"] == 0, Import[fx], If[$FPToolsDebug,run,None]]
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




(* ::Subsection:: *)
(*Lens model*)


(* ::Input::Initialization:: *)
LensDistortPoint[{x0_,y0_},{p1_,p2_},kVec_:{}]:=Module[{itx,k,r2,idist,dx,dy},
	k=PadRight[kVec,6,0];

	r2=x0^2+y0^2;
	idist=(1.0+((k[[6]] r2+k[[5]])r2+k[[4]])r2)/(1.0+((k[[3]] r2+k[[2]])r2+k[[1]])r2);

	dx=2.0 p1 x0 y0+p2 (r2+2.0x0^2);
	dy=p1(r2+2.0y0^2)+2.0p2 x0 y0;
	{(x0-dx),(y0-dy)}idist
]


LensDistortionCorrection[i_,{tx_,ty_},\[Theta]_,{p1_,p2_},kVec_,opt:OptionsPattern[ImageTransformation]]:=Module[{id,ar,t,tt,ut,rt},
	id=ImageDimensions[i];
	ar=1/Divide@@id;

	t=RescalingTransform[{{0,1},{0,ar}},{{-1,1},{-ar,ar}}];
	tt=TranslationTransform[{tx,ty}]@*t;
	ut=RescalingTransform[{{-1,1},{-ar,ar}},{{0,1},{0,ar}}];
	rt=ut@*RotationTransform[\[Theta]];
	
	ImageTransformation[i,rt[LensDistortPoint[tt[#],{p1,p2},kVec]]&,PlotRange->{{0.1,0.9},{0.1,0.5}},opt]]
