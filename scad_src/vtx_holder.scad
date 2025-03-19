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
//rot(26,0,0) {
{
    prot_cylinder();
    mv(0,-3,antena_cylinder_stiffness/-2)
        trapeze(antena_heigh+2, hexa_spacing+11, antena_protlen/2, 10);
}

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
