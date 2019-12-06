#!/usr/local/bin/bash

APPLICATION_TO_EXCLUDE=$1
MODE=$2
APPLICATION_TO_EXCLUDE=${APPLICATION_TO_EXCLUDE^}
BUNDLE_ID="$(lsappinfo info -only bundleid ${APPLICATION_TO_EXCLUDE} | cut -d '"' -f4)"

if [ "${MODE}" == "dark" ]; then
    defaults delete $BUNDLE_ID NSRequiresAquaSystemAppearance
else
    defaults write $BUNDLE_ID NSRequiresAquaSystemAppearance -bool yes
fi