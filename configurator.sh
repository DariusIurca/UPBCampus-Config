# Acesta este un script BASH care instaleaza si configureaza automat (sper) WPAD-OpenSSL pe un router cu OpenWRT instalat.


echo "Configurator pentru reteaua UPB-Campus"
echo "Pentru suport accesati pagina de GitHub al acestui configurator (@dariusiurca)"
echo "Prin executarea acestui script, iti asumi faptul ca exista anumite riscuri ca echipamentul tau sa nu mai functioneze corect."
echo -e "Continuati cu executarea acestui script? (da/nu): "
read consent
if [ $consent == "da" ];
then
 echo "Se actualizeaza cache-ul managerului de pachete OPKG..."
 opkg update
 echo "Se instaleaza editorul Nano..."
 opkg install nano
 echo "Se sterge pachetul wpad-mini (daca acesta exista)..."
 opkg remove wpad-mini
 echo "Se instaleaza pachetul wpad-openssl..."
 opkg install wpad-openssl
 echo "Configurare WPAD"
 echo -e "Introduceti adresa de email asociata contului MyUPB: "
 read mail
 echo -e "Introduceti parola asociata contului MyUPB: "
 read psw
 cd /etc/config/
 cat > wpa.conf <<EOF
ctrl_interface=/var/run/wpa_supplicant
ap_scan=0
network={
        key_mgmt=IEEE8021X
        eap=PEAP
        identity="$mail"
        password="$psw"
        phase2="auth=MSCHAPV2"
        priority=2
}
EOF
 echo "Configurare router"
 cd /etc/init.d/
 cat > wpa-autostart <<EOF
#!/bin/sh /etc/rc.common
# Copyright (C) 2007 OpenWrt.org
START=99

start() {
echo start
wpa_supplicant -D wired -i eth0.2 -c /etc/config/wpa.conf &
}
EOF
echo "Configurarea s-a finalizat! Spor la internet!"
 chmod +x /etc/init.d/wpa-autostart
 /etc/init.d/wpa-autostart enable
 /etc/init.d/wpa-autostart start
fi
