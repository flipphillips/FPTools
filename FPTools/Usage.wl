(* Introspection *)
Spelunk::usage = "Spelunk[symbol] will discover the definition of symbol. Underlined symbols in the output are clickable.";

(* Entity *)
EntityPropertiesDataset::usage = "EntityPropertiesDataset[entity] does its best to list all the properties associated with the entity object supplied.";
ConceptBroaden::usage = "ConceptBroaden[entity,depth] recursively climbs the Concept hierarchy until it hits the terminal Concept 'Entity' or after depth dives. Returns a list of Broader Concepts at each level.";
ConceptDistance::usage = "ConceptDistance[entitya,entityb] determines the distance in 'concept steps' between concept a and b."
(* Image *)
FPImageIdentify::usage = "FPImageIdentify[image,n] does the standard image identify returnig n (default 5) items and its probabilities.";

(* Internet *)
$MachineAddressesExternal::usage = "$MachineAddressesExternal gives the IP address of this machine as seen by the outside world."

(* Sugar *)
ApplyIf::usage = "ApplyIf[f,g,x] applies g to x if f[x] is True."