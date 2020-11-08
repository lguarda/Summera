include<utils.scad>
include<hexagone.scad>


d1=32;
d2=29;


dif() {
    cylinder(d=d1, h=10,center=true);
    mv((d1-d2)/2+0.15,0,0)
    cylinder(d=d2, h=13,center=true);
}
