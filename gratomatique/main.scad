include <BOSL2/std.scad>
include <BOSL2/gears.scad>
include <Aremus/utils.scad>

// https://github.com/BelfrySCAD/BOSL2/wiki/gears.scad

//teeth = 15;
//
//hide = teeth - 5;
//rot (0,0, -77) {
//    spur_gear2d(circ_pitch=6, teeth=teeth, hide=hide, pressure_angle=20);
//    cylinder(center=true, r=11.34, $fn=100);
//}
//
////rack2d(mod=2, teeth=10, thickness=5, bottom=5, pressure_angle=20,orient=BACK);
//mv(0,-13.5,0)
//rack2d(mod=2, teeth=10, bottom=5, pressure_angle=20);

//mv(0, 50, 0) {
//    rack(mod=2, teeth=10, thickness=5, bottom=5, pressure_angle=14.5,orient=BACK);
//    color("red") {
//        spur_gear(mod=2, teeth=teeth, hide=hide, thickness=5, pressure_angle=14.5,anchor=FRONT,profile_shift=0);
//        cylinder(center=true, r=11.34, $fn=100);
//    }
//
//}

//pos = 3*(1-2*abs($t-1/2))-1.5;
//
//rack(mod=2, teeth=10, thickness=5, bottom=5, pressure_angle=14.5,orient=BACK);
//mv (0,teeth*2,0)
//rack(mod=2, teeth=10, thickness=5, bottom=5, pressure_angle=14.5,orient=FRONT);
//color("red") spur_gear(mod=2, shaft_diam=3, teeth=teeth, hide=hide, thickness=5, pressure_angle=14.5,anchor=FRONT,profile_shift=0, gear_spin=180-pos*360/teeth);

include <BOSL2/std.scad>
include <BOSL2/gears.scad>
$fn=12;
n1 = 11; // red gear number of teeth
n5 = 9;  // gray rack
n6 = 9;  // blue rack

circ_pitch = 9; //all meshing gears need the same `circ_pitch` (and the same `pressure_angle`)
thickness    = 4;
hole         = 3;
rack_base    = 12;
d1r = gear_dist(circ_pitch=circ_pitch,teeth1=n1,teeth2=0);
time = $t * 3;
a1 = time * 360 / n1;

gear_bearing_diam=12;
//PART_ONLY=true;
//PART="FRAME";

color("#f77")
part("GEAR") {
    //zrot(70)
    zrot(-6.6)
    zrot(a1) spur_gear(circ_pitch,n1,thickness,hole, hide=8);
    cylinder(center=true, h=thickness, r=13, $fn=100);
    mz(3) {
        dif() {
            cylinder(center=true, h=thickness, d=gear_bearing_diam, $fn=100);
            kube(4,4,thickness+1);
        }
    }
}

color("#77f")
part("INNER_FRAME") {
     fwd(d1r)// right(circ_pitch*time)
        rack(pitch=circ_pitch,teeth=n5,thickness=thickness,width=rack_base,anchor=CENTER,orient=BACK);
    back(d1r)// right(circ_pitch*time)
        rack(pitch=circ_pitch,teeth=n5,thickness=thickness,width=rack_base,anchor=CENTER,orient=FRONT);

    x = 5;
    y = (d1r+circ_pitch)*2;
    z = thickness;

    mxm((n5*circ_pitch)/2)
    kube(x, y, z);
}

frame_clearance=0.9;
color([1,1,1,0.4])
//right(circ_pitch*time)
part("FRAME") {
    x = n5*circ_pitch + frame_clearance;
    y = (d1r+circ_pitch)*2 + frame_clearance;
    z = thickness + frame_clearance;
    dif() {
        kube(x+5,y+5,z+5);
        union() {
            kube(x+1000,y,z);
            mv(22,0, 5)
            kube((n5*circ_pitch+gear_bearing_diam)/2, gear_bearing_diam+0.5, 10);
            mz(3)
            cylinder(center=true, h=thickness, d=gear_bearing_diam+0.5, $fn=100);
        }
    }
}
