(* ::Package:: *)

(* As borrowed from Arnoud's templates *)

If[$FPToolsDebug,PrintTemporary["Loading ",ToString[Length[Names["FPTools`*"]]], " FPTools functions"]];

BeginPackage["FPTools`",{"PacletManager`","Prototypes`"}];

Get[FileNameJoin[{DirectoryName[$InputFileName],"Usage.wl"}]];

Begin["`Private`"];

Module[{files},

  (* load in any session *)
  files={
    "Data.wl",
    "Entity.wl",
    "GA.wl",
    "Geometry.wl",
    "Graphics.wl",
    "Image.wl",
    "Internet.wl",
    "Introspection.wl",
    "Signals.wl",
    "Statistics.wl",
    "Sugar.wl",
    "Versioning.wl"
    };

  Map[Get[FileNameJoin[{DirectoryName[$InputFileName], #}]] &, files];

  (* only load in a notebook session *)
(*
  If[ Head[$FrontEnd] === FrontEndObject,
    files = {"Dock.wl","Notebook.wl"};
    Map[ Get[ FileNameJoin[{DirectoryName[$InputFileName], #}] ] &, files ];
  ]
*)

];

End[];
EndPackage[];



