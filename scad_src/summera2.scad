include<utils.scad>
include<summera2_motor.scad>
include<summera2_arms.scad>

x_body=38;
y_spacement=20/2+inch_mm(3/2);
x_spacement=(x_body+12)/2+inch_mm(3/2);

z_size=6;

module prop3(){
    cylinder(h=3,d=inch_mm(3));
}


module mounting_hole() {
    mym(30/2)
    mxm(30/2)
    cylinder(h=100,d=5, center=true, $fn=30);
}

color([1,0,0])
mv(0,0,10) {

mv(0,0,z_size/2) {
    dif() {
        cube([35,25, z_size], center=true);
        union() {
        mym(43.5)
        cylinder(d=70, h=z_size, center=true, $fn=70);
        mxm(20.1)
        cylinder(d=16.2, h=z_size, center=true, $fn=70);
        }
    }
}


dif() {
union() {
motors_holder(y_spacement, x_spacement);
arms(y_spacement, x_spacement);
}
motors_holes(y_spacement, x_spacement);
}
}

/*
mounting_hole();
plate_x=38;
plate_z=4;
plate_y=140;

module rounded_square(x,y,z,r) {
    $fn=40;
    hull()
    miry()
    mirx()
    mv(x/2-r, y/2-r, 0)
    cylinder(r=r, h=z);
}

rounded_square(plate_x, plate_y, plate_z, 4);
*/


mym(y_spacement)
mxm(x_spacement)
%prop3();
