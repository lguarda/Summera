include<utils.scad>
include<hexagone.scad>

$fn=100;
in=2.8;
out=4.85;
h=30;

camera_screw_diam=2;
camera_depth=16;
camera_spacing=19;
camera_holder_height=19;
spacer_dist=28;
camera_holder_length=19;
side_length=camera_holder_length-8.46;

/*dif() {*/
/*[>mirx()<]*/
/*mirror()*/
    /*union() {*/
        /*mv(spacer_dist/2,0,0) {*/
            /*rot(0,0,-73)*/
            /*mv(side_length/-2-1.8,0,0)*/
            /*cube([side_length,2,camera_holder_height], center=true);*/
            /*fid() {*/
                /*cylinder(h=h+1, d=in, center=true);*/
                /*Hexagone(out, h);*/
            /*}*/
        /*}*/
        /*mv(camera_spacing/2+1,camera_depth-1.8,0)*/
            /*cube([2,19/2,camera_holder_height], center=true);*/
    /*}*/



/*mv(0,camera_depth-2,0)*/
/*rot(0,90,0)*/
/*cylinder(h=100, d=camera_screw_diam,center=true);*/
/*}*/

fid() {
    cylinder(h=h+1, d=in, center=true);
    Hexagone(out, 6);
}

/*mv(0,19,0)*/
/*cube([19,1,1], center=true);*/
