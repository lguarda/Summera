include <Aremus/utils.scad>
include <BOSL2/gears.scad>
include <BOSL2/std.scad>

GEAR=true;
INNER_FRAME=true;
FRAME=true;

/* [Hidden] */
$fn = 12;
n1 = 11; // red gear number of teeth
n5 = 9;  // gray rack
n6 = 9;  // blue rack


circ_pitch = 9; // all meshing gears need the same `circ_pitch` (and the same `pressure_angle`)
thickness = 4;
hole = 3;
rack_base = 12;
d1r = gear_dist(circ_pitch = circ_pitch, teeth1 = n1, teeth2 = 0);
time = $t * 3;
a1 = time * 360 / n1;

gear_bearing_diam = 12;
// PART_ONLY=true;
// PART="FRAME";

color("#f77") part("GEAR", GEAR)
{
    // zrot(70)
    zrot(-6.6) zrot(a1) spur_gear(circ_pitch, n1, thickness, hole, hide = 8);
    cylinder(center = true, h = thickness, r = 13, $fn = 100);
    mz(3)
    {
        dif()
        {
            cylinder(center = true, h = thickness, d = gear_bearing_diam, $fn = 100);
            kube(4, 4, thickness + 1);
        }
    }
}

color("#77f") part("INNER_FRAME", INNER_FRAME)
{
    fwd(d1r) // right(circ_pitch*time)
        rack(pitch = circ_pitch, teeth = n5, thickness = thickness, width = rack_base, anchor = CENTER, orient = BACK);
    back(d1r) // right(circ_pitch*time)
        rack(pitch = circ_pitch, teeth = n5, thickness = thickness, width = rack_base, anchor = CENTER, orient = FRONT);

    x = 5;
    y = (d1r + circ_pitch) * 2;
    z = thickness;

    mxm((n5 * circ_pitch) / 2) kube(x, y, z);
}

frame_clearance = 0.9;
color([ 1, 1, 1, 0.4 ])
    // right(circ_pitch*time)
    part("FRAME", FRAME)
{
    x = n5 * circ_pitch + frame_clearance;
    y = (d1r + circ_pitch) * 2 + frame_clearance;
    z = thickness + frame_clearance;
    dif()
    {
        kube(x + 5, y + 5, z + 5);
        union()
        {
            kube(x + 1000, y, z);
            mv(22, 0, 5) kube((n5 * circ_pitch + gear_bearing_diam) / 2, gear_bearing_diam + 0.5, 10);
            mz(3) cylinder(center = true, h = thickness, d = gear_bearing_diam + 0.5, $fn = 100);
        }
    }
}
