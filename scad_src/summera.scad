use<utils.scad>
use<hexagone.scad>
use<parametric_curve.scad>



/*rot(0,0,90)*/
/*mv(-22-(156/2),-40-(119/2),-20)*/
/*import("/home/leo/downloads/164_bottom_frame.stl");*/
/*rot(90,0,0)*/
/*import("/home/p1-leo/downloads/bottom_plate_v_1.1.3inch.stl");*/
/*mv(0,0,20)*/
/*cube([6, 200, 9]);*/
//PART_ONLY=false;
//PART="motor_mount";
//PART="arms";
/*PART="frame";*/
/*PART="gp_mal";*/
/*PART="top_frame";*/
/*PART="none";*/
$fn=10;

arm_length = 72-4;
arm_width = 10;
arm_height = 9;
arm_shift=6;
delta = 10;

frame_screw_diam = 3.15; // screw fit
frame_screw_cap_diam = 5.95; // screw fit

top_frame_height = 3;
top_frame_screw_guard_staring = 28;

plate_hole_dist = 28;
plate_height = 5;
plate_length = 120;
plate_width = 38;

module gopro_buckle_male(s=1) {
    dif() {
        rot(0,0,90)
            rez(s,s,s)
            mv(31/-2,49/-2,0)
            import("/home/leo/downloads/gp_bp011.stl");

        mv(0,0,100/2+5.5)
            cube([100,100,100], center=true);
    }
}

module gopro_buckle_male_summera() {
    dif() {
        union() {
        gopro_buckle_male(0.8);
        hull()
            miry()
            mv(-18,-28/2,0)
            cylinder(r=4,h=5.5);
        }
        miry(){
            mv(-18,-28/2,0)
                cylinder(d=2,h=12, center=true);
            mv(-16,-28/2,0) {
                mv(0,0,3.5/2)
                cylinder(d=6,h=3.5, center=true);
                mv(3,0,3.5/2)
                cube([6, 6, 3.5], center=true);
            }
        }
    }
}

module gopro_buckle_female(s=1)
dif() {
    mv(0,0,1.98)
    rot(-90,0,90)
        rez(s,s,s)
        mv(70.5/-2,23/-2,48/-2)
        import("/home/leo/downloads/gp_frh001.stl");

    mv(0,0,100/2)
        cube([100,100,100], center=true);
}

//mv(plate_length/-2-48/-2.5,0,-21) {
//    part("top_frame")
//        gopro_buckle_female(0.8);
//    mv(1,0,0)
//        rot(0,180,180)
//        part("gp_mal")
//        gopro_buckle_male_summera();
//}

module drone_side_arm(height, length, delta, width, motor_angle) {
    p1=[-length/1.9      , 0     , height             , 2     , 1];
    p2=[0                , delta , height-motor_angle , 2     , 1];
    p3=[length/2         , 0     , height             , 2     , 1];

    p4=[-(length-12)/1.9 , 0     , 0                  , 2     , 1];
    p5=[0                , delta , 0                  , 2     , 1];
    p6=[length/2         , 0     , 0                  , 2     , 1];
    step=12;

    polycyle_multi([bezier_list([p1, p2, p3], step), bezier_list([p4, p5, p6], step)]);
}

module drone_side_exter(height, length, delta, width, motor_angle) {
    p1=[-(length+8)/5*2.2 , 9  , height                 , 2     , 1];
    p2=[-length/5         , 0  , height                 , 2     , 1];
    p3=[0                 , 10 , height-motor_angle     , 2     , 1];
    p4=[length/5          , 5  , height-motor_angle/1.3 , 2     , 1];
    p5=[length/5*2        , 0  , height-motor_angle/1.3 , 2     , 1];

    p6=[-(length)/5*2.2   , 9  , 0                      , 2     , 1];
    p7=[-length/5         , 0  , 0                      , 2     , 1];
    p8=[0                 , 10 , 0                      , 2     , 1];
    p9=[length/5          , 5  , 0                      , 2     , 1];
    p10=[length/5*2       , 0  , 0                      , 2     , 1];
    step=12;

    polycyle_multi([bezier_list([p1, p2, p3, p4, p5], step), bezier_list([p6, p7, p8, p9, p10], step)]);
}

module drone_side_arm_inter(height, length, delta, width, motor_angle) {
    x_angle = -21;

    p1=[-(length+8)/5*2.7 , x_angle     , height             , 2 , 1];
    p2=[-length/5         , 25          , height             , 2 , 1];
    p3=[0                 , -34         , height-motor_angle , 2 , 1];
    p4=[length/5          , 10          , height-motor_angle , 2 , 1];
    p5=[length/5*2        , 0           , height-motor_angle , 2 , 1];

    p6=[-(length)/5*2.8   , x_angle+0.8 , 0                  , 2 , 1];
    p7=[-length/5         , 23          , 0                  , 2 , 1];
    p8=[0                 , -34         , 0                  , 2 , 1];
    p9=[length/5          , 10          , 0                  , 2 , 1];
    p10=[length/5*2       , 0           , 0                  , 2 , 1];
    step=12;

    polycyle_multi([bezier_list([p1, p2, p3, p4, p5], step), bezier_list([p6, p7, p8, p9, p10], step)]);
}

module drone_arm(height, length, delta, width, motor_angle) {
    mv(0,0,-height/2) {
        mv(0,delta/2,0) {
            drone_side_exter(height, length-4, delta, width, motor_angle);
        }
        mv(0,delta/-1.5,0) {
            drone_side_arm_inter(height, length+4, delta, width, motor_angle);
        }
        mv(0,0,0)
        drone_side_arm(height, length, 0, width, motor_angle);
    }
}

motor_separation_short = 98;
motor_separation_long = 130-8;

module motor_hole() {
    rot(0,0,-47)
        /*rot(0,0,-29)*/
        mirrot(0,0,90){
            mirx(){
                mv(12/2,0,0){
                    cylinder(d=2.05,h=100, center=true, $fn=50);
                    mv(0,0,2.80)
                        cylinder(d=4.5,h=100, $fn=50);
                }
            }
        }
    mv(0,0,-10 + 2)
    cylinder(d=4.70, h=10, $fn=50);
}


module motor_mount(unused) {
    mv(arm_length/2, 0, 0) {
        dif() {
            cylinder(d=22,h=arm_height/1.5, $fn=50);
            motor_hole();
        }
    }
}

module full_arm(dir) {
    dif() {
        mv(arm_shift,0,arm_height/2) {
            mirror([0,dir,0]){
                drone_arm(arm_height, arm_length, delta, arm_width, 4);
            }
        }
        mv(arm_length/2, 0, 0)
        motor_hole();
    }
}

arm_angle = 72.4;

module rounded_square(x,y,z,r) {
    $fn=40;
    hull()
    miry()
    mirx()
    mv(x/2-r, y/2-r, 0)
    cylinder(r=r, h=z);
}

module arm_rotation(unit) {
    mv(motor_separation_short/2, motor_separation_long/2, 0) {
        rot(0,0,arm_angle)
            mv(-(arm_length/2),0,0)
            children(0);
    }

    mv(motor_separation_short/2, -motor_separation_long/2, 0) {
        rot(0,0,-arm_angle)
            mv(-(arm_length/2),0,0)
            children(1);
    }

    mv(-motor_separation_short/2, motor_separation_long/2, 0) {
        rot(0,0,180-arm_angle)
            mv(-(arm_length/2),0,0)
            children(2);
    }

    mv(-motor_separation_short/2, -motor_separation_long/2, 0) {
        rot(0,0,-(180-arm_angle))
            mv(-(arm_length/2),0,0)
            children(3);
    }
}

module four_arm() {
    union() {
        arm_rotation() {
            full_arm(1);
            full_arm(0);
            full_arm(0);
            full_arm(1);
        }
    }
}

module four_motor_mount() {
    union() {
        arm_rotation() {
            motor_mount();
            motor_mount();
            motor_mount();
            motor_mount();
        }
    }
}

module plate_hole(d, d1, d2) {
    miry()
        mv(0,d/2,0) {
            cylinder(h=50, d=d1, center=true, $fn=50);
            mv(0,0,plate_height-3)
                cylinder(d=d2,h=50, $fn=50);
        }
}

module plate_hole_placement() {
    mv(plate_length/2-4.5,0,0)
        children(0);
    mv(plate_length/-2+4.5,0,0)
        children(1);
    mv(plate_length/2-4.5-28,0,0)
        children(2);
    mv(plate_length/-2+4.5+28,0,0)
        children(3);
}

module plate_join_hole() {
    plate_hole_placement() {
        plate_hole(plate_hole_dist, frame_screw_diam, frame_screw_cap_diam);
        plate_hole(plate_hole_dist, frame_screw_diam, frame_screw_cap_diam);
        plate_hole(plate_hole_dist, frame_screw_diam, frame_screw_cap_diam);
        plate_hole(plate_hole_dist, frame_screw_diam, frame_screw_cap_diam);
    }
}

module plate_mounting_hole() {
    mv(30/2,0,0)
        plate_hole(30, 3.5, 6);
    mv(30/-2,0,0)
        plate_hole(30, 3.5, 6);
}


// ========================start of the drone===================================
dif() {
    union() {
        part("arms") {
            four_arm();
            //dif() {
             //   four_motor_mount();
              ///  four_arm();
            //}
        }
         part("frame") {
            color([1,0,1])
            dif() {
                rounded_square(plate_length, plate_width, plate_height, 3);
                union() {
                    four_arm();
                    mirx()
                    mv(plate_length/1.6,0,0)
                    cylinder(h=20, d=plate_width, center=true, $fn=30);

                    miry()
                    mv(0,plate_width/1.05,0)
                    cylinder(h=20, d=plate_width, center=true, $fn=30);
                }
            }
        }
    }
    union() {
        plate_join_hole();
        plate_mounting_hole();
        /*scale([0.5,0.5,0.5])*/
        /*mv(-43,-5,0)*/
        /*linear_extrude(height=99, center=true) {*/
        /*font = "revamped";*/
        /*text("s u m e r a", font=font, center=true);*/
        /*}*/
    }
}

part("motor_mount") {
    dif() {
        four_motor_mount();
        four_arm();
    }
}

/*dif() {
    union() {
        mv(0,0,-21)
        part("top_frame")
            dif() {
                union() {
                    rounded_square(plate_length, plate_width, top_frame_height, 3);
                    miry()
                        mv(top_frame_screw_guard_staring,10,2/-2)
                        cube([plate_length-top_frame_screw_guard_staring, 2, 2], center=true);
                }
                union() {

                    //front back notch
                    mirx()
                    mv(plate_length/1.6,0,0)
                    cylinder(h=20, d=plate_width, center=true, $fn=30);

                    //midle left right notch
                    miry()
                    mv(0,plate_width/1.05,0)
                    cylinder(h=20, d=plate_width, center=true, $fn=30);

                    mirx()
                    miry()
                    mv(plate_length/3.8,plate_width/1.05,0)
                    cylinder(h=20, d=plate_width, center=true, $fn=30);
                }
            }
    }
    union() {
        plate_join_hole();
        sc = 0.75;
        rot(0,180,0)
        scale([sc*1.2,sc*0.8,sc])
        mv(-54,-4,0)
        linear_extrude(height=99, center=true) {
        font = "revamped";
        text("s u m e r a", font=font);
        }
    }
}*/

/*mv(100, 0, 0) {
    fid() {
        union() {
            mv(arm_shift,0,arm_height/2)
                drone_arm(arm_height, arm_length, delta, arm_width, 4);
            mv(arm_length/3, -2, 0)
                cylinder(h=100,d=22, center=true, $fn=30);
        }
        mv(arm_length/2, 0, 0)
            dif() {
                dif() {
                    cylinder(d=22+1,h=arm_height/1.5+1, $fn=50);
                    mv(0,0,1/2)
                        cylinder(d=22,h=arm_height/1.5, $fn=50);
                }
                mv(0,0,-99)
                    cylinder(d=19.5,h=100, $fn=50);
            }
    }
}*/

module fan3() {
    mv(arm_length/2,0,-20)
    cylinder(r=38,h=1, center=true);
}
module four_fan() {
    arm_rotation() {
        fan3();
        fan3();
        fan3();
        fan3();
    }
}

partno("fan") {
    four_fan();
}

partno("spacer") {
    plate_hole_placement() {
        miry()
        mv(0,plate_hole_dist/2,21/-2)
        hexagone(6,21);
        miry()
        mv(0,plate_hole_dist/2,21/-2)
        hexagone(6,21);
        miry()
        mv(0,plate_hole_dist/2,21/-2)
        hexagone(6,21);
        miry()
        mv(0,plate_hole_dist/2,21/-2)
        hexagone(6,21);
    }
}

//partno("stack") {
//    mv(-12,0,0) {
//        mv(0,0,-10)
//        #cube([42,42,20], center=true);
//            plate_mounting_hole();
//    }
//}
//partno("stack2") {
//    mv(30,0,0) {
//        mv(0,0,-10)
//        #cube([42,42,20], center=true);
//            plate_mounting_hole();
//    }
//}
