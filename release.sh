#!/bin/bash

# get my version scripts
source ~/.bash_aliases

if [[ -e ./${VERSIONFILE} ]] ; then
    PACLET=`jq -r .name ${VERSIONFILE}`
    V=`versionstring`
    PACLETFILE="${PACLET}-${V}.paclet"

    echo "Releasing $PACLET version $V as $PACLETFILE"

    if [[ -e ${PACLETFILE} ]] ; then
        hub release create -a ${PACLETFILE} v${V}
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
