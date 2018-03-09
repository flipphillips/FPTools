(* As borrowed from Arnoud's templates *)

PrintTemporary["Loading ",ToString[Length[Names["FPTools`*"]]], " functions"];

BeginPackage["FPTools`",{"PacletManager`"}];

Get[FileNameJoin[{DirectoryName[$InputFileName],"Usage.wl"}]];

Begin["`Private`"];

Module[{files},

  (* load in any session *)
  files={"Introspection.wl","Entity.wl","Image.wl","Internet.wl"};

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