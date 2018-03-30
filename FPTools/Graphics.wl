(* convert representations *)


RectangleToDisk[rect_Rectangle] := Module[{r, center},
  r = (rect[[2]] - rect[[1]])/2;
  center = rect[[1]] + r;
  Disk[center, If[Equal@@r,First[r],r]]]
