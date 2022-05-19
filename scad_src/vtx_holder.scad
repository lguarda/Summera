include<utils.scad>
include<hexagone.scad>
include<trapeze.scad>

hexa_spacing=28;
hexa_height=30;
hexa_key=6;

antena_key=6;
antena_heigh=20;
antena_protlen=3;
antena_protdist=12;
antena_cylinder_stiffness=antena_key+3;

/*fid() {*/
    /*mirx() {*/
        /*mv(hexa_spacing/2,0,0) {*/
            /*Hexagone(hexa_key, hexa_height);*/
        /*}*/
    /*}*/
    /*union(){*/
        /*mv(0,-antena_protdist,0) {*/
            /*dif() {*/
                /*rot(0,90,0) {*/
                    /*fid() {*/
                        /*Hexagone(antena_key, antena_heigh+1);*/
                        /*cylinder(h=antena_heigh, d=antena_key+antena_protlen, $fn=50, center = true);*/
                    /*}*/
                /*}*/
                /*union() {*/
                    /*rot(-20,0,0)*/
                        /*mv(antena_heigh/2.4,(antena_key+antena_protlen)/2,0)*/
                        /*cube([antena_heigh,antena_key,antena_key*2], center=true);*/
                    /*mv(0,3,0)*/
                        /*rot(0,90,90)*/
                        /*Hexagone(6,5);*/
                /*}*/
            /*}*/

        /*}*/
        /*union() {*/
            /*mv(0,0.5,-antena_key/2-antena_protlen/4)*/
                /*cube([hexa_spacing+11,11,antena_protlen/2], center=true);*/

            /*mv(0,-antena_protdist-4,-antena_key/2-antena_protlen/4)*/
                /*trapeze(antena_heigh+2, hexa_spacing+11, antena_protlen/2, 10);*/
        /*}*/
    /*}*/
/*}*/

module prot_cylinder() {
    dif() {
        rot(0,90,0) {
            fid() {
                Hexagone(antena_key, antena_heigh+1);
                cylinder(h=antena_heigh, d=antena_cylinder_stiffness, $fn=50, center = true);
            }
        }
        union() {
            rot(-20,0,0)
                mv(antena_heigh/2.4,(antena_key+antena_protlen)/2,0)
                cube([antena_heigh,antena_key,antena_key*2], center=true);
            mv(0,3,0)
                rot(0,90,90)
                Hexagone(6,5);
        }
    }
}

mv(0,-antena_protdist-10/2, 1.05)
rot(26,0,0) {
    prot_cylinder();
    mv(0,-3,antena_cylinder_stiffness/-2)
        trapeze(antena_heigh+2, hexa_spacing+11, antena_protlen/2, 10);
}

/*cube([hexa_spacing+11,5.60+3,antena_protlen/2], center=true);*/
/*mv(0,antena_protdist/-2,0)*/
/*cube([hexa_spacing+11,-antena_protdist,antena_protlen/2], center=true);*/
dif() {
    union() {
        cube([hexa_spacing+11,5.60+3,antena_protlen/2], center=true);
        mv(0,(5.60+3)/-2,0)
            cube([hexa_spacing+11,antena_protdist,antena_protlen/2], center=true);
    }
    mirx()
        mv(hexa_spacing/2,0,0)
        cylinder(h=100, d=5.60, center=true, $fn=40);
}

/*vtx_holder_depth=2;*/
/*vtx_holder_diam=6;//? pas sur*/
/*vtx_holder_width=hexa_spacing;*/
/*vtx_holder_arm_multiplyer=1.5;*/

/*mv(0,0,10)*/
/*fid() {*/
    /*mirx() {*/
        /*mv(hexa_spacing/2,0,0) {*/
            /*Hexagone(hexa_key+0.1, hexa_height);*/
        /*}*/
    /*}*/

    /*union() {*/
        /*mirx() {*/
            /*mv(hexa_spacing/2,0,0) {*/
                /*Hexagone((hexa_key*vtx_holder_arm_multiplyer)+0.1, vtx_holder_diam*vtx_holder_arm_multiplyer);*/
            /*}*/
        /*}*/
        /*dif() {*/
            /*cube([vtx_holder_width, vtx_holder_depth, vtx_holder_diam*vtx_holder_arm_multiplyer], center=true);*/
            /*rot(90,0,0)*/
                /*cylinder(h=10,d=vtx_holder_diam, center=true);*/
        /*}*/
    /*}*/
/*}*/

/*rot(0,90,0)*/
/*#Hexagone(2, 28);*/
