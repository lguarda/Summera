use <Aremus/utils.scad>
use <props3.scad>
include <BOSL2/std.scad>
include <BOSL2/nurbs.scad>

//props_true_x();

//include <BOSL2/std.scad>
//include <BOSL2/nurbs.scad>
//patch = [
//    [[-50, 50,  0], [-16, 50,  20], [ 16, 50,  20], [50, 50,  0]],
//    [[-50, 16, 20], [-16, 16,  40], [ 16, 16,  40], [50, 16, 20]],
//    [[-50,-16, 20], [-16,-16,  40], [ 16,-16,  40], [50,-16, 20]],
//    [[-50,-50,  0], [-16,-50,  20], [ 16,-50,  20], [50,-50,  0]],
//];
//pts = nurbs_patch_points(patch, 3, splinesteps=5);
//move_copies(flatten(pts)) sphere(r=2,$fn=16);

mxm(inch_mm(3))
mym(inch_mm(3))
cylinder(h=1, d=19);

pts = [[0,0],[30,0],[inch_mm(3),inch_mm(3)]];

mirx()
miry()
debug_nurbs(pts,2);

pts2 = [[inch_mm(3),-inch_mm(3)],[20,0],[inch_mm(3),inch_mm(3)]];
mx(8)
debug_nurbs(pts2,2);
//curve = nurbs_curve(pts2, 2, 100);
//for(i = [0 : 1 : 99]) {
//    hull() {
//        move(curve[i])
//        cylinder(h=10, r=1);
//        move(curve[i+1])
//        cylinder(h=10, r=1);
//    }
//}
