Paclet[
	Name -> "FPTools",
	Description -> "Tools for introspection, debugging, syntatic sugar, etc.",
	Creator -> "Flip Phillips <flip@skidmore.edu>",
	Publisher -> "Skidmore Vision Lab",
	Copyright -> "©2018- Flip Phillips & Misc Contributors",
	License -> "MIT",
	Version -> "0.1.15",
	BuildNumber -> "135",
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
			"FPTools`ImportAsDataset", 
			
			(* Entity *)
			"FPTools`EntityPropertiesDataset",
			"FPTools`ConceptBroaden","FPTools`ConceptDistance","FPTools`ConceptDepth",
		
			(* GAs *)
			"FPTools`GARepopulate","FPTools`GAMutate","FPTools`GACrossover",

			(* Graphics *)
			"FPTools`RectangleToDisk",

			(* Image *)
			"FPTools`ImageIdentifyFP",
			"FPTools`BlurFaces","FPTools`FindFaceImages",
			"FPTools`AddAlphaChannel",
			"FPTools`LensDistortPoint", "FPTools`LensDistortionCorrection",
			(* ffmpeg *)
			"FPTools`$FFMpegPath", "FPTools`ImportMP4Frame", "FPTools`ImportMP4Frames", "FPTools`ImportWebFrame",
			
			(* internet *)
			"FPTools`$MachineAddressesExternal",

			(* introspection *)
			"FPTools`Spelunk","FPTools`PropertiesAvailability","FPTools`PropertiesDataset",
			"FPTools`NewKernelEvaluate","FPTools`GetSymbolsDefinedInMX",

			(* signals *)
			"FPTools`FindZeroCrossings","FPTools`UnitizedGaussianPDF",

			(* sugar *)
			"FPTools`ApplyIf",

			(* versioning *)
			"FPTools`VersionInformation",
			"FPTools`VersionString","FPTools`VersionBuildString",
			"FPTools`VersionWriteInformation","FPTools`VersionBumpBuild",
			"FPTools`UpdatePacletFile"

		},
	 Context -> {"FPTools`"} }
	}
]