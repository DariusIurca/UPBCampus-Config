# UPBCampus-Config
Configurator de retea pentru UPB-Campus destinat echipamentelor care au instalat firmware-ul OpenWRT

Instructiuni:
Dupa ce ai instalat OpenWRT pe router-ul tau, conecteaza te la un hotspot WiFi din interfata de browser OpenWRT.
Deschide un terminal sau CMD si introdu comanda: ssh root@192.168.1.1
Dupa ce te-ai logat in SSH-ul router-ului, foloseste urmatoarele comenzi pentru a rula script-ul:

cd ~ | 
wget https://raw.githubusercontent.com/DariusIurca/UPBCampus-Config/main/configurator.sh | 
chmod +x configurator.sh | 
./configurator.sh | 

Acum, urmeaza instructiunile configuratorului.
