#!/bin/bash

##Aggiorna il sistema
sudo yum update -y

#Installa i tool necessari
sudo yum install git wget sqlite gcc-c++ sqlite-devel -y

#Creo la cartella di gitea
sudo mkdir -p /REPOSITORY/gitea
cd /REPOSITORY/gitea

#Scarico la versione deiderata di gitea
VERSION=1.10.2
wget -O gitea https://dl.gitea.io/gitea/${VERSION}/gitea-${VERSION}-linux-amd64

#Setto i permessi di esecuzione per gitea
sudo chmod +x gitea

#Sposto l'esecuibile sotto la cartella /usr/local/bin
sudo mv gitea /usr/local/bin

#Creo l'utente git per Gitea
sudo useradd \
--system \
--shell /bin/bash \
--comment 'Gitea Version Control' \
--create-home \
--home-dir /REPOSITORY/gitea \
git

#Preaparo tutte #!/bin/bash

##Aggiorna il sistema
sudo yum update -y

#Installa i tool necessari
sudo yum install git wget sqlite gcc-c++ sqlite-devel -y

#Creo la cartella di gitea
sudo mkdir -p /REPOSITORY/gitea
cd /REPOSITORY/gitea

#Scarico la versione deiderata di gitea
VERSION=1.10.2
wget -O gitea https://dl.gitea.io/gitea/${VERSION}/gitea-${VERSION}-linux-amd64

#Setto i permessi di esecuzione per gitea
sudo chmod +x gitea

#Sposto l'esecuibile sotto la cartella /usr/local/bin
sudo mv gitea /usr/local/bin

#Creo l'utente git per Gitea
sudo useradd \
--system \
--shell /bin/bash \
--comment 'Gitea Version Control' \
--create-home \
--home-dir /REPOSITORY/gitea \
git

#Preaparo tutte le directory di lavoro per gitea
sudo mkdir -p /REPOSITORY/gitea/app/{custom,data,log}
sudo mkdir -p /REPOSITORY/gitea/conf
sudo mkdir -p /REPOSITORY/gitea/repository/gitea-repositories
sudo cp app.ini /REPOSITORY/gitea/conf/
sudo chown -R git:git /REPOSITORY

#creo il servizio di gitea
sudo cp gitea.service /etc/systemd/system/

#Aggiorno il demone per prendere il nuovo servizio e avvio il servizio
sudo systemctl daemon-reload
sudo systemctl enable --now gitea
sudo systemctl status giteale directory di lavoro per gitea
sudo mkdir -p /REPOSITORY/gitea/app/{custom,data,log}
sudo mkdir -p /REPOSITORY/gitea/conf
sudo mkdir -p /REPOSITORY/gitea/repository/gitea-repositories
sudo cp app.ini /REPOSITORY/gitea/conf
sudo chown -R git:git /REPOSITORY

#creo il servizio di gitea
sudo cp gitea.service /etc/systemd/system

#Aggiorno il demone per prendere il nuovo servizio e avvio il servizio
sudo systemctl daemon-reload
sudo systemctl enable --now gitea
sudo systemctl status gitea
