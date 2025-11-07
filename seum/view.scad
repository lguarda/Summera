use <Aremus/utils.scad>
use <props3.scad>
use <esc.scad>
use <fc.scad>
use <gps.scad>
use <vtx.scad>
use <tx.scad>
use <arms.scad>
use <motor_base.scad>

fc_esc_spacing=10;

mz(30)
props_true_x();

mx(-42) {
    co(0.5, 0.2, 0.2)
    vtx();
    mz(10)
    tx();
}

co(1, 0, 0)
esc();

mz(fc_esc_spacing)
co(1, 0, 1)
fc();

mz(50)
co(1, 1, 0)
gps();

arms2();

// Dimensions: 33.6*22.8*4.1 mm
