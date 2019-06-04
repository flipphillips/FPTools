# Building and installing

## The FPTools Package

![](icon.png)

You need a few things -
    * `jq`
    * Arnoud's `Prototypes` 

From <https://github.com/arnoudbuzing/prototypes> and you can install via ---

`PacletInstall["https://github.com/arnoudbuzing/prototypes/releases/download/v0.0.0/Prototypes-0.0.0.paclet"]`

As of right now- `PacletInstall["https://github.com/arnoudbuzing/prototypes/releases/download/v0.5.3/Prototypes-0.5.3.paclet"]`

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
so, overall-

```bash
(base) maxwell:FPTools> ./build.wls 
Building FPTools from: /Users/flip/GitHub/FPTools
Found paclets (to be deleted): {/Users/flip/GitHub/FPTools/FPTools-1.0.10.paclet}
Building new paclet
New paclet: /Users/flip/GitHub/FPTools/FPTools-1.0.11.paclet
Found the following old paclets (uninstalling): {/Users/flip/Library/Mathematica/Paclets/Repository/FPTools-1.0.10}
Installing new paclet
Done
```
```bash
(base) maxwell:FPTools> ./release.sh 
Releasing FPTools version 1.0.11 as FPTools-1.0.11.paclet
github.com username: flipphillips
github.com password for flipphillips (never stored): 
two-factor authentication code: 118597
Attaching release asset `FPTools-1.0.11.paclet'...
https://github.com/flipphillips/FPTools/releases/tag/v1.0.11
```

