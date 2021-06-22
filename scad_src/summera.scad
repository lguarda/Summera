include<utils.scad>
include<hexagone.scad>
include<parametric_curve.scad>

/*mv(-22-(156/2),-40-(119/2),-8)*/
/*import("/home/p1-leo/Downloads/164_Bottom_Frame.stl");*/
/*rot(90,0,0)*/
/*import("/home/p1-leo/Downloads/Bottom_Plate_v_1.1.3inch.stl");*/
/*mv(0,0,20)*/
/*cube([6, 200, 9]);*/

$fn=50;

module drone_arm(length, delta) {
    cube([length, 3, 9], center=true);
    p1=[-length/2, 0, 0, 1];
    p2=[0, delta, 0, 1];
    p3=[length/2, 0, 0, 1];
    step=50;
    miry() {
        mv(0,4,0) {
            linear_extrude(height=9, center=true) {
                polyline(bezier_list([p1, p2, p3], step), 3/2);
            }
        }
    }
}

drone_arm(56, 10);
