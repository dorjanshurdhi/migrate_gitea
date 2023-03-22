#!/bin/bash

##Fermo il servizio di gitea
sudo systemctl stop gitea

# Setto le varibili per prendere il bck dalla vecchia istanza Gitea
OLD_GITEA_USER="root"  
OLD_GITEA_HOST="64.226.94.101" 
OLD_GITEA_DIR="/REPOSITORY/gitea" 
NEW_GITEA_DIR="/REPOSITORY/gitea"  
FILENAME="gitea.tar.gz" 

# Connessione SSH alla vecchia macchina di Gitea
ssh ${OLD_GITEA_USER}@${OLD_GITEA_HOST} "tar czf - ${OLD_GITEA_DIR}" > ${NEW_GITEA_DIR}/${FILENAME}

echo "Archivio creato e trasferito in ${NEW_GITEA_DIR}/${FILENAME}"

#scompatto il pacchetto tar nella cartella locale
cd ${NEW_GITEA_DIR}
tar -p --same-owner -zxvf ${FILENAME}

#Sostituisco le cartelle app e repository
rm -fr app
mv REPOSITORY/gitea/app .
rm -fr repository
mv REPOSITORY/gitea/repository .

#rimovo le cartelle che non servono più
rm -fr REPOSITORY 
rm -fr gitea.tar.gz

#mi assicuro che la cartella gitea abbia come owner git
sudo chown -R git:git /REPOSITORY/gitea

#Riavvio il servizio di gitea
sudo systemctl start gitea.service
