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

### Added
- `UnitizedGaussianPDF`

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
- `ImportAsDataset` (Not DatasetImport to avoid collision w/ Arnaud's)
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