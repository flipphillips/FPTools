FPImageIdentify[image_Image,n_:5]:=ImageIdentify[image, All, n, "Probability"]

FPBlurFaces[i_Image,r_:10.0]:=HighlightImage[i, {{"Blur",r}, FindFaces[i]}]
