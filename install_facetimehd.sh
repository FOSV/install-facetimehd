#!/bin/bash

# Aggiorna la lista dei pacchetti e installa unzip se non è già installato
sudo apt-get update
sudo apt-get install -y unzip

# Crea una cartella temporanea
TEMP_DIR=$(mktemp -d)
echo "Directory temporanea creata: $TEMP_DIR"

# Naviga nella cartella temporanea
cd "$TEMP_DIR"

# Scarica il file utilizzando wget con content-disposition
wget --content-disposition https://cloud.mogbox.net/index.php/s/r8av1dUADSEQvXW/download

# Estrai il file ZIP nella cartella temporanea
unzip facetimehd-dkms_0.1_all-20221111.zip

# Installa il pacchetto .deb
sudo dpkg -i facetimehd-dkms_0.1_all-20221111.deb

# Risolve le dipendenze mancanti
sudo apt-get install -f

# Verifica l'installazione
dpkg -l | grep facetimehd

# Naviga fuori dalla cartella temporanea
cd ~

# Rimuove la cartella temporanea e tutto il suo contenuto
rm -rf "$TEMP_DIR"
echo "Directory temporanea e contenuto eliminati: $TEMP_DIR"

echo "Operazione completata!"
