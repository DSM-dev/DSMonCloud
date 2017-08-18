#!/bin/bash


if [[ ${BLUSPARK_DOCKER_IP}"x" == "x" ]];then
  if [[ ${BLUSPARK_API_URL}"x" == "x" ]];then
     BLUSPARK_API_URL="/com/ibm/event/api/v1"
  fi

  if [[ ${BLUSPARK_API_USER}"x" == "x" ]];then
     BLUSPARK_API_USER="admin"
  fi

  if [[ ${BLUSPARK_API_PASSWD}"x" == "x" ]];then
    BLUSPARK_API_PASSWD="password"
  fi
  echo  "{
 \"servers\":{
    \"default\" : {
       \"url\": \"https://${BLUSPARK_DOCKER_IP}\" ,
       \"engine\": \"${BLUSPARK_ENGINES}\",
       \"eventStore\": \"${BLUSPARK_API_URL}\",
       \"user\": \"${BLUSPARK_API_USER}\",
       \"password\": \"${BLUSPARK_API_PASSWD}\"
    }
  }
}" >/opt/ibm-datasrvrmgr/Config/bluspark_server.json
fi


sh /opt/ibm-datasrvrmgr/bin/server-startup.sh
##while true; do
##  sleep 1
##done


