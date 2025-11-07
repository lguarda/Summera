include <BOSL2/nurbs.scad>
include <BOSL2/std.scad>
use <Aremus/utils.scad>

// motor_diameter=19;
// cylinder(h=1, d=motor_diameter);
//
// dist=20;
// degree=30;
// move([sin(degree)*dist,cos(degree)*dist,0])
// cylinder(h=1, d=motor_diameter/8);
//
// degree2=60;
// move([sin(degree2)*dist,cos(degree2)*dist,0])
// cylinder(h=1, d=motor_diameter/8);

// include <BOSL2/std.scad>
// include <BOSL2/isosurface.scad>
// a=4;  b=4.1;
// f = function(x,y) (x^2+y^2)^2 - 2*a^2*(x^2-y^2) + a^4;
// contour(f,bounding_box=[[-6,-3],[6,3]], isovalue=[-INF,b^4]);

include <BOSL2/isosurface.scad>
include <BOSL2/std.scad>

module motor_base(ears_dist, ears_diam, angle) {

    new_x = cos(angle) * ears_dist;
    new_y = -sin(angle) * ears_dist;

    new_x2 = cos(160) * ears_dist;
    new_y2 = -sin(160) * ears_dist;

    spec = [
        move([ 0, 0 ]), mb_circle(8.5),
        move([ ears_dist, 0 ]), mb_circle(ears_diam / 2),
        move([ new_x, new_y ]), mb_circle(ears_diam / 2),

        move([ new_x2, new_y2 ]), mb_circle(ears_diam / 2),
        // right(8), mb_circle(5)
    ];
    metaballs2d(spec, pixel_size = 0.1, bounding_box = [ [ -100, -100 ], [ 100, 100 ] ]);
}

linear_extrude(height = 4, v = [0, 0, 1], center = true, convexity = 10, slices = 20, $fn = 16)
motor_base(13, 1.2, 70);
