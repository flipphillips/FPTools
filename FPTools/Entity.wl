
EntityExamine[obj_Entity] := Dataset[Prepend[AssociationMap[obj, obj["Properties"]],"Input" -> InputForm[obj]]]

EntityBroaden[obj_Entity,depth_:Infinity] := NestWhileList[
 Function[meh, 
  Flatten[Map[#["BroaderConcepts"] &, meh]]], {obj}, 
    (! MemberQ[{##}, Entity["Concept", "Entity::9p9v7"], 
     Infinity]) &, All, depth]