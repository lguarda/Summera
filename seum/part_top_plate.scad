include <BOSL2/std.scad>

module part_top_plate(h = 3, center = true)
{
    translate([ 0, 0, center ? 0 : h / 2 ])
    {
        cuboid([ 150, 50, h ], rounding = 4, except = [ [ 1, 1, 1, 1 ], [ 1, 1, 1, 1 ], [ 0, 0, 0, 0 ] ]);
    }
}

part_top_plate();
