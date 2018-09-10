#!/bin/bash

# get my version scripts
source ~/.bash_aliases

if [[ -e ./${VERSIONFILE} ]] ; then
    PACLET=`jq -r .name ${VERSIONFILE}`
    V=`versionstring`
    VF=`fullversionstring`
    PRERELEASE=`jq -r .prerelease ${VERSIONFILE}`
    PACLETFILE="${PACLET}-${V}.paclet"

    if [[ ${PRERELEASE} == "true" ]] ; then
        FLAGS="-p"
    else
        FLAGS=""
    fi

    echo "Releasing $PACLET version $V as $PACLETFILE"

    if [[ -e ${PACLETFILE} ]] ; then
        hub release create ${FLAGS} -a ${PACLETFILE} v${VF}
    else
        echo "release: No paclet file ${PACLETFILE}."
        exit 2
    fi
    
    # bump revision
    revbump
    exit 0
else
    echo "release: No ${VERSIONFILE} in present directory."
    exit 1
fi
