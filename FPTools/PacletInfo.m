Paclet[
	Name -> "FPTools",
	Description -> "Tools for introspection, debugging, syntatic sugar, etc.",
	Creator -> "Flip Phillips <flip@skidmore.edu>",
	Publisher -> "Skidmore Vision Lab",
	Copyright -> "©2018- Flip Phillips & Misc Contributors",
	License -> "MIT",
	Version -> "1.0.9",
	BuildNumber -> "198",
	MathematicaVersion -> "11.2+",
	URL -> "https://github.com/flipphillips/FPTools",
	Thumbnail -> "Documentation/icon.png",
	Loading -> Automatic,
	Extensions -> {
	 { "Documentation", 
			MainPage -> "Guides/FPTools", 
			Language -> "English"},
	 { "Kernel", 
		Symbols -> {
			(* globals *)
			"FPTools`$FPToolsVersion","FPTools`$FPToolsDebug",

			(* data *)
			"FPTools`ImportAsDataset", "FPTools`Overlap",
			
			(* Entity *)
			"FPTools`EntityPropertiesDataset",
			"FPTools`ConceptBroaden","FPTools`ConceptDistance","FPTools`ConceptDepth",
		
			(* GAs *)
			"FPTools`GARepopulate","FPTools`GAMutate","FPTools`GACrossover",

			(* Graphics *)
			"FPTools`RectangleToDisk",

			(* Geometry *)
			"FPTools`RectangularToPhiTheta",
			"FPTools`PhiThetaToDirection",
			"FPTools`RectangularToDirection",
			"FPTools`DirectionToRectangular",
			"FPTools`CircularToAngular",
			"FPTools`AngularToDirection",
			"FPTools`CircularToDirection",
			"FPTools`DirectionToCircular",

			(* Image *)
			"FPTools`ImageIdentifyFP",
			"FPTools`BlurFaces","FPTools`FindFaceImages",
			"FPTools`AddAlphaChannel",
			"FPTools`LensDistortPoint", "FPTools`LensDistortionCorrection",
			"FPTools`ParallelImageApplyIndexed",
			"FPTools`InterleavingQ","FPTools`ImageInformation",

			(* ffmpeg *)
			"FPTools`$FFMpegPath", "FPTools`ImportMP4Frame", "FPTools`ImportMP4Frames", "FPTools`ImportWebFrame",
			
			(* internet *)
			"FPTools`$MachineAddressesExternal",

			(* introspection *)
			"FPTools`Spelunk","FPTools`PropertiesAvailability","FPTools`PropertiesDataset",
			"FPTools`NewKernelEvaluate","FPTools`GetSymbolsDefinedInMX",
			"FPTools`GetCompilerFunctions",

			(* signals *)
			"FPTools`FindZeroCrossings","FPTools`UnitizedGaussianPDF",
			"FPTools`FFTShift",
			"FPTools`InverseFFTShift",
			"FPTools`RealSphericalHarmonicY",

			(* statistics *)
			"FPTools`LocationReport",
			"FPTools`ShapeReport",
			"FPTools`DispersionReport",
			"FPTools`StandardDeviationMLE",
			"FPTools`VarianceMLE",
			"FPTools`StandardErrorOfSampleMean",
			"FPTools`VarianceOfSampleMean",
			"FPTools`CoefficientOfVariation",
			"FPTools`ZeroMean",
			
			(* sugar *)
			"FPTools`ApplyIf",
			"FPTools`ToCartesianRules",
			"FPTools`ToSphericalRules",

			(* versioning *)
			"FPTools`VersionInformation",
			"FPTools`VersionString","FPTools`VersionBuildString",
			"FPTools`VersionWriteInformation","FPTools`VersionBumpBuild",
			"FPTools`UpdatePacletFile"

		},
	 Context -> {"FPTools`"} }
	}
]