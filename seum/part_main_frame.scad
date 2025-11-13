use <Aremus/utils.scad>
use <arms.scad>
use <bottom_plate.scad>
use <motor_base.scad>

module part_main_frame(arm_height = 4, plate_height = 2)
{
    arms2(h = arm_height);
    mxm(inch_mm(3)) mym(-inch_mm(3)) zrot(-20) motor_base(13, 1.2, 70, arm_height, center = false);
   // bottom_plate(center = false, h = plate_height);
    bottom_plate(center = false, h=plate_height, w=38, l=128);
}

part_main_frame();

// et parfois l'oaccation special c'est qu'il y a une bouteil de champagne au frais
