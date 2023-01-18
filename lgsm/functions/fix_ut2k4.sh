#!/bin/bash
# LinuxGSM fix_ut2k4.sh module
# Author: Daniel Gibbs
# Contributors: http://linuxgsm.com/contrib
# Website: https://linuxgsm.com
# Description: Resolves various issues with Unreal Tournament 2004.

functionselfname="$(basename "$(readlink -f "${BASH_SOURCE[0]}")")"

echo -e "applying WebAdmin ut2003.css fix."
echo -e "http://forums.tripwireinteractive.com/showpost.php?p=585435&postcount=13"
sed -i 's/none}/none;/g' "${serverfiles}/Web/ServerAdmin/ut2003.css"
sed -i 's/underline}/underline;/g' "${serverfiles}/Web/ServerAdmin/ut2003.css"
fn_sleep_time
echo -e "applying WebAdmin CharSet fix."
echo -e "http://forums.tripwireinteractive.com/showpost.php?p=442340&postcount=1"
sed -i 's/CharSet="iso-8859-1"/CharSet="utf-8"/g' "${systemdir}/UWeb.int"
fn_sleep_time
echo -e "applying OpenSpy master server fix."
echo -e "http://beta.openspy.net/en/howto/ut2k-engine/ut2004"
sed -i 's/MasterServerList=(Address="ut2004master1.epicgames.com",Port=28902)/MasterServerList=(Address="utmaster.openspy.net",Port=28902)/' "${systemdir}/UT2004.ini"
sed -i '/MasterServerList=(Address="ut2004master2.epicgames.com",Port=28902)/d' "${systemdir}/UT2004.ini"
fn_sleep_time
echo -e "applying server name fix."
fn_sleep_time
echo -e "forcing server restart."
fn_sleep_time
exitbypass=1
command_start.sh
fn_firstcommand_reset
sleep 5
exitbypass=1
command_stop.sh
fn_firstcommand_reset
exitbypass=1
command_start.sh
fn_firstcommand_reset
sleep 5
exitbypass=1
command_stop.sh
fn_firstcommand_reset
