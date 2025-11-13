include <BOSL2/std.scad>
include <Aremus/utils.scad>

module bottom_plate(h = 3, w=50, l=150, center = true)
{
    translate([ 0, 0, center ? 0 : h / 2 ])
    {
        cuboid([ l, w, h ], rounding = 4, except = [ [ 1, 1, 1, 1 ], [ 1, 1, 1, 1 ], [ 0, 0, 0, 0 ] ]);
    }
}

bottom_plate();
mz(-10)
bottom_plate(h=2, w=38, l=128);
