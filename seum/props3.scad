include <Aremus/utils.scad>

module pieSlice(a, r, h){
  // a:angle, r:radius, h:height
  rotate_extrude(angle=a) square([r,h]);
}

module props(inch=3) {
    for ( i = [0:1:3]) {
        zrot(i * 90)
        pieSlice(40,inch_mm(inch)/2,3);
    }
}

module props_true_x(inch=3)
    mym(inch_mm(3))
    mxm(inch_mm(3)) {
        props(inch);
    }


props(3.5);
props_true_x(2);
