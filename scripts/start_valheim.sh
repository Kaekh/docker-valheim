#!/bin/bash
export templdpath=$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=./linux64:$LD_LIBRARY_PATH
export SteamAppId=892970

bash steamcmd +force_install_dir "${HOME}" +login anonymous +app_update 896660 validate +quit

# Tip: Make a local copy of this script to avoid it being overwritten by steam.
# NOTE: Minimum password length is 5 characters & Password cant be in the server name.
# NOTE: You need to make sure the ports 2456-2458 is being forwarded to your server through your local router & firewall.
./valheim_server.x86_64 -nographics -batchmode -name "${SERVERNAME}" -port ${PORT} -world "${WORLDNAME}" -password "${PASSWORD}"

export LD_LIBRARY_PATH=$templdpath
