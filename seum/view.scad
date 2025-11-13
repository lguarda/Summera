use <Aremus/utils.scad>
use <arms.scad>
use <bottom_plate.scad>
use <esc.scad>
use <fc.scad>
use <gps.scad>
use <motor_base.scad>
use <props3.scad>
use <tx.scad>
use <vtx.scad>

use <part_main_frame.scad>
use <part_top_plate.scad>

fc_spacing = 8;
esc_spacing = 6;

mz(15) props_true_x();

mx(-42)
{
    co(0.5, 0.2, 0.2) vtx();
    mz(10) tx();
}


mz(esc_spacing)
co(1, 0, 0) esc();

mz(fc_spacing + esc_spacing) co(1, 0, 1) fc();

mz(50) co(1, 1, 0) gps();

xrot(180)
part_main_frame();

mz(21)
part_top_plate(h=2, center=false);
// Dimensions: 33.6*22.8*4.1 mm
