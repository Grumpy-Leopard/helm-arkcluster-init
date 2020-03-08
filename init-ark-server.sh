#!/bin/bash

ARKFOLDER="/home/steam/ark"
ARKSAVEFOLDER="$ARKFOLDER/ShooterGame/Saved"
ARKCONFIGFOLDER="$ARKSAVEFOLDER/Config/LinuxServer"

echo Running Steam Update/Validate ...
./steamcmd/steamcmd.sh +login anonymous +force_install_dir $ARKFOLDER +app_update 376030 validate +quit

if [ -n "$CONFIGURL" ]; then
    echo "Pulling down config files from $CONFIGURL ...";
    curl "$CONFIGURL/Game.ini" > "$ARKCONFIGFOLDER/Game.ini"
    curl "$CONFIGURL/GameUserSettings.ini" > "$ARKCONFIGFOLDER/GameUserSettings.ini"
else
    echo "Config file URL not set, using defaults.";
fi

