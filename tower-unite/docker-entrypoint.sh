#!/bin/bash

# fix missing steamlib
cp /opt/tu/linux64/steamclient.so /opt/tu/Tower/Binaries/Linux/

# called intially no matter what
function update_and_start {
    # update TU server
    /opt/steamcmd/steamcmd.sh +login anonymous +force_install_dir /opt/tu +app_update 439660 validate +quit
    # start TU server
    exec /opt/tu/Tower/Binaries/Linux/TowerServer-Linux-Shipping -log  -Port="$TU_PORT" -QueryPort="$QUERY_PORT" "$@"
}

# vars
buildid_new=0
buildid_old=0

# if no autoupdate: update once and run TU server
if [ $AUTOUPDATE = false ]; then
    update_and_start
else
    while [ 1 ]; do
        # save buildid
        $buildid_new=$(curl -s 'https://steampics-mckay.rhcloud.com/info?apps=439660&prettyprint=1' | jq '.apps."439660".depots.branches.public.buildid' | sed 's/"//g')
    
        # if buildid_new != buildid_old: stop server, update and restart
        if [ $buildid_old != $buildid_new ]; then
            killall TowerServer-Linux-Shipping
            $buildid_old = $buildid_new
            update_and_start
        fi
        
        # sleep
        sleep $AUTOINTERVAL
    done
        
fi