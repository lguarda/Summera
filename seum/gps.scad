include <Aremus/utils.scad>

// This part is for visualization only

// https://www.drone-fpv-racer.com/gps-goku-gm10-mini-v3-flywoo-10843.html#/10165-option-sans_compas
// Dimension : 18*18*4.8mm
// Poids : 4.5g
// Chipset : M10050 (puce de dixième génération)
// Format de réception : GPS, GLONASS, Galileo, BeiDou, QZSS et SBAS
// Protocole par défaut : GPS, Galileo, BeiDou
// Fréquence : GPS L1,GLONASS L1,BeiDou B1,SBAS L1,Galileo E1
// Canaux : 72 canaux de recherche
// Suivi : -162dBm
// Réacquisition : -160dBm
// Taux de prise en charge : 4800bps à 921600bps, 115200bps par défaut
// Niveau de données : TTL ou RS-232, niveau TTL par défaut
// Protocole de données : BF4.3.X(UBLOX)/BF4.2.X(NMEA)
// Fréquence de sortie : 1 Hz-10 Hz, 10 Hz par défaut
// Altitude : 50 000 m maximum
// Vitesse : 500 m/s maximum
// Accélération : Moins de 4g
// VCC : Tension DC : 5V
// Température de fonctionnement :　-40 °C ~ +85 °C
// Température de stockage : -40°C ~ +105°C

module gps() {
    kube(18,18, 4.8);
}

gps();
