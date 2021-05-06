include<utils.scad>
include<hexagone.scad>
include<trapeze.scad>

alu_width=20;
screw_diam=3;
screw_head_diam=5.3;

dif() {
    union() {
        fid(){
            cube([alu_width+0.1,alu_width+0.1,alu_width+0.1], center=true);
            rot(-90,0,0)
                mv(0,alu_width/-2,0)
                trapeze(alu_width*2, alu_width, alu_width, alu_width);
        }

        mv(0,0,alu_width/2+alu_width/6)
            cube([alu_width*2, alu_width,alu_width/3], center=true);
    }

    union() {
        $rot(0,90,0) {
            cylinder(h=100, d=screw_diam, $fn=50, center=true);
        }
        mirx() {
            mv(alu_width+3,0,0)
                cube([alu_width, alu_width-4, alu_width], center=true);
        }
        $mirx() {
            mv(alu_width/2+2.2,0,0)
                cube([2, 100, 3.1], center=true);
        }
        cylinder($fn=50,d=3, h=100, center=true);
    }
}

