include<utils.scad>
include<hexagone.scad>
include<trapeze.scad>

hexa_spacing=28;
hexa_height=30;
hexa_key=6;

antena_key=6;
antena_heigh=20;
antena_protlen=3;

fid() {
    mirx() {
        mv(hexa_spacing/2,0,0) {
            Hexagone(hexa_key, hexa_height);
        }
    }
    union(){
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
        union() {
            mv(0,0.5,-antena_key/2-antena_protlen/4)
                cube([hexa_spacing+11,11,antena_protlen/2], center=true);

            mv(0,-15,-antena_key/2-antena_protlen/4)
                trapeze(antena_heigh+2, hexa_spacing+11, antena_protlen/2, 10);
        }
    }
}

/*rot(0,90,0)*/
/*#Hexagone(2, 28);*/
