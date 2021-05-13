include<utils.scad>
include<hexagone.scad>
include<trapeze.scad>

stick_diam=8+0.2;
extender_width=3;
extender_height=25;

fid() {
    cylinder(h=extender_height+2, d1=stick_diam, d2=stick_diam-0.4, $fn=100, center=true);
    cylinder(h=extender_height, d=stick_diam+extender_width, $fn=100, center=true);
}


dif() {
scale_size=2.79;
mv(0,0,extender_height/2)
scale([scale_size,scale_size,scale_size])
rotate_extrude($fn=200) polygon( points=[[0,0],[2,0],[1,2],[1,3],[1.5,5],[0,5]] );

mv(0,0,extender_height/2+1.5)
    cylinder(h=3, d1=stick_diam, d2=0, $fn=100, center=true);
}


for ( i = [0 : 16] ){
    rot(0,0,360/16 * i)
    mv(0,2.6,25.6)
    rot(64,0,0)
    trapeze(1, 0.0001, 2, stick_diam/6);
}
