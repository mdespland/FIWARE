# FIWARE LAB

[FIWARE Lab start](https://www.fiware.org/developers/fiware-lab/)

C'est une solution d'hebergement permettant de tester gratuitement le déploiement de projet FIWARE.


C'est une base OpenStack

[FIWARE LAB](https://cloud.lab.fiware.org/project/)


Pour les besoins de la formation nous utiliserons une VM centos 7 de type m1.large à laquelle nous ajouterons une floating IP.

## How To

* Créer un paire de clé
* Créer une ```Security Rule``` authorisant TCP (22, 1026, 80, 443 et 3000) 
* Créer une instance Centos7 (sans se linux) avec la pair de clé et la security rule créée précedement
* Ajouter une IP flotante

```
ssh -i ../marc.pem 195.220.224.147
```

## Preparation de la VM

Installation de docker et docker-compose

```
systemctl stop firewalld.service
systemctl disable firewalld.service
yum update
yum install -y yum-utils git
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
yum install -y docker-ce docker-ce-cli containerd.io
systemctl start docker
systemctl enable docker
```

The continue the installation
```
curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
cd /opt
git clone https://github.com/mdespland/FIWARE.git


```

[Back to README](./README.md)