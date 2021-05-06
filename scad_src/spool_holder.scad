include<utils.scad>
include<hexagone.scad>

/*mv(-160,-120,-20)*/
/*import("/home/leo/clone/Summera/stl_save/The_Ultimate_Spool_Holder_v2.stl", center=true);*/

bearing_internal_diam=4.85;
bearing_external_diam=16;
bearing_internal_height=5+4;

roller_cylinder_diam=30;
roller_cylinder_height=3;

bearing_dist=100;

module internal_bearing() {
    mirx() {
        mv(bearing_dist/2, 0, 0) {
            cylinder(h=bearing_internal_height,d=bearing_internal_diam, center=true, $fn=50);
        }
    }
}

module roller() {
    dif() {
        hull(){
            mirx() {
                mv(bearing_dist/2, 0, 0) {
                    mv(0,0,roller_cylinder_height/2+bearing_internal_height/2)
                        cylinder(h=roller_cylinder_height,d=roller_cylinder_diam, center=true);
                }
            }
        }

        mv(0,80,roller_cylinder_height/2+bearing_internal_height/2)
            cylinder(d=80*2, h=roller_cylinder_height, center=true);
    }
}

/*dif(){*/
    /*fid() {*/
        /*union() {*/
            /*internal_bearing();*/
            /*roller();*/
        /*}*/

        /*union() {*/
            /*mv(0,0,-bearing_internal_height) {*/
                /*fid() {*/
                    /*mv(0,0,bearing_internal_height/2) {*/
                        /*internal_bearing();*/
                    /*}*/
                    /*roller();*/
                /*}*/
            /*}*/

            /*mv(0,-roller_cylinder_diam/2+2,0)*/
                /*cube([40,4,bearing_internal_height], center=true);*/
        /*}*/
    /*}*/

    /*union(){*/
        /*mv(0,-15,1)*/
            /*rot(90,0,0)*/
            /*cylinder(d=4, h=20, center=true, $fn=50);*/

        /*mirx() {*/
            /*mv(10,-roller_cylinder_diam/2+2,0) {*/
                /*cylinder(d=2, h=20, center=true, $fn=50);*/
            /*}*/
        /*}*/
    /*}*/
/*}*/

rot(0,180,0)
mv(0,0,0)
dif(){
    dif() {
        union() {
            internal_bearing();
            roller();
        }

        union() {
            mv(0,0,-bearing_internal_height) {
                fid() {
                    mv(0,0,bearing_internal_height/2) {
                        internal_bearing();
                    }
                    roller();
                }
            }

            mv(0,-roller_cylinder_diam/2+2,0)
                cube([40,4,bearing_internal_height], center=true);
        }
    }

    union(){
        mv(0,-15,1)
            rot(90,0,0)
            cylinder(d=4, h=20, center=true, $fn=50);

        mirx() {
            mv(10,-roller_cylinder_diam/2+2,0) {
                cylinder(d=2, h=20, center=true, $fn=50);
            }
        }
    }
}
