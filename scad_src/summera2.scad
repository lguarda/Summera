include<utils.scad>


x_body=38;
y_spacement=20/2+inch_mm(3/2);
x_spacement=(x_body+12)/2+inch_mm(3/2);

z_size=6;

module prop3(){
    cylinder(h=3,d=inch_mm(3));
}


module motor_hole() {
    rot(0,0,40)
    mirrot(0,0,90)
    mirx()
    mv(12/2,0,0){
    cylinder(d=2.05,h=100, center=true, $fn=50);
        mv(0,0,3.85)
    cylinder(d=4,h=100, $fn=50);
    }
}

module motors_holes() {
    mym(y_spacement)
        mxm(x_spacement)
        motor_hole();
}

module motor_holder() {
    cylinder(d=22,h=z_size, $fn=50);
}

module motors_holder() {
    mym(y_spacement)
        mxm(x_spacement)
        motor_holder();
}

inner_angle=30.85;
inner_size=79.4;
module arms() {
    mym(y_spacement+9)
    hull()
    mxm(x_spacement)
    cylinder(h=z_size, d=4);

    mirx()
        hull() {
            mv(cos(inner_angle)*inner_size, sin(inner_angle)*inner_size, 0){
                cylinder(h=z_size, d=4);
            }
            mv(cos(inner_angle)*-inner_size, sin(inner_angle)*-inner_size, 0){
                cylinder(h=z_size, d=4);
            }
        }
}


module mounting_hole() {
    mym(30/2)
    mxm(30/2)
    cylinder(h=100,d=5, center=true, $fn=30);
}

/*mounting_hole();*/

color([1,0,0])
mv(0,0,10) {


dif() {
union() {
motors_holder();
arms();
}
motors_holes();
}
}

mym(y_spacement)
mxm(x_spacement)
%prop3();

/*dif() {*/
/*cube([40,140,3], center=true);*/
/*arms();*/
/*}*/
