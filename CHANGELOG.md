# Change Log

## The FPTools Package

![](icon.png)

<!--
## Types of changes

- `Added` for new features.
- `Changed` for changes in existing functionality.
- `Deprecated` for soon-to-be removed features.
- `Removed` for now removed features.
- `Fixed` for any bug fixes.
- `Security` in case of vulnerabilities. 
-->

## [Unreleased changes]

* * *

## [1.0.9] - 2019-06-03

### Changed

- Now requires Arnoud's `Prototypes`

### Added

- `Statistics.wl` - routines from the pre v5 stats packages
- `Overlap` - where do two lists of events overlap. There's probably a time-series function that does this but I just have data and don't want to have to cram it into a TS. (e.g., my data is spatial so TS is the wrong metaphor)
- `ParallelImageApplyIndexed`
- `GetCompilerFunctions`
- `ImageInformation`
- `InterleavingQ`
- `BUILD.md`

### Fixed

- missing trailing ; in `Sugar.wl`
- `build.wls` and `install.wls` added `Get` for package so it could build from cold-and-dark.

* * *

## [1.0.3] - 2018-08-04

### Added

- `FFTShift` and `InverseFFTShift` to mimic Matlab's stuff.
- `RealSphericalHarmonicY` real-valued SHs
- `ToCartesianRules` and `ToSphericalRules` handy xyz<->rtp 

### Changed
- Added `GetSymbolsDefinedInMX` and `NewKernelEvaluate` documentation.
- `GetSymbols...` returns `None` if there are no symbols defined.
- only prints out loading message if `Debug` symbol is set. 

## [1.0.1] - 2018-05-01
### Added
- `NewKernelEvaluate`
- `GetSymbolsDefinedInMX`
- `FindFaceImages`
- New `install` script to install w/o building

### Changed
- minor housekeeping


## [0.1.14] - 2018-04-24

### Added
- `UnitizedGaussianPDF`
- lens distortion model

### Changed
- `RunProcess` instead of `Run` in the ffmpeg stuff

## [0.1.13] - 2018-04-14

- Released a 0.1.12pre for classroom use 11 April

### Added
- `ImportMP4Frame`
- `ImportMP4Frames`
- `$FFMpegPath`
- Simple Genetic Algorithm
- some sample data files

### Changed
- Refactor into `Signal.wl`

### Fixed
- Documentation

## [0.1.11] - 2018-04-04
- Released for classroom stuff

### Added
- `Data.wl`
- `Signals.wl`
- `ImportAsDataset` (Not DatasetImport to avoid collision w/ Arnoud's)
- `FindZeroCrossings`
- `ImportWebFrame`

### Changed
- `BlurFaces` can blur disks, eyes, outlines, etc. 

## [0.1.10] - 2018-04-01

### Changed
- refactored `FP` out of everything possible (FP remains in things that 'override' WL functions)
- unprotected the globals
- readme points to docs
- build builds documentation (but doesn't push it)

### Added
- `Graphics.wl`
- `RectangleToDisk`
- `AddAlphaChannel`

### Fixed
- `$FPToolsVersion` works now.

### Removed
- Deleted the 'how to' guide and folded it into the main documentation.
- `ClassTools.wl` - for now.

## [0.1.9] - 2018-03-27
### Changed
- `PropertiesInformation -> PropertiesAvailability`
- Works for larger range of object types
- build uses / generates globals now

### Added
- `ClassTools.wl` - things for classroom examples until I migrate them
- `FPBlurFaces`
- `$FPToolsVersion` & `$FPToolsDebug`

## [0.1.8] - 2018-03-20

### Added
- Property tools to Introspection
- icon
- this changelog
- Writes its own paclet stuff now using my version package
- Bunch of Entity tools

### Changed
- main methods of property tools
- loading message

## [0.1.3] - 2018-03-01

### Added

- First changelog