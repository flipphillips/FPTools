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

