include<utils.scad>
include<hexagone.scad>

$fn=40;
height=5.5;
spacing=55;
lenght=spacing+20;

screw_diam=4.2;

magnet_diam=8.5;


fid() {
    union(){
        mv(spacing/2,0,0)
            cylinder(d=screw_diam,h=100, center=true);
        mv(spacing/-2,0,0)
            cylinder(d=magnet_diam,h=100, center=true);
    }

    cube([lenght, magnet_diam*1.5, height], center=true);
}
