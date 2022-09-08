# Creando directorios

mkdir PS2SMB
cd PS2SMB
mkdir APPS ART CD CFG CHT DVD LNG POPS THM VMC
cd ..
chmod 777 ./PS2SMB 
# Configurando e instalando samba para compartir

sudo su
apt update -y && apt -y install samba
#sip /etc/samba/smb.conf

sudo systemctl restart smbd nmbd

