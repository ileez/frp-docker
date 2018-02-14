#!/bin/bash
#########################################################################
# File Name: entrypoint.sh
# Version:0.1.20180214
# Created Time: 2018-02-14
#########################################################################

set -e
FRPC_BIN="/usr/local/frpc/frpc"
FRPC_CONF="/usr/local/frpc/frpc.ini"
FRPC_LOG="/var/log/frpc.log"

str_log_level=${str_log_level:-info}   # set log level: debug, info, warn, error

echo "+---------------------------------------------+"
echo "|              Frpc On Docker                 |"
echo "+---------------------------------------------+"
echo "|       Images:{frpc-docker:0.16.0}           |"
echo "+---------------------------------------------+"
echo "|     Intro: https://github.com/ileez         |"
echo "+---------------------------------------------+"
echo ""
if [ ! -r ${FRPC_CONF} ]; then
	    echo "config file ${FRPC_CONF} not found"
	        exit 1
fi
	touch ${FRPC_LOG} > /dev/null 2>&1
	echo "Starting frpc $(${FRPC_BIN} -v) ..."
	echo "${FRPC_BIN} -c ${FRPC_CONF} -L ${FRPC_LOG} --log-level=${str_log_level}"
	      ${FRPC_BIN} -c ${FRPC_CONF} -L ${FRPC_LOG} --log-level=${str_log_level} &
	tail -f ${FRPC_LOG}
	exec "tail" -f ${FRPC_LOG}
