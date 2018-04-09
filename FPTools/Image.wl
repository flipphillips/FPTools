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

		"Eyes",ff=FacialFeatures[i,"Landmarks"];
			{Thick,Join[(BoundingRegion[#["RightEyePoints"],"MinConvexPolygon"]["BoundaryPolygons"]&)/@ff,(BoundingRegion[#["LeftEyePoints"],"MinConvexPolygon"]["BoundaryPolygons"]&)/@ff]},

		"FaceParts",ff=FacialFeatures[i,"Landmarks"];
			{Thick,Join[
				(BoundingRegion[Join[#["RightEyePoints"],#["RightEyebrowPoints"]],"MinConvexPolygon"]["BoundaryPolygons"]&)/@ff,(BoundingRegion[Join[#["LeftEyePoints"],#["LeftEyebrowPoints"]],"MinConvexPolygon"]["BoundaryPolygons"]&)/@ff,
				(BoundingRegion[#["NosePoints"],"MinConvexPolygon"]["BoundaryPolygons"]&)/@ff,
			(BoundingRegion[#["MouthExternalPoints"],"MinConvexPolygon"]["BoundaryPolygons"]&)/@ff]},

		(* panic *)
		_,fboxs
	];

	If[OptionValue["FilterRadius"]===Automatic,
		HighlightImage[i, {"Blur", polys}],
		HighlightImage[i, {{"Blur",OptionValue["FilterRadius"]}, polys}]]]


AddAlphaChannel[i_Image] := SetAlphaChannel[i,Image[ConstantArray[1, Reverse@ImageDimensions[i]]]]
