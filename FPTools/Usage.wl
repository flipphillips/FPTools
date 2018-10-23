(* ::Package:: *)

(* ::Section:: *)
(*Automatically Generated*)


(* ::Text:: *)
(*MetaInformation about this package*)


$FPToolsVersion::usage = "$FPToolsVersion gives its best guess as to the version we're using.";
$FPToolsDebug::usage = "$FPToolsDebug let's us know if the package was built with any debugging tools.";


(* ::Section:: *)
(*Introspection*)


(* ::Text:: *)
(*Metainformation about Mathematica. Borrowed from various stackexchange posts and some of my own code.*)


Spelunk::usage = "Spelunk[symbol] will discover the definition of symbol. Underlined symbols in the output are clickable.";
PropertiesAvailability::usage = "PropertiesAvailability[object] returns the {available, unavailable} properties for an object.";
PropertiesDataset::usage = "PropertiesDataset[object] returns a TableForm of the available properties for object.";

NewKernelEvaluate::usage = "NewKernelEvaluate[expr] evaluates expr in a fresh, clean kernel and returns the result.";
GetSymbolsDefinedInMX::usage = "GetSymbolsDefinedInMX[mxfile] returns a list of symbols defined in mxfile.";

GetCompilerFunctions::usage = "GetCompilerFunctions[] returns the list of functions that are compilable.";


(* ::Section:: *)
(*Data*)


(* ::Text:: *)
(*In the past there have been problems with Import and asking for Datasets. This doesn't fix it exactly, but works better.*)


ImportAsDataset::usage = "ImportAsDataset[f] imports f and uses the first row as column headers. Default options are \"Headers\"->True, \"RowNames\"->False, \"ImportOptions->None\" ";


Overlap::usage = "Overlap[l1,l2] gives the intersection of the range of two lists.";


(* ::Section:: *)
(*Entity*)


(* ::Text:: *)
(*Some semantic / entity probing things used by some developmental linguistics kids last semester.*)


EntityPropertiesDataset::usage = "EntityPropertiesDataset[entity] does its best to list all the properties associated with the entity object supplied.";
ConceptBroaden::usage = "ConceptBroaden[entity,depth] recursively climbs the Concept hierarchy until it hits the terminal Concept 'Entity' or after depth dives. Returns a list of Broader Concepts at each level.";
ConceptDistance::usage = "ConceptDistance[entitya,entityb] determines the distance in 'concept steps' between concept a and b.";
ConceptDepth::usage = "ConceptDepth[entity] computes the distance to the root of the Entity tree.";


(* ::Section:: *)
(*Genetic Algorithms*)


(* ::Text:: *)
(*The world's simplest genetic algorithm implementation*)


GARepopulate::usage = "GARepopulate[pop,fitfunc] creates a new population using fitfunc.";
GAMutate::usage = "GAMutate[chromo] mutates a chromosome.";
GACrossover::usage = "GACrossover[c1,c2] performs a random crossover of c1 & c2. Returns two offspring.";


(* ::Section:: *)
(*Geometry*)


ToCartesianRules::usage = "A set of rules for rtp->xyz";
ToSphericalRules::usage = "A set of rules for xyz->rtp";


(* ::Text:: *)
(*These are for converting to and from various texture-map coordinate systems.*)


RectangularToPhiTheta::usage = "RectangularToPhiTheta[{u,v}] gives the phi/theta (spherical) coordinates from a latlon coordinate system. u and v are on [0,1)";
PhiThetaToDirection::usage = "PhiThetaToDirection[{phi,theta}] gives the direction vector {dx,dy,dz} from the spherical coordinates phi / theta.";
RectangularToDirection::usage = "RectangularToDirection[{u,v}] gives the direction vector {dx,dy,dz} from the [0,1) latlon coordinates.";
DirectionToRectangular::usage = "DirectionToRectangular[{dx,dy,dz}] gives index into texture space {u,v} from the direction vector.";


CircularToAngular::usage = "CircularToAngular[{u,v}] gives the theta/phi (angular) coordinates from a circluar coordinate system. u and v are on [0,1)";
AngularToDirection::usage = "AngularToDirection[{theta,phi}] gives the direction vector {dx,dy,dz} from the angular coordinates  theta / phi.";
CircularToDirection::usage = "CircularToDirection[{u,v}] gives the direction vector {dx,dy,dz} from the [0,1) circular coordinates.";
DirectionToCircular::usage = "DirectionToCircular[{dx,dy,dz}] gives index into circular texture space {u,v} from the direction vector.";


(* ::Section:: *)
(*Graphics*)


RectangleToDisk::usage = "RectangleToDisk[rect] takes a rectangle and returns an equivalent disk.";


(* ::Section:: *)
(*Image*)


(* ::Text:: *)
(*Some shortcuts for face things from a recent project*)


ImageIdentifyFP::usage = "ImageIdentifyFP[image,{n}] does the standard image identify returnig n (default 5) items and its probabilities.";
BlurFaces::usage = "BlurFaces[image] blurs faces in image. Options include Method (Box,Disk,Outline,Eyes,FaceParts) and FilterRadius.";
FindFaceImages::usage = "FindFaceImages[image,scale] finds faces in an image, scaling the returned image by `scale` (default 1). Larger values provide more context, smaller less.";


(* ::Text:: *)
(*Very basic ffmpeg tools*)


$FFMpegPath::usage = "$FFMpegPath is the path to the `ffmpeg` executable.";
ImportMP4Frame::usage = "ImportMP4Frame[file,frame] extracts frame `frame` from MP4 file `file`.";
ImportMP4Frames::usage = "ImportMP4Frames[file,start,dur] extracts frames from start of dur from MP4 file `file`.";
ImportWebFrame::usage = "ImportWebFrame[url] grabs a frame from the stream at url.";


(* ::Text:: *)
(*Compute various order lens distortion corrections. Was useful with de-barreling/fisheyeing the Sony and GoPro action cam footage.*)


LensDistortPoint::usage = "LensDistortPoint[{x,y},{p1,p2},{k1,...}] projects point x,y using the distortion specified in the p and k vectors.";
LensDistortionCorrection::usage = "LensDistortionCorrection[image,{tx,ty},theta,{p1,p1},{k1,k2,k3...}] performs a lens distortion correction along with a generalized translation (t) and rotation (theta). p1 and p2 specify 1st order astygmatism and k1-6 the different orders of distortion beyond that. Note you only need to supply k's up to the desired order of correction.";


(* ::Text:: *)
(*This is missing mainly because many/most of the image processing algorithms are already parallelized. Still, of course, I have found some that are not and this lets me take advantage.*)


ParallelImageApplyIndexed::usage = "ParallelImageApplyIndexed[f,im] maps f over im using parallel kernels. At this point, its only a single image plane";


(* ::Text:: *)
(*Some things that are missing that should be part of WL, IMHO.*)


AddAlphaChannel::usage = "AddAlphaChannel[image] adds a unity alpha channel to image.";
InterleavingQ::usage = "InterleavingQ[im] returns True if im is interleaved.";
ImageInformation::usage = "ImageInformation[im] returns a Dataset of the image information as per the FE's viewer.";


(* ::Section:: *)
(*Internet*)


(* ::Text:: *)
(*Sometimes you're behind a DHCP and you want to know what you look like to the rest of the world.*)


$MachineAddressesExternal::usage = "$MachineAddressesExternal gives the IP address of this machine as seen by the outside world.";


(* ::Section:: *)
(*Signals*)


(* ::Text:: *)
(*Signal processing tools*)


FindZeroCrossings::usage = "FindZeroCrossings[list] returns pairs that indicate zero-crossing locations in list.";


FFTShift::usage = "Mimic MATLABs fftshift (ImagePeriodogram does this in more recent MMa).";
InverseFFTShift::usage = "Mimic MATLABs ifftshift.";


RealSphericalHarmonicY::usage = "RealSphericalHarmonicY[l,m,th,phi] returns real-valued spherical harmonics.";


UnitizedGaussianPDF::usage = "UnitizedGaussian[mu,sigma] gives a pure function of a PDF whose value at the mean = 1.0.";


(* ::Section:: *)
(*Statistics*)


(* ::Text:: *)
(*Re-implementation of some functions that were included in earlier statistics packages in MMa but have gone missing over the years.*)


LocationReport::usage = "LocationReport[list] gives the Mean, HarmonicMean, and Median location statistics for list.";
DispersionReport::usage = "DispersionReport[list] gives the Variance, StandardDeviation, SampleRange, MeanDeviation, MedianDeviation, and QuartileDeviation dispersion statistics for list.";
ShapeReport::usage = "ShapeReport[list] gives the Skewness, QuartileSkewness, and KurtosisExcess shape statistics for list.";


StandardDeviationMLE::usage = "StandardDeviationMLE[list] gives the standard deviation of the entries in list.  Division by n is used, giving a maximum likelihood estimate of the population standard deviation.";
VarianceMLE::usage = "VarianceMLE[list] gives the variance of the entries in list. Division by n (rather than n-1) is used, giving a maximum likelihood estimate of the population variance (use Variance[list] for an unbiased estimate).";
StandardErrorOfSampleMean::usage = "StandardErrorOfSampleMean[list] gives an unbiased estimate of the standard error (standard deviation) of the sample mean, using the entries in list as a sample from the population.";
CoefficientOfVariation::usage = "CoefficientOfVariation[list] gives the coefficient of variation, defined as the ratio of the standard deviation to the mean of the entries in list. If the entries are not all positive, then $Failed is returned."
ZeroMean::usage = "Zeroize the data about the mean.";


(* ::Section:: *)
(*Sugar*)


(* ::Text:: *)
(*Syntactic sugars*)


ApplyIf::usage = "ApplyIf[f,g,x] applies g to x if f[x] is True.";


(* ::Section:: *)
(*Versioning*)


(* ::Text:: *)
(*WL interface to my json based version system. Also can parse and update a Paclet data structure*)


VersionInformation::usage = "VersionInformation[path] gives an association with my primitive home grown versioning system.";
VersionString::usage = "VersionString[path] returns the current build as a string. the option \"Build->True\" adds the build number to the end of the string.";
VersionWriteInformation::usage = "VersionWriteInformation[path,vi] takes a version information structure and writes it out. At this point it doesn't validate its structure.";
VersionBumpBuild::usage = "VersionBumpBuild[path] updates the build number in the version json file.";
VersionBuildString::usage = "VersionBuildString[path] returns the current build number as a string.";


UpdatePacletFile::usage = "UpdatePacletFile[ppath,vpath] writes a new PacletInfo file based on the current version and build in the FP version.json system.";
