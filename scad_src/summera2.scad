include<utils.scad>

module prop3(){
    cylinder(h=3,d=inch_mm(3));
}

x_body=38;
y_spacement=20/2+inch_mm(3/2);
x_spacement=(x_body+12)/2+inch_mm(3/2);

mym(y_spacement)
mxm(x_spacement)
prop3();

module arms() {
    mym(y_spacement)
    hull()
    mxm(x_spacement)
    cylinder(h=8, d=4);

    mirx()
    hull() {
    mv(-x_spacement, y_spacement-4, 0)
    cylinder(h=8, d=4);
    mv(x_spacement, -y_spacement+4, 0)
    cylinder(h=8, d=4);
    }
}

module mounting_hole() {
    mym(30/2)
    mxm(30/2)
    cylinder(h=100,d=2, center=true, $fn=30);
}

mounting_hole();

color([1,0,0])
mv(0,0,10)
arms();

dif() {
cube([40,140,3], center=true);
arms();
}
