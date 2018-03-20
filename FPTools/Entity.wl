(* ::Package:: *)

EntityPropertiesDataset[obj_Entity] := Dataset[Prepend[AssociationMap[obj, obj["Properties"]],"Input" -> InputForm[obj]]]


ConceptBroaden[obj_Entity,depth_:Infinity] := 
  NestWhileList[
    Function[meh, 
      Flatten[Map[#["BroaderConcepts"] &, 
        DeleteDuplicates[meh]]]], {obj}, (! MemberQ[{##}, Entity["Concept", "Entity::9p9v7"], Infinity]) &, 
    All, depth] /; First[obj] == "Concept"


ConceptDistance[obja_Entity, objb_Entity] := 
  Module[{ch1, ch2, ix, d1, d2},
    (* chains back to Entity *)
    ch1 = ConceptBroaden[obja];
    ch2 = ConceptBroaden[objb];
    (* intersections *)
    ix = Intersection[Flatten[ch1], Flatten[ch2]];
  
    (* minimum distance to a common location *)
    d1 = Min[First /@ Position[ch1, #, \[Infinity]] & /@ ix];
    d2 = Min[First /@ Position[ch2, #, \[Infinity]] & /@ ix];
  
    d1 + d2 - 2
  ] /; First[obja] == First[objb] == "Concept"


ConceptDepth[obj_Entity] := Length[ConceptBroaden[obj]]-1 /; First[obj] == "Concept"
