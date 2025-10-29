include <Aremus/utils.scad>

// This part is for visualization only

// https://www.drone-fpv-racer.com/dfr-f722-dual-hd-6814.html

// Connecteur USB universel de type C au lieu de micro USB
// Plug and Play
// Prend en charge de BLHeli pour une mise à niveau et une configuration faciles de l'ESC.
// Built in DJI Digital FPV.
// MCU: 216 MHz STM32F722
// Gyro ：ICM42688P
// Baro: DPS310
// Black box ：32 Mo
// Betaflight OSD: OUI
// BEC: 5 V 2,5 A / 9 V 2,5 A
// Onduleur pour entrée SBUS (UART2-RX)
// Prise en charge du protocole Smartaudio & Tramp VTX
// Bip sonore: Oui
// Pad d'entrée RSSI: Oui
// UART ： 5 (UART3 peut être utilisé en I2c)
// Sorties moteur: 8
// Port ESC 4 en 1 à 8 broches (GND, VBAT, M1, M2, M3, M4, CUR, R5)
// Port d'unité aérienne DJI 6 broches (R1, GND, R2, T2, GND, 9V)
// Télémétrie BLHeli32 ： RX5
// Tension d'entrée ： recommandée 2-6S, MAX 8S
// Modèle de montage: 30,5 * 30,5 mm φ4 mm avec œillets φ3 mm
// Dimensions: 36 * 36 mm
// Poids : 6.9g

module dfrf722() {
    dif() {
        kube(36,36, 4);

        mym(30.5/2) mxm(30.5/2) {
            cylinder(h=10, d=4, $fn=40, center=true);
        }
    }
    mym(30.5/2) mxm(30.5/2) {
        cylinder(h=15, d=3, $fn=40, center=true);
    }
}

dfrf722();
