include<utils.scad>
include<hexagone.scad>
include<trapeze.scad>

$fn=100;
in=2.8;
out=5.85;
h=30;

camera_screw_diam=2;
camera_depth=15.5;
camera_spacing=19;
camera_holder_height=19;
spacer_dist=28;
camera_holder_length=19;
side_length=camera_holder_length-8.46;
angle_both=2;

dif() {
/*mirx()*/
/*mirror()*/
    union() {
        mv(spacer_dist/2,0,0) {
            rot(0,0,18+angle_both)
            mv(0,1.5,(h-camera_holder_height)/-2)
            trapeze(3.5, 2,camera_holder_height, side_length-1.6);
            /*cube([side_length,3,camera_holder_height], center=true);*/
            fid() {
                cylinder(h=h+1, d=in, center=true);
                rot(0,0,-12+angle_both)
                Hexagone(out, h);
            }
        }
        mv(camera_spacing/2+1,camera_depth-1.8,(h-camera_holder_height)/-2)
            cube([2,19/2,camera_holder_height], center=true);
    }



mv(0,camera_depth-2,0)
rot(0,90,0)
cylinder(h=100, d=camera_screw_diam,center=true);
}

//v3 change space size from 4.85 to 5.85
