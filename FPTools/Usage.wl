(* ::Package:: *)


(* ::Section:: *)
(*Automatically Generated*)


$FPToolsVersion::usage = "$FPToolsVersion gives its best guess as to the version we're using.";
$FPToolsDebug::usage = "$FPToolsDebug let's us know if the package was built with any debugging tools.";


(* ::Section:: *)
(*Introspection*)


Spelunk::usage = "Spelunk[symbol] will discover the definition of symbol. Underlined symbols in the output are clickable.";
PropertiesAvailability::usage = "PropertiesAvailability[object] returns the {available, unavailable} properties for an object.";
PropertiesDataset::usage = "PropertiesDataset[object] returns a TableForm of the available properties for object.";


(* ::Section:: *)
(*Entity*)


EntityPropertiesDataset::usage = "EntityPropertiesDataset[entity] does its best to list all the properties associated with the entity object supplied.";
ConceptBroaden::usage = "ConceptBroaden[entity,depth] recursively climbs the Concept hierarchy until it hits the terminal Concept 'Entity' or after depth dives. Returns a list of Broader Concepts at each level.";
ConceptDistance::usage = "ConceptDistance[entitya,entityb] determines the distance in 'concept steps' between concept a and b.";
ConceptDepth::usage = "ConceptDepth[entity] computes the distance to the root of the Entity tree.";


(* ::Section:: *)
(*Image*)


ImageIdentifyFP::usage = "ImageIdentifyFP[image,{n}] does the standard image identify returnig n (default 5) items and its probabilities.";
BlurFaces::usage = "BlurFaces[image] blurs faces in image. Options include Method (Box,Disk,Outline,Eyes,FaceParts) and FilterRadius.";
AddAlphaChannel::usage = "AddAlphaChannel[image] adds a unity alpha channel to image.";
$FFMpegPath::usage = "$FFMpegPath is the path to the `ffmpeg` executable.";
ImportMP4Frame::usage = "ImportMP4Frame[file,frame] extracts frame `frame` from MP4 file `file`.";
ImportWebFrame::usage = "ImportWebFrame[url] grabs a frame from the stream at url.";


(* ::Section:: *)
(*Internet*)


$MachineAddressesExternal::usage = "$MachineAddressesExternal gives the IP address of this machine as seen by the outside world.";


(* ::Section:: *)
(*Sugar*)


ApplyIf::usage = "ApplyIf[f,g,x] applies g to x if f[x] is True.";

RectangleToDisk::usage = "RectangleToDisk[rect] takes a rectangle and returns an equivalent disk.";

(* ::Section:: *)
(*Versioning*)


VersionInformation::usage = "VersionInformation[path] gives an association with my primitive home grown versioning system.";
VersionString::usage = "VersionString[path] returns the current build as a string. the option \"Build->True\" adds the build number to the end of the string.";
VersionWriteInformation::usage = "VersionWriteInformation[path,vi] takes a version information structure and writes it out. At this point it doesn't validate its structure.";
VersionBumpBuild::usage = "VersionBumpBuild[path] updates the build number in the version json file.";
VersionBuildString::usage = "VersionBuildString[path] returns the current build number as a string.";

UpdatePacletFile::usage = "UpdatePacletFile[ppath,vpath] writes a new PacletInfo file based on the current version and build in the FP version.json system.";


(* ::Section:: *)
(*Data*)

ImportAsDataset::usage = "ImportAsDataset[f] imports f and uses the first row as column headers. Default options are \"Headers\"->True, \"RowNames\"->False, \"ImportOptions->None\" ";


(* ::Section:: *)
(*Signals*)
FindZeroCrossings::usage = "FindZeroCrossings[list] returns pairs that indicate zero-crossing locations in list.";

