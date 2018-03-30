ImageIdentifyFP[image_Image,n_:5]:=ImageIdentify[image, All, n, "Probability"]

(* seperate versions since the 'default' r seems to be derived from the bounding box. HighlightImage is sort of a wank *)
BlurFaces[i_Image]:=HighlightImage[i, {"Blur", FindFaces[i]}]
BlurFaces[i_Image,r_]:=HighlightImage[i, {{"Blur",r}, FindFaces[i]}]

AddAlphaChannel[i_Image] := SetAlphaChannel[i,Image[ConstantArray[1, Reverse@ImageDimensions[i]]]]