#!/bin/bash
DATE=$(date '+%d/%m/%Y %H:%M:%S %Z')
LOG_ONLINE=/root/httpd-online.log
LOG_OFFLINE=/root/httpd-offline.log
touch -a ${LOG_ONLINE} ${LOG_OFFLINE}
STATUS=$(systemctl status httpd | grep Active | awk '{print $2}')
MENSAGEM_BASE="${DATE} - httpd ${STATUS}"
MENSAGEM_OFFLINE='O serviço do Apache está inativo'
MENSAGEM_ONLINE='O serviço do Apache está ativo'
if [[ ${STATUS} == 'inactive' ]]; then
  echo "${MENSAGEM_BASE} - ${MENSAGEM_OFFLINE}" >> ${LOG_OFFLINE}
elif [[ ${STATUS} == 'active' ]]; then
  echo "${MENSAGEM_BASE} - ${MENSAGEM_ONLINE}" >> ${LOG_ONLINE}
fi
exit 0
