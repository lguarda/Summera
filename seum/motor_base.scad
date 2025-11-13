use <Aremus/utils.scad>
include <BOSL2/isosurface.scad>
include <BOSL2/std.scad>

module motor_base(ears_dist, ears_diam, angle, h=4, center=true) {
    new_x = cos(angle) * ears_dist;
    new_y = -sin(angle) * ears_dist;
    if ($preview) {
        move([ ears_dist, 0 ])
            cylinder(h=h, d=ears_diam*4, center=center);
        move([ new_x, new_y ])
            cylinder(h=h, d=ears_diam*4, center=center);
        cylinder(h=h, d=19, center=center);

    } else {
        //new_x2 = cos(160) * ears_dist;
        //new_y2 = -sin(160) * ears_dist;

        spec = [
            move([ 0, 0 ]), mb_circle(8.5),
            move([ ears_dist, 0 ]), mb_circle(ears_diam / 2),
            move([ new_x, new_y ]), mb_circle(ears_diam / 2),

            //move([ new_x2, new_y2 ]), mb_circle(ears_diam / 2),
        ];
        linear_extrude(height = h, center = center, convexity = 1, slices = 1, $fn = 1)
        metaballs2d(spec, pixel_size = 1.5, bounding_box = [ [ -100, -100 ], [ 100, 100 ] ]);

    }
}

motor_base(13, 1.2, 70);
