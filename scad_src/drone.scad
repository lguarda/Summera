include<utils.scad>
include<hexagone.scad>

import("/home/leo/Downloads/164_Bottom_Frame.stl");


$fn=50;

arm_width=14;
arm_angle=144;
arm_lenght=81.5;

module arm() {
square([arm_lenght,arm_width],center=true);
mv(arm_lenght-25*2,0,0)
circle(d=25);

}


dist=arm_lenght-51.4;
agl=arm_angle-27.3;

module motor_round2() {
mv(cos(agl)*-dist,sin(agl)*dist,0)
circle(d=40);
}

module motor_round2_neg() {
    mv(15,0,0)
    square([10,10]);
}

module arm1() {
    rot(0,0,arm_angle) {
        mv(50,0,0) {
            dif() {
                union() {
                    motor_round2_neg();
                    mirror([0,1,0])
                        motor_round2_neg();
                }

                union() {
                    mirror([0,1,0])
                        motor_round2();
                    motor_round2();

                    arm();
                }
            }
            arm();
        }
    }
}

module arm2() {
    mv(0,2,0) {
        arm1();
        mirror([1,0,0])
            arm1();
    }
}

module arm4() {
    arm2();
    mirror([0,1,0]){
        arm2();
    }
}

module motor_hold1() {
        mv(cos(arm_angle)*arm_lenght,sin(arm_angle)*arm_lenght,0)
        circle(d=25);
}

module motor_hold2() {
    mv(0,2,0) {
        motor_hold1();
        mirror([1,0,0])
            motor_hold1();
    }
}
module motor_hold4() {
    motor_hold2();
    mirror([0,1,0]){
        motor_hold2();
    }
}

plate_corner_offset=3;
plate_length=120;
plate_width=38;

module quad_raw() {
    arm4();

    offset(r=plate_corner_offset)
        square([plate_width-(plate_corner_offset*2),plate_length-(plate_corner_offset*2)], center=true);
    /*motor_hold4();*/
}

/*color([0.3,0.5,0])*/
/*motor_round();*/


module round_frame_midlle() {
    dif() {
        mv(-10,0,0)
            square([30,30], center=true);
        union() {
            quad_raw();
            mv(-33,0,0)
                circle(d=28);
        }

    }
}

module round_frame_x() {
    dif() {
        mv(-plate_width/2-3,plate_length/4-1,0)
            square([10,10], center=true);

        union() {
            mv(-plate_width/2-5,plate_length/4+4.2,0)
                circle(d=10);
            quad_raw();
        }
    }
}

module trapez(base, height, top) {
    hull() {
    square([base,0.0001], center=true);
    mv(0,height,0)
    square([top,0.0001], center=true);
    }
}

module pied() {
rot(0,0,arm_angle)
mv(45,0,0)
mv(0,0,6) {
    hull() {
        cylinder(d=arm_width);
        mv(0,0,10)
            cylinder(d=arm_width*0.7);
    }
}
}

fid () {
linear_extrude(height = 1000, center=true)
mv(0,2,0)
dif(){
arm1();
rot(0,0,arm_angle)
mv(50,0,0)
mv(-5,0,0)
    rot(0,0,90) {
        mv(0,200/2+5,0)
        square([200,200], center=true);
        trapez(arm_width-5,5,(arm_width-5)/1.7);
    }

}

union() {
mv(0,2,0)
pied();
linear_extrude(height = 6)
union() {
    quad_raw();

    round_frame_midlle();
    mirror(0,1,0)
        round_frame_midlle();

    round_frame_x();
    mirror([0,1,0])
        round_frame_x();
    mirror([1,0,0])
        round_frame_x();
    mirror([0,1,0])
        mirror([1,0,0])
        round_frame_x();
}}

}


mv(0,0,2)
union() {
mv(0,2,0)
dif(){
pied();
rot(0,0,arm_angle)
mv(50,0,0)
mv(-5,0,0)
    linear_extrude(height = 1000, center=true)
    rot(0,0,90) {
        mv(0,200/2+5,0)
        square([200,200], center=true);
        trapez(arm_width-5,5,(arm_width-5)/1.7);
    }

}

mv(0,2,0)
dif(){
arm1();
rot(0,0,arm_angle)
mv(50,0,0)
mv(-5,0,0)
    rot(0,0,90) {
        mv(0,200/2+5,0)
        square([200,200], center=true);
        trapez(arm_width-5,5,(arm_width-5)/1.7);
    }

}
linear_extrude(height = 6)
mv(0,2,0)
dif(){
arm1();
rot(0,0,arm_angle)
mv(50,0,0)
mv(-5,0,0)
    rot(0,0,90) {
        mv(0,200/2+5,0)
        square([200,200], center=true);
        trapez(arm_width-5,5,(arm_width-5)/1.7);
    }

}
}
