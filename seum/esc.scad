include <Aremus/utils.scad>

// This part is for visualization only

// https://www.drone-fpv-racer.com/esc-4en1-blueson-a2-6s-65a-am32-sequre-14204.html
// CARACTÉRISTIQUES
// Processeur : AT32F421
// Fréquence PWM : 8-128 kHz
// Tension : LiPo/LiHV 2-6 S
// Courant continu : 65 A
// Burst : 120 A
// Protocoles pris en charge : Dshot600/300/150, Oneshot, Multishot, PWM
// Firmware : AM32
// Retour de télémétrie : Oui
// Ampèremètre : Oui
// BEC : Non
// Trou de montage : 30,5 x 30,5 mm M3
// Dimensions : 45,5 x 42,5 x 6 mm
// Poids : ~17 g

module esc() {
    dif() {
        kube(45.5,42.5, 6);

        mym(30.5/2) mxm(30.5/2) {
            cylinder(h=10, d=3, $fn=40, center=true);
        }
    }
    mym(30.5/2) mxm(30.5/2) {
        cylinder(h=15, d=3, $fn=40, center=true);
    }
}

esc();
