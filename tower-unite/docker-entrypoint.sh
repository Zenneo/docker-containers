#!/bin/bash

# fix missing steamlib
cp /opt/tu/linux64/steamclient.so /opt/tu/Tower/Binaries/Linux/

# called intially no matter what
function update_and_start {
    # update TU server
    echo "Updating server"
    /opt/steamcmd/steamcmd.sh +login anonymous +force_install_dir /opt/tu +app_update 439660 validate +quit
    # start TU server
    echo "Starting server"
    if [ "$1" = "with-exec" ]; then
        # remove "with-exec"
        shift
        # replace bash with server
        exec /opt/tu/Tower/Binaries/Linux/TowerServer-Linux-Shipping -log  -Port="$TU_PORT" -QueryPort="$QUERY_PORT" "$@"
    else
        # run server in background
        /opt/tu/Tower/Binaries/Linux/TowerServer-Linux-Shipping -log  -Port="$TU_PORT" -QueryPort="$QUERY_PORT" "$@" &
    fi
}

# vars
buildid_new=0
buildid_old=0

# if no autoupdate: update once and run TU server
if [ "$AUTOUPDATE" = "false" ]; then
    # with-exec will use exec so that server replaces bash
    update_and_start "with-exec"
else
    while [ 1 ]; do
        echo "Looking for updates"
        # save buildid
        # this line is a modified version of line 17 in https://gist.githubusercontent.com/Scrxtchy/0e46117968a9267442583787e4ea5fc9/raw/e5fbea5ddefe30b7d45b83ed3fea2bc6bf78c5d2/tu.sh
        buildid_new=$(curl -s 'https://steampics-mckay.rhcloud.com/info?apps=439660&prettyprint=0' | jq '.apps["439660"].depots.branches.public.buildid' | sed 's/"//g')
    
        # if buildid_new != buildid_old: stop server, update and restart
        if [ "$buildid_old" != "$buildid_new" ]; then
            echo "Stopping server"
            killall TowerServer-Linux-Shipping
            update_and_start
            buildid_old="$buildid_new"
        else
            # no update necessary; sleep
            echo "Server is up-to-date. Sleeping..."
            sleep $AUTOINTERVAL
        fi
        
    done
        
fi