use <Aremus/utils.scad>
use <props3.scad>
use <esc.scad>
use <fc.scad>
use <gps.scad>

mym(inch_mm(3))
mxm(inch_mm(3)) {
    props3();
}

co(1, 0, 0)
gps();
