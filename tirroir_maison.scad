include<utils.scad>
include<hexagone.scad>

$fn=100;

x=1.5;
y=1;
z=15;



mv(51.6,14,0)
cylinder(d=2, h=z, fn=1000);

mv(50.3,14,0)
cylinder(d=2, h=z, fn=1000);

fid() {
    mv(0,14/2,15/2)
        rot(0,90,0)
        cylinder(h=1000, d=5, center=true);

    union() {
        mv(49.2,0,0)
            cube([2.5,14,z]);
        mv(20,14,0)
            scale([1,1,15]) {
                rotate_extrude(angle = 90, convexity = 0){
                    translate([30,0,0]){
                        square([x,y]);
                    }
                }
            }
    }
}
