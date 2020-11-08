include<utils.scad>
include<hexagone.scad>


$fn=100;

outside_diam=10;
inside_diam=5+2;
height=50;


screw_hole=5;

/*dif(){*/
/*dif() {*/
/*cylinder(h=height, d=inside_diam+outside_diam, center=true);*/
/*cylinder(h=height+1, d=inside_diam, center=true);*/
/*}*/

/*mv(0,outside_diam,0)*/
/*rot(0,0,90)*/
/*cube([outside_diam*2, 150,height+1], center=true);*/
/*}*/

/*mv(outside_diam/2+1,outside_diam/2,0)*/
/*cube([outside_diam/2, 10,height], center=true);*/

/*dif(){*/
/*mv(outside_diam/2+1,outside_diam,0)*/
/*cube([5,25,10], center=true);*/


/*mv(0,13,0)*/
/*rot(0,90,0)*/
/*cylinder(h=100,d=screw_hole);*/
/*}*/


diam=20;

fid(){
mv(109,0,0)
cylinder(d=screw_hole,h=100, center=true);
mv(100+4,0,3/2)
cube([20,10,3], center=true);
}

mv(0,0,10)
rot(0,0,-45/2)
rotate_extrude(angle = 45, convexity = 10)
mv(100,0,0)
rot(0,0,-90)
fid() {
    mv(-diam/2,0,0)
        square([diam,diam/2]);
    dif() {
        circle(d=diam);
        circle(d=14);
    }
}
