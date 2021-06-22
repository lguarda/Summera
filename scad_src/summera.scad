include<utils.scad>
include<hexagone.scad>
include<parametric_curve.scad>

/*rot(0,0,90)*/
/*mv(-22-(156/2),-40-(119/2),-20)*/
/*import("/home/leo/Downloads/164_Bottom_Frame.stl");*/
/*rot(90,0,0)*/
/*import("/home/p1-leo/Downloads/Bottom_Plate_v_1.1.3inch.stl");*/
/*mv(0,0,20)*/
/*cube([6, 200, 9]);*/
/*PART="motor_holder";*/
/*PART="motor_holder";*/
$fn=10;

arm_length = 60;
arm_width = 3;
arm_height = 10;
delta = 10;

/*function exp_curv(step, starting_val, threshold, exp_value) =*/
    /*[*/
    /*for (i=[0:step])*/
        /*i > threshold*/
            /*? starting_val * pow(exp_value, (i-threshold))*/
            /*: starting_val*/
    /*];*/

/*echo(exp_curv(6, 3/2, 4, 1.4));*/

module drone_side_arm(height, length, delta, width, motor_angle) {
    p1=[-length/2, 0, height-motor_angle, 3];
    p2=[0, delta, height, 3/2];
    p3=[length/2, 0, height-motor_angle, 3/1.3];

    p4=[-length/2, 0, 0, 3];
    p5=[0, delta, 0, 3/2];
    p6=[length/2, 0, 0, 3/1.3];
    step=20;

    polycyle_multi([bezier_list([p1, p2, p3], step), bezier_list([p4, p5, p6], step)]);
}

module drone_arm(height, length, delta, width, motor_angle) {
    mv(0,0,-height/2) {
        mv(0,delta/2,0) {
            drone_side_arm(height, length-4, delta, width, motor_angle);
        }
        mv(0,delta/-1.5,0) {
            drone_side_arm(height, length+4, -delta-4, width, motor_angle);
        }
        drone_side_arm(height, length, 0, width, motor_angle);
    }
}

motor_separation_short = 98;
motor_separation_long = 130;
/*mirrot(0,0,90)*/
/*mirx()*/
/*mv(arm_length/2+20, 0, 0) {*/
module full_arm(dir) {
    dif() {
        union() {
            part("arms") {
                mv(-4,0,arm_height/2) {
                    mirror([0,dir,0]){
                        drone_arm(arm_height, arm_length, delta, arm_width, 4);
                    }
                }
            }

            part("motor_holder") {
                mv(arm_length/2, 0, 0) {
                    cylinder(d=22,h=6, $fn=50);
                    /*mv(0,0,-3)*/
                    /*cylinder(d=18,h=10, $fn=50);*/
                }
            }
        }
        union() {
            mv(arm_length/2, 0, 0){
                mirrot(0,0,90){
                    mirx(){
                        mv(12/2,0,0){
                            cylinder(d=2.05,h=100, center=true, $fn=50);
                            mv(0,0,3.85)
                            cylinder(d=4,h=100, $fn=50);
                        }
                    }
                }
            }
        }
    }
}

arm_angle = 72;

module four_arm() {
    mv(motor_separation_short/2, motor_separation_long/2, 0) {
        rot(0,0,arm_angle)
            mv(-(arm_length/2),0,0)
            full_arm(1);
    }

    mv(motor_separation_short/2, -motor_separation_long/2, 0) {
        rot(0,0,-arm_angle)
            mv(-(arm_length/2),0,0)
            full_arm(0);
    }

    mv(-motor_separation_short/2, motor_separation_long/2, 0) {
        rot(0,0,180-arm_angle)
            mv(-(arm_length/2),0,0)
            full_arm(0);
    }

    mv(-motor_separation_short/2, -motor_separation_long/2, 0) {
        rot(0,0,-(180-arm_angle))
            mv(-(arm_length/2),0,0)
            full_arm(1);
    }
}

module plate_hole(d) {
    miry()
        mv(0,d/2,0) {
            cylinder(h=50, d=3, center=true, $fn=50);
            mv(0,0,plate_height-3)
                cylinder(d=5.40,h=50, $fn=50);
        }
}
plate_hole_dist = 28;
plate_height = 5;
plate_length = 120;
dif() {
    union() {
        four_arm();
        mv(0,0,plate_height/2) {
            /*dif(){*/
            cube([plate_length, 38, plate_height], center=true);
            /*scale([0.5,0.5,0.5])*/
            /*mv(-43,-5,0)*/
            /*linear_extrude(height=99, center=true) {*/
            /*font = "Revamped";*/
            /*text("S u m e r a", font=font, center=true);*/
            /*}*/
            /*}*/
        }
    }
    union() {
        mv(plate_length/2-4.5,0,0)
            plate_hole(plate_hole_dist);
        mv(plate_length/-2+4.5,0,0)
            plate_hole(plate_hole_dist);
        mv(plate_length/2-4.5-28,0,0)
            plate_hole(plate_hole_dist);
        mv(plate_length/-2+4.5+28,0,0)
            plate_hole(plate_hole_dist);
        mv(30/2-3/2,0,0)
        plate_hole(30);
        mv(30/-2+3/2,0,0)
        plate_hole(30);
    }
}




/*}*/

/*module plot_example_curve() {*/
    /*p1=[20, 0, 20, 1];*/
    /*p2=[0, 0, 0, 2];*/
    /*p3=[0, -50, 0, 1];*/
    /*p4=[-20, -40, 0, 1];*/
    /*step=50;*/
    /*polyline(bezier_list([p1, p2, p3, p4], step));*/
/*}*/

/*plot_example_curve();*/
