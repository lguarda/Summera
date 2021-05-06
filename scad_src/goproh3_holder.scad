include<utils.scad>
include<hexagone.scad>
include<trapeze.scad>

$fn=100;
gp_eye_right=55.5;
gp_eye_bot=39;
gp_eye_diam=23;
gp_eye_height=30;

tpu_shrink_value=0.3;

gp_x=59;//-tpu_shrink_value;
gp_y=21+tpu_shrink_value;
gp_z=41+tpu_shrink_value;

gp_case_width=2;

module gp(){
    cube([gp_x,gp_y, gp_z], center=false);
}

module gp_lens() {
    color([1,0,0])
        mv(gp_eye_right-(gp_eye_diam/2),0,gp_eye_bot-(gp_eye_diam/2)){
            rot(90,0,0){
                cylinder(h=gp_eye_height, d=gp_eye_diam, center=true);
            }
        }
}

module gp_lens_guard() {
    color([1,1,0])
        mv(gp_eye_right-(gp_eye_diam/2),-4.5,gp_eye_bot-(gp_eye_diam/2)){
            rot(90,0,0){
                dif() {
                dif() {
                    cylinder(d=gp_eye_diam+2, h=8,center=true);
                    mv(0,0,-1)
                    cylinder(d=gp_eye_diam, h=8,center=true);
                }
                cylinder(d=gp_eye_diam-5, h=9,center=true);
                }
            }
        }
}



dif() {
dif() {
union() {
    mv((gp_x+(gp_case_width/2))/-2,0,0)
        dif(){
            rot(-25,0,0)
                mv(0,-4.5,9){
                dif(){

                    mv(gp_case_width/-2,gp_case_width/-2,gp_case_width/-2)
                        cube([gp_x+gp_case_width,gp_y+gp_case_width, gp_z+gp_case_width], center=false);
                    union() {
                        gp_lens();
                        gp();
                    }
                }
                gp_lens_guard();
                }
            rot(-25,0,0)
                mv(-50,-2.8,13)
                scale([2,0.8,0.8])
                gp();
        }

    mv((gp_x+gp_case_width)/-2-.5,-3,0)
        cube([gp_x+gp_case_width,22,2]);

    rot(-10,0,0)
        mv((gp_x+gp_case_width)/-2-.5,-3,0)
        cube([gp_x+gp_case_width,gp_case_width,10]);
}

union() {
    mirx() {
        mv(29/2,4,0)
            cylinder(h=5,d=2.9, center=true);
    }
    mirx() {
        mv(29/2,4,25)
            cylinder(h=40,d=5.3, center=true);
    }
}
}

rot(-25,0,0)
mv(-27.5,-6,30.5)
#cube([12,4,15]);
}

