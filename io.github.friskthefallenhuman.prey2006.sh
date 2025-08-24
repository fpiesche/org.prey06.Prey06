#!/bin/bash
PREY_GAME_DATA_PATH=$XDG_DATA_HOME/prey06/base
if [[ ! -d "${PREY_GAME_DATA_PATH}" ]]; then
    mkdir -p "${PREY_GAME_DATA_PATH}"
fi

for gamedata_file in "${PREY_GAME_DATA_PATH}"/pak00{0,1,2,3,4}.pk4; do
    if [[ ! -f $gamedata_file ]]; then
        zenity --error --ok-label "Quit" --width=400 --text "
<b>Could not find Prey game data file <tt>$(basename $gamedata_file)</tt></b>\n\n
Please ensure you have copied the necessary game data files
(at least <tt>pak000.pk4</tt> through <tt>pak004.pk4</tt>)
from a Prey installation to\n<tt><b>${PREY_GAME_DATA_PATH}</b></tt>."
        exit 1
    fi
done

prey06 +set fs_basepath "${PREY_GAME_DATA_PATH}" $@
