include <Aremus/utils.scad>

// Weight: 0.46g (Flat Antenna V1.2), 0.47g (Tower Antenna)
// Size: 11mm*10mm*3mm (Flat), 10mm*10mm*6mm (Tower)
// MCU: ESP8285
// Telemetry power: 17mW
// Frequency bands: 2.4GHz ISM
// Input voltage: 5V
// Antenna: Integrated SMD ceramic antenna

module tx() {
    kube(11,10, 3);
    my(-4)
    mxm(2.4)
    mxm(1.2)
    xrot(90)
    cylinder(h=3, d=1.2);
}

tx();
