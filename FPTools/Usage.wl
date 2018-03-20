(* ::Package:: *)

(* ::Section:: *)
(*Introspection*)


Spelunk::usage = "Spelunk[symbol] will discover the definition of symbol. Underlined symbols in the output are clickable.";
PropertiesInformation::usage = "PropertiesInfo[symbol] returns the {available, unavailable} properties for symbol.";
PropertiesDataset::usage = "PropertiesDataset[symbol] returns a TableForm of the available properties for symbol.";


(* ::Section:: *)
(*Entity*)


EntityPropertiesDataset::usage = "EntityPropertiesDataset[entity] does its best to list all the properties associated with the entity object supplied.";
ConceptBroaden::usage = "ConceptBroaden[entity,depth] recursively climbs the Concept hierarchy until it hits the terminal Concept 'Entity' or after depth dives. Returns a list of Broader Concepts at each level.";
ConceptDistance::usage = "ConceptDistance[entitya,entityb] determines the distance in 'concept steps' between concept a and b.";
ConceptDepth::usage = "ConceptDepth[entity] computes the distance to the root of the Entity tree."


(* ::Section:: *)
(*Image*)


FPImageIdentify::usage = "FPImageIdentify[image,n] does the standard image identify returnig n (default 5) items and its probabilities.";


(* ::Section:: *)
(*Internet*)


$MachineAddressesExternal::usage = "$MachineAddressesExternal gives the IP address of this machine as seen by the outside world.";


(* ::Section:: *)
(*Sugar*)


ApplyIf::usage = "ApplyIf[f,g,x] applies g to x if f[x] is True.";


(* ::Section:: *)
(*Versioning*)


FPVersionInformation::usage = "FPVersionInformation[path] gives an association with my primitive home grown versioning system.";
FPVersionString::usage = "FPVersionString[path] returns the current build as a string. the option \"Build->True\" adds the build number to the end of the string.";
FPWriteVersionInformation::usage = "FPWriteVersionInformation[path,vi] takes a version information structure and writes it out. At this point it doesn't validate its structure.";
FPVersionBumpBuild::usage = "FPVersionBumpBuild[path] updates the build number in the version json file.";
FPBuildString::usage = "FPBuildString[path] returns the current build number as a string.";


UpdatePacletFile::usage = "UpdatePacletFile[ppath,vpath] writes a new PacletInfo file based on the current version and build in the FP version.json system."
