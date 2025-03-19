include<utils.scad>
include<hexagone.scad>
include<trapeze.scad>

hexa_spacing=28;
hexa_height=30;
hexa_key=6;

antena_key=6.4;
antena_heigh=20;
antena_protlen=2.5;


module t_holder() {
    mv(0,-11,0) {
        dif() {
            rot(0,90,0) {
                fid() {
                    Hexagone(antena_key, antena_heigh+1);
                    cylinder(h=antena_heigh, d=antena_key+antena_protlen, $fn=50, center = true);
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
}

t_holder();
mv(0,-15,-antena_key/2-antena_protlen/4)
    trapeze(antena_heigh+2, hexa_spacing+11, antena_protlen/2, 21);

mv(0,11,0)
dif() {
    mv(0,0.5,-antena_key/2-antena_protlen/4)
        cube([hexa_spacing+11,11,antena_protlen/2], center=true);
    union() {
        mirx() {
            mv(hexa_spacing/2,0,0) {
                cylinder(h=100,d=5.60, center=true, $fn=40);
            }
        }
        cube([1.5,12,100], center=true);
    }
}

