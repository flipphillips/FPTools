# Building and installing

## The FPTools Package

![Icon](icon.png)

## Build

There is a build script that does versioning, removes old paclets, and installs a new one

```bash
(base) maxwell:FPTools> ./build.wls
Building FPTools from: /Users/flip/GitHub/FPTools
Found paclets (to be deleted): {}
Building new paclet
New paclet: /Users/flip/GitHub/FPTools/FPTools-1.0.9.paclet
Found the following old paclets (uninstalling): {}
Installing new paclet
Done
```

## Install

Similar, but doesn't do full paclet build, just installs.

```bash
(base) maxwell:FPTools> ./install.wls
```

## Release

Sends release to GitHub

```bash
(base) maxwell:FPTools> ./release.sh
```

