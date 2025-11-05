include <Aremus/utils.scad>

module pieSlice(a, r, h){
  // a:angle, r:radius, h:height
  rotate_extrude(angle=a) square([r,h]);
}

module props3() {
    for ( i = [0:1:3]) {
        zrot(i * 90)
        pieSlice(40,inch_mm(3)/2,3);
    }
}

props3();
