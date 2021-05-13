include<utils.scad>
include<hexagone.scad>
include<trapeze.scad>

stick_diam=8;
extender_width=3;
extender_height=25;

fid() {
    cylinder(h=extender_height+2, d1=stick_diam, d2=stick_diam-0.4, $fn=100, center=true);
    cylinder(h=extender_height, d=stick_diam+extender_width, $fn=100, center=true);
}

scale_size=2.7;
mv(0,0,extender_height/2)
scale([scale_size,scale_size,scale_size])
rotate_extrude($fn=200) polygon( points=[[0,0],[2,0],[1,2],[1,3],[1.5,5],[0,5]] );


for ( i = [0 : 10] ){
    rot(0,0,360/10 * i)
    mv(0,2.6,25.6)
    rot(90,0,0)
    trapeze(1, 0.0001, 2, stick_diam/6);
}
