//import("/home/leo/Downloads/2.5mm_BottomPlate.dxf")
include <BOSL2/nurbs.scad>
include <BOSL2/std.scad>
use <Aremus/utils.scad>
use <motor_base.scad>
use <props3.scad>
use <esc.scad>

front_pts = [[inch_mm(3) + 8, -inch_mm(3)], [20 + 8, 0], [inch_mm(3) + 7, inch_mm(3)]];

// half arm curv version
middle_pts = [ [ 0, 3 ], [ 28, 0 ], [ inch_mm(3), inch_mm(3) ] ];
side_pts = [ [ 0, 15 ], [ 30, 20 ], [ inch_mm(3) - 4, inch_mm(3) + 5 ] ];

// full arm  curve version
middle_pts2 = [ [ inch_mm(3), inch_mm(3) ],
    [ 28, 0 ],
    [ 0, 7 ],
    [ -28, 0 ],
    [ -inch_mm(3), inch_mm(3) ],
    ];

side_pts2 = [ [ inch_mm(3) - 4, inch_mm(3) + 5 ],
    [ 30, 20 ],
    [ 0, 15 ],
    [ -30, 20 ],
    [ -inch_mm(3) + 4, inch_mm(3) + 5 ],
];

module debug_arms()
{
    debug_nurbs(middle_pts, 2);
    debug_nurbs(side_pts, 2);
    debug_nurbs(front_pts, 2);
}

module dummy_curve_to_cylinder(curve, h=4, d=3)
{
    for (i = [0:1:len(curve) - 2])
    {
        hull()
        {
            translate(curve[i]) cylinder(h = h, d = d, $fn=4);
            translate(curve[i + 1]) cylinder(h = h, d = d, $fn=4);
        }
    }
}

module arms(h = 4, d = 3, step = 20)
{
    midle_arms_curve = nurbs_curve(middle_pts, 2, step);
    mirx() miry() dummy_curve_to_cylinder(midle_arms_curve, h, d);

    side_arms_curve = nurbs_curve(side_pts, 2, step);
    mirx() miry() dummy_curve_to_cylinder(side_arms_curve, h, d);

    front_arms_curve = nurbs_curve(front_pts, 2, step);
    mirx() dummy_curve_to_cylinder(front_arms_curve, h, d);
}


module arms2(h = 4, d = 3, step = 20)
{
    midle_arms_curve = nurbs_curve(middle_pts2, 2, step);
    miry() dummy_curve_to_cylinder(midle_arms_curve, h, d);

    side_arms_curve = nurbs_curve(side_pts2, 2, step);
    miry() dummy_curve_to_cylinder(side_arms_curve, h, d);

    front_arms_curve = nurbs_curve(front_pts, 2, step);
    mirx() dummy_curve_to_cylinder(front_arms_curve, h, d);
}

arms2();
//debug_arms();
// Motor preview
mxm(inch_mm(3)) mym(-inch_mm(3)) zrot(-20) motor_base(13, 1.2, 70);
