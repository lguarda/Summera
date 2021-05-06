include<utils.scad>
include<hexagone.scad>

$fn=30;

diam=19;
height=30;

screw_hole=4;
screw_dist=17;
screw_dist_cyl=11;


module hole(screw_dist) {
mv(0,-screw_dist_cyl,screw_dist/2)
rot(0,90,0)
cylinder(d=4, h=100, center=true);
}

fid() {
rot(90,0,0)
dif() {
    union() {
        dif() {
            union() {
                mv(diam/4,0,0)
                    cube([diam/2,diam*1.2,height], center=true);
                cylinder(h=height+1, d=diam*1.2, center = true);
            }

            union() {
                mv(diam/4,0,0)
                    cube([diam/2,diam,height+1], center=true);
                mv(diam/2,0,0)
                    cube([diam/2,diam,height+1], center=true);
                cylinder(h=height+1, d=diam, center = true);
            }
        }

        mv(0,-diam,0)
            cube([diam, diam, height], center=true);
    }

    union() {
        hole(screw_dist);
        hole(-screw_dist);
    }
}


/*mv(-diam,0,0)*/
/*rot(0,0,90)*/
/*cube([24,8,37], center=true);*/


nuts_diam=5.5;
nuts_height=2.4;
plate_lenght=60;

/*rot(0,0,90)Hexagone(cle=nuts_diam,h=nuts_height);*/

dif(){
mv(-diam/2-((nuts_height*4)/2),0,2) {
    rot(0,-90,0) {
        fid() {
            hull(){
                mv(25,0,00)
                    cylinder(d=3,h=100, center=true);
                mv(-20,0,00)
                    cylinder(d=3,h=100, center=true);
            }

            fid() {
                mv(25,0,0)cube([100,nuts_diam+0.5, nuts_height+1.2], center=true);
                rot(0,90,0)cube([nuts_height*4,height, plate_lenght], center=true);
            }
        }
    }
}

rot(90,0,0) {
hole(screw_dist);
hole(-screw_dist);
}
}
}
/*mv(0,0,50) {*/
/*mv(diam/4,0,0)*/
/*cube([diam/2,diam*1.3,height], center=true);*/
/*cylinder(h=height, d=diam*1.3, center = true);*/
/*}*/

/*mv(0,0,-50) {*/
/*mv(diam/4,0,0)*/
/*cube([diam/2,diam,height+1], center=true);*/
/*cylinder(h=height+1, d=diam, center = true);*/
/*}*/
